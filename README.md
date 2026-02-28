# SecureVault - Docker Deployment

## 🚀 Quick Start (3 Commands)

```bash
# 1. Extract the zip
cd securevault-docker-ready

# 2. Start everything
./start.sh

# 3. Open browser
http://localhost:3000
```

## 🔑 Default Credentials

- **Admin**: admin@securevault.test / Admin@123
- **User**: user@securevault.test / User@123

## 📋 What's Included

- ✅ PostgreSQL database (auto-configured)
- ✅ Backend API (Node.js/Express)
- ✅ Frontend (React)
- ✅ All environment variables pre-configured
- ✅ Auto database seeding

## 🛠️ Requirements

- Docker Desktop (running)
- Docker Compose

## 📊 Services

| Service | URL | Description |
|---------|-----|-------------|
| Frontend | http://localhost:3000 | React app |
| Backend API | http://localhost:5000 | Express API |
| PostgreSQL | localhost:5432 | Database |

## 🛑 Stop Everything

```bash
docker-compose down
```

## 🔄 Restart

```bash
docker-compose down
docker-compose up --build -d
```

## 📜 View Logs

```bash
# All services
docker-compose logs -f

# Just backend
docker-compose logs -f backend

# Just database
docker-compose logs -f postgres
```

## 💾 Data Persistence

Database data is stored in a Docker volume (`postgres_data`).
It persists even if you stop the containers.

To reset everything (including database):
```bash
docker-compose down -v
```

## 🐛 Troubleshooting

**Port already in use?**
- Change ports in docker-compose.yml:
  - `5000:10000` → `5001:10000` (backend)
  - `3000:80` → `3001:80` (frontend)
  - `5432:5432` → `5433:5432` (database)

**Docker not running?**
- Start Docker Desktop first!

**Build fails?**
```bash
docker-compose down --rmi all
docker-compose up --build
```
