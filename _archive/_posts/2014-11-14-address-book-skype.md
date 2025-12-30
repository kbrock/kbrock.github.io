---
layout: post
title:  "Skype address book"
date:   "2014-11-14"
category: content
---

The mac address book stores many addresses per contact, whether it is an email address, a phone number, or an AIM handle. Applications like Adium use this knowledge to group the accounts across multiple messaging providers under a single contact.

The address book has been changing recently, and now has a slot for Twitter and Skype, but unfortunatly not a place for irc.

Twitter does provide the ability to match them up, but Skype does not. Luckily, people like [renesto][] provides a way to export Skype contacts by acessing the program's sqlite database.

For me, too much data was coming out. I trim down the number of fields that came out and manually added them to my contacts. Not perfect, but it only took half an hour.

I just keep the scripts in my [github bin repo][]

```bash
#!/usr/bin/env bash

SKYPE_ROOT="$HOME/Library/Application Support/Skype"
if [ $# -eq 0 ] ; then
  echo "usage skype_id [filename]" >&2
  echo "use stdout for standard out"
  echo
  echo "possibilities:"
  #TODO: use the id if there is only one?
  for x in $(cd "${SKYPE_ROOT}" ; ls */main.db) ; do
    x=${x%/main.db}
    echo "  $x"
  done

  exit 1
fi

name=$1
file=${2-stdout}

sqlite3 -batch "${SKYPE_ROOT}/${name}/main.db" <<EOF
.mode csv
.output ${file}
select skypename,pstnnumber,aliases,fullname,emails, phone_home, phone_office, province, city
from Contacts
where is_permanent=1 and coalesce(isblocked,0) <>1;
.output stdout
.exit
EOF
```

[renesto]: http://renesto.blogspot.de/2013/07/exporting-skype-chat-using-shell-script.html
[github bin repo]: https://github.com/kbrock/bin/blob/master/skype-export-contacts.sh
