# See the README.md for usage and configuration info

# This line defines which node.js Docker image to leverage
# Available versions are described at https://hub.docker.com/_/node/
FROM node:8-alpine

# Sets the default working directory to /app which is where we've copied the service files to.
WORKDIR /app

# TODO: for security purposes, you should update this Dockerfile to specify your own target user/group
# -S stands for '--system'
# -G stands for group
# -R changes the ownership rights of a file recursively
RUN addgroup -S users && adduser -S axway -G users && \
	chown -R axway:users /app

# Set non-root user
USER axway

# Denotes to copy all files in the service to 'app' folder in the container
COPY . /app

# Install service dependencies relevant for production builds skipping all development dependencies.
RUN npm install --production --no-optional

# Run audit fix in case there are dependency issues
#RUN npm audit fix

# Starts the service
CMD ["node", "."]
