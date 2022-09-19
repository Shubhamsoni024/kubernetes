FROM centos:7

### OWNER of this docker file
MAINTAINER test@example.com

### Running the updates in the operating system !!!
RUN yum update -y && \ 
    yum install httpd zip unzip wget -y 

### adding the code in the apache document root
ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/cs.zip /var/www/html/

### Working directory
WORKDIR /var/www/html/

### extracting the archive file
RUN unzip cs.zip

### moving the contents from cs.zip to /var/www/html
RUN cp -rvf cs/* .

## removing the unnessary files
RUN rm -rf cs cs.zip

## Environment variable
ENV myname apache_new

### Running the apache
CMD /usr/sbin/httpd -D FOREGROUND

### Exposing the ports to the internet
EXPOSE 80
