SELECT 
    cus.id AS customer_id,
    cus.full_name AS customer_name,
    COALESCE(SUM(oi.quantity), 0) AS total_items_bought,
    COALESCE(ri.total_items_returned, 0) AS total_items_returned,
    COALESCE(SUM(oi.quantity * oi.price), 0) AS total_worth_of_purchases
FROM 
    main_schema.customers cus
LEFT JOIN 
    main_schema.orders ord ON cus.id = ord.customer_id
LEFT JOIN 
    main_schema.order_items oi ON ord.id = oi.order_id
LEFT JOIN 
    (
        SELECT
            ord.customer_id,
            SUM(ri.quantity) AS total_items_returned
        FROM 
            main_schema.orders ord
        JOIN 
            main_schema.returned_items ri ON ord.id = ri.order_id
        GROUP BY 
            ord.customer_id
    ) ri ON cus.id = ri.customer_id
GROUP BY 
    cus.id, cus.full_name, ri.total_items_returned
ORDER BY 
    total_worth_of_purchases DESC;