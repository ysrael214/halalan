-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2019 at 11:54 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `updhalalan2018base`
--

-- --------------------------------------------------------

--
-- Table structure for table `abstains`
--

CREATE TABLE `abstains` (
  `election_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(63) NOT NULL,
  `username` varchar(63) NOT NULL,
  `password` char(40) NOT NULL,
  `passkey` char(40) NOT NULL,
  `first_name` varchar(63) NOT NULL,
  `last_name` varchar(31) NOT NULL,
  `electionid` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `username`, `password`, `passkey`, `first_name`, `last_name`, `electionid`) VALUES
(0, 'ysrael214@gmail.com', 'admin', '63a3ae71a79ad0d78ca503a27da3c109d61e29a7', '63a3ae71a79ad0d78ca503a27da3c109d61e29a7', 'Menard Ysrael', 'Cruz', 1),
(0, 'ysrael214@gmail.com', 'admin', 'ed118eb54f78725ff25fe82c1c9fa7fb9a5ded37', 'ed118eb54f78725ff25fe82c1c9fa7fb9a5ded37', 'Menard Ysrael', 'Cruz', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` int(11) NOT NULL,
  `block` varchar(63) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `block`, `description`) VALUES
(0, 'Test Block', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blocks_elections_positions`
--

CREATE TABLE `blocks_elections_positions` (
  `block_id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blocks_elections_positions`
--

INSERT INTO `blocks_elections_positions` (`block_id`, `election_id`, `position_id`) VALUES
(0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `first_name` varchar(63) NOT NULL,
  `last_name` varchar(31) NOT NULL,
  `alias` varchar(15) DEFAULT NULL,
  `party_id` int(11) DEFAULT NULL,
  `election_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `picture` char(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `first_name`, `last_name`, `alias`, `party_id`, `election_id`, `position_id`, `description`, `picture`) VALUES
(1, 'Nathankissam Roy', 'Tubis', 'Kissam', 0, 0, 0, '', NULL),
(2, 'Bridget Noelle', 'Legaspi', 'Brij', 0, 0, 0, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `captchas`
--

CREATE TABLE `captchas` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `elections`
--

CREATE TABLE `elections` (
  `id` int(11) NOT NULL,
  `election` varchar(63) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `results` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elections`
--

INSERT INTO `elections` (`id`, `election`, `parent_id`, `status`, `results`) VALUES
(0, 'CS 198 President Selection', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `adminid` int(10) NOT NULL,
  `voterid` int(10) DEFAULT NULL,
  `blockid` int(10) DEFAULT NULL,
  `ipaddress` varchar(45) NOT NULL,
  `description` varchar(128) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

CREATE TABLE `parties` (
  `id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  `party` varchar(63) NOT NULL,
  `alias` varchar(15) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `logo` char(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parties`
--

INSERT INTO `parties` (`id`, `election_id`, `party`, `alias`, `description`, `logo`) VALUES
(0, 0, 'CSG July Graduates', 'CS Julyansa', 'Ggraduate ng bago Magjuly', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  `position` varchar(63) NOT NULL,
  `description` text DEFAULT NULL,
  `maximum` smallint(6) NOT NULL,
  `ordinality` smallint(6) NOT NULL,
  `abstain` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `election_id`, `position`, `description`, `maximum`, `ordinality`, `abstain`) VALUES
(0, 0, 'President', 'CSG President', 1, 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `timestamp` int(10) NOT NULL DEFAULT 0,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `ip_address`, `user_agent`, `timestamp`, `last_activity`, `data`) VALUES
('02i1agccf6h5ao6edvt61qkjn8rjepr3', '::1', '', 1576489267, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363438393236373b61646d696e7c613a373a7b733a323a226964223b733a313a2230223b733a353a22656d61696c223b733a31393a2279737261656c32313440676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a2261646d696e223b733a373a22706173736b6579223b733a34303a2265643131386562353466373837323566663235666538326331633966613766623961356465643337223b733a31303a2266697273745f6e616d65223b733a31333a224d656e6172642059737261656c223b733a393a226c6173745f6e616d65223b733a343a224372757a223b733a31303a22656c656374696f6e6964223b733a313a2231223b7d),
('9l0gc72pc1ddlrpofvk6iv3i9mvd498k', '::1', '', 1576489590, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363438393539303b61646d696e7c613a373a7b733a323a226964223b733a313a2230223b733a353a22656d61696c223b733a31393a2279737261656c32313440676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a2261646d696e223b733a373a22706173736b6579223b733a34303a2265643131386562353466373837323566663235666538326331633966613766623961356465643337223b733a31303a2266697273745f6e616d65223b733a31333a224d656e6172642059737261656c223b733a393a226c6173745f6e616d65223b733a343a224372757a223b733a31303a22656c656374696f6e6964223b733a313a2231223b7d),
('dgf3ll5dgnooi0s1g3k3ojpfuknq8l7p', '::1', '', 1576489891, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363438393839313b61646d696e7c613a373a7b733a323a226964223b733a313a2230223b733a353a22656d61696c223b733a31393a2279737261656c32313440676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a2261646d696e223b733a373a22706173736b6579223b733a34303a2265643131386562353466373837323566663235666538326331633966613766623961356465643337223b733a31303a2266697273745f6e616d65223b733a31333a224d656e6172642059737261656c223b733a393a226c6173745f6e616d65223b733a343a224372757a223b733a31303a22656c656374696f6e6964223b733a313a2231223b7d),
('baqj6euv752liuuk02857kk8ct0p970o', '::1', '', 1576490193, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363439303139333b61646d696e7c613a373a7b733a323a226964223b733a313a2230223b733a353a22656d61696c223b733a31393a2279737261656c32313440676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a2261646d696e223b733a373a22706173736b6579223b733a34303a2265643131386562353466373837323566663235666538326331633966613766623961356465643337223b733a31303a2266697273745f6e616d65223b733a31333a224d656e6172642059737261656c223b733a393a226c6173745f6e616d65223b733a343a224372757a223b733a31303a22656c656374696f6e6964223b733a313a2231223b7d),
('7ce6g7dus1bofel3jh1lq5k497gg1d53', '::1', '', 1576490517, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363439303531373b61646d696e7c613a373a7b733a323a226964223b733a313a2230223b733a353a22656d61696c223b733a31393a2279737261656c32313440676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a2261646d696e223b733a373a22706173736b6579223b733a34303a2265643131386562353466373837323566663235666538326331633966613766623961356465643337223b733a31303a2266697273745f6e616d65223b733a31333a224d656e6172642059737261656c223b733a393a226c6173745f6e616d65223b733a343a224372757a223b733a31303a22656c656374696f6e6964223b733a313a2231223b7d),
('r1g7amf81oi0o1qmbtulqps9moi63l18', '::1', '', 1576490842, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363439303834323b61646d696e7c613a373a7b733a323a226964223b733a313a2230223b733a353a22656d61696c223b733a31393a2279737261656c32313440676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a2261646d696e223b733a373a22706173736b6579223b733a34303a2265643131386562353466373837323566663235666538326331633966613766623961356465643337223b733a31303a2266697273745f6e616d65223b733a31333a224d656e6172642059737261656c223b733a393a226c6173745f6e616d65223b733a343a224372757a223b733a31303a22656c656374696f6e6964223b733a313a2231223b7d),
('n7ecp27p6fu1i70us2039f5gq3dpmjoi', '::1', '', 1576491431, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363439313433313b61646d696e7c613a373a7b733a323a226964223b733a313a2230223b733a353a22656d61696c223b733a31393a2279737261656c32313440676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a2261646d696e223b733a373a22706173736b6579223b733a34303a2265643131386562353466373837323566663235666538326331633966613766623961356465643337223b733a31303a2266697273745f6e616d65223b733a31333a224d656e6172642059737261656c223b733a393a226c6173745f6e616d65223b733a343a224372757a223b733a31303a22656c656374696f6e6964223b733a313a2231223b7d),
('30b8ugso8dvugq9ktir6lbplomf2ov6f', '::1', '', 1576492244, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363439323234343b61646d696e7c613a373a7b733a323a226964223b733a313a2230223b733a353a22656d61696c223b733a31393a2279737261656c32313440676d61696c2e636f6d223b733a383a22757365726e616d65223b733a353a2261646d696e223b733a373a22706173736b6579223b733a34303a2265643131386562353466373837323566663235666538326331633966613766623961356465643337223b733a31303a2266697273745f6e616d65223b733a31333a224d656e6172642059737261656c223b733a393a226c6173745f6e616d65223b733a343a224372757a223b733a31303a22656c656374696f6e6964223b733a313a2231223b7d),
('9790hg9a5g7i3l86ta8jgu6dm97gp186', '::1', '', 1576492803, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363439323830333b766f7465727c613a393a7b733a323a226964223b733a313a2230223b733a383a22757365726e616d65223b733a353a22766f746572223b733a333a2270696e223b4e3b733a31303a2266697273745f6e616d65223b733a353a224669727374223b733a393a226c6173745f6e616d65223b733a353a22566f746572223b733a383a22626c6f636b5f6964223b733a313a2230223b733a353a226c6f67696e223b733a31393a22323031392d31322d31362031383a33333a3331223b733a363a226c6f676f7574223b733a31393a22323031392d31322d31362031383a33333a3532223b733a31303a2269705f61646472657373223b733a313a2230223b7d),
('fiouchsq3luahh1n0gmnh01o5p51kgs7', '::1', '', 1576493403, 0, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537363439333338363b766f7465727c613a393a7b733a323a226964223b733a313a2230223b733a383a22757365726e616d65223b733a353a22766f746572223b733a333a2270696e223b4e3b733a31303a2266697273745f6e616d65223b733a353a224669727374223b733a393a226c6173745f6e616d65223b733a353a22566f746572223b733a383a22626c6f636b5f6964223b733a313a2230223b733a353a226c6f67696e223b733a31393a22323031392d31322d31362031383a34393a3132223b733a363a226c6f676f7574223b733a31393a22323031392d31322d31362031383a34393a3231223b733a31303a2269705f61646472657373223b733a313a2230223b7d72756c65737c613a333a7b733a31343a22706f736974696f6e5f636f756e74223b693a313b733a31353a2263616e6469646174655f636f756e74223b613a303a7b7d733a31333a2263616e6469646174655f6d6178223b613a313a7b733a333a22307c30223b733a313a2231223b7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `voted`
--

CREATE TABLE `voted` (
  `election_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `image_trail_hash` char(40) DEFAULT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

CREATE TABLE `voters` (
  `id` int(11) NOT NULL,
  `username` varchar(63) NOT NULL,
  `password` char(40) NOT NULL,
  `pin` char(40) DEFAULT NULL,
  `first_name` varchar(63) NOT NULL,
  `last_name` varchar(31) NOT NULL,
  `block_id` int(11) NOT NULL,
  `login` datetime DEFAULT NULL,
  `logout` datetime DEFAULT NULL,
  `ip_address` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`id`, `username`, `password`, `pin`, `first_name`, `last_name`, `block_id`, `login`, `logout`, `ip_address`) VALUES
(0, 'voter', '42ef727a794679caead68fdcb1e6a3a284fe0fc3', NULL, 'First', 'Voter', 0, '2019-12-16 18:50:02', '2019-12-16 18:49:21', '0');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `candidate_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `party_id` (`party_id`),
  ADD KEY `candidates_ibfk_2` (`position_id`),
  ADD KEY `election_id` (`election_id`);

--
-- Indexes for table `elections`
--
ALTER TABLE `elections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `parties`
--
ALTER TABLE `parties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parties_ibfk_1` (`election_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `election_id` (`election_id`);

--
-- Indexes for table `voted`
--
ALTER TABLE `voted`
  ADD PRIMARY KEY (`election_id`,`voter_id`);

--
-- Indexes for table `voters`
--
ALTER TABLE `voters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voters_ibfk_1` (`block_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidates`
--
ALTER TABLE `candidates`
  ADD CONSTRAINT `candidates_ibfk_1` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidates_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidates_ibfk_3` FOREIGN KEY (`election_id`) REFERENCES `elections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `elections`
--
ALTER TABLE `elections`
  ADD CONSTRAINT `elections_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `elections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parties`
--
ALTER TABLE `parties`
  ADD CONSTRAINT `parties_ibfk_1` FOREIGN KEY (`election_id`) REFERENCES `elections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_ibfk_1` FOREIGN KEY (`election_id`) REFERENCES `elections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `voters`
--
ALTER TABLE `voters`
  ADD CONSTRAINT `voters_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
