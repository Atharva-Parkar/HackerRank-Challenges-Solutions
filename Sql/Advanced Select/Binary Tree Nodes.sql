SELECT N, 
    CASE 
        WHEN P IS NULL THEN 'Root'
        WHEN N IN (SELECT P FROM bst WHERE P IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END as nodetype
FROM bst
ORDER BY N;