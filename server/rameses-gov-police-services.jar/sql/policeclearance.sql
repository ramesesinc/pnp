[getList]
SELECT * 
FROM policeclearance 
WHERE 
	(person_lastname LIKE $P{searchtext} OR person_firstname LIKE $P{searchtext}) and 
	state=$P{state} 
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
UPDATE policeclearance set state=$P{state} where objid=$P{objid}

[findAttachment]
SELECT * FROM policeclearance_attachment WHERE parentid=$P{parentid} and reftype=$P{reftype} 

[getWarrantByName]
SELECT * FROM warrant WHERE lastname LIKE $P{lastname} AND firstname LIKE $P{firstname} 

[submitForRelease]
UPDATE policeclearance set state=$P{state}, dtverified=$P{dtverified}, verifiedby=$P{verifiedby}, 
	verifieduserid=$P{verifieduserid}, finding=$P{finding} where objid=$P{objid}

[releasePoliceClearance]
UPDATE policeclearance set state=$P{state}, dtcertified=$P{dtcertified}, certifiedby=$P{certifiedby}, 
	certifieduserid=$P{certifieduserid}, certifiedremarks=$P{certifiedremarks}  where objid=$P{objid}

[getPoliceClearanceList]
SELECT * FROM policeclearance
WHERE state = 'RELEASED'
	AND dtfiled BETWEEN $P{dtfrom} AND $P{dtto}
	
[getSignatory]
SELECT * FROM signatory WHERE personnelid = $P{personnelid} AND doctype = $P{doctype}

[getSignatories]
SELECT * FROM signatory WHERE doctype = $P{doctype}