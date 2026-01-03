---
title: The best html form dsl
date: 2026-01-01
tags: [database, ruby]
---

## Inspiration

I see so many form builders. They have a custom way of storing the fields and field values and field types.
And when you go from static html mockups to python, you have to convert to a new format.
And when you go from django to react, you have to convert to a new format.

Or the forms are stored in table "forms", "fields", "field values". So to save/construct the value you have to hit many tables with often a query per field.

Or they are stored in json and there are tons of debates on the best way to represent the layout

## Observation

What if you just used html as your format?
I had a prototype in 2008 that read an html form and displayed it using Flash. It treated html as the language to describe the app. Relied upon xhtml at the time. Yes, unfortunatly, we were using soap too.

## Reaction

Store the data in a blob. I don't think people really leverage the relational aspect of the database - research more.
You still have validation going it. Maybe state that it can't be hierarchical. If you used json as the input, you'd validate that. same thing. You would not allow any class, only predefined ones. and not something that represents tailwind, just the same basic concepts that you were putting into json.

```html
<form>
<label>First Name<input type="text" name="first_name" size="20" maxlength="20" value="default"></label>
<label class="right">Secret Handshake<input type="password" name="first_name" pattern="[A-Za-z]{3}"></label>
</form>
```

```sql
SELECT * from form where form_id = $form_id
SELECT label, name, size, maxlength, pattern FROM fields where form_id = $form_id
```

The html building part is unchanged. It recieves structured data.
And then it creates the form using what ever format you want in your `build_dynamic_react_form()`.

## Reaction

What if you created a custom [temple](https://github.com/judofyr/temple) compiler that would take a standard html form and would then modify it in a standard way so your forms would get all the classes and the like?
It would happen once at load time rather than the helpers that run special code on every access.
You would not need. You could also output static dropdowns (as mentioned before). But this ends up in the compiled code not the runtime code. (just like jsps compile the code to executable java code, and erbs convert the file to executable ruby code, temple converts the file to executable ruby code.

## Reaction

I guess I really like the ideas introduced by Crystal which distinguish the difference between something that happens at compile/load time and something that happens at runtime. Ruby seems to blur these concepts with the open classes.
