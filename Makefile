# COMMON VARIABLES FOR ALL TERRAFORM PROJECTS
az_region="westeurope"
az_subscription_id="3993b103-0198-44e0-9e34-33d17436fe02"

# VARIABLES SUITABLE TO CHANGE
ENV="qa"

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

stateinit: ## Initializes the bucket and dynamodb for state
	@if [ -z $(ENV) ]; then echo "ENV was not set" ; exit 10 ; fi
	@terraform init

stateplan: stateinit ## Shows the plan for the bucket and dynamodb for state.
	@terraform plan -input=false -refresh=true -var "environment=${ENV}" -var "az_region=${az_region}"

stateapply: stateinit ## Applies a new state for the bucket and dynamodb for state.
	@terraform apply -input=true -refresh=true -var "environment=${ENV}" -var "az_region=${az_region}"

init: ## Initializes the terraform remote state backend and pulls the correct project state.
	@if [ -z $(ENV) ]; then echo "ENV was not set" ; exit 10 ; fi
	@rm -rf .terraform/*.tf*
	@terraform init \
        -backend-config="region=${az_region}"

update: ## Gets any module updates
	@terraform get -update=true &>/dev/null

plan: init update ## Runs a plan. Note that in Terraform < 0.7.0 this can create state entries.
	@terraform plan -input=true -refresh=true -var-file=vars/$(ENV)/inputs.tfvars -var "environment=${ENV}" -var "az_region=${az_region}"

plan-destroy: init update ## Shows what a destroy would do.
	@terraform plan -input=false -refresh=true -module-depth=-1 -destroy -var-file=vars/$(ENV)/inputs.tfvars -var "environment=${ENV}" -var "az_region=${az_region}"

show: init ## Shows a module
	@terraform show -module-depth=-1

graph: ## Runs the terraform grapher
	@rm -f graph.png
	@terraform graph -draw-cycles -module-depth=-1 | dot -Tpng > graph.png
	@open graph.png

apply: init update ## Applies a new state.
	@terraform apply -input=true -refresh=true -var-file=vars/$(ENV)/inputs.tfvars -var "environment=${ENV}" -var "az_region=${az_region}"

output: update ## Show outputs of the entire state.
	@terraform output

destroy: init update ## Destroys targets
	@terraform destroy -var-file=vars/$(ENV)/inputs.tfvars -var "environment=${ENV}" -var "az_region=${az_region}"
