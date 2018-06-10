provider "aws" {
  region  = "us-east-1"
  profile = "shu"
}

module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  name = "service"

  # Launch configuration
  lc_name = "shu-lc"

  image_id        = "ami-a4dc46db"
  instance_type   = "t2.micro"
  security_groups = ["sg-56197d1f"]
  key_name        = "april20"

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "50"
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size = "50"
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name                  = "shu-asg"
  vpc_zone_identifier       = ["subnet-8037e3ad", "subnet-9491f8f1"]
  health_check_type         = "EC2"
  min_size                  = 0
  max_size                  = 2
  desired_capacity          = 2
  wait_for_capacity_timeout = 0

  associate_public_ip_address = true

  user_data = "${var.user_data}"

  tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "Name"
      value               = "shu"
      propagate_at_launch = true
    },
  ]

  tags_as_map = {
    extra_tag1 = "shu_final"
    extra_tag2 = "extra_value2"
  }
}
