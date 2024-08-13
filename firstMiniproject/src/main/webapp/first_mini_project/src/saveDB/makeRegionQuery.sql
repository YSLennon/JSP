
-- 도 (Province
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서울특별시', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부산광역시', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('대구광역시', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('인천광역시', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광주광역시', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('대전광역시', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('울산광역시', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('세종특별자치시', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('경기도', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강원도', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('충청북도', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('충청남도', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('전라북도', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('전라남도', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('경상북도', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('경상남도', NULL, 1);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('제주도', NULL, 1);

-- 시/군/구 (City/County/District) 예시 (서울특별시 내의 구)
-- 서울특별시의 regionNo를 알아야 함 (가정: 서울특별시의 regionNo가 1인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('종로구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('용산구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성동구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광진구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동대문구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중랑구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성북구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강북구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('도봉구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('노원구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('은평구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서대문구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('마포구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('양천구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강서구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('구로구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('금천구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영등포구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동작구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('관악구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서초구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강남구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('송파구', 1, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강동구', 1, 2);

-- 부산광역시의 지역 (가정: 부산광역시의 regionNo가 2인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영도구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부산진구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동래구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('북구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강서구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('해운대구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('사하구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('금정구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('연제구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수영구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('사상구', 2, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('기장군', 2, 2);

-- 대구광역시의 지역 (가정: 대구광역시의 regionNo가 3인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 3, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 3, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 3, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남구', 3, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('북구', 3, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수성구', 3, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('달서구', 3, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('달성군', 3, 2);

-- 인천광역시의 지역 (가정: 인천광역시의 regionNo가 4인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 4, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 4, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('미추홀구', 4, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('연수구', 4, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남동구', 4, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부평구', 4, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('계양구', 4, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 4, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강화군', 4, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('옹진군', 4, 2);

-- 광주광역시의 지역 (가정: 광주광역시의 regionNo가 5인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 5, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 5, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남구', 5, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('북구', 5, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광산구', 5, 2);

-- 대전광역시의 지역 (가정: 대전광역시의 regionNo가 6인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 6, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 6, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 6, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('유성구', 6, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('대덕구', 6, 2);

-- 울산광역시의 지역 (가정: 울산광역시의 regionNo가 7인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 7, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남구', 7, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 7, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('북구', 7, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('울주군', 7, 2);

-- 세종특별자치시의 지역 (가정: 세종특별자치시의 regionNo가 8인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('세종시', 8, 2);

-- 경기도의 지역 (가정: 경기도의 regionNo가 9인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성남시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('고양시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('용인시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('화성시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부천시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안산시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안양시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('오산시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('군포시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('의왕시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('하남시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('파주시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('이천시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('평택시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('여주시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('양주시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('구리시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('포천시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('연천군', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('가평군', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('여주시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('이천시', 9, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('양평군', 9, 2);

-- 강원도의 지역 (가정: 강원도의 regionNo가 10인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('춘천시', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강릉시', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동해시', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('속초시', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('원주시', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('철원군', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('화천군', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('양구군', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('인제군', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('홍천군', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('횡성군', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영월군', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('평창군', 10, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('정선군', 10, 2);

-- 충청북도의 지역 (가정: 충청북도의 regionNo가 11인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('청주시', 11, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('충주시', 11, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('제천시', 11, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('보은군', 11, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('옥천군', 11, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영동군', 11, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('진천군', 11, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('괴산군', 11, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('음성군', 11, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('사업군', 11, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('청원군', 11, 2);

-- 충청남도의 지역 (가정: 충청남도의 regionNo가 12인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('천안시', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('아산시', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('보령시', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서산시', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('논산시', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('계룡시', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('당진시', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서천군', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('홍성군', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('예산군', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('청양군', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부여군', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('기산군', 12, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('태안군', 12, 2);

-- 전라북도의 지역 (가정: 전라북도의 regionNo가 13인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('전주시', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('군산시', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('익산시', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('정읍시', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남원시', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('김제시', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('완주군', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('진안군', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('무주군', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('장수군', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('임실군', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('순창군', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('고창군', 13, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부안군', 13, 2);

-- 전라남도의 지역 (가정: 전라남도의 regionNo가 14인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('목포시', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('여수시', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('순천시', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광양시', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('무안군', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('나주시', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('해남군', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('진도군', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('완도군', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('장흥군', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강진군', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('해남군', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영암군', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('무안군', 14, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('신안군', 14, 2);

-- 경상북도의 지역 (가정: 경상북도의 regionNo가 15인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('포항시', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('경주시', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('김천시', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안동시', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('구미시', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영천시', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('상주시', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('문경시', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('경산시', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('군위군', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('의성군', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('청송군', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영양군', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영덕군', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('청도군', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('고령군', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성주군', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('칠곡군', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('예천군', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('봉화군', 15, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('울진군', 15, 2);

-- 경상남도의 지역 (가정: 경상남도의 regionNo가 16인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('창원시', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('진주시', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('통영시', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('사천시', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('김해시', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('밀양시', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('거제시', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('양산시', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('창녕군', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('의령군', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('함안군', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('함양군', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('산청군', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('거창군', 16, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('합천군', 16, 2);

-- 제주도의 지역 (가정: 제주도의 regionNo가 17인 경우)
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('제주시', 17, 2);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서귀포시', 17, 2);

-- 서울특별시 내의 동 (각 동의 regionNo는 서울특별시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 구별로 동을 추가할 수 있습니다)
-- 가정: 서울특별시 내의 동은 서울특별시 지역번호를 기준으로 3인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('종로구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('용산구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성동구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광진구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동대문구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중랑구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성북구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강북구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('도봉구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('노원구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('은평구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서대문구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('마포구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('양천구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강서구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('구로구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('금천구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영등포구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동작구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('관악구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서초구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강남구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('송파구', 3, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강동구', 3, 3);

-- 부산광역시 내의 동 (각 동의 regionNo는 부산광역시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 구별로 동을 추가할 수 있습니다)
-- 가정: 부산광역시 내의 동은 부산광역시 지역번호를 기준으로 4인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('해운대구', 4, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 4, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동래구', 4, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부산진구', 4, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 4, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('사하구', 4, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강서구', 4, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('금정구', 4, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('연제구', 4, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('북구', 4, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수영구', 4, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남구', 4, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('사상구', 4, 3);

-- 광주광역시 내의 동 (각 동의 regionNo는 광주광역시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 구별로 동을 추가할 수 있습니다)
-- 가정: 광주광역시 내의 동은 광주광역시 지역번호를 기준으로 5인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 5, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 5, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남구', 5, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('북구', 5, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광산구', 5, 3);

-- 대전광역시 내의 동 (각 동의 regionNo는 대전광역시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 구별로 동을 추가할 수 있습니다)
-- 가정: 대전광역시 내의 동은 대전광역시 지역번호를 기준으로 6인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 6, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 6, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 6, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('유성구', 6, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('대덕구', 6, 3);

-- 울산광역시 내의 동 (각 동의 regionNo는 울산광역시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 구별로 동을 추가할 수 있습니다)
-- 가정: 울산광역시 내의 동은 울산광역시 지역번호를 기준으로 7인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 7, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남구', 7, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 7, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('북구', 7, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('울주군', 7, 3);

-- 세종특별자치시 내의 동 (각 동의 regionNo는 세종특별자치시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 구별로 동을 추가할 수 있습니다)
-- 가정: 세종특별자치시 내의 동은 세종특별자치시 지역번호를 기준으로 8인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('세종시', 8, 3);

-- 경기도 내의 동 (각 동의 regionNo는 경기도의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 구별로 동을 추가할 수 있습니다)
-- 가정: 경기도 내의 동은 경기도 지역번호를 기준으로 9인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시 장안구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시 권선구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시 팔달구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시 영통구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성남시 수정구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성남시 중원구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성남시 분당구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('고양시 덕양구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('고양시 일산동구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('고양시 일산서구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안양시 만안구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안양시 동안구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부천시 오정구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부천시 원미구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부천시 소사구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광명시', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('의왕시', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('군포시', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('하남시', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('오산시', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('이천시', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('용인시 처인구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('용인시 기흥구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('용인시 수지구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안산시 상록구', 9, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안산시 단원구', 9, 3);

-- 인천광역시 내의 동 (각 동의 regionNo는 인천광역시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 구별로 동을 추가할 수 있습니다)
-- 가정: 인천광역시 내의 동은 인천광역시 지역번호를 기준으로 10인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 10, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 10, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('미추홀구', 10, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('연수구', 10, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남동구', 10, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부평구', 10, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('계양구', 10, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 10, 3);

-- 대구광역시 내의 동 (각 동의 regionNo는 대구광역시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 구별로 동을 추가할 수 있습니다)
-- 가정: 대구광역시 내의 동은 대구광역시 지역번호를 기준으로 11인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 11, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 11, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 11, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남구', 11, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('북구', 11, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수성구', 11, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('달서구', 11, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('달성군', 11, 3);

-- 세종특별자치시 내의 동 (각 동의 regionNo는 세종특별자치시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 동은 세종특별자치시 지역번호를 기준으로 설정해야 합니다)
-- 가정: 세종특별자치시 내의 동은 세종특별자치시 지역번호를 기준으로 12인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('세종시', 12, 3);

-- 경기도 내의 시/군/구 (각 시/군/구의 regionNo는 경기도의 지역번호를 기준으로 설정해야 합니다)
-- 예시 시/군/구 삽입 (각 시/군/구는 경기도 지역번호를 기준으로 설정해야 합니다)
-- 가정: 경기도 내의 시/군/구는 경기도 지역번호를 기준으로 13인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시 장안구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시 권선구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시 팔달구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시 영통구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성남시 수정구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성남시 중원구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성남시 분당구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('고양시 덕양구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('고양시 일산동구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('고양시 일산서구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안양시 만안구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안양시 동안구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부천시 오정구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부천시 원미구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부천시 소사구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광명시', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('의왕시', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('군포시', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('하남시', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('오산시', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('이천시', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('용인시 처인구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('용인시 기흥구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('용인시 수지구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안산시 상록구', 13, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안산시 단원구', 13, 3);

-- 인천광역시 내의 동 (각 동의 regionNo는 인천광역시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 동은 인천광역시 지역번호를 기준으로 설정해야 합니다)
-- 가정: 인천광역시 내의 동은 인천광역시 지역번호를 기준으로 14인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 14, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 14, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('미추홀구', 14, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('연수구', 14, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남동구', 14, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부평구', 14, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('계양구', 14, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 14, 3);

-- 대구광역시 내의 동 (각 동의 regionNo는 대구광역시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 동은 대구광역시 지역번호를 기준으로 설정해야 합니다)
-- 가정: 대구광역시 내의 동은 대구광역시 지역번호를 기준으로 15인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 15, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 15, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 15, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남구', 15, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('북구', 15, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수성구', 15, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('달서구', 15, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('달성군', 15, 3);

-- 세종특별자치시 내의 동 (각 동의 regionNo는 세종특별자치시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 동은 세종특별자치시 지역번호를 기준으로 설정해야 합니다)
-- 가정: 세종특별자치시 내의 동은 세종특별자치시 지역번호를 기준으로 16인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('세종시', 16, 3);

-- 경기도 내의 시/군/구 (각 시/군/구의 regionNo는 경기도의 지역번호를 기준으로 설정해야 합니다)
-- 예시 시/군/구 삽입 (각 시/군/구는 경기도 지역번호를 기준으로 설정해야 합니다)
-- 가정: 경기도 내의 시/군/구는 경기도 지역번호를 기준으로 17인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시 장안구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시 권선구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시 팔달구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('수원시 영통구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성남시 수정구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성남시 중원구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('성남시 분당구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('고양시 덕양구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('고양시 일산동구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('고양시 일산서구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안양시 만안구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안양시 동안구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부천시 오정구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부천시 원미구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부천시 소사구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광명시', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('의왕시', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('군포시', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('하남시', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('오산시', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('이천시', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('용인시 처인구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('용인시 기흥구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('용인시 수지구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안산시 상록구', 17, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('안산시 단원구', 17, 3);

-- 충청북도 내의 시/군/구 (각 시/군/구의 regionNo는 충청북도의 지역번호를 기준으로 설정해야 합니다)
-- 예시 시/군/구 삽입 (각 시/군/구는 충청북도 지역번호를 기준으로 설정해야 합니다)
-- 가정: 충청북도 내의 시/군/구는 충청북도 지역번호를 기준으로 18인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('청주시 청원구', 18, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('청주시 서원구', 18, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('청주시 흥덕구', 18, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('청주시 상당구', 18, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('충주시', 18, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('제천시', 18, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('보은군', 18, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('옥천군', 18, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영동군', 18, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('진천군', 18, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('괴산군', 18, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('음성군', 18, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('단양군', 18, 3);

-- 충청남도 내의 시/군/구 (각 시/군/구의 regionNo는 충청남도의 지역번호를 기준으로 설정해야 합니다)
-- 예시 시/군/구 삽입 (각 시/군/구는 충청남도 지역번호를 기준으로 설정해야 합니다)
-- 가정: 충청남도 내의 시/군/구는 충청남도 지역번호를 기준으로 19인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('천안시 동남구', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('천안시 서북구', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('공주시', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('보령시', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('아산시', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('천안시 동남구', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서산시', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('논산시', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('계룡시', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('당진시', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('금산군', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부여군', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서천군', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('청양군', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('홍성군', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('예산군', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('래서군', 19, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('아산시', 19, 3);

-- 전라북도 내의 시/군/구 (각 시/군/구의 regionNo는 전라북도의 지역번호를 기준으로 설정해야 합니다)
-- 예시 시/군/구 삽입 (각 시/군/구는 전라북도 지역번호를 기준으로 설정해야 합니다)
-- 가정: 전라북도 내의 시/군/구는 전라북도 지역번호를 기준으로 20인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('전주시 완산구', 20, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('전주시 덕진구', 20, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('군산시', 20, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('익산시', 20, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('정읍시', 20, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남원시', 20, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('김제시', 20, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('완주군', 20, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('진안군', 20, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('무주군', 20, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('장수군', 20, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('임실군', 20, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('순창군', 20, 3);

-- 전라남도 내의 시/군/구 (각 시/군/구의 regionNo는 전라남도의 지역번호를 기준으로 설정해야 합니다)
-- 예시 시/군/구 삽입 (각 시/군/구는 전라남도 지역번호를 기준으로 설정해야 합니다)
-- 가정: 전라남도 내의 시/군/구는 전라남도 지역번호를 기준으로 21인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광주시 동구', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광주시 서구', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광주시 남구', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광주시 북구', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광산구', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('목포시', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('여수시', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('순천시', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('나주시', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('광양시', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('무안군', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('해남군', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영암군', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('완도군', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('진도군', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('장흥군', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강진군', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('해남군', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영광군', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('장성군', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('완도군', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('진도군', 21, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('장흥군', 21, 3);

-- 부산광역시 내의 동 (각 동의 regionNo는 부산광역시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 동은 부산광역시 지역번호를 기준으로 설정해야 합니다)
-- 가정: 부산광역시 내의 동은 부산광역시 지역번호를 기준으로 22인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 22, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('서구', 22, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 22, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('영도구', 22, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('부산진구', 22, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동래구', 22, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남구', 22, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('북구', 22, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('해운대구', 22, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('사상구', 22, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('사하구', 22, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('금정구', 22, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('강서구', 22, 3);

-- 울산광역시 내의 동 (각 동의 regionNo는 울산광역시의 지역번호를 기준으로 설정해야 합니다)
-- 예시 동 삽입 (각 동은 울산광역시 지역번호를 기준으로 설정해야 합니다)
-- 가정: 울산광역시 내의 동은 울산광역시 지역번호를 기준으로 23인 경우
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('중구', 23, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('남구', 23, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('동구', 23, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('북구', 23, 3);
INSERT INTO Region (regionName, pRegionNo, depth) VALUES ('울주군', 23, 3);
