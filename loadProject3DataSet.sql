-- loadProject3DataSet.sql

USE uscdi;

DROP TABLE IF EXISTS USChronicDiseaseIndicators;
DROP TABLE IF EXISTS States;
DROP TABLE IF EXISTS Topic;
DROP TABLE IF EXISTS StratificationCategory1;
DROP TABLE IF EXISTS Stratification1;

CREATE TABLE USChronicDiseaseIndicators (
  YearStart varchar(10),
  YearEnd varchar(10),
  LocationAbbr varchar(10),
  LocationDesc varchar(50),
  DataSource varchar(100),
  Topic varchar(200),
  Question varchar(250),
  Response varchar(10),
  DataValueUnit varchar(50),
  DataValueType varchar(200),
  DataValue varchar(100),
  DataValueAlt varchar(10),
  DataValueFootnoteSymbol varchar(10),
  DatavalueFootnote varchar(500),
  LowConfidenceLimit varchar(10),
  HighConfidenceLimit varchar(10),
  StratificationCategory1 varchar(100),
  Stratification1 varchar(100),
  StratificationCategory2 varchar(10),
  Stratification2 varchar(10),
  StratificationCategory3 varchar(10),
  Stratification3 varchar(10),
  ResponseID varchar(50),
  GeoLocation varchar(150),
  LocationID varchar(10),
  TopicID varchar(10),
  QuestionID varchar(20),
  DataValueTypeID varchar(50),
  StratificationCategoryID1 varchar(20),
  StratificationID1	 varchar(20),
  StratificationCategoryID2 varchar(20),
  StratificationID2 varchar(20),
  StratificationCategoryID3 varchar(20),
  StratificationID3 varchar(20)
  );
    
LOAD DATA INFILE 'c:/data/USChronicDiseaseIndicators.csv' 
INTO TABLE USChronicDiseaseIndicators 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE xx SET xx = SUBSTRING(xx, 1, CHAR_LENGTH(xx)-1);

SELECT DISTINCT YearStart, YearEnd, Topic, LocationAbbr 
	FROM USChronicDiseaseIndicators 
    WHERE LocationAbbr <> 'US';  


-- MySQL does not support the SELEC\T ... INTO ... syntax
-- We need to use the INSERT INTO ... SELECT .. syntax to accomplish it
-- Read more here.. http://dev.mysql.com/doc/refman/5.0/en/insert-select.html
-- Create table and insert States 
CREATE TABLE States (
  LocationAbbr varchar(5),
  LocationDesc varchar(50)  
);

INSERT INTO States (LocationAbbr, LocationDesc)
SELECT DISTINCT LocationAbbr, LocationDesc 
	FROM USChronicDiseaseIndicators 
	WHERE LocationAbbr <> 'US'; 
    
SELECT * FROM States;

-- Create table and insert Topic 
CREATE TABLE Topic (
  TopicID varchar(10),
  Topic varchar(150)
);

INSERT INTO Topic (TopicID, Topic)
SELECT DISTINCT TopicID, Topic   
	FROM USChronicDiseaseIndicators 
	WHERE LocationAbbr <> 'US'; 
    
SELECT * FROM Topic;

-- Create table and insert StratificationCategory1 
CREATE TABLE StratificationCategory1 (
  StratificationCategoryID1 varchar(100),
  StratificationCategory1 varchar(100)
);

INSERT INTO StratificationCategory1 (StratificationCategoryID1, StratificationCategory1)
SELECT DISTINCT StratificationCategoryID1, StratificationCategory1  
	FROM USChronicDiseaseIndicators 
	WHERE LocationAbbr <> 'US'; 
    
SELECT * FROM StratificationCategory1;

-- Create table and insert Stratification1 
CREATE TABLE Stratification1 (
  StratificationID1 varchar(10),
  Stratification1 varchar(100)
);

INSERT INTO Stratification1 (StratificationID1, Stratification1)
SELECT DISTINCT StratificationID1, Stratification1  
	FROM USChronicDiseaseIndicators 
	WHERE LocationAbbr <> 'US'; 
    
SELECT * FROM Stratification1;




