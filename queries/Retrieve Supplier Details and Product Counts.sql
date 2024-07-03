SELECT 
    sup.id AS supplier_id,
    sup.name AS supplier_name,
    COUNT(pro.id) AS number_of_products
FROM 
    main_schema.suppliers sup
LEFT JOIN 
    main_schema.products pro ON sup.id = pro.supplier
GROUP BY 
    sup.id, sup.name
ORDER BY 
    number_of_products DESC;
