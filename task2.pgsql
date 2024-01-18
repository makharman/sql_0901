-- Создать фун-ию которая показывает заказы за определенный период


CREATE FUNCTION orders_period(order_date DATE, shipped_date DATE) 
RETURNS TABLE (
    order_id SMALLINT,
    order_date DATE,
    customer_id VARCHAR(5),
    company_name VARCHAR(40),
    product_name VARCHAR(40),
    quantity SMALLINT
) AS $$

    SELECT 
        orders.order_id, 
        orders.order_date, 
        orders.customer_id,
        customers.company_name,
        products.product_name,
        order_details.quantity
    FROM orders
    JOIN order_details ON orders.order_id = order_details.order_id
    JOIN customers ON orders.customer_id = customers.customer_id
    JOIN products ON order_details.product_id = products.product_id
    
    WHERE orders.order_date BETWEEN order_date AND shipped_date;
$$ LANGUAGE SQL;


SELECT * FROM orders_period('2022-01-01', '2022-12-31');
