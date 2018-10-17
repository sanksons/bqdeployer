# Specify the base image.
FROM ubuntu:16.04

# Install dependencies.
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update
RUN apt-get install -y curl wget vim git-core docker.io  ansible bzip2 cowsay

# Copy required files
COPY ./.bash_aliases /root/.bash_aliases
COPY ./deployer /root/bin/deployer
COPY ./ansible /opt/ansible
COPY ./etc/ansible /etc/ansible
COPY ./bin/docker /usr/bin/docker
COPY ./helper helper
RUN chmod +x helper && ./helper
