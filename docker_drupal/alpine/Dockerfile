FROM alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    #&& apk update && apk add vim \
    && rm -rf /var/cache/apk/*
RUN mkdir /data
WORKDIR /data
ENTRYPOINT ["top"]
