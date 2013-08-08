CREATE SEQUENCE seq_lookup_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

CREATE TABLE tbl_lookup (
  id         INTEGER DEFAULT nextval('seq_lookup_id' :: REGCLASS) NOT NULL,
  name       CHARACTER VARYING(128)                               NOT NULL,
  code       INTEGER                                              NOT NULL,
  type       CHARACTER VARYING(128)                               NOT NULL,
  "position" INTEGER                                              NOT NULL
);

ALTER TABLE ONLY tbl_lookup
ADD CONSTRAINT pk_lookup_id PRIMARY KEY (id);


CREATE SEQUENCE seq_user_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

CREATE TABLE tbl_user (
  id       INTEGER DEFAULT nextval('seq_user_id' :: REGCLASS) NOT NULL,
  username CHARACTER VARYING(128)                             NOT NULL,
  password CHARACTER VARYING(128)                             NOT NULL,
  salt     CHARACTER VARYING(128)                             NOT NULL,
  email    CHARACTER VARYING(128)                             NOT NULL,
  profile  TEXT
);

ALTER TABLE ONLY tbl_user
ADD CONSTRAINT pk_user_id PRIMARY KEY (id);


CREATE SEQUENCE seq_post_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

CREATE TABLE tbl_post (
  id          INTEGER DEFAULT nextval('seq_post_id' :: REGCLASS) NOT NULL,
  title       CHARACTER VARYING(128)                             NOT NULL,
  content     TEXT                                               NOT NULL,
  tags        TEXT,
  status      INTEGER                                            NOT NULL,
  create_time INTEGER,
  update_time INTEGER,
  author_id   INTEGER                                            NOT NULL
);

ALTER TABLE ONLY tbl_post
ADD CONSTRAINT pk_post_id PRIMARY KEY (id);


CREATE SEQUENCE seq_comment_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

CREATE TABLE tbl_comment (
  id          INTEGER DEFAULT nextval('seq_comment_id' :: REGCLASS) NOT NULL,
  content     TEXT                                                  NOT NULL,
  status      INTEGER                                               NOT NULL,
  create_time INTEGER,
  author      CHARACTER VARYING(128)                                NOT NULL,
  email       CHARACTER VARYING(128)                                NOT NULL,
  url         CHARACTER VARYING(128),
  post_id     INTEGER                                               NOT NULL
);

ALTER TABLE ONLY tbl_comment
ADD CONSTRAINT pk_comment_id PRIMARY KEY (id);


CREATE SEQUENCE seq_tag_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

CREATE TABLE tbl_tag (
  id        INTEGER DEFAULT nextval('seq_tag_id' :: REGCLASS) NOT NULL,
  name      CHARACTER VARYING(128)                            NOT NULL,
  frequency INTEGER DEFAULT 1
);

ALTER TABLE ONLY tbl_tag
ADD CONSTRAINT pk_tag_id PRIMARY KEY (id);


INSERT INTO tbl_lookup (name, type, code, position) VALUES ('Draft', 'PostStatus', 1, 1);
INSERT INTO tbl_lookup (name, type, code, position) VALUES ('Published', 'PostStatus', 2, 2);
INSERT INTO tbl_lookup (name, type, code, position) VALUES ('Archived', 'PostStatus', 3, 3);
INSERT INTO tbl_lookup (name, type, code, position) VALUES ('Pending Approval', 'CommentStatus', 1, 1);
INSERT INTO tbl_lookup (name, type, code, position) VALUES ('Approved', 'CommentStatus', 2, 2);

INSERT INTO tbl_user (username, password, salt, email) VALUES ('demo', '2e5c7db760a33498023813489cfadc0b', '28b206548469ce62182048fd9cf91760', 'webmaster@example.com');
INSERT INTO tbl_post (title, content, status, create_time, update_time, author_id, tags) VALUES ('Welcome!', 'This blog system is developed using Yii. It is meant to demonstrate how to use Yii to build a complete real-world application. Complete source code may be found in the Yii releases.

Feel free to try this system by writing new posts and posting comments.', 2, 1230952187, 1230952187, 1, 'yii, blog');
INSERT INTO tbl_post (title, content, status, create_time, update_time, author_id, tags) VALUES ('A Test Post', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 2, 1230952187, 1230952187, 1, 'test');

INSERT INTO tbl_comment (content, status, create_time, author, email, post_id) VALUES ('This is a test comment.', 2, 1230952187, 'Tester', 'tester@example.com', 2);

INSERT INTO tbl_tag (name) VALUES ('yii');
INSERT INTO tbl_tag (name) VALUES ('blog');
INSERT INTO tbl_tag (name) VALUES ('test');
