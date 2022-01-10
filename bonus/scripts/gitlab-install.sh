#!/bin/bash

yellow="\033[1;33m"
green="\033[1;32m"
reset="\033[m"

echo "\n\n${yellow}===WELCOME TO GITLAB BONUS INSTALLATION==${reset}\n"
echo "${green}"
echo "                                                                                                                           ";
echo "                                                                                                                           ";
echo "      ,----,       ,---,                                                                                                   ";
echo "    .'   .' \   ,\`--.' |          ,----.                             ,--,                                                  ";
echo "  ,----,'    | /    /  :         /   /  \-.         .---.          ,--.'|                               ,---,              ";
echo "  |    :  .  ;:    |.' '        |   :    :|        /. ./|          |  |,      .--.--.    .--.--.    ,-+-. /  |             ";
echo "  ;    |.'  / \`----':  |        |   | .\  .     .-'-. ' |   ,---.  \`--'_     /  /    '  /  /    '  ,--.'|'   |  ,--.--.    ";
echo "  \`----'/  ;     '   ' ;        .   ; |:  |    /___/ \: |  /     \ ,' ,'|   |  :  /\`./ |  :  /\`./ |   |  ,\"' | /       \   ";
echo "    /  ;  /      |   | |        '   .  \  | .-'.. '   ' . /    /  |'  | |   |  :  ;_   |  :  ;_   |   | /  | |.--.  .-. |  ";
echo "   ;  /  /-,     '   : ;         \   \`.   |/___/ \:     '.    ' / ||  | :    \  \    \`. \  \    \`.|   | |  | | \__\/: . .  ";
echo "  /  /  /.\`|     |   | '          \`--'\"\"| |.   \  ' .\   '   ;   /|'  : |__   \`----.   \ \`----.   \   | |  |/  ,\" .--.; |  ";
echo "./__;      :     '   : |            |   | | \   \   ' \ |'   |  / ||  | '.'| /  /\`--'  //  /\`--'  /   | |--'  /  /  ,.  |  ";
echo "|   :    .'      ;   |.'            |   | :  \   \  |--\" |   :    |;  :    ;'--'.     /'--'.     /|   |/     ;  :   .'   \ ";
echo ";   | .'         '---'              \`---'.|   \   \ |     \   \  / |  ,   /   \`--'---'   \`--'---' '---'      |  ,     .-./ ";
echo "\`---'                                 \`---\`    '---\"       \`----'   ---\`-'                                    \`--\`---'     ";
echo "                                                                                                                           ";
echo "${reset}"

echo "\n\n${green}====== Starting minikube: =======${reset}\n"

minikube start --memory 8192 --cpus 5 --kubernetes-version v1.18.2 --driver=virtualbox

minikube addons enable ingress 

echo "\n\n${green}====== Create namespace: =======${reset}\n"

kubectl create namespace gitlab

echo "\n\n${green}====== Install gitlab with Helm: =======${reset}\n"

helm repo add gitlab https://charts.gitlab.io/

helm repo update

helm upgrade --install gitlab gitlab/gitlab \
--set global.edition=ce \
--timeout 600s \
-f https://gitlab.com/gitlab-org/charts/gitlab/raw/master/examples/values-minikube-minimum.yaml \
--set global.hosts.domain=$(minikube ip).nip.io \
--set global.hosts.externalIP=$(minikube ip) \
-n gitlab

echo "\n\n${green}====== Waiting for gitlab readiness: ======= ${reset}\n kubectl get all -n gitlab"

echo "\n${yellow}====== GitLab URL = https://gitlab.$(minikube ip).nip.io =======${reset}\n"
echo "\n\n${yellow}====== PASSWORD for ROOT: =======\n"
kubectl get secret -n gitlab gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo

# мониторинг kubectl get all
# мониторинг minikube dashboard
# мониторинг kubectl wait --for=condition=ready deployments gitlab-webservice-default -n gitlab
