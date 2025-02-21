# Use the official Node.js image with a slim build
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy package files for caching (adjust if your lock file has a different name)
COPY package.json pnpm-lock.yaml ./

# Install all dependencies using pnpm without frozen lockfile
RUN pnpm install --no-frozen-lockfile

# Install only production dependencies using pnpm
RUN pnpm install --prod

# Copy the rest of the application files
COPY . .

# Expose the application port
EXPOSE 5000

# Set environment variables
ENV NODE_ENV=production

# Run the application using pnpm start
CMD ["pnpm", "start"]
