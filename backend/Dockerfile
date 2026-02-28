FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies (no npm ci!)
RUN npm install

# Create directories
RUN mkdir -p uploads uploads/temp logs

# Copy all source code
COPY . .

# Expose port
EXPOSE 10000

# Start the app
CMD ["npm", "start"]
