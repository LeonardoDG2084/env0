# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "topic_name" {
  description = "The name of the topic to create."
  type        = string
}

variable "project_id" {
  description = "The ID of the project in which to create the Pub/Sub topic."
  type        = string
}

variable "region" {
  description = "The region in which to create the Pub/Sub topic."
  type        = string
}

variable "bigquery_subscriptions" {
  type = list(object({
    name                       = string,
    table                      = string,
    use_topic_schema           = optional(bool),
    use_table_schema           = optional(bool),
    write_metadata             = optional(bool),
    drop_unknown_fields        = optional(bool),
    ack_deadline_seconds       = optional(number),
    retain_acked_messages      = optional(bool),
    message_retention_duration = optional(string),
    enable_message_ordering    = optional(bool),
    expiration_policy          = optional(string),
    filter                     = optional(string),
    dead_letter_topic          = optional(string),
    max_delivery_attempts      = optional(number),
    maximum_backoff            = optional(string),
    minimum_backoff            = optional(string)
  }))
  description = "The list of the Bigquery push subscriptions."
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "labels" {
  description = "A map of labels to assign to the topic."
  type        = map(string)
  default     = {}
}

