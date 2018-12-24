-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 24, 2018 at 06:12 AM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `swift`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `sys_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `affected_areas`
--

CREATE TABLE `affected_areas` (
  `id` int(11) NOT NULL,
  `inc_id` int(11) NOT NULL,
  `province` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `town` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` int(11) NOT NULL,
  `inc_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `published_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `casualties`
--

CREATE TABLE `casualties` (
  `id` int(11) NOT NULL,
  `inc_id` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `wounded` int(11) NOT NULL,
  `missing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_numbers`
--

CREATE TABLE `contact_numbers` (
  `id` int(11) NOT NULL,
  `sys_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `contact` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `last_logged_in` datetime DEFAULT NULL,
  `is_admin` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `emp_id`, `first_name`, `last_name`, `password`, `contact`, `email`, `last_logged_in`, `is_admin`) VALUES
(8, 'E555', 'Dhamith', 'Hewamullage', '$2y$10$uoDwT644cgxMPPaNfhbA8.G3ItHy35tWgLyWCnURcTW.NDIiie87W', '+94773630792', 'hewamullage123@gmail.com', '2018-12-24 09:46:05', 1),
(9, 'E666', 'Test', 'Lamb', '$2y$10$mpGZgEv5MOwnE1ZlDSJiTu3qdH61bFbUH9AatC8an2iCgvEIAxUfa', '123123', 'test@test.com', '2018-12-24 09:45:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `evacuations`
--

CREATE TABLE `evacuations` (
  `id` int(11) NOT NULL,
  `inc_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(15) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `leader` int(11) NOT NULL,
  `responding_incident` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hospitalizations`
--

CREATE TABLE `hospitalizations` (
  `id` int(11) NOT NULL,
  `inc_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `incidents`
--

CREATE TABLE `incidents` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `hazard_warning` text NOT NULL,
  `on_going` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `msg_brd_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `published_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message_by_emp` int(11) NOT NULL,
  `message_by_res` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message_boards`
--

CREATE TABLE `message_boards` (
  `id` int(11) NOT NULL,
  `inc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `type_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `organization_types`
--

CREATE TABLE `organization_types` (
  `id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `organization_types`
--

INSERT INTO `organization_types` (`id`, `type`) VALUES
(1, 'hospital'),
(2, 'fire-brigade'),
(3, 'ambulance-service'),
(4, 'police'),
(5, 's&r'),
(6, 'military'),
(7, 'pc'),
(8, 'uc'),
(9, 'ps');

-- --------------------------------------------------------

--
-- Table structure for table `press_releases`
--

CREATE TABLE `press_releases` (
  `id` int(11) NOT NULL,
  `inc_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `published_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `written_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `property_damagers`
--

CREATE TABLE `property_damagers` (
  `id` int(11) NOT NULL,
  `inc_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `responders`
--

CREATE TABLE `responders` (
  `id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `responding_areas`
--

CREATE TABLE `responding_areas` (
  `id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `province` varchar(200) NOT NULL,
  `district` varchar(200) NOT NULL,
  `town` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `responding_organizations`
--

CREATE TABLE `responding_organizations` (
  `id` int(11) NOT NULL,
  `inc_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `system_information`
--

CREATE TABLE `system_information` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `sub_title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD KEY `sys_id` (`sys_id`);

--
-- Indexes for table `affected_areas`
--
ALTER TABLE `affected_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inc_id` (`inc_id`);

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inc_id` (`inc_id`);

--
-- Indexes for table `casualties`
--
ALTER TABLE `casualties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inc_id` (`inc_id`);

--
-- Indexes for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_id` (`sys_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `evacuations`
--
ALTER TABLE `evacuations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inc_id` (`inc_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`),
  ADD KEY `leader` (`leader`),
  ADD KEY `responding_incident` (`responding_incident`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `res_id` (`res_id`);

--
-- Indexes for table `hospitalizations`
--
ALTER TABLE `hospitalizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inc_id` (`inc_id`);

--
-- Indexes for table `incidents`
--
ALTER TABLE `incidents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `msg_brd_id` (`msg_brd_id`),
  ADD KEY `message_by_emp` (`message_by_emp`),
  ADD KEY `message_by_res` (`message_by_res`);

--
-- Indexes for table `message_boards`
--
ALTER TABLE `message_boards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inc_id` (`inc_id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `organization_types`
--
ALTER TABLE `organization_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `press_releases`
--
ALTER TABLE `press_releases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inc_id` (`inc_id`),
  ADD KEY `written_by` (`written_by`);

--
-- Indexes for table `property_damagers`
--
ALTER TABLE `property_damagers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inc_id` (`inc_id`);

--
-- Indexes for table `responders`
--
ALTER TABLE `responders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`);

--
-- Indexes for table `responding_areas`
--
ALTER TABLE `responding_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`);

--
-- Indexes for table `responding_organizations`
--
ALTER TABLE `responding_organizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inc_id` (`inc_id`),
  ADD KEY `org_id` (`org_id`);

--
-- Indexes for table `system_information`
--
ALTER TABLE `system_information`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affected_areas`
--
ALTER TABLE `affected_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `casualties`
--
ALTER TABLE `casualties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `evacuations`
--
ALTER TABLE `evacuations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospitalizations`
--
ALTER TABLE `hospitalizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incidents`
--
ALTER TABLE `incidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_boards`
--
ALTER TABLE `message_boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `organization_types`
--
ALTER TABLE `organization_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `press_releases`
--
ALTER TABLE `press_releases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_damagers`
--
ALTER TABLE `property_damagers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `responders`
--
ALTER TABLE `responders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `responding_areas`
--
ALTER TABLE `responding_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `responding_organizations`
--
ALTER TABLE `responding_organizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_information`
--
ALTER TABLE `system_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`sys_id`) REFERENCES `system_information` (`id`);

--
-- Constraints for table `affected_areas`
--
ALTER TABLE `affected_areas`
  ADD CONSTRAINT `affected_areas_ibfk_1` FOREIGN KEY (`inc_id`) REFERENCES `incidents` (`id`);

--
-- Constraints for table `alerts`
--
ALTER TABLE `alerts`
  ADD CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`inc_id`) REFERENCES `incidents` (`id`);

--
-- Constraints for table `casualties`
--
ALTER TABLE `casualties`
  ADD CONSTRAINT `casualties_ibfk_1` FOREIGN KEY (`inc_id`) REFERENCES `incidents` (`id`);

--
-- Constraints for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  ADD CONSTRAINT `contact_numbers_ibfk_1` FOREIGN KEY (`sys_id`) REFERENCES `system_information` (`id`);

--
-- Constraints for table `evacuations`
--
ALTER TABLE `evacuations`
  ADD CONSTRAINT `evacuations_ibfk_1` FOREIGN KEY (`inc_id`) REFERENCES `incidents` (`id`);

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`),
  ADD CONSTRAINT `groups_ibfk_2` FOREIGN KEY (`leader`) REFERENCES `responders` (`id`),
  ADD CONSTRAINT `groups_ibfk_3` FOREIGN KEY (`responding_incident`) REFERENCES `incidents` (`id`);

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `responders` (`id`);

--
-- Constraints for table `hospitalizations`
--
ALTER TABLE `hospitalizations`
  ADD CONSTRAINT `hospitalizations_ibfk_1` FOREIGN KEY (`inc_id`) REFERENCES `incidents` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`msg_brd_id`) REFERENCES `message_boards` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`message_by_emp`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`message_by_res`) REFERENCES `responders` (`id`);

--
-- Constraints for table `message_boards`
--
ALTER TABLE `message_boards`
  ADD CONSTRAINT `message_boards_ibfk_1` FOREIGN KEY (`inc_id`) REFERENCES `incidents` (`id`);

--
-- Constraints for table `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `organizations_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `organization_types` (`id`);

--
-- Constraints for table `press_releases`
--
ALTER TABLE `press_releases`
  ADD CONSTRAINT `press_releases_ibfk_1` FOREIGN KEY (`inc_id`) REFERENCES `incidents` (`id`),
  ADD CONSTRAINT `press_releases_ibfk_2` FOREIGN KEY (`written_by`) REFERENCES `employees` (`id`);

--
-- Constraints for table `property_damagers`
--
ALTER TABLE `property_damagers`
  ADD CONSTRAINT `property_damagers_ibfk_1` FOREIGN KEY (`inc_id`) REFERENCES `incidents` (`id`);

--
-- Constraints for table `responders`
--
ALTER TABLE `responders`
  ADD CONSTRAINT `responders_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `responding_areas`
--
ALTER TABLE `responding_areas`
  ADD CONSTRAINT `responding_areas_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `responding_organizations`
--
ALTER TABLE `responding_organizations`
  ADD CONSTRAINT `responding_organizations_ibfk_1` FOREIGN KEY (`inc_id`) REFERENCES `incidents` (`id`),
  ADD CONSTRAINT `responding_organizations_ibfk_2` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`);