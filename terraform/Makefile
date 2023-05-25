BACKEND_CONFIG ?=

init:
	terraform init -backend-config=$(BACKEND_CONFIG) -reconfigure

fmt:
	terraform fmt

validate: fmt-check
	terraform validate -no-color

plan:
	terraform plan -var-file=$(BACKEND_CONFIG) -no-color

apply:
	terraform apply -var-file=$(BACKEND_CONFIG)

fmt-check:
	terraform fmt -check

auto-apply:
	terraform destroy -var-file=$(BACKEND_CONFIG) -auto-approve -no-color

destroy:
	terraform destroy -var-file=$(BACKEND_CONFIG) -no-color
