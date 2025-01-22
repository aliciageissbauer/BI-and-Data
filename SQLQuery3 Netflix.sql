-- 1. Back up my fact table

select * 
INTO NetflixTitles_backup
from [dbo].[netflix_titles]

-- Check my back up table
select * from NetflixTitles_backup 

-- Data cleaning
-- 2.1 Drop unnecessary columns
ALTER TABLE [dbo].[netflix_titles]
DROP COLUMN column13, column14,column15,column16,column17,column18,column19,
column20,column21,column22,column23,column24,column25,column26;

--2.2 Correct errors in "duration" and "rating"
update [dbo].[netflix_titles]
set duration = rating
where duration is null;

-- check columns with nulls
SELECT * FROM [dbo].[netflix_titles]
where [duration] is null

--- Double check the data with examples
select * from netflix_titles1
where title  like 'Louis C.K%'

update netflix_titles1
set rating = null
where title like 'Louis C.K%'

-- Search for nulls in columns
select * from netflix_titles1
where rating is NULL

select * from netflix_titles1
where director is NULL

select * from netflix_titles1
where country is NULL

select * from netflix_titles1
where cast is NULL

--3. Normalization

-- Create "Countries" table to normalize countries

CREATE TABLE Countries (
CountryID INT IDENTITY(1,1) PRIMARY KEY,
CountryName NVARCHAR(MAX) not null );

-- Fill "Countries" table with unique values

INSERT INTO Countries (CountryName)
SELECT DISTINCT TRIM(value)
FROM [dbo].[netflix_titles]
CROSS APPLY string_split(country, ',');

SELECT * FROM Countries

-- Creation of the intermediate table NetflixCountries

CREATE TABLE ShowsCountries (
showID NVARCHAR(50) NOT NULL,
CountryID int not null, 
FOREIGN KEY (showID) REFERENCES [dbo].[netflix_titles]([show_id]),
FOREIGN KEY (CountryID) REFERENCES [dbo].[Countries](CountryID));

--- Matching titles to Countries in ShowsCountries

INSERT INTO ShowsCountries (showID, CountryID)
SELECT 
	n.show_id as ShowID,
	c.CountryID
	FROM [dbo].[netflix_titles] n
CROSS APPLY string_split(n.Country, ',') as SplitCountries
JOIN Countries c ON TRIM(SplitCountries.value) = c.CountryName

select * from netflix_titles

select * from ShowsCountries


-- Check relationships between ShowCountry - Countries

SELECT 
	n.Title AS ShowTitle,
	c.CountryName
	from ShowsCountries mc
	JOIN [dbo].[netflix_titles] n on mc.showID = n.show_id
	JOIN [dbo].[Countries] c on mc.CountryID = c.CountryID
	where n.title like '%Family';


	---4.Genre Normalization 

--Create "Genre" table
CREATE TABLE Genre (
GenreID INT IDENTITY (1,1) Primary key,
Genre NVARCHAR(MAX) NOT NULL);


--Fill "Genre" with unique values
INSERT INTO Genre (Genre)
SELECT DISTINCT TRIM(value)
from [dbo].[netflix_titles]
cross apply string_split(listed_in,',');

-- Double check
SELECT * FROM Genre
where genre like 'drama%'
order by Genre asc


select distinct listed_in
from netflix_titles
where listed_in like 'drama%'
order by listed_in ASC

--Create intermediate table "ShowsGenre"

CREATE TABLE ShowsGenre (
showID NVARCHAR(50) NOT NULL,
GenreID int not null, 
FOREIGN KEY (showID) REFERENCES [dbo].[netflix_titles]([show_id]),
FOREIGN KEY (GenreID) REFERENCES   Genre(GenreID));


select *  from Genre

---Matching Netflixtitles with ShowsGenre and Genre
INSERT INTO ShowsGenre(showID, GenreID)
SELECT 
	n.show_id as ShowID,
	g.GenreID
	FROM [dbo].[netflix_titles] n
CROSS APPLY string_split(n.Listed_in, ',') as SplitGenre
JOIN Genre g ON TRIM(SplitGenre.value) = g.Genre

--Double check

select * from ShowsGenre
select * from Genre

SELECT 
	n.Title AS ShowTitle,
	g.Genre
	from ShowsGenre mc
	JOIN [dbo].[netflix_titles] n on mc.showID = n.show_id
	JOIN [dbo].[Genre] g on mc.GenreID = g.GenreID
	where n.title like '%Family';



	select * from [dbo].[netflix_titles_backup]
	where listed_in like 'Drama%'

	select * from [dbo].[NetflixTitles_backup]


	---5. Normalization Dramas- Drama

	-- Backup ShowsGenre table

	select *
	into ShowGenreBackup
	from [dbo].[ShowsGenre]

	select * from ShowGenreBackup
	select * from ShowsGenre

	-- Back up Genre Table

	select *
	into GenreBackup
	from [dbo].[Genre]

	select * from Genre
	select * from GenreBackup


	-- Identify affected records
	select * from Genre
	where genre like '%Thriller%'
	--Thrillers y Thriller

		select * from Genre
	where genre like '%horror%'
	--Horror y Horror Movies

	select * from Genre
	where genre like '%drama%'
	--Drama y Dramas

	--2. Update the duplicate value in the table

	UPDATE Genre
	SET Genre = 'Drama'
	WHERE Genre = 'Dramas';

	UPDATE Genre
	set Genre = 'Horror'
	where Genre = 'Horror Movies'

	UPDATE Genre
	set Genre = 'Thriller'
	where Genre = 'Thrillers'
	
	select Genre
	from Genre
	where Genre like '%Thriller%'


--3. Reassigning relationships in ShowsGenre

-- Identify principal GenreID  
select * from Genre
where Genre ='Drama'

-- I stayed with 14
update ShowsGenre
set GenreID = (SELECT GenreID FROM Genre WHERE GenreID= '14')
WHERE GenreID = (select GenreID from Genre where GenreID = '13');

select * from ShowsGenre
where GenreID = '13' or GenreID ='14' 

-- Identify principal Thriller GenreID
select * from Genre
where Genre ='thriller'  -- 5 y 28

--Identify which one has more rows
select * from ShowsGenre
where GenreID = '28' or GenreID = '5'; --Nos quedamos con el 5

-- update showsgenre: Thriller GenreID: 5

update ShowsGenre
set GenreID = (select GenreID from Genre where GenreID = '5')
where GenreID = (select GenreID from Genre where GenreID = '28');

-- Double check 
select * from ShowsGenre
where GenreID = '5'

-- Identify principal Horror GenreID
select * from genre
where Genre = 'Horror' -- 16 y 23


--Identify which one has more rows

select * from ShowsGenre --16 solo 1 row y 23 tiene 357 rows, entonces nos quedamos con el 23
where GenreID = '23'

-- update showsgenre: Thriller GenreID: 23
update ShowsGenre
set GenreID = (select GenreID from Genre where GenreID = '23')
where GenreID = (select GenreID from Genre where GenreID = '16');

-- Double check

select *  from ShowsGenre
where GenreID = '23'



--Delete duplicates rows
--Drama y Dramas

delete from genre
where GenreID = '13';

select * from genre
where GenreID = '14'

--Thriller
delete from genre
where GenreID = '28'

select * from genre
where GenreID = '5'

--Horror

delete from Genre
where GenreID = '16'

select *  from Genre
where GenreID ='23'


--Double check changes

select * from Genre

select * from ShowsGenre where GenreID = (Select GenreID from genre where Genre = 'Drama');

select * from ShowsGenre where GenreID = '14'

select * from ShowsGenre where GenreID = (select GenreID from Genre where Genre = 'thriller');

select * from ShowsGenre where GenreID = '5'

select * from ShowsGenre where GenreID = (Select GenreID from Genre where Genre ='horror');

--Double check



SELECT 
	n.Title AS ShowTitle,n.date_added,c.CountryName, n.type
	from ShowsCountries mc
	JOIN [dbo].[netflix_titles] n on mc.showID = n.show_id
	JOIN [dbo].[Countries] c on mc.CountryID = c.CountryID
	where  date_added > '01/01/2016';

	select * from netflix_titles
	where country like '%Mexico%'

	CountryName like '%United States%' and 
select * from netflix_titles
where date_added > '01/01/2016' and where 
