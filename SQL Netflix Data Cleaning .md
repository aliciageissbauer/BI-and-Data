# <a name="_8q5b7l6fdo3z"></a>**SQL Data Cleaning**
Here is the complete SQL Documentation for data cleaning.

1. **Netflix\_titles** 

   This is a detailed analysis of the netflix\_titles table that contains 8,809 rows and 12 columns.

   |**Name**|**Data type**|**Description**|**Values (example)**|
   | :- | :- | :- | :- |
   |show\_id|<p>Primary key</p><p>nvarchar(50)</p>|ID for every show|<p>s1</p><p>s10</p>|
   |type|nvarchar(50)|Content classification|<p>Movie</p><p>TV Show</p>|
   |title|nvarchar(250)|Content title|<p>Dick Johnson Is Dead</p><p>On the Verge</p>|
   |country|nvarchar(max)|Countries where the title is available|<p>United States</p><p>India</p>|
   |date\_added|date|Date when the content was added to Netflix|<p>2021-09-25</p><p>2021-09-24</p>|
   |release\_year|int|Release year of content|<p>2020</p><p>2021</p>|
   |rating|nvarchar(50)|<p>Content rating</p><p></p>|<p>PG-13</p><p>TV-MA</p>|
   |listed\_in|nvarchar(max)|<p>Genres associated with the content</p><p></p>|<p>Documentaries</p><p>Comedies, Dramas</p>|
   |director|nvarchar(250)|<p>Director's name</p><p></p>|<p>Kirsten Johnson</p><p>Theodore Melfi</p>|
   |cast|text|<p>Cast of the content</p><p></p>|Melissa McCarthy, Chris O'Dowd, etc|
   |duration|nvarchar(50)|Content duration|<p>90 min</p><p>1 Season</p>|
   |description|text|Brief description of the content|As her father nears the end of his life, filmmaker Kirsten Johnson stages his death in inventive and comical ways to help them both face the inevitable.|

1. **Back up my Netflix\_titles table.**

   ![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.001.png)

1. **Data Cleaning.**

`	`**3.1 Drop unnecessary columns.**

![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.002.png)

**3.2 Correct errors in “duration” and “rating”**

There were 3 rows where the duration value was incorrectly placed in the rating column.

![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.003.png)

**3.3 	Search for nulls values in the data**

![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.004.png)

1. **Countries Normalization** 

   **4.1 Countries table**

   It was necessary to create the "Countries" table to normalize the country data. This table contains only two columns:

- CountryID INT, Primary Key
- CountryName NVARCHAR(MAX), not null

![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.005.png)

**4.2 ShowsCountries table**

To connect our netflix\_titles to the Countries table, I created an intermediary table containing the IDs from both tables:

-showID int not null.

-CountryID int not null.

![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.006.png)

**4.3 Double-check relationships between ShowCountry - Countries**

![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.007.png)



1. **Genres Normalization**

   **5.1 Create Genre table**

   This table contains unique genre values with their corresponding  IDs:

- GenreID int, Primary Key
- Genre NVARCHAR(MAX) Not  null,

![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.008.png)

**5.2 Create intermediate table “ShowsGenre”**

This table contains IDs from netflix\_titles and Genre

-showID NVARCHAR(50) not null,

-GenreID INT not null,

![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.009.png)

**5.3 Double-check relationships between ShowGenre - Genre**

![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.010.png)


1. **Deleting repeated values**

   **6.1 Identify affected records**

   In this case, there were only 3 repeated values “Thriller”, “Drama” and, “Horror”

   ![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.011.png)

   **6.2 Update duplicate values**

   ![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.012.png)

   **6.3 Reasign relationships**

   ![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.013.png)

   ![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.014.png)

   **6.4 Delete duplicate values**

   ![](Aspose.Words.53d96ccc-51b5-4e2a-93f6-bff885aafbcd.015.png)

Thanks to these transformations, we now have 1 fact table and 4 additional tables related to the netflix\_title table.

Now, we are ready to start our analysis in Power BI.
