DROP DATABASE `chat`;
CREATE DATABASE `chat` CHARACTER SET utf8 COLLATE utf8_general_ci;
DROP TABLE IF EXISTS `chat`.`people`;
DROP TABLE IF EXISTS `chat`.`contacts`;
DROP TABLE IF EXISTS `chat`.`chat`;


DROP TABLE IF EXISTS `chat`.`people`;
CREATE TABLE `chat`.`people`(
    `id` INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    `f_name` VARCHAR(30) NOT NULL,
    `l_name` VARCHAR(30) NOT NULL,
    `nic_name` VARCHAR(30) NOT NULL,
    `is_online` BIT(1) NOT NULL,
    PRIMARY KEY(`id`)
) ENGINE = InnoDB;
INSERT INTO `chat`.`people`(`id`,`f_name`,`l_name`,`nic_name`,`is_online`) VALUES
(1,"Duman", "Kaltaev", "Duman123", 1),
(2,"Nikita", "Shinkarenko", "Yura", 0),
(3,"Vadim", "Kibler", "Kiblerrr", 0),
(4,"Armen", "Melkumyan", "ArmenMelk", 1),
(5,"Miras", "Sarsen", "Srsn", 1);

DROP TABLE IF EXISTS `chat`.`contacts`;
CREATE TABLE `chat`.`contacts`(
     `id` INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
     `person_id` INTEGER UNSIGNED NOT NULL,
     `contact_id` INTEGER UNSIGNED NOT NULL,
     `nic_rename` VARCHAR(30) NULL,
     FOREIGN KEY(`person_id`) REFERENCES `chat`.`people`(`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE, 
    FOREIGN KEY(`contact_id`) REFERENCES `chat`.`people`(`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    PRIMARY KEY(`id`)
) ENGINE = InnoDB;
INSERT INTO `chat`.`contacts`(`id`,`person_id`,`contact_id`,`nic_rename`) VALUE
(1,1,2,"Nikita"),
(2,1,3,NULL),
(3,2,5,"Srsn"),
(4,2,4,"Armen"),
(5,5,1,"Duman Kaltaev"),
(6,5,2,"Shina");





DROP TABLE IF EXISTS `chat`.`chat`;
CREATE TABLE `chat`.`chat`(
    `id` INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
    `dtetime` DATETIME NOT NULL,
    `sender_people_id` INTEGER UNSIGNED NOT NULL,
    `reciver_people_id` INTEGER UNSIGNED NOT NULL,
    `message` TEXT NOT NULL,
    FOREIGN KEY(`sender_people_id`) REFERENCES `chat`.`people`(`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE, 
    FOREIGN KEY(`reciver_people_id`) REFERENCES `chat`.`people`(`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    PRIMARY KEY(`id`)
) ENGINE = InnoDB;
INSERT INTO `chat`.`chat`(`id`,`dtetime`,`sender_people_id`,`reciver_people_id`,`message`) VALUE
(1, "2024-02-15 16:14:00", 1, 2, "ЧОТАМ"),
(2, "2024-02-15 18:12:00", 2, 1, "АНИЧЕ"),
(3, "2024-02-15 19:00:00", 4, 5, "Го в майнкрафт"),
(4, "2024-02-15 19:05:00", 5, 4, "Не хочу"),
(5, "2024-02-15 19:11:00", 3, 2, "Один одной два двойной сделай"),
(6, "2024-02-15 19:12:13", 1, 3, "Привет. Как дела?"),
(7, "2024-02-15 19:15:13", 3, 1, "Привет. Хорошо, сам как?"),
(8, "2024-02-15 20:00:21", 1, 3, "Спасибо, всё отлично"),
(9, "2024-02-15 20:12:49", 1, 5, "Как ты воин?"),
(10, "2024-02-15 20:30:15", 5, 1, "Норм");


/*
SELECT
    `contacts`.`id` AS `id`,
    `contacts`.`person_id` AS `person_id`,
    `contacts`.`contact_id` AS `contact_id`,
    `contacts`.`nic_rename` AS `contact_rename`,
    COALESCE (`contacts`.`nic_rename`,`contact_people`.`nic_name`) AS `nic_name`,
    `contact_people`.`f_name` AS `first_name`,
    `contact_people`.`l_name` AS `last_name`,
FROM 
    `chat`.`people` AS `person_people`,
    `chat`.`people` AS `contact_people`,
    `chat`.`contacts`
WHERE 
    `contacts`.`person_id` = `person_people`.`id`
AND   
    `contacts`.`contact_id` = `contact_people`.`id`
;
*/
SELECT 
    `chat`.`id` AS `id`,
    `chat`.`dtetime` AS `date_time`,
    `sender_people`.`nic_name` AS `sender_nic_name`,
    `reciver_people`.`nic_name` AS `reciver_nic_name`,
    `chat`.`message` AS `message`,

    `sender_people`.`id` AS `sender_id`,
    `reciver_people`.`id` AS `reciver_id`
FROM 
    `chat`.`people` AS `sender_people`,
    `chat`.`people` AS `reciver_people`,
    `chat`.`chat`
WHERE 
    `chat`.`sender_people_id` = `sender_people`.`id`
AND   
    `chat`.`reciver_people_id` = `reciver_people`.`id`

AND 
    (
        (`sender_people`.`id` = 1 AND `reciver_people`.`id` = 5)
        OR
        (`sender_people`.`id` = 5 AND `reciver_people`.`id` = 1)
   )

ORDER BY
    `chat`.`dtetime` DESC;