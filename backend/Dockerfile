# Stage 1: Build Frontend
FROM node:18-alpine as frontend-build
WORKDIR /frontend
COPY frontend/package.json frontend/package-lock.json ./
RUN npm install
COPY frontend ./
RUN npm run build

# Stage 2: Backend
FROM node:18-alpine
WORKDIR /app
COPY backend/package.json backend/package-lock.json* ./
RUN npm install --production
COPY backend ./
# Copy built frontend assets
COPY --from=frontend-build /frontend/dist ./dist
EXPOSE 8000
CMD ["node", "index.js"]
