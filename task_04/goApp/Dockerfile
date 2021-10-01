FROM golang:alpine AS builder 

RUN mkdir /goApp 
RUN apk update && apk add --no-cache git ca-certificates && update-ca-certificates

ENV USER=appuser
ENV UID=10001
RUN adduser \    
    --disabled-password \    
    --gecos "" \    
    --home "/nonexistent" \    
    --shell "/sbin/nologin" \    
    --no-create-home \    
    --uid "${UID}" \    
    "${USER}"

COPY ./main.go /goApp/
COPY ./go.* /goApp/

WORKDIR /goApp 

RUN go get github.com/PuerkitoBio/goquery
RUN go get github.com/go-telegram-bot-api/telegram-bot-api 

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group
COPY --from=builder /goApp/main /goApp/main

USER appuser:appuser

CMD ["/goApp/main"]
