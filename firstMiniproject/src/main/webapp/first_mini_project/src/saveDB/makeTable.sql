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
    cdatetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    udatetime DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Region (tbl_usertbl_usertbl_user
    regionNo INT PRIMARY KEY AUTO_INCREMENT,
    regionName VARCHAR(255) NOT NULL,
    pRegionNo INT NULL,
    depth INT NOT NULL,
    FOREIGN KEY (pRegionNo) REFERENCES Region(regionNo)
);