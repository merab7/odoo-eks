output "cluster_name"        { value = module.eks.cluster_name }
output "cluster_endpoint"    { value = module.eks.cluster_endpoint }
output "ecr_repository_url"  { value = aws_ecr_repository.odoo.repository_url }
output "gha_role_arn"        { value = aws_iam_role.gha_ecr_push.arn }
output "vpc_id"              { value = module.vpc.vpc_id }
