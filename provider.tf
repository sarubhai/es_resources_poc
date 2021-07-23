# Name: provider.tf
# Owner: Saurav Mitra
# Description: This terraform config will Configure Terraform Providers
# https://www.terraform.io/docs/language/providers/requirements.html

terraform {
  required_providers {
    elasticsearch = {
      source  = "phillbaker/elasticsearch"
      version = "1.6.1"
    }
  }
}

# Configure Terraform Elasticsearch Provider
# https://registry.terraform.io/providers/phillbaker/elasticsearch/latest/docs

# $ export ELASTICSEARCH_URL="http://localhost:9200"
# $ export ELASTICSEARCH_USERNAME="elastic"
# $ export ELASTICSEARCH_PASSWORD="password"

provider "elasticsearch" {
  url                   = var.elasticsearch_url
  username              = var.elasticsearch_username
  password              = var.elasticsearch_password
  elasticsearch_version = var.elasticsearch_version
  healthcheck           = false
  sniff                 = false
  sign_aws_requests     = false
}
