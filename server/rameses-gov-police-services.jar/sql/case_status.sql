[getList]
SELECT * FROM case_status WHERE description LIKE $P{searchtext} ORDER BY description 

[approve]
UPDATE case_status SET state='APPROVE' WHERE objid=$P{objid} 
