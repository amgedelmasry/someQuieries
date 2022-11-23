select customer_name from customer where customer_name like 'Ma%';

SELECT order_id, sum(quantity),sum(quantity*unit_price)
FROM (order_item NATURAL JOIN item)
GROUP BY order_id;

SELECT order_id
from(shipment NATURAL join warehouse)
where warehouse_city='Arica';

select sum(quantity*unit_price)
from(shipment NATURAL JOIN `order` NATURAL JOIN order_item NATURAL join item)
WHERE warehouse_id=8;

select warehouse_id,warehouse_city,count(order_id)
from (warehouse natural LEFT JOIN shipment )
group by warehouse_id;

select customer_name,count(order_id)
from (customer NATURAL LEFT JOIN `order`)
group BY(customer_id);

select * 
from item AS I 
where NOT EXISTS(
	SELECT * from (`order` NATURAL JOIN order_item AS O) 
    WHERE I.item_id=O.item_id
);
