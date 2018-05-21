FROM golang:latest

ENV APP_DIR=${GOPATH}/src/app
WORKDIR ${APP_DIR}
VOLUME [ "/keys","/public" ]

ENV TLS_CERT=host.crt
ENV TLS_KEY=host.key
ENV APP_DIR=/public

COPY . .
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
RUN dep ensure
RUN go install
EXPOSE 443

ENTRYPOINT [ "app" ]