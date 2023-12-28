terraform {
  required_version = ">= 1.6.6"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.23.0"
    }
  }
}

/* if you're going to create the resource out of your home region
provider "oci" {  
  alias            = "oci-gru"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region_gru
}*/