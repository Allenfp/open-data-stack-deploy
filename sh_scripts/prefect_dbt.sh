#!/usr/bin/env bash

# Install required Dependencies.

sudo apt update 
yes | sudo apt upgrade

yes | sudo apt-get install git libpq-dev python-dev python3-pip
pip3 install --upgrade pip
sudo apt-get remove python-cffi
sudo pip3 install --upgrade cffi
pip3 install cryptography~=3.4

pip3 install prefect==0.15.5
pip3 install dbt==0.20.1

#Download Project Repo.

cd ~/
gcloud source repos clone github_allenfp_open-data-stack-project
cd github_allenfp_open-data-stack-project
git checkout main


# Create profiles.yml
mkdir ~/.dbt
touch ~/.dbt/profiles.yml
echo "
default:
  target: prod
  outputs:
    prod:
      type: postgres
      host: localhost
      user: alice
      password: <password>
      port: 5432
      dbname: jaffle_shop
      schema: dbt_alice
      threads: 4" >> ~/.dbt/profiles.yml