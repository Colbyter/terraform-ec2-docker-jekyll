#!/bin/bash
terraform fmt
terraform validate
terraform plan
echo "yes" | terraform apply
