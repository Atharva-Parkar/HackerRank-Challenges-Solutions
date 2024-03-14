SELECT DISTINCT c.company_code, c.founder,
       (SELECT COUNT(DISTINCT lm.lead_manager_code) FROM lead_manager lm 
        WHERE lm.company_code = c.company_code) AS num_lead_managers,
       (SELECT COUNT(DISTINCT sm.senior_manager_code) FROM senior_manager sm
        JOIN lead_manager lm ON sm.lead_manager_code = lm.lead_manager_code
        WHERE lm.company_code = c.company_code) AS num_senior_managers,
       (SELECT COUNT(DISTINCT m.manager_code) FROM manager m
        JOIN senior_manager sm ON sm.senior_manager_code = m.senior_manager_code
        JOIN lead_manager lm ON sm.lead_manager_code = lm.lead_manager_code
        WHERE lm.company_code = c.company_code) AS num_managers,
       (SELECT COUNT(DISTINCT em.employee_code) FROM employee em
        JOIN manager m ON m.manager_code = em.manager_code
        JOIN lead_manager lm ON em.lead_manager_code = lm.lead_manager_code
        WHERE lm.company_code = c.company_code) AS num_employees
FROM company c
ORDER BY c.company_code;
