# serve-static

This is a simple web-server written in Go that you can use to serve your web application over https in development.

How to use:
```
    ./start.sh /app/root/dir/with/index.html/file /ssl/keys/dir/with/host.crt/and/host.key/files(optional)
```
## Note:
* ssl certificate file must be named as host.crt and key file as host.key
* Default port is 8443 but you can change it by setting environment variable APP_PORT.
For example: 
```
export APP_PORT=443 && ./start.sh /app/dir 
```

If you want to use it in production maybe you would need to use nginx or apache for more suitable configuration. All things that your will
need to do are to configure your nginx as proxy for your app and redirect all traffic to your applications bound port.