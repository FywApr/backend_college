CREATE DATABASE `libary` CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `libary`.`paper_types`(
    `id` INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    `type` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`id`)
) ENGINE = InnoDB;

INSERT INTO `libary`.`paper_types`(`id`,`type`) VALUES
(1, "Книги"),
(2, "Журналы"),
(3, "Газеты");



CREATE TABLE `libary`.`genre_types`(
    `id` INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    `type` VARCHAR(30) NOT NULL,
    PRIMARY KEY(`id`)
) ENGINE = InnoDB;

INSERT INTO `libary`.`genre_types`(`id`,`type`) VALUE
(1,"Научные"),
(2,"Фантастика"),
(3,"Поэзия"),
(4,"Роман");

CREATE TABLE `libary`.`authors`(
    `id` INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    `author` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`id`)
) ENGINE = InnoDB;

INSERT INTO `libary`.`authors`(`id`,`author`) VALUE
(1,"Д.К. Роулинг"),
(2,"М.А. Булгаков"),
(3,"М.С. Пушкин");

CREATE TABLE `libary`.`data`(
    `id` INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    `paper_id`  INTEGER UNSIGNED NOT NULL,
    `genre_id`  INTEGER UNSIGNED NOT NULL,
    `author_id`  INTEGER UNSIGNED NULL,
    `name` VARCHAR(30) NOT NULL,
    FOREIGN KEY(`paper_id`) REFERENCES `libary`.`paper_types`(`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    FOREIGN KEY(`genre_id`) REFERENCES `libary`.`genre_types`(`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    FOREIGN KEY(`author_id`) REFERENCES `libary`.`authors`(`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    PRIMARY KEY(`id`)
)  ENGINE = InnoDB;


INSERT INTO `libary`.`data`(`id`,`paper_id`,`genre_id`,`author_id`,`name`) VALUE
(1,1,2,1,"Гарик Поттер"),
(2,1,2,2,"Мастер и Маргарита"),
(3,2,3,3,"Избранные стихи Пушкина"),
(4,3,1,NULL,"Наука и жизнь");

SELECT
    `data`.`id` AS `data_id`,
    `data`.`paper_id`,
    `data`.`genre_id`,
    `data`.`author_id`,
    `data`.`name`,

    `paper_types`.`id` AS `paper_type_id`,
    `paper_types`.`type` AS `paper_type`,

    `genre_types`.`id` AS `genre_types_id`,
    `genre_types`.`type` AS `genre_type`,

    `authors`.`id` AS `author_name_id`,
    `authors`.`author` AS `author_name`
FROM
    `libary`.`data`,
    `libary`.`paper_types`,
    `libary`.`genre_types`,
    `libary`.`authors`
WHERE
    `data`.`paper_id` = `paper_types`.`id` 
AND
    `data`.`genre_id` = `genre_types`.`id`
AND
    `data`.`author_id` = `authors`.`id`
;
