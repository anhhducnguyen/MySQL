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