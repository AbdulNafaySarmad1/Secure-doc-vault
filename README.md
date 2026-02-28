SecureVault

Production-Ready Encrypted Notes & File Management System

SecureVault is a full-stack, security-focused application for managing encrypted notes and files. It implements modern authentication flows, strong encryption standards, and defensive security practices designed to mitigate common web application attacks.

This project demonstrates secure system design, layered architecture, and production-aware deployment practices.

🔐 Core Features
Authentication & Session Security

JWT access tokens (15-minute expiry)

Refresh token rotation with token family detection

Automatic refresh token revocation on reuse (replay attack mitigation)

bcrypt password hashing (cost factor 12)

Role-Based Access Control (Admin, User, Guest)

Password reset with time-limited tokens

Data Protection

AES-256-GCM encryption for notes at rest

Authenticated encryption with IV + authentication tag storage

UUIDs instead of sequential IDs

Strict ownership checks to prevent IDOR

Randomized filenames for uploaded files

File type validation (JPEG, PNG, PDF)

5MB upload limit

API Hardening

express-validator input validation

Parameterized queries via Sequelize ORM

Mass assignment protection

Rate limiting:

Auth endpoints: 5 attempts / 15 min

Password reset: 3 attempts / hour

General API: 100 requests / 15 min

Explicit CORS configuration

Helmet security headers

Content Security Policy (CSP)

HSTS and X-Frame-Options enabled

Audit & Monitoring

Immutable audit logging for sensitive actions

IP address and user-agent logging

Admin dashboard for log review

No edit/delete endpoints for audit records

🏗️ Architecture
Backend

Node.js 18

Express.js

PostgreSQL 15

Sequelize ORM

Layered architecture:

Controllers

Middleware

Services

Models

Routes

Frontend

React 18

React Query

Zustand

Tailwind CSS

Deployment

Docker

Docker Compose

Nginx reverse proxy

PostgreSQL Docker volume for persistence

🛡️ Threat Model

SecureVault is designed to mitigate:

SQL Injection

IDOR (Insecure Direct Object Reference)

Token replay attacks

Brute force login attempts

CSRF (via SameSite + CORS strategy)

XSS (CSP + validation)

Mass assignment

Directory traversal

Stolen database dump (encrypted note content)

Not covered:

Compromised server root access

Infrastructure-level attacks (requires external hardening)

🔑 Encryption Model

Notes are encrypted using AES-256-GCM.

For each note:

A unique IV is generated

Ciphertext, IV, and authentication tag are stored

Encryption key is provided via environment variable

Decryption occurs only after authorization checks

AES-GCM provides:

Confidentiality

Integrity

Authentication of encrypted data

📦 Project Structure
securevault/
├── backend/
│   ├── src/
│   │   ├── config/
│   │   ├── controllers/
│   │   ├── middleware/
│   │   ├── models/
│   │   ├── routes/
│   │   ├── services/
│   │   ├── scripts/
│   │   └── server.js
│   ├── uploads/
│   ├── Dockerfile
│   └── package.json
├── frontend/
│   ├── src/
│   ├── public/
│   ├── Dockerfile
│   └── package.json
└── docker-compose.yml
🚀 Quick Start (Docker)
Requirements

Docker Desktop

Docker Compose

Run the Application
git clone <repository-url>
cd securevault

# Create .env file in root directory
cat > .env << EOF
DB_PASSWORD=your_secure_db_password
JWT_SECRET=your_super_secret_jwt_key_min_32_chars
JWT_REFRESH_SECRET=your_different_refresh_secret_key
ENCRYPTION_KEY=your_exact_32_byte_key_here
EOF

docker-compose up --build
Access

Frontend:
http://localhost:3000

Backend API:
http://localhost:5000

🔑 Demo Credentials (Development Only)

These credentials are seeded for local development and testing only.

Admin:

Email: admin@securevault.test

Password: Admin@123

User:

Email: user@securevault.test

Password: User@123

🛠️ Local Development (Without Docker)
Backend
cd backend
npm install
cp .env.example .env
npm run db:migrate
npm run db:seed
npm run dev
Frontend
cd frontend
npm install
npm start
📋 API Overview
Authentication

POST /api/auth/register

POST /api/auth/login

POST /api/auth/refresh

POST /api/auth/logout

POST /api/auth/password-reset

POST /api/auth/reset-password

Notes

GET /api/notes

POST /api/notes

GET /api/notes/:id

PUT /api/notes/:id

DELETE /api/notes/:id

Files

GET /api/files

POST /api/files/upload

GET /api/files/:id/download

DELETE /api/files/:id

Admin

GET /api/users

PUT /api/users/:id

GET /api/audit/all

Audit

GET /api/audit/my-logs

📊 Design Decisions
Why Refresh Token Rotation?

Refresh token rotation prevents replay attacks by:

Revoking the old refresh token immediately

Issuing a new refresh token within the same family

Revoking the entire family if a reused token is detected

This protects against stolen refresh tokens while maintaining usability.

📄 License

This project was built for technical demonstration and assessment purposes.
