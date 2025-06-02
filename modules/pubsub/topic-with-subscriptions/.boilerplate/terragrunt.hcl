terraform {
  source = "https://github.com/LeonardoDG2084/env0.git//modules/pubsub/topic-with-subscription"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}


inputs = {
   topic_name = "{{.topic_name}}"
}
