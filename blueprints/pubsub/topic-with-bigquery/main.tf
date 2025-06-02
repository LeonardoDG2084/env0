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
  bigquery_subscriptions = var.bigquery_subscriptions
  grant_token_creator = false
}
