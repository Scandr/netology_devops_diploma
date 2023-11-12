Set S3 bucket as Terraform config storage
```
export ACCESS_KEY="YCAJECdhPLFVqfLBgMdUaLjQ2"
export SECRET_KEY="YCNnp8qaz4FgPuGsHiqPBtNz31k9N5LWSxAh7lbr"
terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"
```