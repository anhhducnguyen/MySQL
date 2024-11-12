
-- Exercise 04
-- Hiển thị thù lao trung bình của từng kiến trúc sư
SELECT 
	a.name AS `Tên kiến trúc sư`, 
	AVG(d.benefit) AS `Thù lao trung bình`
FROM sql_qlct.architect a
INNER JOIN `sql_qlct`.`design` d ON a.id = d.architect_id
GROUP BY a.`name`;

-- Hiển thị chi phí đầu tư cho các công trình ở mỗi thành phố 

SELECT 
	b.`city` AS `Thành phố` ,
    SUM(b.cost) AS `Chi phí đầu tư` 
FROM sql_qlct.building b
GROUP BY b.`city`;

-- Tìm các công trình có chi phí trả cho kiến trúc sư lớn hơn 50

SELECT b.`name` AS `Tên công trình`, SUM(d.benefit) AS `Chi phí cho kiến trúc sư`
FROM sql_qlct.building b
INNER JOIN sql_qlct.design d ON b.id = d.building_id
GROUP BY b.name
HAVING SUM(d.benefit) > 50;

-- Tìm các thành phố có ít nhất một kiến trúc sư tốt nghiệp

SELECT DISTINCT b.city AS `Thành phố`
FROM sql_qlct.building b
INNER JOIN sql_qlct.design d ON b.id = d.building_id
INNER JOIN sql_qlct.architect a ON d.architect_id = a.id
WHERE b.city = a.place;




