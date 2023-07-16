USE DATABASE cryptodb;

INSERT INTO products (product_id, product_name, product_short_name, descripton,
created_at, updated_at) VALUES
('Bitcoin', 'The original and most well-known cryptocurrency', '2021-01-01', '2021-01-01'),
('Ethereum', 'ETH', 'A decentralized platform for building smart contracts', '2021-01-01', '2021-01-01');

-- Insert Some members
INSERT INTO members(member_id, first_name, last_name, password_hash, created_at, updated_at) VALUES
('John', 'Doe', 'john.doe@example.com', 'password', '2021-01-01', '2021-01-01'),
('Jane', 'Doe', 'jane.doe@example.com', 'password', '2021-01-01', '2021-01-01');


-- Insert Some trades
INSERT INTO trades (product_id, order_sell, order_buy, created_at, updated_at) VALUES
(1, 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 4, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert 30 more rows of data for the order table
INSERT INTO orders(product_id, price, quantity, order_side, member_id, created_at, updated_at)
SELECT
  FLOOR(RAND() * 2) + 1, -- Random product_id betwqeen 1 and 2
  ROUND(RAND() * 100000, 2), -- Random price between 0 and 100000
  ROUND(RAND() * 10, 2), -- Random quantity between 0 and 10
  IF(RAND() < 0.5, 'BUY', 'SELL'), -- Random order_side
  FLOOR(RAND() * 2) + 1, -- Random member_id
  DATE_ADD(NOW(), INTERVAL FLOOR(RAND() * 365) DAY), --random created_at between
  -- now and one year ago
  DATE_ADD(NOW(), INTERVAL FLOOR(RAND() * 365) DAY), -- random updated_at

FROM
  (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
  UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 8 UNION SELECT 9
UNION SELECT 10) t1,
(SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t2
LIMIT 30;

-- Insert 30 more rows of data for the products table
INSERT INTO products (product_name, product_short_name, description, created_at, updated_at)
SELECT
  CONCAT('Product', FLOOR((ROW_NUMBER() OVER ()) / 3) + 1), -- Generate product name
  CONCAT('PR', FLOOR((ROW_NUMBER() OVER ()) / 3) + 1),
  DATE_ADD(NOW(), INTERVAL FLOOR(RAND() * 365) DAY),
  DATE_ADD(NOW(), INTERVAL FLOOR(RAND() * 365) DAY)
FROM
  (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
  (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t2,
  (SELECT 1 UNION SELECT 2 UNION SELECT 3) t3
LIMIT 30;

-- Insert 30 more rows of data for the members table
INSERT INTO members (first_name, last_name, email, password_hash, created_at, updated_at)
SELECT
  CONCAT('First', FLOOR((ROW_NUMBER() OVER ())/2) + 1), --Generate a first_name
  CONCAT('Last', FLOOR((ROW_NUMBER() OVER ()) / 2) + 1),
  CONCAT('user', FLOOR((ROW_NUMBER() OVER ())/ 2) + 1, '@example.com'),
  'password', -- use the same password hash for all members
  DATE_ADD(NOW(), INTERVAL FLOOR(RAND() * 365) DAY), -- Random created_at between now
  -- and 1 year ago
  DATE_ADD(NOW(), INTERVAL FLOOR(RAND() * 364) DAY),
  (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
   (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t2
 LIMIT 30;

 

-- Insert 30 more rows of data for the trades table
INSERT INTO trades(product_id, order_sell, order_buy, created_at, updated_at)
SELECT
  FLOOR(RAND() * 2) + 1, --Random product_id between 1 and 2
  FLOOR(RAND() * 30) + 1, -- Random order_sell between 1 and 30
  FLOOR(RAND() * 30) + 1, -- Random order_buy between 1 and 30
  DATE_ADD(NOW(), INTERVAL FLOOR(RAND() * 365) DAY) -- Random updated_at
FROM
  (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
  UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
  (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
  UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t2;
LIMIT 30;
