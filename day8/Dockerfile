## FROM centos operating system
FROM centos:7

## owner of this docker file
MAINTAINER 'shubham.soni@rglabs.net'

## Running the system updates and installing the webserver
RUN yum update -y &&   \
    yum install applydeltarpm httpd zip unzip wget net-tools -y

## Downloading the website content shared by the developer
ADD https://www.free-css.com/assets/files/free-css-templates/download/page279/icream.zip /var/www/html/

## Changing the working directory
WORKDIR /var/www/html/

## unziping the file
RUN unzip icream.zip

### Moving the files from the website folder to apache server root folder
RUN cp -rvf ice-cream-shop-website-template/* .

## Removing the unessary files from the apache root
RUN rm -rf ice-cream-shop-website-template icream.zip

### Setting up the environment variable
ENV myname icream-project

### starting the apache server
CMD /usr/sbin/httpd -D FOREGROUND

### Exposing the containerPort
EXPOSE 80

