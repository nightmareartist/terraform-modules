# Get the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"]
}

# Create instance
resource "aws_instance" "ec2-instance" {
  count                       = var.aws_instance_count
  ami                         = length(var.ami) > 0 ? var.ami : data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  ebs_optimized               = var.ebs_optimized
  key_name                    = var.key_name
  availability_zone           = var.availability_zone
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_groups_ids
  disable_api_termination     = var.disable_api_termination
  source_dest_check           = var.source_dest_check
  monitoring                  = var.monitoring
  hibernation                 = var.hibernation
  user_data                   = var.user_data
  iam_instance_profile        = var.iam_instance_profile


  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
    }
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }
  }

  credit_specification {
    cpu_credits = "standard"
  }

  tags = var.tags
}
