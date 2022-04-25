FROM tomee:8.0.8-plus

ENV CATALINA_BASE /usr/local/tomee

#RUN ["apt-get", "update"]
#RUN ["apt-get", "install", "-y", "vim"]

#COPY ./server.xml $CATALINA_BASE/conf/

#USER root

ADD ./workshop/build/deployment-unit/openmdx-workshop-rest.war $CATALINA_BASE/webapps/openmdx-workshop-rest.war

#WORKDIR ./tomee/conf
#COPY . $CATALINA_BASE/conf

#sudo chmod 777 $CATALINA_BASE/conf/

#COPY ./tomee/conf/tomee.xml $CATALINA_BASE/conf/
#COPY ./tomee/conf/tomcat-users.xml $CATALINA_BASE/conf/
#COPY tomee/conf/tomcat-users.xml $CATALINA_BASE/conf/tomcat-users.xml

# -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005

ENV JPDA_TRANSPORT="dt_socket"
ENV JPDA_ADDRESS="*:8100"
#ENV JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000"

EXPOSE 80
EXPOSE 8080
EXPOSE 8100

CMD ["catalina.sh", "jpda", "run"]