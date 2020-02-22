--====================================
-- 관리자계정
--====================================
--NMT 계정 생성
--create user nmt identified by nmt
--default tablespace users;
--
--grant connect, resource to nmt;
--====================================
-- NMT 계정
--====================================

CREATE TABLE "NMT_MEMBER" (
	"MEMBER_CODE"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(300)		NULL,
	"MEMBER_PASSWORD"	VARCHAR2(300) NULL,
	"MEMBER_NAME" VARCHAR2(15) NULL,
	"MEMBER_PHONE"	CHAR(11)		NOT NULL,
	"MEMBER_EMAIL"	VARCHAR2(300)		NULL,
	"MEMBER_ADDRESS"	VARCHAR2(150)		NULL,
	"MEMBER_REGDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_MILE"	NUMBER		NULL,
	"MEMBER_BIRTH"	DATE		NULL
);

CREATE TABLE "NMT_BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_CODE"	NUMBER		NOT NULL,
	"BOARD_CATE"	VARCHAR2(50)		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(150)		NULL,
	"BOARD_CONTENT"	VARCHAR2(2000)		NULL,
	"BOARD_ORIGIN"	VARCHAR2(100)		NULL,
	"BOARD_RENAMED"	VARCHAR2(100)		NULL,
	"BOARD_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"BOARD_READCNT"	NUMBER		NULL,
    "BOARD_LEVEL" NUMBER DEFAULT 1,
    "BOARD_REF" NUMBER
);
--drop table nmt_board;
CREATE TABLE "NMT_SALES" (
	"ORDER_NO"	NUMBER		NOT NULL,
	"MEMBER_CODE"	NUMBER		NOT NULL,
	"P_CODE"	VARCHAR2(100)		NOT NULL,
	"P_NAME"	VARCHAR2(100)		NULL,
	"P_QTT"	NUMBER		NULL,
	"P_PRICE"	NUMBER		NULL,
	"P_TOTAL_PRICE"	NUMBER		NULL,
	"P_DATE"	DATE	DEFAULT SYSDATE	NULL
);

CREATE TABLE "NMT_PRODUCT" (
	"P_CODE"	VARCHAR2(100)		NOT NULL,
	"P_NAME"	VARCHAR2(100)		NULL,
	"P_STOCK"	NUMBER		NULL,
	"P_PRICE"	NUMBER		NULL,
	"P_REGDATE"	DATE		NULL
);

--CREATE TABLE "NMT_IO" (
--	"P_CODE"	VARCHAR2(100)		NOT NULL,
--	"P_IO"	CHAR(1)	check ("P_IO" in ('i', 'o')) NOT NULL,
--	"P_AMOUNT"	NUMBER		NULL,
--	"P_NOWSTOCK"	NUMBER		NULL,
--	"P_DATE"	DATE	DEFAULT SYSDATE,
--	"P_COMMENT"	 VARCHAR2(50)	NULL
--);

CREATE TABLE "NMT_AIR" (
	"AIR_CODE"	VARCHAR2(100)		NOT NULL,
	"NATION_DEPART"	VARCHAR2(50)		NOT NULL,
	"NATION_ARRIVAL"	VARCHAR2(50)		NOT NULL,
	"IMG_CODE"	VARCHAR2(20)		NOT NULL,
	"AIR_NAME"	VARCHAR2(100)		NULL,
	"AIR_PRICE"	NUMBER		NULL,
	"AIR_COM"	VARCHAR2(50)		NULL,
	"AIR_DEPART"	DATE		NULL,
	"AIR_ARRIVAL"	DATE		NULL
);

CREATE TABLE "NMT_HOTEL" (
	"HOTEL_CODE"	VARCHAR2(100)		NOT NULL,
	"NATION_CODE"	VARCHAR2(50)		NOT NULL,
	"DISTANCE_LEVEL"	VARCHAR2(50)		NOT NULL,
	"IMG_CODE"	VARCHAR2(20)		NOT NULL,
	"HOTEL_NAME"	VARCHAR2(100)		NULL,
	"HOTEL_PRICE"	NUMBER		NULL,
	"HOTEL_ADDR"	VARCHAR2(100)		NULL,
	"HOTEL_LINK"	VARCHAR2(100)		NULL,
	"HOTEL_SCORE"	NUMBER		NULL
);

CREATE TABLE "NMT_PACKAGE" (
	"PACKAGE_CODE"	VARCHAR2(20)		NOT NULL,
	"MEMBER_CODE"	NUMBER		NOT NULL,
	"PACKAGE_DATE"	DATE		NULL,
	"TOTAL_PRICE"	NUMBER		NULL
);

CREATE TABLE "NMT_PLACE" (
	"PLACE_CODE"	VARCHAR2(100)		NOT NULL,
	"NATION_CODE"	VARCHAR2(50)		NOT NULL,
	"DISTANCE_LEVEL"	VARCHAR2(50)		NOT NULL,
	"IMG_CODE"	VARCHAR2(20)		NOT NULL,
	"PLACE_NAME"	VARCHAR2(100)		NULL,
	"PLACE_PRICE"	NUMBER		NULL,
	"PLACE_ADDR"	VARCHAR2(100)		NULL,
	"PLACE_LINK"	VARCHAR2(100)		NULL
);

CREATE TABLE "NMT_DISTANCE" (
	"DISTANCE_LEVEL"	VARCHAR2(50)		NOT NULL,
	"DIS_LEVEL"	NUMBER		NULL,
	"START_POINT"	VARCHAR2(100)		NULL,
	"DISTANCE_INFO"	VARCHAR2(200)		NULL
);

CREATE TABLE "NMT_NATION" (
	"NATION_CODE"	VARCHAR2(50)		NOT NULL,
	"NATION_NAME"	VARCHAR2(50)		NULL,
	"NATION_INFO"	VARCHAR2(200)		NULL,
	"NATION_MONEY"	NUMBER		NULL
);

CREATE TABLE "BOARD_CATEGORY" (
	"BOARD_CATE"	VARCHAR2(50)		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(50)		NULL,
	"BOARD_INFO"	VARCHAR2(200)		NULL
);

CREATE TABLE "TBL_ADMIN" (
	"ADMIN_NO"	NUMBER		NOT NULL,
	"ADMIN_ID"	VARCHAR2(100)		NULL,
	"ADMIN_PASSWORD"	VARCHAR2(200)		NULL,
	"ADMIN_JOB"	CHAR(30)		NULL,
	"ADMIN_DEPT"	CHAR(30)		NULL
);

CREATE TABLE "NMT_MILE" (
	"MEMBER_CODE"	NUMBER		NOT NULL,
	"MILE_CREATE"	DATE	DEFAULT SYSDATE	NULL,
	"MILE_POINT"	NUMBER		NULL,
	"MILE_IO"	CHAR(1)		NULL,
	"MILE_TOTAL"	NUMBER		NULL,
	"MILE_INFO"	VARCHAR(2000)		NULL
);

CREATE TABLE "NMT_ADMINBOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_CODE"	NUMBER		NOT NULL,
	"BOARD_CATE"	VARCHAR2(50)		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(150)		NULL,
	"BOARD_CONTENT"	VARCHAR2(2000)		NULL,
	"BOARD_ORIGIN"	VARCHAR2(100)		NULL,
	"BOARD_RENAMED"	VARCHAR2(100)		NULL,
	"BOARD_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"BOARD_READCNT"	NUMBER		NULL
);

CREATE TABLE "NMT_IMAGES" (
	"IMG_CODE"	VARCHAR2(20)		NOT NULL,
	"PACK_CODE"	VARCHAR2(100)		NULL,
	"IMG_ORIGIN"	VARCHAR(100)		NULL,
	"IMG_RENAMED"	VARCHAR2(100)		NULL
);

CREATE TABLE "NMT_PACKAGELIST" (
	"PACKAGE_CODE"	VARCHAR2(20)		NOT NULL,
	"AIR_CODE"	VARCHAR2(100)		NOT NULL,
	"PLACE_CODE"	VARCHAR2(100)		NOT NULL,
	"HOTEL_CODE"	VARCHAR2(100)		NOT NULL
);

CREATE TABLE "NMT_CP" (
	"CP_SERAIL"	VARCHAR2(200)		NOT NULL,
	"MEMBER_CODE"	NUMBER		NOT NULL,
	"CP_START"	DATE	DEFAULT SYSDATE	NULL,
	"CP_END"	DATE	DEFAULT SYSDATE	NULL,
	"CP_CATEGORY"	VARCHAR2(50)		NULL,
	"CP_USED"	CHAR(1)		NULL,
	"CP_ADMINCODE"	VARCHAR2(50)		NULL
);


	

SELECT * FROM tab;

--프라이머리키지정
--이름:pk_컬럼명 
select * from tab;--모든테이블보기 
select * from user_constraints where constraint_type='P';--프라이머리키만 보기 

alter table nmt_member add constraint pk_member_code primary key(member_code);
alter table nmt_package add constraint pk_package_code primary key(package_code);
alter table tbl_admin add constraint pk_admin_no primary key(admin_no);
alter table nmt_cp add constraint pk_cp_serail primary key(cp_serail);
alter table nmt_images add constraint pk_img_code primary key(img_code);
alter table nmt_air add constraint pk_air_code primary key(air_code);
alter table nmt_place add constraint pk_place_code primary key(place_code);
alter table nmt_hotel add constraint pk_hotel_code primary key(hotel_code);
alter table nmt_distance add constraint pk_distance_level primary key(distance_level);
alter table nmt_nation add constraint pk_nation_code primary key(nation_code);
alter table nmt_adminboard add constraint pk_adminboard_no primary key(board_no);
alter table nmt_product add constraint pk_product_code primary key(p_code);
alter table nmt_sales add constraint pk_order_no primary key(order_no);
alter table nmt_board add constraint pk_board_no primary key(board_no);



--이름 : fk_nmt뺀 테이블명_키이름
--외래키 지정
alter table nmt_adminboard add constraint fk_board_member_code foreign key
(member_code) references nmt_member(member_code);
--board_category테이블을 삭제해서 참조할 외래키가 없음 어떡ㄱ해야할ㄹ까여....
--alter table nmt_adminboard add constraint fk_board_board_cate foreign key(board_cate) references nmt_member(member_code);
alter table nmt_sales add constraint fk_sales_member_code foreign key (member_code) references nmt_member(member_code);
alter table nmt_sales add constraint fk_sales_p_code foreign key (p_code) references nmt_product(p_code);
alter table nmt_mile add constraint fk_mile_member_code foreign key(member_code) references nmt_member(member_code);
alter table nmt_package add constraint fk_package_member_code foreign key(member_code) references nmt_member(member_code);
alter table nmt_cp add constraint fk_cp_member_code foreign key(member_code) references nmt_member(member_code);
alter table nmt_packagelist add constraint fk_packagelist_package_code foreign key(package_code) references nmt_package(package_code);
alter table nmt_packagelist add constraint fk_packagelist_air_code foreign key(air_code) references nmt_air(air_code);
alter table nmt_packagelist add constraint fk_packagelist_place_code foreign key(place_code) references nmt_place(place_code);
alter table nmt_packagelist add constraint fk_packagelist_hotel_code foreign key(hotel_code) references nmt_hotel(hotel_code);
alter table nmt_air add constraint fk_air_nation_depart foreign key(nation_depart) references nmt_nation(nation_code);
alter table nmt_air add constraint fk_air_nation_arrival foreign key(nation_arrival) references nmt_nation(nation_code);
alter table nmt_air add constraint fk_air_img_code foreign key(img_code) references nmt_images(img_code);
alter table nmt_place add constraint fk_place_nation_code foreign key(nation_code) references nmt_nation(nation_code);
alter table nmt_place add constraint fk_place_distance_level foreign key(distance_level) references nmt_distance(distance_level);
alter table nmt_place add constraint fk_place_img_code foreign key(img_code) references nmt_images(img_code);
alter table nmt_hotel add constraint fk_hotel_nation_code foreign key(nation_code) references nmt_nation(nation_code);
alter table nmt_hotel add constraint fk_hotel_distance_level foreign key(distance_level) references nmt_distance(distance_level);
alter table nmt_hotel add constraint fk_hotel_img_code foreign key(img_code) references nmt_images(img_code);
alter table nmt_board add constraint fk_board_ref foreign key(board_ref) references nmt_board(board_no);


select * from user_constraints where constraint_type='R';
select * from all_constraints where table_name = 'nmt_hotel';

select * from nmt_member;
insert into nmt_member values('1','admin','admin','관리자','01012341234','blacksnowman@kakao.com','서울시 강남구 테헤란로',sysdate , '10000',to_Date('20001231','yyyymmdd'));
commit;


--drop table board_category cascade constraints;
--drop table NMT_ADMINBOARD cascade constraints;
--drop table NMT_AIR cascade constraints;
--drop table NMT_BOARD cascade constraints;
--drop table NMT_CP cascade constraints;
--drop table NMT_DISTANCE cascade constraints;
--drop table NMT_HOTEL cascade constraints;
--drop table NMT_IMAGES cascade constraints;
--drop table NMT_MEMBER cascade constraints;
--drop table NMT_MILE cascade constraints;
--drop table NMT_PACKAGE cascade constraints;
--drop table NMT_PACKAGELIST cascade constraints;
--drop table NMT_PLACE cascade constraints;
--drop table NMT_PRODUCT cascade constraints;
--drop table NMT_SALES cascade constraints;
--drop table TBL_ADMIN cascade constraints;
--drop sequence seq_member_code;
--drop sequence seq_board_no;

select *
from board_category;
insert into board_category values('d1', 'question','자주묻는질문');
insert into board_category values('a1' ,'notice','admin_notioce');
insert into board_category values('b1', 'board', 'review-board');
insert into board_category values('c1','onetoone','일대일문의');
commit;


-- sequence
--create SEQUENCE seq_member_code start with 10000001 MAXVALUE 10009999;
--create SEQUENCE seq_board_no start with 1;
--commit;

--qna query
--select * from nmt_board where board_cate = 'c1';
--
--select * from nmt_board start with board_level = 1 connect by prior board_no = board_ref order siblings by board_no desc;
--
--select lpad(' ',(level-1)*5) || BOARD_TITLE, B.* from nmt_board B start with board_level =1 connect by prior board_no = board_ref order siblings by board_no desc;
--
--SELECT * FROM ( SELECT ROWNUM AS RNUM, V.* FROM( select * from nmt_board start with board_level = 1 connect by prior board_no = board_ref order siblings by board_no desc) V ) V WHERE RNUM BETWEEN ? and ?