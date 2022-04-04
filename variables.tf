variable "account_id" {
  type        = string
  description = "The AWS account id to be used to create resources."
}

variable "region" {
  type        = string
  description = "The AWS region to be used."
  default     = "eu-central-1"
}

variable "tags" {
  type        = map(any)
  description = "The tags to be added to all resources."
  default     = {}
}

variable "tenant" {
  type        = string
  description = "Account name or unique account id e.g., apps or management or aws007"
  default     = "aws"
}

variable "environment" {
  type        = string
  default     = "preprod"
  description = "Environment area, e.g. prod or preprod "
}

variable "zone" {
  type        = string
  description = "zone, e.g. dev or qa or load or ops etc..."
  default     = "dev"
}

variable "linuxNodeSize" {
  type        = string
  description = "The machine size of the Linux nodes for the regular services"
  default     = "m5a.4xlarge"
}

variable "linuxNodeCountMin" {
  type        = number
  description = "The minimum number of Linux nodes for the regular services"
  default     = 1
}

variable "linuxNodeCountMax" {
  type        = number
  description = "The maximum number of Linux nodes for the regular services"
  default     = 12
}

variable "linuxExecutionNodeSize" {
  type        = string
  description = "The machine size of the Linux nodes for the job execution"
  default     = "t3.medium"
}

variable "linuxExecutionNodeCountMin" {
  type        = number
  description = "The minimum number of Linux nodes for the job execution"
  default     = 0
}

variable "linuxExecutionNodeCountMax" {
  type        = number
  description = "The maximum number of Linux nodes for the job execution"
  default     = 10
}
variable "licenseServer" {
  type        = bool
  description = "Specifies whether a license server VM will be created."
  default     = false
}

variable "kubernetesVersion" {
  type        = string
  description = "The version of the AKS cluster."
  default     = "1.21"
}
variable "vpcCidr" {
  type        = string
  description = "The CIDR for the virtual private cluster."
  default     = "10.1.0.0/18"
}

variable "vpcPrivateSubnets" {
  type        = list(any)
  description = "List of CIDRs for the private subnets."
  default     = ["10.1.0.0/22", "10.1.4.0/22", "10.1.8.0/22"]
}

variable "vpcPublicSubnets" {
  type        = list(any)
  description = "List of CIDRs for the public subnets."
  default     = ["10.1.12.0/22", "10.1.16.0/22", "10.1.20.0/22"]
}

variable "vpcDatabaseSubnets" {
  type        = list(any)
  description = "List of CIDRs for the database subnets."
  default     = ["10.1.24.0/22", "10.1.28.0/22", "10.1.32.0/22"]
}

variable "enable_aws_for_fluentbit" {
  type        = bool
  description = "Install FluentBit to send container logs to CloudWatch."
  default     = false
}

variable "enable_aws_open_telemetry" {
  type        = bool
  description = "Install AWS Distro for OpenTelemetry to collect cluster metrics and send them to AWS CloudWatch."
  default     = false
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth ConfigMap"
  type        = list(string)
  default     = []
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth ConfigMap"
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth ConfigMap"
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "dspaceEulaAccepted" {
  type        = string
  description = "By setting this variable to true you accept the dSPACE End User License Agreement (https://www.dspace.com/en/pub/home/support/eula.cfm)."
}

variable "microsoftDotnetLibraryLicenseAccepted" {
  type        = string
  description = "By setting this variable to true you accept the Microsoft .NET Library License (https://www.microsoft.com/web/webpi/eula/net_library_eula_enu.htm)."
}

variable "simpheraInstances" {
  type = map(object({
    name                         = string
    postgresqlAdminLogin         = string
    postgresqlAdminPassword      = string
    postgresqlVersion            = string
    postgresqlStorage            = number
    db_instance_type_simphera    = string
    db_instance_type_keycloak    = string
    k8s_namespace                = string
    secret_minio_accesskey       = string
    secret_minio_secretkey       = string
    secret_couchdb_adminPassword = string
    secret_couchdb_adminUsername = string
    secret_keycloak_password     = string
    secret_tls_public_file       = string
    secret_tls_private_file      = string
    simphera_fqdn                = string
    keycloak_fqdn                = string
    minio_fqdn                   = string
    license_server_fqdn          = string
    simphera_chart_registry      = optional(string)
    simphera_chart_repository    = optional(string)
    simphera_chart_tag           = optional(string)
    simphera_image_tag           = optional(string)
    registry_username            = optional(string)
    registry_password            = optional(string)
    simphera_chart_local_path    = optional(string)
  }))
  description = "A list containing the individual SIMPHERA instances, such as 'staging' and 'production'."

}
