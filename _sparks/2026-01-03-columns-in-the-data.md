---
title: Columns in the data
date: 2026-01-03
sparked-by: []
---
In a rails app, it downloads the schema on every app boot, but in production it doesn't ever change. Seems it would be nice if the developer could just run a command and it would add the attributes to the top of the models. You get the dynamic behavior in development, but don't have to pay the price in production. The models would work just like regular ruby models. Just with a bunch of attr_accessor at the top.

Yes, there is the 100% up-time examples, where the schema actually does change, but that is a <1% edge case most developers never will use.
