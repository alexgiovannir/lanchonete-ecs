resource "aws_autoscaling_group" "ecs_asg" {
  vpc_zone_identifier = [
    data.aws_subnet.lanchonete_subnet_public_1,
    data.aws_subnet.lanchonete_subnet_public_2
  ]
  desired_capacity = 2
  max_size = 2
  min_size = 2

  launch_template {
    id = aws_launch_template.ec2_lt.id
    version = "$Latest"
  }
  tag {
    key                 = "AmazonECSManaged"
    propagate_at_launch = true
    value               = true
  }
}