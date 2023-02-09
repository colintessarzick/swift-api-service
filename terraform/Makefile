BACKEND_CONFIG := remote_state.tfvars

init:
	terraform init -backend-config=$(BACKEND_CONFIG) -reconfigure

plan:
	terraform plan -var-file=$(BACKEND_CONFIG)

apply:
	terraform apply -var-file=$(BACKEND_CONFIG)
