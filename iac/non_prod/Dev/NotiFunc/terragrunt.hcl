include "global" {
  path           = "${get_repo_root()}/iac/_baseModule/global.hcl" #find_in_parent_folders
  // path           = find_in_parent_folders("global.hcl")
  expose         = true
  merge_strategy = "deep"
}

include "NotificationStorage" {
  path = "${get_repo_root()}/iac/_baseModule/storage/terragrunt.hcl"
  // path = find_in_parent_folders("terragrunt.hcl")
}



