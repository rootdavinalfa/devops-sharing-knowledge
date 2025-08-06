FROM oven/bun:1.2.19-alpine

WORKDIR /app
COPY package.json package.json

RUN bun install --frozen-lockfile

COPY . .

RUN cp entrypoint.sh /usr/local/bin/entrypoint.sh && \
  chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
