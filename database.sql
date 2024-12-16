create database chefnow;

use chefnow;

CREATE TABLE `menus` (
    `id_menu` int(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `nom` varchar(255) NOT NULL,
    `prix` decimal(10, 2) NOT NULL,
    `Description` text DEFAULT NULL
); 

CREATE TABLE `plats` (
    `id_plat` int(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `nom` varchar(255) NOT NULL,
    `prix` decimal(10, 2) NOT NULL,
    `Description` text DEFAULT NULL,
    `id_menu_fk` int(11) NOT NULL,
    FOREIGN KEY (`id_menu_fk`) REFERENCES `menus`(`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `ingredients` (
    `id_ingredient` int(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `nom` varchar(255) NOT NULL,
    `id_plat_fk` int(11) NOT NULL,
    FOREIGN KEY (`id_plat_fk`) REFERENCES `plats`(`id_plat`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `roles` (
    `id_role` INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `role` VARCHAR(255) NOT NULL
);

CREATE TABLE `admins` (
    `id_admin` INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `nom` VARCHAR(255) NOT NULL,
    `prenom` VARCHAR(255) NOT NULL, 
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `telephone` VARCHAR(20) NOT NULL,
    `mot_de_passe` VARCHAR(255) NOT NULL,
    `id_role_fk` int(11) NOT NULL,
    FOREIGN KEY (`id_role_fk`) REFERENCES `roles`(`id_role`)
);

CREATE TABLE `users` (
    `id_user` INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `nom` VARCHAR(255) NOT NULL,
    `prenom` VARCHAR(255) NOT NULL, 
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `telephone` VARCHAR(20) NOT NULL,
    `mot_de_passe` VARCHAR(255) NOT NULL,
    `adresse` TEXT NOT NULL,
    `pays` VARCHAR(255) NOT NULL,
    `ville` VARCHAR(255) NOT NULL,
    `code_postal` VARCHAR(5) NOT NULL,
    `date_creation` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `reservation` (
    `id_reservation` INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `id_user_fk` INT(11) NOT NULL,
    `id_menu_fk` INT(11) NOT NULL,
    `date_reservation` DATETIME NOT NULL,
    `nombre_personnes` INT(11) NOT NULL,
    `statut` ENUM('en attente', 'approuvée', 'refusée', 'terminée') DEFAULT 'en attente',
    `commentaire` TEXT,
    `date_creation` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `if_reser_modif` ENUM('yes','no') DEFAULT 'no',
    `date_modification` TIMESTAMP NULL DEFAULT NULL,
    FOREIGN KEY (`id_user_fk`) REFERENCES `users`(`id_user`),
    FOREIGN KEY (`id_menu_fk`) REFERENCES `menus`(`id_menu`)
);

CREATE TABLE `statistiques` (
    `id_statistique` INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    `total_clients` INT(11) DEFAULT 0,
    `total_reservations` INT(11) DEFAULT 0,
    `reservations_en_attente` INT(11) DEFAULT 0,
    `reservations_approuvees` INT(11) DEFAULT 0,
    `reservations_refusees` INT(11) DEFAULT 0,
	`reservations_terminee` INT(11) DEFAULT 0,
    `date_mise_a_jour` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);





