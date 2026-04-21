--Query to list all of the events in a region
--This could be used to see which events are close by
--Input should be a valid region
--Output will be the events in a region
SELECT Name, StartDate
FROM Robotics_Event
WHERE Region = INPUTVARIABLE;

--Query to list all of the tams in a region
--This could be used to see which teams are close by
--Input should be a valid region
--Output will be the events in a region
SELECT TeamID, Name, Organization
FROM Robotics_Team
WHERE Region = INPUTVARIABLE;

--Query to list the size of a  team
--This could be used to see how large each team is
--Input should be a Team
--Output will be the numbere of people on that team
SELECT TeamID, COUNT(UserID) AS NumberOfMembers
FROM Member_Registry
WHERE TeamID = INPUTVARIABLE
GROUP BY TeamID;

--Query to get all of the teams at an event
--This could be used to see who is giong to a compeition in advance
--Input should be a valid EventCode
--Output will be all the teams at the event
SELECT TeamID
FROM Robotics_Team, Competes_At
WHERE Robotics_Team.TeamID = Competes_At.TeamID
AND EventCode = INPUTVARIABLE;

--Query to find all of the events a team is registered for
--This could be used to see what events your team is going to
--Input should be a valid team
--Output will be the events they are going to
SELECT Robotics_Event.Name, StartDate
FROM Robotics_Event, Competes_At
WHERE Robotics_Event.EventCode = Competes_At.EventCode
AND TeamID = INPUTVARIABLE;


--Query to get the average score of all teams at an event
--This could be used to see how compeitive an event is
--Input should be a valid EventCode
--Output will be the average score of the attending teams
SELECT AVG(ProgrammingScore + DrivingScore) AS AverageScore
FROM Robotics_Team, Competes_At
WHERE Robotics_Team.TeamID = Competes_At.TeamID
AND EventCode = INPUTVARIABLE;

