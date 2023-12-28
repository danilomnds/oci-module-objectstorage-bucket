output "name" {
  value = oci_objectstorage_bucket.bucket.name
}

output "id" {
  value = oci_objectstorage_bucket.bucket.id
}

output "statements" {
  description = "statements"
  value       = [for sts in oci_objectstorage_bucket.bucket.statements : sts.statements]
}