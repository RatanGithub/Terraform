variable "acm_domain" {
  description = "Domain to query for ACM TLS Certificate"
  type        = string
}

variable "asset_domain" {
  description = "Domain to redirect assets to CloudFront CDN"
  type        = string
}

variable "cloudfront_price_class" {
  description = "The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
  type        = string
}

variable "origin_alternate_cnames" {
  description = "CNAME entries to use with CloudFront Distribution"
  type        = list(string)
}

variable "origin_id" {
  description = "Unique name for CloudFront origin"
  type        = string
}

variable "origin_domain" {
  description = "Target domain for CloudFront origin. Can be an S3 Bucket or ELB"
  type        = string
}

variable "origin_path" {
  description = "An optional element that causes CloudFront to request your content from a directory in your Amazon S3 bucket or your custom origin."
  type        = string
}

variable "route53_zone_id" {
  description = "Hosted zone ID for Route53 domain"
  type        = string
}
