create database flight

CREATE TABLE [user] (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  [password] VARCHAR(255) NOT NULL,
  [role] VARCHAR(50) NOT NULL CHECK ([role] IN ('admin', 'customer'))
);

CREATE TABLE aircraft (
  id INT IDENTITY(1,1) PRIMARY KEY,
  model VARCHAR(255) NOT NULL,
  capacity INT NOT NULL
);

CREATE TABLE airport (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL
);

CREATE TABLE flight (
  id INT IDENTITY(1,1) PRIMARY KEY,
  origin INT NOT NULL,
  destination INT NOT NULL,
  departure_date DATETIME NOT NULL,
  arrival_date DATETIME NOT NULL,
  aircraft_id INT NOT NULL,
  FOREIGN KEY (aircraft_id) REFERENCES aircraft (id),
  FOREIGN KEY (origin) REFERENCES airport (id),
  FOREIGN KEY (destination) REFERENCES airport (id)
);

CREATE TABLE booking (
  user_id INT NOT NULL,
  flight_id INT NOT NULL,
  seat_number INT NOT NULL,
  [class] VARCHAR(50) NOT NULL CHECK ([class] IN ('economy', 'business','first')),
  FOREIGN KEY (user_id) REFERENCES [user] (id),
  FOREIGN KEY (flight_id) REFERENCES flight (id),
  PRIMARY KEY (user_id, flight_id)
);