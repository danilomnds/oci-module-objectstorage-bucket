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
  type    = map(string)
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

variable "groups" {
  type    = list(string)
  default = []
}

variable "compartment" {
  type    = string
  default = null
}

/* if you are not going to deploy the resource in your home region you have to uncomment this part of the code
variable "home_region" {
  description = "When policies are created using terraform you have to specify your home region"
}

variable "tenancy_ocid" {
  description = "Required for compartment tree search"  
}
variable "user_ocid" {
  description = "Terraform user"
}
variable "fingerprint" {
  description = "Terraform user fingerprint"
}
variable "private_key_path" {
  type        = string
  description = "Terraform user private_key_path"
}
*/