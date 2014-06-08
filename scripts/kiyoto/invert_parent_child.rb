# Docker's metadata gives you all the ancestors. While this is useful, you want it the other way around
# Expects the raw.metadata.json
#

require 'json'
require 'set'
image_id_to_children = {}

STDIN.each_line { |line|
 data = JSON.parse(line)
 ancestry = data["Ancestry"]
 for i in 0..(ancestry.length-2)
   child_id = ancestry[i]
   parent_id = ancestry[i+1]
   image_id_to_children[parent_id] ||= Set.new
   image_id_to_children[parent_id].add child_id
 end
}

image_id_to_children.each { |image_id, child_ids|
  puts ({"image_id" => image_id, "child_ids" => Array(child_ids)}.to_json)
}
