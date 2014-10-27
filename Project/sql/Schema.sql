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

INSERT INTO users VALUES ('t1', '1234', '김혜경');
INSERT INTO users VALUES ('t2', '1234', '임경혜');
INSERT INTO students VALUES ('UCAMP20A001', '1234', '박명미', '몰라', 'mm@mm.com');
INSERT INTO students VALUES ('UCAMP20A002', '1234', '공상복', '몰라', 'sb@sb.com');
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[공지] 1 공지입니다.', '1번 공지사항입니다. 확인바랍니다. 공지공지공지', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '심심해', '나랑 놀아줄 사람', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '안녕하세요', '안녕하세요 반갑습니다.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[공지] 2 공지입니다.', '2번 공지사항입니다. 확인바랍니다. 공지공지공지', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '앵그리버드', '나는 앵그리버드를 닮았다.. by PMM', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, 'KW의 한마디', '아......ㅋㅋㅋㅋ 하하하하ㅏㅎㅎ', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[공지] 3 공지입니다.', '3번 공지사항입니다. 확인바랍니다. 공지공지공지', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, 'MM의 한마디', '난 앵그리버드를 닮지 않았다.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '하이하이', '여기는 Hi Cafe입니다.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[공지] 4 공지입니다.', '4번 공지사항입니다. 확인바랍니다. 공지공지공지', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '이렇게 준비하라', '잠은 충분히 자요. 바로통하는 spa 이렇게 준비하세요', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '모르겠습니다.', '웹 너무 어려움....하..', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[공지] 5 공지입니다.', '5번 공지사항입니다. 확인바랍니다. 공지공지공지', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '놀러가요', '진짜 놀러가고싶다. 언제쯤 놀러갈까', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '잠실 롯데월드', '바닥에 균열생김.. 안갈꺼야', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[공지] 6 공지입니다.', '6번 공지사항입니다. 확인바랍니다. 공지공지공지', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 1, '네 알겠습니다.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 'UCAMP20A001');
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 1, '네.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 'UCAMP20A002');
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 1, '오키도키요', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2');
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 2, '나나나ㅏ나나', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2');

COMMIT;
