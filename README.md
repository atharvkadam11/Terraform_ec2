Below is the complete, all-in-one `README.md` content:

```markdown
# Terraform AWS EC2 Setup

This repository provides a Terraform configuration to set up an AWS EC2 instance with a key pair, default VPC, and a security group. The setup includes:

- **Creating an AWS key pair** for secure SSH access.
- **Setting up a default VPC.**
- **Defining a security group** with specific ingress and egress rules.
- **Launching an EC2 instance** with the specified AMI, instance type, and security settings.

## Prerequisites

Before using this Terraform configuration, ensure you have the following:

- An AWS account.
- An IAM user with appropriate permissions (or admin privileges).
- Terraform installed on your local machine.
- AWS CLI configured with the necessary credentials.
- A public SSH key file (e.g., `terra-key1.pub`) available in the same directory as the Terraform configuration file.

## Usage

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone <repo_url>
cd <repo_directory>
```

### 2. Configure Variables

Update the `variables.tf` file or pass the following variables as required:

- **tagname:** Tag name for resources.
- **ami:** Amazon Machine Image (AMI) ID.
- **ec2instancetype:** Type of EC2 instance (e.g., `t2.micro`).
- **volumesize:** Size of the root volume in GB.
- **volumetype:** Type of the root volume (e.g., `gp2`).

### 3. Initialize Terraform

Run the following command to initialize Terraform:

```bash
terraform init
```

### 4. Plan the Deployment

Generate a plan to see what resources will be created:

```bash
terraform plan
```

### 5. Apply the Configuration

Deploy the resources in your AWS account:

```bash
terraform apply
```

### 6. Verify the Deployment

After applying, Terraform will output details of the created resources. Use these details to verify the deployment in your AWS Management Console.

## Resources Created

1. **AWS Key Pair**
   - **Resource Name:** `aws_key_pair.my-terrakey`
   - **Purpose:** Provides secure SSH access to the EC2 instance.
   - **Public Key File:** `terra-key1.pub`

2. **Default VPC**
   - **Resource Name:** `aws_default_vpc.default`
   - **Purpose:** Utilizes the default VPC for the EC2 instance.

3. **Security Group**
   - **Resource Name:** `aws_security_group.my-sg1`
   - **Ingress Rules:**
     - Port 22: Allow SSH from anywhere.
     - Port 80: Allow HTTP traffic from anywhere.
   - **Egress Rule:**
     - Allow all outbound traffic.

4. **EC2 Instance**
   - **Resource Name:** `aws_instance.my-instance`
   - **AMI:** Provided via the variable `ami`.
   - **Instance Type:** Defined by the variable `ec2instancetype`.
   - **Security Group:** Associated with `aws_security_group.my-sg1`.
   - **Root Volume:**
     - **Size:** Configured via `volumesize`.
     - **Type:** Defined by `volumetype`.

## Example Variable Configuration

Below is an example `variables.tf` configuration:

```hcl
variable "tagname" {
  default = "myapp"
}

variable "ami" {
  default = "ami-12345678"  # Replace with your AMI ID
}

variable "ec2instancetype" {
  default = "t2.micro"
}

variable "volumesize" {
  default = 8
}

variable "volumetype" {
  default = "gp2"
}
```

## Cleanup

To delete all resources created by this configuration, run:

```bash
terraform destroy
```
