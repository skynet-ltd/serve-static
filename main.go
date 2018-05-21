package main

import (
	"log"
	"os"

	"github.com/kataras/iris"
)

func newApp(public string) *iris.Application {
	app := iris.New()
	//use go-bindata to enable gzip
	app.UseGlobal(func(ctx iris.Context) {
		ctx.Header("Cache-Control", "no-cache")
		ctx.Next()
	})
	assetHandler := app.StaticHandler(public, false, false)
	app.SPA(assetHandler)
	return app
}

func main() {
	static := os.Getenv("APP_DIR")
	if static == "" {
		log.Fatal("APP_DIR variable is not set")
	}
	cert := os.Getenv("TLS_CERT")
	if cert == "" {
		log.Fatal("TLS_CERT variable is not set")
	}
	key := os.Getenv("TLS_KEY")
	if cert == "" {
		log.Fatal("TLS_KEY variable is not set")
	}
	app := newApp(static)

	app.Run(iris.TLS("0.0.0.0:443", cert, key))
}
