-- Q3
-- Source: 
-- Oracle, 2025. How to Create Users, Grant Them Privileges, and Remove 
--      Them in Oracle Database, 30 July 2018. [Online]. Available at: 
--      https://blogs.oracle.com/sql/post/how-to-create-users-grant-them-privileges-and-remove-them-in-oracle-database 
--      [Accessed 23 September 2025].

-- Setting the correct container
ALTER SESSION SET CONTAINER="XEPDB1";

-- Creating User John
CREATE USER John IDENTIFIED BY "Johnch2024";

--Creating User Hannah
CREATE USER Hannah IDENTIFIED BY "Hannahch2024";

-- Granting SELECT ANY TABLE privilege to John
GRANT CREATE SESSION TO John;
GRANT SELECT ANY TABLE TO John;

-- Granting INSERT ANY TABLE privilege to Hannah
GRANT CREATE SESSION TO Hannah;
GRANT INSERT ANY TABLE TO Hannah;

-- END OF Q3