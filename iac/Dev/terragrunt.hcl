remote_state {
  backend = "local"
  config = {
    // path = "${get_parent_terragrunt_dir()}/${path_relative_to_include()}/terraform.tfstate"
    path = "${get_repo_root()}/terraform.tfstate"
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
}