# Create Elasticsearch Objects:

Manage Elasticsearch Resources using Terraform.

This is a PoC for showcasing ES objects management using terraform.
Reference: [https://registry.terraform.io/providers/phillbaker/elasticsearch/latest/docs](https://registry.terraform.io/providers/phillbaker/elasticsearch/latest/docs)

## Resources

- 1 ISM Policy
- 1 Index Template
- 1 Ingest Pipeline
- 1 Kibana Object (Index Pattern)
- 1 Index

## Setup

- terraform.tfvars

```
elasticsearch_url = "http://localhost:9200"

elasticsearch_username = "elastic"

elasticsearch_password = "Password"
```
