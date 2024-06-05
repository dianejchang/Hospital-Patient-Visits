-- How can I see visitor fact table under patient so I can see all the tables
SELECT *
FROM visit_fact
JOIN patient ON visit_fact.patid = patient.patid

-- Names of patients who had a visit
SELECT DISTINCT name
FROM visit_fact
JOIN patient ON visit_fact.patid = patient.patid

-- See info from both tables that show all names. NOTE: full join also works
SELECT *
FROM visit_fact
RIGHT JOIN patient ON visit_fact.patid = patient.patid

-- Just for fun: Cartesian joins
SELECT *
FROM visit_fact
CROSS JOIN patient

-- See a report that shows the name of the patient and how many visits they had
SELECT name, COUNT(visit_fact.patid)
FROM visit_fact
JOIN patient ON visit_fact.patid = patient.patid
GROUP BY patient.name
--
SELECT name, COUNT(*)
FROM visit_fact
JOIN patient ON visit_fact.patid = patient.patid
GROUP BY patient.name

-- Show a report that shows the name of the patient and how many visits they had, but only patients that had 3 or more visits.
-- NOTE: System will read SELECT last
SELECT name, COUNT(visit_fact.patid) AS visitor_num
FROM visit_fact
JOIN patient ON visit_fact.patid = patient.patid
GROUP BY patient.name
HAVING COUNT(visit_fact.patid) >= 3 

-- Show a report that shows the name of the patient and how many visits they had, but only patients that had 3 or more visits. Show all names.
SELECT name, COUNT(visit_fact.patid) AS visitor_num
FROM visit_fact
RIGHT JOIN patient ON visit_fact.patid = patient.patid
GROUP BY name