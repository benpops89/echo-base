terraform {
  backend "s3" {
    bucket       = var.state_bucket
    key          = var.state_key
    region       = var.aws_region
    use_lockfile = true
  }
}

