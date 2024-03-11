### Terraform
Terraform - Infra provisioning tool
    IAC - Infrastructure as a Code

# Terraform wrote in 
HCL and Json
(.tf) and (.tf.json)
 
## Data Types in Terraform:
1. String =
    1. It should be a combination of multple charecters
    2. It always store into the double quot ""
    3. Example: "Shubham", "Jarvis", "Jarvis25"

2. Number = 123
3. Boolean = True False 0 1
4. List = ["Banana", "Apple",]
5. Map/Dictionary = {Name = "Jarvis", City = "Pune", Country = "India"}      # this is combination of key-value made one value
    

# Diffrence: Double quot & Single Quote
    1. "My Name is "Jarvis," I am from India"   # How many string ?
    2. "My Name is Jarvis, I am from India"     # How many string ?
    3. "My Name is Jarvis, I am from India"     # How many string ?
Terraform always use the double string

# Terraform Lifecycle


# Symbolic changes in terraform
+
-
<!-- ~ -->

# Explore
1. .terraform directory: ?
2. terraform.hcl.lock: ?
3. terraform.tf.state: It contain the all informatino about infrastructure. This is created in our local system after the      execution of terraform apply command.

# Lifecycle of variable:
1. Variable initialize (here we define the variable)        X
2. Variable declare (here store the value of variable)      X=3
3. Varible call (use of variable)                           A = X+2 = 5

# How we can initialize variable in terraform
1. using variable block / variable name / configure
2. we can give any variable name, it's very sensitive
3. samely variable is also have there own data types
    - String
    - List
    - Number
    - dictionary
    - map
    - boolean
4. If we didn't specify any type it will consider it as a string data type.
5. we can specify the variable value after the terraform applya, either we can specify into the variable file.

# Example 1:- Pass the variable value in propmt
    region = var.region

        variable "vairbale_name" {
            description = "region based variable calling after terraform plan"
        }


# Example 2:- Passing the values in default, It will not asked you in prompt.
    region = var.region

        variable "vairbale_name" {
            description = "region based variable calling after terraform plan"
            default = "us-east-1"
        }

# Example 3:- Passing the values default, in prompt # terraform plan --var region=us-east-1 .
    region = var.region

        variable "vairbale_name" {
            description = "region based variable calling after terraform plan"
            default = "us-east-1"
        }

# Example 4:- Pass the variable value in command line prompt having high priority than file.
    region = var.instance_type

        variable "instance_type" {
            description = "region based variable calling after terraform plan"
            default = "t2.micro"
        }
     
     # terraform plan --var instance_type=t3.medium
     default value applied on t3.medium command line variable gives high priority

# Terraform registry
1. Argument refer --
2. Attribute refer (id) --> Block
        Refer: block_type.block_name.reference_name

# Blocks
1. Provider block
2. Terraform block (Keeping backup of .tf state file in S3 using Terraform Backend accquiring state locking using dynamodb)
3. Data Blocks: If we want to manage pre-existing infrastructure from terraform then we use data blocks.
4. Resource Block:
5. Output Block: It works as a echo command, print & display the output of script in terminal.

# Modules


