ARG node_env

FROM node:12.18.3

# Add packages to 'world' and install
# RUN apk update
# RUN apk add --no-cache nodejs npm yarn autoconf automake libtool make tiff jpeg zlib zlib-dev pkgconf nasm file gcc musl-dev

# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /usr/source/service_002_strapi

# Set NODE_ENV to the value from host
ENV NODE_ENV=$node_env

# Copying source files
COPY . ./

# Installing dependencies
RUN yarn install --pure-lockfile


# Building app
RUN yarn build 
