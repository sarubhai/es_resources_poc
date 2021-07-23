# Name: main.tf
# Owner: Saurav Mitra
# Description: This terraform config will create Elasticsearch resources
# https://registry.terraform.io/providers/phillbaker/elasticsearch/latest/docs


# Create an ISM Policy
resource "elasticsearch_opendistro_ism_policy" "ism_policy_movie" {
  policy_id = "manage-movie-indices"
  body      = file("${path.module}/manage-movie-indices.json")
}


# Create an Index Template
resource "elasticsearch_index_template" "index_template_movie" {
  name = "movie-index-template"
  body = file("${path.module}/movie-index-template.json")
}

# Create an Ingest Pipeline
resource "elasticsearch_ingest_pipeline" "ingest_pipeline_movie" {
  name = "movie-pipeline-daily"
  body = file("${path.module}/movie-pipeline-daily.json")
}


# Create a Kibana Object
resource "elasticsearch_kibana_object" "index_pattern_movie" {
  body = <<EOF
[
  {
    "_id": "index-pattern-movie",
    "_type": "doc",
    "_source": {
      "type": "index-pattern",
      "index-pattern": {
        "title": "movie-*",
        "timeFieldName": "@timestamp",
        "fields":"[{\"name\":\"@timestamp\",\"type\":\"date\",\"esTypes\":[\"date\"],\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"_id\",\"type\":\"string\",\"esTypes\":[\"_id\"],\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":false},{\"name\":\"_index\",\"type\":\"string\",\"esTypes\":[\"_index\"],\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":false},{\"name\":\"_score\",\"type\":\"number\",\"count\":0,\"scripted\":false,\"searchable\":false,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"_source\",\"type\":\"_source\",\"esTypes\":[\"_source\"],\"count\":0,\"scripted\":false,\"searchable\":false,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"_type\",\"type\":\"string\",\"esTypes\":[\"_type\"],\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":false},{\"name\":\"app_name\",\"type\":\"string\",\"esTypes\":[\"keyword\"],\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"movie_name\",\"type\":\"string\",\"esTypes\":[\"keyword\"],\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"release_year\",\"type\":\"number\",\"esTypes\":[\"integer\"],\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"watched_at\",\"type\":\"date\",\"esTypes\":[\"date\"],\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true}]"
      }
    }
  }
]
EOF
}


# Create an Index
resource "elasticsearch_index" "index_products" {
  name               = "products"
  number_of_shards   = 3
  number_of_replicas = 2
  mappings           = <<EOF
{
  "properties": {
    "product_id": { "type": "keyword" },
    "product_name": { "type": "keyword" },
    "description": { "type": "text" },
    "product_category": { "type": "keyword" },
    "distributor_code": { "type": "integer" },
    "price": { "type": "integer" },
    "currency": { "type": "keyword" },
    "start_date": { "type": "date", "format": "yyyy-MM-dd HH:mm:ss" },
    "end_date": { "type": "date", "format": "yyyy-MM-dd HH:mm:ss" },
    "status": { "type": "keyword" },
    "created_at": { "type": "date", "format": "yyyy-MM-dd HH:mm:ss" },
    "updated_at": { "type": "date", "format": "yyyy-MM-dd HH:mm:ss" }
  }
}
EOF
}
