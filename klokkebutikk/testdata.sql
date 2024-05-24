INSERT INTO `produkt`(`id`, `merke`, `storrelse_mm`, `farge`, `materiale`, `bilde`) VALUES
(1, 'Rolex', 40, 'sølv', 'rustfritt stål', 'rolex_silver.jpg'),
(2, 'Omega', 42, 'svart', 'rustfritt stål', 'omega_black.jpg'),
(3, 'Tag Heuer', 44, 'blå', 'rustfritt stål', 'tagheuer_white.jpg'),
(4, 'Breitling', 41, 'hvit', 'gull', 'breitling_white.jpg'),
(5, 'Seiko', 39, 'grønn', 'titan', 'seiko_green.jpg'),
(6, 'Casio', 38, 'svart', 'plastikk', 'casio_black.jpg'),
(7, 'Citizen', 43, 'sølv', 'rustfritt stål', 'citizen_silver.jpg'),
(8, 'Tissot', 40, 'blå', 'rustfritt stål', 'tissot_blue.jpg'),
(9, 'Hamilton', 42, 'brun', 'skinn', 'hamilton_brown.jpg'),
(10, 'Longines', 41, 'svart', 'keramikk', 'longines_black.jpg');

Ordre tabell kode:
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES produkt(id)
);
legge 