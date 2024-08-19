 	SELECT boardNo, title, addr, status, category, substr(DATETIME, 1, LENGTH(DATETIME)-3) AS datetime FROM tbl_board where category LIKE '%' ORDER BY DATETIME desc;
 	
 	SELECT * FROM tbl_user;

INSERT INTO tbl_enroll (uid, boardNo, status) VALUES
('user01', 1, 'present'),
('user02', 1, 'present'),
('user02', 2, 'present'),
('user04', 2, 'present'),
('user03', 3, 'present'),
('user05', 3, 'present'),
('user04', 4, 'present'),
('user07', 4, 'present'),
('user05', 5, 'present'),
('user08', 5, 'present'),
('user06', 6, 'present'),
('user10', 6, 'present'),
('user07', 7, 'present'),
('user02', 7, 'present');
