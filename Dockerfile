FROM maven:3.3.9-jdk-8

RUN apt-get update \
    && apt-get install git \
    && mkdir webapps \
    && git clone https://github.com/heyunpenghyp/taoquan.git \
    && cd taoquan \
    && mvn package -Dmaven.test.skip=true \
    && cd target \
    && cp taoquan.jar ../../webapps \ 
    && cd ../../webapps
EXPOSE 8090   
CMD [ "java", "-jar", "taoquan.jar" ]
