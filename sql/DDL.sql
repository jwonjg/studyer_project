CREATE table "MEMBER" (
    "NO"         NUMBER(8,0),
    "EMAIL"      VARCHAR2(80),
    "PASSWORD"   VARCHAR2(50),
    "NAME"       VARCHAR2(50),
    "PHOTO"      VARCHAR2(80),
    constraint  "MEMBER_PK" primary key ("NO")
);
CREATE SEQUENCE member_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;
 
CREATE table "CLASS_SUBJECT" (
    "NO"         NUMBER(8,0),
    "NAME"       VARCHAR2(100),
    "COUNT"      NUMBER(8,0),
    constraint  "CLASS_SUBJECT_PK" primary key ("NO")
);
CREATE SEQUENCE class_subject_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;

CREATE table "CLASS_TEACHER" (
    "NO"         NUMBER(8,0),
    "NAME"       VARCHAR2(100),
    "COUNT"      NUMBER(8,0),
    constraint  "CLASS_TEACHER_PK" primary key ("NO")
);
CREATE SEQUENCE class_teacher_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;
 
CREATE table "CLASS_PLACE" (
    "NO"         NUMBER(8,0),
    "NAME"       VARCHAR2(100),
    "COUNT"      NUMBER(8,0),
    constraint  "CLASS_PLACE_PK" primary key ("NO")
);
CREATE SEQUENCE class_place_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;
 
CREATE table "CLASS_NAME" (
    "NO"         NUMBER(8,0),
    "NAME"       VARCHAR2(100),
    "COUNT"      NUMBER(8,0),
    constraint  "CLASS_NAME_PK" primary key ("NO")
);
CREATE SEQUENCE class_name_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;

CREATE table "SHARE_BOARD" (
    "NO"               NUMBER(8,0),
    "CLASS_SUBJECT_NO" NUMBER(8,0),
    "CLASS_TEACHER_NO" NUMBER(8,0),
    "CLASS_PLACE_NO"   NUMBER(8,0),
    "CLASS_NAME_NO"    NUMBER(8,0),
    "TITLE"            VARCHAR2(100),
    "CONTENT"          VARCHAR2(2000),
    "FILE_URL"         VARCHAR2(80),
    "GOOD"             NUMBER(8,0),
    "REG_DATE"         DATE,
    constraint  "SHARE_BOARD_PK" primary key ("NO")
);
ALTER TABLE "SHARE_BOARD" ADD CONSTRAINT "SHARE_BOARD_SUBJECT_FK" 
FOREIGN KEY ("CLASS_SUBJECT_NO")
REFERENCES "CLASS_SUBJECT" ("NO");
ALTER TABLE "SHARE_BOARD" ADD CONSTRAINT "SHARE_BOARD_TEACHER_FK" 
FOREIGN KEY ("CLASS_TEACHER_NO")
REFERENCES "CLASS_TEACHER" ("NO");
ALTER TABLE "SHARE_BOARD" ADD CONSTRAINT "SHARE_BOARD_PLACE_FK" 
FOREIGN KEY ("CLASS_PLACE_NO")
REFERENCES "CLASS_PLACE" ("NO");
ALTER TABLE "SHARE_BOARD" ADD CONSTRAINT "SHARE_BOARD_NAME_FK" 
FOREIGN KEY ("CLASS_NAME_NO")
REFERENCES "CLASS_NAME" ("NO");

CREATE SEQUENCE share_board_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;
 
CREATE table "EDIT" (
    "NO"             NUMBER(8,0),
    "SHARE_BOARD_NO" NUMBER(8,0),
    "START_INDEX"    NUMBER(8,0),
    "END_INDEX"      NUMBER(8,0),
    "BEFORE_CONTENT" VARCHAR2(2000),
    "BAD"            NUMBER(8,0),
    "MEMBER_NAME"    VARCHAR2(50),
    "REG_DATE"       DATE,
    constraint  "EDIT_PK" primary key ("NO")
);
ALTER TABLE "EDIT" ADD CONSTRAINT "EDIT_FK" 
FOREIGN KEY ("SHARE_BOARD_NO")
REFERENCES "SHARE_BOARD" ("NO");

CREATE SEQUENCE edit_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;

CREATE table "MY_BOARD" (
    "NO"         NUMBER(8,0),
    "CLASS_INFO" VARCHAR2(100),
    "TITLE"      VARCHAR2(100),
    "CONTENT"    VARCHAR2(2000),
    "FILE_URL"   VARCHAR2(80),
    "REG_DATE"   DATE,
    constraint  "MY_BOARD_PK" primary key ("NO")
);

CREATE SEQUENCE my_board_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;
