USE [WORLD BANK]

--Number of Countries receiving assistance from IDA--
SELECT COUNT(DISTINCT (Country_Economy)) AS Number_Of_Countries
FROM [wb.funding]

--Number of Loans Funded by IBRD--
SELECT COUNT(Due_to_IBRD_US) AS Number_Of_Loans_by_IBRD FROM [wb.funding]

--Total Amount Funded by IBRD--
SELECT SUM(Due_to_IBRD_US) AS Total_Amount_Funded_by_IBRD FROM [wb.funding]

--Top 10 countries with greatest amount owed to the World Bank--
SELECT TOP 10 Country_Economy, SUM(Due_to_IBRD_US) AS Total_Amount_Owed
FROM [wb.funding]
GROUP BY Country_Economy
ORDER BY Total_Amount_Owed DESC


--Top 10 African countries with greatest amount owed to the World Bank--
SELECT TOP 10 Country_Economy,
SUM(Due_to_IBRD_US) AS Total_Amount_Owed
FROM [wb.funding]
WHERE Region LIKE 'Africa'
GROUP BY Country_Economy
ORDER BY Total_Amount_Owed DESC

--Number of current loans funded by IBDR to Kenya--
SELECT Country_Economy, COUNT(Due_to_IBRD_US) AS Number_of_Loans
FROM [wb.funding]
WHERE Country_Economy LIKE 'Kenya' 
GROUP BY Country_Economy

--Total Amount owed to IBDR by Kenya--
SELECT Country_Economy, SUM(Due_to_IBRD_US) AS Total_Amount_owed
FROM [wb.funding]
WHERE Country_Economy LIKE 'Kenya' 
GROUP BY Country_Economy


--Total Amount paid back to IBDR by Kenya--
SELECT Country_Economy, SUM(Repaid_to_IBRD_US) AS Total_Amount_paid
FROM [wb.funding]
WHERE Country_Economy LIKE 'Kenya' 
GROUP BY Country_Economy


--Total Amount of Kenya's loan cancelled by IBDR--
SELECT Country_Economy, SUM(Cancelled_Amount_US) AS Total_Amount_Cancelled
FROM [wb.funding]
WHERE Country_Economy LIKE 'Kenya' 
GROUP BY Country_Economy

--Top 10 projects funded by IBDR in Kenya--
SELECT TOP 10 Project_Name, MAX(Original_Principal_Amount_US) AS Funding
FROM [wb.funding]
WHERE Country_Economy LIKE 'Kenya' AND Project_Name IS NOT NULL
GROUP BY Project_Name
ORDER BY MAX(Original_Principal_Amount_US) DESC


--Top 15 projects funded by IBDR in China--
SELECT TOP 15 Project_Name, MAX(Original_Principal_Amount_US) AS Funding
FROM [wb.funding]
WHERE Country_Economy LIKE 'Japan' AND Project_Name IS NOT NULL
GROUP BY Project_Name
ORDER BY MAX(Original_Principal_Amount_US) DESC

--Top 15 projects funded by IBDR in China--
SELECT TOP 15 Project_Name, MAX(Original_Principal_Amount_US) AS Funding
FROM [wb.funding]
WHERE Country_Economy LIKE 'Nigeria' AND Project_Name IS NOT NULL
GROUP BY Project_Name
ORDER BY MAX(Original_Principal_Amount_US) DESC





