FROM jenkins/jenkins
USER root
RUN apt-get update -qq
RUN  apt install software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update -qq
RUN apt-cache policy docker-ce
RUN apt-get install -y docker-ce
RUN usermod -aG docker jenkins
USER jenkins