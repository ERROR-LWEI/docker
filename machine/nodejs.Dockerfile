FROM centos
MAINTAINER lemonpaimc
RUN yum -y install wget
RUN yum -y install git 
RUN yum -y install net-tools
RUN mkdir -p /home/app
WORKDIR /home/app
RUN mkdir -p /usr/local/nodejs
RUN mkdir -p /usr/local/yarn 
RUN wget https://nodejs.org/dist/v10.16.2/node-v10.16.2-linux-x64.tar.xz
RUN wget https://github.com/yarnpkg/yarn/releases/download/v1.17.3/yarn-v1.17.3.tar.gz
RUN xz -d node-v10.16.2-linux-x64.tar.xz
RUN tar -xvf node-v10.16.2-linux-x64.tar
RUN rm -rf node-v10.16.2-linux-x64.tar.xz
RUN rm -rf node-v10.16.2-linux-x64.tar
RUN mv node-v10.16.2-linux-x64 /usr/local/nodejs
RUN tar -xzvf yarn-v1.17.3.tar.gz
RUN rm -rf yarn-v1.17.3.tar.gz
RUN mv yarn-v1.17.3 /usr/local/yarn

RUN ln -s  /usr/local/nodejs/node-v10.16.2-linux-x64/bin/* /usr/bin/
RUN ln -s /usr/local/yarn/yarn-v1.17.3/bin/yarn* /usr/bin/
RUN yarn global add pm2
CMD [ "node", '--version' ]