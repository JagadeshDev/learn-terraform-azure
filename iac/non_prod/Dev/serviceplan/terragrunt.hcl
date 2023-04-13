include "global"{
    path="${get_repo_root}//iac/_baseModule/global.hcl"
    expose=true
    merge_strategy-"deep"
}

include "serviceplan"{
    path"${get_repo_root}//iac/_baseModule/serviceplan/terragrunt.hcl"
}