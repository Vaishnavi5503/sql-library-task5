-- Use the existing database
USE LibraryDB;

-- 1️⃣ INNER JOIN: Show member names and the books they borrowed
SELECT m.Name AS MemberName, b.Title AS BookTitle
FROM Members m
INNER JOIN Borrow br ON m.MemberID = br.MemberID
INNER JOIN Books b ON br.BookID = b.BookID;

-- 2️⃣ LEFT JOIN: Show all members and the books they borrowed (if any)
SELECT m.Name AS MemberName, b.Title AS BookTitle
FROM Members m
LEFT JOIN Borrow br ON m.MemberID = br.MemberID
LEFT JOIN Books b ON br.BookID = b.BookID;

-- 3️⃣ RIGHT JOIN: Show all borrowed books and the member who borrowed them
SELECT m.Name AS MemberName, b.Title AS BookTitle
FROM Members m
RIGHT JOIN Borrow br ON m.MemberID = br.MemberID
RIGHT JOIN Books b ON br.BookID = b.BookID;

-- 4️⃣ FULL OUTER JOIN: Show all members and all books borrowed or not
-- NOTE: MySQL does not support FULL OUTER JOIN directly. You can simulate it with UNION.
SELECT m.Name AS MemberName, b.Title AS BookTitle
FROM Members m
LEFT JOIN Borrow br ON m.MemberID = br.MemberID
LEFT JOIN Books b ON br.BookID = b.BookID

UNION

SELECT m.Name AS MemberName, b.Title AS BookTitle
FROM Members m
RIGHT JOIN Borrow br ON m.MemberID = br.MemberID
RIGHT JOIN Books b ON br.BookID = b.BookID;

-- 5️⃣ CROSS JOIN: Every member paired with every book (CARTESIAN product)
SELECT m.Name, b.Title
FROM Members m
CROSS JOIN Books b;

-- 6️⃣ JOIN more than 2 tables: Show borrow records with member name and book title
SELECT br.BorrowID, m.Name AS MemberName, b.Title AS BookTitle, br.BorrowDate
FROM Borrow br
JOIN Members m ON br.MemberID = m.MemberID
JOIN Books b ON br.BookID = b.BookID;