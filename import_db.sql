CREATE TABLE users
    fname TEXT NOT NULL
    lname TEXT NOT NULL
    id INTEGER NOt NULL

CREATE TABLE questions
    title TEXT NOT NULL
    body TEXT NOT NULL
    author_id INTEGER NOT NULL

    FOREIGN KEY (author_id) REFERENCES users(id)

CREATE TABLE question_follows
