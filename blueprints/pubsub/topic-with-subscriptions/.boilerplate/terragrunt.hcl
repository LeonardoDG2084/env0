terraform {
  source = "https://github.com/acesso-io/reliability.git//terraform/blueprints/pubsub/topic-with-subscriptions?ref=SRE-10972"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

# ------------------------------------------------------------------------------------------------------------
# Required input variables
# ------------------------------------------------------------------------------------------------------------

inputs = {
   topic_name = "{{.topic_name}}"

   pull_subscriptions = [{
      name = "{{ .subscription_name }}"
   }]
   
   # ------------------------------------------------------------------------------------------------------------
   # Case the subscription is push fill the object bellow
   # ------------------------------------------------------------------------------------------------------------
   #
   #
   # pull_subscriptions = [{
   #   name = "subscription_name"
   # }]
   #
   # Custom labels
   
   custom_labels = {
     leonardo = "teste"
   }

}
