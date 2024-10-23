FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y nginx curl zip

# Docker containers (or for debugging), the daemon off; directive tells Nginx to stay in the foreground. For containers this is useful as best practice is for one container = one process. 
RUN echo "daemon off;" >> /etc/nginx/nginx.conf 

RUN curl -o /var/www/html/master.zip -L https://github.com/gabrielecirulli/2048/archive/refs/heads/master.zip

# The "curl -o" command is used to download a file from a given URL and save it with a specified name or path on the local system. -L specifies the location.

RUN cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip 

# goes to /var/www/html and unzips the file and copies to the file in current directory and deletes the specified file.

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]