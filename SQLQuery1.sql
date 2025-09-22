USE [WORLD BANK]

SELECT * FROM [wb.funding]

SELECT COUNT(*) AS Total_Rows
FROM [dbo].[wb.funding];

SELECT 
    CASE 
        WHEN COUNT(*) = COUNT(DISTINCT Loan_Number, Project_ID, Original_Principal_Amount_US, Agreement_Signing_Date) THEN 'No duplicates found'
        ELSE 'Duplicates exist'
    END AS duplicate_check
FROM [wb.funding];

SELECT 
    CASE 
        WHEN COUNT(*) = COUNT(DISTINCT 
            CAST(Loan_Number AS VARCHAR(100)) + '|' + 
            CAST(Project_ID AS VARCHAR(100)) + '|' + 
            CAST(Original_Principal_Amount_US AS VARCHAR(100)) + '|' + 
            CAST(CONVERT(VARCHAR, Agreement_Signing_Date, 120) AS VARCHAR(100))
        ) THEN 'No duplicates found'
        ELSE 'Duplicates exist'
    END AS duplicate_check
FROM [wb.funding];


SELECT 
    COUNT(*) AS duplicate_groups
FROM (
    SELECT 
        Loan_Number, Project_ID, Original_Principal_Amount_US, Agreement_Signing_Date
    FROM [wb.funding]
    GROUP BY Loan_Number, Project_ID, Original_Principal_Amount_US, Agreement_Signing_Date
    HAVING COUNT(*) > 1
) AS duplicates;



SELECT DISTINCT COUNT(*) Loan_Number
FROM [dbo].[wb.funding]



