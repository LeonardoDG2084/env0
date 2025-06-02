provider "google" {
  region = var.region
  project = var.project_id
}

module "google-pubsub" {
  source  = "terraform-google-modules/pubsub/google"
  version = "~> 8.2"

  project_id = var.project_id
  topic      = var.topic_name
  topic_labels = var.labels
  subscription_labels = var.labels
  pull_subscriptions = var.pull_subscriptions
  push_subscriptions = var.push_subscriptions
  grant_token_creator = false
  schema = var.schema
}
