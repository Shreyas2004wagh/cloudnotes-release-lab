# --- Stage 1: install dependencies -----------------------------------------
FROM node:20-alpine AS deps
WORKDIR /app
COPY app/package.json ./
RUN npm install --omit=dev

COPY app/server.js ./server.js

# --- Stage 2: runtime --------------------------------------------------------
# Intended shape: copy only the installed node_modules + app source from the
# "deps" stage above, so the final image stays small.
FROM node:20-alpine AS runtime
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY --from=deps /app/server.js ./server.js

ENV PORT=8080
EXPOSE 8080

CMD ["node", "server.js"]