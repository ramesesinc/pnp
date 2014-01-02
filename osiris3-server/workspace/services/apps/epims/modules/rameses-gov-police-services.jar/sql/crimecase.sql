[getList]
SELECT * 
FROM crimecase 
WHERE caseno LIKE $P{searchtext} OR title LIKE $P{searchtext}
ORDER BY casedate desc


[getCrimeCaseCrimes]
SELECT * FROM crimecase_crime
WHERE crimecaseid = $P{crimecaseid}
ORDER BY title


[getCrimeCaseRespondents]
SELECT r.*, p.lastname, p.firstname, p.middlename
FROM crimecase_respondent r
INNER JOIN personalinfo p ON p.objid = r.respondentid
WHERE r.crimecaseid = $P{crimecaseid}
ORDER BY p.lastname


[getCrimeCaseRespondentCrimes]
SELECT rc.*, cl.title FROM crimecase_respondent_crime rc
INNER JOIN crimelist cl ON cl.objid = rc.crimeid
WHERE crimecaserespondentid = $P{crimecaserespondentid}


[insertCrimeCaseCrime]
INSERT INTO crimecase_crime( objid, crimecaseid, crimeid, code, title )
VALUES( $P{objid}, $P{crimecaseid}, $P{crimeid}, $P{code}, $P{title} )


[insertCrimeCaseRespondent]
INSERT INTO crimecase_respondent( objid, crimecaseid, respondentid )
VALUES( $P{objid}, $P{crimecaseid}, $P{respondentid} )


[insertCrimeCaseRespondentCrime]
INSERT INTO crimecase_respondent_crime( 
	objid, crimecaserespondentid, crimeid, participation, status 
)
VALUES( 
	$P{objid}, $P{crimecaserespondentid}, $P{crimeid}, $P{participation}, $P{status} 
)


[updateCrimeCaseRespondentCrime]
UPDATE crimecase_respondent_crime SET participation = $P{participation}
WHERE objid = $P{objid}


[deleteCrimeCaseCrimes]
DELETE FROM crimecase_crime WHERE crimecaseid = $P{crimecaseid}


[deleteCrimeCaseCrime]
DELETE FROM crimecase_crime WHERE objid = $P{objid}


[deleteCrimeCaseRespondent]
DELETE FROM crimecase_respondent WHERE objid = $P{objid}


[deleteCrimeCaseRespondentCrimes]
DELETE FROM crimecase_respondent_crime WHERE crimecaserespondentid = $P{crimecaserespondentid}


[deleteCrimeCaseRespondentCrime]
DELETE FROM crimecase_respondent_crime WHERE objid = $P{objid}


[approve]
UPDATE crimecase SET state = 'APPROVED' where objid = $P{objid}