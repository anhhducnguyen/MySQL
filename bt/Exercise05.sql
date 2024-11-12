-- Exercise 05
-- Hiển thị tên công trình, tên chủ nhân và tên chủ thầu của công trình đó

SELECT 
	b.`name` AS `Tên công trình`, 
    h.`name` AS `Tên chủ nhân`, 
    c.`name` AS `Tên chủ thầu`
FROM sql_qlct.building b
INNER JOIN `sql_qlct`.`contractor` c ON c.id = b.contractor_id
INNER JOIN `sql_qlct`.`host` h ON h.id = b.host_id;

-- Hiển thị tên công trình (building), tên kiến trúc sư (architect) và thù lao của kiến trúc sư ở mỗi công trình (design)
SELECT 
	b.`name` AS `Tên công trình`, 
    a.`name` AS `Tên kiến trúc sư`,
    SUM(d.benefit) AS `Thù lao của kiến trúc sư`
FROM sql_qlct.building b
INNER JOIN `sql_qlct`.`design` d ON  d.building_id = b.id
INNER JOIN `sql_qlct`.`architect` a ON a.id = d.architect_id
GROUP BY a.`name`, b.`name`;

-- Hãy cho biết tên và địa chỉ công trình (building) do chủ thầu Công ty xây dựng số 6 thi công (contractor)

SELECT 
	b.`name` AS `Tên công trình`
FROM sql_qlct.building b
INNER JOIN `sql_qlct`.`contractor` c ON c.id = b.contractor_id
WHERE c.`name` = "Công ty xây dựng số 6";

-- Tìm tên và địa chỉ liên lạc của các chủ thầu (contractor) thi công công trình ở Cần Thơ (building)
 -- do kiến trúc sư Lê Kim Dung thiết kế (architect, design)
 
 SELECT 
	c.`name` AS `Tên chủ thầu`,
    c.phone AS `Địa chỉ liên lạc`,
    b.city AS `Thành phố`
FROM sql_qlct.building b
INNER JOIN `sql_qlct`.`design` d ON  d.building_id = b.id
INNER JOIN `sql_qlct`.`contractor` c ON c.id = b.contractor_id
INNER JOIN `sql_qlct`.`architect` a ON a.id = d.architect_id
WHERE b.city = "can tho" AND a.`name` = "le kim dung";
 
-- Hãy cho biết nơi tốt nghiệp của các kiến trúc sư (architect) đã thiết kế (design) công trình Khách Sạn Quốc Tế ở Cần Thơ (building)

SELECT DISTINCT
	a.place AS `Nơi tốt nghiệp của các kiến trúc sư`
FROM sql_qlct.building b
INNER JOIN `sql_qlct`.`design` d ON  d.building_id = b.id
INNER JOIN `sql_qlct`.`architect` a ON a.id = d.architect_id
WHERE b.`name` = "Khách Sạn Quốc Tế" AND b.city = "can tho";

-- Cho biết họ tên, năm sinh, năm vào nghề của các công nhân có chuyên môn hàn hoặc điện (worker) 
-- đã tham gia các công trình (work) mà chủ thầu Lê Văn Sơn (contractor) đã trúng thầu (building)

SELECT 
	wr.`name` AS `Họ tên`,
    wr.birthday AS `Năm sinh`,
    wr.`year` AS `Năm vào nghề`
FROM sql_qlct.worker wr
INNER JOIN `sql_qlct`.`work` w ON w.worker_id = wr.id
INNER JOIN `sql_qlct`.`building` b ON b.id = w.building_id
INNER JOIN `sql_qlct`.`contractor` c ON c.id = b.contractor_id
WHERE wr.skill IN ('han', 'dien') AND c.`name` = 'le van son';

-- Những công nhân nào (worker) đã bắt đầu tham gia công trình Khách sạn Quốc Tế ở Cần Thơ (building) 
-- trong giai đoạn từ ngày 15/12/1994 đến 31/12/1994 (work) số ngày tương ứng là bao nhiêu

SELECT 
	wr.`name` AS `Họ tên`,
    DATEDIFF('1994-12-31', GREATEST(w.date, '1994-12-15')) + 1 AS `Số ngày`
FROM sql_qlct.worker wr
INNER JOIN `sql_qlct`.`work` w ON w.worker_id = wr.id
INNER JOIN `sql_qlct`.`building` b ON b.id = w.building_id
WHERE 
	b.`name` = 'Khách sạn Quốc Tế' 
    AND b.city = 'can tho'
    AND w.date BETWEEN '1994-12-15' AND '1994-12-31';

-- Cho biết họ tên và năm sinh của các kiến trúc sư đã tốt nghiệp ở TP Hồ Chí Minh (architect) 
-- và đã thiết kế ít nhất một công trình (design) có kinh phí đầu tư trên 400 triệu đồng (building)

SELECT DISTINCT 
	a.`name` AS `Họ tên`,
	a.birthday AS `Năm sinh`
FROM sql_qlct.architect a
INNER JOIN `sql_qlct`.`design` d ON  d.architect_id = a.id
INNER JOIN `sql_qlct`.`building` b ON b.id = d.building_id
WHERE a.place = "tp hcm" AND b.cost > 400;


-- Cho biết tên công trình có kinh phí cao nhất

SELECT `name`, `cost`
FROM `sql_qlct`.`building`
WHERE cost = 
(
	SELECT MAX(cost)
	FROM `sql_qlct`.`building`
);


-- Cho biết tên các kiến trúc sư (architect) vừa thiết kế các công trình (design) 
-- do Phòng dịch vụ sở xây dựng (contractor) thi công vừa thiết kế các công trình do chủ thầu Lê Văn Sơn thi công

SELECT 
    a.`name` AS `Họ tên`
FROM `sql_qlct`.`building` b
INNER JOIN `sql_qlct`.`design` d ON d.building_id = b.id
INNER JOIN `sql_qlct`.`contractor` c ON c.id = b.contractor_id
INNER JOIN `sql_qlct`.`architect` a ON a.id = d.architect_id
WHERE c.`name` IN ("le van son", "phong dich vu so xd")
GROUP BY a.`name`
HAVING COUNT(DISTINCT c.`name`) = 2;


-- Cho biết họ tên các công nhân (worker) có tham gia (work) các công trình ở Cần Thơ (building) 
-- nhưng không có tham gia công trình ở Vĩnh Long

SELECT 
    wr.`name` AS `Họ tên`
FROM `sql_qlct`.`worker` wr
INNER JOIN `sql_qlct`.`work` w ON w.worker_id = wr.id
INNER JOIN `sql_qlct`.`building` b ON b.id = w.building_id
WHERE b.`city` = 'can tho'
AND wr.id NOT IN (
    SELECT w2.worker_id
    FROM `sql_qlct`.`work` w2
    INNER JOIN `sql_qlct`.`building` b2 ON b2.id = w2.building_id
    WHERE b2.`city` = 'vinh long'
)
GROUP BY wr.`name`;


-- Cho biết tên của các chủ thầu đã thi công các công trình có kinh phí lớn hơn tất cả các công trình 
-- do chủ thầu phòng Dịch vụ Sở xây dựng thi công

SELECT 
    c.`name` AS `Tên chủ thầu`
FROM `sql_qlct`.`building` b
INNER JOIN `sql_qlct`.`contractor` c ON c.id = b.contractor_id
WHERE b.`cost` > ALL
(
    SELECT b2.`cost`
    FROM `sql_qlct`.`building` b2
    INNER JOIN `sql_qlct`.`contractor` c2 ON b2.contractor_id = c2.id
    WHERE c2.`name` = "phong dich vu so xd"
)
GROUP BY c.`name`;


-- Cho biết họ tên các kiến trúc sư có thù lao thiết kế một công trình nào đó dưới giá trị trung bình thù lao thiết kế cho một công trình
SELECT 
    a.`name` AS `Họ tên`
FROM `sql_qlct`.`architect` a
INNER JOIN `sql_qlct`.`design` d ON a.id = d.architect_id
WHERE d.`benefit` < (
    SELECT AVG(d2.`benefit`)
    FROM `sql_qlct`.`design` d2
)
GROUP BY a.`name`;


-- Tìm tên và địa chỉ những chủ thầu đã trúng thầu công trình có kinh phí thấp nhất

SELECT 
    `host`.`name` AS `Tên chủ thầu`, 
    `host`.`address` AS `Địa chỉ`, 
    b.`cost` AS `Kinh phí`
FROM `sql_qlct`.`building` b
INNER JOIN `sql_qlct`.`host` ON `host`.`id` = b.`host_id`
WHERE b.`cost` = (
    SELECT MIN(b2.`cost`)
    FROM `sql_qlct`.`building` b2
);

-- Tìm họ tên và chuyên môn của các công nhân (worker) tham gia (work) 
-- các công trình do kiến trúc sư Le Thanh Tung thiet ke (architect) (design)

SELECT 
    wr.`name` AS `Họ tên`,
    wr.`skill` AS `Chuyên môn`
FROM `sql_qlct`.`worker` wr
INNER JOIN `sql_qlct`.`work` w ON w.`worker_id` = wr.`id`
INNER JOIN `sql_qlct`.`building` b ON b.`id` = w.`building_id`
INNER JOIN `sql_qlct`.`design` d ON d.`building_id` = b.`id`
INNER JOIN `sql_qlct`.`architect` a ON a.`id` = d.`architect_id`
WHERE a.`name` = "le thanh tung";


-- Tìm các cặp tên của chủ thầu có trúng thầu các công trình tại cùng một thành phố

SELECT 
    c1.`name` AS `Chủ thầu 1`, 
    c2.`name` AS `Chủ thầu 2`, 
    b1.`city` AS `Thành phố`
FROM `sql_qlct`.`building` b1
INNER JOIN `sql_qlct`.`contractor` c1 ON c1.`id` = b1.`contractor_id`
INNER JOIN `sql_qlct`.`building` b2 ON b1.`city` = b2.`city` AND b1.`id` < b2.`id`
INNER JOIN `sql_qlct`.`contractor` c2 ON c2.`id` = b2.`contractor_id`
WHERE c1.`id` != c2.`id`
GROUP BY c1.`name`, c2.`name`, b1.`city`;


-- Tìm tổng kinh phí của tất cả các công trình theo từng chủ thầu

SELECT 
    c.`name` AS `Tên chủ thầu`,
    SUM(b.`cost`) AS `Tổng kinh phí`
FROM `sql_qlct`.`building` b
INNER JOIN `sql_qlct`.`contractor` c ON c.`id` = b.`contractor_id`
GROUP BY c.`name`;


-- Cho biết họ tên các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu

SELECT 
    a.`name` AS `Tên kiến trúc sư`,
    SUM(d.benefit) AS `Thù lao của kiến trúc sư`
FROM sql_qlct.building b
INNER JOIN `sql_qlct`.`design` d ON  d.building_id = b.id
INNER JOIN `sql_qlct`.`architect` a ON a.id = d.architect_id
GROUP BY a.`name`
HAVING SUM(d.benefit) > 25;


-- Cho biết số lượng các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu

SELECT 
	a.`name` `Tên kiến trúc sư`,
    COUNT(a.id) AS `Số lượng công trình lớn hơn 25 triệu`
FROM sql_qlct.building b
INNER JOIN `sql_qlct`.`design` d ON  d.building_id = b.id
INNER JOIN `sql_qlct`.`architect` a ON a.id = d.architect_id
GROUP BY a.`name`
HAVING SUM(d.benefit) > 25;



-- Tìm tổng số công nhân đã thanm gia ở mỗi công trình

SELECT
    b.`name` AS `Tên công trình`,
    COUNT(wr.`name`) AS `Tổng số công nhân đã tham gia`
FROM sql_qlct.worker wr
INNER JOIN `sql_qlct`.`work` w ON wr.id = w.worker_id
INNER JOIN `sql_qlct`.`building` b ON b.id = w.building_id
GROUP BY b.`name`;


-- Tìm tên và địa chỉ công trình có tổng số công nhân tham gia nhiều nhất

SELECT 
	b.`name` AS `Tên công trình`,
    b.`address` AS `Địa chỉ`,
	COUNT(wr.`name`) AS `Tổng số công nhân đã tham gia`
FROM sql_qlct.worker wr
INNER JOIN sql_qlct.`work` w ON w.worker_id = wr.id
INNER JOIN sql_qlct.`building` b ON b.id = w.building_id
GROUP BY b.`name`, b.`address`
ORDER BY `Tổng số công nhân đã tham gia` DESC
LIMIT 1;


-- Cho biêt tên các thành phố và kinh phí trung bình cho mỗi công trình của từng thành phố tương ứng

SELECT 
	b.`city` AS `Tên các thành phố`,
	AVG(b.cost) AS `Kinh phí trung bình`
FROM sql_qlct.building b
GROUP BY b.city;

-- Cho biết họ tên các công nhân có tổng số ngày tham gia vào các công trình lớn hơn tổng số ngày tham gia của công nhân Nguyễn Hồng Vân

SELECT 
    wr.`name` AS `Tên công nhân`,
    SUM(w.`date`) AS `Tổng số ngày tham gia`
FROM sql_qlct.worker wr
INNER JOIN `sql_qlct`.`work` w ON wr.id = w.worker_id
GROUP BY wr.`name`
HAVING SUM(w.`date`) > (
    SELECT SUM(w2.`date`)
    FROM sql_qlct.worker wr2
    INNER JOIN `sql_qlct`.`work` w2 ON wr2.id = w2.worker_id
    WHERE wr2.`name` = 'Nguyễn Hồng Vân'
);


-- Cho biết tổng số công trình mà mỗi chủ thầu đã thi công tại mỗi thành phố

SELECT 
    b.`city` AS `Tên thành phố`,
    c.`name` AS `Tên chủ thầu`,
    COUNT(b.`name`) AS `Tổng số công trình`
FROM sql_qlct.building b
INNER JOIN `sql_qlct`.`contractor` c ON c.id = b.contractor_id
GROUP BY b.`city`, c.`name`;


-- Cho biết họ tên công nhân có tham gia ở tất cả các công trình

SELECT 
    wr.`name` AS `Tên công nhân`
FROM sql_qlct.worker wr
INNER JOIN `sql_qlct`.`work` w ON wr.id = w.worker_id
GROUP BY wr.`name`
HAVING COUNT(DISTINCT w.building_id) = (SELECT COUNT(*) FROM sql_qlct.building);
