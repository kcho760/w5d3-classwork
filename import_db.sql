
CREATE TABLE questions
    questions_id INTEGER PRIMARY KEY
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER,
    
    FOREIGN KEY (author_id) REFERENCES users(id)


CREATE TABLE users
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    id INTEGER PRIMARY KEY,

CREATE TABLE question_follows
    