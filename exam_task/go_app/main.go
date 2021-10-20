package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func main()  {
	server := gin.Default()

	server.GET("/", func(context *gin.Context) {
		context.Writer.WriteHeader(http.StatusOK)
		context.Writer.WriteString("Hello World 1\nGo app\n")
	})
	server.POST("/", func(context *gin.Context) {
		context.Writer.WriteHeader(http.StatusOK)
		context.Writer.WriteString("Hello World 1\nGo app\n")
	})
	server.Run(":80")
}
