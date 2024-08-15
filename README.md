# Nawy_apartments_app
This is a Node.js and PostgreSQL-based application that allows users to manage apartment listings, including adding new apartments, retrieving apartment details, and viewing projects by developers.

Table of Contents
Setup
Running the Application
API Endpoints
Database
Docker

Setup
Prerequisites
Node.js (v18.x or higher)
PostgreSQL (v15.x or higher)
Docker

Installation
Clone the repository:
bash:
git clone https://github.com/karimtahmed/Nawy_apartments_app.git
cd Nawy_apartments_app
Install dependencies for both backend and frontend:

bash:
cd backend
npm install
cd ../frontend
npm install

Setup PostgreSQL database:
Create a PostgreSQL database named mydatabase
Configure the connection in the backend environment (using .env file or directly in Dockerfile).

# Database
# Execute these commands to read mydatabase_dump.sql so that you can create needed tables and insert actual data in tables.
docker cp mydatabase_dump.sql <container_name>:/mydatabase_dump.sql
docker exec -it <container_name> bash
psql -U postgres -d mydatabase -f /mydatabase_dump.sql

Build and run the application:
bash:
docker-compose up --build
This will start the backend server, the PostgreSQL database, and the frontend server.

Access the application:

Backend: http://localhost:3000
Frontend: http://localhost:3001
Running Locally (Without Docker)
Start the PostgreSQL database.

Start the backend server:

bash:
cd backend
npm start

Start the frontend server:

bash:
cd frontend
npm start

# API Endpoints
# Apartments
GET /
Retrieve all apartments.

Response:
json
[
  {
    "id": 1,
    "name": "East 90 Apartments",
    "location": "New Cairo",
    "price": 4000000,
    "description": "Own your Apartment in the middle of New cairo, new everywhere and everyplace. Buy now",
    "available_types": "Apartment Duplex",
    "developer": "Menassat Developments",
    "image_url": ""
  },
  ...
]

# GET /:id
# Retrieve a specific apartment by ID.

Response:

json
{
  "id": 1,
  "name": "East 90 Apartments",
  "location": "New Cairo",
  "price": 4000000,
  "description": "Own your Apartment in the middle of New cairo, new everywhere and everyplace. Buy now",
  "available_types": "Apartment Duplex",
  "developer": "Menassat Developments",
  "image_url": ""
}

# POST /apartment
# Create a new apartment.

Request Body:

json
{
  "name": "East 90 Apartments",
  "location": "New Cairo",
  "price": 4000000,
  "description": "Own your Apartment in the middle of New cairo, new everywhere and everyplace. Buy now",
  "available_types": "Apartment Duplex",
  "developer": "Menassat Developments",
  "image_url": ""
}
Response:

json
{
  "message": "Apartment created successfully"
}

# Projects
# GET /project/:dev
Retrieve projects by developer.

Response:
json
[
  {
    "id": 1,
    "name": "Podia Tower",
    "developer": "Menassat Developments"
  },
  ...
]


Docker
This project includes a docker-compose.yml file for easy setup of the development environment.

backend: Runs the Node.js server.
frontend: Serves the React frontend.
database: Runs a PostgreSQL instance.
To run the application using Docker, use:

bash
Copy code
docker-compose up --build
