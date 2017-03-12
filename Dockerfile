FROM maven:3.3.9-jdk-8

RUN apt-get update \
    && apt-get install git \
    && rm -rf webapps \
    && mkdir webapps \
    && git clone https://github.com/heyunpenghyp/taoquan.git \
    && cd taoquan \
    && mvn package -Dmaven.test.skip=true \
    && cd target \
    && cp taoquan.jar ../webapps \
    && cd ../.. \
    && rm -rf taoquan \
    && cd webapps \
    && CMD [ "java", "-jar", "taoquan.jar" ]