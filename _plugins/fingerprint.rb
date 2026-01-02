# Fingerprint assets with content hash
#
# Configuration in _config.yml:
#   fingerprint:
#     paths:
#       - _assets/css/*.css
#       - _assets/*.svg
#
# Usage in templates:
#   {{ "/assets/css/theme.css" | fingerprint }}
#   => /assets/css/theme-a1b2c3d4.css

require 'digest'
require 'fileutils'
require 'json'

module Jekyll
  module Fingerprint
    @manifest = {}

    class << self
      attr_accessor :manifest
    end

    class Generator < Jekyll::Generator
      safe true
      priority :low

      def generate(site)
        @site = site
        @source = site.source
        Fingerprint.manifest = {}

        patterns = site.config.dig('fingerprint', 'paths') || ['_assets/**/*']

        patterns.each do |pattern|
          Dir.glob(File.join(@source, pattern)).each do |source_path|
            next if File.directory?(source_path)
            process_asset(source_path)
          end
        end

        write_manifest(site)
      end

      private

      def process_asset(source_path)
        content = File.read(source_path, mode: 'rb')
        digest = Digest::MD5.hexdigest(content)[0, 8]

        # _assets/css/theme.css => /assets/css/theme.css
        relative = source_path.sub(@source + '/', '')
        logical_path = '/' + relative.sub(/^_/, '')

        # /assets/css/theme.css => /assets/css/theme-abc123.css
        ext = File.extname(logical_path)
        fingerprinted = logical_path.sub(/#{Regexp.escape(ext)}$/, "-#{digest}#{ext}")

        Fingerprint.manifest[logical_path] = fingerprinted

        # Register static file for Jekyll to copy
        # dest_dir needs no leading slash for filesystem
        @site.static_files << FingerprintedFile.new(
          @site,
          @source,
          File.dirname(relative),
          File.basename(relative),
          File.dirname(fingerprinted).sub(/^\//, ''),
          File.basename(fingerprinted)
        )
      end

      def write_manifest(site)
        # Manifest written by hook after site is built
      end
    end

    # Write manifest after site is written
    Jekyll::Hooks.register :site, :post_write do |site|
      manifest_path = File.join(site.dest, '.manifest.json')
      File.write(manifest_path, JSON.pretty_generate(Fingerprint.manifest))
    end

    class FingerprintedFile < Jekyll::StaticFile
      def initialize(site, base, src_dir, src_name, dest_dir, dest_name)
        super(site, base, src_dir, src_name)
        @dest_dir = dest_dir
        @dest_name = dest_name
      end

      def destination(dest)
        File.join(dest, @dest_dir, @dest_name)
      end
    end

    module Filter
      def fingerprint(path)
        Fingerprint.manifest[path] || path
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::Fingerprint::Filter)
