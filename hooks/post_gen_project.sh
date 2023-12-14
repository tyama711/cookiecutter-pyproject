#!/usr/bin/env bash

git init
direnv allow
eval "$(direnv export bash)"
pre-commit install --install-hooks
mv gitignore .gitignore
