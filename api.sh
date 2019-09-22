#!/bin/bash

function create_index() {
  local index=$1
  local data=$2
  curl -H "Accept: application/json" -H "Content-Type: application/json" -XPUT "$ES_URL/$index" -d"$data"
}

function refresh() {
  local index=$1
  curl -H "Accept: application/json" -H "Content-Type: application/json" -XPOST "$ES_URL/$index/_refresh"
}

function get_doc() {
  local index=$1
  local id=$2
  curl -H "Accept: application/json" -H "Content-Type: application/json" -XGET "$ES_URL/$index/_doc/$id"
}

function create_doc() {
  local index=$1
  local data=$2
  curl -H "Accept: application/json" -H "Content-Type: application/json" -XPOST "$ES_URL/$index/_doc" -d"$data"
}

function update_doc() {
  local index=$1
  local id=$2
  local data=$3
  curl -H "Accept: application/json" -H "Content-Type: application/json" -XPUT "$ES_URL/$index/_doc/$id" -d"$data"
}

function delete_doc() {
  local index=$1
  local id=$2
  curl -H "Accept: application/json" -H "Content-Type: application/json" -XDELETE "$ES_URL/$index/_doc/$id"
}

function search() {
  local index=$1
  local query=$2
  curl -H "Accept: application/json" -H "Content-Type: application/json" -XPOST "$ES_URL/$index/_search" -d"$query"
}
