resource "aws_instance" "aws-ins-1" {

  subnet_id              = aws_subnet.sub-1.id
  vpc_security_group_ids = [aws_security_group.sg-1.id]
  ami                    = var.aws_ami_name
  instance_type          = var.instance_type_name
  iam_instance_profile = aws_iam_instance_profile.iam_instance_profile.name
  depends_on = [aws_iam_role_policy.allow-s3-all]
  user_data              = <<EOF
#! /bin/bash
sudo yum install nginx -y
sudo rm -f /usr/share/nginx/html/index.html
aws s3 cp s3://${aws_s3_bucket.s3-bucket.id}/website/index-1.html /home/ec2-user/index.html
sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
sudo service nginx start  
EOF

  tags = local.common_tags
}

resource "aws_instance" "aws-ins-2" {

  subnet_id              = aws_subnet.sub-2.id
  vpc_security_group_ids = [aws_security_group.sg-1.id]
  ami                    = var.aws_ami_name
  instance_type          = var.instance_type_name
  iam_instance_profile = aws_iam_instance_profile.iam_instance_profile.name
  depends_on = [aws_iam_role_policy.allow-s3-all]
  user_data              = <<EOF
#! /bin/bash
sudo yum install nginx -y
sudo rm -f /usr/share/nginx/html/index.html
aws s3 cp s3://${aws_s3_bucket.s3-bucket.id}/website/index-2.html /home/ec2-user/index.html
sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
sudo service nginx start   
EOF

  tags = local.common_tags
}
