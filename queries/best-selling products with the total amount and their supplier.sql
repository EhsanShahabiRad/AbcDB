SELECT 
    pro.id AS product_id,
    pro.name AS product_name,
    sup.name AS supplier_name,
    COUNT(oi.order_id) AS sales_count,
    SUM(oi.quantity * oi.price) AS total_amount,
    COALESCE(SUM(ri.quantity), 0) AS total_returns
FROM 
    main_schema.products pro
JOIN 
    main_schema.order_items oi ON pro.id = oi.product_id
JOIN 
    main_schema.suppliers sup ON pro.supplier = sup.id
LEFT JOIN 
    main_schema.returned_items ri ON pro.id = ri.product_id
GROUP BY 
    pro.id, pro.name, sup.name
ORDER BY 
    total_amount DESC
LIMIT 10;
