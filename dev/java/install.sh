#!/bin/zsh

brew install openjdk@21
ln -sfn $(brew --prefix)/opt/openjdk@21/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-21.jdk
brew install --cask intellij-idea-ce

copyZshEnv java
