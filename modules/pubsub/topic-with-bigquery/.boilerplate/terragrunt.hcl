terraform {
  source = "https://github.com/acesso-io/reliability.git//terraform/blueprints/pubsub/topic-with-bigquery?ref=SRE-10972"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}


inputs = {
   topic_name = "{{.topic_name}}"
   bigquery_subscriptions = [{
    name = {{ .subscription_name }}
    table = {{ .table_name }}
   }]

}
