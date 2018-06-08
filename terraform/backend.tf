terraform {
  backend "s3" {
    bucket         = "cs642"
    key            = "shu/terraform.tfstate"
    encrypt        = "true"
    region         = "us-east-1"
    dynamodb_table = "prod_lock"
    profile        = "shu"
  }

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
