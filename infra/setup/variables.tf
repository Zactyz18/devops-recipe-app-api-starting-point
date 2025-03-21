variable "tf_state_bucket" {
  description = "name of s3 bucket in AWS to store terraform state"
  default     = "devops-recipe-app-udemy"
}

variable "tf_state_lock_table" {
  description = "name of dynamodb table to store terraform state lock"
  default     = "deveops-recipe-app-udemy-lock"
}

variable "project" {
  description = "name of the project"
  default     = "devops-recipe-app-udemy"
}

variable "contact" {
  description = "contact information of the project"
  default     = "zachtyz@gmail.com"
}