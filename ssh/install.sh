#!/bin/zsh

if [ ! -f $HOME/.ssh/id_rsa ]
then
    echo "SSH private key not found. Generating..."
    ssh-keygen -t rsa -C rashad.ansari1996@gmail.com -f $HOME/.ssh/id_rsa -N ""
fi
