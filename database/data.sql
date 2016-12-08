-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here
INSERT INTO users (username, password) VALUES ('NitWitt','test');

INSERT INTO recipe (user_id, name, rec_description) VALUES (2, 'Honey-Garlic Slow Cooker Chicken Thighs', 'Always a hit with adults and kids. Serve with basmati rice or quinoa and steamed or roasted vegetables.');

INSERT INTO ingredients (recipe_id, ing_description) VALUES (6, '4 skinless, boneless chicken thighs');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (6, '1/2 cup soy sauce');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (6, '1/2 cup ketchup');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (6, '1/3 cup honey');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (6, '3 cloves garlic, minced');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (6, '1 teaspoon dried basil');

INSERT INTO directions (recipe_id, step_description) VALUES (6, 'Lay chicken thighs into the bottom of a 4-quart slow cooker.');
INSERT INTO directions (recipe_id, step_description) VALUES (6, 'Whisk soy sauce, ketchup, honey, garlic, and basil together in a bowl; pour over the chicken.');
INSERT INTO directions (recipe_id, step_description) VALUES (6, 'Cook on Low for 6 hours.');

INSERT INTO meal (user_id, meal_description) VALUES (2, 'A yummy treat meal for a busy workday');

INSERT INTO recipe_meal (recipe_id, meal_id) VALUES (6,6);





COMMIT;