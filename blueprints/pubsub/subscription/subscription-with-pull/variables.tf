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

variable "create_topic" {
    description = "Whether"
    default = false
}


# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "labels" {
  description = "A map of labels to assign to the topic."
  type        = map(string)
  default     = {}
}
variable "pull_subscriptions" {
  description = "A list of pull subscriptions to create for the topic."
  type = list(object({
    name                         = string,
    ack_deadline_seconds         = optional(number),
    expiration_policy            = optional(string),
    dead_letter_topic            = optional(string),
    max_delivery_attempts        = optional(number),
    retain_acked_messages        = optional(bool),
    message_retention_duration   = optional(string),
    maximum_backoff              = optional(string),
    minimum_backoff              = optional(string),
    filter                       = optional(string),
    enable_message_ordering      = optional(bool),
    service_account              = optional(string),
    enable_exactly_once_delivery = optional(bool),
  }))
}
