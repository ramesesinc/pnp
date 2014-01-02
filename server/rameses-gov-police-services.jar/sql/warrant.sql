[getList]
SELECT * FROM warrant 
WHERE (lastname LIKE $P{searchtext} OR firstname LIKE $P{searchtext})
ORDER BY dtissued

[approve]
UPDATE warrant SET state='ONBAIL' WHERE objid=$P{objid} 
