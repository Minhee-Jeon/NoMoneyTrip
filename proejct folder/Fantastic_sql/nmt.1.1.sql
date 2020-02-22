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
drop table board_category cascade constraints;
drop table NMT_ADMINBOARD cascade constraints;
drop table NMT_AIR cascade constraints;
drop table NMT_BOARD cascade constraints;
drop table NMT_CP cascade constraints;
drop table NMT_DISTANCE cascade constraints;
drop table NMT_HOTEL cascade constraints;
drop table NMT_IMAGES cascade constraints;
drop table NMT_MEMBER cascade constraints;
drop table NMT_MILE cascade constraints;
drop table NMT_PACKAGE cascade constraints;
drop table NMT_PACKAGELIST cascade constraints;
drop table NMT_PLACE cascade constraints;
drop table NMT_PRODUCT cascade constraints;
drop table NMT_SALES cascade constraints;
drop table TBL_ADMIN cascade constraints;
drop table NMT_NATION cascade constraints;
drop sequence seq_member_code;
drop sequence seq_board_no;

--


CREATE TABLE "NMT_MEMBER" (
	"MEMBER_CODE"	NUMBER		NOT NULL,
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
SELECT * FROM NMT_MEMBER;

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
	"IMG_CODE"	VARCHAR2(30),
    "IMG_NAME" varchar2(100)
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
--alter table tbl_admin add constraint pk_admin_no primary key(admin_no);
--alter table nmt_cp add constraint pk_cp_serail primary key(cp_serail);
alter table nmt_air add constraint pk_air_code primary key(air_code);
alter table nmt_place add constraint pk_place_code primary key(place_code);
alter table nmt_hotel add constraint pk_hotel_code primary key(hotel_code);
alter table nmt_distance add constraint pk_distance_level primary key(distance_level);
alter table nmt_adminboard add constraint pk_adminboard_no primary key(board_no);
--alter table nmt_product add constraint pk_product_code primary key(p_code);
--alter table nmt_sales add constraint pk_order_no primary key(order_no);
alter table nmt_board add constraint pk_board_no primary key(board_no);



--이름 : fk_nmt뺀 테이블명_키이름
--외래키 지정
alter table nmt_adminboard add constraint fk_board_member_code foreign key
(member_code) references nmt_member(member_code);
--board_category테이블을 삭제해서 참조할 외래키가 없음 어떡ㄱ해야할ㄹ까여....
--alter table nmt_adminboard add constraint fk_board_board_cate foreign key(board_cate) references nmt_member(member_code);
--alter table nmt_sales add constraint fk_sales_member_code foreign key (member_code) references nmt_member(member_code);
--alter table nmt_sales add constraint fk_sales_p_code foreign key (p_code) references nmt_product(p_code);
alter table nmt_mile add constraint fk_mile_member_code foreign key(member_code) references nmt_member(member_code);
alter table nmt_package add constraint fk_package_member_code foreign key(member_code) references nmt_member(member_code);
--alter table nmt_cp add constraint fk_cp_member_code foreign key(member_code) references nmt_member(member_code);
alter table nmt_packagelist add constraint fk_packagelist_package_code foreign key(package_code) references nmt_package(package_code);
alter table nmt_packagelist add constraint fk_packagelist_air_code foreign key(air_code) references nmt_air(air_code);
alter table nmt_packagelist add constraint fk_packagelist_place_code foreign key(place_code) references nmt_place(place_code);
alter table nmt_packagelist add constraint fk_packagelist_hotel_code foreign key(hotel_code) references nmt_hotel(hotel_code);
alter table nmt_place add constraint fk_place_distance_level foreign key(distance_level) references nmt_distance(distance_level);
alter table nmt_hotel add constraint fk_hotel_distance_level foreign key(distance_level) references nmt_distance(distance_level);
alter table nmt_board add constraint fk_board_ref foreign key(board_ref) references nmt_board(board_no);


--select * from user_constraints where constraint_type='R';
--select * from all_constraints where table_name = 'nmt_hotel';


select * from nmt_member;
insert into nmt_member values('1','admin','admin','관리자','01012341234','blacksnowman@kakao.com','서울시 강남구 테헤란로',sysdate , '10000',to_Date('20001231','yyyymmdd'));
commit;




select *
from board_category;
insert into board_category values('d1', 'question','자주묻는질문');
insert into board_category values('a1' ,'notice','admin_notioce');
insert into board_category values('b1', 'board', 'review-board');
insert into board_category values('c1','onetoone','일대일문의');
commit;

select * from nmt_board;

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

select * from nmt_distance;

--HOTEL INSERT
-- hotel_code / distance_level / hotel_name / nation_name / hotel_price / hotel_addr / hotel_score
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-1','GB1','포인트 A 호텔 런던 킹스 크로스 - 세인트 팬크라스','england',137650, 'Swinton House, 324 Grays Inn Road 킹스 크로스 세인트 판크라스 런던 영국', 8);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-2','GB1','웜뱃 시티 호스텔 런던','england',118739, '7 Dock Street, 타워 햄릿, 런던, 영국', 8.5);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-3','GB1','파크 플라자 런던 워털루','england',196522, '6 Hercules Road, 램버스 , 런던, 영국, SE1 7DU', 8.5);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-4','GB1','제너레이터 런던','england',80003, '37 Tavistock Place, Russell Square, 킹스 크로스 세인트 판크라스, 런던, 영국', 7.5);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-5','GB2','에덴 로크','england',153033, '127 George St., 뉴 타운, 에든버러, 영국', 9.2);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-6','GB2','이비스 에딘버그 센터 로얄 마일 - 헌터 스퀘어','england',103953, '6 Hunter Square, Off Royal Mile, 에든버러 올드타운, 에든버러, 영국', 8.7);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-7','GB2','더 발모랄 호텔','england',103953, '6 Hunter Square, Off Royal Mile, 에든버러 올드타운, 에든버러, 영국', 8.7);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-8','GB3','휘트워스 로케','england',116051, '74 Princess St, 맨체스터 시내, 맨체스터, 영국', 9.2);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-9','GB3','이비스 스타일 맨체스터 포트랜드','england',102034, '3- 5 Portland Street, 맨체스터 시내, 맨체스터, 영국', 8.5);
insert into nmt_hotel(hotel_code, distance_level, hotel_name ,nation_code, hotel_price ,hotel_addr, hotel_score) values('htl-10','GB3','시티스위트 아파트호텔','england',152924, '16 Chapel Street, 맨체스터 시내, 맨체스터, 영국', 9.3);

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

SELECT * FROM NMT_HOTEL;


SELECT * FROM NMT_PLACE;

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

SELECT * FROM NMT_PLACE;
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



SELECT* FROM NMT_AIR;

-- INCHEON - ENGLAND
insert into nmt_air values('air-0001', 'INCHEON', 'ENGLAND', 'KE907', 442300, '대한항공', to_date('202002191300','yyyyMMddHH24MI'), to_date('202002191630','yyyymmddhh24mi'));
insert into nmt_air values('air-0002', 'INCHEON', 'ENGLAND', 'OZ716', 451500, '아시아나항공', to_date('202002191045','yyyyMMddHH24MI'), to_date('202002191415','yyyymmddhh24mi'));
insert into nmt_air values('air-0003', 'INCHEON', 'ENGLAND', 'BA18', 553600, '영국항공', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002191430','yyyymmddhh24mi'));

insert into nmt_air values('air-0004', 'ENGLAND', 'INCHEON', 'KE908', 342300, '대한항공', to_date('202002231800','yyyyMMddHH24MI'), to_date('202002241430','yyyymmddhh24mi'));
insert into nmt_air values('air-0005', 'ENGLAND', 'INCHEON', 'OZ522', 551500, '아시아나항공', to_date('202002232010','yyyyMMddHH24MI'), to_date('202002241605','yyyymmddhh24mi'));
insert into nmt_air values('air-0006', 'ENGLAND', 'INCHEON', 'BA18', 353600, '영국항공', to_date('202002231245','yyyyMMddHH24MI'), to_date('202002242045','yyyymmddhh24mi'));


--INCHEON SWISS 
insert into nmt_air values('air-0007', 'INCHEON', 'SWISS', 'KE917', 325000, '대한항공', to_date('202002191220','yyyyMMddHH24MI'), to_date('202002191730','yyyymmddhh24mi'));
insert into nmt_air values('air-0008', 'INCHEON', 'SWISS', 'OZ316', 441500, '아시아나항공', to_date('202002191005','yyyyMMddHH24MI'), to_date('202002191515','yyyymmddhh24mi'));
insert into nmt_air values('air-0009', 'INCHEON', 'SWISS', 'LO98', 486000, '폴란드항공', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002191640','yyyymmddhh24mi'));

insert into nmt_air values('air-0010', 'SWISS', 'INCHEON', 'KE916', 463000, '대한항공', to_date('202002231100','yyyyMMddHH24MI'), to_date('202002231350','yyyymmddhh24mi'));
insert into nmt_air values('air-0011', 'SWISS', 'INCHEON', 'OZ654', 381500, '아시아나항공', to_date('202002230905','yyyyMMddHH24MI'), to_date('202002231415','yyyymmddhh24mi'));
insert into nmt_air values('air-0012', 'SWISS', 'INCHEON', 'LO87', 446000, '폴란드항공', to_date('202002231700','yyyyMMddHH24MI'), to_date('202002242340','yyyymmddhh24mi'));

--INCHEON-FRANCE
insert into nmt_air values('air-0013', 'INCHEON', 'FRANCE', 'KE591', 525000, '대한항공', to_date('202002190955','yyyyMMddHH24MI'), to_date('202002191420','yyyymmddhh24mi'));
insert into nmt_air values('air-0014', 'INCHEON', 'FRANCE', 'OZ501', 390800, '아시아나항공', to_date('202002191230','yyyyMMddHH24MI'), to_date('202002191700','yyyymmddhh24mi'));
insert into nmt_air values('air-0015', 'INCHEON', 'FRANCE', 'AF267', 400500, '에어프랑스', to_date('202002191000','yyyyMMddHH24MI'), to_date('202002191425','yyyymmddhh24mi'));

insert into nmt_air values('air-0016', 'FRANCE', 'INCHEON', 'KE917', 463000, '대한항공', to_date('202002231100','yyyyMMddHH24MI'), to_date('202002231350','yyyymmddhh24mi'));
insert into nmt_air values('air-0017', 'FRANCE', 'INCHEON', 'OZ502', 381500, '아시아나항공', to_date('202002231905','yyyyMMddHH24MI'), to_date('202002231355','yyyymmddhh24mi'));
insert into nmt_air values('air-0018', 'FRANCE', 'INCHEON', 'AF298', 446000, '에어프랑스', to_date('202002231300','yyyyMMddHH24MI'), to_date('202002242010','yyyymmddhh24mi'));

-----------------------------------10
-- INCHEON - ENGLAND
/*insert into nmt_air values('air-0019', 'INCHEON', 'ENGLAND', 'KE907', 442300, '대한항공', to_date('202002191300','yyyyMMddHH24MI'), to_date('202002191630','yyyymmddhh24mi'));
insert into nmt_air values('air-0020', 'INCHEON', 'ENGLAND', 'OZ716', 451500, '아시아나항공', to_date('202002191045','yyyyMMddHH24MI'), to_date('202002191415','yyyymmddhh24mi'));
insert into nmt_air values('air-0021', 'INCHEON', 'ENGLAND', 'BA18', 553600, '영국항공', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002191430','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0019', 'ENGLAND', 'INCHEON', 'KE908', 342300, '대한항공', to_date('202002281800','yyyyMMddHH24MI'), to_date('202002291430','yyyymmddhh24mi'));
insert into nmt_air values('air-0020', 'ENGLAND', 'INCHEON', 'OZ522', 551500, '아시아나항공', to_date('202002282010','yyyyMMddHH24MI'), to_date('202002291605','yyyymmddhh24mi'));
insert into nmt_air values('air-0021', 'ENGLAND', 'INCHEON', 'BA18', 353600, '영국항공', to_date('202002281245','yyyyMMddHH24MI'), to_date('202002292045','yyyymmddhh24mi'));


--INCHEON SWISS 
/*insert into nmt_air values('air-0025', 'INCHEON', 'SWISS', 'KE917', 325000, '대한항공', to_date('202002191220','yyyyMMddHH24MI'), to_date('202002191730','yyyymmddhh24mi'));
insert into nmt_air values('air-0026', 'INCHEON', 'SWISS', 'OZ316', 441500, '아시아나항공', to_date('202002191005','yyyyMMddHH24MI'), to_date('202002191515','yyyymmddhh24mi'));
insert into nmt_air values('air-0027', 'INCHEON', 'SWISS', 'LO98', 486000, '폴란드항공', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002191640','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0022', 'SWISS', 'INCHEON', 'KE916', 463000, '대한항공', to_date('202002281100','yyyyMMddHH24MI'), to_date('202002281350','yyyymmddhh24mi'));
insert into nmt_air values('air-0023', 'SWISS', 'INCHEON', 'OZ654', 381500, '아시아나항공', to_date('202002280905','yyyyMMddHH24MI'), to_date('202002281415','yyyymmddhh24mi'));
insert into nmt_air values('air-0024', 'SWISS', 'INCHEON', 'LO87', 446000, '폴란드항공', to_date('202002281700','yyyyMMddHH24MI'), to_date('202002292340','yyyymmddhh24mi'));

--INCHEON-FRANCE
/*insert into nmt_air values('air-0031', 'INCHEON', 'FRANCE', 'KE591', 525000, '대한항공', to_date('202002190955','yyyyMMddHH24MI'), to_date('202002191420','yyyymmddhh24mi'));
insert into nmt_air values('air-0032', 'INCHEON', 'FRANCE', 'OZ501', 390800, '아시아나항공', to_date('202002191230','yyyyMMddHH24MI'), to_date('202002191700','yyyymmddhh24mi'));
insert into nmt_air values('air-0033', 'INCHEON', 'FRANCE', 'AF267', 400500, '에어프랑스’, to_date('202002191000','yyyyMMddHH24MI'), to_date('202002191425','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0025', 'FRANCE', 'INCHEON', 'KE917', 463000, '대한항공', to_date('202002281100','yyyyMMddHH24MI'), to_date('202002281350','yyyymmddhh24mi'));
insert into nmt_air values('air-0026', 'FRANCE', 'INCHEON', 'OZ502', 381500, '아시아나항공', to_date('202002281905','yyyyMMddHH24MI'), to_date('202002281355','yyyymmddhh24mi'));
insert into nmt_air values('air-0027', 'FRANCE', 'INCHEON', 'AF298', 446000, '에어프랑스', to_date('202002281300','yyyyMMddHH24MI'), to_date('202002292010','yyyymmddhh24mi'));


---------------------------------15

-- INCHEON - ENGLAND
/*insert into nmt_air values('air-0019', 'INCHEON', 'ENGLAND', 'KE907', 442300, '대한항공', to_date('202002191300','yyyyMMddHH24MI'), to_date('202002191630','yyyymmddhh24mi'));
insert into nmt_air values('air-0020', 'INCHEON', 'ENGLAND', 'OZ716', 451500, '아시아나항공', to_date('202002191045','yyyyMMddHH24MI'), to_date('202002191415','yyyymmddhh24mi'));
insert into nmt_air values('air-0021', 'INCHEON', 'ENGLAND', 'BA18', 553600, '영국항공', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002191430','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0028', 'ENGLAND', 'INCHEON', 'KE908', 342300, '대한항공', to_date('202002281800','yyyyMMddHH24MI'), to_date('202003051430','yyyymmddhh24mi'));
insert into nmt_air values('air-0029', 'ENGLAND', 'INCHEON', 'OZ522', 551500, '아시아나항공', to_date('202002282010','yyyyMMddHH24MI'), to_date('202003051605','yyyymmddhh24mi'));
insert into nmt_air values('air-0030', 'ENGLAND', 'INCHEON', 'BA18', 353600, '영국항공', to_date('202002281245','yyyyMMddHH24MI'), to_date('202003052045','yyyymmddhh24mi'));


--INCHEON SWISS 
/*insert into nmt_air values('air-0025', 'INCHEON', 'SWISS', 'KE917', 325000, '대한항공', to_date('202002191220','yyyyMMddHH24MI'), to_date('202002191730','yyyymmddhh24mi'));
insert into nmt_air values('air-0026', 'INCHEON', 'SWISS', 'OZ316', 441500, '아시아나항공', to_date('202002191005','yyyyMMddHH24MI'), to_date('202002191515','yyyymmddhh24mi'));
insert into nmt_air values('air-0027', 'INCHEON', 'SWISS', 'LO98', 486000, '폴란드항공', to_date('202002191100','yyyyMMddHH24MI'), to_date('202002191640','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0031', 'SWISS', 'INCHEON', 'KE916', 463000, '대한항공', to_date('202002281100','yyyyMMddHH24MI'), to_date('202003051350','yyyymmddhh24mi'));
insert into nmt_air values('air-0032', 'SWISS', 'INCHEON', 'OZ654', 381500, '아시아나항공', to_date('202002280905','yyyyMMddHH24MI'), to_date('202003051415','yyyymmddhh24mi'));
insert into nmt_air values('air-0033', 'SWISS', 'INCHEON', 'LO87', 446000, '폴란드항공', to_date('202002281700','yyyyMMddHH24MI'), to_date('202003052340','yyyymmddhh24mi'));

--INCHEON-FRANCE
/*insert into nmt_air values('air-0031', 'INCHEON', 'FRANCE', 'KE591', 525000, '대한항공', to_date('202002190955','yyyyMMddHH24MI'), to_date('202002191420','yyyymmddhh24mi'));
insert into nmt_air values('air-0032', 'INCHEON', 'FRANCE', 'OZ501', 390800, '아시아나항공', to_date('202002191230','yyyyMMddHH24MI'), to_date('202002191700','yyyymmddhh24mi'));
insert into nmt_air values('air-0033', 'INCHEON', 'FRANCE', 'AF267', 400500, '에어FRANCE', to_date('202002191000','yyyyMMddHH24MI'), to_date('202002191425','yyyymmddhh24mi'));
*/
insert into nmt_air values('air-0034', 'FRANCE', 'INCHEON', 'KE917', 463000, '대한항공', to_date('202002281100','yyyyMMddHH24MI'), to_date('202003061350','yyyymmddhh24mi'));
insert into nmt_air values('air-0035', 'FRANCE', 'INCHEON', 'OZ502', 381500, '아시아나항공', to_date('202002281905','yyyyMMddHH24MI'), to_date('202003051355','yyyymmddhh24mi'));
insert into nmt_air values('air-0036', 'FRANCE', 'INCHEON', 'AF298', 446000, '에어프랑스', to_date('202002281300','yyyyMMddHH24MI'), to_date('202003062010','yyyymmddhh24mi'));

-----
select * from nmt_air order by air_code;

