FROM dockerfile/nginx

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install inotify-tools

ADD ./watch.sh /watch.sh

CMD /watch.sh