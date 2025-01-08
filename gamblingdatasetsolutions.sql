WITH RankedStudents AS (
    SELECT 
        school_name,
        Student_Name,
        GPA,
        RANK() OVER (PARTITION BY school_name ORDER BY GPA DESC) AS `Rank`
    FROM 
        studentschoolgamblingdataset
)
SELECT 
    school_name,
    Student_Name,
    GPA
FROM 
    RankedStudents
WHERE 
    `Rank` <= 3
ORDER BY 
    school_name, `Rank`;