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
CREATE SEQUENCE seq_ingredients_ingredient_id;
CREATE SEQUENCE seq_directions_step_id;

CREATE TABLE recipe (
	recipe_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_recipe_recipe_id'),
	user_id INTEGER NOT NULL,
	name varchar(40),
	rec_description varchar(300)
);

ALTER TABLE recipe ADD CONSTRAINT fk_recipe_user_id FOREIGN KEY (user_id) REFERENCES users(user_id);

CREATE TABLE ingredients (
	ingredient_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_ingredients_ingredient_id'),
	recipe_id INTEGER NOT NULL,
	ing_description varchar(100)
);

ALTER TABLE ingredients ADD CONSTRAINT fk_ingredients_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id);

CREATE TABLE directions (
	step_id 	INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_directions_step_id'),
	recipe_id INTEGER NOT NULL,
	step_number INTEGER NOT NULL,
	step_description varchar(200)
);

ALTER TABLE directions ADD CONSTRAINT fk_directions_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id);

COMMIT;