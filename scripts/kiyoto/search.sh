#!/bin/bash
curl -X GET -H "Content-Type: application/json" https://index.docker.io/v1/search\?q=$1 | ruby -rjson -e 'JSON.parse(STDIN.read)["results"].each {|json| puts json["name"]}'

