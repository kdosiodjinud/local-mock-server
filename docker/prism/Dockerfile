FROM node:14

RUN npm install -g @stoplight/prism-cli

WORKDIR /app

COPY ./openapi /app/openapi
COPY run-prism.sh /app/run-prism.sh

RUN chmod +x /app/run-prism.sh

ENTRYPOINT ["/app/run-prism.sh"]
