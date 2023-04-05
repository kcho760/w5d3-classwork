CREATE TABLE users
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    id INTEGER PRIMARY KEY,

CREATE TABLE questions
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER PRIMARY KEY,

    FOREIGN KEY (author_id) REFERENCES users(id)

CREATE TABLE question_follows
