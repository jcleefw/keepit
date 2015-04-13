CREATE DATABASE keepit;

\c keepit

CREATE TABLE `keepit`.`users` (
  `id` SERIAL4 NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `password` VARCHAR(45) NULL,
  `suburb` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `keepit`.`rss_feeds` (
  `ID` SERIAL4 NOT NULL,
  `feed_name` VARCHAR(100) NULL,
  `url` VARCHAR(250) NULL,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


