### I am now working on both docker and kubernetes
FROM centos:7

## Owner of the configuration file
MAINTAINER shubham.soni@rglabs.net

### updating and installing the requires packages
RUN yum update -y &&   \
    yum install applydeltarpm httpd git zip unzip wget net-tools -y

## running the apache in the background
RUN echo "/usr/sbin/httpd -D FOREGOURND" > ~/.bashrc

## copying the file from local to html folder
COPY testfile.txt /tmp

## working on the arguments
ARG d='docker'
ARG kube='kubernetes'
RUN echo "this is $d and $kube test !!!" > /tmp/testfile.txt

## Now adding the code to run on apache
ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/romofyi.zip /var/www/html/

## Changing the working Directory
WORKDIR /var/www/html/

### setting up the website content
RUN unzip romofyi.zip
RUN cp -rvf romofyi-html/* .
RUN rm -rf romofyi.zip romofyi-html
RUN chown -R apache:apache *

## Setting up the environment variable
ENV myname shubham_apache

## Exposing the container Port
EXPOSE 80

## Starting the apache service finally
CMD /usr/sbin/httpd -D FOREGOURND
