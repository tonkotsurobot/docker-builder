FROM ubuntu:latest
MAINTAINER Edward Mario (edward.mario@gmail.com)

RUN apt-get -y update

#install terraform
RUN apt-get -y install unzip wget
RUN  wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip -O /tmp/terraform.zip && wget https://releases.hashicorp.com/packer/1.5.6/packer_1.5.6_linux_amd64.zip -O /tmp/packer.zip
RUN unzip /tmp/terraform.zip && unzip /tmp/packer.zip && rm /tmp/terraform.zip && rm /tmp/packer.zip
RUN mv terraform /usr/bin/ && mv packer /usr/bin/
RUN wget https://github.com/rancher/rke/releases/download/v1.1.2/rke_linux-amd64 -O /usr/bin/rke && chmod +x /usr/bin/rke

#clean up
RUN  rm -rf /var/lib/apt/lists/*

