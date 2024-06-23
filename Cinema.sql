drop database if EXISTS cinema;
CREATE DATABASE cinema;
USE cinema;

CREATE TABLE Movie (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL,
    director VARCHAR(255) NOT NULL,
    cast TEXT,
    synopsis TEXT,
    rating DECIMAL(2, 1),
    critic_reviews TEXT
);

CREATE TABLE Genre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE MovieGenre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id)
);

CREATE TABLE Customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(15),
    registration_date DATE NOT NULL
);

CREATE TABLE Screening (
    id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    screening_time DATETIME NOT NULL,
    hall VARCHAR(50),
    FOREIGN KEY (movie_id) REFERENCES Movie(id)
);

CREATE TABLE Ticket (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    screening_id INT,
    seat VARCHAR(10),
    purchase_date DATETIME NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (screening_id) REFERENCES Screening(id)
);

CREATE TABLE Sale (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ticket_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    sale_date DATETIME NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES Ticket(id)
);

CREATE TABLE SearchHistory (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    query VARCHAR(255),
    search_date DATETIME NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);


INSERT INTO Movie (title, release_date, director, cast, synopsis, rating, critic_reviews) VALUES
('Inception', '2010-07-16', 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.', 8.8, 'Critics praised the innovative concept and visual effects.'),
('The Dark Knight', '2008-07-18', 'Christopher Nolan', 'Christian Bale, Heath Ledger, Aaron Eckhart', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 9.0, 'Heath Ledger\'s performance as the Joker received widespread acclaim.'),
('Interstellar', '2014-11-07', 'Christopher Nolan', 'Matthew McConaughey, Anne Hathaway, Jessica Chastain', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', 8.6, 'Critics praised the ambitious scope and emotional depth of the film.'),
('The Shawshank Redemption', '1994-09-23', 'Frank Darabont', 'Tim Robbins, Morgan Freeman, Bob Gunton', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 9.3, 'Regarded as one of the greatest films of all time.'),
('Pulp Fiction', '1994-10-14', 'Quentin Tarantino', 'John Travolta, Uma Thurman, Samuel L. Jackson', 'The lives of two mob hitmen, a boxer, a gangster\'s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 8.9, 'Praised for its nonlinear narrative and iconic dialogue.'),
-- Add more movies following the same format as needed
('The Godfather', '1972-03-24', 'Francis Ford Coppola', 'Marlon Brando, Al Pacino, James Caan', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 9.2, 'Often cited as one of the greatest films in world cinema.');

    -- Ilang movies ba? at masyadong mahaba cguro kung may synopsis? 


 


