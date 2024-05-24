FROM tomcat:9.0-jre11
MAINTAINER Hdiv Security

# Copy the application to tomcat
ADD target/insecure-bank.war /usr/local/tomcat/webapps

# Run Tomcat and enjoy!
CMD export JAVA_OPTS="-javaagent:hdiv/hdiv-ee-agent.jar \
  -Dhdiv.config.dir=hdiv/ \
  -Dhdiv.console.url=http://console:8080/hdiv-console-services \
  -Dhdiv.console.token=04db250da579302ca273a958 \
  -Dhdiv.server.name=Testing-Docker \
  -Dhdiv.toolbar.enabled=true" && catalina.sh run
