CREATE DATABASE `games_shop` CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `games_shop`.`genres`(
    `id` INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`id`)
)  ENGINE = InnoDB

INSERT INTO `games_shop`.`genres`(`id`,`name`) VALUES
(1, "RPG"),
(2, "Action"),
(3, "Strategy")

CREATE TABLE `games_shop`.`games`(
    `id` INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    `genre_id` INTEGER UNSIGNED NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    `price` INTEGER UNSIGNED NULL,
    FOREIGN KEY (`genre_id`) REFERENCES `games_shop`.`genres`(`id`)
        ON DELETE RESTRICT -- нужно удалить вначале игры, потом только жанры
        ON UPDATE CASCADE,
    PRIMARY KEY(`id`)
)  ENGINE = InnoDB

INSERT INTO `games_shop`.`games` (`id`, `genre_id`, `name`, `price`) VALUES
(1,1,"FarCry", 15000),
(2,2,"GTA", 23000),
(3,1,"Minecraft", 13000),
(4,2,"STALKER", 17000),
(5,2,"FIFA", 15000)