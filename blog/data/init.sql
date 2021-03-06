/**
 * Sql для створення первинної бази данных в Sqlite
 */

/* Зовнішні ключі необхідно активувати*/
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS user;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  username VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  created_at VARCHAR NOT NULL,
  is_enabled BOOLEAN NOT NULL DEFAULT true
);

INSERT INTO
  user
  (
    username, password, created_at, is_enabled
  )
VALUES
  (
    "xxx", "xxx", datetime('now'), 0
  );

DROP TABLE IF EXISTS post;

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  title VARCHAR NOT NULL,
  body VARCHAR NOT NULL,
  user_id INTEGER NOT NULL,
  created_at VARCHAR NOT NULL,
  updated_at VARCHAR,
  FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO
  post
  (
    title, body, user_id, created_at
  )
VALUES(
  "Hello world!",
  "Це буде перший пост на моєму блозі",
  1,
  datetime('now')
)
;

DROP TABLE IF EXISTS comment;

CREATE TABLE comment (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  post_id INTEGER NOT NULL,
  created_at VARCHAR NOT NULL,
  name VARCHAR NOT NULL,
  website VARCHAR,
  text VARCHAR NOT NULL,
  FOREIGN KEY (post_id) REFERENCES post(id)
);
