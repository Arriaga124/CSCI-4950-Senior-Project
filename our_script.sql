CREATE TABLE `animals` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `supplies_needed` int(3) NOT NULL,
  `care` int(3) NOT NULL,
  `species` varchar(10) NOT NULL,
  `breed` varchar(50) DEFAULT NULL,
  `age` varchar(30) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `declawed` varchar(3) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `intake_date` date DEFAULT NULL,
  `available` varchar(3) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `staff` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `time` int(3) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `supply` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `supply_name` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `animal` varchar(20) DEFAULT NULL,
  `amount` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tasks` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `task` varchar(100) DEFAULT NULL,
  `priority` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
