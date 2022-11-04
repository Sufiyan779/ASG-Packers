resource "aws_launch_template" "ASG" {
  name_prefix            = "autoscalling"
  image_id               = "ami-0c25f8bed9f7eeba5"
  instance_type          = "t2.micro"
  key_name               = "mumbai_region"
  vpc_security_group_ids = ["sg-01d71cbe9f383f09f"]
}

resource "aws_autoscaling_group" "terraform" {
  availability_zones = ["ap-south-1a"]
  desired_capacity   = 1
  max_size           = 3
  min_size           = 1
  health_check_type         = "EC2"

  launch_template {
    id      = aws_launch_template.ASG.id
    version = "$Latest"
  }
}