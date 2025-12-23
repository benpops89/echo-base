provider "aws" {
  region = var.aws_region
}

provider "cloudflare" {
  alias     = "r2"
  api_token = var.cloudflare_r2_token
}
