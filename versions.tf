terraform {
  required_version = ">= 1.6.6"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 5.23.0"
    }
  }
}

# if you are deploying the resource outside your home region uncomment this part of the code
/*
provider "oci" {
  alias        = "oci-gru"
  tenancy_ocid = "<your id>"
  region       = "<region name>"
}*/