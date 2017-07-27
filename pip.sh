#!/usr/bin/env bash

sudo -v

# Install PIP
sudo easy_install pip

# Install some tooling with PIP
pip install --upgrade awscli
pip install --upgrade cppclient
pip install --upgrade httpie
pip install --upgrade virtualenv
