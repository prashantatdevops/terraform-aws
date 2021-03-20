variable "access_key" {
     description = "Access key to AWS console"
}
variable "secret_key" {
     description = "Secret key to AWS console"
}
variable "region" {
     description = "Region of AWS VPC"
}
variable "bucket_name" {
  description = "(Required) Creates a unique bucket name"
  type        = "string"
  default     = "test-vidhya-Devops-delete"
}
