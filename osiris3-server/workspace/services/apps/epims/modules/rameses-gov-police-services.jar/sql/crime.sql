[getList]
SELECT * 
FROM crimelist 
WHERE code LIKE $P{searchtext} OR title LIKE $P{searchtext}
ORDER BY code

[getLookup]
SELECT * FROM crimelist
WHERE code LIKE $P{searchtext} OR title LIKE $P{searchtext}
ORDER BY code