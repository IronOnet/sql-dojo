CREATE DATABASE cryptodb;

USE cryptodb;

CREATE TABLE orders
(
  oder_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  product_id SMALLINT UNSIGNED,
  price FLOAT,
  quantity FLOAT,
  order_side Enum('BUY', 'SELL'),
  member_id SMALLINT UNSIGNED,
  created_at DATE,
  updated_at DATE,
  CONSTRAINT pk_orders PRIMARY KEY (order_id),
  CONSTRAINT fk_products PRIMARY KEY REFERENCES products(product_id),
  CONSTRAINT fk_member FOREIGN KEY REFERENCES members(member_id),
);

CREATE TABLE products(
  product_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(20),
  product_short_name VARCHAR(10),
  description TEXT,
  created_at DATE,
  updated_at DATE,
  CONSTRAINT pk_products PRIMARY KEY (product_id)
);

CREATE TABLE members(
  member_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  email VARCHAR(20), 
  password_hash VARCHAR(30),
  created_at DATE,
  updated_at DATE,
  CONSTRAINT pk_members PRIMARY KEY (member_id),
);

CREATE TABLE trades(
  trade_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  product_id SMALLINT UNSIGNED,
  order_sell SMALLINT UNSIGNED,
  order_buy SMALLINT UNSIGNED,
  created_at DATE,
  updated_at DATE,
  PRIMARY KEY (trade_id),
  FOREIGN KEY product_id REFERENCES products(product_id)
  FOREIGN KEY order_sell REFERENCES orders(order_id),
  FOREIGN KEY order_buy REFERENCES orders(order_id),
)
