CREATE TABLE `dogs` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `supplies_needed` int(3) NOT NULL,
  `care` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
