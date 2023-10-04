.SHELLFLAGS = -x -e -c
.ONESHELL:
.SILENT:
TF_DIR=./terraform-eks/

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
