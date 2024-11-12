-- Exercise 03
-- Áp dụng các kiến thức đã học về các mệnh đề truy vấn trong SQL, thực hiện các yêu cầu sau

-- Hiển thị thông tin công trình có chi phí cao nhất
SELECT * 
FROM sql_qlct.building
WHERE cost = (SELECT MAX(cost) FROM sql_qlct.building);

-- Hiển thị thông tin công trình có chi phí lớn hơn tất cả các công trình được xây dựng ở Cần Thơ
SELECT * 
FROM sql_qlct.building
WHERE cost > ALL
(
	SELECT cost FROM sql_qlct.building
	WHERE city = 'can tho'
);
-- Hiển thị thông tin công trình có chi phí lớn hơn một trong các công trình được xây dựng ở Cần Thơ
SELECT * 
FROM sql_qlct.building
WHERE cost > ANY
(
	SELECT cost FROM sql_qlct.building
	WHERE city = 'can tho'
);
-- Hiển thị thông tin công trình chưa có kiến trúc sư thiết kế
SELECT * 
FROM building
WHERE id NOT IN 
(
	SELECT DISTINCT building_id
	FROM design
);
-- Hiển thị thông tin các kiến trúc sư cùng năm sinh và cùng nơi tốt nghiệp
SELECT * FROM sql_qlct.architect;

SELECT * FROM sql_qlct.architect
WHERE birthday IN
(
	SELECT DISTINCT birthday FROM sql_qlct.architect
);

SELECT * 
FROM sql_qlct.architect a1
INNER JOIN sql_qlct.architect a2 
ON a1.birthday = a2.birthday AND a1.place = a2.place AND a1.id <> a2.id;
