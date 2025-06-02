terraform {
  source = "https://github.com/acesso-io/reliability.git//terraform/blueprints/pubsub/subscription/subscription-with-pull?ref=SRE-10972"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}


inputs = {
   topic_name = "{{.topic_name}}"
   pull_subscriptions = [{
    name = {{ .subscription_name }}
}]
}
