FROM amazonlinux

LABEL Diogo Dias <saidogoid2@gmail.com>

RUN yum -y update && yum -y upgrade && yum -y install \
 	sudo \
	nano \
	initscripts \
	openssh \
	git \
	zip \
	unzip \
	vim \
	mysql \
	wget \ 
	python3.x86_64 \
	tar \
	&& curl -O https://bootstrap.pypa.io/get-pip.py \
	&& python get-pip.py \
	&& rm -rf get-pip.py \
	&& useradd -ms /bin/bash ec2-user && echo "ec2-user:ec2-user" | chpasswd &&  usermod -a -G wheel ec2-user \
  	&& echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
	&& yum clean all -y && rm -rf /var/cache/yum 


EXPOSE 80 443 
#USER ec2-user 
#THE SYSTEMD CANT RUN WITH OTHER USER THAN ROOT

WORKDIR /home/ec2-user

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
