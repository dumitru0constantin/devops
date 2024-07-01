# DevOps Take-Home Challenge

# 1) How to build and run the application locally.

sudo docker run -d -p 80:3000 --name devops dumytrue/devops-public

# 2) How to set up the infrastructure using Terraform.

# Go to terraform directory
cd terraform

# Initialize terraform working directory
terraform init

# Update key.pub with your public key in order to add the key on the EC2 instance for deployment process
# cat key.pub
# REPLACE_PUBLIC_KEY_HERE

# Check the changes before applying them
terraform plan 

# Deploy infrastructure 
terraform apply 

# 3) How to deploy the application using the CI/CD pipeline.

# Configure .github/workflows/ci.yml, for each new commit, the CI/CD pipeline will run, build and deploy the app

