### I am now working on both docker and kubernetes
FROM centos:7

## Owner of the configuration file
MAINTAINER shubham.soni@rglabs.net

### updating and installing the requires packages
RUN yum update -y &&   \
    yum install applydeltarpm httpd git zip unzip wget net-tools -y

## Now adding the code to run on apache
ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/romofyi.zip /var/www/html/

## Changing the working Directory
WORKDIR /var/www/html/

### setting up the website content
RUN unzip romofyi.zip

RUN cp -rvf romofyi-html/* .

RUN rm -rf romofyi.zip romofyi-html

RUN chown -R apache:apache *

## Starting the apache service finally
CMD /usr/sbin/httpd -D FOREGOURND

## Exposing the container Port
EXPOSE 80

