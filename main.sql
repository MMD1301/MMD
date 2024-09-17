CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Password VARCHAR(255),
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Friends (
    FriendID INT AUTO_INCREMENT PRIMARY KEY,
    FriendWhoAdded INT,
    FriendBeingAdded INT,
    IsAccepted BOOLEAN,
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE Groups (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(100),
    CreatedBy INT,
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE Posts (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    PostDescription VARCHAR(255),
    PostedBy INT,
    IsPublic BOOLEAN,
    IsOnlyForFriends BOOLEAN,
    GroupID INT,
    DatePosted TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE GroupMembershipRequests (
    GroupMemberShipRequestsID INT AUTO_INCREMENT PRIMARY KEY,
    GroupID INT,
    GroupMemberUserID INT,
    IsGroupMemberShipAccepted BOOLEAN,
    DateAccepted TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Friends (FriendID, FriendWhoAdded, FriendBeingAdded, IsAccepted, DateAdded) VALUES
(1, 'John', 'Alice', 'Yes', '2023-09-01'),
(2, 'Michael', 'Emma', 'No', '2023-09-02'),
(3, 'David', 'Sophia', 'Yes', '2023-09-03'),
(4, 'Chris', 'Olivia', 'Yes', '2023-09-04'),
(5, 'James', 'Liam', 'No', '2023-09-05'),
(6, 'Robert', 'Isabella', 'Yes', '2023-09-06'),
(7, 'William', 'Mia', 'No', '2023-09-07'),
(8, 'Daniel', 'Noah', 'Yes', '2023-09-08'),
(9, 'Matthew', 'Ava', 'Yes', '2023-09-09'),
(10, 'Andrew', 'Ethan', 'No', '2023-09-10'),
(11, 'Joseph', 'Harper', 'Yes', '2023-09-11'),
(12, 'Samuel', 'Elijah', 'No', '2023-09-12'),
(13, 'Charles', 'Amelia', 'Yes', '2023-09-13'),
(14, 'Ryan', 'Mason', 'Yes', '2023-09-14'),
(15, 'Anthony', 'Charlotte', 'No', '2023-09-15'),
(16, 'Joshua', 'Lucas', 'Yes', '2023-09-16'),
(17, 'Brandon', 'Abigail', 'No', '2023-09-17'),
(18, 'Jacob', 'Henry', 'Yes', '2023-09-18'),
(19, 'Ethan', 'Ella', 'Yes', '2023-09-19'),
(20, 'Benjamin', 'Grace', 'No', '2023-09-20');

INSERT INTO GroupMembershipRequests (GroupMemberShipRequestsID, GroupID, GroupMemberUserID, IsGroupMemberShipAccepted, DateAccepted) VALUES
(1, 101, 'U1', 'Yes', '2023-09-01'),
(2, 102, 'U2', 'No', '2023-09-02'),
(3, 103, 'U3', 'Yes', '2023-09-03'),
(4, 104, 'U4', 'Yes', '2023-09-04'),
(5, 105, 'U5', 'No', '2023-09-05'),
(6, 106, 'U6', 'Yes', '2023-09-06'),
(7, 107, 'U7', 'No', '2023-09-07'),
(8, 108, 'U8', 'Yes', '2023-09-08'),
(9, 109, 'U9', 'Yes', '2023-09-09'),
(10, 110, 'U10', 'No', '2023-09-10'),
(11, 111, 'U11', 'Yes', '2023-09-11'),
(12, 112, 'U12', 'No', '2023-09-12'),
(13, 113, 'U13', 'Yes', '2023-09-13'),
(14, 114, 'U14', 'Yes', '2023-09-14'),
(15, 115, 'U15', 'No', '2023-09-15'),
(16, 116, 'U16', 'Yes', '2023-09-16'),
(17, 117, 'U17', 'No', '2023-09-17'),
(18, 118, 'U18', 'Yes', '2023-09-18'),
(19, 119, 'U19', 'Yes', '2023-09-19'),
(20, 120, 'U20', 'No', '2023-09-20');

INSERT INTO Groups (GroupID, GroupName, CreatedBy, DateAdded) VALUES
(1, 'Adventure Club', 'Alice', '2023-09-01'),
(2, 'Book Lovers', 'Bob', '2023-09-02'),
(3, 'Cooking Enthusiasts', 'Carol', '2023-09-03'),
(4, 'Fitness Fanatics', 'Dave', '2023-09-04'),
(5, 'Tech Innovators', 'Eve', '2023-09-05'),
(6, 'Travel Buddies', 'Frank', '2023-09-06'),
(7, 'Music Makers', 'Grace', '2023-09-07'),
(8, 'Photography Club', 'Hannah', '2023-09-08'),
(9, 'Film Fanatics', 'Ian', '2023-09-09'),
(10, 'Garden Gurus', 'Jane', '2023-09-10'),
(11, 'Art Aficionados', 'Kyle', '2023-09-11'),
(12, 'Sports Enthusiasts', 'Laura', '2023-09-12'),
(13, 'History Buffs', 'Mike', '2023-09-13'),
(14, 'Science Geeks', 'Nora', '2023-09-14'),
(15, 'Pet Lovers', 'Oscar', '2023-09-15'),
(16, 'DIY Projects', 'Paula', '2023-09-16'),
(17, 'Gaming Guild', 'Quinn', '2023-09-17'),
(18, 'Meditation Group', 'Rita', '2023-09-18'),
(19, 'Language Learners', 'Steve', '2023-09-19'),
(20, 'Wine Enthusiasts', 'Tina', '2023-09-20');

INSERT INTO Posts (PostID, PostDescription, PostedBy, IsPublic, IsOnlyForFriends, GroupID, DatePosted) VALUES
(1, 'Excited for the new movie release!', 'Alice', 'Yes', 'No', 1, '2023-09-01'),
(2, 'Just finished a great book.', 'Bob', 'Yes', 'No', 2, '2023-09-02'),
(3, 'Cooking a delicious meal tonight.', 'Carol', 'No', 'Yes', 3, '2023-09-03'),
(4, 'Hit a new personal best in the gym!', 'Dave', 'Yes', 'No', 4, '2023-09-04'),
(5, 'New tech gadgets are amazing!', 'Eve', 'Yes', 'No', 5, '2023-09-05'),
(6, 'Planning a weekend getaway.', 'Frank', 'No', 'Yes', 6, '2023-09-06'),
(7, 'Jamming to some great tunes.', 'Grace', 'Yes', 'No', 7, '2023-09-07'),
(8, 'Just took some amazing photos!', 'Hannah', 'No', 'Yes', 8, '2023-09-08'),
(9, 'Can’t wait for the next episode.', 'Ian', 'Yes', 'No', 9, '2023-09-09'),
(10, 'My garden is flourishing!', 'Jane', 'No', 'Yes', 10, '2023-09-10'),
(11, 'Attended a fantastic art exhibit.', 'Kyle', 'Yes', 'No', 11, '2023-09-11'),
(12, 'Excited for the big game tonight.', 'Laura', 'No', 'Yes', 12, '2023-09-12'),
(13, 'Learned some interesting history facts.', 'Mike', 'Yes', 'No', 13, '2023-09-13'),
(14, 'Did a fun science experiment today.', 'Nora', 'No', 'Yes', 14, '2023-09-14'),
(15, 'Playing with my new puppy!', 'Oscar', 'Yes', 'No', 15, '2023-09-15'),
(16, 'Finished a DIY home project.', 'Paula', 'No', 'Yes', 16, '2023-09-16'),
(17, 'Tried out a new video game.', 'Quinn', 'Yes', 'No', 17, '2023-09-17'),
(18, 'Enjoying a peaceful meditation session.', 'Rita', 'No', 'Yes', 18, '2023-09-18'),
(19, 'Learning a new language is fun!', 'Steve', 'Yes', 'No', 19, '2023-09-19'),
(20, 'Savoring a glass of fine wine.', 'Tina', 'No', 'Yes', 20, '2023-09-20');

INSERT INTO Users (UserID, Username, FirstName, LastName, DateOfBirth, Password, DateAdded) VALUES
(1, 'jdoe', 'John', 'Doe', '1990-01-15', 'pwd1234', '2023-09-01'),
(2, 'janedoe', 'Jane', 'Doe', '1992-03-22', 'pwd5678', '2023-09-02'),
(3, 'bsmith', 'Bob', 'Smith', '1985-07-30', 'pwd9101', '2023-09-03'),
(4, 'asmith', 'Alice', 'Smith', '1988-12-05', 'pwd1122', '2023-09-04'),
(5, 'mjohnson', 'Michael', 'Johnson', '1991-05-14', 'pwd3344', '2023-09-05'),
(6, 'ejames', 'Emily', 'James', '1993-06-17', 'pwd5566', '2023-09-06'),
(7, 'rwhite', 'Ryan', 'White', '1990-11-20', 'pwd7788', '2023-09-07'),
(8, 'lcook', 'Laura', 'Cook', '1987-02-25', 'pwd9900', '2023-09-08'),
(9, 'dclark', 'David', 'Clark', '1995-08-12', 'pwd1234', '2023-09-09'),
(10, 'sgonzalez', 'Sarah', 'Gonzalez', '1994-04-04', 'pwd5678', '2023-09-10'),
(11, 'tmiller', 'Thomas', 'Miller', '1992-09-09', 'pwd9101', '2023-09-11'),
(12, 'kturner', 'Katie', 'Turner', '1989-07-25', 'pwd1122', '2023-09-12'),
(13, 'jroberts', 'Jack', 'Roberts', '1991-10-17', 'pwd3344', '2023-09-13'),
(14, 'mlee', 'Mary', 'Lee', '1986-12-01', 'pwd5566', '2023-09-14'),
(15, 'bharris', 'Brian', 'Harris', '1989-03-10', 'pwd7788', '2023-09-15'),
(16, 'nbell', 'Natalie', 'Bell', '1994-08-21', 'pwd9900', '2023-09-16'),
(17, 'amartin', 'Alex', 'Martin', '1990-04-30', 'pwd1234', '2023-09-17'),
(18, 'clopez', 'Chloe', 'Lopez', '1995-11-08', 'pwd5678', '2023-09-18'),
(19, 'hjackson', 'Hannah', 'Jackson', '1992-06-14', 'pwd9101', '2023-09-19'),
(20, 'jwright', 'James', 'Wright', '1987-01-23', 'pwd1122', '2023-09-20');