output "project_id" {
  value       = var.project_id
  description = "The project ID"
}

output "topic_name" {
  value       = module.google-pubsub.topic
  description = "The name of the Pub/Sub topic created"
}

output "topic_labels" {
  value       = module.google-pubsub.topic_labels
  description = "The labels of the Pub/Sub topic created"
}