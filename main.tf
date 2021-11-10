

  primary_db = {
    instance_name          = "staging-rds-20210601-encrypted"
    db_name                = "staging"
    instance_class         = "db.t3.small"
    allocated_storage      = 20
    max_allocated_storage  = 30
    iops                   = 1000
    vpc_security_group_ids = ["sg-9f5283aa"]
    db_username            = "st_rds"
    kms_key_id             = "arn:aws:kms:us-west-2:112760038712:key/e1d989dc-0130-4984-aecc-937f3d1aa1e7"
  }


module "rails_db_read_replica" {
  source = "git@github.com:/"

  instance_name  = "staging-rds-read"
  db_name        = module.rails.primary_db.name
  source_db      = module.rails.primary_db.id
  instance_class = "db.t3.small"
  iops           = 1000
  username       = module.rails.primary_db.username
  kms_key_id     = module.rails.primary_db.kms_key_id

  storage = {
    allocated = 20
    max       = 30
  }

  cloudwatch_logs_exports = []
  vpc_security_group_ids  = ["sg-9f5283aa"]
  tags                    = merge(module.rails.labels.tags, map("Name", "staging-rds-read"))
}
