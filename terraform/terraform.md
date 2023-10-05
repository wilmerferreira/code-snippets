# Terraform

Before start to use terraform you will need to configure the following things:

1. Configure the credentials for your provider's credentials

   - Create an amazon account

   - Create an [IAM](https://console.aws.amazon.com/iam)'s user
     - With _Access key - Programmatic access_
     - With the required permissions (e.g. `AdministratorAccess`)
     - Store the `Access Key ID` and the `Secret Access Key` in a safe place, e.g. by download the `.csv` file in your file system

   - Create a `credentials` file under `C:\Users\your.name` (or `%USERPROFILE%`) as explained

     ```txt
     [default]
     aws_access_key_id     = YOUR_ACCESS_KEY_ID
     aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
     ```

2. Initialize your git repository (optional, although strongly recommended)

   ```sh
   git init
   ```

3. Init your `terraform` repository

   ```sh
   terraform init
   ```

4. Configure your provider in your terraform script

   ```tf
   provider "aws" {
     profile = "default"
     region  = "eu-west-2"
   }
   ```

The syntax of the Terraform language consists of only a few basic elements:

```txt
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
  # Block body  <IDENTIFIER> = <EXPRESSION> # Argument
}
```

```tf
resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}
```

Type, resources, names, blocks and arguments
_Triplets_ = `{RESOURCE}.{NAME}.{ARGUMENT}`, e.g. `aws_availability_zones.available.id`

## Variables

Variable Types:

- Scalars
  - String: `development`, `t2.micro`
  - Boolean: `true`, `false`
  - Number: integers and fractional values
- Collections
  - List: `["DEV", "QA", "STG", "PROD"]`, `[1, 15, 23, 44]`, `var.environment_list[2]`
  - Set: like a list but unordered
  - Map: key-value pairs; values must be of the same type, e.g. `variable "config_value" { type = map(string) }`
- Object: KEY = VALUE; value can be of any type, e.g. `object({ instance_type = string, monitoring = bool })`
- Tuple: similar to object, stricter type-conversation rules

Precedence (hierarchy):

> Each of these values will be overwritten with the next one in the list

- Default Value
- Environment Value (starting with `TF_VAR_`)
- Files
  - `terraform.tfvars`
  - `terraform.tfvars.json`
  - `*.auto.tfvars`
- Command-line

  ```sh
  terraform apply -var="my_variable=another_value"
  ```

```tf
variable "my_variable" {
  type    =  string
  default = "default_value"
}

# Usage
resource "provider_resource" "name" {
  ami = var.my_variable
  # ...
}
```

### From Files

Variables can be moved to a separate file `*.tfvars`

```tfvars
web_instance_type = "t2.micro
```

```tf
variable "web_instance_type" {
  type = string
}

resource "aws_launch_template" "prod_web" {
  name_prefix   = "prod_web"
  image_id      = "ami-03c8adc67e56c7f1d"
  instance_type = var.web_instance_type

  tags = {
    "Terraform": "true"
  }
}
```

## Data Sources

```tf
data "data_ami" "webserver_ami" {
  most_recent = true

  owners = [ "self" ]

  tags = {
    Name   = "webserver"
    Deploy = "true
  }
}

resource "aws_instance" "web" {
  ami = data.aws_ami.webserver_ami.id
}
```

## Keep It Simple

- Documentation as code
- More complex code logic is usually less readable
- Balance is key
- Code toward the level beyond what you need

## Modules

Are a feature that allow you to combine some of the code in logical groups, so they can be managed together

- Self-contained sub-configurations with input and output variables (bundle together a subset of code)
- Pass in arguments
- Work like custom resources
- You've already got one module

> Modules cannot be deployed independently

Storage options for modules

- Local filesystem
- GitHub
- Git Repository
- Http url
- Terraform registry

File structure of a module:

- `main.tf`: main code for the module
- `variables.tf`: input variables
- `outputs.tf`: output variables
- `README.md`

There's a lot more than this...

- Remote modules
- Versioning
- Providers and provider versions
- Third party or open source modules can be found in [registry.terraform.io](https://registry.terraform.io)

### Input

```tf
# Talk to a module
module "web_server" {
  source = "./modules/servers"

  web_ami     = "ami-12345"
  server_name = "prod_web"
}
```

```tf
# This is a module

variable "web_ami" {
  type    = string
  default = "ami-abc123
}

variable "server_name" {
  type    = string
}
```

### Output

```tf
# These are output variables from a module

output "instance_public_ip" {
  value = aws_instance.web_app.public_ip
}

output "app_bucket" {
  value = aws_s3_bucket.web_app.bucket
}
```

```tf
# Root module
resource "aws_route53_record" "www" {
  name    = "www.example.com"
  zone_id = aws_route53_zone.main.zone_id
  type    = "A"
  ttl     = "300"
  records = [module.web_server.instance_public_ip]
}
```

## More Information

- [terraform.io](https://www.terraform.io/)
  - [Terraform Language](https://www.terraform.io/language)
  - [registry.terraform.io](https://registry.terraform.io)
