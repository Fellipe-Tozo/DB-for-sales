-- seed_data.sql
INSERT INTO sales.customers (first_name, last_name, email)
VALUES ('João','Silva','joao.silva@mail.com'),
('Maria','Oliveira','maria.o@mail.com'),
('Carlos','Pereira','carlos.p@mail.com');


INSERT INTO sales.categories (name) VALUES ('Eletrônicos'), ('Casa'), ('Brinquedos');


INSERT INTO sales.products (name, category_id, price, sku) VALUES
('Smartphone X', 1, 1499.90, 'SPX-001'),
('Fone Bluetooth', 1, 199.90, 'FONE-002'),
('Caneca Cerâmica', 2, 29.90, 'CAN-001');


INSERT INTO sales.stores (name, city) VALUES ('Loja Centro','São Paulo'), ('E-commerce','Nacional');


INSERT INTO sales.employees (first_name,last_name,store_id) VALUES ('Paulo','Costa',1), ('Ana','Souza',2);


-- Pedidos
INSERT INTO sales.orders (order_date, customer_id, store_id, employee_id)
VALUES ('2025-11-01',1,1,1), ('2025-11-02',2,2,2);


-- Itens
INSERT INTO sales.order_items (order_id, product_id, quantity, unit_price)
VALUES (1,1,1,1499.90), (1,2,2,199.90), (2,3,4,29.90);


INSERT INTO sales.payments (order_id, paid_amount, paid_at, method)
VALUES (1, 1899.70, '2025-11-01', 'cartao'), (2, 119.60, '2025-11-02', 'boleto');
