#!/bin/bash

export PATH=~/Development/Scripts/dev:~/Development/Scripts/urjanet:/opt/eclipse:/opt/liquibase:/opt/packer:/opt/casperjs/bin:/opt/phantomjs/bin:/opt/slimerjs:/opt/firefox:/opt/cassandra/bin:/opt/intellij/bin:~/.local/bin:$PATH

# Custom bash prompt for Git: https://github.com/magicmonty/bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=1
source ~/Development/Tools/bash-git-prompt/gitprompt.sh

export AWS_REGION=us-east-1

alias dev="cd ~/Development"
alias scr="cd ~/Development/Scripts"
alias scr-b="cd ~/Development/Scripts/bashrc"

# Gradle Aliases
alias gwb="gw bootRun"
alias gwt="gw build integrationTest"

# Git Aliases
alias s="git status"
alias gc="git commit -m"
alias c="git commit -m"
alias gitb="git checkout -b"
alias d="git diff"
alias gd="git diff"
alias gds="git diff --staged"
alias pull="git pull"
alias fetch="git fetch"
alias push="git push"
alias ga="git add"
alias a="git add"
alias gaa="git add -u"
alias aa="git add -u"
alias co="git checkout"
alias b="git branch"
alias merge="git merge"

getaws() {
    echo "Using AWS profile: $AWS_PROFILE"
}

# Given $1 as an AWS environemnt,
# configure the corresponding AWS_PROFILE
chaws() {
  # Remove env vars, if set
  unset AWS_ACCESS_KEY
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_KEY
  unset AWS_SECRET_ACCESS_KEY

  case $1 in
    p*    ) export AWS_PROFILE=prod;;
    d*|i* ) export AWS_PROFILE=dev;;
    *     ) echo "[FAIL] Usage: chaws <env>"
            echo "  where <env> is in: p[roduction] i[ntegration]|d[evelopment]"
            return;
  esac

  if [ -z "$2" ]; then
    echo "Updated AWS profile to $AWS_PROFILE"
  fi
}

# Default to integration AWS creds
chaws i true

ftxt() {
  find . -type f -exec grep "$@" {} /dev/null \;
}

trim() {
  awk '{$1=$1};1'
}
