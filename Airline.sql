DROP SCHEMA IF EXISTS flight;
CREATE SCHEMA flight;
USE flight;

CREATE TABLE customers(
customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
c_name VARCHAR(255),
c_status VARCHAR(255),
c_total_mileage INT
);

CREATE TABLE flights(
flight_number VARCHAR(255) NOT NULL UNIQUE PRIMARY KEY,
aircraft VARCHAR(255),
total_seats INT,
flight_mileage INT
);

CREATE TABLE tickets(
id_ticket INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_customer INT,
flight_number VARCHAR(255),
FOREIGN KEY (id_customer) REFERENCES customers(customer_id),
FOREIGN KEY (flight_number) REFERENCES flights(flight_number)
);

INSERT INTO customers(c_name, c_status, c_total_mileage ) VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida','None',6008),
('Tom Jones','Gold',205767),
('Sam Rio','None',2653),
('Jessica James', 'Silver', 127656),
('Ana Janco','Silver',136773),
('Jennifer Cortez','Gold',300582),
('Christian Janco','Silver',14642);

INSERT INTO flights(flight_number, aircraft, total_seats, flight_mileage) VALUES
('DL143','Boeing 747', 400,135),
('DL122', 'Airbus A330',236, 4370),
('DL53','Boeing 777', 264, 2078),
('DL222','Boeing 777', 264, 1765),
('DL37', 'Boeing 747',400, 531);

INSERT INTO tickets (id_customer,flight_number) VALUES
(1, 'DL143'),
(1, 'DL122'),
(2,'DL122'),
(1, 'DL143'),
(3, 'DL122'),
(3, 'DL53'),
(1, 'DL143'),
(4,'DL143'),
(1, 'DL143'),
(3, 'DL222'),
(5,'DL143'),
(4, 'DL143'),
(6,'DL222'),
(7, 'DL222'),
(5, 'DL122'),
(4, 'DL37'),
(8,'DL222');

/*EX3. In the Airline database write the SQL script to get the total number of flights in the database.*/
SELECT COUNT(*) FROM flights;

/*EX4. In the Airline database write the SQL script to get the average flight distance.*/
SELECT AVG(flight_mileage) FROM flights;

/*EX5. In the Airline database write the SQL script to get the average number of seats.*/
SELECT AVG(total_seats) FROM flights;

/*EX6. In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.*/
SELECT c_status, AVG(c_total_mileage) FROM customers
GROUP BY c_status;

/*EX7. In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status */
SELECT c_status, MAX(c_total_mileage)
FROM customers
GROUP BY c_status;

/*EX8. In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing. */
SELECT COUNT(aircraft)  FROM flights
WHERE aircraft LIKE 'BOEING%';

/*EX9. In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.*/
SELECT * FROM flights AS flig_range
WHERE flight_mileage 
BETWEEN 300 AND 2000;

/*EX10. In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join). */
SELECT c_status, AVG(flight_mileage) FROM flights
JOIN customers ON c_total_mileage
GROUP BY c_status;

/*EX11. In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).*/
SELECT  flights.flight_number, customers.c_status, customers.c_name, flights.aircraft FROM flights
JOIN customers ON customers.c_total_mileage = flights.flight_mileage
WHERE customers.c_status = 'Gold';

SELECT f.aircraft, COUNT(*) AS quantity_flights
FROM tickets t
JOIN customers c ON t.id_customer = c.customer_id
JOIN flights f ON t.flight_number = f.flight_number
WHERE c.c_status = "GOLD"
GROUP BY f.aircraft
ORDER BY quantity_flights DESC;



