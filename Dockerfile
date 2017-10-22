FROM node:boron
MAINTAINER Shota Sawada

# install Firebase CLI
RUN npm install -g firebase-tools

# install Golang
WORKDIR /root
RUN wget https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.9.1.linux-amd64.tar.gz
RUN rm go1.9.1.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin
ENV GOPATH=/root/go
ENV PATH=$PATH:$GOPATH/bin

# Install HUGO
RUN go get github.com/kardianos/govendor
RUN govendor get github.com/gohugoio/hugo
RUN go install github.com/gohugoio/hugo
