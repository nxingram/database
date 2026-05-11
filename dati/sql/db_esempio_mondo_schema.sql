-- TABELLA COUNTRY
IF OBJECT_ID('country', 'U') IS NOT NULL DROP TABLE country;
CREATE TABLE country (
  Code char(3) NOT NULL DEFAULT '',
  Name char(52) NOT NULL DEFAULT '',
  -- SQL Server non ha ENUM, usiamo varchar + CHECK
  Continent varchar(20) NOT NULL DEFAULT 'Asia' 
    CHECK (Continent IN ('Asia','Europe','North America','Africa','Oceania','Antarctica','South America')),
  Region char(26) NOT NULL DEFAULT '',
  SurfaceArea decimal(10,2) NOT NULL DEFAULT 0.00,
  IndepYear smallint DEFAULT NULL,
  Population int NOT NULL DEFAULT 0,
  LifeExpectancy decimal(3,1) DEFAULT NULL,
  GNP decimal(10,2) DEFAULT NULL,
  GNPOld decimal(10,2) DEFAULT NULL,
  LocalName char(45) NOT NULL DEFAULT '',
  GovernmentForm char(45) NOT NULL DEFAULT '',
  HeadOfState char(60) DEFAULT NULL,
  Capital int DEFAULT NULL,
  Code2 char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (Code)
);

-- TABELLA CITY
IF OBJECT_ID('city', 'U') IS NOT NULL DROP TABLE city;
CREATE TABLE city (
  ID int IDENTITY(1,1) PRIMARY KEY, -- IDENTITY al posto di AUTO_INCREMENT
  Name char(35) NOT NULL DEFAULT '',
  CountryCode char(3) NOT NULL DEFAULT '',
  District char(20) NOT NULL DEFAULT '',
  Population int NOT NULL DEFAULT 0,
  CONSTRAINT FK_city_country FOREIGN KEY (CountryCode) REFERENCES country (Code)
);

-- TABELLA COUNTRYLANGUAGE
IF OBJECT_ID('countrylanguage', 'U') IS NOT NULL DROP TABLE countrylanguage;
CREATE TABLE countrylanguage (
  CountryCode char(3) NOT NULL DEFAULT '',
  Language char(30) NOT NULL DEFAULT '',
  -- Sostituito ENUM con varchar + CHECK
  IsOfficial varchar(1) NOT NULL DEFAULT 'F' CHECK (IsOfficial IN ('T','F')),
  Percentage decimal(4,1) NOT NULL DEFAULT 0.0,
  PRIMARY KEY (CountryCode, Language),
  CONSTRAINT FK_language_country FOREIGN KEY (CountryCode) REFERENCES country (Code)
);
