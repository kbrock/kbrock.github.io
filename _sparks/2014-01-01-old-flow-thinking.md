---
date: 2014-01-01
note: Historical - superseded by sparks model (2026-01-01)
---

## Original flow diagram (2014)

```
load -> view -> edit
load -> new -> edit -> store
view -> new

inspiration -> ideas -> understand -> coding (writing it down)
coding -> edit -> catalog -> save -> load -> view
```

## Phases identified

| phase     | location | aliases        | examples                                        |
| --------- | -------- | -------------- | ----------------------------------------------- |
| inspire   | external | learn          | surf the web                                    |
| understand| brain    | think          | talk with people, formulate idea                |
| author    | story    | new            | convert thoughts to md, gv                      |
| catalog   | story    | tag            | add meta data so we can find it                 |
| edit      | story    | iterate        | convert from idea to hypothesis to story        |
| format    | site     | css            | add icons, art, fix view helpers (not story)    |
| save      | git      | store          | move from working space to db / git             |
| load      | browser  | fetch,retrieve | form -> sockets -> db -> sockets -> html        |
| view      | browser  | present        | convert storage format to ppt,svg               |
| feedback  | browser  | comment        | like edit, but modifying tags, spelling, not content |

## Notes from 2014

story and site are in sublime. wanted to distinguish working on story from adding to infrastructure

data is story, idea, code, ...

thinks up an idea
writes outline
reformats for medium / presentation

user creates data
edits data
add metadata to data
ship data to server
store data in database

user asks for data
fetches data from database
ships data to user
user creates/edits data
