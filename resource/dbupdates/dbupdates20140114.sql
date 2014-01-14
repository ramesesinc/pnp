USE pnpdb;

ALTER TABLE `policeclearance`
	ADD dtcertified DATETIME,
	ADD certifiedby VARCHAR(50),
	ADD certifiedremarks VARCHAR(255);

ALTER TABLE `policeclearance` ADD INDEX `ix_dtverifiedby` (`dtverified`,`verifiedby`);
ALTER TABLE `policeclearance` ADD INDEX `ix_name` (`person_lastname`,`person_firstname`,`person_middlename`);
ALTER TABLE `policeclearance` ADD INDEX `ix_dtfiled` (`dtfiled`);
ALTER TABLE `policeclearance` ADD INDEX `ix_person_objid` (`person_objid`);
ALTER TABLE `policeclearance` ADD INDEX `ix_dtcertifiedby` (`dtcertified`,`certifiedby`);
ALTER TABLE `policeclearance` ADD INDEX `ix_photo_objid` (`photo_objid`);
ALTER TABLE `policeclearance` ADD INDEX `ix_fingerprint_objid` (`fingerprint_objid`); 

CREATE TABLE IF NOT EXISTS `signatory` (
  `objid` VARCHAR(50) CHARACTER SET latin1 NOT NULL,
  `state` VARCHAR(10) CHARACTER SET latin1 NOT NULL,
  `doctype` VARCHAR(50) CHARACTER SET latin1 NOT NULL,
  `indexno` INT(10) NOT NULL,
  `lastname` VARCHAR(50) CHARACTER SET latin1 NOT NULL,
  `firstname` VARCHAR(50) CHARACTER SET latin1 NOT NULL,
  `middlename` VARCHAR(50) CHARACTER SET latin1 DEFAULT 'L',
  `name` VARCHAR(150) CHARACTER SET latin1 DEFAULT 'L',
  `title` VARCHAR(50) CHARACTER SET latin1 NOT NULL,
  `department` VARCHAR(50) CHARACTER SET latin1 DEFAULT 'L',
  `personnelid` VARCHAR(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_lfm` (`lastname`,`firstname`,`middlename`),
  KEY `ix_name` (`name`),
  KEY `ix_personnelid` (`personnelid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8; 
