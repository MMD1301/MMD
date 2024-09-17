UPDATE Users SET DateOfBirth = '2000-01-01' WHERE UserID = 1;
UPDATE Users SET DateOfBirth = '2001-02-15' WHERE UserID = 2;
UPDATE Users SET DateOfBirth = '2002-03-30' WHERE UserID = 3;
UPDATE Users SET DateOfBirth = '2003-04-25' WHERE UserID = 4;
UPDATE Users SET DateOfBirth = '2004-05-10' WHERE UserID = 5;


SELECT *
FROM Posts
WHERE PostID = 4;


SELECT *
FROM GroupMembershipRequests
WHERE GroupID = 102;

SELECT *
FROM Friends
WHERE FriendID = 2;