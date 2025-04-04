locals {
  well_architected_framework_rel_custom = merge(local.well_architected_framework_reliability_common_tags, {
    question_id = "check-end-of-support"
  })
}

benchmark "well_architected_framework_rel_custom" {
  title       = "Ensure Supported Service Versions"
  description = "Maintaining workloads on supported software versions is critical for reliability and security. This benchmark validates that key AWS services—namely RDS and EKS—operate on versions within defined support schedules. Instances that are approaching end-of-support or running below the minimum thresholds are flagged, enabling proactive upgrades and minimizing operational risk."
  children = [
    aws_compliance.control.rds_instance_support_check,
    aws_compliance.control.rds_db_instance_extended_support,
    aws_compliance.control.eks_cluster_support_check,
    aws_compliance.control.eks_cluster_extended_support
  ]
  tags = local.well_architected_framework_rel_custom
}
