# <a name="_s775r8e9wp8k"></a>**🎥 Power BI Netflix Dashboard**
**1. Data Preparation**
After completing the data cleaning in SQL, I connected to my SQL tables using the following steps:

1. Navigate to **Get Data**.
1. Select **Connect to SQL Server**.

**Data Transformation**
1\.1 **Duplicate the date\_added column in netflix\_titles**

- I duplicated this column to split it by a delimiter, creating new columns: day\_added, month\_added, and year\_added.
- I also filtered the data to include only the years 2016 to 2021, as they contain relevant data.

**Data Quality**

- I enabled **Column Distribution** and **Data Quality** options to verify the quality of my data and ensure all tables were in good condition.

**DAX Measures**
3\.1 **sum\_titles**

- This measure calculates the distinct count of all movies and TV shows.

3\.2 **TitlesByCountry / TitlesByGenre / TitlesByRating**

- Using the sum\_titles measure, these calculations provide the number of titles by country, genre, and rating.

3\.3 **TopCountryName / TopGenre / TopRating**

- These measures identify the top country, genre, and rating based on the corresponding titles using TitlesByCountry, TitlesByGenre, and TitlesByRating.

**Data Visualization** 📊
I used various chart types to represent the data effectively, including:

- Cards
- Bar Charts
- Doughnut Charts
- Line Charts
- Slicers


