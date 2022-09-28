CREATE TABLE `dogs` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `supplies_needed` int(3) NOT NULL,
  `care` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cats` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `supplies_needed` int(3) NOT NULL,
  `care` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `birds` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `supplies_needed` int(3) NOT NULL,
  `care` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `reptiles` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `supplies_needed` int(3) NOT NULL,
  `care` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `horses` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `supplies_needed` int(3) NOT NULL,
  `care` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `others` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `supplies_needed` int(3) NOT NULL,
  `care` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;