CREATE TABLE users (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE schools (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    type TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    year_founded INTEGER NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE companies (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    industry TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE friend_connections (
    id INTEGER,
    user_id INTEGER NOT NULL,
    following_id INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(following_id) REFERENCES users(id)
);

CREATE TABLE user_schools (
    id INTEGER,
    school_id INTEGER NOT NULL,
    user_id INTEGER NOT NUll,
    start_date TEXT NOT NULL,
    end_date TEXT,
    type TEXT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(school_id) REFERENCES schools(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE user_companies (
    id INTEGER,
    user_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT,
    title TEXT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(company_id) REFERENCES companies(id)
);

INSERT INTO users(first_name, last_name, username, password)
VALUES('Alan', 'Garber', 'alan', 'password');
INSERT INTO users(first_name, last_name, username, password)
VALUES('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO schools(name, type, city, state, year_founded)
VALUES('Harvard University', 'University', 'Cambridge', 'Massachusetts', 1636);

INSERT INTO companies(name, industry, city, state)
VALUES('LinkedIn', 'Technology', 'Sunnyvale', 'California');

INSERT INTO user_schools(school_id, user_id, start_date, end_date, type)
VALUES(1, 1, 'September 1st 1973', 'June 1st 1976', 'BA');

INSERT INTO user_companies(user_id, company_id, start_date, end_date, title)
VALUES(2, 1, 'January 1st, 2003', 'February 1st, 2007', 'CEO Chairman');