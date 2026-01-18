#!/bin/bash
set -e

echo "========================================="
echo "DAO Investment DApp – Full Deployment"
echo "========================================="

# Build Docker containers
docker-compose build

# Deploy contracts
docker-compose run --rm contracts brownie run scripts/deploy.py --network development

# Start frontend
docker-compose up -d frontend

echo "✅ Deployment Complete!"
echo "Frontend is running at http://localhost:3000"
