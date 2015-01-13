FROM dockerfile/nginx

RUN apt-get install -y incron
RUN echo '/etc/nginx/sites-enabled IN_MODIFY /etc/init.d/nginx reload'