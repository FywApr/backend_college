CREATE DATABASE `students` CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `students`.`people`(
    `id` INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    `first_name` VARCHAR(36) NOT NULL COMMENT "Имя контакта",
    `last_name` VARCHAR(36) NOT NULL COMMENT "Фамилия контакта",
    `patronymic` VARCHAR(36) NULL COMMENT "Отчетство контакта",
    `birthdate` DATE NOT NULL COMMENT "Дата рождения",
    `gender` ENUM("male", "female") NOT NULL COMMENT "Пол контакта", -- ENUM - строгий выбор из вариантов
    PRIMARY KEY(`id`)
) ENGINE = InnoDB COMMENT "Содержит все контакты" -- InnoDB типо защита, архив

CREATE TABLE `students`.`students`(
    `people_id` INTEGER UNSIGNED NOT NULL,
    `mark` INTEGER UNSIGNED NULL,
    FOREIGN KEY (`people_id`) REFERENCES `students`.`people`(`id`) -- привязка ID с другой таблицы
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY(`people_id`)
) ENGINE = InnoDB COMMENT "Данные по студентам" -- InnoDB типо защита, архив