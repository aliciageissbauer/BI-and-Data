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

   ![image](https://github.com/user-attachments/assets/d5bbb442-3751-4cd5-95d0-e16162ed6ed0)

1. **Data Cleaning.**

`	`**3.1 Drop unnecessary columns.**

![image](https://github.com/user-attachments/assets/ba8d37aa-3470-4956-8cfc-337604b87b3f)


**3.2 Correct errors in “duration” and “rating”**

There were 3 rows where the duration value was incorrectly placed in the rating column.

![image](https://github.com/user-attachments/assets/b4807753-726e-459b-997f-b7102cd084ef)


**3.3 	Search for nulls values in the data**

![image](https://github.com/user-attachments/assets/b4220c0b-d42f-4174-a5bb-93191ca6ca8e)


1. **Countries Normalization** 

   **4.1 Countries table**

   It was necessary to create the "Countries" table to normalize the country data. This table contains only two columns:

- CountryID INT, Primary Key
- CountryName NVARCHAR(MAX), not null

![image](https://github.com/user-attachments/assets/9c6ce359-17d2-4cf9-b671-bef964f58ae5)


**4.2 ShowsCountries table**

To connect our netflix\_titles to the Countries table, I created an intermediary table containing the IDs from both tables:

-showID int not null.

-CountryID int not null.

![image](https://github.com/user-attachments/assets/12966bdc-3292-4149-8849-5524f2232f19)


**4.3 Double-check relationships between ShowCountry - Countries**

![image](https://github.com/user-attachments/assets/cbf479c2-4391-42c2-830f-63e0761000b8)




1. **Genres Normalization**

   **5.1 Create Genre table**

   This table contains unique genre values with their corresponding  IDs:

- GenreID int, Primary Key
- Genre NVARCHAR(MAX) Not  null,

![image](https://github.com/user-attachments/assets/c44c6a39-3aaf-4a53-8ab7-d8ec9ecf679c)


**5.2 Create intermediate table “ShowsGenre”**

This table contains IDs from netflix\_titles and Genre

-showID NVARCHAR(50) not null,

-GenreID INT not null,

![image](https://github.com/user-attachments/assets/8036912a-a066-4f94-87a7-c0ab2f0db4aa)


**5.3 Double-check relationships between ShowGenre - Genre**

![image](https://github.com/user-attachments/assets/aae2e515-540d-4296-b1c9-28e8cc533e78)


1. **Deleting repeated values**

   **6.1 Identify affected records**

   In this case, there were only 3 repeated values “Thriller”, “Drama” and, “Horror”

   ![image](https://github.com/user-attachments/assets/36b16d4d-4d67-4077-82da-11650d9135d2)


   **6.2 Update duplicate values**

   ![image](https://github.com/user-attachments/assets/8c0ede88-2ff9-40c9-82de-b51f0c512ab2)


   **6.3 Reasign relationships**

   ![image](https://github.com/user-attachments/assets/6037aa5d-76a2-45b1-bc62-e65b34429387)

![image](https://github.com/user-attachments/assets/59650e68-bcda-4bb1-899c-036faff5269d)


![image](https://github.com/user-attachments/assets/1e7844fe-9b94-4f3d-976a-60d3c3ab088d)


   **6.4 Delete duplicate values**

  ![image](https://github.com/user-attachments/assets/4a76ea91-6c9c-4497-b89a-c20919d1b599)


Thanks to these transformations, we now have 1 fact table and 4 additional tables related to the netflix\_title table.

Now, we are ready to start our analysis in Power BI.
