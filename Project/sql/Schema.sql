DROP TABLE users CASCADE CONSTRAINT;
DROP TABLE students CASCADE CONSTRAINT;
DROP TABLE board CASCADE CONSTRAINT;
DROP SEQUENCE sequence_board_no;

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
CREATE TABLE students (
	code varchar2(50),
	name varchar2(50),
	company varchar2(100),
	email varchar2(100)
);

ALTER TABLE users ADD(CONSTRAINT users_id_pk PRIMARY KEY(id));
ALTER TABLE students ADD(CONSTRAINT students_code_pk PRIMARY KEY(code));

CREATE SEQUENCE sequence_board_no;

INSERT INTO users VALUES ('t1', '1234', '김혜경');
INSERT INTO users VALUES ('t2', '1234', '임경혜');
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '공지 제목', '내용', SYSDATE, 't1', 0, 0);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '일반 제목', '내용', SYSDATE, 't2', 1, 0);
INSERT INTO students VALUES ('UCAMP20A001', '박명미', '몰라', 'mm@mm.com');

COMMIT;