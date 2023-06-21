-- Clean data, join both dataset to show the total number of samples
With Counties As 
(SELECT
Customer,
regexp_replace (TRIM(TRIM(Customer, " "),  "."), r'Dist|Dis|District', 'District'), 
regexp_replace(TRIM(TRIM(Customer, " "),  "."), r'Ext.|Ext|Extension', 'Extension'),
Safe_cast (LabNo as Integer) as LabNo,
Month,
Year, 
OrderNo
FROM `geometric-petal-362919.STL_orders.STL_2018-2022_3-11` 
UNION DISTINCT
SELECT
Customer, 
regexp_replace (TRIM(TRIM(Customer, " "),  "."), r'Dist|Dis|District', 'District'), 
regexp_replace (TRIM(TRIM(Customer, " "),  "."), r'Ext.|Ext|Extension', 'Extension'),
Safe_cast (LabNo as Integer) as LabNo,
Month,
Year, 
OrderNo
FROM `geometric-petal-362919.STL_orders.STL_2021-2022_v-3-11`)
-- From the new table motnh and year total samples
SELECT 
Customer,
Year,
Month,
COUNT (*) AS Total_samples,
FROM Counties
#WHERE REGEXP_CONTAINS(Customer, r"Extension District|County Extension|Trail Extension")  
WHERE LabNo < 100000
GROUP BY 
Customer, 
Year, 
Month
ORDER BY Total_samples DESC



With Counties As 
(SELECT *,
FROM `geometric-petal-362919.STL_orders.STL_2018-2022_4-1` 
UNION DISTINCT
SELECT *
FROM `geometric-petal-362919.STL_orders.STL_2021-2022_4-1`)
-- From the new table
SELECT 
Customer,
Count (*) AS Total_samples
FROM Counties
where sector = "Private"
Group BY Customer
Order by Total_samples DESC


