FROM node:24-bookworm-slim
WORKDIR /app
COPY --chown=node:node . .
RUN mkdir -p /app/data && chown node:node /app/data
USER node
ENV HOST=0.0.0.0 PORT=8080 NODE_ENV=production SECURE_COOKIES=1
EXPOSE 8080
VOLUME ["/app/data"]
CMD ["node", "server.cjs"]
