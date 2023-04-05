PRAGMA foreign_keys = ON;

CREATE TABLE questions (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE users (
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    id SERIAL PRIMARY KEY
);

CREATE TABLE question_follows (
    user_id INTEGER ,
    question_id INTEGER ,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id SERIAL PRIMARY KEY,
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

