# DevOps Take-Home Challenge

# 1) How to build and run the application locally.

sudo docker login
sudo docker run -d -p 80:3000 --name devops dumytrue/devops

# 2) How to set up the infrastructure using Terraform.

# Go to terraform directory
cd terraform

# Initialize terraform working directory
terraform init

# Update key.pub with your public key in order to add the key on the EC2 instance for deployment process
cat key.pub
REPLACE_PUBLIC_KEY_HERE

# Check the changes before applying them
terraform plan 

# Deploy infrastructure 
terraform apply 

# 3) How to deploy the application using the CI/CD pipeline.

Configure .github/workflows/ci.yml, for each new commit, the CI/CD pipeline will run, build and deploy the app

# Add repository secrets to login to DockerHub and to the EC2 instance for the deployment

Github -> Repository -> Settings -> Secrets and variables -> Actions -> New repository secret

# DockerHub username
DOCKER_USERNAME

# DockerHub password
DOCKER_PASSWORD

# The public ip of the EC2 instance where the application will be deployed
EC2_PUBLIC_IP

# The private key used to connect to the EC2 instance and to deploy the applicaton
SSH_PRIVATE_KEY
