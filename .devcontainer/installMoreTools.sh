#!/bin/bash

mkdir install-more-tools
cd install-more-tools

SCORE_COMPOSE_VERSION=$(curl -sL https://api.github.com/repos/score-spec/score-compose/releases/latest | jq -r .tag_name)
wget https://github.com/score-spec/score-compose/releases/download/${SCORE_COMPOSE_VERSION}/score-compose_${SCORE_COMPOSE_VERSION}_linux_amd64.tar.gz
tar -xvf score-compose_${SCORE_COMPOSE_VERSION}_linux_amd64.tar.gz
chmod +x score-compose
sudo mv score-compose /usr/local/bin

SCORE_K8S_VERSION=$(curl -sL https://api.github.com/repos/score-spec/score-k8s/releases/latest | jq -r .tag_name)
wget https://github.com/score-spec/score-k8s/releases/download/${SCORE_K8S_VERSION}/score-k8s_${SCORE_K8S_VERSION}_linux_amd64.tar.gz
tar -xvf score-k8s_${SCORE_K8S_VERSION}_linux_amd64.tar.gz
chmod +x score-k8s
sudo mv score-k8s /usr/local/bin

HUMCTL_VERSION=$(curl -sL https://api.github.com/repos/humanitec/cli/releases/latest | jq -r .tag_name)
curl -fLO https://github.com/humanitec/cli/releases/download/${HUMCTL_VERSION}/cli_${HUMCTL_VERSION:1}_linux_amd64.tar.gz
tar -xvf cli_${HUMCTL_VERSION:1}_linux_amd64.tar.gz
chmod +x humctl
sudo mv humctl /usr/local/bin/humctl

CANYON_VERSION=$(curl -sL https://api.github.com/repos/humanitec/canyon-cli/releases/latest | jq -r .tag_name)
wget https://github.com/humanitec/canyon-cli/releases/download/${CANYON_VERSION}/canyon-cli_${CANYON_VERSION:1}_linux_amd64.tar.gz
tar -xvf canyon-cli_${CANYON_VERSION:1}_linux_amd64.tar.gz
chmod +x canyon
sudo mv canyon /usr/local/bin

KIND_VERSION=$(curl -sL https://api.github.com/repos/kubernetes-sigs/kind/releases/latest | jq -r .tag_name)
curl -Lo ./kind https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq
sudo chmod +x /usr/bin/yq

cd ..
rm -rf install-more-tools
