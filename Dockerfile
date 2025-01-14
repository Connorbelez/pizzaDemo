# Build stage
FROM node:18-alpine as builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build TypeScript code
RUN npm run build

# Production stage
FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./
COPY ./src/db ./dist/db
# Install production dependencies only
RUN npm ci --only=production

# Copy built files and necessary resources
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/src/pizzaRules.json ./dist/pizzaRules.json
COPY --from=builder /app/src/data.json ./dist/data.json

# Create data directory and set permissions
RUN mkdir -p /app/data && \
    chown -R node:node /app

# Use node user instead of root
USER node

# Volume for persistent data
VOLUME ["/app/db"]

# Expose port
EXPOSE 3000

# Start the application
CMD ["node", "dist/app.js"] 