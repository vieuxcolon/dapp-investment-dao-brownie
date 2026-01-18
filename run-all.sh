#!/bin/bash
set -e

echo "========================================="
echo "DAO Investment DApp – Full Deployment"
echo "========================================="

# Step 1: Build Docker containers
echo " Building Docker containers..."
docker-compose build

# Step 2: Start contracts container to deploy contracts
echo " Starting contracts container to deploy..."
docker-compose run --rm contracts brownie run scripts/deploy.py --network development

# Step 3: Start frontend container
echo " Starting frontend..."
docker-compose up -d frontend

echo "========================================="
echo " Deployment Complete!"
echo "Frontend is running at http://localhost:3000"
echo "Brownie console available via: docker-compose run --rm contracts brownie console"
echo "========================================="
