FROM docker.io/alpine
RUN apk add gettext
WORKDIR /src
COPY . /src
CMD ["/src/init.sh"]
