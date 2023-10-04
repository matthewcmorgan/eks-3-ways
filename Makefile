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

