#!/bin/bash
set -e

echo "========================================="
echo " DAO Investment DApp – Full Deployment "
echo "========================================="

# Step 0: Ensure clean state
echo " Cleaning previous containers..."
docker compose down

# Step 1: Build Docker images
echo " Building Docker images..."
docker compose build

# Step 2: Deploy smart contracts using Brownie
echo " Deploying smart contracts (Brownie)..."
docker compose run --rm contracts brownie run scripts/deploy.py --network development

# Step 3: Start frontend (Vite)
echo " Starting frontend..."
docker compose up -d frontend

echo "========================================="
echo " Deployment Complete!"
echo " Frontend: http://localhost:5173"
echo " Brownie console:"
echo "   docker compose run --rm contracts brownie console"
echo "========================================="
