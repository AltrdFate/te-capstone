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


COMMIT;