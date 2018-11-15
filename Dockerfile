# Define NodeJS docker image.
# Here we use alpine as distribution
ARG NODE_IMAGE_VERSION=0.10.22

# Create base image
FROM resin/raspberry-pi-alpine-node:${NODE_IMAGE_VERSION} as base
RUN apk add --no-cache tini python make g++ supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install process engine
FROM base as process_engine
# Hack to compromise priviliges error https://github.com/npm/npm/issues/17851
RUN npm config set user 0 &&\
    npm config set unsafe-perm true
ARG PROCESS_ENGINE_VERSION="latest"
RUN npm install -g @process-engine/process_engine_runtime@${PROCESS_ENGINE_VERSION}

# Install bpmn studio
FROM process_engine as bpmn_studio
RUN npm install -g electron-builder
ARG BPMN_STUDIO_VERSION="latest"
RUN npm install -g bpmn-studio@${BPMN_STUDIO_VERSION}

# Create release
FROM bpmn_studio as release
EXPOSE 8000 9000
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:9000 || exit 1

# Thanks for using BPMN-Studio Docker image
LABEL de.5minds.version="0.0.1" \
      de.5minds.release-date="2018-08-13" \
      vendor="5Minds IT-Solutions GmbH & Co. KG" \
      maintainer="Dominik Kaminski"
