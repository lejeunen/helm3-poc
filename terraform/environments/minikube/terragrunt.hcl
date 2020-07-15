# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "local"

  config = {
    path = "${get_parent_terragrunt_dir()}/terraform.tfstate"
  }
}
