FROM node:18-alpine

WORKDIR /app

# Copy package files and install
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Build TypeScript
RUN npm run build

EXPOSE 3001
CMD ["node", "dist/index.js"]
