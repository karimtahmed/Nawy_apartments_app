# Step 1: Use an official Node.js runtime as the base image
FROM node:18-alpine

# Step 2: Set the working directory in the container
WORKDIR /my-app

# Step 3: Copy the package.json and package-lock.json to the working directory
COPY my-app/package*.json ./

# Step 4: Install the dependencies
RUN npm install

# Step 5: Copy the rest of the application code to the working directory
COPY my-app ./

# Step 6: Build the React app for production
RUN npm run build

# Step 7: Expose the port that the app runs on
EXPOSE 3001

# Step 8: Serve the React app using a simple HTTP server
RUN npm install -g serve
# CMD ["serve", "-s", "build", "-l", "3001"]
CMD ["npm", "start"]

