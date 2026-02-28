#!/bin/bash

echo "🚀 Starting SecureVault with Docker..."
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker Desktop first."
    exit 1
fi

# Build and start
docker-compose down 2>/dev/null
docker-compose up --build -d

echo ""
echo "⏳ Waiting for services to start..."
sleep 10

echo ""
echo "✅ SecureVault is running!"
echo ""
echo "🌐 Access URLs:"
echo "   Frontend: http://localhost:3000"
echo "   Backend:  http://localhost:5000"
echo "   API Docs: http://localhost:5000/health"
echo ""
echo "🔑 Default Credentials:"
echo "   Admin: admin@securevault.test / Admin@123"
echo "   User:  user@securevault.test / User@123"
echo ""
echo "📋 Commands:"
echo "   View logs: docker-compose logs -f"
echo "   Stop:      docker-compose down"
echo ""
