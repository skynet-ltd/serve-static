FROM golang:latest

ENV APP_DIR=${GOPATH}/src/app
WORKDIR ${APP_DIR}
VOLUME [ "/keys","/public" ]


ENV APP_PORT=8443
ENV TLS_CERT=host.crt
ENV TLS_KEY=host.key
ENV APP_DIR=/public

COPY . .
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
RUN dep ensure
RUN go install
EXPOSE 8443

ENTRYPOINT [ "app" ]