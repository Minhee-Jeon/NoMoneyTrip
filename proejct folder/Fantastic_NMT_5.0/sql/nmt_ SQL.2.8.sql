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
--DROP
select * from nmt_member;
drop table NMT_MEMBER cascade constraints;
drop table NMT_MILE cascade constraints;
drop table NMT_PACKAGE cascade constraints;
drop table NMT_PACKAGELIST cascade constraints;

drop table NMT_BOARD cascade constraints;
drop table NMT_ADMINBOARD cascade constraints;
drop table board_category cascade constraints;

drop table NMT_DISTANCE cascade constraints;
drop table NMT_AIR cascade constraints;
drop table NMT_HOTEL cascade constraints;
drop table NMT_PLACE cascade constraints;
drop table NMT_IMAGES cascade constraints;

drop sequence seq_member_code;
drop sequence seq_board_no;

--insert into nmt_mile values('10000001',default,1000,'I',1000,'회원가입적립');
--update nmt_member set member_mile = 5000 where member_code = '10000001';
select * from nmt_member;
--commit;
--rollback;
-- 02 17 start
--drop table NMT_ORDERLIST cascade constraints;
--drop sequence seq_orderNo;
--
--create sequence seq_orderNO;
--CREATE TABLE NMT_ORDERLIST (
--	"ORDER_NO"	VARCHAR2(100)		NOT NULL,
--	"PACKAGE_CODE"	VARCHAR2(100)		NOT NULL,
--	"MEMBER_CODE"	VARCHAR2(100)		NOT NULL,
--	"ORDER_PRICE"	NUMBER		NULL,
--	"ORDER_DATE"	DATE	DEFAULT SYSDATE	NULL
--);
--insert into NMT_ORDERLIST values(orderNO.nextval,'package-code-0217','10000001',5000000,default);
--commit;
--select  * from nmt_orderlist;


-- 02 17 end

--drop table NMT_CP cascade constraints;
--drop table NMT_PRODUCT cascade constraints;
--drop table NMT_SALES cascade constraints;
--drop table TBL_ADMIN cascade constraints;
--drop table NMT_NATION cascade constraints;


--


CREATE TABLE "NMT_MEMBER" (
	"MEMBER_CODE"	VARCHAR2(100)		NOT NULL,
	"MEMBER_ID"	VARCHAR2(300)		NULL,
	"MEMBER_PASSWORD"	VARCHAR2(300)		NULL,
    "MEMBER_NAME" VARCHAR2(15),
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


--select * from board_category;
--CREATE TABLE "NMT_SALES" (
--	"ORDER_NO"	NUMBER		NOT NULL,
--	"MEMBER_CODE"	NUMBER		NOT NULL,
--	"P_CODE"	VARCHAR2(100)		NOT NULL,
--	"P_NAME"	VARCHAR2(100)		NULL,
--	"P_QTT"	NUMBER		NULL,
--	"P_PRICE"	NUMBER		NULL,
--	"P_TOTAL_PRICE"	NUMBER		NULL,
--	"P_DATE"	DATE	DEFAULT SYSDATE	NULL
--);

--CREATE TABLE "NMT_PRODUCT" (
--	"P_CODE"	VARCHAR2(100)		NOT NULL,
--	"P_NAME"	VARCHAR2(100)		NULL,
--	"P_STOCK"	NUMBER		NULL,
--	"P_PRICE"	NUMBER		NULL,
--	"P_REGDATE"	DATE		NULL
--);

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
	"HOTEL_NAME"	VARCHAR2(100)		NULL,
	"HOTEL_PRICE"	NUMBER		NULL,
	"HOTEL_ADDR"	VARCHAR2(1000)		NULL,
	"HOTEL_SCORE"	NUMBER		NULL,
    "HOTEL_DAYS" NUMBER DEFAULT 0
);

CREATE TABLE "NMT_PACKAGE" (
	"PACKAGE_CODE"	VARCHAR2(100)		NOT NULL,
	"MEMBER_CODE"	VARCHAR2(100)		NOT NULL,
	"PACKAGE_DATE"	DATE	default sysdate 	NULL,
	"TOTAL_PRICE"	NUMBER		NULL
);

CREATE TABLE "NMT_PLACE" (
	"PLACE_CODE"	VARCHAR2(100)		NOT NULL,
	"NATION_CODE"	VARCHAR2(50)		NOT NULL,
	"DISTANCE_LEVEL"	VARCHAR2(50)		NOT NULL,
	"PLACE_NAME"	VARCHAR2(100)		NULL,
	"PLACE_PRICE"	NUMBER		NULL,
	"PLACE_ADDR"	VARCHAR2(1000)		NULL,
	"PLACE_LINK"	VARCHAR2(1000)		NULL
);

CREATE TABLE "NMT_DISTANCE" (
	"DISTANCE_LEVEL"	VARCHAR2(50)		NOT NULL,
	"DIS_LEVEL"	NUMBER		NULL,
	"DIS_CITY"	VARCHAR2(100)	NULL,
	"DISTANCE_INFO"	VARCHAR2(200)		NULL
);

SELECT * FROM nmt_distance;
CREATE TABLE "BOARD_CATEGORY" (
"BOARD_CATE"	VARCHAR2(50)		NOT NULL,
"BOARD_TITLE"	VARCHAR2(50)		NULL,
"BOARD_INFO"	VARCHAR2(200)		NULL
);


--CREATE TABLE "TBL_ADMIN" (
--	"ADMIN_NO"	NUMBER		NOT NULL,
--	"ADMIN_ID"	VARCHAR2(100)		NULL,
--	"ADMIN_PASSWORD"	VARCHAR2(200)		NULL,
--	"ADMIN_JOB"	CHAR(30)		NULL,
--	"ADMIN_DEPT"	CHAR(30)		NULL
--);

CREATE TABLE "NMT_MILE" (
	"MEMBER_CODE"	NUMBER		NOT NULL,
	"MILE_DATE"	DATE	DEFAULT SYSDATE	NULL,
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
	"IMG_CODE"	VARCHAR2(30),
    "IMG_NAME" varchar2(100)
);


CREATE TABLE "NMT_PACKAGELIST" (
	"PACKAGE_CODE"	VARCHAR2(100),
	"AIR_CODE_DEPART"	VARCHAR2(100),
    "AIR_CODE_ARRIVE"	VARCHAR2(100),
	"HOTEL_CODE"	VARCHAR2(100),
    "PLACE_CODE"	VARCHAR2(100)

);

--CREATE TABLE "NMT_CP" (
--	"CP_SERAIL"	VARCHAR2(200)		NOT NULL,
--	"MEMBER_CODE"	NUMBER		NOT NULL,
--	"CP_START"	DATE	DEFAULT SYSDATE	NULL,
--	"CP_END"	DATE	DEFAULT SYSDATE	NULL,
--	"CP_CATEGORY"	VARCHAR2(50)		NULL,
--	"CP_USED"	CHAR(1)		NULL,
--	"CP_ADMINCODE"	VARCHAR2(50)		NULL
--);


	

--SELECT * FROM tab;

--프라이머리키지정
--이름:pk_컬럼명 
--select * from tab;--모든테이블보기 
--select * from user_constraints where constraint_type='P';--프라이머리키만 보기 

alter table nmt_member add constraint pk_member_code primary key(member_code);
alter table nmt_package add constraint pk_package_code primary key(package_code);
alter table nmt_air add constraint pk_air_code primary key(air_code);
alter table nmt_place add constraint pk_place_code primary key(place_code);
alter table nmt_hotel add constraint pk_hotel_code primary key(hotel_code);
alter table nmt_distance add constraint pk_distance_level primary key(distance_level);
alter table nmt_adminboard add constraint pk_adminboard_no primary key(board_no);
alter table nmt_board add constraint pk_board_no primary key(board_no);


--alter table tbl_admin add constraint pk_admin_no primary key(admin_no);
--alter table nmt_cp add constraint pk_cp_serail primary key(cp_serail);
--alter table nmt_product add constraint pk_product_code primary key(p_code);
--alter table nmt_sales add constraint pk_order_no primary key(order_no);

--이름 : fk_nmt뺀 테이블명_키이름
--외래키 지정
--alter table nmt_adminboard add constraint fk_board_member_code foreign key(member_code) references nmt_member(member_code);

--alter table nmt_mile add constraint fk_mile_member_code foreign key(member_code) references nmt_member(member_code);
alter table nmt_package add constraint fk_package_member_code foreign key(member_code) references nmt_member(member_code);
alter table nmt_place add constraint fk_place_distance_level foreign key(distance_level) references nmt_distance(distance_level);
alter table nmt_hotel add constraint fk_hotel_distance_level foreign key(distance_level) references nmt_distance(distance_level);
alter table nmt_board add constraint fk_board_ref foreign key(board_ref) references nmt_board(board_no);

--alter table nmt_adminboard add constraint fk_board_board_cate foreign key(board_cate) references nmt_member(member_code);

--alter table nmt_sales add constraint fk_sales_member_code foreign key (member_code) references nmt_member(member_code);
--alter table nmt_sales add constraint fk_sales_p_code foreign key (p_code) references nmt_product(p_code);

--alter table nmt_cp add constraint fk_cp_member_code foreign key(member_code) references nmt_member(member_code);

--alter table nmt_packagelist add constraint fk_packagelist_package_code foreign key(package_code) references nmt_package(package_code);
--alter table nmt_packagelist add constraint fk_packagelist_air_code foreign key(air_code) references nmt_air(air_code);
--alter table nmt_packagelist add constraint fk_packagelist_place_code foreign key(place_code) references nmt_place(place_code);
--alter table nmt_packagelist add constraint fk_packagelist_hotel_code foreign key(hotel_code) references nmt_hotel(hotel_code);



--select * from user_constraints where constraint_type='R';
--select * from all_constraints where table_name = 'nmt_hotel';



insert into nmt_member values('1','admin','IRd8AqTzspEhd6QIv7+7+am9FrKg23+XTMFY0SyG1vms+KpwyIvFMP23JavTShKy0rK7JYQ3J9/tUBtuUqlXCQ==','관리자','01012341234','blacksnowman@kakao.com','서울시 강남구 테헤란로',sysdate , '10000',to_Date('20001231','yyyymmdd'));
commit;


insert into board_category values('A1' ,'notice','관리자 게시판');
insert into board_category values('B1', 'board', '후기 게시판');
insert into board_category values('C1','onetoone','QnA 문의 게시판');
insert into board_category values('D1', 'question','자주묻는 질문 게시판');

commit;



--거리정보테이블만들기
insert into nmt_distance values('GB1','1','London','ENGLAND');
insert into nmt_distance values('GB2','2','Edinburgh','ENGLAND');
insert into nmt_distance values('GB3','3','Manchester','ENGLAND');

insert into nmt_distance values('FR1','1','Paris','FRANCE');
insert into nmt_distance values('FR2','2','Nice','FRANCE');
insert into nmt_distance values('FR3','3','Lyon','FRANCE');

insert into nmt_distance values('CH1','1','Zurich','SWISS');
insert into nmt_distance values('CH2','2','Geneva','SWISS');
insert into nmt_distance values('CH3','3','Grindelwald','SWISS');

insert into nmt_distance(distance_level) values('users');
COMMIT;


--HOTEL INSERT
-- hotel_code / distance_level / hotel_name / nation_name / hotel_price / hotel_addr / hotel_score
select* from nmt_hotel;
commit;
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score, HOTEL_DAYS) values('htl-001','GB1','포인트 A 호텔 런던 킹스 크로스 - 세인트 팬크라스','england',137650, 'Swinton House, 324 Grays Inn Road 킹스 크로스 세인트 판크라스 런던 영국', 8, DEFAULT);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-002','GB1','웜뱃 시티 호스텔 런던','england',118739, '7 Dock Street, 타워 햄릿, 런던, 영국', 8.5);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-003','GB1','파크 플라자 런던 워털루','england',196522, '6 Hercules Road, 램버스 , 런던, 영국, SE1 7DU', 8.5);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-004','GB1','제너레이터 런던','england',80003, '37 Tavistock Place, Russell Square, 킹스 크로스 세인트 판크라스, 런던, 영국', 7.5);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-005','GB2','에덴 로크','england',153033, '127 George St., 뉴 타운, 에든버러, 영국', 9.2);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-006','GB2','이비스 에딘버그 센터 로얄 마일 - 헌터 스퀘어','england',103953, '6 Hunter Square, Off Royal Mile, 에든버러 올드타운, 에든버러, 영국', 8.7);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-007','GB2','더 발모랄 호텔','england',103953, '6 Hunter Square, Off Royal Mile, 에든버러 올드타운, 에든버러, 영국', 8.7);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-008','GB3','휘트워스 로케','england',116051, '74 Princess St, 맨체스터 시내, 맨체스터, 영국', 9.2);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-009','GB3','이비스 스타일 맨체스터 포트랜드','england',102034, '3- 5 Portland Street, 맨체스터 시내, 맨체스터, 영국', 8.5);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-010','GB3','시티스위트 아파트호텔','england',152924, '16 Chapel Street, 맨체스터 시내, 맨체스터, 영국', 9.3);

insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-101','FR1','호텔 투어리즘 애브뉴','france',210330, '66 avenue de la Motte Picquet, 15구 - 투르 에펠(에펠탑) - 포르트 드 베르사유, 파리, 프랑스', 8.7);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-102','FR1','하얏트 리젠시 파리 에투알','france',206418, '3, Place du Général Koenig, 17구 - 아크 드 트리옹프(개선문) - 팔레 데 콩그레, 파리, 프랑스', 8.5);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-103','FR1','시타딘 투어 에펠 파리','france',161756, '132 Boulevard De Grenelle, 15구 - 투르 에펠(에펠탑) - 포르트 드 베르사유, 파리, 프랑스', 9.5);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-104','FR1','스플렌디드 에뚜와예 호텔 파리','france',265021, '1 Avenue Carnot, 17구 - 아크 드 트리옹프(개선문) - 팔레 데 콩그레, 파리, 프랑스', 8.7);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-105','FR2','샤토 에자','france',551136, 'Rue De La Pise, 에즈, 빌프랑슈 쉬르 메르, 프랑스', 9);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-106','FR2','머큐어 니스 프로메나드 데장글레 호텔','france',265021, '2 rue Halevy, 니스 해안가, 니스, 프랑스', 8.2);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-107','FR2','호텔 라 빌라 니스 빅토 휴고','france',126845, '19 bis Boulevard Victor Hugo, 니스 시내, 니스, 프랑스', 8.8);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-108','FR3','래디슨 블루 호텔, 리옹','france',250828, '129 Rue Servient, 3구, 리옹, 프랑스,', 8.4);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-109','FR3','시타딘 프레스킬 리옹','france',124737, '2 Rue Thomassin, 2구, 리옹, 프랑스', 8.5);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-110','FR3','그랜드 호텔 데 테로','france',208198, '16, rue Lanterne, 1구, 리옹, 프랑스', 8.6);

insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-200','CH1','EMA 하우스 호텔 스위트','swiss',377742, 'Nordstrasse 1, 6. 운터스트라스 - 오버스트라스, 취리히, 스위스,', 9);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-201','CH1','호텔 몬타나 취리히','swiss',171440, 'Konradstrasse 39, 5. 게버베슐레 - 에셔 비스, 취리히, 스위스', 8.3);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-202','CH1','소렐 호텔 세이덴호프','swiss',228253, 'Sihlstrasse, 1. 라타우스 - 호크슐렌 - 린덴호프 시티, 취리히, 스위스', 8.5);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-203','CH1','호텔 두 씨어터','swiss',162783, 'Seilergraben 69, 1. 라타우스 - 호크슐렌 - 린덴호프 시티, 취리히, 스위스', 8.1);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-204','CH2','로얄 마노텔 호텔','swiss',198623, 'Rue de Lausanne 41-43, 제네바 시내, 제네바, 스위스', 8.1);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-205','CH2','호텔 코나빈','swiss',214518, '23 Blvd James-Fazy, 제네바 시내, 제네바, 스위스', 8.2);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-206','CH2','아다지오 제네바 몽 블랑 아파트호텔','swiss',177885, 'Rue Thalberg 4, 제네바 시내, 제네바, 스위스, 1201', 8.1);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-207','CH3','호텔 에이저','swiss',393871, 'Dorfstrasse 133, 그린델왈드 시티 센터, 그린델발트, 스위스', 8.8);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-208','CH3','호텔 뒤 소바주 그린델발트','swiss',284852, 'Tuftbach 4, 그린델왈드 시티 센터, 그린델발트, 스위스', 8.1);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-209','CH3','호텔 크로이츠 앤 포스트','swiss',295550, 'Dorfstrasse 85, 그린델왈드 시티 센터, 그린델발트, 스위스', 9);
COMMIT;



--nmt_place 샘플
insert into nmt_place 
values('plc-1','england','GB1','버킹엄궁전',0,'Constitution Hill, London SW1A 1AA, UK','https://www.royal.uk/search?tags%5B0%5D=Buckingham%20Palace');
insert into nmt_place 
values('plc-2','england','GB1','웨스트민스터 사원',0,'4 The Sanctuary, Westminster, London SW1P 3JS, UK','https://www.westminster-abbey.org/');
insert into nmt_place 
values('plc-3','england','GB1','국회 의사당',0,'Westminster, London SW1A 0RS, UK','https://www.parliament.uk/');
insert into nmt_place 
values('plc-4','england','GB1','빅벤',0,'6 Bridge Street, Westminster, London SW1A 2PW, UK','www.parliament.uk/bigben');
insert into nmt_place 
values('plc-5','england','GB2','웨스트민스터 대성당',0,'1 Ambrosden Avenue, Westminster, London SW1P, UK','http://www.westminstercathedral.org.uk/');
insert into nmt_place 
values('plc-6','england','GB2','해리포터 스튜디오',38000,'Aerodrome Way, Watford, Hertfordshire WD25, UK','www.wbstudiotour.co.uk/en/');
insert into nmt_place 
values('plc-7','england','GB2','레 미제라블 공연장(퀸즈극장)',90000,'4 Wardour Street, Soho, London W1D, UK','www.delfontmackintosh.co.uk');
insert into nmt_place 
values('plc-8','england','GB2','빅토리아 앨버트 박물관',0,'Cromwell Gardens, Kensington, London SW7, UK','www.vam.ac.uk');
insert into nmt_place 
values('plc-9','england','GB3','그리니치 천문대',20000,'Blackheath Avenue, London SE10 8XJ, UK','www.rmg.co.uk');
insert into nmt_place 
values('plc-10','england','GB3','코톨드 갤러리',10000,'Franklin House, 151 Strand, London WC2R 1HL, UK','www.courtauld.ac.uk');
insert into nmt_place 
values('plc-11','england','GB3','위키드 공연장',0,'17 Wilton Road, Pimlico, London SW1V 1LG, UK','www.atgtickets.com/venues/apollo-victoria-theatre/');
insert into nmt_place 
values('plc-12','england','GB3','맘마미아 공연장(노벨로 극장)',0,'7-9 Aldwych, London WC2B 4DA, UK','www.delfontmackintosh.co.uk/Theatres/novello_theatre.asp');


insert into nmt_place 
values('plc-13','france','FR1','에펠탑',0,'4 Avenue Pierre Loti, 75007 Paris, France','www.tour-eiffel.fr');
insert into nmt_place 
values('plc-14','france','FR1','루브르박물관',40000,'4 Place du Louvre, 75001 Paris, France','www.louvre.fr');
insert into nmt_place 
values('plc-15','france','FR1','노트르담 대성당',0,'12 Rue du Cloître Notre Dame, 75004 Paris, France','www.notredamedeparis.fr');
insert into nmt_place 
values('plc-16','france','FR1','뤽상부르공원',0,'62 Boulevard Saint-Michel, Paris School of Mines, 75006 Paris, France','www.senat.fr/visite/jardin/');
insert into nmt_place 
values('plc-17','france','FR2','오랑주리 미술관',20000,'Terrasse du Bord de lEau, 75001 Paris, France','www.musee-orangerie.fr');
insert into nmt_place 
values('plc-18','france','FR2','샹드마르스 공원',0,'Avenue Anatole France, 75007 Paris, France','equipement.paris.fr/jardin-du-champ-de-mars-1807');
insert into nmt_place 
values('plc-19','france','FR2','고흐의 집',20000,'54 Rue du Général de Gaulle, 95430 Auvers-sur-Oise, France','www.maisondevangogh.fr');
insert into nmt_place 
values('plc-20','france','FR2','자연사 박물관',15000,'16 Rue Cuvier, 75005 Paris, France','www.mnhn.fr/le-museum/');
insert into nmt_place 
values('plc-21','france','FR3','바스티유 오페라',100000,'18 Rue de Charenton, 75012 Paris, France','www.operadeparis.fr');
insert into nmt_place 
values('plc-22','france','FR3','오를리 공항',0,'Avenue Sud, Orly Airport, 94390 Paray-Vieille-Poste, France','www.aeroportsdeparis.fr/adp/fr-fr/Passagers/Accueil/');
insert into nmt_place 
values('plc-23','france','FR3','벨쿠르 광장',0,'8 Bellecour Square, 69002 Lyon, France','www.visitelyon.fr/bellecour-terreaux/place-bellecour.php');
insert into nmt_place 
values('plc-24','france','FR3','생 장 대성당(리옹대성당)',0,'Saint-Jean Square, 69005 Lyon, France','http://cathedrale-lyon.cef.fr/');



insert into nmt_place 
values('plc-25','swiss','CH1','장난감 박물관',0,'Fortunagasse 15, 8001 Zurich, Switzerland','www.zuercher-spielzeugmuseum.ch');
insert into nmt_place 
values('plc-26','swiss','CH1','스핑크스 전망대',0,'Wasserstation, 3823 Lauterbrunnen, Switzerland',' ');
insert into nmt_place 
values('plc-27','swiss','CH1','스위스국립 박물관',0,'Museumstrasse 2, 8001 Zurich, Switzerland','www.musee-suisse.ch/e/index.php');
insert into nmt_place 
values('plc-28','swiss','CH1','오페라하우스',0,'Theaterplatz 1, 8001 Zurich, Switzerland','www.opernhaus.ch');
insert into nmt_place 
values('plc-29','swiss','CH2','취리히 미술관',15000,'Heimplatz 1, 8001 Zurich, Switzerland','www.kunsthaus.ch');
insert into nmt_place 
values('plc-30','swiss','CH2','알핀 래프트',0,'Hauptstrasse 7, 3800 Matten bei Interlaken, Switzerland','alpinraft.ch');
insert into nmt_place 
values('plc-31','swiss','CH2','스카이윙스 어드밴처',100000,'Höheweg 37, 3800 Interlaken, Switzerland','www.skywings.ch');
insert into nmt_place 
values('plc-32','swiss','CH2','취리히 동물원',20000,'Klosterweg 20, 8044 Zurich, Switzerland','www.zoo.ch/xml_1/internet/de/intro.cfm');
insert into nmt_place 
values('plc-33','swiss','CH3','트램박물관',0,'Forchstrasse 260, 8008 Zurich, Switzerland','www.tram-museum.ch/content.php?id=3');
insert into nmt_place 
values('plc-34','swiss','CH3','의학역사 박물관',50000,'Rämistrasse 69, Universität Zürich, 8001 Zurich, Switzerland','www.mhiz.uzh.ch/Museum.html');
insert into nmt_place 
values('plc-35','swiss','CH3','스위스 카지노 취리히',0,'Gessnerallee 1, 8001 Zurich, Switzerland','www.swisscasinos.ch/sczh-casino-zuerich.html');
insert into nmt_place 
values('plc-36','swiss','CH3','선인장 식물원',20000,'Mythenquai 88, 8002 Zurich, Switzerland','www.stadt-zuerich.ch/sukkulenten.secure.html');

COMMIT;



--nmt_images 샘플
insert into nmt_images values('plc-1','uk_1');
insert into nmt_images values('plc-2','uk_2');
insert into nmt_images values('plc-3','uk_3');
insert into nmt_images values('plc-4','uk_4');
insert into nmt_images values('plc-5','uk_5');
insert into nmt_images values('plc-6','uk_6');
insert into nmt_images values('plc-7','uk_7');
insert into nmt_images values('plc-8','uk_8');
insert into nmt_images values('plc-9','uk_9');
insert into nmt_images values('plc-10','uk_10');
insert into nmt_images values('plc-11','uk_11');
insert into nmt_images values('plc-12','uk_12');
insert into nmt_images values('plc-13','frc_1');
insert into nmt_images values('plc-14','frc_2');
insert into nmt_images values('plc-15','frc_3');
insert into nmt_images values('plc-16','frc_4');
insert into nmt_images values('plc-17','frc_5');
insert into nmt_images values('plc-18','frc_6');
insert into nmt_images values('plc-19','frc_7');
insert into nmt_images values('plc-20','frc_8');
insert into nmt_images values('plc-21','frc_9');
insert into nmt_images values('plc-22','frc_10');
insert into nmt_images values('plc-23','frc_11');
insert into nmt_images values('plc-24','frc_12');
insert into nmt_images values('plc-25','che_1');
insert into nmt_images values('plc-26','che_2');
insert into nmt_images values('plc-27','che_3');
insert into nmt_images values('plc-28','che_4');
insert into nmt_images values('plc-29','che_5');
insert into nmt_images values('plc-30','che_6');
insert into nmt_images values('plc-31','che_7');
insert into nmt_images values('plc-32','che_8');
insert into nmt_images values('plc-33','che_9');
insert into nmt_images values('plc-34','che_10');
insert into nmt_images values('plc-35','che_11');
insert into nmt_images values('plc-36','che_12');

COMMIT;




--sequence
create SEQUENCE seq_member_code start with 10000001 MAXVALUE 10009999;
create SEQUENCE seq_board_no start with 1;
commit;

--qna query
--select * from nmt_board where board_cate = 'c1';
--
--select * from nmt_board start with board_level = 1 connect by prior board_no = board_ref order siblings by board_no desc;
--
--select lpad(' ',(level-1)*5) || BOARD_TITLE, B.* from nmt_board B start with board_level =1 connect by prior board_no = board_ref order siblings by board_no desc;
--
--SELECT * FROM ( SELECT ROWNUM AS RNUM, V.* FROM( select * from nmt_board start with board_level = 1 connect by prior board_no = board_ref order siblings by board_no desc) V ) V WHERE RNUM BETWEEN ? and ?



--SELECT* FROM NMT_AIR;
-- INCHEON - ENGLAND
insert into nmt_air values('air-0001', 'incheon', 'england', 'KE907', 442300, 'koreaair', to_date('202002191300','yyyyMMddHH24MI'), to_date('202002201030','yyyymmddhh24mi'));
insert into nmt_air values('air-0002', 'incheon', 'england', 'OZ716', 451500, 'asianaair', to_date('202002191045','yyyyMMddHH24MI'), to_date('202002200215','yyyymmddhh24mi'));
insert into nmt_air values('air-0003', 'incheon', 'england', 'BA18', 553600, 'engair', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002201430','yyyymmddhh24mi'));

insert into nmt_air values('air-0004', 'england', 'incheon', 'KE908', 342300, 'koreaair', to_date('202002241800','yyyyMMddHH24MI'), to_date('202002251430','yyyymmddhh24mi'));
insert into nmt_air values('air-0005', 'england', 'incheon', 'OZ522', 551500, 'asianaair', to_date('202002242010','yyyyMMddHH24MI'), to_date('202002251605','yyyymmddhh24mi'));
insert into nmt_air values('air-0006', 'england', 'incheon', 'BA18', 353600, 'engair', to_date('202002241245','yyyyMMddHH24MI'), to_date('202002252045','yyyymmddhh24mi'));


--INCHEON SWISS 
insert into nmt_air values('air-0007', 'incheon', 'swiss', 'KE917', 325000, 'koreaair', to_date('202002191220','yyyyMMddHH24MI'), to_date('202002201730','yyyymmddhh24mi'));
insert into nmt_air values('air-0008', 'incheon', 'swiss', 'OZ316', 441500, 'asianaair', to_date('202002191005','yyyyMMddHH24MI'), to_date('202002201515','yyyymmddhh24mi'));
insert into nmt_air values('air-0009', 'incheon', 'swiss', 'LO98', 486000, 'polair', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002201640','yyyymmddhh24mi'));

insert into nmt_air values('air-0010', 'swiss', 'incheon', 'KE916', 463000, 'koreaair', to_date('202002241100','yyyyMMddHH24MI'), to_date('202002251350','yyyymmddhh24mi'));
insert into nmt_air values('air-0011', 'swiss', 'incheon', 'OZ654', 381500, 'asianaair', to_date('202002240905','yyyyMMddHH24MI'), to_date('202002251415','yyyymmddhh24mi'));
insert into nmt_air values('air-0012', 'swiss', 'incheon', 'LO87', 446000, 'polair', to_date('202002241700','yyyyMMddHH24MI'), to_date('202002252340','yyyymmddhh24mi'));

--INCHEON-FRANCE
insert into nmt_air values('air-0013', 'incheon', 'france', 'KE591', 525000, 'koreaair', to_date('202002190955','yyyyMMddHH24MI'), to_date('202002201420','yyyymmddhh24mi'));
insert into nmt_air values('air-0014', 'incheon', 'france', 'OZ501', 390800, 'asianaair', to_date('202002191230','yyyyMMddHH24MI'), to_date('202002201700','yyyymmddhh24mi'));
insert into nmt_air values('air-0015', 'incheon', 'france', 'AF267', 400500, 'frnair', to_date('202002191000','yyyyMMddHH24MI'), to_date('202002201425','yyyymmddhh24mi'));

insert into nmt_air values('air-0016', 'france', 'incheon', 'KE917', 463000, 'koreaair', to_date('202002241100','yyyyMMddHH24MI'), to_date('202002251350','yyyymmddhh24mi'));
insert into nmt_air values('air-0017', 'france', 'incheon', 'OZ502', 381500, 'asianaair', to_date('202002241905','yyyyMMddHH24MI'), to_date('202002251355','yyyymmddhh24mi'));
insert into nmt_air values('air-0018', 'france', 'incheon', 'AF298', 446000, 'frnair', to_date('202002241300','yyyyMMddHH24MI'), to_date('202002252010','yyyymmddhh24mi'));

-----------------------------------10
-- INCHEON - ENGLAND
/*insert into nmt_air values('air-0019', 'incheon', 'england', 'KE907', 442300, 'koreaair', to_date('202002191300','yyyyMMddHH24MI'), to_date('202002201630','yyyymmddhh24mi'));
insert into nmt_air values('air-0020', 'incheon', 'england', 'OZ716', 451500, 'asianaair', to_date('202002191045','yyyyMMddHH24MI'), to_date('202002201415','yyyymmddhh24mi'));
insert into nmt_air values('air-0021', 'incheon', 'england', 'BA18', 553600, 'engair', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002201430','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0019', 'england', 'incheon', 'KE908', 342300, 'koreaair', to_date('202002291800','yyyyMMddHH24MI'), to_date('202003011430','yyyymmddhh24mi'));
insert into nmt_air values('air-0020', 'england', 'incheon', 'OZ522', 551500, 'asianaair', to_date('202002292010','yyyyMMddHH24MI'), to_date('202003011605','yyyymmddhh24mi'));
insert into nmt_air values('air-0021', 'england', 'incheon', 'BA18', 353600, 'engair', to_date('202002291245','yyyyMMddHH24MI'), to_date('202003012045','yyyymmddhh24mi'));


--INCHEON SWISS 
/*insert into nmt_air values('air-0025', 'incheon', 'swiss', 'KE917', 325000, 'koreaair', to_date('202002191220','yyyyMMddHH24MI'), to_date('202002201730','yyyymmddhh24mi'));
insert into nmt_air values('air-0026', 'incheon', 'swiss', 'OZ316', 441500, 'asianaair', to_date('202002191005','yyyyMMddHH24MI'), to_date('202002201515','yyyymmddhh24mi'));
insert into nmt_air values('air-0027', 'incheon', 'swiss', 'LO98', 486000, 'polair', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002201640','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0022', 'swiss', 'incheon', 'KE916', 463000, 'koreaair', to_date('202002291100','yyyyMMddHH24MI'), to_date('202003011350','yyyymmddhh24mi'));
insert into nmt_air values('air-0023', 'swiss', 'incheon', 'OZ654', 381500, 'asianaair', to_date('202002290905','yyyyMMddHH24MI'), to_date('202003011415','yyyymmddhh24mi'));
insert into nmt_air values('air-0024', 'swiss', 'incheon', 'LO87', 446000, 'polair', to_date('202002291700','yyyyMMddHH24MI'), to_date('202003012340','yyyymmddhh24mi'));

--INCHEON-FRANCE
/*insert into nmt_air values('air-0031', 'incheon', 'france', 'KE591', 525000, 'koreaair', to_date('202002190955','yyyyMMddHH24MI'), to_date('202002201420','yyyymmddhh24mi'));
insert into nmt_air values('air-0032', 'incheon', 'france', 'OZ501', 390800, 'asianaair', to_date('202002191230','yyyyMMddHH24MI'), to_date('202002201700','yyyymmddhh24mi'));
insert into nmt_air values('air-0033', 'incheon', 'france', 'AF267', 400500, 'frnair’, to_date('202002191000','yyyyMMddHH24MI'), to_date('202002201425','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0025', 'france', 'incheon', 'KE917', 463000, 'koreaair', to_date('202002291100','yyyyMMddHH24MI'), to_date('202003011350','yyyymmddhh24mi'));
insert into nmt_air values('air-0026', 'france', 'incheon', 'OZ502', 381500, 'asianaair', to_date('202002291905','yyyyMMddHH24MI'), to_date('202003011355','yyyymmddhh24mi'));
insert into nmt_air values('air-0027', 'france', 'incheon', 'AF298', 446000, 'frnair', to_date('202002291300','yyyyMMddHH24MI'), to_date('202003012010','yyyymmddhh24mi'));


---------------------------------15

-- INCHEON - ENGLAND
/*insert into nmt_air values('air-0019', 'incheon', 'england', 'KE907', 442300, 'koreaair', to_date('202002191300','yyyyMMddHH24MI'), to_date('202002201630','yyyymmddhh24mi'));
insert into nmt_air values('air-0020', 'incheon', 'england', 'OZ716', 451500, 'asianaair', to_date('202002191045','yyyyMMddHH24MI'), to_date('202002201415','yyyymmddhh24mi'));
insert into nmt_air values('air-0021', 'incheon', 'england', 'BA18', 553600, 'engair', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002201430','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0028', 'england', 'incheon', 'KE908', 342300, 'koreaair', to_date('202003051800','yyyyMMddHH24MI'), to_date('202003061430','yyyymmddhh24mi'));
insert into nmt_air values('air-0029', 'england', 'incheon', 'OZ522', 551500, 'asianaair', to_date('202003052010','yyyyMMddHH24MI'), to_date('202003061605','yyyymmddhh24mi'));
insert into nmt_air values('air-0030', 'england', 'incheon', 'BA18', 353600, 'engair', to_date('202003051245','yyyyMMddHH24MI'), to_date('202003062045','yyyymmddhh24mi'));


--INCHEON SWISS 
/*insert into nmt_air values('air-0025', 'incheon', 'swiss', 'KE917', 325000, 'koreaair', to_date('202002191220','yyyyMMddHH24MI'), to_date('202002191730','yyyymmddhh24mi'));
insert into nmt_air values('air-0026', 'incheon', 'swiss', 'OZ316', 441500, 'asianaair', to_date('202002191005','yyyyMMddHH24MI'), to_date('202002191515','yyyymmddhh24mi'));
insert into nmt_air values('air-0027', 'incheon', 'swiss', 'LO98', 486000, 'polair', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002191640','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0031', 'swiss', 'incheon', 'KE916', 463000, 'koreaair', to_date('202003051100','yyyyMMddHH24MI'), to_date('202003061350','yyyymmddhh24mi'));
insert into nmt_air values('air-0032', 'swiss', 'incheon', 'OZ654', 381500, 'asianaair', to_date('202003050905','yyyyMMddHH24MI'), to_date('202003061415','yyyymmddhh24mi'));
insert into nmt_air values('air-0033', 'swiss', 'incheon', 'LO87', 446000, 'polair', to_date('202003051700','yyyyMMddHH24MI'), to_date('202003062340','yyyymmddhh24mi'));

--INCHEON-FRANCE
/*insert into nmt_air values('air-0031', 'incheon', 'france', 'KE591', 525000, 'koreaair', to_date('202002190955','yyyyMMddHH24MI'), to_date('202002191420','yyyymmddhh24mi'));
insert into nmt_air values('air-0032', 'incheon', 'france', 'OZ501', 390800, 'asianaair', to_date('202002191230','yyyyMMddHH24MI'), to_date('202002191700','yyyymmddhh24mi'));
insert into nmt_air values('air-0033', 'incheon', 'france', 'AF267', 400500, 'frnair’, to_date('202002191000','yyyyMMddHH24MI'), to_date('202002191425','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0034', 'france', 'incheon', 'KE917', 463000, 'koreaair', to_date('202003051100','yyyyMMddHH24MI'), to_date('202003061350','yyyymmddhh24mi'));
insert into nmt_air values('air-0035', 'france', 'incheon', 'OZ502', 381500, 'asianaair', to_date('202003051905','yyyyMMddHH24MI'), to_date('202003061355','yyyymmddhh24mi'));
insert into nmt_air values('air-0036', 'france', 'incheon', 'AF298', 446000, 'frnair', to_date('202003051300','yyyyMMddHH24MI'), to_date('202003062010','yyyymmddhh24mi'));


COMMIT;




--======================================================================================

-- BUSAN - ENGLAND
insert into nmt_air values('air-0037', 'busan', 'england', 'KE907', 442300, 'koreaair', to_date('202002191300','yyyyMMddHH24MI'), to_date('202002201030','yyyymmddhh24mi'));
insert into nmt_air values('air-0038', 'busan', 'england', 'OZ716', 451500, 'asianaair', to_date('202002191045','yyyyMMddHH24MI'), to_date('202002200215','yyyymmddhh24mi'));
insert into nmt_air values('air-0039', 'busan', 'england', 'BA18', 553600, 'engair', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002201430','yyyymmddhh24mi'));

insert into nmt_air values('air-0040', 'england', 'busan', 'KE908', 342300, 'koreaair', to_date('202002241800','yyyyMMddHH24MI'), to_date('202002251430','yyyymmddhh24mi'));
insert into nmt_air values('air-0041', 'england', 'busan', 'OZ522', 551500, 'asianaair', to_date('202002242010','yyyyMMddHH24MI'), to_date('202002251605','yyyymmddhh24mi'));
insert into nmt_air values('air-0042', 'england', 'busan', 'BA18', 353600, 'engair', to_date('202002241245','yyyyMMddHH24MI'), to_date('202002252045','yyyymmddhh24mi'));


--—BUSAN -  SWISS 
insert into nmt_air values('air-0043', 'busan', 'swiss', 'KE917', 325000, 'koreaair', to_date('202002191220','yyyyMMddHH24MI'), to_date('202002201730','yyyymmddhh24mi'));
insert into nmt_air values('air-0044', 'busan', 'swiss', 'OZ316', 441500, 'asianaair', to_date('202002191005','yyyyMMddHH24MI'), to_date('202002201515','yyyymmddhh24mi'));
insert into nmt_air values('air-0045', 'busan', 'swiss', 'LO98', 486000, 'polair', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002201640','yyyymmddhh24mi'));

insert into nmt_air values('air-0046', 'swiss', 'busan', 'KE916', 463000, 'koreaair', to_date('202002241100','yyyyMMddHH24MI'), to_date('202002251350','yyyymmddhh24mi'));
insert into nmt_air values('air-0047', 'swiss', 'busan', 'OZ654', 381500, 'asianaair', to_date('202002240905','yyyyMMddHH24MI'), to_date('202002251415','yyyymmddhh24mi'));
insert into nmt_air values('air-0048', 'swiss', 'busan', 'LO87', 446000, 'polair', to_date('202002241700','yyyyMMddHH24MI'), to_date('202002252340','yyyymmddhh24mi'));

--BUSAN-FRANCE
insert into nmt_air values('air-0049', 'busan', 'france', 'KE591', 525000, 'koreaair', to_date('202002190955','yyyyMMddHH24MI'), to_date('202002201420','yyyymmddhh24mi'));
insert into nmt_air values('air-0050', 'busan', 'france', 'OZ501', 390800, 'asianaair', to_date('202002191230','yyyyMMddHH24MI'), to_date('202002201700','yyyymmddhh24mi'));
insert into nmt_air values('air-0051', 'busan', 'france', 'AF267', 400500, 'frnair', to_date('202002191000','yyyyMMddHH24MI'), to_date('202002201425','yyyymmddhh24mi'));

insert into nmt_air values('air-0052', 'france', 'busan', 'KE917', 463000, 'koreaair', to_date('202002241100','yyyyMMddHH24MI'), to_date('202002251350','yyyymmddhh24mi'));
insert into nmt_air values('air-0053', 'france', 'busan', 'OZ502', 381500, 'asianaair', to_date('202002241905','yyyyMMddHH24MI'), to_date('202002251355','yyyymmddhh24mi'));
insert into nmt_air values('air-0054', 'france', 'busan', 'AF298', 446000, 'frnair', to_date('202002241300','yyyyMMddHH24MI'), to_date('202002252010','yyyymmddhh24mi'));

-----------------------------------10
-- BUSAN - ENGLAND
/*insert into nmt_air values('air-0019', 'busan', 'england', 'KE907', 442300, 'koreaair', to_date('202002191300','yyyyMMddHH24MI'), to_date('202002201630','yyyymmddhh24mi'));
insert into nmt_air values('air-0020', 'busan', 'england', 'OZ716', 451500, 'asianaair', to_date('202002191045','yyyyMMddHH24MI'), to_date('202002201415','yyyymmddhh24mi'));
insert into nmt_air values('air-0021', 'busan', 'england', 'BA18', 553600, 'engair', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002201430','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0055', 'england', 'busan', 'KE908', 342300, 'koreaair', to_date('202002291800','yyyyMMddHH24MI'), to_date('202003011430','yyyymmddhh24mi'));
insert into nmt_air values('air-0056', 'england', 'busan', 'OZ522', 551500, 'asianaair', to_date('202002292010','yyyyMMddHH24MI'), to_date('202003011605','yyyymmddhh24mi'));
insert into nmt_air values('air-0057', 'england', 'busan', 'BA18', 353600, 'engair', to_date('202002291245','yyyyMMddHH24MI'), to_date('202003012045','yyyymmddhh24mi'));


--—BUSAN -  SWISS 
/*insert into nmt_air values('air-0025', 'busan', 'swiss', 'KE917', 325000, 'koreaair', to_date('202002191220','yyyyMMddHH24MI'), to_date('202002201730','yyyymmddhh24mi'));
insert into nmt_air values('air-0026', 'busan', 'swiss', 'OZ316', 441500, 'asianaair', to_date('202002191005','yyyyMMddHH24MI'), to_date('202002201515','yyyymmddhh24mi'));
insert into nmt_air values('air-0027', 'busan', 'swiss', 'LO98', 486000, 'polair', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002201640','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0058', 'swiss', 'busan', 'KE916', 463000, 'koreaair', to_date('202002291100','yyyyMMddHH24MI'), to_date('202003011350','yyyymmddhh24mi'));
insert into nmt_air values('air-0059', 'swiss', 'busan', 'OZ654', 381500, 'asianaair', to_date('202002290905','yyyyMMddHH24MI'), to_date('202003011415','yyyymmddhh24mi'));
insert into nmt_air values('air-0060', 'swiss', 'busan', 'LO87', 446000, 'polair', to_date('202002291700','yyyyMMddHH24MI'), to_date('202003012340','yyyymmddhh24mi'));


commit;
--BUSAN-FRANCE
/*insert into nmt_air values('air-0031', 'busan', 'france', 'KE591', 525000, 'koreaair', to_date('202002190955','yyyyMMddHH24MI'), to_date('202002201420','yyyymmddhh24mi'));
insert into nmt_air values('air-0032', 'busan', 'france', 'OZ501', 390800, 'asianaair', to_date('202002191230','yyyyMMddHH24MI'), to_date('202002201700','yyyymmddhh24mi'));
insert into nmt_air values('air-0033', 'busan', 'france', 'AF267', 400500, 'frnair’, to_date('202002191000','yyyyMMddHH24MI'), to_date('202002201425','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0061', 'france', 'busan', 'KE917', 463000, 'koreaair', to_date('202002291100','yyyyMMddHH24MI'), to_date('202003011350','yyyymmddhh24mi'));
insert into nmt_air values('air-0062', 'france', 'busan', 'OZ502', 381500, 'asianaair', to_date('202002291905','yyyyMMddHH24MI'), to_date('202003011355','yyyymmddhh24mi'));
insert into nmt_air values('air-0063', 'france', 'busan', 'AF298', 446000, 'frnair', to_date('202002291300','yyyyMMddHH24MI'), to_date('202003012010','yyyymmddhh24mi'));


---------------------------------15

-- BUSAN - ENGLAND
/*insert into nmt_air values('air-0019', 'busan', 'england', 'KE907', 442300, 'koreaair', to_date('202002191300','yyyyMMddHH24MI'), to_date('202002201630','yyyymmddhh24mi'));
insert into nmt_air values('air-0020', 'busan', 'england', 'OZ716', 451500, 'asianaair', to_date('202002191045','yyyyMMddHH24MI'), to_date('202002201415','yyyymmddhh24mi'));
insert into nmt_air values('air-0021', 'busan', 'england', 'BA18', 553600, 'engair', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002201430','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0064', 'england', 'busan', 'KE908', 342300, 'koreaair', to_date('202003051800','yyyyMMddHH24MI'), to_date('202003061430','yyyymmddhh24mi'));
insert into nmt_air values('air-0065', 'england', 'busan', 'OZ522', 551500, 'asianaair', to_date('202003052010','yyyyMMddHH24MI'), to_date('202003061605','yyyymmddhh24mi'));
insert into nmt_air values('air-0066', 'england', 'busan', 'BA18', 353600, 'engair', to_date('202003051245','yyyyMMddHH24MI'), to_date('202003062045','yyyymmddhh24mi'));


---—BUSAN -  SWISS -
/*insert into nmt_air values('air-0025', 'busan', 'swiss', 'KE917', 325000, 'koreaair', to_date('202002191220','yyyyMMddHH24MI'), to_date('202002191730','yyyymmddhh24mi'));
insert into nmt_air values('air-0026', 'busan', 'swiss', 'OZ316', 441500, 'asianaair', to_date('202002191005','yyyyMMddHH24MI'), to_date('202002191515','yyyymmddhh24mi'));
insert into nmt_air values('air-0027', 'busan', 'swiss', 'LO98', 486000, 'polair', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002191640','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0067', 'swiss', 'busan', 'KE916', 463000, 'koreaair', to_date('202003051100','yyyyMMddHH24MI'), to_date('202003061350','yyyymmddhh24mi'));
insert into nmt_air values('air-0068', 'swiss', 'busan', 'OZ654', 381500, 'asianaair', to_date('202003050905','yyyyMMddHH24MI'), to_date('202003061415','yyyymmddhh24mi'));
insert into nmt_air values('air-0069', 'swiss', 'busan', 'LO87', 446000, 'polair', to_date('202003051700','yyyyMMddHH24MI'), to_date('202003062340','yyyymmddhh24mi'));

--BUSAN-FRANCE
/*insert into nmt_air values('air-0031', 'busan', 'france', 'KE591', 525000, 'koreaair', to_date('202002190955','yyyyMMddHH24MI'), to_date('202002191420','yyyymmddhh24mi'));
insert into nmt_air values('air-0032', 'busan', 'france', 'OZ501', 390800, 'asianaair', to_date('202002191230','yyyyMMddHH24MI'), to_date('202002191700','yyyymmddhh24mi'));
insert into nmt_air values('air-0033', 'busan', 'france', 'AF267', 400500, 'frnair’, to_date('202002191000','yyyyMMddHH24MI'), to_date('202002191425','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0070', 'france', 'busan', 'KE917', 463000, 'koreaair', to_date('202003051100','yyyyMMddHH24MI'), to_date('202003061350','yyyymmddhh24mi'));
insert into nmt_air values('air-0071', 'france', 'busan', 'OZ502', 381500, 'asianaair', to_date('202003051905','yyyyMMddHH24MI'), to_date('202003061355','yyyymmddhh24mi'));
insert into nmt_air values('air-0072', 'france', 'busan', 'AF298', 446000, 'frnair', to_date('202003051300','yyyyMMddHH24MI'), to_date('202003062010','yyyymmddhh24mi'));
-----
--select * from nmt_air where to_char(air_depart) = to_date('2020-02-19');


--select to_char(air_depart) from nmt_air where to_char(air_depart) = '20/02/19';

commit;




--====================================================
-- 02 14 추가
--====================================================
select * from nmt_mile;
--테스트회원 insert
insert into nmt_member values(seq_member_code.nextval,'test123','IRd8AqTzspEhd6QIv7+7+am9FrKg23+XTMFY0SyG1vms+KpwyIvFMP23JavTShKy0rK7JYQ3J9/tUBtuUqlXCQ==','테스트','01012341234','test@naver.com','서울특별시 광진구 아차산로 244, 11 (자양동)',default,'0',to_date('1999-02-22'));
insert into nmt_member values(seq_member_code.nextval,'test456','IRd8AqTzspEhd6QIv7+7+am9FrKg23+XTMFY0SyG1vms+KpwyIvFMP23JavTShKy0rK7JYQ3J9/tUBtuUqlXCQ==','테스트원','01012341234','test@naver.com','서울특별시 광진구 아차산로 244, 11 (자양동)',default,'0',to_date('1999-02-22'));
insert into nmt_member values(seq_member_code.nextval,'test789','IRd8AqTzspEhd6QIv7+7+am9FrKg23+XTMFY0SyG1vms+KpwyIvFMP23JavTShKy0rK7JYQ3J9/tUBtuUqlXCQ==','테스트투','01012341234','test@naver.com','서울특별시 광진구 아차산로 244, 11 (자양동)',default,'0',to_date('1999-02-22'));
insert into nmt_member values(seq_member_code.nextval,'test123456','IRd8AqTzspEhd6QIv7+7+am9FrKg23+XTMFY0SyG1vms+KpwyIvFMP23JavTShKy0rK7JYQ3J9/tUBtuUqlXCQ==','테스트삼','01012341234','test@naver.com','서울특별시 광진구 아차산로 244, 11 (자양동)',default,'0',to_date('1999-02-22'));

--리뷰게시판 insert
insert into nmt_board values(seq_board_no.nextval,'10000001','B1','Good Value For Money','가격대비 최고라고 단언할수있습니다.','hotel_1.jpg','hotel_1.jpg',default,157,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000002','B1','생각보다 너무 만족스러워요!!','저렴하길래 기대안하고갔는데 너무만족스러웠습니다.','hotel_2.jpg','hotel_2.jpg',default,35,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000003','B1','최선의 가격에 최고의 선택!!','저의 선택이 최고가 될수있게 해주셔서 감사합니다.','hotel_3.jpg','hotel_3.jpg',default,46,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000001','B1','Best of Best','Good!!!!!!!!!!','hotel_4.jpg','hotel_4.jpg',default,10,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000002','B1','너무만족스러운 여행이되었어요','가족여행에 행복한 추억을 남겨주셔서 감사합니다.','hotel_5.jpg','hotel_5.jpg',default,10,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000003','B1','세상에!!','정말정말 너무너무 좋았습니다!!','hotel_6.jpg','hotel_6.jpg',default,10,default,null);

--공지사항
insert into nmt_adminboard values(seq_board_no.nextval,'1','A1','NMT에서 상품 예약 시 혜택을 안내해드립니다.',
                                '안녕하세요.åNMT에서 상품을 예약할 경우 혜택을 안내드립니다.åå1. 여행일정을 빠르게 선택할 수 있도록 도와드립니다.å
                                항공권, 호텔, 관광지 등을 원하시는 조건에 맞추어 여행일정을 짜드립니다.åå2. 여행예약일이 주말인 경우에도 CS응대를 해드립니다. å
                                현지에서 궁금하신 사항이나 문의가 있으신경우 연락이 가능해 집니다.åå3. 구매 시 적립되는 마일리지는 현금처럼 사용 가능합니다.åå감사합니다.
                                åå싸고 쉬운 여행åNo Money Trip',
                                null, null, to_date('20191231','yyyymmdd'), 452);
insert into nmt_adminboard values(seq_board_no.nextval,'1','A1','설 명절기간 업무안내(2.2 ~ 2.6)',
                                '안녕하세요. NMT입니다.å설 명절기간 업무관련 공지드립니다.ååNMT는 설 명절기간에도 저희를 통해 여행을 다녀오시는 고객이 있는 관계로å
                                상담 및 문의관련 업무를 정상적으로 하기로 결정하였습니다.åå홈페이지를 통한 상담이 가능하니 편하게 연락바랍니다.åå
                                다만 호텔, 액티비티의 예약은 미리가능은 하나å2월7일 이후 부터 순차적으로 처리됩니다.åå감사합니다.
                                åå싸고 쉬운 여행åNo Money Trip',
                                null, null, to_date('20200201','yyyymmdd'), 127);
insert into nmt_adminboard values(seq_board_no.nextval,'1','A1','NMT 서비스종료 안내',
                                '안녕하세요. NMT입니다.å싸고 쉬운 멋진 여행플랜을 짜드리던 저희 NMT는å이번 달 19일 발표를 하자마자 서비스 종료될 예정입니다.åå
                                저희 서비스를 이용하셔서 좋은 추억이 쌓였길 바라며å항상 고객님들께 감사드립니다.åå
                                안녕히 계세요 여러분~~~ 저희는 이 세상의 모든å굴레와 속박을 벗어던지고 새로운 굴레와 속박을 찾아 떠납니다~~~åå감사합니다.
                                åå쉽고 빠른 여행åNo Money Trip',
                                null, null, to_date('20200201','yyyymmdd'), 18);



--자주묻는질문
insert into nmt_board values(seq_board_no.nextval,'1','D1','예약 문의는 누구에게 해야 하나요?','관리자에게 문의 부탁드립니다. 문의 전화 tel) 010-3157-5350',null,null,default,0,default,null);
insert into nmt_board values(seq_board_no.nextval,'1','D1','예약내역은 어디에서 확인할 수 있습니까?','마이페이지에서 확인 부탁드립니다.',null,null,default,0,default,null);
insert into nmt_board values(seq_board_no.nextval,'1','D1','회원 정보를 어떻게 수정하나요?','마이페이지에서 회원 정보를 수정하실 수 있습니다.',null,null,default,0,default,null);
commit;


--1:1문의사항
insert into nmt_board values(seq_board_no.nextval,'10000003','C1','프랑스를가고싶은데 어떻게가나요?','도와주세요',null,null,default,10,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000001','C1','비밀번호를 바꿀려면 어떻게하나요 ?','도와주세요',null,null,default,10,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000002','C1','관광지 질문있습니다','도와주세요',null,null,default,10,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000001','C1','이거 왜안될까요 ...도와주세요','도와주세요',null,null,default,10,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000001','C1','항공권변경하고싶어요','도와주세요',null,null,default,10,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000002','C1','호텔전화번호좀 알수있을까요??','도와주세요',null,null,default,10,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000003','C1','리뷰게시판에 동영상을 올릴수있나요??','도와주세요',null,null,default,0,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000003','C1','호텔을 바꾸고싶어요','도와주세요',null,null,default,0,default,null);
insert into nmt_board values(seq_board_no.nextval,'10000002','C1','비회원으로 패키지를 구매할수있나요??','도와주세요',null,null,default,0,default,null);

commit;
-- 02 14 추가 완료 

--select* from nmt_member;
--commit;
--insert into nmt_mile values('10000001',default,1000,'I',0,'패키지상품구매');
--select * from nmt_mile;
--SELECT * FROM NMT_MILE WHERE MEMBER_CODE = '10000001';
--commit;
--
--select * from nmt_mile;
