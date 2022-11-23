CREATE SCHEMA shipmentcompany
use shipmentcompany
    CREATE TABLE customer(
        customer_id INT(5),
        customer_name char(30),
        city char(30),
        PRIMARY KEY (customer_id)
    );
    CREATE TABLE `order`(
	order_id INT(5),
    order_date DATETIME,
    customer_id INT(5),
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
    );
    CREATE TABLE item(
    	item_id INT(5),
        unit_price INT(12),
        PRIMARY key (item_id)
    );
    create table order_item(
    	order_id INT(5),
        item_id INT(5),
        quantity INT(5),
        PRIMARY KEY (order_id,item_id),
        FOREIGN KEY(order_id) REFERENCES `order`(order_id),
        FOREIGN KEY(item_id) REFERENCES `item`(item_id)
    );
    CREATE TABLE warehouse(
    	warehouse_id INT(5),
        warehouse_city char(30),
        PRIMARY KEY(warehouse_id)
    );
    CREATE TABLE shipment(
    	order_id INT(5),
        warehouse_id INT(5),
        ship_date DATETIME,
        PRIMARY KEY(order_id,warehouse_id),
        FOREIGN KEY (order_id) REFERENCES `order`(order_id),
        FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id)
    );