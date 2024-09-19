CREATE database Exam;

CREATE TABLE Exam.Registration (
	Student_id INT PRIMARY KEY,
	Tuition_Fee INT,
    Schedule VARCHAR(255)
);

CREATE TABLE Exam.Student (
    Student_id INT PRIMARY KEY,
    Full_Name VARCHAR(255),
    Email VARCHAR(255),
    Progress VARCHAR(255),
    Attendance BOOLEAN,
    Submitted INT
);

CREATE TABLE Exam.Teachers (
    Teachers_id INT PRIMARY KEY,
    Full_Name VARCHAR(255),
    Email VARCHAR(255),
    Course VARCHAR(255),
    Activities_provided INT,
    Feedback VARCHAR(255)
);

CREATE TABLE Exam.Course (
    Course_id INT PRIMARY KEY,
    Course_Name VARCHAR(255),
    Teachers_Id INT,
    FOREIGN KEY (Teachers_Id) REFERENCES Teachers(Teachers_id)
);

CREATE TABLE Exam.Classroom (
    Class_Id INT PRIMARY KEY,
    Course_id INT,
    Date INT,
    Attendance BOOLEAN,
    Activities_Performed INT,
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
);

CREATE TABLE Exam.Activities (
    Activities_Id INT PRIMARY KEY,
    Course_id INT,
    Title VARCHAR(255),
    Due_Date INT,
    Student_Submission BOOLEAN,
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
);

CREATE TABLE Exam.Student_Course (
    Student_Course_Id INT PRIMARY KEY AUTO_INCREMENT,
    Student_id INT,
    Course_id INT,
    FOREIGN KEY (Student_id) REFERENCES Exam.Student(Student_id),
    FOREIGN KEY (Course_id) REFERENCES Exam.Course(Course_id)
);
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~SQL SCHEMA~
INSERT INTO registration (Student_id, Tuition_Fee, Schedule)
VALUES 
(1, 0, 'Monday, Wednesday, Friday'),
(2, 0, 'Monday, Wednesday, Friday'),
(3, 40900, 'Monday. Friday, Saturday'),
(4, 35450, 'Monday. Friday, Saturday'),
(5, 25000, 'Monday. Friday, Saturday'),
(6, 10000, 'Monday, Wednesday, Friday'),
(7, 23500, 'Monday, Friday');

INSERT INTO Student (Student_id, Full_name, Email, Progress, Attendance, Submitted)
VALUES 
(1, 'Adriano, Angelica', 'Angel@example.com', 'Completed', TRUE, 10),
(2, 'Camy, Sena', 'camS@example.com', 'Completed', TRUE, 10),
(3, 'Dospordos, Mary', 'Mary@example.com', 'Late', FALSE, 5),
(4, 'Ethan, Dao', 'EthanD@example.com', 'Late', False, 3),
(5, 'Fiony, Mariah', 'FionyM@example.com', 'Late', TRUE, 7),
(6, 'Gaga, Poshir', 'Poshir@example.com', 'In Progress', FALSE, 6),
(7, 'Jackly, Amanda', 'Amanda@example.com', 'Completed', TRUE, 10);

INSERT INTO teachers (Teachers_id, Full_Name, Email, Course, Activities_provided, Feedback)
VALUES 
(1, 'Ms. Amanda Lei', 'Lei@example.com', 'English', 5, 'Need improvement in assignments'),
(2, 'Mr. Izan Fuowaz', 'Fuowaz@example.com', 'History', 25, 'Negative Feedback'),
(3, 'Mrs. Rosanna Socrates', 'Socrates@example.com', 'Math', 10, 'Positive feedback'),
(4, 'Ms. Hanie Bolala', 'Bolala@example.com', 'Filipino', 10, 'Satisfactory feedback'),
(5, 'Dr. Kate Jabel', 'Jabel@example.com', 'Science', 8, 'Excellent work from students');

SELECT * FROM Course WHERE Course_id IN (1, 2, 3, 4, 5);

INSERT INTO Course (Course_id, Course_name, Teachers_Id)
VALUES 
(1, 'English', 1),
(2, 'History', 2),
(3, 'Math', 3),
(4, 'Filipino', 4),
(5, 'Science', 5);

INSERT INTO Classroom (Class_Id, Course_id, Date, Attendance, Activities_Performed)
VALUES 
(1, 1, 20241101, TRUE, 5),
(2, 2, 20241102, FALSE, 2),
(3, 3, 20241103, TRUE, 17),
(4, 4, 20241104, FALSE, 2),
(5, 5, 20241105, TRUE, 6),
(6, 1, 20241201, FALSE, 2),
(7, 2, 20241202, FALSE, 1),
(8, 3, 20241208, TRUE, 7),
(9, 4, 20241209, FALSE, 1),
(10, 5, 20241210, TRUE, 7);


INSERT INTO Activities (Activities_Id, Course_id, Title, Due_Date, Student_Submission)
VALUES 
(1, 5, 'Calculus', 86400, TRUE),
(2, 5, 'Parts of the body', 259200, FALSE),
(3, 4, 'Sino ang pumatay kay Jose Rizal?', 259200, TRUE),
(4, 1, 'Create a poem', 604800, FALSE),
(5, 3, 'Create 10 logics', 604800, TRUE),
(6, 3, 'Algebra', 604800, TRUE),
(7, 2, 'Reflection of El Filibusterismo part 1', 172800, TRUE),
(8, 3, 'Reflection of El Filibusterismo part 2', 172800, TRUE);

INSERT INTO Exam.Student_Course (Student_id, Course_id)
VALUES 
(1, 1),  
(2, 1),  
(3, 3),  
(4, 4), 
(5, 2),  
(6, 3),  
(7, 1); 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~QUERIES~


SELECT 
    s.Full_Name AS Student_Name, 
    co.Course_Name AS Course_Title, 
    a.Title AS Assignment_Title
FROM 
    Exam.Student s
JOIN 
    Exam.Classroom cl ON s.Student_id = cl.Class_Id
JOIN 
    Exam.Course co ON cl.Course_id = co.Course_id
JOIN 
    Exam.Activities a ON co.Course_id = a.Course_id;
    
SELECT 
    co.Course_Name AS Course_Title,
    COUNT(a.Activities_Id) AS Total_Activities_Assigned,
    SUM(CASE WHEN a.Student_Submission = TRUE THEN 1 ELSE 0 END) AS Total_Students_Submitted
FROM 
    Exam.Course co
JOIN 
    Exam.Activities a ON co.Course_id = a.Course_id
GROUP BY 
    co.Course_Name;
    

CREATE TABLE Exam.Student_Course (
    Student_Course_Id INT PRIMARY KEY AUTO_INCREMENT,
    Student_id INT,
    Course_id INT,
    FOREIGN KEY (Student_id) REFERENCES Exam.Student(Student_id),
    FOREIGN KEY (Course_id) REFERENCES Exam.Course(Course_id)
);


SELECT 
    s.Full_Name AS Person_Name, 
    'Student' AS Role, 
    co.Course_Name
FROM 
    Exam.Student s
JOIN 
    Exam.Classroom cl ON s.Student_id = cl.Class_Id
JOIN 
    Exam.Course co ON cl.Course_id = co.Course_id
WHERE 
    co.Course_Name = 'English'

UNION

-- Get the teacher who is teaching the English course
SELECT 
    t.Full_Name AS Person_Name, 
    'Teacher' AS Role, 
    co.Course_Name
FROM 
    Exam.Teachers t
JOIN 
    Exam.Course co ON t.Teachers_id = co.Teachers_Id
WHERE 
    co.Course_Name = 'English';