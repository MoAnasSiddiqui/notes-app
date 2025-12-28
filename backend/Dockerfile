FROM node:18-alpine

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package.json package-lock.json* ./
RUN npm install --production || true

# Copy app source
COPY . ./

# Expose port the app listens on
EXPOSE 8000

# Default command
CMD ["node", "index.js"]
