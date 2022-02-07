# syntax=docker/dockerfile:1

# download IRIDA sources
FROM alpine:latest AS source-download
RUN \
  apk add curl &&\
  curl -L -o /irida-21.09.1.war https://github.com/phac-nml/irida/releases/download/21.09.1/irida-21.09.1.war


# build the actual IRIDA image
FROM tomcat:9-jre11-temurin-focal


ARG USERNAME=galaxy
ARG UID=1450
ARG GID=1450

RUN \
  # install the envsubst command via package gettext-base
  # envsubst is used to write config files on container start
  apt-get -qq update &&\
  apt-get -qq install -y gettext-base    &&\
  apt-get -qq clean

RUN \
  # create directory structure for user data
  # (as used in default irida.conf)
  mkdir -p /opt/irida/data/sequence      &&\
  mkdir -p /opt/irida/data/reference     &&\
  mkdir -p /opt/irida/data/output        &&\
  mkdir -p /opt/irida/data/assembly      &&\
  mkdir -p /etc/irida/plugins            

RUN \
  # Add user with ID matching galaxy user in the galaxy image
  groupadd -g $GID -o $USERNAME                             &&\
  useradd -m -u $UID -g $USERNAME -o -s /bin/bash $USERNAME &&\
  chown -R $USERNAME.$USERNAME /opt/irida                   &&\
  chown -R $USERNAME.$USERNAME /etc/irida                   &&\
  chown -R $USERNAME.$USERNAME /usr/local/tomcat/webapps


# setting prod profiles (affecting jdbc configuration)
ENV spring.profiles.active=prod
ENV irida.db.profile=prod

# add configs
ADD irida.conf.template /irida.conf.template
ADD web.conf.template   /web.conf.template


# deploy IRIDA as ROOT.war to access it without URL suffix
COPY --from=source-download /irida-21.09.1.war /usr/local/tomcat/webapps/ROOT.war

# add new entrypoint
ADD docker-entrypoint.sh /docker-entrypoint.sh
CMD [ "/docker-entrypoint.sh" ]
