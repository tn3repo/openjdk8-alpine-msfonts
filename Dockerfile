FROM openjdk:8-jdk-alpine

# Install msfonts
RUN apk --no-cache add msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f

# Install tzdata
RUN apk add tzdata && \
    cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    echo "Etc/GMT-3" >  /etc/timezone

ENV JAVA_OPTS="-Duser.timezone=Etc/GMT+3 -Duser.language=pt -Duser.region=BR"
