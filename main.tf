resource "aws_instance" "myInstance" {
  ami           = "ami-06ce3edf0cff21f07"
  key_name      = "keypairname"
  instance_type = "t2.micro"
  subnet_id     =  "subnet_id"
  user_data     = <<-EOF
                  #!/bin/bash
                  sudo su
                  yum -y install httpd
                  echo "<p> My Instance! </p>" >> /var/www/html/index.html
                  sudo systemctl enable httpd
                  sudo systemctl start httpd
                  EOF
}

