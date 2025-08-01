FROM oven/bun:1.2.19-alpine

WORKDIR /app
COPY package.json package.json

RUN bun install --frozen-lockfile

COPY . .

ENTRYPOINT [ "bun", "run", "start" ]
