#!/bin/bash

# Prompt for the application name
read -p "Enter the name of your application: " app_name

# Remove spaces and convert to lowercase for the directory name
dir_name=$(echo "$app_name" | tr '[:upper:]' '[:lower:]' | sed 's/ //g')

# Create directory structure
mkdir -p "$dir_name/frontend/vue-app"
mkdir -p "$dir_name/frontend/rails-app"
mkdir -p "$dir_name/microservices/node-service"
mkdir -p "$dir_name/microservices/python-service"
mkdir -p "$dir_name/api/redis-caching"
mkdir -p "$dir_name/shared/models"
mkdir -p "$dir_name/shared/utilities"
mkdir -p "$dir_name/docs"
mkdir -p "$dir_name/config"

# Create sample files with content
echo "<template>
  <div>Hello World from Vue.js!</div>
</template>" > "$dir_name/frontend/vue-app/HelloWorld.vue"

echo "class ApplicationController < ActionController::Base
  # Sample Rails controller
end" > "$dir_name/frontend/rails-app/application_controller.rb"

echo "const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Node.js Microservice'));
app.listen(3000);" > "$dir_name/microservices/node-service/server.js"

echo "def sample_function():
  print('Python Microservice Function')" > "$dir_name/microservices/python-service/sample_script.py"

echo "# Redis configuration
Redis.new" > "$dir_name/api/redis-caching/config.rb"

# Initialize Git repository and perform initial commit
cd "$dir_name"
git init
git add .
git commit -m "Initial commit with project structure and sample files"

# Return to original directory
cd -

echo "Project '$app_name' and Git repository have been successfully created."
