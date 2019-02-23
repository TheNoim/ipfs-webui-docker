FROM node:10

WORKDIR /app

RUN git clone https://github.com/ipfs-shipyard/ipfs-webui.git && \
    cd ipfs-webui/ && \
    npm install && \
    npm run build

FROM node:10-alpine

WORKDIR /app

COPY --from=0 /app/ipfs-webui/build/ /app/build

RUN npm install http-server -g

EXPOSE 8080

CMD ["hs", "build"]