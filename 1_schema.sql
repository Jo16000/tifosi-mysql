CREATE DATABASE IF NOT EXISTS tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tifosi;

CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'PasswordTifosi2026!';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    CONSTRAINT pk_marque PRIMARY KEY (id_marque)
) ENGINE=InnoDB;

CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    id_marque INT NOT NULL,
    CONSTRAINT pk_boisson PRIMARY KEY (id_boisson),
    CONSTRAINT fk_boisson_marque FOREIGN KEY (id_marque) REFERENCES marque(id_marque) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    CONSTRAINT pk_ingredient PRIMARY KEY (id_ingredient)
) ENGINE=InnoDB;

CREATE TABLE foccacia (
    id_focaccia INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    CONSTRAINT pk_focaccia PRIMARY KEY (id_focaccia)
) ENGINE=InnoDB;

CREATE TABLE comprend (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT NOT NULL DEFAULT 1,
    CONSTRAINT pk_comprend PRIMARY KEY (id_focaccia, id_ingredient),
    CONSTRAINT fk_comprend_focaccia FOREIGN KEY (id_focaccia) REFERENCES foccacia(id_focaccia) ON DELETE CASCADE,
    CONSTRAINT fk_comprend_ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE client (
    id_client INT AUTO_INCREMENT,
    nom VARCHAR(45) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT NOT NULL,
    CONSTRAINT pk_client PRIMARY KEY (id_client)
) ENGINE=InnoDB;

CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT,
    nom VARCHAR(45) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    CONSTRAINT pk_menu PRIMARY KEY (id_menu)
) ENGINE=InnoDB;

CREATE TABLE est_constitue (
    id_focaccia INT NOT NULL,
    id_menu INT NOT NULL,
    CONSTRAINT pk_est_constitue PRIMARY KEY (id_focaccia, id_menu),
    CONSTRAINT fk_est_constitue_focaccia FOREIGN KEY (id_focaccia) REFERENCES foccacia(id_focaccia) ON DELETE CASCADE,
    CONSTRAINT fk_est_constitue_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE contient (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    CONSTRAINT pk_contient PRIMARY KEY (id_menu, id_boisson),
    CONSTRAINT fk_contient_menu KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE,
    CONSTRAINT fk_contient_boisson FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE achete (
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    date_achat DATE NOT NULL,
    CONSTRAINT pk_achete PRIMARY KEY (id_client, id_menu, date_achat),
    CONSTRAINT fk_achete_client FOREIGN KEY (id_client) REFERENCES client(id_client) ON DELETE CASCADE,
    CONSTRAINT fk_achete_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE
) ENGINE=InnoDB;