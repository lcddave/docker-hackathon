# Docker's metadata gives you all the ancestors. While this is useful, you want it the other way around
# Expects the raw.metadata.json
#

require 'json'
require 'set'
image_id_to_children = {}

STDIN.each_line { |line|
 data = JSON.parse(line)
 child_id = data["Id"]
 parent_id = data["Parent"]
 image_id_to_children[parent_id] ||= Set.new
 image_id_to_children[parent_id].add(child_id) # upsert
}

image_id_to_children.each { |image_id, child_ids|
  puts ({"image_id" => image_id, "child_ids" => Array(child_ids)}.to_json)
}
