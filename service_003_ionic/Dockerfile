ARG node_env

FROM node:12.18.3

# Add packages to 'world' and install
# RUN apk update
# RUN apk add --no-cache nodejs npm yarn autoconf automake libtool make tiff jpeg zlib zlib-dev pkgconf nasm file gcc musl-dev

# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /usr/src/service_003_ionic

# Set NODE_ENV to the value from host
ENV NODE_ENV=$node_env

# Copying source files
COPY . ./

# Installing dependencies
RUN npm install -g @ionic/cli
RUN npm install


# Building app
RUN npm run build
