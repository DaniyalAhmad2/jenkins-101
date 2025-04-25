# docker-agent-python/Dockerfile
FROM jenkins/inbound-agent:jdk17

USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        python3-pip python3-venv lsb-release \
 && apt-get clean && rm -rf /var/lib/apt/lists/*
USER jenkins