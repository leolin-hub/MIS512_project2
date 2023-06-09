--�˵���ƶ��`����
--US_AIRLINES
SELECT COUNT(*) AS total
FROM us_airlines;
--US_STATIONS
SELECT COUNT(*) AS total
FROM us_stations;

--�d�̨߳Τ�
--1.�X�o�I(origin)����HOU���A�B�S�����~���Z�����
--�u�H�X�o�I(origin)��index
--�إ�index
CREATE INDEX IDX_1 ON us_airlines(origin asc);
EXPLAIN PLAN FOR
SELECT /*+ index(us_airlines (origin))*/*
FROM us_airlines
WHERE origin = 'HOU' AND dep_delay <= 0;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
--�H�X�o�I(origin) + ���~�ɶ�(dep_delay)��index
CREATE INDEX IDX_2 ON us_airlines(origin asc, dep_delay asc) ;
EXPLAIN PLAN FOR
SELECT /*+ index(us_airlines (origin, dep_delay))*/*
FROM us_airlines
WHERE origin = 'HOU' AND dep_delay <= 0;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
--2.��Boeing �s�y(manufacturer) �B����Z��(distance)�j��2000miles
CREATE INDEX IDX_3 ON us_airlines(distance desc) ;
EXPLAIN PLAN FOR
SELECT /*+ index(us_airlines (distance))*/*
FROM us_airlines
WHERE manufacturer = 'Boeing' AND distance > 2000;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
--3.�Ʀ������ɶ�(�Z����]�D�W�P��ڰ_�������j�ɶ�)�j��20�����B��Ŧb0��C�H�U
--�u�H�Ʀ������ɶ�(taxi_out)��index
CREATE INDEX taxi_idx ON us_airlines(taxi_out desc);
EXPLAIN PLAN FOR
SELECT /*+ index(us_airlines (taxi_out))*/*
FROM us_airlines
WHERE taxi_out > 20 AND temperature < 0;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
--�H���(temperature)��index
CREATE INDEX temp_idx ON us_airlines(temperature asc);
EXPLAIN PLAN FOR
SELECT /*+ index(us_airlines (temperature))*/*
FROM us_airlines
WHERE taxi_out > 20 AND temperature < 0;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
--�H�Ʀ������ɶ�(taxi_out) + ���(temperature)��index
CREATE INDEX tate_idx ON us_airlines(taxi_out asc,temperature asc);
EXPLAIN PLAN FOR
SELECT /*+ index(us_airlines (taxi_out,temperature))*/*
FROM us_airlines
WHERE taxi_out > 20 AND temperature < 0;

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());