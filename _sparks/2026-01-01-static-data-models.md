---
title: Static Data Models
date: 2026-01-01
tags: [ruby, database]
---
We use code to iterate over a list of country codes or timezones when generating pages. But we haven't updated those lists in ages.
What would happen if at build time we download the values and populate a file with csv/yml/json or even pre-generated the html? Sure would be a lot less processing than iterating over a list and outputting the values, optionally adding a tag on what is selected.

```ruby
COUNTRY_HTML=%q{
<select id="country" name="country">
  <option value="can">Canada</option>
  <option value="usa">United States</option>
</select>
}

def display_country_dropdown(value)
  phrase="value=\"#{value}\""
  COUNTRY_HTML.gsub!(phrase, "#{phrase} selected=\"true\"")
end
```
