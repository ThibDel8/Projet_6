-- Set the time zone for the MySQL session
SET time_zone = "Europe/Paris";

-- Create the 'users' table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(72) NOT NULL,
    date_inscription DATETIME NOT NULL
);

-- Create the 'figures' table
CREATE TABLE IF NOT EXISTS figures (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    groupe VARCHAR(100) NOT NULL,
    user_id BIGINT NOT NULL,
    date_creation DATETIME NOT NULL,
    date_maj DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create the 'medias' table
CREATE TABLE IF NOT EXISTS medias (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50) NOT NULL,
    url_image VARCHAR(150),
    figure_id BIGINT NOT NULL,
    FOREIGN KEY (figure_id) REFERENCES figures(id) ON DELETE CASCADE
);

-- Create the 'comments' table
CREATE TABLE IF NOT EXISTS comments (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    comment TEXT NOT NULL,
    user_id BIGINT NOT NULL,
    date_comment DATETIME NOT NULL,
    figure_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (figure_id) REFERENCES figures(id) ON DELETE CASCADE
);
