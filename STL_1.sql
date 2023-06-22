--- SQL exporation data for soil testing lab

--- Joining both tables into one
With Clients As 
(SELECT *,
FROM `STL_orders.STL-2018-2022_4-1` 
UNION DISTINCT
SELECT *
FROM `STL_orders.STL-2021-2022_4-1`)
-- From the new table
SELECT 
*
FROM Clients

--- Exploring the amount of samples received grouped by years

SELECT Safe_cast (Year as Integer) as Year, COUNT (*) AS number_of_order
FROM 
(SELECT Year,  LabNo
FROM `STL_orders.STL-2018-2022_4-1` 
UNION DISTINCT
SELECT Year, LabNo
FROM `STL_orders.STL-2021-2022_4-1`)
WHERE  Year > 2017 AND 2023 > Year
GROUP BY Year
ORDER BY Year DESC

--- Most frequent client either person or business

With Clients As 
(SELECT *,
FROM `STL_orders.STL-2018-2022_4-1` 
UNION DISTINCT
SELECT *
FROM `STL_orders.STL-2021-2022_4-1`)
SELECT 
Customer,
Count (*) AS Total_samples
FROM Counties
where sector = "Private"
Group BY Customer
Order by Total_samples DESC

--- Time of the year where the most amount of samples are recevied

SELECT Month, COUNT (*) AS number_of_order
FROM 
(SELECT Year,  Month, LabNo
FROM `STL_orders.STL-2018-2022_4-1` 
WHERE  Year > 2017 AND 2023 > Year
UNION DISTINCT
SELECT Year, Month, LabNo
FROM `STL_orders.STL-2021-2022_4-1`
WHERE  Year > 2017 AND 2023 > Year)
GROUP BY Month
ORDER BY number_of_order DESC

--- Which sector send the most number el samples
SELECT Sector, COUNT (*) AS number_of_order
FROM 
(SELECT Year,  Sector, LabNo
FROM `STL_orders.STL-2018-2022_4-1` 
WHERE  Year > 2017 AND 2023 > Year
UNION DISTINCT
SELECT Year, Sector, LabNo
FROM `STL_orders.STL-2021-2022_4-1`
WHERE  Year > 2017 AND 2023 > Year)
GROUP BY Sector
ORDER BY number_of_order DESC



