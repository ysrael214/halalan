CREATE TABLE `abstains` (
  `election_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(63) NOT NULL,
  `username` varchar(63) NOT NULL,
  `password` char(40) NOT NULL,
  `passkey` char(40) NOT NULL,
  `first_name` varchar(63) NOT NULL,
  `last_name` varchar(31) NOT NULL,
  `electionid` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `blocks` (
  `id` int(11) NOT NULL,
  `block` varchar(63) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `blocks_elections_positions` (
  `block_id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `first_name` varchar(63) NOT NULL,
  `last_name` varchar(31) NOT NULL,
  `alias` varchar(15) DEFAULT NULL,
  `party_id` int(11) DEFAULT NULL,
  `election_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `description` text,
  `picture` char(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `captchas` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `elections` (
  `id` int(11) NOT NULL,
  `election` varchar(63) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `results` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `logs` (
  `adminid` int(10) NOT NULL,
  `voterid` int(10) DEFAULT NULL,
  `blockid` int(10) DEFAULT NULL,
  `ipaddress` varchar(45) NOT NULL,
  `description` varchar(128) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `parties` (
  `id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  `party` varchar(63) NOT NULL,
  `alias` varchar(15) DEFAULT NULL,
  `description` text,
  `logo` char(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  `position` varchar(63) NOT NULL,
  `description` text,
  `maximum` smallint(6) NOT NULL,
  `ordinality` smallint(6) NOT NULL,
  `abstain` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sessions` (
  `id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `timestamp` int(10) NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `voted` (
  `election_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `image_trail_hash` char(40) DEFAULT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `votes` (
  `candidate_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
