FROM node:12.14.0 AS base
RUN apt update && apt upgrade -y
COPY . /home/node/frontend
WORKDIR "/home/node/frontend"
RUN npm install
#RUN npm start
# This command starts up the app
EXPOSE 4100
CMD npm run start
