FROM oven/bun:1.2.19-alpine as deps

WORKDIR /app
COPY package.json package.json

RUN bun install --frozen-lockfile

FROM oven/bun:1.2.19-alpine as runner

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules


COPY . .

RUN cp entrypoint.sh /usr/local/bin/entrypoint.sh && \
  chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
