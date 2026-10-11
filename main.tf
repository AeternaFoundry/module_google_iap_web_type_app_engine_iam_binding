resource "google_iap_web_type_app_engine_iam_binding" "iap_web_type_app_engine_iam_bindings" {
  for_each = var.iap_web_type_app_engine_iam_bindings

  app_id  = each.value.app_id
  members = each.value.members
  role    = each.value.role
  project = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

