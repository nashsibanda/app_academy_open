-- Some seed data taken from:
-- https://github.com/mttrms/app-academy/blob/master/SQL/Object%20Relational%20Model/AA%20Questions/import_db.sql
-- https://github.com/cssherry/app-academy-projects/blob/master/02SQL/W3D2_Sabice/create_tables.sql

PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  follower_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (follower_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  replier_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (replier_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  liker_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (liker_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Nash', 'Sibanda'),
  ('Katie', 'Lymn'),
  ('Johann', 'Gorrick'),
  ('Boy', 'Masse'),
  ('Fletch', 'Santacrole');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('How do I inject SQL?', 'SQL Injection is my hobby, but I can''t do it...', (SELECT id FROM users WHERE fname = 'Nash' AND lname = 'Sibanda')),
  ('Are the mods asleep?', 'We have a lot of unrelated questions on this board.', (SELECT id FROM users WHERE fname = 'Nash' AND lname = 'Sibanda')),
  ('What is Brexit?', 'I''m so confused :(', (SELECT id FROM users WHERE fname = 'Katie' AND lname = 'Lymn')),
  ('How to efficiently determine whether there is a record in millions of records?', 'I want to check whether there is a record in millions of records. I know I can store the records in some relational database with an index. But I want some other resolutions, more efficiently.', (SELECT id FROM users WHERE fname = 'Johann' AND lname = 'Gorrick')),
  ('How to solve ''ascp: “user@host:” in all sources must match'' when download SRA data with linux?', 'What does this mean?How to solve it?', (SELECT id FROM users WHERE fname = 'Boy' AND lname = 'Masse')),
  ('Help', 'What is baseball?', (SELECT id FROM users WHERE fname = 'Fletch' AND lname = 'Santacrole')),
  ('I have a question', 'Lorem Ipsum', (SELECT id FROM users WHERE fname = 'Johann' AND lname = 'Gorrick')),
  ('Testing 123', 'This is the final question', (SELECT id FROM users WHERE fname = 'Nash' AND lname = 'Sibanda'));

INSERT INTO
  question_follows (question_id, follower_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Are the mods asleep?'), (SELECT id FROM users WHERE fname = 'Nash' AND lname = 'Sibanda')),
  ((SELECT id FROM questions WHERE title = 'How do I inject SQL?'), (SELECT id FROM users WHERE fname = 'Nash' AND lname = 'Sibanda')),
  ((SELECT id FROM questions WHERE title = 'Are the mods asleep?'), (SELECT id FROM users WHERE fname = 'Katie' AND lname = 'Lymn')),
  ((SELECT id FROM questions WHERE title = 'What is Brexit?'), (SELECT id FROM users WHERE fname = 'Katie' AND lname = 'Lymn')),
  ((SELECT id FROM questions WHERE title = 'Help'), (SELECT id FROM users WHERE fname = 'Johann')),
  ((SELECT id FROM questions WHERE title = 'Help'), (SELECT id FROM users WHERE fname = 'Boy')),
  ((SELECT id FROM questions WHERE title = 'How to efficiently determine whether there is a record in millions of records?'), (SELECT id FROM users WHERE fname = 'Nash'));

INSERT INTO
  replies (question_id, parent_reply_id, replier_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'What is Brexit?'), NULL, (SELECT id FROM users WHERE fname = 'Nash' AND lname = 'Sibanda'), 'What does this have to do with tech stuff?'),
  ((SELECT id FROM questions WHERE title = 'How do I inject SQL?'), NULL, (SELECT id FROM users WHERE fname = 'Katie' AND lname = 'Lymn'), 'Oh, I hate injections! Scary stuff.'),
  ((SELECT id FROM questions WHERE title = 'What is Brexit?'), (SELECT id FROM replies WHERE body = 'What does this have to do with tech stuff?'), (SELECT id FROM users WHERE fname = 'Katie' AND lname = 'Lymn'), 'Sorry, I think this is the wrong board!'),
  ((SELECT id FROM questions WHERE title = 'Help'), NULL, (SELECT id FROM users WHERE fname = 'Johann'), 'We suck... we cannot help it. Ass in class.' ),
  ((SELECT id FROM questions WHERE title = 'Help'), (SELECT id FROM replies WHERE body like '%suck%'), (SELECT id FROM users WHERE fname = 'Boy'), 'Yeah...that makes sense. :(' );
;

INSERT INTO
  question_likes (question_id, liker_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'How do I inject SQL?'), (SELECT id FROM users WHERE fname = 'Katie' AND lname = 'Lymn')),
  ((SELECT id FROM questions WHERE title = 'How do I inject SQL?'), (SELECT id FROM users WHERE fname = 'Johann')),
  ((SELECT id FROM questions WHERE title = 'Help'),(SELECT id FROM users WHERE fname = 'Johann')),
  ((SELECT id FROM questions WHERE title = 'How to efficiently determine whether there is a record in millions of records?'),(SELECT id FROM users WHERE fname = 'Nash')),
  ((SELECT id FROM questions WHERE title = 'Testing 123'),(SELECT id FROM users WHERE fname = 'Boy'));