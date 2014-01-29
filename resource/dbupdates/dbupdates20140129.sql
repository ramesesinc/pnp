USE pnpdb;

ALTER TABLE `entity` ADD INDEX `ix_entityname` (`entityname`); 

ALTER TABLE `entitycontact` DROP INDEX `PK__entityco__530D6FE447A6A41B`;	
ALTER TABLE `entitycontact` ADD INDEX `ix_entityid` (`entityid`);	

ALTER TABLE `entityidcard` DROP INDEX `PK__entityid__530D6FE442E1EEFE`; 
ALTER TABLE `entityidcard` ADD INDEX `ix_idno` (`idno`); 

ALTER TABLE `entityindividual` DROP INDEX `PK__entityin__530D6FE43F115E1A`; 
ALTER TABLE `entityindividual` DROP INDEX `ix_entityindividual_firstname`;
ALTER TABLE `entityindividual` DROP INDEX `ix_entityindividual_lastname`; 

ALTER TABLE `entityindividual` ADD INDEX `ix_name` (`lastname`, `firstname`); 
ALTER TABLE `entityindividual` ADD INDEX `ix_tin` (`tin`);
ALTER TABLE `entityindividual` ADD INDEX `ix_sss` (`sss`); 
ALTER TABLE `entityindividual` ADD COLUMN `religion` VARCHAR(50) NULL AFTER `civilstatus`; 

ALTER TABLE `entityindividual_physical` ADD INDEX `ix_signatureid` (`signature_objid`); 

ALTER TABLE `entityjuridical` DROP INDEX `PK__entityju__530D6FE43B40CD36`; 
ALTER TABLE `entityjuridical` ADD INDEX `ix_dtregistered` (`dtregistered`); 

ALTER TABLE `entitymember` DROP INDEX `PK__entityme__530D6FE437703C52`;
ALTER TABLE `entitymember` DROP INDEX `ix_taxpayer_name`;
ALTER TABLE `entitymember` DROP INDEX `ix_taxpayer_objid`; 
ALTER TABLE `entitymember` ADD INDEX `ix_taxpayer_objid` (`taxpayer_objid`);
ALTER TABLE `entitymember` ADD INDEX `ix_taxpayer_name` (`taxpayer_name`); 

ALTER TABLE `entitymultiple` DROP INDEX `PK__entitymu__530D6FE4339FAB6E`; 

ALTER TABLE `policeclearance` 
	ADD COLUMN `verifieduserid` VARCHAR(50) NULL AFTER `dtverified`, 
	ADD COLUMN `certifieduserid` VARCHAR(50) NULL AFTER `dtcertified`; 

ALTER TABLE `policeclearance` 
	ADD INDEX `ix_verifieduserid` (`verifieduserid`), 
	ADD INDEX `ix_certifieduserid` (`certifieduserid`); 
