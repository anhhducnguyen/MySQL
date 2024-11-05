-- Exercise 02
-- Thực hiện kết nối các khóa ngoại giữa các bảng theo các yêu cầu và ERD sau

USE sql_qlct;

ALTER TABLE building
ADD CONSTRAINT fk_host_id FOREIGN KEY (`host_id`) REFERENCES `host`(id);

ALTER TABLE building
ADD CONSTRAINT fk_contractor_id FOREIGN KEY (contractor_id) REFERENCES contractor(id);

ALTER TABLE work
ADD CONSTRAINT fk_building_work FOREIGN KEY (building_id) REFERENCES building(id);

ALTER TABLE design
ADD CONSTRAINT fk_building_design FOREIGN KEY (building_id) REFERENCES building(id);

ALTER TABLE work
ADD CONSTRAINT fk_worker FOREIGN KEY (worker_id) REFERENCES worker(id);

ALTER TABLE design
ADD CONSTRAINT fk_architect_id FOREIGN KEY (architect_id) REFERENCES architect(id);


-- Exercise 03
-- Áp dụng các kiến thức đã học về các mệnh đề truy vấn trong SQL, thực hiện các yêu cầu sau


-- Hiển thị toàn bộ nội dung của bảng Architect

SELECT * 
FROM Architect;


-- Hiển thị danh sách gồm họ tên và giới tính của kiến trúc sư

SELECT DISTINCT a.name, a.sex
FROM Architect a; 

-- Hiển thị những năm sinh có thể có của các kiến trúc sư

SELECT DISTINCT a.birthday
FROM Architect a; 

-- Hiển thị danh sách các kiến trúc sư (họ tên và năm sinh) (giá trị năm sinh tăng dần)

SELECT DISTINCT a.name, a.birthday
FROM Architect a
ORDER by a.birthday ASC; 

-- Hiển thị danh sách các kiến trúc sư (họ tên và năm sinh) (giá trị năm sinh giảm dần)

SELECT DISTINCT a.name, a.birthday
FROM Architect a
ORDER by a.birthday DESC; 

-- Hiển thị danh sách các công trình có chi phí từ thấp đến cao. Nếu 2 công trình có chi phí bằng nhau sắp xếp tên thành phố theo bảng chữ cái building

SELECT DISTINCT  * 
FROM building b
ORDER BY b.cost ASC, b.city ASC;


-- Exercise 04
-- Áp dụng các kiến thức đã học về các mệnh đề truy vấn trong SQL, thực hiện các yêu cầu sau

-- Hiển thị tất cả thông tin của kiến trúc sư "le thanh tung"

SELECT *
FROM Architect a
WHERE a.name = "le thanh tung";

-- Hiển thị tên, năm sinh các công nhân có chuyên môn hàn hoặc điện

SELECT DISTINCT wr.name
FROM worker wr
WHERE wr.skill = 'han' OR wr.skill = 'dien';



-- Hiển thị tên các công nhân có chuyên môn hàn hoặc điện và năm sinh lớn hơn 1948

SELECT DISTINCT wr.name
FROM worker wr
WHERE wr.skill = 'han' OR wr.skill = 'dien' AND  wr.birthday > 1948;

-- Hiển thị những công nhân bắt đầu vào nghề khi dưới 20 (birthday + 20 > year)

SELECT *
FROM worker wr
WHERE (wr.birthday + 20 > wr.year);


-- Hiển thị những công nhân có năm sinh 1945, 1940, 1948 (Bằng 2 cách)

SELECT *
FROM Worker wr
WHERE wr.birthday = 1945 OR wr.birthday = 1940 OR wr.birthday = 1948;

SELECT *
FROM Worker wr
WHERE wr.birthday IN (1945, 1940, 1948);


-- Tìm những công trình có chi phí đầu tư từ 200 đến 500 triệu đồng (Bằng 2 cách)

SELECT *
FROM building b 
WHERE b.cost >= 200 AND b.cost <= 500;

SELECT *
FROM building b 
WHERE b.cost BETWEEN 200 AND 500;


-- Tìm kiếm những kiến trúc sư có họ là nguyen: % chuỗi

SELECT *
FROM Architect a
WHERE a.name LIKE 'nguyen%';

-- Tìm kiếm những kiến trúc sư có tên đệm là anh

SELECT *
FROM Architect a
WHERE a.name LIKE '% anh %';

-- Tìm kiếm những kiến trúc sư có tên bắt đầu th và có 3 ký tự

SELECT *
FROM Architect
WHERE name LIKE 'tr_';


-- Tìm chủ thầu không có phone

SELECT *
FROM Contractor c
WHERE c.phone IS NULL;
