use samplespring;

CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` varchar(45) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8