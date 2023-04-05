PRAGMA foreign_keys = ON;
DROP TABLE questions;
DROP TABLE users;
DROP TABLE question_follows;
DROP TABLE replies;
DROP TABLE question_likes;


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    id INTEGER PRIMARY KEY
);

CREATE TABLE question_follows (
    user_id INTEGER ,
    question_id INTEGER ,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    user_id INTEGER,
    reply_body TEXT NOT NULL,
    reply_id INTEGER,

    FOREIGN KEY (reply_id) REFERENCES replies(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    user_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    users( fname, lname ) 
VALUES
    ("Kevin", "Cho");

INSERT INTO 
    users( fname, lname ) 
VALUES
    ("Angelo", "Ciffone");

INSERT INTO 
    users( fname, lname ) 
VALUES
    ("Ayce", "Jones");

INSERT INTO 
    users( fname, lname ) 
VALUES
    ("Not", "Spencer");

INSERT INTO 
    users( fname, lname ) 
VALUES
    ("Not", "Kyle");


INSERT INTO 
    questions (title, body, user_id)
VALUES 
    ( "Why am I at App Academy", "Cause I''m broke", 1);

INSERT INTO 
    questions (title, body, user_id)
VALUES 
    ( "Why am I at App Academy 2", "Cause I''m broke", 3);

    INSERT INTO 
    questions (title, body, user_id)
VALUES 
    ( "Why am I at App Academy 3", "Cause I''m broke", 5);

INSERT INTO 
    questions (title, body, user_id)
VALUES 
    ( "Why am I at App Academy4", "Cause I''m broke", 1);

INSERT INTO 
    questions (title, body, user_id)
VALUES 
    ( "Why am I at App Academy5", "Cause I''m broke", 4);

