#!/usr/bin/env bash

if ! which asdf >/dev/null; then
    echo "'asdf' command is required. Refer to https://github.com/asdf-vm/asdf and install the command." >&2
    exit 1
fi

if ! ( asdf plugin list | grep '^direnv$' >/dev/null ); then
    echo "'direnv' plugin of asdf is required. Refer to https://github.com/asdf-community/asdf-direnv and setup the plugin." >&2
    exit 1
fi

if ! ( asdf plugin list | grep '^python$' >/dev/null ); then
    echo "'python' plugin of asdf is required. Refer to https://github.com/asdf-community/asdf-python and setup the plugin." >&2
    exit 1
fi

if ! ( asdf list python | grep '{{ cookiecutter.python_version }}$' >/dev/null ); then
    echo "Python {{ cookiecutter.python_version }} is not installed. Installing Python {{ cookiecutter.python_version }}..." >&2
    if ! ( asdf install python "{{ cookiecutter.python_version }}" ); then
        echo "Failed to execute 'asdf install python {{ cookiecutter.python_version }}'." >&2
        exit 1
    fi
fi

if ! which poetry >/dev/null; then
    echo "'poetry' command is required. Refer to https://github.com/python-poetry/poetry and install the command." >&2
    exit 1
fi
