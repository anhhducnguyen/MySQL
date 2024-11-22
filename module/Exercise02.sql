ALTER TABLE products
ADD FOREIGN KEY (categoryId) REFERENCES categories(categoryId);

ALTER TABLE products
ADD FOREIGN KEY (storeId) REFERENCES stores(storeId);

ALTER TABLE images
ADD FOREIGN KEY (productId) REFERENCES products(productId);

ALTER TABLE reviews
ADD FOREIGN KEY (userId) REFERENCES users(userId);

ALTER TABLE reviews
ADD FOREIGN KEY (productId) REFERENCES products(productId);

ALTER TABLE carts
ADD FOREIGN KEY (productId) REFERENCES products(productId);

ALTER TABLE carts
ADD FOREIGN KEY (userId) REFERENCES users(userId);

ALTER TABLE order_details
ADD FOREIGN KEY (productId) REFERENCES products(productId);

ALTER TABLE order_details
ADD FOREIGN KEY (orderId) REFERENCES orders(orderId);

ALTER TABLE stores
ADD FOREIGN KEY (userId) REFERENCES users(userId);

ALTER TABLE orders
ADD FOREIGN KEY (userId) REFERENCES users(userId);

ALTER TABLE orders
ADD FOREIGN KEY (storeId) REFERENCES stores(storeId);