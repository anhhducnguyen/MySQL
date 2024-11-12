SELECT `name` AS `Họ và tên`, `address` AS  `Địa chỉ` 
FROM `host`;

SELECT MAX(birthday) AS `Năm sinh lớn nhất nhất`
FROM `architect`;

SELECT MIN(birthday) AS `Năm sinh bé nhất`
FROM `architect`;

SELECT COUNT(address)
FROM `architect`;

SELECT SUM(cost) AS `Tổng doanh thu`
FROM `sql_qlct`.`building`;

SELECT AVG(cost) AS `Giá trị trung bình doanh thu`
FROM `sql_qlct`.`building`;

SELECT `place` AS `Thành phố`, COUNT(id) AS `Số lượng kiến trúc sư`
FROM `sql_qlct`.`architect`
GROUP BY place
HAVING COUNT(id) >= 2;

SELECT `name`, `cost`
FROM `sql_qlct`.`building`
WHERE cost = 
(
	SELECT MAX(cost)
	FROM `sql_qlct`.`building`
);

SELECT * FROM sql_qlct.building
WHERE cost > ALL
(
	SELECT cost FROM sql_qlct.building
	WHERE city = 'can tho'
);

-- Lấy ra thông tin của toàn bộ công nhân có tuổi lớn hơn toàn bộ kiến trúc sư ở trong công ty
SELECT * FROM worker
where birthday < ALL
(
	SELECT birthday FROM architect
);

-- SELECT MIN(birthday) FROM architect;

-- SELECT MIN(birthday) FROM worker

--  Lấy ra toàn bộ thông tin của những building được thiết kế bởi các kiến trúc sư trong công ty
SELECT * FROM building
WHERE id NOT IN 
(
	SELECT DISTINCT building_id
	FROM design
);

SELECT b.`id`, b.`name`, h.`name`
FROM `building` b
INNER JOIN `host` h ON b.host_id = h.id;

SELECT b.`id`, b.`name`, h.`name`
FROM `building` b
LEFT JOIN `host` h ON b.host_id = h.id;

SELECT b.`id`, b.`name`, h.`name`
FROM `building` b 
RIGHT JOIN `host` h ON b.host_id = h.id;

SELECT b.`id`, b.`name`, h.`name`
FROM `building` b , `host` h
where b.host_id = h.id;

