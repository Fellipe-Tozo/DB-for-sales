#### `schema.sql`
```sql
-- schema.sql (Postgres)
CREATE SCHEMA IF NOT EXISTS sales;


CREATE TABLE sales.customers (
customer_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(120) UNIQUE,
phone VARCHAR(30),
created_at TIMESTAMP DEFAULT now()
);


CREATE TABLE sales.categories (
  category_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);


CREATE TABLE sales.products (
product_id SERIAL PRIMARY KEY,
name VARCHAR(150) NOT NULL,
category_id INT REFERENCES sales.categories(category_id),
price NUMERIC(10,2) NOT NULL CHECK (price >= 0),
sku VARCHAR(50) UNIQUE
);


CREATE TABLE sales.stores (
store_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
city VARCHAR(100)
);


CREATE TABLE sales.employees (
employee_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
store_id INT REFERENCES sales.stores(store_id)
);


CREATE TABLE sales.orders (
order_id SERIAL PRIMARY KEY,
order_date TIMESTAMP NOT NULL DEFAULT now(),
customer_id INT REFERENCES sales.customers(customer_id),
store_id INT REFERENCES sales.stores(store_id),
employee_id INT REFERENCES sales.employees(employee_id),
status VARCHAR(30) DEFAULT 'completed'
);


CREATE TABLE sales.order_items (
order_item_id SERIAL PRIMARY KEY,
order_id INT REFERENCES sales.orders(order_id) ON DELETE CASCADE,
product_id INT REFERENCES sales.products(product_id),
quantity INT NOT NULL CHECK (quantity > 0),
unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0)
);


CREATE TABLE sales.payments (
payment_id SERIAL PRIMARY KEY,
order_id INT REFERENCES sales.orders(order_id) ON DELETE CASCADE,
paid_amount NUMERIC(10,2) NOT NULL CHECK (paid_amount >= 0),
paid_at TIMESTAMP DEFAULT now(),
method VARCHAR(50)
);


-- Indexes
CREATE INDEX idx_orders_order_date ON sales.orders(order_date);
CREATE INDEX idx_order_items_product ON sales.order_items(product_id);
