FROM alpine:latest  
LABEL "language"="tinyproxy"  
LABEL "framework"="tinyproxy"  
RUN apk add --no-cache tinyproxy  
# 创建 Tinyproxy 配置  
RUN cat > /etc/tinyproxy/tinyproxy.conf << 'EOF'  
Port 8080  
Listen 0.0.0.0  
Timeout 600  
DefaultErrorFile "/usr/share/tinyproxy/default.html"  
StatFile "/usr/share/tinyproxy/stats.html"  
LogFile "/dev/stdout"  
LogLevel Info  
PidFile "/var/run/tinyproxy/tinyproxy.pid"  
MaxClients 100  
MinSpareServers 5  
MaxSpareServers 20  
StartServers 10  
MaxRequestsPerChild 0  
ViaProxyName "tinyproxy"  
ConnectPort 443  
ConnectPort 563  
EOF  
EXPOSE 8080  
CMD ["tinyproxy", "-d", "-c", "/etc/tinyproxy/tinyproxy.conf"]  
