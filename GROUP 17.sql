--檢視資料集總筆數
--US_AIRLINES
SELECT COUNT(*) AS total
FROM us_airlines;
--US_STATIONS
SELECT COUNT(*) AS total
FROM us_stations;

--查詢最佳化
--1.出發點(origin)為”HOU”，且沒有延誤的班機資料
--只以出發點(origin)為index
--建立index
CREATE INDEX IDX_1 ON us_airlines(origin asc);
EXPLAIN PLAN FOR
SELECT /*+ index(us_airlines (origin))*/*
FROM us_airlines
WHERE origin = 'HOU' AND dep_delay <= 0;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
--以出發點(origin) + 延誤時間(dep_delay)為index
CREATE INDEX IDX_2 ON us_airlines(origin asc, dep_delay asc) ;
EXPLAIN PLAN FOR
SELECT /*+ index(us_airlines (origin, dep_delay))*/*
FROM us_airlines
WHERE origin = 'HOU' AND dep_delay <= 0;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
--2.由Boeing 製造(manufacturer) 且飛行距離(distance)大於2000miles
CREATE INDEX IDX_3 ON us_airlines(distance desc) ;
EXPLAIN PLAN FOR
SELECT /*+ index(us_airlines (distance))*/*
FROM us_airlines
WHERE manufacturer = 'Boeing' AND distance > 2000;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
--3.滑行離場時間(班機到跑道上與實際起飛的間隔時間)大於20分鐘且氣溫在0度C以下
--只以滑行離場時間(taxi_out)為index
CREATE INDEX taxi_idx ON us_airlines(taxi_out desc);
EXPLAIN PLAN FOR
SELECT /*+ index(us_airlines (taxi_out))*/*
FROM us_airlines
WHERE taxi_out > 20 AND temperature < 0;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
--以氣溫(temperature)為index
CREATE INDEX temp_idx ON us_airlines(temperature asc);
EXPLAIN PLAN FOR
SELECT /*+ index(us_airlines (temperature))*/*
FROM us_airlines
WHERE taxi_out > 20 AND temperature < 0;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
--以滑行離場時間(taxi_out) + 氣溫(temperature)為index
CREATE INDEX tate_idx ON us_airlines(taxi_out asc,temperature asc);
EXPLAIN PLAN FOR
SELECT /*+ index(us_airlines (taxi_out,temperature))*/*
FROM us_airlines
WHERE taxi_out > 20 AND temperature < 0;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());