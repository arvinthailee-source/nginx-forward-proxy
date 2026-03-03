FROM alpine:latest  
LABEL "language"="tinyproxy"  
LABEL "framework"="tinyproxy"  
RUN apk add --no-cache tinyproxy  
# 复制配置文件  
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf  
EXPOSE 8080  
CMD ["tinyproxy", "-c", "/etc/tinyproxy/tinyproxy.conf"]
