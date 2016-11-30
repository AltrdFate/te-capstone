-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here

CREATE SEQUENCE seq_users_user_id;

CREATE TABLE users (
	user_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_users_user_id'),
	username varchar(20),
	password varchar(20)
);

CREATE SEQUENCE seq_recipe_recipe_id;

CREATE TABLE recipe (
	recipe_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_recipe_recipe_id'),
	user_id INTEGER NOT NULL,
	name varchar(40),
	description varchar(300),
	ingredients varchar(300),
	directions varchar(1000)
);

ALTER TABLE recipe ADD CONSTRAINT fk_recipe_user_id FOREIGN KEY (user_id) REFERENCES users(user_id);



COMMIT;