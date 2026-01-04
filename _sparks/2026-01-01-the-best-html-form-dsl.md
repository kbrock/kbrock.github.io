---
title: The best html form dsl
date: 2026-01-01
tags: [database, ruby]
---
We converted a product from jQuery to Angular to React, so we came up with a special json scheme for the forms. Custom form builders like SurveyMonkey also do the same. Lots of them store in a few relational tables: `forms`, `form_fields`, `form_values`, and more.

I really like the idea of storing xhtml in a blob:

```html
<form>
<label>First Name<input type="text" name="first_name" size="20" maxlength="20" value="default"></label>
<label class="right">Secret Handshake<input type="password" name="first_name" pattern="[A-Za-z]{3}"></label>
</form>
```

In 2008, I used Flash to style and display a custom form from this. The admin could use drag and drop to create this. They'd never know how it was serialized to the database. But the technical debates on features reduces to how much of the spec do we want to implement.
