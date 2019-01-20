-- 6-45
SELECT TutorID, Status
FROM TUTOR
WHERE Status='Active' OR Status='Temp Stop';
-- 6-46
SELECT MIN(READ), AVG(READ), MAX(READ)
FROM STUDENT;
-- 6-47
SELECT TutorID
FROM MatchHistory
WHERE EndDate is NULL;
-- 6-48
SELECT TutorID
FROM MatchHistory
WHERE StartDate is Null;
-- 6-49
SELECT StudentID, StartDate
FROM MatchHistory
WHERE StartDate Between '01-01-2015' AND '05-31-2015';
-- 6-50
SELECT StudentID, Read
FROM STUDENT
WHERE Read = (SELECT MAX(Read) FROM Student);
-- 6-51
SELECT StudentID, (EndDate - StartDate) AS days
FROM MatchHistory
WHERE EndDate IS NOT NULL;
-- 6-52
SELECT TutorID, Status, CertDate
FROM TUTOR
WHERE Status = 'Dropped' OR CertDate Between '04-01-2015' AND '05-31-2015';
-- 6-53
SELECT AVG(EndDate - StartDate)
FROM MatchHistory
-- 7-31
PRIMARY key: TutorID, StudentID, Month
Associative key: MatchID (PFK)
FOREIGN key: TutorID, StudentID in MatchHistory

-- 7-32
ALTER TABLE Student 
ADD COLUMN MathScore INT;

-- 7-33
ALTER TABLE Student 
ADD COLUMN subject text;
CHECK 
	(subject = 'Math, ESL, Reading');
-- 7-34 Draw ERD?

-- 7-35
SELECT 
	matchhistory.TutorID, 
    tutorreport.month
FROM 
	tutorreport LEFT JOIN matchhistory 
ON 
	matchhistory.MatchID = tutorreport.MatchID 
WHERE 
	(Month BETWEEN '01-01-2015' AND '06-30-2015') 
	OR (Month BETWEEN '08-01-2015' AND '12-31-2015')
-- 7-36 first_information of tutor
SELECT name, address, phone, email
FROM Tutor
-- 7-36 second_information of tutor
SELECT name, address, phone, email
FROM Student
-- 7-37 hours and lessons tutor 106 june and july 2015
SELECT 
	MatchHistory.TutorID, 
	SUM(TutorReport.Hours) AS TotalHours,
    SUM(TutorReport.Lessons) AS TotalLessons
FROM
	MatchHistory LEFT JOIN TutorReport
ON
	MatchHistory.MatchID = TutorReport.MatchID
    AND TutorID='106'
    WHERE Hours IS NOT NULL 
    AND Month Between '2015-06-01' AND '2015-07-31'
GROUP BY
	MatchHistory.TutorID

-- 7-38 Read scores of students 
SELECT 
	Student.StudentID, Student.Read
FROM
	Student LEFT JOIN MatchHistory
ON
	MatchHistory.StudentID = Student.StudentID
	LEFT JOIN Tutor 
ON 
	MatchHistory.TutorID = Tutor.TutorID
	WHERE Tutor.Status LIKE 'Dropped'
-- 7-39
SELECT 
	MatchHistory.StudentID, 
    Tutor.Status,
    TutorReport.Hours,
    TutorReport.Lessons
FROM 
	MatchHistory LEFT JOIN TutorReport 
ON 
	MatchHistory.MatchID = TutorReport.MatchID 
	LEFT JOIN Tutor
ON 
	MatchHistory.TutorID = Tutor.TutorID 
    WHERE Tutor.Status LIKE 'Active'
	AND MatchHistory.StartDate Between '06-01-2015' AND '06-30-2015'
	AND MatchHistory.EndDate Between '06-01-2015' AND '06-30-2015' 
	
-- 7-40
SELECT 
	MatchHistory.TutorID, 
	MatchHistory.EndDate 
FROM 
	MatchHistory LEFT JOIN Tutor
ON
	MatchHistory.TutorID = Tutor.TutorID 
    WHERE MatchHistory.EndDate IS NOT NULL 
    AND Tutor.Status LIKE 'Active'
	
	
-- 7-41
SELECT 
    MatchHistory.TutorID
FROM 
	MatchHistory LEFT JOIN TutorReport
ON 
	MatchHistory.MatchID = TutorReport.MatchID 
	WHERE TutorReport.MatchID IS NULL