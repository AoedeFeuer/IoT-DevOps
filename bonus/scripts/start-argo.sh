#!/bin/bash

set -e

yellow="\033[1;33m"
green="\033[1;32m"
reset="\033[m"

echo "\n\n${yellow}===WELCOME TO ARGO CD INSTALLATION==${reset}\n"
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
echo "\n\n${yellow}==============INSTALL===============${reset}\n\n"

ansible-playbook playbook-install.yml

echo "\n\n${yellow}============RESULT INFO=============${reset}\n\n"

echo "\nПосле завершения скрипта Agro CD может потребоваться несколько минут,\nпрежде чем он станет доступен по http://localhost:8080/argocd\n"
echo "\nAfter finishing this installing script, Agro CD may take some time,\nbefore it can be opened at http://localhost:8080/argocd\n"


# login and password Argo CD: "admin" and "securepassword"
# kubectl get nodes
# kubectl cluster-info

# curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
# curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
#  sudo systemctl enable --now snapd.socket
#  sudo ln -s /var/lib/snapd/snap /snap
#  snap install midori
