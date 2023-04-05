
CREATE TABLE questions
    id SERIAL PRIMARY KEY
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id SERIAL,
    
    FOREIGN KEY (author_id) REFERENCES users(id)


CREATE TABLE users
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    id SERIAL PRIMARY KEY,

CREATE TABLE question_follows
    user_id INTEGER 
    FOREIGN KEY (user_id) REFERENCES questions(id)
    questions_id INTEGER 
    FOREIGN KEY (questions_id) REFERENCES users(id)

CREATE TABLE replies
    id SERIAL PRIMARY KEY 
    question_id INTEGER 
    FOREIGN KEY (question_id) REFERENCES questions(id)
    reply_id INTEGER REFERENCES replies(id)
    user_id INTEGER 
    FOREIGN KEY (user_id) REFERENCES users(id)



