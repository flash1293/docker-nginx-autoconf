FROM dockerfile/nginx

ADD ./watch.sh /watch.sh
CMD /watch.sh