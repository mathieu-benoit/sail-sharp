# Disable all the default make stuff
MAKEFLAGS += --no-builtin-rules
.SUFFIXES:

## Display a list of the documented make targets
.PHONY: help
help:
	@echo Documented Make targets:
	@perl -e 'undef $$/; while (<>) { while ($$_ =~ /## (.*?)(?:\n# .*)*\n.PHONY:\s+(\S+).*/mg) { printf "\033[36m%-30s\033[0m %s\n", $$2, $$1 } }' $(MAKEFILE_LIST) | sort

.PHONY: .FORCE
.FORCE:

CONTAINER_IMAGE = my-sample-container:test
compose.yaml: score/score.yaml
	score-compose init \
		--no-sample
	score-compose generate score/score.yaml \
		--build 'my-sample-container={"context":"app/","tags":["${CONTAINER_IMAGE}"]}' \
		--override-property containers.my-sample-container.variables.MESSAGE="Hello, Compose!"

## Generate a compose.yaml file from the score spec and launch it.
.PHONY: compose-up
compose-up: compose.yaml
	docker compose up --build -d --remove-orphans

## Generate a compose.yaml file from the score spec, launch it and test (curl) the exposed container.
.PHONY: compose-test
compose-test: compose-up
	sleep 5
	curl localhost:8080

## Delete the containers running via compose down.
.PHONY: compose-down
compose-down:
	docker compose down -v --remove-orphans || true

values.yaml: score/score.yaml
	score-helm run \
		-f score/score.yaml \
		-p containers.my-sample-container.image=${CONTAINER_IMAGE} \
		-p containers.my-sample-container.variables.MESSAGE="Hello, Kubernetes!" \
		-o values.yaml

## Load the local container image in the current Kind cluster.
.PHONY: kind-load-image
kind-load-image:
	kind load docker-image ${CONTAINER_IMAGE}

NAMESPACE ?= default
## Deploy the local container in Kubernetes.
.PHONY: k8s-up
k8s-up: values.yaml
	$(MAKE) k8s-down || true
	$(MAKE) compose-down || true
	helm upgrade \
		-n ${NAMESPACE} \
		--install \
		--create-namespace \
		my-sample-workload \
		--repo https://score-spec.github.io/score-helm-charts \
		workload \
		--values values.yaml

## Expose the container deployed in Kubernetes via port-forward.
.PHONY: k8s-test
k8s-test: k8s-up
	sleep 5
	kubectl port-forward service/my-sample-workload 8080:8080

## Delete the the deployment of the local container in Kubernetes.
.PHONY: k8s-down
k8s-down:
	helm uninstall \
		-n ${NAMESPACE} \
		my-sample-workload