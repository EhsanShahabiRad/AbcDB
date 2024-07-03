WITH sales_from_last_month AS (
    SELECT 
        oi.product_id,
        SUM(oi.quantity) AS total_quantity_sold,
        SUM(oi.quantity * oi.price) AS total_amount_sold
    FROM 
        main_schema.order_items oi
    JOIN 
        main_schema.orders ord ON oi.order_id = ord.id
    WHERE 
        ord.date >= (CURRENT_TIMESTAMP - interval '1 month') 
        AND ord.date < CURRENT_TIMESTAMP
    GROUP BY 
        oi.product_id
)
SELECT 
    pro.id AS product_id,
    pro.name AS product_name,
    sup.name AS supplier_name,
    slm.total_quantity_sold,
    slm.total_amount_sold
FROM 
    sales_from_last_month slm
JOIN 
    main_schema.products pro ON slm.product_id = pro.id
JOIN 
    main_schema.suppliers sup ON pro.supplier = sup.id
JOIN 
    main_schema.product_categories pc ON pro.id = pc.product_id
JOIN 
    main_schema.categories cat ON pc.category_id = cat.id
WHERE 
    cat.name = 'Fashion'
ORDER BY 
    slm.total_quantity_sold DESC;
