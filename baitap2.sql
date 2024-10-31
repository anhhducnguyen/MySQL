-- CREATE DATABASE test;
-- USE test;

-- DROP DATABASE test;

CREATE TABLE `host` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45),
    `address` VARCHAR(45)
);

CREATE TABLE contractor (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
    `address` VARCHAR(255),
    `contractorcol` VARCHAR(45)

);


CREATE TABLE `building` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45),
    `address` VARCHAR(45),
    `city` VARCHAR(45),
    `cost` FLOAT,
    `start` DATE,
    `host_id` INT,
    `contractor_id` INT
    
);


CREATE TABLE `design` (
    `building_id` INT PRIMARY KEY,
    `architect_id` INT,
    `benefit` VARCHAR(45)
);

CREATE TABLE `architect` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
    `sex` TINYINT(1),
    `birthday` DATE,
    `place` VARCHAR(255),
    `address` VARCHAR(255)
);

CREATE TABLE `work` (
    `building_id` INT PRIMARY KEY,
    `worker_id` INT,
    `date` DATE,
    `total` VARCHAR(45)   
);

CREATE TABLE `worker` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45),
    `birthday` DATE,
    `year` VARCHAR(45),
    `skill` VARCHAR(45)
);

ALTER TABLE building
ADD CONSTRAINT fk_host_id FOREIGN KEY (`host_id`) REFERENCES host(id);


ALTER TABLE building
ADD CONSTRAINT fk_contractor_id FOREIGN KEY (contractor_id) REFERENCES contractor(id);


ALTER TABLE design
ADD CONSTRAINT fk_building_id_design FOREIGN KEY (building_id) REFERENCES building(id);


ALTER TABLE work
ADD CONSTRAINT fk_building_id_work FOREIGN KEY (building_id) REFERENCES building(id);


ALTER TABLE design
ADD CONSTRAINT fk_architect_id FOREIGN KEY (architect_id) REFERENCES architect(id);


ALTER TABLE work
ADD CONSTRAINT fk_worker_id FOREIGN KEY (worker_id) REFERENCES worker(id);