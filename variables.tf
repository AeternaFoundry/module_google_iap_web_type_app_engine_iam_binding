variable "iap_web_type_app_engine_iam_bindings" {
  description = <<EOT
Map of iap_web_type_app_engine_iam_bindings, attributes below
Required:
    - app_id
    - members
    - role
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    app_id  = string
    members = set(string)
    role    = string
    project = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

