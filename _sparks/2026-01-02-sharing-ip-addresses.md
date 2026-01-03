---
title: Sharing IP addresses
date: 2026-01-02
---

## Inspiration

I shared my ip address with my son for our shared game of StarDew Valley.
Then I had to share a code for access.
These codes were long and we had to repeat them tons of times.
The next week my ip address had changed and we had to pass that along.
Think in this game we didn't have to share a port, but in minecraft we did.

## Observation

So it is tricky to share an ip address. Well, our router's dns is setup hand out `192.168.22.x`, so we really only need to pass 2-255. And the port is always a couple of digits. And passing passwords is a super pain having to repeat yourself multiple times

## Reaction

What if you could encode the ip address and port and possibly the password into a word or phrase?
Someone out there must have done this before. Probably created for cryptography

## Technical

### Goals:

Convert IPv4 address + port into a word or short phrase that is:
- Easy to say, remember, and type
- Unambiguous. (was that rat or cat or bat?)
- Minimal clarification needed (e.g.: "What did you say?", "How do you spell this word?", "Was that a ph of an f?")
- Can be compressed for common cases.
- Fun.

Came up with a 3 schemes so far.

1. Create a pseudo word (Later find out this is called a proquint)
2. Create a sentence. This required far too many words with my minimal dictionary
3. Create a sentence but with no dictionary on the client side.

Researching proquints and what other schemes other people have thought up.
Trying to understand different ways to increase bits per word, and reduce entropy, and the issues with following grammar. (Hope my 4th grade English teacher doesn't read this.)
