SELECT *
FROM customer_orders
WHERE purchase_amount < 100 
         OR order_date < '2022-08-25' 
         AND customer_id > '2001';