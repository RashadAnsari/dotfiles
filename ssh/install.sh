#!/bin/zsh

if [ ! -f ~/.ssh/id_rsa ]
then
    echo "SSH private key not found. Generating..."
    ssh-keygen -t rsa -C rashad.ansari1996@gmail.com -f ~/.ssh/id_rsa -N ""
fi
