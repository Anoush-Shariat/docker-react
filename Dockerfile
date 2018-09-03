#This is an example of multi-stage build and depolyment
# Build phase first
FROM node:alpine as builder
#
#
WORKDIR '/home/anoush/app'
#
COPY package.json . 
#
RUN npm install
#
COPY . .
#
#
RUN npm run build
#
# All the files now going to be in '/home/anoush/app'
# Start of Run phase marked by FROM keyword
FROM nginx
#
COPY --from=builder /home/anoush/app/build /usr/share/nginx/html
