resource "aws_launch_template" "ec2_lt" {
  name_prefix = "ecs-template"
  image_id = "ami-0c45946ade6066f3d"
  instance_type = "t2.micro"
  key_name = "humangov-ec2-key"
  vpc_security_group_ids = [data.aws_security_group.lanchonete_security_group.id]
  iam_instance_profile {
    name = adm-role
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ecs_instance"
    }
  }
  user_data = filebase64("${path.module}/aws_ecs/ecs.sh")
}