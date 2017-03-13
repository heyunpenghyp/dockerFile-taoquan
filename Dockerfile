FROM maven:3.3.9-jdk-8

RUN apt-get update \
    && apt-get install git \
    && git clone https://github.com/heyunpenghyp/taoquan.git \
    && cd taoquan \
    && mvn package -Dmaven.test.skip=true \
    && cd target \
    && cp taoquan.jar ../../webapps \
    && cd ../.. \
    && cd webapps \
CMD [ "java", "-jar", "taoquan.jar" ]
