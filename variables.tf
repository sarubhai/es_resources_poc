# Name: variables.tf
# Owner: Saurav Mitra
# Description: Variables used by terraform config to create Elasticsearch resources

variable "elasticsearch_url" {
  description = "Elasticsearch URL."
}

variable "elasticsearch_username" {
  description = "Elasticsearch Username."
}

variable "elasticsearch_password" {
  description = "Elasticsearch Password."
}

variable "elasticsearch_version" {
  description = "Elasticsearch Version."
  default     = "7.9"
}
