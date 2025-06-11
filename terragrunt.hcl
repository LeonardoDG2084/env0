# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform/OpenTofu that provides extra tools for working with multiple modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------------------------
# GLOBAL PARAMETERS
# These variables apply to all configurations in this subfolder. These are automatically merged into the child
# `terragrunt.hcl` config via the include block.
# ---------------------------------------------------------------------------------------------------------------------


locals {
  # Automatically load account-level variables
  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))

  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract the variables we need for easy access
  project_name = local.project_vars.locals.project_name
  project_id   = local.project_vars.locals.project_id
  region       = local.region_vars.locals.region
}


# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = merge(
  local.project_vars.locals,
  local.region_vars.locals,
  local.environment_vars.locals,
)


# Configure what repos to search when you run 'terragrunt catalog'
# catalog {
#  urls = [
#    "https://github.com/LeonardoDG2084/env0.git"
#  ]
# }

terraform {
  source = "git::https://github.com/leonardodg2084/env0//modules/pubsub/topic-with-subscriptions"
}

inputs = {
  topic_name = "topico-de-teste"
  project_id = "lab-gke-349620"
  region = "us-central1"
  custom_labels = {}
  labels = {}
  pull_subscriptions = [
    {
      name = "topico-de-teste-sub"
      ack_deadline_seconds = 10
      expiration_policy = "2678400s"
      retain_acked_messages = false
      message_retention_duration = "604800s"
      enable_message_ordering = false
      enable_exactly_once_delivery = false
    }
  ]
  push_subscriptions = []
  schema = null
}