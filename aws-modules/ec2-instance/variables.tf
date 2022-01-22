variable "enabled" {
  description = "A boolean to enable/disable resource creation"
  type        = bool
  default     = true
}

variable "name" {
  description = "Solution name, e.g. 'app' or 'jenkins'"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Default tags"
  type        = map(string)
  default     = {}
}

variable "aws_instance_count" {
  description = "Number of instances"
  type        = number
  default     = 1
}

variable "ami" {
  description = "AMI instance"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Instance type to be used"
  type        = string
  default     = "t2.micro"
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "Key name to be used for accessing this instance"
  type        = string
  default     = ""
}

variable "associate_public_ip_address" {
  description = "Setup public IP for this instance"
  type        = bool
  default     = true
}

variable "availability_zone" {
  description = "(Optional) The AZ to start the instance in"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "Subnet in which this instance should run"
  type        = string
  default     = ""
}

variable "vpc_security_groups_ids" {
  description = "Security groups this instance should be associated with"
  type        = list(string)
  default     = null
}

variable "disable_api_termination" {
  description = "Turn on termination protection"
  type        = bool
  default     = true
}

variable "source_dest_check" {
  description = "Turn on source dest check"
  type        = bool
  default     = true
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = false
}

variable "hibernation" {
  description = "(Optional) If true, the launched EC2 instance will support hibernation"
  type        = bool
  default     = false
}

variable "user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  type        = string
  default     = ""
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole"
  type        = string
  default     = ""
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance"
  type        = list(map(string))
  default     = []
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default     = []
}

variable "credit_specification" {
  description = "Customize the credit specification of the instance"
  type        = any
  default     = []
}
