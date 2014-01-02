USE pnpdb;

CREATE TABLE IF NOT EXISTS `case_status` 
(
  `objid` VARCHAR(50) NOT NULL,
  `state` VARCHAR(25) DEFAULT NULL,
  `dtfiled` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(50) DEFAULT NULL,
  `code` VARCHAR(50) DEFAULT NULL,
  `description` VARCHAR(150) DEFAULT NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `uix_code` (`code`),
  KEY `ix_dtcreatedby` (`dtfiled`,`createdby`),
  KEY `ix_description` (`description`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `warrant_new` (
  `objid` VARCHAR(50) CHARACTER SET latin1 NOT NULL,
  `state` VARCHAR(50) CHARACTER SET latin1 DEFAULT NULL,
  `dtfiled` DATETIME DEFAULT NULL,
  `createdby` VARCHAR(50) CHARACTER SET latin1 DEFAULT NULL,
  `dtissued` DATE DEFAULT NULL,
  `crimecaseno` VARCHAR(50) CHARACTER SET latin1 DEFAULT NULL,
  `crimecasedesc` VARCHAR(100) CHARACTER SET latin1 DEFAULT NULL,
  `courtname` VARCHAR(150) CHARACTER SET latin1 DEFAULT NULL,
  `judgename` VARCHAR(150) CHARACTER SET latin1 DEFAULT NULL,
  `remarks` TEXT CHARACTER SET latin1,
  `bailamount` DECIMAL(18,2) DEFAULT NULL,
  `lastname` VARCHAR(50) CHARACTER SET latin1 DEFAULT NULL,
  `firstname` VARCHAR(50) CHARACTER SET latin1 DEFAULT NULL,
  `middlename` VARCHAR(50) CHARACTER SET latin1 DEFAULT NULL,
  `address` VARCHAR(255) CHARACTER SET latin1 DEFAULT NULL,
  `alias` VARCHAR(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_dtfiledby` (`dtfiled`,`createdby`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_crimecaseno` (`crimecaseno`),
  KEY `ix_name` (`lastname`,`firstname`,`middlename`)
) ENGINE=INNODB DEFAULT CHARSET=utf8; 

INSERT IGNORE INTO warrant_new 
(
  objid, state, dtissued, crimecaseno, crimecasedesc, courtname, judgename, 
  remarks, bailamount, lastname, firstname, middlename, address, alias 
)
SELECT
  objid, state, dtissued, crimecaseno, crimecasedesc, courtname, judgename, 
  remarks, bailamount, lastname, firstname, middlename, address, alias 
FROM warrant; 

DROP TABLE IF EXISTS `warrant`;

RENAME TABLE `warrant_new` TO `warrant`;

ALTER TABLE `sys_securitygroup` 
  DROP INDEX `PK__sys_secu__530D6FE4031C6FA4`, 
  DROP INDEX `idx_securitygroup_name`, 
  ADD UNIQUE INDEX `uix_securitygroup_name` (`name`, `usergroupid`); 

INSERT IGNORE INTO `sys_usergroup` (objid, title, domain, userclass, orgclass, role) VALUES ('DATAMGMT.ENTITY_ENCODER', 'ENTITY ENCODER', 'DATAMGMT', 'usergroup', NULL, 'ENTITY_ENCODER'); 
INSERT IGNORE INTO `sys_usergroup` (objid, title, domain, userclass, orgclass, role) VALUES ('POLICE.APPROVER', 'POLICE Approver', 'POLICE', 'usergroup', NULL, 'APPROVER'); 
INSERT IGNORE INTO `sys_usergroup` (objid, title, domain, userclass, orgclass, role) VALUES ('POLICE.DATAMGMT_AUTHOR', 'POLICE Master File Author', 'POLICE', 'usergroup', NULL, 'DATAMGMT_AUTHOR'); 
INSERT IGNORE INTO `sys_usergroup` (objid, title, domain, userclass, orgclass, role) VALUES ('POLICE.ENCODER', 'POLICE Encoder', 'POLICE', 'usergroup', NULL, 'ENCODER'); 
INSERT IGNORE INTO `sys_usergroup` (objid, title, domain, userclass, orgclass, role) VALUES ('POLICE.VERIFIER', 'POLICE Encoder', 'POLICE', 'usergroup', NULL, 'VERIFIER'); 

INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER001','POLICE.ENCODER','case_status','read');         
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER002','POLICE.ENCODER','case_status','create');       
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER003','POLICE.ENCODER','case_status','update');       
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER004','POLICE.ENCODER','case_status','delete');       
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER005','POLICE.ENCODER','case_status','approve');      
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER007','POLICE.ENCODER','warrant','read');             
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER008','POLICE.ENCODER','warrant','create');           
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER009','POLICE.ENCODER','warrant','update');           
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER010','POLICE.ENCODER','warrant','delete');           
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER011','POLICE.ENCODER','warrant','approve');          
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER012','POLICE.ENCODER','policeclearance','create');   
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER013','POLICE.ENCODER','policeclearance','read');     
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER014','POLICE.ENCODER','policeclearance','update');   
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER015','POLICE.ENCODER','policeclearance','delete');   
INSERT IGNORE INTO `sys_usergroup_permission` (objid,usergroupid,object,permission) VALUES ('POLICE.ENCODER016','POLICE.ENCODER','policeclearance','approve');  

INSERT IGNORE INTO `sys_securitygroup` (objid,`name`,usergroupid,exclude) VALUES ('POLICE.APPROVER.SG001','(Default)','POLICE.APPROVER',NULL); 
INSERT IGNORE INTO `sys_securitygroup` (objid,`name`,usergroupid,exclude) VALUES ('POLICE.DATAMGMT_AUTHOR.SG001','(Default)','POLICE.DATAMGMT_AUTHOR',NULL); 
INSERT IGNORE INTO `sys_securitygroup` (objid,`name`,usergroupid,exclude) VALUES ('POLICE.ENCODER.SG001','(Default)','POLICE.ENCODER',NULL); 
INSERT IGNORE INTO `sys_securitygroup` (objid,`name`,usergroupid,exclude) VALUES ('POLICE.VERIFIER.SG001','(Default)','POLICE.VERIFIER',NULL); 

ALTER TABLE `policeclearance_attachment` 
  CHANGE `findings` `finding` TEXT CHARSET latin1 COLLATE latin1_swedish_ci NULL,  
  ADD INDEX `ix_refno` (`refno`), 
  ADD INDEX `ix_dtissued` (`dtissued`), 
  ADD CONSTRAINT `fk_policeclearance_attachment_parentid_objid` FOREIGN KEY (`parentid`) REFERENCES `policeclearance`(`objid`); 

ALTER TABLE `policeclearance` CHARSET=utf8; 
ALTER TABLE `policeclearance_attachment` CHARSET=utf8; 
