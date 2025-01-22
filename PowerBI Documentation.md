# <a name="_s775r8e9wp8k"></a>**🎥 Power BI Netflix Dashboard**
**1. Data Preparation**
After completing the data cleaning in SQL, I connected to my SQL tables using the following steps:

1. Navigate to **Get Data**.
1. Select **Connect to SQL Server**.

**2. Data Transformation**
1\.1 **Duplicate the date\_added column in netflix\_titles**

- I duplicated this column to split it by a delimiter, creating new columns: day\_added, month\_added, and year\_added.
- I also filtered the data to include only the years 2016 to 2021, as they contain relevant data.


![image](https://github.com/user-attachments/assets/3158cc8c-8bc4-4549-b746-52800600f4af)
![image](https://github.com/user-attachments/assets/245ea14e-adce-472a-9296-199f6e9a7b09)
![image](https://github.com/user-attachments/assets/72898ca7-731f-479c-86ed-8c70b424dbe3)


**3. Data Quality**

- I enabled **Column Distribution** and **Data Quality** options to verify the quality of my data and ensure all tables were in good condition.

  ![image](https://github.com/user-attachments/assets/f2403964-9d9c-4331-89e0-b5c8055f09f8)


**4. DAX Measures**

**4.1 sum\_titles**

- This measure calculates the distinct count of all movies and TV shows.

![image](https://github.com/user-attachments/assets/2487b3d4-f0dd-4166-b667-ddc124eef891)


**4.2 TitlesByCountry / TitlesByGenre / TitlesByRating**

- Using the sum\_titles measure, these calculations provide the number of titles by country, genre, and rating.

![image](https://github.com/user-attachments/assets/009a57f0-c245-4de0-8606-5df4c027bc27)
![image](https://github.com/user-attachments/assets/9940f7c8-f49b-466a-a57f-77de43d9b7ec)
![image](https://github.com/user-attachments/assets/62515b4e-daa8-4c51-8fb0-2614f4ab7c72)

**4.3 TopCountryName / TopGenre / TopRating**

- These measures identify the top country, genre, and rating based on the corresponding titles using TitlesByCountry, TitlesByGenre, and TitlesByRating.

![image](https://github.com/user-attachments/assets/f185aea9-0a37-4268-8a38-ec99b594e1df)
![image](https://github.com/user-attachments/assets/6edd854c-9d00-495f-ac3c-4c30ae01ab38)
![image](https://github.com/user-attachments/assets/9b030a86-f009-4dfe-ae11-d0620551482a)

**5. Data Visualization** 📊
I used various chart types to represent the data effectively, including:

- Cards
- Bar Charts
- Doughnut Charts
- Line Charts
- Slicers

![image](https://github.com/user-attachments/assets/6869101b-bb08-4884-8195-404481cf34fd)


Thank you for taking a look at my project!😊

