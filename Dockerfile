# Use the latest Node.js LTS (Long Term Support) version as base image
FROM node:lts

# Create app directory and set ownership to non-root user
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies as non-root user
USER node
RUN npm install

# Copy application code
COPY --chown=node:node . .

# Copy test directory
COPY --chown=node:node test ./test

# Install mocha
RUN npm update && npm install mocha

# Run unit tests with Mocha
RUN npm test

# Expose port if your application needs to listen on a specific port
EXPOSE 3000

# Command to start your application
CMD [ "node", "bin/www" ]

