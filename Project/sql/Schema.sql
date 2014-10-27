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

INSERT INTO users VALUES ('t1', '1234', '������');
INSERT INTO users VALUES ('t2', '1234', '�Ӱ���');
INSERT INTO students VALUES ('UCAMP20A001', '1234', '�ڸ��', '����', 'mm@mm.com');
INSERT INTO students VALUES ('UCAMP20A002', '1234', '����', '����', 'sb@sb.com');
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[����] 1 �����Դϴ�.', '1�� ���������Դϴ�. Ȯ�ιٶ��ϴ�. ������������', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '�ɽ���', '���� ����� ���', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '�ȳ��ϼ���', '�ȳ��ϼ��� �ݰ����ϴ�.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[����] 2 �����Դϴ�.', '2�� ���������Դϴ�. Ȯ�ιٶ��ϴ�. ������������', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '�ޱ׸�����', '���� �ޱ׸����带 ��Ҵ�.. by PMM', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, 'KW�� �Ѹ���', '��......�������� �������Ϥ�����', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[����] 3 �����Դϴ�.', '3�� ���������Դϴ�. Ȯ�ιٶ��ϴ�. ������������', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, 'MM�� �Ѹ���', '�� �ޱ׸����带 ���� �ʾҴ�.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '��������', '����� Hi Cafe�Դϴ�.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[����] 4 �����Դϴ�.', '4�� ���������Դϴ�. Ȯ�ιٶ��ϴ�. ������������', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '�̷��� �غ��϶�', '���� ����� �ڿ�. �ٷ����ϴ� spa �̷��� �غ��ϼ���', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '�𸣰ڽ��ϴ�.', '�� �ʹ� �����....��..', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[����] 5 �����Դϴ�.', '5�� ���������Դϴ�. Ȯ�ιٶ��ϴ�. ������������', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '�����', '��¥ �����ʹ�. ������ �����', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '��� �Ե�����', '�ٴڿ� �տ�����.. �Ȱ�����', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2', 1, 2);
INSERT INTO board VALUES (sequence_board_no.NEXTVAL, '[����] 6 �����Դϴ�.', '6�� ���������Դϴ�. Ȯ�ιٶ��ϴ�. ������������', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't1', 0, 1);
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 1, '�� �˰ڽ��ϴ�.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 'UCAMP20A001');
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 1, '��.', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 'UCAMP20A002');
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 1, '��Ű��Ű��', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2');
INSERT INTO reply VALUES (sequence_reply_no.NEXTVAL, 2, '������������', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 't2');

COMMIT;
