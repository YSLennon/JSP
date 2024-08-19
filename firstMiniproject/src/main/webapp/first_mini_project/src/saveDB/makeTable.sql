CREATE TABLE users (
    uid VARCHAR(50) PRIMARY KEY,
    pwd VARCHAR(255) NOT NULL,
    cnt INT DEFAULT 0,
    name VARCHAR(50),
    phone VARCHAR(50),
    addr VARCHAR(255),
    nickName VARCHAR(50),
    favor CHAR(1) DEFAULT 'A',
    authority CHAR(1) DEFAULT 'C',
    cdatetime DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Region(
    regionNo INT PRIMARY KEY AUTO_INCREMENT,
    regionName VARCHAR(255) NOT NULL,
    pRegionNo INT NULL,
    depth INT NOT NULL,
    FOREIGN KEY (pRegionNo) REFERENCES Region(regionNo)
);

CREATE TABLE tbl_board (
    boardNo INT AUTO_INCREMENT PRIMARY KEY,
    organizer VARCHAR(50),
    title VARCHAR(255) NOT NULL,
    contents TEXT,
    distance INT,
    addr VARCHAR(50),
    status VARCHAR(50) DEFAULT 'RECRUITMENT',
    category VARCHAR(1) DEFAULT 'C',
    datetime DATETIME,
    cdatetime DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tbl_enroll (
    uid VARCHAR(50),
    boardNo INT,
    status VARCHAR(50) NOT NULL DEFAULT 'present'
);