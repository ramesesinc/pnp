-- MySQL dump 10.10
--
-- Host: localhost    Database: pnpdb
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `pnpdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pnpdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pnpdb`;

--
-- Table structure for table `barangay`
--

DROP TABLE IF EXISTS `barangay`;
CREATE TABLE `barangay` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `indexno` varchar(15) default NULL,
  `pin` varchar(15) default NULL,
  `name` varchar(50) default NULL,
  `previd` varchar(50) default NULL,
  `parentid` varchar(50) default NULL,
  `captain_name` varchar(100) default NULL,
  `captain_title` varchar(50) default NULL,
  `captain_office` varchar(50) default NULL,
  `treasurer_name` varchar(100) default NULL,
  `treasurer_title` varchar(50) default NULL,
  `treasurer_office` varchar(50) default NULL,
  `oldindexno` varchar(15) default NULL,
  `oldpin` varchar(15) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__barangay__530D6FE43A179ED3` (`objid`),
  UNIQUE KEY `ux_lgu_barangay_name` (`name`),
  UNIQUE KEY `ux_lgu_barangay_name_state` (`name`,`state`),
  KEY `ix_lgu_barangay_indexno` (`indexno`),
  KEY `ix_lgu_barangay_parentid` (`parentid`),
  KEY `ix_lgu_barangay_previd` (`previd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `barangay`
--

LOCK TABLES `barangay` WRITE;
/*!40000 ALTER TABLE `barangay` DISABLE KEYS */;
/*!40000 ALTER TABLE `barangay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
CREATE TABLE `entity` (
  `objid` varchar(50) NOT NULL,
  `entityno` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `mailingaddress` varchar(255) default NULL,
  `type` varchar(25) NOT NULL,
  `sys_lastupdate` varchar(25) default NULL,
  `sys_lastupdateby` varchar(50) default NULL,
  `remarks` varchar(300) default NULL,
  `entityname` varchar(300) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__entity__530D6FE44B7734FF` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entity`
--

LOCK TABLES `entity` WRITE;
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_fingerprint`
--

DROP TABLE IF EXISTS `entity_fingerprint`;
CREATE TABLE `entity_fingerprint` (
  `objid` varchar(50) character set utf8 NOT NULL default '',
  `entityid` varchar(50) character set utf8 NOT NULL default '',
  `dtfiled` datetime default NULL,
  `leftthumb_image` mediumblob NOT NULL,
  `leftthumb_fmd` mediumblob NOT NULL,
  `rightthumb_image` mediumblob NOT NULL,
  `rightthumb_fmd` mediumblob NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_entity_fingerprint_entityindividual` (`entityid`),
  CONSTRAINT `FK_entity_fingerprint_entityindividual` FOREIGN KEY (`entityid`) REFERENCES `entityindividual` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entity_fingerprint`
--

LOCK TABLES `entity_fingerprint` WRITE;
/*!40000 ALTER TABLE `entity_fingerprint` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_fingerprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_photo`
--

DROP TABLE IF EXISTS `entity_photo`;
CREATE TABLE `entity_photo` (
  `objid` varchar(50) character set utf8 NOT NULL default '',
  `entityid` varchar(50) character set utf8 default NULL,
  `dtfiled` datetime default NULL,
  `image` mediumblob NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_entity_photo_entityindividual` (`entityid`),
  CONSTRAINT `FK_entity_photo_entityindividual` FOREIGN KEY (`entityid`) REFERENCES `entityindividual` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entity_photo`
--

LOCK TABLES `entity_photo` WRITE;
/*!40000 ALTER TABLE `entity_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitycontact`
--

DROP TABLE IF EXISTS `entitycontact`;
CREATE TABLE `entitycontact` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `contacttype` varchar(25) NOT NULL,
  `contact` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__entityco__530D6FE447A6A41B` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entitycontact`
--

LOCK TABLES `entitycontact` WRITE;
/*!40000 ALTER TABLE `entitycontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitycontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entityidcard`
--

DROP TABLE IF EXISTS `entityidcard`;
CREATE TABLE `entityidcard` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `idtype` varchar(50) NOT NULL,
  `idno` varchar(25) NOT NULL,
  `expiry` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__entityid__530D6FE442E1EEFE` (`objid`),
  UNIQUE KEY `ux_entityidcard_entityid_idtype_idno` (`entityid`,`idtype`,`idno`),
  KEY `FK_entityidcard_entity` (`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entityidcard`
--

LOCK TABLES `entityidcard` WRITE;
/*!40000 ALTER TABLE `entityidcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityidcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entityindividual`
--

DROP TABLE IF EXISTS `entityindividual`;
CREATE TABLE `entityindividual` (
  `objid` varchar(50) NOT NULL,
  `lastname` varchar(800) NOT NULL,
  `firstname` varchar(800) NOT NULL,
  `middlename` varchar(800) default NULL,
  `birthdate` date default NULL,
  `birthplace` varchar(160) default NULL,
  `citizenship` varchar(50) default NULL,
  `gender` varchar(10) default NULL,
  `civilstatus` varchar(15) default NULL,
  `profession` varchar(50) default NULL,
  `tin` varchar(25) default NULL,
  `sss` varchar(25) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__entityin__530D6FE43F115E1A` (`objid`),
  KEY `ix_entityindividual_firstname` (`firstname`(255)),
  KEY `ix_entityindividual_lastname` (`lastname`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entityindividual`
--

LOCK TABLES `entityindividual` WRITE;
/*!40000 ALTER TABLE `entityindividual` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityindividual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entityindividual_physical`
--

DROP TABLE IF EXISTS `entityindividual_physical`;
CREATE TABLE `entityindividual_physical` (
  `objid` varchar(50) character set utf8 NOT NULL default '',
  `height` varchar(10) character set utf8 NOT NULL default '',
  `weight` varchar(10) character set utf8 NOT NULL default '',
  `eyecolor` varchar(15) character set utf8 default NULL,
  `haircolor` varchar(15) character set utf8 default NULL,
  `photo_objid` varchar(50) character set utf8 default NULL,
  `fingerprint_objid` varchar(50) character set utf8 default NULL,
  `signature_objid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_entityindividual_physical_fingerprint` (`fingerprint_objid`),
  KEY `FK_entityindividual_physical_photo` (`photo_objid`),
  CONSTRAINT `FK_entityindividual_physical_entity` FOREIGN KEY (`objid`) REFERENCES `entityindividual` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entityindividual_physical`
--

LOCK TABLES `entityindividual_physical` WRITE;
/*!40000 ALTER TABLE `entityindividual_physical` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityindividual_physical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entityjuridical`
--

DROP TABLE IF EXISTS `entityjuridical`;
CREATE TABLE `entityjuridical` (
  `objid` varchar(50) NOT NULL,
  `tin` varchar(25) default NULL,
  `dtregistered` timestamp NULL default NULL,
  `orgtype` varchar(25) default NULL,
  `nature` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__entityju__530D6FE43B40CD36` (`objid`),
  KEY `ix_tin` (`tin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entityjuridical`
--

LOCK TABLES `entityjuridical` WRITE;
/*!40000 ALTER TABLE `entityjuridical` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityjuridical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitymember`
--

DROP TABLE IF EXISTS `entitymember`;
CREATE TABLE `entitymember` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `itemno` int(10) NOT NULL,
  `prefix` varchar(25) default NULL,
  `taxpayer_objid` varchar(50) NOT NULL,
  `taxpayer_name` varchar(800) NOT NULL,
  `taxpayer_address` varchar(160) NOT NULL,
  `suffix` varchar(25) default NULL,
  `remarks` varchar(160) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__entityme__530D6FE437703C52` (`objid`),
  KEY `FK_entitymember_entity` (`entityid`),
  KEY `ix_taxpayer_name` (`taxpayer_name`(255)),
  KEY `ix_taxpayer_objid` (`taxpayer_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entitymember`
--

LOCK TABLES `entitymember` WRITE;
/*!40000 ALTER TABLE `entitymember` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitymember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitymultiple`
--

DROP TABLE IF EXISTS `entitymultiple`;
CREATE TABLE `entitymultiple` (
  `objid` varchar(50) NOT NULL,
  `fullname` text,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__entitymu__530D6FE4339FAB6E` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entitymultiple`
--

LOCK TABLES `entitymultiple` WRITE;
/*!40000 ALTER TABLE `entitymultiple` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitymultiple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policeclearance`
--

DROP TABLE IF EXISTS `policeclearance`;
CREATE TABLE `policeclearance` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `dtfiled` datetime default NULL,
  `createdby` varchar(50) default NULL,
  `dtverified` datetime default NULL,
  `verifiedby` varchar(50) default NULL,
  `docno` varchar(50) NOT NULL,
  `purpose` varchar(100) default NULL,
  `validfor` varchar(100) default NULL,
  `qualifier` varchar(50) default NULL,
  `findings` text,
  `person_objid` varchar(50) NOT NULL,
  `person_lastname` varchar(50) NOT NULL default '',
  `person_firstname` varchar(50) NOT NULL default '',
  `person_middlename` varchar(50) default NULL,
  `person_address` varchar(255) NOT NULL,
  `person_gender` varchar(10) NOT NULL default '',
  `person_civilstatus` varchar(15) default NULL,
  `person_citizenship` varchar(50) default NULL,
  `person_birthdate` date default NULL,
  `person_birthplace` varchar(150) default NULL,
  `person_religion` varchar(20) default NULL,
  `person_height` varchar(10) default NULL,
  `person_weight` varchar(10) default NULL,
  `person_profession` varchar(50) default NULL,
  `person_eyecolor` varchar(15) default NULL,
  `person_haircolor` varchar(15) default NULL,
  `photo_objid` varchar(50) default NULL,
  `fingerprint_objid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `uix_policeclearanceno` (`docno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policeclearance`
--

LOCK TABLES `policeclearance` WRITE;
/*!40000 ALTER TABLE `policeclearance` DISABLE KEYS */;
/*!40000 ALTER TABLE `policeclearance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policeclearance_attachment`
--

DROP TABLE IF EXISTS `policeclearance_attachment`;
CREATE TABLE `policeclearance_attachment` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `reftype` varchar(10) default NULL,
  `refno` varchar(50) default NULL,
  `dtissued` date default NULL,
  `placeissued` varchar(255) default NULL,
  `amount` decimal(10,2) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policeclearance_attachment`
--

LOCK TABLES `policeclearance_attachment` WRITE;
/*!40000 ALTER TABLE `policeclearance_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `policeclearance_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_org`
--

DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) default NULL,
  `orgclass` varchar(50) default NULL,
  `parentid` varchar(50) default NULL,
  `parentclass` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_org__530D6FE40D99FE17` (`objid`),
  UNIQUE KEY `idx_org_name` (`name`,`parentid`),
  KEY `FK_sys_org` (`parentclass`),
  KEY `FK_sys_org_orgclass` (`orgclass`),
  CONSTRAINT `sys_org_ibfk_1` FOREIGN KEY (`parentclass`) REFERENCES `sys_orgclass` (`name`),
  CONSTRAINT `sys_org_ibfk_2` FOREIGN KEY (`orgclass`) REFERENCES `sys_orgclass` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_org`
--

LOCK TABLES `sys_org` WRITE;
/*!40000 ALTER TABLE `sys_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_orgclass`
--

DROP TABLE IF EXISTS `sys_orgclass`;
CREATE TABLE `sys_orgclass` (
  `name` varchar(50) NOT NULL,
  `title` varchar(255) default NULL,
  `childnodes` varchar(255) default NULL,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `PK__sys_orgc__72E12F1A1DE57479` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_orgclass`
--

LOCK TABLES `sys_orgclass` WRITE;
/*!40000 ALTER TABLE `sys_orgclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_orgclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_script`
--

DROP TABLE IF EXISTS `sys_script`;
CREATE TABLE `sys_script` (
  `name` varchar(50) NOT NULL,
  `title` blob,
  `content` text,
  `category` varchar(20) default NULL,
  `dtcreated` timestamp NULL default NULL,
  `createdby` varchar(50) default NULL,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `PK__sys_scri__72E12F1A160F4887` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_script`
--

LOCK TABLES `sys_script` WRITE;
/*!40000 ALTER TABLE `sys_script` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_securitygroup`
--

DROP TABLE IF EXISTS `sys_securitygroup`;
CREATE TABLE `sys_securitygroup` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) default NULL,
  `usergroupid` varchar(50) default NULL,
  `exclude` text,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_secu__530D6FE4031C6FA4` (`objid`),
  UNIQUE KEY `idx_securitygroup_name` (`name`),
  KEY `FK_sys_securitygroup_usergroup` (`usergroupid`),
  CONSTRAINT `sys_securitygroup_ibfk_1` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_securitygroup`
--

LOCK TABLES `sys_securitygroup` WRITE;
/*!40000 ALTER TABLE `sys_securitygroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_securitygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(10) NOT NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_sequ__530D6FE43F466844` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_sequence`
--

LOCK TABLES `sys_sequence` WRITE;
/*!40000 ALTER TABLE `sys_sequence` DISABLE KEYS */;
INSERT INTO `sys_sequence` VALUES ('ENTITY',9);
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_session`
--

DROP TABLE IF EXISTS `sys_session`;
CREATE TABLE `sys_session` (
  `sessionid` varchar(50) NOT NULL,
  `userid` varchar(50) default NULL,
  `username` varchar(50) default NULL,
  `clienttype` varchar(12) default NULL,
  `accesstime` timestamp NULL default NULL,
  `accessexpiry` timestamp NULL default NULL,
  `timein` timestamp NULL default NULL,
  PRIMARY KEY  (`sessionid`),
  UNIQUE KEY `PK__sys_sess__23D816133B75D760` (`sessionid`),
  KEY `ix_timein` (`timein`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_session`
--

LOCK TABLES `sys_session` WRITE;
/*!40000 ALTER TABLE `sys_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_session_log`
--

DROP TABLE IF EXISTS `sys_session_log`;
CREATE TABLE `sys_session_log` (
  `sessionid` varchar(50) NOT NULL,
  `userid` varchar(50) default NULL,
  `username` varchar(50) default NULL,
  `clienttype` varchar(12) default NULL,
  `accesstime` timestamp NULL default NULL,
  `accessexpiry` timestamp NULL default NULL,
  `timein` timestamp NULL default NULL,
  `timeout` timestamp NULL default NULL,
  `state` varchar(10) default NULL,
  PRIMARY KEY  (`sessionid`),
  UNIQUE KEY `PK__sys_sess__23D8161337A5467C` (`sessionid`),
  KEY `ix_timein` (`timein`),
  KEY `ix_timeout` (`timeout`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_session_log`
--

LOCK TABLES `sys_session_log` WRITE;
/*!40000 ALTER TABLE `sys_session_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_session_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_terminal`
--

DROP TABLE IF EXISTS `sys_terminal`;
CREATE TABLE `sys_terminal` (
  `terminalid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `parentcode` varchar(50) default NULL,
  `parenttype` varchar(50) default NULL,
  `macaddress` varchar(50) default NULL,
  `dtregistered` timestamp NULL default NULL,
  `registeredby` varchar(50) default NULL,
  `info` text,
  `state` int(10) default NULL,
  PRIMARY KEY  (`terminalid`),
  UNIQUE KEY `PK__sys_term__4FDBF6DF33D4B598` (`terminalid`),
  KEY `FK_terminal` (`parentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_terminal`
--

LOCK TABLES `sys_terminal` WRITE;
/*!40000 ALTER TABLE `sys_terminal` DISABLE KEYS */;
INSERT INTO `sys_terminal` VALUES ('MAIN1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('MAIN2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) default NULL,
  `dtcreated` timestamp NULL default NULL,
  `createdby` varchar(50) default NULL,
  `username` varchar(50) default NULL,
  `pwd` varchar(50) default NULL,
  `firstname` varchar(50) default NULL,
  `lastname` varchar(50) default NULL,
  `middlename` varchar(50) default NULL,
  `name` varchar(50) default NULL,
  `jobtitle` varchar(50) default NULL,
  `pwdlogincount` int(10) default NULL,
  `pwdexpirydate` timestamp NULL default NULL,
  `usedpwds` text,
  `lockid` varchar(32) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_user__530D6FE42F10007B` (`objid`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `ix_lastname_firstname` (`lastname`,`firstname`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('USR-10bf4273:14331ef3968:-7f8d','DRAFT',NULL,'sa','WFLORES','cd8f54cc23e1c9d9093846f7ef5ecc5f','WORGIE','FLORES','V','FLORES, WORGIE V',NULL,0,'2014-01-27 02:46:18','07015d0b6a711f61efc9674b3662e1b1,cd8f54cc23e1c9d9093846f7ef5ecc5f','LOCK-706fca3d:14331bda2d1:-7ffc');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup`
--

DROP TABLE IF EXISTS `sys_usergroup`;
CREATE TABLE `sys_usergroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) default NULL,
  `domain` varchar(25) default NULL,
  `userclass` varchar(25) default NULL,
  `orgclass` varchar(50) default NULL,
  `role` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_user__530D6FE42B3F6F97` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_usergroup`
--

LOCK TABLES `sys_usergroup` WRITE;
/*!40000 ALTER TABLE `sys_usergroup` DISABLE KEYS */;
INSERT INTO `sys_usergroup` VALUES ('DATAMGMT.ENTITY_ENCODER','ENTITY ENCODER','DATAMGMT','usergroup',NULL,'ENTITY_ENCODER'),('POLICE.ENCODER','POLICE Encoder','POLICE','usergroup',NULL,'ENCODER'),('POLICE.VERIFIER','POLICE Verifier','POLICE','usergroup',NULL,'VERIFIER');
/*!40000 ALTER TABLE `sys_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup_admin`
--

DROP TABLE IF EXISTS `sys_usergroup_admin`;
CREATE TABLE `sys_usergroup_admin` (
  `objid` varchar(50) NOT NULL,
  `usergroupid` varchar(50) default NULL,
  `user_objid` varchar(50) default NULL,
  `user_username` varchar(50) default NULL,
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) default NULL,
  `exclude` varchar(255) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_user__530D6FE45555A4F4` (`objid`),
  UNIQUE KEY `idx_usergroup_admin_user` (`usergroupid`,`user_objid`),
  KEY `FK_sys_usergroup_admin` (`user_objid`),
  CONSTRAINT `sys_usergroup_admin_ibfk_1` FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `sys_usergroup_admin_ibfk_2` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_usergroup_admin`
--

LOCK TABLES `sys_usergroup_admin` WRITE;
/*!40000 ALTER TABLE `sys_usergroup_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup_member`
--

DROP TABLE IF EXISTS `sys_usergroup_member`;
CREATE TABLE `sys_usergroup_member` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default NULL,
  `usergroupid` varchar(50) default NULL,
  `user_objid` varchar(50) NOT NULL,
  `user_username` varchar(50) default NULL,
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `org_objid` varchar(50) default NULL,
  `org_name` varchar(50) default NULL,
  `org_orgclass` varchar(50) default NULL,
  `securitygroupid` varchar(50) default NULL,
  `exclude` varchar(255) default NULL,
  `displayname` varchar(50) default NULL,
  `jobtitle` varchar(50) default NULL,
  `usertxncode` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK_sys_usergroup_member` (`objid`),
  KEY `FK_sys_usergroup_member` (`user_objid`),
  KEY `FK_sys_usergroup_member_org` (`org_objid`),
  KEY `FK_sys_usergroup_member_securitygorup` (`securitygroupid`),
  KEY `ix_user_firstname` (`user_firstname`),
  KEY `ix_user_lastname_firstname` (`user_lastname`,`user_firstname`),
  KEY `ix_username` (`user_username`),
  KEY `FK_sys_usergroup_member_usergroup` (`usergroupid`),
  CONSTRAINT `sys_usergroup_member_ibfk_1` FOREIGN KEY (`org_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_2` FOREIGN KEY (`securitygroupid`) REFERENCES `sys_securitygroup` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_3` FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_4` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_usergroup_member`
--

LOCK TABLES `sys_usergroup_member` WRITE;
/*!40000 ALTER TABLE `sys_usergroup_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup_permission`
--

DROP TABLE IF EXISTS `sys_usergroup_permission`;
CREATE TABLE `sys_usergroup_permission` (
  `objid` varchar(50) NOT NULL,
  `usergroupid` varchar(50) default NULL,
  `object` varchar(25) default NULL,
  `permission` varchar(25) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_user__530D6FE45EDF0F2E` (`objid`),
  KEY `FK_sys_usergroup_permission_usergroup` (`usergroupid`),
  CONSTRAINT `sys_usergroup_permission_ibfk_1` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_usergroup_permission`
--

LOCK TABLES `sys_usergroup_permission` WRITE;
/*!40000 ALTER TABLE `sys_usergroup_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_var`
--

DROP TABLE IF EXISTS `sys_var`;
CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` text,
  `description` varchar(255) default NULL,
  `datatype` varchar(15) default NULL,
  `category` varchar(50) default NULL,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `PK__sys_var__72E12F1A0D7A0286` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_var`
--

LOCK TABLES `sys_var` WRITE;
/*!40000 ALTER TABLE `sys_var` DISABLE KEYS */;
INSERT INTO `sys_var` VALUES ('invalid_login_access_date_interval','1m','number of hours/days access date is moved when failed_login_max_retries is reached( d=days, h=hours)',NULL,NULL),('invalid_login_action','1','0 - suspend 1-move access to a later date',NULL,NULL),('invalid_login_max_retries','5','No. of times a user can retry login before disabling account',NULL,NULL),('pwd_change_cycle','3','No. of times the user cannot use a repeating password',NULL,'SYSTEM'),('pwd_change_date_interval','1M','No. of days/months before a user is required to change their password (d=days, M=months)',NULL,'SYSTEM'),('pwd_change_login_count','0','No. of times a user has successfully logged in before changing their password. (0=no limit) ',NULL,'SYSTEM'),('sa_pwd','560145c20d7508ecb59223999c4654dd',NULL,NULL,NULL),('server_timezone','Asia/Shanghai','this must be matched with default timezone of server',NULL,NULL),('session_timeout_interval','1d ','expiry dates of inactive session (d=days, h=hours)',NULL,'SYSTEM'),('system_pwd','!12345','system password',NULL,'SYSTEM'),('url_logo','http://localhost/downloads/images/treasury.png','PNP LOGO',NULL,'PNP');
/*!40000 ALTER TABLE `sys_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warrant`
--

DROP TABLE IF EXISTS `warrant`;
CREATE TABLE `warrant` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `dtissued` date NOT NULL,
  `crimecaseno` varchar(50) NOT NULL,
  `crimecase` varchar(100) NOT NULL,
  `courtname` varchar(100) NOT NULL,
  `judgename` varchar(100) NOT NULL,
  `remarks` text,
  `bailamount` decimal(18,2) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `middlename` varchar(25) default '',
  `alias` varchar(25) default NULL,
  `address` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warrant`
--

LOCK TABLES `warrant` WRITE;
/*!40000 ALTER TABLE `warrant` DISABLE KEYS */;
/*!40000 ALTER TABLE `warrant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-30  9:37:52
