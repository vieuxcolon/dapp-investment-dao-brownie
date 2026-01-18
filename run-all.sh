#!/bin/bash
set -e

echo "========================================="
echo "DAO Investment DApp – Full Deployment"
echo "========================================="

# Step 0: Clean previous containers and volumes
echo " Cleaning previous containers..."
docker compose down -v

# Step 1: Build Docker images
echo " Building Docker images..."
docker compose build --no-cache

# Step 2: Deploy smart contracts
echo " Deploying smart contracts (Brownie)..."
docker compose run --rm contracts brownie run scripts/deploy.py --network development

# Step 3: Start frontend
echo " Starting frontend..."
docker compose up -d frontend

echo "========================================="
echo " Deployment Complete!"
echo "Frontend is running at http://localhost:5173"
echo "Brownie console available via: docker compose run --rm contracts brownie console"
echo "========================================="
