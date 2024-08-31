Project 3 ********

create database Election 
use Election;
Election Analysis and Prediction

-- Create Tables

-- Table to store information about candidates
CREATE TABLE Candidates (
    CandidateID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Party VARCHAR(50) NOT NULL,
    DOB DATE,
 ); 
 insert into Candidates values
 (1,'Vaibhav Rane','BJP','1988-05-09'),
 (2,'Ramesh Yadav','INC','1977-04-23'),
 (3,'Nilam Shukla','AAP','1990-01-22'),
 (4,'Jayesh Shinde','BSP','1989-02-12'),
 (5,'Poonam Mehta','CPI','1991-03-11'),
 (6,'Anshul Rana','CPI','1992-04-02'),
 (7,'Lalit Shukla','NCP','1993-05-13');
 

-- Table to store information about voters
CREATE TABLE Voters (
    VoterID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DOB DATE,
    Address VARCHAR(100)   
); 
insert into Voters values
(1,'Siddarth Shukla','1884-03-20','Pune'),
(2,'Rohan Mane','1990-06-01','Mumbai'),
(3,'Archana Shinde','1991-01-01','Sangali'),
(4,'Soham Upadhye','1990-02-02','Nashik'),
(5,'Om Fale','1991-03-03','Kolhapur'),
(6,'Jiza Karale','1989-01-03','Pune'),
(7,'Amit Thombare','1993-03-12','Mumbai'),
(8,'Ashish Jadhav','1986-01-17','Pune'),
(9,'Lajari Choraghe','1983-09-12','NewMumbai'),
(10,'Kadmabari Rane','2000-01-11','Sangali'),
(11,'Sanavi Wagh','2001-02-12','Tuljapur'),
(12,'Riyana Mubarak','2001-03-11','Pune'),
(13,'Urmila Londhe','2001-02-14','Mumbai'),
(14,'Aarohi Kokate','2001-02-13','Nashik'),
(15,'Dipali Angare','2001-02-15','Mumbai'),
(16,'Prakash Rathe','2001-03-12','Pune'),
(17,'Vinit Arora','1998-01-24','Pune'),
(18,'Soham Takale','1999-07-29','Mumbai'),
(19,'Harshad Dhumal','1999-09-26','NewMumbai'),
(20,'Dixit Tiwari','1999-10-19','Sangali');


-- Table to store information about elections
CREATE TABLE Elections (
    ElectionID INT PRIMARY KEY,
    ElectionName VARCHAR(100) NOT NULL,
    ElectionDate DATE,
        );
insert into Elections values
(1,'Lok Sabha Elections','2023-01-02'),
(2,'State Assembly Elections','2023-02-03'),
(3,'Rajya Sabha Elections','2023-03-05'),
(4,'Local Body Elections','2023-04-06'),
(5,'Lok Sabha General Elections','2023-05-07'),
(6,'Maharashtra Elections','2023-06-08'),
(7,'Gujrat Elections','2023-09-12')
-- Table to store information about votes cast in each election
CREATE TABLE Votes (
    VoteID INT PRIMARY KEY,
    VoterID INT,
    ElectionID INT,
    CandidateID INT,
    VoteDateTime DATETIME,
    FOREIGN KEY (VoterID) REFERENCES Voters(VoterID),
    FOREIGN KEY (ElectionID) REFERENCES Elections(ElectionID),
    FOREIGN KEY (CandidateID) REFERENCES Candidates(CandidateID)
);
insert into Votes values 
(101,1,1,1,'2023-01-02 09:15:00 AM'),
(102,2,2,3,'2023-02-03  10:15:00 AM'),
(103,3,3,4,'2023-03-05  09:30:00 AM'),
(104,4,4,5,'2023-04-06   11:00:00 AM'),
(105,5,1,6,'2023-01-02   10:30:00 AM'),
(106,6,5,1,'2023-05-07   10:45:00 AM'),
(107,7,6,2,'2023-06-08   11:01:00 AM'),
(108,8,5,7,'2023-05-07   11:01:00 AM'),
(109,9,1,6,'2023-01-02   10:16:00 AM'),
(110,10,2,2,'2023-06-08  09:00:00 AM'),
(111,11,3,3,'2023-02-03  09:45:00 AM'),
(112,12,4,7,'2023-04-06  11:45:00 AM'),
(113,15,5,6,'2023-01-02   09:15:00 AM'),
(114,16,3,2,'2023-06-08    12:00:00 PM'),
(115,17,2,3,'2023-06-08  11:15:00  AM'),
(116,18,1,5,'2023-01-02  01:00:00 PM'),
(117,19,2,6,'2023-06-08  10:00:01 AM');


-- Table to store information about election results
CREATE TABLE ElectionResults (
    ResultID INT PRIMARY KEY,
    ElectionID INT,
    CandidateID INT,
    VotesReceived INT,
    FOREIGN KEY (ElectionID) REFERENCES Elections(ElectionID),
    FOREIGN KEY (CandidateID) REFERENCES Candidates(CandidateID)
);
insert into ElectionResults values
(2001,1,1,1000),
(2002,2,2,0000),
(2003,3,3,5000),
(2004,4,4,6000),
(2005,5,5,8000),
(2006,6,6,9000),
(2007,7,7,1200);


Retrieval Queries:

--1. Retrieve the names of all candidates.
SELECT*FROM Candidates;

--2. Find the total number of voters in the system.
select count(*) as Total_Voters
from Voters;



--3. List all elections along with their dates.
select ElectionName,ElectionDate
from Elections;





select*from  Candidates

--4. Display the names of candidates who belong to a specific party.
select Name ,Party
from Candidates
where Party='INC';


--5. Find the number of votes received by each candidate in a particular election.
select CandidateID,VotesReceived
from ElectionResults;

--6. List all voters who voted in a specific election.
	  select VoterID,ElectionID
	  select*from Votes;
	  
--7. Retrieve the election results for a given election.
select ElectionID,VotesReceived
from ElectionResults
where ElectionID=7;

--8. Display the names and dates of birth of voters who voted for a particular candidate.
select V.VoterID,Vr.Name,Vr.DOB,V.CandidateID
from Voters Vr join Votes V
on Vr.VoterID=V.VoterID

--9. Find the total number of votes cast in each election.
select sum(VotesReceived) as Total_Votes
from ElectionResults;

--10. List the candidates who did not receive any votes in a specific election.
select CandidateID,VotesReceived
from ElectionResults
where VotesReceived=000

Insertion and Update Queries:
--11. Add a new candidate to the Candidates table.
insert into Candidates values
(8,'Harshad Mehta','TDC','1994-11-12'),
(9,'Sanvi Shinde','AAP','1992-09-27'),
(10,'Prathna Patil','ADC','1994-08-19');

--12. Insert a record of a new voter into the Voters table.
insert into Voters values
(21,'Raghav Yadav','2000-02-13','Mumbai'),
(22,'Vandana Gupta','1999-04-09','Pune');

--13. Add a new election to the Elections table.
insert into Elections values
(8,'MP Elections','2023-10-10'),
(9,'UP Elections','2023-11-11');

--14. Register a vote for a specific voter, candidate, and election in the Votes table.
insert into Votes values
(120,22,8,8,'2023-10-10  10:00:00.000');

--15. Update the address of a voter with a given voter ID.
update Voters
set Address='Pune'
where VoterID=3;

--16. Update the party affiliation of a candidate with a specific CandidateID.
update Candidates
set Party='BJP'
where candidateID=10  

--17. Record the results of an election in the ElectionResults table.*
INSERT INTO ElectionResults (ResultID )
VALUES ('4000');

   --18. Insert multiple records into the Votes table for a given election.
insert into Votes values
   (118,20,1,7,'2023-01-02 14:03:00.000'),
   (119,21,2,6,'2023-01-02 09:19:00.000');

--19. Add a new election result for a candidate who participated in an election.
insert into ElectionResults
values(2008,8,8,1300),
(2009,8,9,4500);

Deletion Queries:

--20. Delete a candidate with a specific CandidateID.
ALTER TABLE dbo.Votes
DROP CONSTRAINT FK__Votes__Candidate__1229A90A;
ALTER TABLE master.dbo.ElectionResults NOCHECK CONSTRAINT FK__ElectionR__Candi__15FA39EE
delete from Candidates
where CandidateID=2

--21. Remove a voter from the Voters table using their VoterID
Alter Table dbo.Votes
Drop Constraint FK__Votes__VoterID__10416098

Delete from Voters
where VoterID=7

--22. Delete all votes cast by a specific voter.
Delete from Votes
where VoterID=4

--23. Remove an election from the Elections table.
Alter Table dbo.Votes
Drop Constraint FK__Votes__ElectionI__113584D1

Alter Table dbo.ElectionResults
Drop Constraint FK__ElectionR__Elect__150615B5

Delete  From Elections
where ElectionID=8;

--24. Delete a specific vote from the Votes table.
Delete from Votes
where VoteID=102; 

--25. Remove a candidates election results from the ElectionResults table.
Delete ElectionResults
where CandidateID=1;

--26. Delete all records of votes for a particular election.
delete from Votes
where ElectionID=1005;

Aggregation and Grouping:
--27. Find the candidate who received the maximum votes in a specific election.
SELECT CandidateID
FROM ElectionResults
WHERE VotesReceived = (SELECT MAX(VotesReceived) FROM ElectionResults);


--28. Calculate the average number of votes received by candidates.
select CandidateID,AVG(VotesReceived) as Avrage_votes
from ElectionResults
group by CandidateID

--29. Count the number of elections conducted.
select Count(ElectionID)
from Elections

--30. Determine the total number of votes cast in all elections.
select sum(VotesReceived) as Total_votes
from ElectionResults;

--31. Identify the election with the highest voter turnout.
select ElectionID,MAX(VoterID)as MAX_Voter
from Votes
group by ElectionID
order by MAX_Voter desc;

--32. Find the candidate with the highest total votes across all elections.
select ElectionID,MAX(VotesReceived) as Highest_Votes
from ElectionResults
group by ElectionID
order by Highest_Votes desc;

--33. Calculate the percentage of votes received by each candidate in a specific election.*
select CandidateID,(VotesReceived*100/sum(VotesReceived) Over()) as Percentage
from ElectionResults
where ElectionID=1003  

--34. Count the number of voters who participated in more than one election.*
select Count( VoterID) ,VoterID
from Votes 
group by VoterID
having Count(*)>1

35. Find the candidate who received the highest percentage of votes in any election.
select CandidateID,(VotesReceived*100/sum(VotesReceived) Over()) as Percentage
from ElectionResults

Join Queries:

--36. Retriesve the names of candidates along with the election they participated in.
select C.Name,ElectionName
from Candidates C Left join Elections E
on C.CandidateID=E.ElectionID

--37. Display the names of voters who voted for a candidate along with the election details.
select V.Name,C.Name,E.ElectionName,E.ElectionDate,E.ElectionID
   from Voters V join Candidates C
on V.VoterID=C.CandidateID
join Elections E
on V.VoterID=E.ElectionID

--38. List all election results, including candidate names and their respective parties.
select C.Name,C.Party,E.VotesReceived
from Candidates C join ElectionResults E
on C.CandidateID=E.CandidateID

--39. Find the number of votes received by each candidate, including their party affiliation.
select Candidates.Name,Candidates.Party,
 Count(VotesReceived)as vote_count
from ElectionResults 
join Candidates
on Candidates.CandidateID=ElectionResults.CandidateID
group by Candidates.Name,Candidates.Party


--40. Retrieve the names of voters who participated in an election along with the 
--candidate they voted for. select*From Elections
select V.Name,C.Name,E.ElectionName
from Voters V join Elections E
on V.VoterID=E.ElectionID
join Candidates C
on E.ElectionID=C.CandidateID

--41. Display the results of a specific election, including candidate names, votes received,
--and party affiliation.
select C.Name,C.Party,VotesReceived
from Candidates C join ElectionResults E
on C.CandidateID=E.ElectionID
where ElectionID=4

--42. List all votes cast, including the names of voters, candidates, and the election details.
select V.VoteID,V.VoteDateTime,Vr.Name,C.Name,E.ElectionName,E.ElectionDate
from Votes V join Voters Vr
on V.VoterID=Vr.VoterID
join Candidates C
on V.VoterID=C.CandidateID
join Elections E
on E.ElectionID=V.VoterID

--43. Find the total number of votes received by each party across all elections.
select C.Party,sum(VotesReceived)as total_votes
from Candidates  C
join ElectionResults E
on C.CandidateID=E.ElectionID
Group  by C.Party
        
--44. Retrieve the names of candidates who did not receive any votes in a specific election.
select C.Name,E.VotesReceived
from Candidates C join ElectionResults E
on C.CandidateID=E.ElectionID
where VotesReceived=000
select*From Elections


--45. List all elections along with the names of candidates who participated in them.
select E.ElectionName,C.Name      
from   Elections E join Candidates C
on E.ElectionID=C.CandidateID
