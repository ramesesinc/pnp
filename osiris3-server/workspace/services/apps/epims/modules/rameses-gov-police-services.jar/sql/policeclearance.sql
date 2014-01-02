[getList]
SELECT * 
FROM policeclearance 
WHERE person_lastname LIKE $P{searchtext} OR person_firstname LIKE $P{searchtext}
ORDER BY person_lastname

[getRespondentCrimes]
SELECT rc.*, cl.title FROM crimecase_respondent r
INNER JOIN crimecase_respondent_crime rc ON rc.crimecaserespondentid = r.objid
INNER JOIN crimelist cl ON cl.objid = rc.crimeid
WHERE r.respondentid = $P{respondentid}

[getWarrantByRespondent]
SELECT * FROM warrant
WHERE lastname = $P{lastname} AND firstname = $P{firstname}
	AND middlename = $P{middlename}

[findLeftThumbMark]
SELECT leftthumbmark as image FROM policeclearance where objid = $P{objid}

[findRightThumbMark]
SELECT rightthumbmark as image FROM policeclearance where objid = $P{objid}

[updateState]
UPDATE policeclearance set state = $P{state} where objid = $P{objid}