output "route53_record" {
  value = aws_route53_record.this
}

output "asset_cloudfront_distribution" {
  value = aws_cloudfront_distribution.this
}

output "memcached_cluster_endpoint" {
  value = module.rails.memcached_cluster_endpoint
}

output "sns_events_subscription_arn" {
  value = module.rails.sns__events_subscription_arn
}

output "app_store_html_cdn" {
  value = module.app_store_cdn.html_cache_cloudfront_distribution
}
