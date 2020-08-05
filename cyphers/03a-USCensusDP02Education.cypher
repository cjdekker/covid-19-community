USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP02EducationAdmin2.csv' AS row 
MERGE (s:SocialCharacteristics{id: 'ACSDP5Y2018.DP02-' + row.stateFips + '-' + row.countyFips})
SET s.name = 'SocialCharacteristics-' + row.stateFips + '-' + row.countyFips
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP02EducationAdmin2.csv' AS row
MATCH (a:Admin2{fips: row.countyFips, stateFips: row.stateFips})
MATCH (s:SocialCharacteristics{id: 'ACSDP5Y2018.DP02-' + row.stateFips + '-' + row.countyFips})
MERGE (a)-[h:HAS_SOCIAL_CHARACTERISTICS]->(s)
RETURN count(h) as HAS_SOCIAL_CHARACTERISTICS
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP02EducationAdmin2.csv' AS row 
MERGE (e:Education{id: 'ACSDP5Y2018.DP02-' + row.stateFips + '-' + row.countyFips})
SET e.name = 'Education-' + row.stateFips + '-' + row.countyFips,
    e.population25YearsAndOver = toInteger(row.population25YearsAndOver),
    e.LessThan9thGrade = toInteger(row.LessThan9thGrade),
    e.LessThan9thGradePct = toFloat(row.LessThan9thGradePct),
    e.grade9thTo12thNoDiploma = toInteger(row.grade9thTo12thNoDiploma),
    e.grade9thTo12thNoDiplomaPct = toFloat(row.grade9thTo12thNoDiplomaPct),
    e.highSchoolGraduate = toInteger(row.highSchoolGraduate),
    e.highSchoolGraduatePct = toFloat(row.highSchoolGraduatePct),
    e.someCollegeNoDegree = toInteger(row.someCollegeNoDegree),
    e.someCollegeNoDegreePct = toFloat(row.someCollegeNoDegreePct),
    e.associatesDegree = toInteger(row.associatesDegree),
    e.associatesDegreePct = toFloat(row.associatesDegreePct),
    e.bachelorsDegree = toInteger(row.bachelorsDegree),
    e.bachelorsDegreePct = toFloat(row.bachelorsDegreePct),
    e.graduateOrProfessionalDegree = toInteger(row.graduateOrProfessionalDegree),
    e.graduateOrProfessionalDegreePct = toFloat(row.graduateOrProfessionalDegreePct),
    e.highSchoolGraduateOrHigher = toInteger(row.highSchoolGraduateOrHigher),
    e.highSchoolGraduateOrHigherPct = toFloat(row.highSchoolGraduateOrHigherPct),
    e.bachelorsDegreeOrHigher = toInteger(row.bachelorsDegreeOrHigher),
    e.bachelorsDegreeOrHigherPct = toFloat(row.bachelorsDegreeOrHigherPct),            
    e.stateFips = row.stateFips, 
    e.countyFips = row.countyFips,
    e.source = row.source, 
    e.aggregationLevel = row.aggregationLevel
RETURN count(e) as Education
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP02EducationAdmin2.csv' AS row
MATCH (s:SocialCharacteristics{id: 'ACSDP5Y2018.DP02-' + row.stateFips + '-' + row.countyFips})
MATCH (e:Education{id: 'ACSDP5Y2018.DP02-' + row.stateFips + '-' + row.countyFips})
MERGE (s)-[h:HAS_EDUCATION]->(e)
RETURN count(h) as HAS_EDUCATION
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP02EducationZip.csv' AS row 
MERGE (e:Education{id: 'ACSDP5Y2018.DP02-' + row.postalCode})
SET e.name = 'Education-' + row.postalCode,
    e.population25YearsAndOver = toInteger(row.population25YearsAndOver),
    e.LessThan9thGrade = toInteger(row.LessThan9thGrade),
    e.LessThan9thGradePct = toFloat(row.LessThan9thGradePct),
    e.grade9thTo12thNoDiploma = toInteger(row.grade9thTo12thNoDiploma),
    e.grade9thTo12thNoDiplomaPct = toFloat(row.grade9thTo12thNoDiplomaPct),
    e.highSchoolGraduate = toInteger(row.highSchoolGraduate),
    e.highSchoolGraduatePct = toFloat(row.highSchoolGraduatePct),
    e.someCollegeNoDegree = toInteger(row.someCollegeNoDegree),
    e.someCollegeNoDegreePct = toFloat(row.someCollegeNoDegreePct),
    e.associatesDegree = toInteger(row.associatesDegree),
    e.associatesDegreePct = toFloat(row.associatesDegreePct),
    e.bachelorsDegree = toInteger(row.bachelorsDegree),
    e.bachelorsDegreePct = toFloat(row.bachelorsDegreePct),
    e.graduateOrProfessionalDegree = toInteger(row.graduateOrProfessionalDegree),
    e.graduateOrProfessionalDegreePct = toFloat(row.graduateOrProfessionalDegreePct),
    e.highSchoolGraduateOrHigher = toInteger(row.highSchoolGraduateOrHigher),
    e.highSchoolGraduateOrHigherPct = toFloat(row.highSchoolGraduateOrHigherPct),
    e.bachelorsDegreeOrHigher = toInteger(row.bachelorsDegreeOrHigher),
    e.bachelorsDegreeOrHigherPct = toFloat(row.bachelorsDegreeOrHigherPct),  
    e.postalCode = row.postalCode,
    e.source = row.source, 
    e.aggregationLevel = row.aggregationLevel
RETURN count(e) as Education
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP02EducationZip.csv' AS row
MERGE (s:SocialCharacteristics{id: 'ACSDP5Y2018.DP02-' + row.postalCode})
SET s.name = 'SocialCharacteristics-' + row.postalCode
RETURN count(s) as SocialCharacteristics
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP02EducationZip.csv' AS row
MATCH (p:PostalCode{id: 'zip' + row.postalCode})
MATCH (s:SocialCharaterictics{id: 'ACSDP5Y2018.DP02-' + row.postalCode})
MERGE (p)-[h:HAS_SOCIAL_CHARACTERISTICS]->(s)
RETURN count(h) as HAS_SOCIAL_CHARACTERISTICS
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP02EducationZip.csv' AS row
MATCH (s:SocialCharacteristics{id: 'ACSDP5Y2018.DP02-' + row.postalCode})
MATCH (e:Education{id: 'ACSDP5Y2018.DP02-' + row.postalCode})
MERGE (s)-[h:HAS_EDUCATION]->(e)
RETURN count(h) as HAS_EDUCATION
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP02EducationTract.csv' AS row 
MERGE (e:Education{id: 'ACSDP5Y2018.DP02-' + row.tract})
SET e.name = 'Education-' + row.tract,
    e.population25YearsAndOver = toInteger(row.population25YearsAndOver),
    e.LessThan9thGrade = toInteger(row.LessThan9thGrade),
    e.LessThan9thGradePct = toFloat(row.LessThan9thGradePct),
    e.grade9thTo12thNoDiploma = toInteger(row.grade9thTo12thNoDiploma),
    e.grade9thTo12thNoDiplomaPct = toFloat(row.grade9thTo12thNoDiplomaPct),
    e.highSchoolGraduate = toInteger(row.highSchoolGraduate),
    e.highSchoolGraduatePct = toFloat(row.highSchoolGraduatePct),
    e.someCollegeNoDegree = toInteger(row.someCollegeNoDegree),
    e.someCollegeNoDegreePct = toFloat(row.someCollegeNoDegreePct),
    e.associatesDegree = toInteger(row.associatesDegree),
    e.associatesDegreePct = toFloat(row.associatesDegreePct),
    e.bachelorsDegree = toInteger(row.bachelorsDegree),
    e.bachelorsDegreePct = toFloat(row.bachelorsDegreePct),
    e.graduateOrProfessionalDegree = toInteger(row.graduateOrProfessionalDegree),
    e.graduateOrProfessionalDegreePct = toFloat(row.graduateOrProfessionalDegreePct),
    e.highSchoolGraduateOrHigher = toInteger(row.highSchoolGraduateOrHigher),
    e.highSchoolGraduateOrHigherPct = toFloat(row.highSchoolGraduateOrHigherPct),
    e.bachelorsDegreeOrHigher = toInteger(row.bachelorsDegreeOrHigher),
    e.bachelorsDegreeOrHigherPct = toFloat(row.bachelorsDegreeOrHigherPct),  
    e.tract = row.tract,
    e.source = row.source, 
    e.aggregationLevel = row.aggregationLevel
RETURN count(e) as Education
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP02EductionTract.csv' AS row
MERGE (s:SocialCharacteristics{id: 'ACSDP5Y2018.DP02-' + row.tract})
SET s.name = 'SocialCharacteristics-' + row.tract
RETURN count(s) as SocialCharacteristics
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP02EducationTract.csv' AS row
MATCH (t:Tract{id: 'tract' + row.tract})
MATCH (s:SocialCharacteristics{id: 'ACSDP5Y2018.DP02-' + row.tract})
MERGE (t)-[h:HAS_SOCIAL_CHARACTERISTICS]->(s)
RETURN count(h) as HAS_SOCIAL_CHARACTERISTICS
;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'FILE:///03a-USCensusDP02EducationTract.csv' AS row
MATCH (s:SocialCharacteristics{id: 'ACSDP5Y2018.DP02-' + row.tract})
MATCH (e:Education{id: 'ACSDP5Y2018.DP02-' + row.tract})
MERGE (e)-[h:HAS_EDUCATION]->(e)
RETURN count(h) as HAS_EDUCATION
;