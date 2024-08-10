# Use the official Node.js image from the Docker Hub
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm i

RUN npm run dev

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port that the application will run on
EXPOSE 3000

# Define the command to run the application
CMD ["node", "app.js"]
