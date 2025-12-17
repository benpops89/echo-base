resource "aws_ses_domain_identity" "domain" {
  domain = var.domain
}

resource "aws_ses_domain_dkim" "dkim" {
  domain = aws_ses_domain_identity.domain.domain
}

resource "aws_ses_domain_identity_verification" "verify" {
  domain = aws_ses_domain_identity.domain.domain
}
