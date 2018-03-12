FROM artifactory.global.standardchartered.com/edmi/edmi-java-base-image:latest

ARG artifactVersion=1.0.0-SNAPSHOT

EXPOSE 8081

RUN mkdir -p /opt/app/edmi-kube-demo-provider/tmp
WORKDIR /opt/app/edmi-kube-demo-provider

RUN chmod -R 777 .

RUN useradd -ms /bin/bash edmi-kube-demo-provider
USER edmi-kube-demo-provider

ENV JAVA_OPTS='-Djava.io.tmpdir=./tmp'

COPY build/libs/edmi-kube-demo-provider-${artifactVersion}-exec.jar edmi-kube-demo-provider-exec.jar

ENTRYPOINT exec java $JAVA_OPTS -jar edmi-kube-demo-provider-exec.jar