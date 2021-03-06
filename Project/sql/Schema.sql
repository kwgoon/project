DROP TABLE users CASCADE CONSTRAINT;
DROP TABLE students CASCADE CONSTRAINT;
DROP TABLE board CASCADE CONSTRAINT;
DROP TABLE reply CASCADE CONSTRAINT;
DROP SEQUENCE sequence_board_no;
DROP SEQUENCE sequence_reply_no;

CREATE TABLE users (
	id varchar2(50),
	pw varchar2(50),
	name varchar2(50)
);
CREATE TABLE board (
	no number(3),
	title varchar2(50),
	contents varchar2(100),
	days varchar2(20),
	id varchar2(30),
	count number(3),
	type number(1)
);

CREATE TABLE reply (
	no number(3),
	b_no number(3),
	contents varchar2(100),
	days varchar2(20),
	id varchar2(30)
);


CREATE TABLE students (
	code varchar2(50),
	pw varchar2(50),
	name varchar2(50),
	company varchar2(100),
	email varchar2(100)
);

ALTER TABLE users ADD(CONSTRAINT users_id_pk PRIMARY KEY(id));
ALTER TABLE students ADD(CONSTRAINT students_code_pk PRIMARY KEY(code));
ALTER TABLE board ADD(CONSTRAINT board_no_pk PRIMARY KEY(no));
ALTER TABLE reply ADD(CONSTRAINT reply_no_pk PRIMARY KEY(no));

ALTER TABLE board ADD CONSTRAINT board_id_fk FOREIGN KEY(id) REFERENCES users(id);
ALTER TABLE reply ADD CONSTRAINT reply_d_no_fk FOREIGN KEY(b_no) REFERENCES board(no) ON DELETE CASCADE;

CREATE SEQUENCE sequence_board_no;
CREATE SEQUENCE sequence_reply_no;

INSERT INTO users VALUES ('t1', '1234', '沿駁井');
INSERT INTO users VALUES ('t2', '1234', '績井駁');
INSERT INTO students VALUES ('UCAMP20A001', '1234', '酵誤耕', '侯虞', 'mm@mm.com');
INSERT INTO students VALUES ('UCAMP20A002', '1234', '因雌差', '侯虞', 'sb@sb.com');
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[因走] 1 因走脊艦陥.', '1腰 因走紫牌脊艦陥. 溌昔郊遇艦陥. 因走因走因走', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '宿宿背', '蟹櫛 且焼匝 紫寓', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '照括馬室推', '照括馬室推 鋼逢柔艦陥.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[因走] 2 因走脊艦陥.', '2腰 因走紫牌脊艦陥. 溌昔郊遇艦陥. 因走因走因走', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '賞益軒獄球', '蟹澗 賞益軒獄球研 巌紹陥.. by PMM', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, 'KW税 廃原巨', '焼......せせせせ 馬馬馬馬たぞぞ', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[因走] 3 因走脊艦陥.', '3腰 因走紫牌脊艦陥. 溌昔郊遇艦陥. 因走因走因走', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, 'MM税 廃原巨', '貝 賞益軒獄球研 巌走 省紹陥.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '馬戚馬戚', '食奄澗 Hi Cafe脊艦陥.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[因走] 4 因走脊艦陥.', '4腰 因走紫牌脊艦陥. 溌昔郊遇艦陥. 因走因走因走', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '戚係惟 層搾馬虞', '節精 中歳備 切推. 郊稽搭馬澗 spa 戚係惟 層搾馬室推', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '乞牽畏柔艦陥.', '瀬 格巷 嬢形崇....馬..', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[因走] 5 因走脊艦陥.', '5腰 因走紫牌脊艦陥. 溌昔郊遇艦陥. 因走因走因走', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '且君亜推', '遭促 且君亜壱粛陥. 情薦鷹 且君哀猿', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '節叔 茎汽杉球', '郊韓拭 液伸持沿.. 照哀襖醤', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[因走] 6 因走脊艦陥.', '6腰 因走紫牌脊艦陥. 溌昔郊遇艦陥. 因走因走因走', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 1, '革 硝畏柔艦陥.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 'UCAMP20A001');
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 1, '革.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 'UCAMP20A002');
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 1, '神徹亀徹推', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2');
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 2, '蟹蟹蟹た蟹蟹', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2');

COMMIT;
