

{% dot %}
load -> view -> edit
load -> new -> edit -> store
view -> new
{% dotend %}

{% dot %}
inspiration -> ideas -> understand -> coding (writing it down)
coding -> edit -> catalog -> save -> load -> view
{% dotend %}
There is also the transport from the various steps

{% dotend %}

|phase      |location|aliases |examples               |
+-----------+--------+--------+-----------------------+
|inspire    |external|learn   |surf the web|
|understand |brain   |think   |talk with people, formulate idea|
|author     |story   |new     |convert thoughts to md, gv|
|catalog    |story   |tag     |add meta data so we can find it|
|edit       |story   |iterate |convert from idea to hypothesis to story|
|format     |site    |css     |add icons, art, fix view helpers (not story)|
|save       |git     |store   |move from working space to db / git|
|load       |browser |fetch,retrieve| form -> sockets -> db -> sockets -> html|
|view       |browser |present |convert storage format to ppt,svg|
|feedback   |browser |comment |like edit, but tend to be modifying tags, spelling, suggestions, not content|

story and site are in sublime. wanted to distinguish working on story from adding to infrastructure

---
more notes:

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

