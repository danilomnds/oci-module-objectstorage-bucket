resource "oci_objectstorage_bucket" "bucket" {
  access_type           = var.access_type
  auto_tiering          = var.auto_tiering
  compartment_id        = var.compartment_id
  defined_tags          = local.defined_tags
  freeform_tags         = var.freeform_tags
  kms_key_id            = var.kms_key_id
  metadata              = var.metadata
  name                  = var.name
  namespace             = var.namespace
  object_events_enabled = var.object_events_enabled
  dynamic "retention_rules" {
    for_each = var.retention_rules != null ? [var.retention_rules] : []
    content {
      display_name = retention_rules.value.display_name
      dynamic "duration" {
        for_each = retention_rules.value.duration
        content {
          time_amount = duration.value.time_amount
          time_unit   = duration.value.time_unit
        }
      }
      time_rule_locked = lookup(retention_rules.value, "time_rule_locked", null)
    }
  }
  storage_tier = var.storage_tier
  versioning   = var.versioning
  lifecycle {
    ignore_changes = [
      defined_tags["create_date"]
    ]
  }
}

resource "oci_identity_policy" "bucket_policy" {
  depends_on = [oci_objectstorage_bucket.bucket]
  for_each = {
    for group in var.azure_ad_groups : group => group
    if var.enable_group_access && var.azure_ad_groups != []
  }
  compartment_id = var.compartment_id
  name           = "policy_${var.name}"
  description    = "policy para permitir acesso de leitura e escrita no bucket"
  statements = [
    "Allow group ${var.azure_ad_groups} to read buckets in compartment ${var.compartment}",
    "Allow group ${var.azure_ad_groups} to manage objects in compartment ${var.compartment}"
  ]
}
