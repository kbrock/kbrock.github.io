---
title: Dropping rails form helpers
date: 2026-01-03
sparked-by: [the-best-html-form-dsl, build-time-code, columns-in-the-data]
---
It is very common for you to have a form, and then add css classes and a few extra divs and spans to make a form pretty. Rails uses helpers, but other languages seem to do the same.
What if you created a custom [temple](https://github.com/judofyr/temple) compiler that took `user_form.html.pretty` and would add the augmentation in a common way? This would convert the form at load time and not run all the helpers at build time.
Probably influenced by noting that a jsp just produced a Java Servlet with a bunch of print statements. Think ruby erb is the same.
