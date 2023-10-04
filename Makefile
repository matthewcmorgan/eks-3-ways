.SHELLFLAGS = -x -e -c
.ONESHELL:
.SILENT:
TF_DIR=./terraform-eks/
s3_bucket=stelligent-templates-bucket

tf-plan:
	cd ./terraform-eks && \
	terraform fmt || exit 0 && \
	terraform init || exit 0 && \
	terraform plan -out ../terraform-plan.out || exit 0 && \
	cd ..

cdk-synth:
	cd ./sample-cdk && \
	python3 -m venv .venv && \
	source .venv/bin/activate && \
	python3 -m pip install -r requirements.txt && \
	cdk synth -o ../cdk-eks.out || exit 0 && \
	cd ..

cfn-synth:
	cd ./cfn-eks/ && \
	aws cloudformation package --template-file ./Foundational.yaml --s3-bucket stelligent-templates-bucket --output-template-file packaged.yml && \
	aws cloudformation validate-template --template-body file://./packaged.yml && \
	aws cloudformation estimate-template-cost --template-body file://../packaged.yml