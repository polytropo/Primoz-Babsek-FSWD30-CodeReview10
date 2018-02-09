-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2018 at 04:12 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_primoz_babsek_biglibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(55) DEFAULT NULL,
  `author_surname` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `author_name`, `author_surname`) VALUES
(1, 'Jeffrey', 'Brown'),
(2, 'Christian', 'Slade'),
(3, 'Kate', 'Glasheen'),
(4, 'Steeve', 'Moore'),
(5, 'John', 'Doe'),
(6, 'Barbara', 'Streisand');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `isbn` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `fk_author_id` int(11) DEFAULT NULL,
  `fk_publisher_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `description` tinytext,
  `type` varchar(55) DEFAULT NULL,
  `publish_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`isbn`, `title`, `fk_author_id`, `fk_publisher_id`, `image_url`, `fk_user_id`, `description`, `type`, `publish_date`) VALUES
(102030, 'Love You Forever', 3, 1, 'https://images-na.ssl-images-amazon.com/images/I/612wpFrT0WL._SY484_BO1,204,203,200_.jpg', NULL, 'A young woman holds her newborn son\r\nAnd looks at him lovingly...', 'dvd', '1995-02-14'),
(111111, 'Fifty Shades of Grey: Book One of the Fifty Shades Trilogy', 6, 4, 'https://images-na.ssl-images-amazon.com/images/I/51q6htNaVcL._SX323_BO1,204,203,200_.jpg', NULL, 'When literature student Anastasia Steele goes to interview young entrepreneur Christian Grey, she encounters a man who... ', 'book', '2012-05-08'),
(222222, 'The Hunger Games', 2, 3, 'https://images-na.ssl-images-amazon.com/images/I/41ir9m8QQnL._SX332_BO1,204,203,200_.jpg', NULL, 'In the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts... ', 'book', '2010-02-22'),
(333333, 'Catching Fire (The Hunger Games)', 2, 3, 'https://images-na.ssl-images-amazon.com/images/I/51IufOs4JTL._SX339_BO1,204,203,200_.jpg', NULL, 'Against all odds, Katniss Everdeen has won the annual Hunger Games with fellow district tribute Peeta Mellark. But it was a victory won by defiance of the Capitol and their harsh rules...', 'book', '2001-09-01'),
(444444, 'All the Light We Cannot See: A Novel', 1, 2, 'https://images-na.ssl-images-amazon.com/images/I/51tjJGTkUhL._SX326_BO1,204,203,200_.jpg', NULL, 'From the highly acclaimed, multiple award-winning Anthony Doerr, the stunningly beautiful instant New York Times bestseller about a blind French girl and a German boy whose paths collide in occupied France as both try to survive the devastation of World W', 'cd', '2002-02-22'),
(555555, 'The Girl Who Played with Fire ', 5, 2, 'https://images-na.ssl-images-amazon.com/images/I/618%2B2jEAmZL._SX322_BO1,204,203,200_.jpg', NULL, 'Part blistering espionage thriller, part riveting police procedural, and part piercing exposé on social injustice, The Girl Who Played with Fire is a masterful, endlessly satisfying novel... ', 'dvd', '2007-11-04'),
(666666, 'Giraffes Can\'t Dance', 4, 4, 'https://images-na.ssl-images-amazon.com/images/I/51qvh4MALwL._SX390_BO1,204,203,200_.jpg', NULL, 'Giraffes Can\'t Dance is a touching tale of Gerald the giraffe, who wants nothing more than to dance. With crooked knees and thin legs, it\'s harder for a giraffe than you would think...', 'cd', '2012-04-07'),
(777777, 'StrengthsFinder 2.0', 3, 1, 'https://images-na.ssl-images-amazon.com/images/I/51SdxC2moVL._SX360_BO1,204,203,200_.jpg', NULL, 'Chances are, you don\'t. All too often, our natural talents go untapped. From the cradle to the cubicle, we devote more time to fixing our shortcomings than to developing our strengths...', 'cd', '2007-02-14'),
(888888, 'Unbroken: A World War II Story of Survival, Resilience, and Redemption', 6, 2, 'https://images-na.ssl-images-amazon.com/images/I/51II0f7dYEL._SX331_BO1,204,203,200_.jpg', NULL, 'In boyhood, Louis Zamperini was an incorrigible delinquent. As a teenager, he channeled his defiance into running, discovering a prodigious talent that had carried him to the Berlin Olympics. But when World War II began, the athlete became an airman, ', 'dvd', '2014-07-29'),
(999999, 'Who Moved My Cheese?', 3, 2, 'https://images-na.ssl-images-amazon.com/images/I/51fFDEkUyEL._SX321_BO1,204,203,200_.jpg', NULL, 'Most people are fearful of change, both personal and professional, because they don\'t have any control over how or when it happens to them...', 'cd', '1998-02-08');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `publisher` varchar(55) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `publisher`, `address`, `size`) VALUES
(1, 'IG Publishings', 'Zaloska cesta 150, 1000 Ljubljana, Slovenia', 'small'),
(2, 'Big corp', 'Main street 992, 2000 London, Great Britain', 'big'),
(3, 'Vienna Books', 'Keplerplatz 12, 1010 Vienna, Austria', 'medium'),
(4, 'Publich relation Blitz', 'Downstreet 144, 4567 Pariz, France', 'medium');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `password`) VALUES
(2, 'anu', 'nairis', 'anu@gmail.com', '8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414'),
(3, 'bob', 'boblastname', 'bob@gmail.com', '8d059c3640b97180dd2ee453e20d34ab0cb0f2eccbe87d01915a8e578a202b11'),
(4, 'blabla', 'blablalastname', 'bla@gmail.com', 'ccadd99b16cd3d200c22d6db45d8b6630ef3d936767127347ec8a76ab992c2ea');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`),
  ADD CONSTRAINT `media_ibfk_3` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
