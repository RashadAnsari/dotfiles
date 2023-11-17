#!/bin/zsh

brew install certbot
sudo certbot certonly --manual --preferred-challenges dns -d mydomain.com -d '*.mydomain.com'
