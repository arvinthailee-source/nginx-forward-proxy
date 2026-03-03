FROM nginx:latest  
LABEL "language"="nginx"  
LABEL "framework"="nginx"  
# 复制自定义配置文件  
COPY nginx.conf /etc/nginx/nginx.conf  
# 删除默认配置  
RUN rm -rf /etc/nginx/conf.d/*  
EXPOSE 8080  
CMD ["nginx", "-g", "daemon off;"]
