score-compose:
	score-compose init \
		--no-sample
	score-compose generate score/score.yaml \
		--build my-sample-container=app/ \
		--override-property containers.my-sample-container.variables.MESSAGE="Hello, Compose!"

compose-up:
	docker compose up --build -d

compose-test:
	curl localhost:8080

compose-down:
	docker compose down -v --remove-orphans

score-helm:
	score-helm run \
		-f score.yaml \
		-p containers.my-sample-container.image=sail-sharp-my-sample-app-my-sample-app \
		-p containers.my-sample-container.variables.MESSAGE="Hello, Kubernetes!" \
		-o values.yaml

NAMESPACE ?= default
k8s-up:
	helm upgrade \
		-n ${NAMESPACE} \
		--install \
		--create-namespace \
		my-sample-workload \
		--repo https://score-spec.github.io/score-helm-charts \
		workload \
		--values values.yaml \
		--set containers.my-sample-container.image.name=registry.humanitec.io/public/sample-score-app:latest

k8s-test:
	kubectl port-forward service/my-sample-workload 8080:8080

k8s-down:
	helm uninstall \
		-n ${NAMESPACE} \
		my-sample-workload