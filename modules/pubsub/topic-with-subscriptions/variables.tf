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


# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# ---------------------------------------------------------------------------------------------------------------------
variable "custom_labels" {
  description = "A map of custom labels to assign to the topic."
  type        = map(string)
  default     = {}
}

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
  default = []
}

variable "push_subscriptions" {
  description = "A list of push subscriptions to create for the topic."
  type = list(object({
    name                       = string,
    ack_deadline_seconds       = optional(number),
    push_endpoint              = optional(string),
    x-goog-version             = optional(string),
    oidc_service_account_email = optional(string),
    audience                   = optional(string),
    expiration_policy          = optional(string),
    dead_letter_topic          = optional(string),
    retain_acked_messages      = optional(bool),
    message_retention_duration = optional(string),
    max_delivery_attempts      = optional(number),
    maximum_backoff            = optional(string),
    minimum_backoff            = optional(string),
    filter                     = optional(string),
    enable_message_ordering    = optional(bool),
    no_wrapper                 = optional(bool),
    write_metadata             = optional(bool),
  }))
  default = []
}

variable "schema" {
  description = "The schema to use for the topic."
  type = object({
    name       = string
    type       = string
    definition = string
    encoding   = string
  })
  default = null
}