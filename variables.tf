variable "access_type" {
  type    = string
  default = "NoPublicAccess"
}

variable "auto_tiering" {
  type    = string
  default = "Disabled"
}

variable "compartment_id" {
  type = string
}

variable "defined_tags" {
  type    = map(string)
  default = null
}

variable "freeform_tags" {
  type    = map(string)
  default = null
}

variable "kms_key_id" {
  type    = string
  default = null
}

variable "metadata" {
  type    = string
  default = null
}

variable "name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "object_events_enabled" {
  type    = bool
  default = false
}

variable "retention_rules" {
  type = object({
    display_name = string
    duration = optional(object({
      time_amount = number
      time_unit   = string
    }))
    time_rule_locked = optional(string)
  })
  default = null
}

variable "storage_tier" {
  type    = string
  default = null
}

variable "versioning" {
  type    = string
  default = null
}

variable "azure_ad_groups" {
  type    = list(string)
  default = null
}

variable "compartment" {
  type    = string
  default = null
}

variable "enable_group_access" {
  type    = bool
  default = true
}