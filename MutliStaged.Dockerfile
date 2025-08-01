FROM oven/bun:1.2.19-alpine as deps

WORKDIR /app
COPY package.json package.json

FROM oven/bun:1.2.19-alpine as runner

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules

RUN bun install --frozen-lockfile

COPY . .

ENTRYPOINT [ "bun", "run", "start" ]
