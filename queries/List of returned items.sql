SELECT 
    pro.id AS product_id,
    pro.name AS product_name,
    sup.name AS supplier_name,
    SUM(ri.quantity) AS total_quantity_returned
FROM 
    main_schema.returned_items ri
JOIN 
    main_schema.products pro ON ri.product_id = pro.id
JOIN 
    main_schema.suppliers sup ON pro.supplier = sup.id
GROUP BY 
    pro.id, pro.name, sup.name
ORDER BY 
    total_quantity_returned DESC;