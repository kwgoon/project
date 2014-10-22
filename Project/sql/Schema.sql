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
	name varchar2(50),
	company varchar2(100),
	email varchar2(100)
);

ALTER TABLE users ADD(CONSTRAINT users_id_pk PRIMARY KEY(id));
ALTER TABLE students ADD(CONSTRAINT students_code_pk PRIMARY KEY(code));
ALTER TABLE board ADD(CONSTRAINT board_no_pk PRIMARY KEY(no));
ALTER TABLE reply ADD(CONSTRAINT reply_no_pk PRIMARY KEY(no));

ALTER TABLE board ADD CONSTRAINT board_id_fk FOREIGN KEY(id) REFERENCES users(id);
ALTER TABLE reply ADD CONSTRAINT reply_d_no_fk FOREIGN KEY(b_no) REFERENCES board(no);

CREATE SEQUENCE sequence_board_no;
CREATE SEQUENCE sequence_reply_no;

INSERT INTO users VALUES ('t1', '1234', '김혜경');
INSERT INTO users VALUES ('t2', '1234', '임경혜');
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '공지 제목', '내용', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 0);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '일반 제목', '내용', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24/mi/ss'), 't2', 1, 0);
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 1, '내용', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24/mi/ss'), 't1');
INSERT INTO students VALUES ('UCAMP20A001', '박명미', '몰라', 'mm@mm.com');

COMMIT;