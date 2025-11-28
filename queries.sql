-- Total de vendas por mês
SELECT date_trunc('month', o.order_date) AS month,
SUM(oi.quantity * oi.unit_price) AS total_sales
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY 1
ORDER BY 1;


-- Top 5 produtos por receita
SELECT p.product_id, p.name, SUM(oi.quantity * oi.unit_price) AS revenue
FROM sales.order_items oi
JOIN sales.products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY revenue DESC
LIMIT 5;


-- Ticket médio por pedido
SELECT AVG(order_total) FROM (
SELECT o.order_id, SUM(oi.quantity * oi.unit_price) AS order_total
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id
) t;


-- Clientes recorrentes (mais de 1 pedido)
SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) as orders_count
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) > 1;
