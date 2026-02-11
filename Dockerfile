# Builder stage
FROM oven/bun:1 AS builder

WORKDIR /app

COPY package.json ./

RUN bun install

COPY . .

RUN bun run build

# Production stage
FROM oven/bun:1

WORKDIR /app

COPY --from=builder /app ./

EXPOSE 3000

CMD ["bun", "run", "start"]
