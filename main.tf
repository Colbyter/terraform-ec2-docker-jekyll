provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  profile    = "terraform"
}

resource "aws_instance" "terratest" {
  ami           = "ami-0ac019f4fcb7cb7e6"
  key_name      = "terr"
  instance_type = "t2.micro"

  tags = {
    Name = "TerraDocker"
  }

  vpc_security_group_ids = ["${aws_security_group.TerraSecG_2.id}"]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file(var.ssh_key)}"
    agent       = false
  }

  provisioner "file" {
    source      = "./docker-app"
    destination = "~/docker-app"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt remove docker docker-engine docker.io",
      "sudo apt install -y apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable\"",
      "sudo apt update -y",
      "apt-cache policy docker-ce",
      "sudo apt install -y docker-ce",
      "cd ~/docker-app",
      "sudo docker build -t jekyll-demo .",
      "sudo docker run -d -p 80:80 jekyll-demo:latest",
    ]
  }
}
