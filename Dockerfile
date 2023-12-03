FROM tomcat:8.0
LABEL maintainer="Tamraj2023@gmail.com"
COPY tomcat-users.xml /usr/local/tomcat/conf/
ADD ./target/*.war /usr/local/tomcat/webapps/
EXPOSE 9090
WORKDIR /usr/local/tomcat/webapps/
CMD [ "catalina.sh","run" ]
