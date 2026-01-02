# Icon and Tag liquid tags
#
# Usage:
#   {% icon ruby %}
#   => <svg class="icon"><use href="/assets/icons-abc123.svg#icon-ruby"></use></svg>
#
#   {% tag ruby %}
#   => <a href="/tags/ruby/"><svg class="icon"><use href="/assets/icons-abc123.svg#icon-ruby"></use></svg></a>
#
#   {% tag ruby Ruby Programming %}
#   => <a href="/tags/ruby/"><svg class="icon"><use href="/assets/icons-abc123.svg#icon-ruby"></use></svg> Ruby Programming</a>

module Jekyll
  class IconTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @icon_name = markup.strip
    end

    def render(context)
      icons_path = context.registers[:site].config.dig('icons_path') || '/assets/icons.svg'
      icons_path = Fingerprint.manifest[icons_path] || icons_path if defined?(Fingerprint)
      
      %(<svg class="icon"><use href="#{icons_path}#icon-#{@icon_name}"></use></svg>)
    end
  end

  class TagLinkTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      parts = markup.strip.split(/\s+/, 2)
      @tag_name = parts[0]
      @label = parts[1] # optional
    end

    def render(context)
      site = context.registers[:site]
      
      # Get icon for this tag from _data/tags.yml
      tag_data = site.data.dig('tags', @tag_name) || {}
      icon_name = tag_data['icon'] || @tag_name
      
      icons_path = site.config.dig('icons_path') || '/assets/icons.svg'
      icons_path = Fingerprint.manifest[icons_path] || icons_path if defined?(Fingerprint)
      
      icon_html = %(<svg class="icon"><use href="#{icons_path}#icon-#{icon_name}"></use></svg>)
      label_html = @label ? " #{@label}" : ""
      
      %(<a href="/tags/#{@tag_name}/" class="tag" title="#{@tag_name}">#{icon_html}#{label_html}</a>)
    end
  end
end

Liquid::Template.register_tag('icon', Jekyll::IconTag)
Liquid::Template.register_tag('tag', Jekyll::TagLinkTag)

# Filter for use with variables: {{ "ruby" | icon }}
module Jekyll
  module IconFilter
    def icon(icon_name)
      icons_path = @context.registers[:site].config.dig('icons_path') || '/assets/icons.svg'
      icons_path = Fingerprint.manifest[icons_path] || icons_path if defined?(Fingerprint)
      
      %(<svg class="icon"><use href="#{icons_path}#icon-#{icon_name}"></use></svg>)
    end

    # {{ tag | tag_link }} or {{ tag | tag_link: "Label" }}
    def tag_link(tag_name, label = nil)
      site = @context.registers[:site]
      
      tag_data = site.data.dig('tags', tag_name) || {}
      icon_name = tag_data['icon'] || 'heart'
      
      icons_path = site.config.dig('icons_path') || '/assets/icons.svg'
      icons_path = Fingerprint.manifest[icons_path] || icons_path if defined?(Fingerprint)
      
      icon_html = %(<svg class="icon"><use href="#{icons_path}#icon-#{icon_name}"></use></svg>)
      label_html = label ? " #{label}" : ""
      
      %(<a href="/tags/#{tag_name}/" class="tag" title="#{tag_name}">#{icon_html}#{label_html}</a>)
    end
  end
end

Liquid::Template.register_filter(Jekyll::IconFilter)
