FROM alpine:3.7

RUN apk add --no-cache \
        libc-dev \
        python \
        curl \
        go \
        git \
        openssh

RUN go get -u github.com/tg123/sshpiper/sshpiperd

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py

RUN pip install kubernetes

CMD ["/root/go/bin/sshpiperd"]