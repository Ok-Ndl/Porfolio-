CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    school VARCHAR(100),
    enrollment_date DATE
);

-- Insert sample records
INSERT INTO Student (full_name, contact_number, school, enrollment_date) VALUES 
('John Doe', '1234567890', 'Pretoria Boys High School', '2023-01-15'),
('Jane Smith', '0987654321', 'St Nicholas College', '2023-02-20'),
('Tom Brown', '1122334455', 'Maritzburg College', '2023-03-25'),
('Emily White', '5566778899', 'Girls High ', '2023-04-10'),
('Michael Johnson', '6677889900', 'Southdowns College', '2023-05-05');

CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    session_date DATE,
    status VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

-- Insert sample records
INSERT INTO Attendance (student_id, session_date, status) VALUES 
(1, '2023-10-01', 'Present'),
(2, '2023-10-01', 'Absent'),
(3, '2023-10-01', 'Present'),
(4, '2023-10-02', 'Late'),
(5, '2023-10-02', 'Present');

CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    amount_paid DECIMAL(10, 2),
    payment_date DATE,
    method VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

-- Insert sample records
INSERT INTO Payment (student_id, amount_paid, payment_date, method) VALUES 
(1, 150.00, '2023-10-05', 'Cash'),
(2, 200.00, '2023-10-06', 'Bank Transfer'),
(3, 250.00, '2023-10-07', 'Credit Card'),
(4, 180.00, '2023-10-08', 'Cash'),
(5, 220.00, '2023-10-09', 'Bank Transfer');

CREATE TABLE LearningPlan (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    topics TEXT,
    resources TEXT,
    notes TEXT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

-- Insert sample records
INSERT INTO LearningPlan (student_id, subject, topics, resources, notes) VALUES 
(1, 'Mathematics', 'Algebra, Calculus', 'Textbook, Videos', 'Focus on problem-solving skills'),
(2, 'Physical Science', 'Kinematics, Dynamics', 'Lecture notes, Practice exercises', 'Revise weekly tests'),
(3, 'Mathematics', 'Geometry, Trigonometry', 'Extra worksheets', 'Improvement in diagram-based questions'),
(4, 'Physical Science', 'Thermodynamics', 'Online tutorials', 'Clarify concepts before next class'),
(5, 'Mathematics', 'Statistics, Probability', 'Practice questions', 'Review exam papers');

CREATE TABLE TutoringSession (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    session_date DATE,
    time_slot VARCHAR(20),
    topic VARCHAR(100)
);

CREATE TABLE SessionBooking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    session_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (session_id) REFERENCES TutoringSession(session_id)
);

-- Insert sample records
INSERT INTO TutoringSession (session_date, time_slot, topic) VALUES 
('2023-11-15', '10:00 AM - 11:00 AM', 'Calculus Review'),
('2023-11-16', '2:00 PM - 3:00 PM', 'Physics Problem Solving'),
('2023-11-17', '11:00 AM - 12:00 PM', 'Trigonometry Practice'),
('2023-11-18', '1:00 PM - 2:00 PM', 'Chemistry Equations'),
('2023-11-19', '3:00 PM - 4:00 PM', 'Exam Preparation');

INSERT INTO SessionBooking (student_id, session_id) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

CREATE TABLE ResourceRepository (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    link VARCHAR(255)
);

-- Insert sample records
INSERT INTO ResourceRepository (title, description, link) VALUES 
('Calculus Notes', 'Detailed notes on Calculus', 'http://example.com/calculus-notes'),
('Physics Tutorials', 'Video tutorials on Kinematics', 'http://example.com/physics-tutorials'),
('Trigonometry Exercises', 'Practice questions for Trigonometry', 'http://example.com/trig-exercises');

