/*
CREATE DATABASE `education` CHARACTER SET utf8 COLLATE utf8_general_ci;
*/
DROP TABLE IF EXISTS `education`.`colleges`;
DROP TABLE IF EXISTS `education`.`city`;




DROP TABLE IF EXISTS `education`.`city`;
CREATE TABLE `education`.`city`(
    `id` INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    `city` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`id`)
) ENGINE = InnoDB;
INSERT INTO `education`.`city`(`id`,`city`) VALUES
(1,"Pavlodar"),
(2,"Astana"),
(3,"Almaty");

DROP TABLE IF EXISTS `education`.`colleges`;
CREATE TABLE `education`.`colleges`(
    `id` INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    `city_id` INTEGER UNSIGNED NOT NULL,
    `college` TEXT NOT NULL,

    FOREIGN KEY (`city_id`) REFERENCES `education`.`city`(`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    PRIMARY KEY(`id`)
) ENGINE = InnoDB;

INSERT INTO `education`.`colleges`(`id`,`city_id`,`college`) VALUES
(1,1, "ВКИнЕУ"),
(2,2, "Astana IT college"),
(3,1, "KIT"),
(4,3, "Путяга"),
(5,2, "Политехнический колледж Астаны"),
(6,3, "Машиностроительный колледж"),
(7,1, "ПВКУ"),
(8,2, "Четам");