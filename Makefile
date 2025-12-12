git: ## Git pull code and Terraform local state clean
	git pull

a apply: git ## Terraform DEV Env Apply
	terraform init
	terraform apply -auto-approve

d destroy: git ## Terraform DEV Env Apply
	terraform init
	terraform destroy -auto-approve
