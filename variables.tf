variable "access_key" {
     description = ""
}
variable "secret_key" {
     description = ""
}
variable "region" {
     description = ""
}
variable "bucket_name" {
  description = "(Required) Creates a unique bucket name"
  type        = "string"
  default     = "test-bucket-vidhyaDevops"
}
