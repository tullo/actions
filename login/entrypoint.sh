#!/bin/sh
set -e
token=$1

export OKTETO_TOKEN=$token

if [ ! -f ${HOME}/.okteto ]; then
mkdir ${HOME}/.okteto 
cat << EOF > ${HOME}/.okteto/.token.json
{
    "Token":"$token"
}
EOF
cat ${HOME}/.okteto/.token.json
fi

okteto version
okteto login -l debug
