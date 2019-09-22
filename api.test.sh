#!/bin/bash

source ./api.sh

printf '\n1. Create blog\n'

create_index 'blog' '
{
  "mappings": {
    "properties": {
      "content": {"type": "text"},
      "published_at": {
        "type": "date",
        "format": "strict_date_optional_time||epoch_millis"
      },
      "tags": {"type": "text"},
      "title": {"type": "text"}
    }
  }
}'

printf '\n2. Post to blog\n'

create_doc 'blog' '
{
  "title": "Веселые котята",
  "content": "<p>Смешная история про котят<p>",
  "tags": ["котята", "смешная история"],
  "published_at": "2014-09-12T20:44:42+00:00"
}'

printf '\n3. Read from blog\n'

get_doc 'blog' '1'

printf '\n4. Refresh index\n'

refresh 'blog'

printf '\n5. Search by tags\n'

search 'blog' '
{
  "_source": ["title", "tags"],
  "filter": {
    "term": {
      "tags": "котята"
    }
  }
}'
