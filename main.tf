resource "aws_instance" "myInstance" {
  ami           = "ami-06ce3edf0cff21f07"
  instance_type = "t2.micro"
  user_data     = <<-EOF
                  #!/bin/bash
                  sudo su
                  yum -y install httpd
                  echo "<p> My Instance! </p>" >> /var/www/html/index.html
                  sudo systemctl enable httpd
                  sudo systemctl start httpd
                  EOF
}

output "DNS" {
  value = aws_instance.myInstance.public_dns
}
