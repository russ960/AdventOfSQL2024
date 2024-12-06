DECLARE @average_gift_price DECIMAL(10,2)

SELECT @average_gift_price = AVG(price) FROM gifts

SELECT c.name, g.name, g.price FROM children c INNER JOIN gifts g ON c.child_id = g.child_id
WHERE g.price > @average_gift_price
ORDER BY g.price ASC
