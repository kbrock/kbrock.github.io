---
title: Static Data Models
date: 2026-01-01
tags: [ruby, database]
---

## Observation

When you hit a webpage in your app, there are a lot of queries that happen.
Some are necessary e.g.: "Does this user have access to this section", but some of that data is static.
Rails is downloading the database schema.
Rails is downloading all the country names.

## Reaction

It is cool that you can handle adding a column on the fly. But does this really happen in production? Maybe for 0 downtime deployment, but >99% of companies don't really do that. They restart the server for schema changes.

## Technical Solutions

What if we just:
- use the db to update the source code instead. (documentation for both you and the code)
- use a macro to generate the static code with these values. so a build process (c, rust, java or crystal) accessed the database and populated the code at build time

Would definitely prefer not accessing the database on every compile, but for the production or CI build, maybe?

## Reaction

We download a static list of country codes or timezones over and over again. That hasn't been updated in what, 10 years?
At build time download the values and populate a csv/yml/json/html.

And we have all these for loops generating basically the same thing always. Can we just pre-generate it and search/replace the one value we want to change?

```ruby
# <select id="cars" name="cars">
#   ...
#   <option value="can">Canada</option>
#   <option value="usa">United States</option>
#   ...
# </select>
def display_country_dropdown(value)
  phrase="value=\"#{value}\""
  COUNTRY_HTML.gsub!(phrase, "#{phrase} selected=\"true\"")
end
```
