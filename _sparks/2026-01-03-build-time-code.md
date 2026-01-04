---
title: Build Time Code
date: 2026-01-03
sparked-by: []
---
I really like the ideas introduced by Crystal which differentiates between what happens at compile time and what happens at runtime. So if you said `attr :special` it would add the getter and setter methods for the special attribute when building the file. This makes sense for ruby, too. But often when you load the class into memory, the changes are not quite the same as if it was implemented by bytes on disk.
Java has Aspect Oriented Programming, Crystal has macros, and I'm sure others have ways to modify code at load time. Ruby is so dynamic that they don't seem to have the need to distinguish. I'm wishing they did.
