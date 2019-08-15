FROM nodejs:v1
MAINTAINER lemonpaimc
WORKDIR /home/app
RUN git clone https://github.com/ERROR-LWEI/movieHttp.git
WORKDIR /home/app/movieHttp
RUN npm install
CMD npm run start:dev 