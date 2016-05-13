-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2016 at 02:07 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hu-capital`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidateclassskilltable`
--

CREATE TABLE `candidateclassskilltable` (
  `idcandidateclassskill` int(11) NOT NULL,
  `idcandidate` varchar(14) NOT NULL,
  `idclassskill` int(11) NOT NULL,
  `score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidateinstitutemajortable`
--

CREATE TABLE `candidateinstitutemajortable` (
  `idcandidateinstitutemajor` int(11) NOT NULL,
  `idcandidate` varchar(14) NOT NULL,
  `idinstitute` int(11) NOT NULL,
  `idmajor` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidateskilltable`
--

CREATE TABLE `candidateskilltable` (
  `idcandidateskill` int(11) NOT NULL,
  `idcandidate` varchar(14) NOT NULL,
  `idskill` int(11) NOT NULL,
  `average` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidatetable`
--

CREATE TABLE `candidatetable` (
  `idcandidate` varchar(14) NOT NULL,
  `nameCandidate` text NOT NULL,
  `sexCandidate` varchar(1) NOT NULL,
  `datebirthCandidate` date NOT NULL,
  `telephoneCandidate` varchar(13) NOT NULL,
  `addressCandidate` varchar(120) NOT NULL,
  `emailCandidate` varchar(50) NOT NULL,
  `countryCandidate` varchar(40) NOT NULL,
  `cityCandidate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `classskilltable`
--

CREATE TABLE `classskilltable` (
  `idclassskill` int(11) NOT NULL,
  `idclass` int(11) NOT NULL,
  `idskill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `classtable`
--

CREATE TABLE `classtable` (
  `idclass` int(11) NOT NULL,
  `nameClass` varchar(50) NOT NULL,
  `idmajor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `companytable`
--

CREATE TABLE `companytable` (
  `idcompany` int(11) NOT NULL,
  `nameCompany` varchar(30) NOT NULL,
  `nameUserCompany` varchar(20) NOT NULL,
  `passUserCompany` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `consultationtable`
--

CREATE TABLE `consultationtable` (
  `idconsultation` int(11) NOT NULL,
  `idcompany` int(11) NOT NULL,
  `idcandidate` varchar(14) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institutemajortable`
--

CREATE TABLE `institutemajortable` (
  `idinstitutemajor` int(11) NOT NULL,
  `idinstitute` int(11) NOT NULL,
  `idmajor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institutetable`
--

CREATE TABLE `institutetable` (
  `idinstitute` int(11) NOT NULL,
  `nameInstitute` varchar(100) NOT NULL,
  `logoinstitute` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `majortable`
--

CREATE TABLE `majortable` (
  `idmajor` int(11) NOT NULL,
  `nameMajor` varchar(70) NOT NULL,
  `idtypemajor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `skilltable`
--

CREATE TABLE `skilltable` (
  `idskill` int(11) NOT NULL,
  `nameSkill` varchar(50) NOT NULL,
  `idmajor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `typemajortable`
--

CREATE TABLE `typemajortable` (
  `idtypemajor` int(11) NOT NULL,
  `nameTypeMajor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `iduser` int(11) NOT NULL,
  `nameUser` varchar(20) NOT NULL DEFAULT '',
  `passUser` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`iduser`, `nameUser`, `passUser`) VALUES
(1, 'admin', '1234'),
(3, 'jose', 'jose');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidateclassskilltable`
--
ALTER TABLE `candidateclassskilltable`
  ADD PRIMARY KEY (`idcandidateclassskill`),
  ADD KEY `idcandidate` (`idcandidate`),
  ADD KEY `idclassskill` (`idclassskill`);

--
-- Indexes for table `candidateinstitutemajortable`
--
ALTER TABLE `candidateinstitutemajortable`
  ADD PRIMARY KEY (`idcandidateinstitutemajor`),
  ADD KEY `idcandidate` (`idcandidate`),
  ADD KEY `idinstitute` (`idinstitute`),
  ADD KEY `idmajor` (`idmajor`);

--
-- Indexes for table `candidateskilltable`
--
ALTER TABLE `candidateskilltable`
  ADD PRIMARY KEY (`idcandidateskill`),
  ADD KEY `idcandidate` (`idcandidate`),
  ADD KEY `idskill` (`idskill`);

--
-- Indexes for table `candidatetable`
--
ALTER TABLE `candidatetable`
  ADD PRIMARY KEY (`idcandidate`);

--
-- Indexes for table `classskilltable`
--
ALTER TABLE `classskilltable`
  ADD PRIMARY KEY (`idclassskill`),
  ADD KEY `idclass` (`idclass`),
  ADD KEY `idskill` (`idskill`);

--
-- Indexes for table `classtable`
--
ALTER TABLE `classtable`
  ADD PRIMARY KEY (`idclass`),
  ADD KEY `idmajor` (`idmajor`);

--
-- Indexes for table `companytable`
--
ALTER TABLE `companytable`
  ADD PRIMARY KEY (`idcompany`);

--
-- Indexes for table `consultationtable`
--
ALTER TABLE `consultationtable`
  ADD PRIMARY KEY (`idconsultation`),
  ADD KEY `idcompany` (`idcompany`),
  ADD KEY `idcandidate` (`idcandidate`);

--
-- Indexes for table `institutemajortable`
--
ALTER TABLE `institutemajortable`
  ADD PRIMARY KEY (`idinstitutemajor`),
  ADD KEY `idinstitute` (`idinstitute`),
  ADD KEY `idmajor` (`idmajor`);

--
-- Indexes for table `institutetable`
--
ALTER TABLE `institutetable`
  ADD PRIMARY KEY (`idinstitute`);

--
-- Indexes for table `majortable`
--
ALTER TABLE `majortable`
  ADD PRIMARY KEY (`idmajor`),
  ADD KEY `idtypemajor` (`idtypemajor`);

--
-- Indexes for table `skilltable`
--
ALTER TABLE `skilltable`
  ADD PRIMARY KEY (`idskill`),
  ADD KEY `idmajor` (`idmajor`);

--
-- Indexes for table `typemajortable`
--
ALTER TABLE `typemajortable`
  ADD PRIMARY KEY (`idtypemajor`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidateclassskilltable`
--
ALTER TABLE `candidateclassskilltable`
  MODIFY `idcandidateclassskill` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `candidateinstitutemajortable`
--
ALTER TABLE `candidateinstitutemajortable`
  MODIFY `idcandidateinstitutemajor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `candidateskilltable`
--
ALTER TABLE `candidateskilltable`
  MODIFY `idcandidateskill` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `classskilltable`
--
ALTER TABLE `classskilltable`
  MODIFY `idclassskill` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `classtable`
--
ALTER TABLE `classtable`
  MODIFY `idclass` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `companytable`
--
ALTER TABLE `companytable`
  MODIFY `idcompany` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `consultationtable`
--
ALTER TABLE `consultationtable`
  MODIFY `idconsultation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `institutemajortable`
--
ALTER TABLE `institutemajortable`
  MODIFY `idinstitutemajor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `institutetable`
--
ALTER TABLE `institutetable`
  MODIFY `idinstitute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `majortable`
--
ALTER TABLE `majortable`
  MODIFY `idmajor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `skilltable`
--
ALTER TABLE `skilltable`
  MODIFY `idskill` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `typemajortable`
--
ALTER TABLE `typemajortable`
  MODIFY `idtypemajor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usertable`
--
ALTER TABLE `usertable`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidateclassskilltable`
--
ALTER TABLE `candidateclassskilltable`
  ADD CONSTRAINT `candidateclassskilltable_ibfk_1` FOREIGN KEY (`idcandidate`) REFERENCES `candidatetable` (`idcandidate`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidateclassskilltable_ibfk_2` FOREIGN KEY (`idclassskill`) REFERENCES `classskilltable` (`idclassskill`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `candidateinstitutemajortable`
--
ALTER TABLE `candidateinstitutemajortable`
  ADD CONSTRAINT `candidateinstitutemajortable_ibfk_1` FOREIGN KEY (`idinstitute`) REFERENCES `institutetable` (`idinstitute`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidateinstitutemajortable_ibfk_2` FOREIGN KEY (`idcandidate`) REFERENCES `candidatetable` (`idcandidate`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidateinstitutemajortable_ibfk_3` FOREIGN KEY (`idmajor`) REFERENCES `majortable` (`idmajor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `candidateskilltable`
--
ALTER TABLE `candidateskilltable`
  ADD CONSTRAINT `candidateskilltable_ibfk_1` FOREIGN KEY (`idcandidate`) REFERENCES `candidatetable` (`idcandidate`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidateskilltable_ibfk_2` FOREIGN KEY (`idskill`) REFERENCES `skilltable` (`idskill`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classskilltable`
--
ALTER TABLE `classskilltable`
  ADD CONSTRAINT `classskilltable_ibfk_1` FOREIGN KEY (`idclass`) REFERENCES `classtable` (`idclass`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classskilltable_ibfk_2` FOREIGN KEY (`idskill`) REFERENCES `skilltable` (`idskill`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classtable`
--
ALTER TABLE `classtable`
  ADD CONSTRAINT `classtable_ibfk_1` FOREIGN KEY (`idmajor`) REFERENCES `majortable` (`idmajor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `consultationtable`
--
ALTER TABLE `consultationtable`
  ADD CONSTRAINT `consultationtable_ibfk_1` FOREIGN KEY (`idcompany`) REFERENCES `companytable` (`idcompany`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consultationtable_ibfk_2` FOREIGN KEY (`idcandidate`) REFERENCES `candidatetable` (`idcandidate`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `institutemajortable`
--
ALTER TABLE `institutemajortable`
  ADD CONSTRAINT `institutemajortable_ibfk_1` FOREIGN KEY (`idinstitute`) REFERENCES `institutetable` (`idinstitute`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institutemajortable_ibfk_2` FOREIGN KEY (`idmajor`) REFERENCES `majortable` (`idmajor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `majortable`
--
ALTER TABLE `majortable`
  ADD CONSTRAINT `majortable_ibfk_1` FOREIGN KEY (`idtypemajor`) REFERENCES `typemajortable` (`idtypemajor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skilltable`
--
ALTER TABLE `skilltable`
  ADD CONSTRAINT `skilltable_ibfk_1` FOREIGN KEY (`idmajor`) REFERENCES `majortable` (`idmajor`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
