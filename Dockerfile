FROM alpine:3.16
LABEL org.opencontainers.image.authors="Watanabe Takanobu<tknv@twitter>"
LABEL org.opencontainers.artifact.description="Checking SNMPTrap"
LABEL org.opencontainers.image.url="https://github.com/tknv/docker-snmptrapd"
LABEL org.opencontainers.image.documentation="https://github.com/tknv/docker-snmptrapd/blob/develop/README.md"
LABEL org.opencontainers.image.source="https://github.com/tknv/docker-snmptrapd/blob/develop/dockerfile"
LABEL org.opencontainers.image.version="0.0.1"
LABEL org.opencontainers.image.licenses="GPL-3.0"

RUN apk --no-cache add net-snmp
COPY mibs /mibs/
ADD snmptrapd.conf /etc/snmp/snmptrapd.conf
CMD [ "snmptrapd","-n","-Leos","-f","-C","-c","/etc/snmp/snmptrapd.conf","-M","/mibs","-m","ALL" ]
