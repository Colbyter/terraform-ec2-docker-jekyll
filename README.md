# terraform-ec2-docker-jekyll

This demo uses Terraform to provision an EC2 instance with basic Security Group policy, then launch a jekyll web site in a docker container.

What you will need:

1. AWS Account.
2. AWS Access, Secret keys and key pem file.
3. Install Terraform and Ansible.
4. Launch the `./starter.sh` script. Make it executable with `chmod 700 starter.sh

You could either add the AWS keys and path to pem file in the variables.tf file or pass them during the excecution.
