
yes "yes" | terraform destroy -var-file="production.tfvars"
yes "yes" | terraform apply -var-file="production.tfvars"
