-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here

CREATE SEQUENCE seq_users_user_id;
CREATE SEQUENCE seq_recipe_recipe_id;
CREATE SEQUENCE seq_ingredients_ingredient_id;
CREATE SEQUENCE seq_directions_step_id;
CREATE SEQUENCE seq_meal_meal_id;
CREATE SEQUENCE seq_mealplan_mealplan_id;

CREATE TABLE users (
	user_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_users_user_id'),
	username varchar(20),
	password varchar(20)
);

CREATE TABLE recipe (
	recipe_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_recipe_recipe_id'),
	user_id INTEGER NOT NULL,
	name varchar(40),
	rec_description varchar(300)
);

ALTER TABLE recipe ADD CONSTRAINT fk_users_user_id FOREIGN KEY (user_id) REFERENCES users(user_id);

CREATE TABLE ingredients (
	ingredient_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_ingredients_ingredient_id'),
	recipe_id INTEGER NOT NULL,
	ing_description varchar(100)
);

ALTER TABLE ingredients ADD CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id);

CREATE TABLE directions (
	step_id 	INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_directions_step_id'),
	recipe_id INTEGER NOT NULL,
	--step_number INTEGER NOT NULL,
	step_description varchar(200)
);

ALTER TABLE directions ADD CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id);

CREATE TABLE meal (
	meal_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_meal_meal_id'),
	user_id INTEGER NOT NULL,
	meal_description varchar(200)
);

ALTER TABLE meal ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id);

CREATE TABLE recipe_meal (
	recipe_id INTEGER NOT NULL,
	meal_id INTEGER NOT NULL,
	CONSTRAINT pk_recipe_meal_recipe_id_meal_id PRIMARY KEY (recipe_id, meal_id)
);

ALTER TABLE recipe_meal 
ADD FOREIGN KEY (recipe_id)
REFERENCES recipe(recipe_id);

ALTER TABLE recipe_meal 
ADD FOREIGN KEY (meal_id)
REFERENCES meal(meal_id);

CREATE TABLE mealplan (
		mealplan_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_mealplan_mealplan_id'),
		user_id INTEGER NOT NULL,
		mealplan_description varchar(200)
);

ALTER TABLE mealplan ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id);


CREATE TABLE meal_mealplan (
	meal_id INTEGER NOT NULL,
	mealplan_id INTEGER NOT NULL,
	CONSTRAINT pk_meal_mealplan_meal_id_mealplan_id PRIMARY KEY (meal_id, mealplan_id)
);

ALTER TABLE meal_mealplan 
ADD FOREIGN KEY (meal_id)
REFERENCES meal(meal_id);

ALTER TABLE meal_mealplan 
ADD FOREIGN KEY (mealplan_id)
REFERENCES mealplan(mealplan_id);

INSERT INTO users (username, password) VALUES ('Leon','test');
--INSERT INTO users (username, password) VALUES ('Chris','test');
--INSERT INTO users (username, password) VALUES ('Asher','test');
--INSERT INTO users (username, password) VALUES ('Andre','test');
--INSERT INTO users (username, password) VALUES ('DWin','test');

INSERT INTO recipe (user_id, name, rec_description) VALUES (1, 'Burger', 'yummy');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (2, 'Burger', 'yummy');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (3, 'Burger', 'yummy');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (4, 'Burger', 'yummy');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (5, 'Burger', 'yummy');
INSERT INTO recipe (user_id, name, rec_description) VALUES (1, 'Waffles', 'sweet');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (2, 'Waffles', 'sweet');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (3, 'Waffles', 'sweet');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (4, 'Waffles', 'sweet');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (5, 'Waffles', 'sweet');
INSERT INTO recipe (user_id, name, rec_description) VALUES (1, 'Salad', 'healthy');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (2, 'Salad', 'healthy');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (3, 'Salad', 'healthy');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (4, 'Salad', 'healthy');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (5, 'Salad', 'healthy');
INSERT INTO recipe (user_id, name, rec_description) VALUES (1, 'Mac n Cheese', 'gooey');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (2, 'Mac n Cheese', 'gooey');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (3, 'Mac n Cheese', 'gooey');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (4, 'Mac n Cheese', 'gooey');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (5, 'Mac n Cheese', 'gooey');
INSERT INTO recipe (user_id, name, rec_description) VALUES (1, 'Pizza', 'cheesy');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (2, 'Pizza', 'cheesy');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (3, 'Pizza', 'cheesy');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (4, 'Pizza', 'cheesy');
--INSERT INTO recipe (user_id, name, rec_description) VALUES (5, 'Pizza', 'cheesy');

INSERT INTO ingredients (recipe_id, ing_description) VALUES (1, 'Cow');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (1, 'Cheese');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (1, 'Bun');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (1, 'Pickle');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (1, 'Onion');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (1, 'Tomato');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (1, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (1, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (1, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (1, '');

INSERT INTO ingredients (recipe_id, ing_description) VALUES (2, 'Cow');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (2, 'Cheese');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (2, 'Bun');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (2, 'Pickle');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (2, 'Onion');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (2, 'Tomato');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (2, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (2, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (2, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (2, '');

INSERT INTO ingredients (recipe_id, ing_description) VALUES (3, 'Cow');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (3, 'Cheese');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (3, 'Bun');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (3, 'Pickle');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (3, 'Onion');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (3, 'Tomato');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (3, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (3, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (3, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (3, '');

INSERT INTO ingredients (recipe_id, ing_description) VALUES (4, 'Noodles');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (4, 'Cheese');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (4, 'Breadcrumbs');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (4, 'Milk');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (4, 'Butter');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (4, 'Powdered Frog');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (4, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (4, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (4, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (4, '');

INSERT INTO ingredients (recipe_id, ing_description) VALUES (5, 'Flour');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (5, 'Olive Oil');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (5, 'Sugar');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (5, 'Milk');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (5, 'Baking Powder');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (5, 'Powdered Frog');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (5, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (5, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (5, '');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (5, '');

INSERT INTO directions (recipe_id, step_description) VALUES (1, 'Put meat on grill');
INSERT INTO directions (recipe_id, step_description) VALUES (1, 'Put cheese on meat');
INSERT INTO directions (recipe_id, step_description) VALUES (1, 'Put burger on bun');
INSERT INTO directions (recipe_id, step_description) VALUES (1, 'Add your choice of toppings');
INSERT INTO directions (recipe_id, step_description) VALUES (1, '');
INSERT INTO directions (recipe_id, step_description) VALUES (1, '');
INSERT INTO directions (recipe_id, step_description) VALUES (1, '');
INSERT INTO directions (recipe_id, step_description) VALUES (1, '');
INSERT INTO directions (recipe_id, step_description) VALUES (1, '');
INSERT INTO directions (recipe_id, step_description) VALUES (1, '');

INSERT INTO directions (recipe_id, step_description) VALUES (2, 'Mix dry ingredients');
INSERT INTO directions (recipe_id, step_description) VALUES (2, 'Mix wet ingredients');
INSERT INTO directions (recipe_id, step_description) VALUES (2, 'Pour wet ingredients onto dry ingredients');
INSERT INTO directions (recipe_id, step_description) VALUES (2, 'Mix well');
INSERT INTO directions (recipe_id, step_description) VALUES (2, 'Pour batter into waffle iron');
INSERT INTO directions (recipe_id, step_description) VALUES (2, '');
INSERT INTO directions (recipe_id, step_description) VALUES (2, '');
INSERT INTO directions (recipe_id, step_description) VALUES (2, '');
INSERT INTO directions (recipe_id, step_description) VALUES (2, '');
INSERT INTO directions (recipe_id, step_description) VALUES (2, '');

INSERT INTO directions (recipe_id, step_description) VALUES (3, 'Chop vegetables');
INSERT INTO directions (recipe_id, step_description) VALUES (3, 'Put in bowl');
INSERT INTO directions (recipe_id, step_description) VALUES (3, 'Pour on the Ranch dressing');
INSERT INTO directions (recipe_id, step_description) VALUES (3, 'Mix well');
INSERT INTO directions (recipe_id, step_description) VALUES (3, '');
INSERT INTO directions (recipe_id, step_description) VALUES (3, '');
INSERT INTO directions (recipe_id, step_description) VALUES (3, '');
INSERT INTO directions (recipe_id, step_description) VALUES (3, '');
INSERT INTO directions (recipe_id, step_description) VALUES (3, '');
INSERT INTO directions (recipe_id, step_description) VALUES (3, '');

INSERT INTO directions (recipe_id, step_description) VALUES (4, 'Cook noodles half way');
INSERT INTO directions (recipe_id, step_description) VALUES (4, 'Heat milk, butter and cheese');
INSERT INTO directions (recipe_id, step_description) VALUES (4, 'In a greased 9x11 baking dish, mix noodles and cheese sauce');
INSERT INTO directions (recipe_id, step_description) VALUES (4, 'Top with breadcrumbs');
INSERT INTO directions (recipe_id, step_description) VALUES (4, 'Bake at 350 degrees for 35 minutes');
INSERT INTO directions (recipe_id, step_description) VALUES (4, '');
INSERT INTO directions (recipe_id, step_description) VALUES (4, '');
INSERT INTO directions (recipe_id, step_description) VALUES (4, '');
INSERT INTO directions (recipe_id, step_description) VALUES (4, '');
INSERT INTO directions (recipe_id, step_description) VALUES (4, '');

INSERT INTO directions (recipe_id, step_description) VALUES (5, 'Mix dough');
INSERT INTO directions (recipe_id, step_description) VALUES (5, 'Spread dough on pizza pan');
INSERT INTO directions (recipe_id, step_description) VALUES (5, 'Add sauce and cheese');
INSERT INTO directions (recipe_id, step_description) VALUES (5, 'Bake at 450 degrees for 12 minutes');
INSERT INTO directions (recipe_id, step_description) VALUES (5, '');
INSERT INTO directions (recipe_id, step_description) VALUES (5, '');
INSERT INTO directions (recipe_id, step_description) VALUES (5, '');
INSERT INTO directions (recipe_id, step_description) VALUES (5, '');
INSERT INTO directions (recipe_id, step_description) VALUES (5, '');
INSERT INTO directions (recipe_id, step_description) VALUES (5, '');

INSERT INTO meal (user_id, meal_description) VALUES (1, 'Pizza and salad');
INSERT INTO meal (user_id, meal_description) VALUES (1, 'Burger and Mac n cheese');
INSERT INTO meal (user_id, meal_description) VALUES (1, 'Waffles, Salad and Pizza');
INSERT INTO meal (user_id, meal_description) VALUES (1, 'Mac n cheese');
INSERT INTO meal (user_id, meal_description) VALUES (1, 'Feast');
























COMMIT;