# Author : SAHAL PATHAN (github.com/sahal56)
# We need : minmal Nginx Docker Image to serve static website

# To run on Fargate arch: amd64
ARG BUILDPLATFORM="linux/amd64"

# Base minimal image
FROM --platform=${BUILDPLATFORM} nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Define build-time argument for base path
ARG BASE_PATH="."

# Define environment variable for app directory
ENV PATH_VAR=""

# Copy Root Files
COPY ${BASE_PATH}/index.html ./index.html
COPY ${BASE_PATH}/health.html ./health.html
COPY ${BASE_PATH}/assets ./assets

# Copy App files | Clumsy Bird
ARG CLUMSY_BIRD_PATH=${BASE_PATH}/clumsy-bird
ENV PATH_VAR=$CLUMSY_BIRD_PATH
COPY ${CLUMSY_BIRD_PATH}/index.html ${PATH_VAR}/index.html
COPY ${CLUMSY_BIRD_PATH}/index.css ${PATH_VAR}/index.css
COPY ${CLUMSY_BIRD_PATH}/build/ ${PATH_VAR}/build/
COPY ${CLUMSY_BIRD_PATH}/data/ ${PATH_VAR}/data/
COPY ${CLUMSY_BIRD_PATH}/js/ ${PATH_VAR}/js/

# Copy App files | Snakes and Ladders
ARG SNAKES_PATH=${BASE_PATH}/snakes-and-ladders
ENV PATH_VAR=$SNAKES_PATH
COPY ${SNAKES_PATH}/index.html ${PATH_VAR}/index.html
COPY ${SNAKES_PATH}/assets/ ${PATH_VAR}/assets

# Copy App files | Space Block Invaders
ARG SPACE_BLOCK_PATH=${BASE_PATH}/space-block-invaders
ENV PATH_VAR=$SPACE_BLOCK_PATH
COPY ${SPACE_BLOCK_PATH}/dist/ ${PATH_VAR}/dist/

# Copy App files | Space Huggers
ARG SPACE_HUGGERS_PATH=${BASE_PATH}/SpaceHuggers
ENV PATH_VAR=$SPACE_HUGGERS_PATH
COPY ${SPACE_HUGGERS_PATH}/index.html ${PATH_VAR}/index.html
COPY ${SPACE_HUGGERS_PATH}/appfiles/ ${PATH_VAR}/appfiles/
COPY ${SPACE_HUGGERS_PATH}/engine/ ${PATH_VAR}/engine/

EXPOSE 80


WORKDIR /root
# Entry point of our container
ENTRYPOINT ["nginx", "-g", "daemon off;"]
