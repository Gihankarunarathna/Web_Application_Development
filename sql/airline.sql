CREATE DATABASE `airline`;

CREATE TABLE `branch` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `type` enum('Head','Sub') NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `longtitude` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ;

CREATE TABLE `customer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NIC` varchar(45) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(350) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `password` varchar(145) DEFAULT NULL,
  `updated` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ;

CREATE TABLE `flight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(95) DEFAULT NULL,
  `departure` datetime DEFAULT NULL,
  `name` varchar(95) DEFAULT NULL,
  `to` varchar(95) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `updated` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `systemuser` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(200) DEFAULT NULL,
  `Password` varchar(350) DEFAULT NULL,
  `BranchId` int(11) DEFAULT NULL,
  `Email` varchar(300) DEFAULT NULL,
  `Contact` varchar(20) DEFAULT NULL,
  `Salt` varchar(300) DEFAULT NULL,
  `UserType` enum('Administrator','Staff 1','Staff 2','Customer') DEFAULT NULL,
  `NIC` varchar(45) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Active` int(11) DEFAULT 0,
  `IP` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ;

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flight` int(11) DEFAULT NULL,
  `customer` int(11) DEFAULT NULL,
  `seatno` varchar(45) DEFAULT NULL,
  `createdby` varchar(145) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `customer_` varchar(145) DEFAULT NULL,
  `flight_` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

INSERT INTO `airline`.`flight`
(`model`,
`departure`,
`name`,
`to`,
`seats`,
`updated`)
VALUES
(
'Aerodynamic flight',
'2022-05-31 00:00:00',
'F001',
'US',
'500',
'jeram94@gmail.com');

INSERT INTO `airline`.`branch`
(`Id`,
`name`,
`city`,
`address`,
`type`,
`phone`,
`email`,
`longtitude`,
`latitude`)
VALUES
(3,
'Phoenix Airline PVT',
'Colombo',
'Main Road',
'Head',
'0112345345',
'admin@phoenix.com',
67.00,
85.00);

INSERT INTO `airline`.`systemuser`
(
`UserName`,
`Password`,
`BranchId`,
`Email`,
`Contact`,
`Salt`,
`UserType`,
`NIC`,
`Address`,
`Active`,
`IP`)
VALUES
(
'Jeram Perera',
'5AKkxeALjxVkYWTdI8JADYtk8pit7fXZ5bjL1z5Wy4A=',
3,
'jeram@gmail.com',
'0112342323',
'isSQXiboxh',
'Staff 1',
'923434234v',
'No 23',
1,
'192.0.8.123');

INSERT INTO `airline`.`systemuser`
(
`UserName`,
`Password`,
`BranchId`,
`Email`,
`Contact`,
`Salt`,
`UserType`,
`NIC`,
`Address`,
`Active`,
`IP`)
VALUES
(
'Kamal H T',
'5AKkxeALjxVkYWTdI8JADYtk8pit7fXZ5bjL1z5Wy4A=',
3,
'kamal@gmail.com',
'0112112323',
'isSQXiboxh',
'Administrator',
'923434234v',
'No 23',
1,
'192.0.8.223');





