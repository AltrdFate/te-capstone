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

-- **************************************************Recipe 2************************************************************ --

INSERT INTO recipe (user_id, name, rec_description) VALUES (2, 'Honey Glazed Chicken', 'A light meal that everyone will enjoy. Serve with steamed rice.');

INSERT INTO ingredients (recipe_id, ing_description) VALUES (7, '2 skinless, boneless chicken breast halves, cut into bite-size pieces');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (7, '1/4 cup honey');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (7, '2 tablespoons soy sauce');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (7, '1/8 teaspoon red pepper flakes');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (7, '1 1/2 tablespoons olive oil');


INSERT INTO directions (recipe_id, step_description) VALUES (7, 'Whisk honey, soy sauce, and red pepper flakes in a bowl.');
INSERT INTO directions (recipe_id, step_description) VALUES (7, 'Heat olive oil in a skillet over medium heat');
INSERT INTO directions (recipe_id, step_description) VALUES (7, 'cook and stir chicken in hot oil until lightly brown, about 5 minutes.');
INSERT INTO directions (recipe_id, step_description) VALUES (7, 'Pour honey mixture into skillet and continue to cook and stir until chicken is no longer pink in the center and sauce is thickened (approx. 5 - 8 minutes).');


INSERT INTO meal (user_id, meal_description) VALUES (2, 'A simple weekday staple');

INSERT INTO recipe_meal (recipe_id, meal_id) VALUES (7,7);


-- **************************************************Recipe 3************************************************************ --

INSERT INTO recipe (user_id, name, rec_description) VALUES (2, 'Oven Roasted Red Potatoes', 'These roasted red potatoes are very easy to prepare and taste excellent!');

INSERT INTO ingredients (recipe_id, ing_description) VALUES (8, '1 (1 ounce) envelope dry onion soup mix');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (8, '2 pounds red potatoes, halved');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (8, '1/3 cup olive oil');


INSERT INTO directions (recipe_id, step_description) VALUES (8, 'Preheat oven to 450 degrees F (230 degrees C).');
INSERT INTO directions (recipe_id, step_description) VALUES (8, 'In a large plastic bag, combine the soup mix, red potatoes and olive oil. Close bag, and shake until potatoes are fully covered.');
INSERT INTO directions (recipe_id, step_description) VALUES (8, 'Pour potatoes into a medium baking dish; bake 40 minutes in the preheated oven, stirring occasionally.');


INSERT INTO meal (user_id, meal_description) VALUES (2, 'The best side dish ever!');

INSERT INTO recipe_meal (recipe_id, meal_id) VALUES (8,8);


-- **************************************************Recipe 4************************************************************ --

INSERT INTO recipe (user_id, name, rec_description) VALUES (2, 'Slow Cooker Salisbury Steak', 'A delicious way to add flavor to ground beef and the children love it!');

INSERT INTO ingredients (recipe_id, ing_description) VALUES (9, '2 pounds lean ground beef');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (9, '1 (1 ounce) envelope dry onion soup mix');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (9, '1/2 cup Italian seasoned bread crumbs');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (9, '1/4 cup milk');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (9, '1/4 cup all-purpose flour');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (9, '2 tablespoons vegetable oil');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (9, '2 (10.75 ounce) cans condensed cream of chicken soup');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (9, '1 (1 ounce) packet dry au jus mix');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (9, '3/4 cup water');

INSERT INTO directions (recipe_id, step_description) VALUES (9, 'In a large bowl, mix together the ground beef, onion soup mix, bread crumbs, and milk using your hands. Shape into 8 patties.');
INSERT INTO directions (recipe_id, step_description) VALUES (9, 'Heat the oil in a large skillet over medium-high heat.');
INSERT INTO directions (recipe_id, step_description) VALUES (9, 'Dredge the patties in flour just to coat, and quickly brown on both sides in the hot skillet.');
INSERT INTO directions (recipe_id, step_description) VALUES (9, 'Place browned patties into the slow cooker stacking alternately like a pyramid. In a medium bowl, mix together the cream of chicken soup, au jus mix, and water.');
INSERT INTO directions (recipe_id, step_description) VALUES (9, 'Pour over the meat. Cook on the Low setting for 4 or 5 hours, until ground beef is well done.');

INSERT INTO meal (user_id, meal_description) VALUES (2, 'Beef Please!!');

INSERT INTO recipe_meal (recipe_id, meal_id) VALUES (9,9);


-- **************************************************Recipe 5************************************************************ --

INSERT INTO recipe (user_id, name, rec_description) VALUES (2, 'Baked Garlic Parmesan Chicken', 'A wonderful baked chicken recipe that is quick and easy!');

INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '6 skinless, boneless chicken breast halves');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '1 clove garlic, minced');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '1 cup dry bread crumbs');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '2/3 cup grated Parmesan cheese');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '1 teaspoon dried basil leaves');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '1/4 teaspoon ground black pepper');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '2 tablespoons olive oil');


INSERT INTO directions (recipe_id, step_description) VALUES (10, 'Preheat oven to 350 degrees F (175 degrees C). Lightly grease a 9x13 inch baking dish.');
INSERT INTO directions (recipe_id, step_description) VALUES (10, 'In a bowl, blend the olive oil and garlic.');
INSERT INTO directions (recipe_id, step_description) VALUES (10, 'In a separate bowl, mix the bread crumbs, Parmesan cheese, basil, and pepper.');
INSERT INTO directions (recipe_id, step_description) VALUES (10, 'Dip each chicken breast in the oil mixture, then in the bread crumb mixture.');
INSERT INTO directions (recipe_id, step_description) VALUES (10, 'Arrange the coated chicken breasts in the prepared baking dish, and top with any remaining bread crumb mixture.');
INSERT INTO directions (recipe_id, step_description) VALUES (10, 'Bake 30 minutes in the preheated oven, or until chicken is no longer pink and juices run clear.');


INSERT INTO meal (user_id, meal_description) VALUES (2, 'Tastes fried but baked!!!');

INSERT INTO recipe_meal (recipe_id, meal_id) VALUES (10,10);


-- **************************************************Recipe 6************************************************************ --

INSERT INTO recipe (user_id, name, rec_description) VALUES (2, 'Marinated Grilled Shrimp', 'A wonderful baked chicken recipe that is quick and easy!');

INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '6 skinless, boneless chicken breast halves');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '1 clove garlic, minced');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '1 cup dry bread crumbs');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '2/3 cup grated Parmesan cheese');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '1 teaspoon dried basil leaves');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '1/4 teaspoon ground black pepper');
INSERT INTO ingredients (recipe_id, ing_description) VALUES (10, '2 tablespoons olive oil');


INSERT INTO directions (recipe_id, step_description) VALUES (10, 'Preheat oven to 350 degrees F (175 degrees C). Lightly grease a 9x13 inch baking dish.');
INSERT INTO directions (recipe_id, step_description) VALUES (10, 'In a bowl, blend the olive oil and garlic.');
INSERT INTO directions (recipe_id, step_description) VALUES (10, 'In a separate bowl, mix the bread crumbs, Parmesan cheese, basil, and pepper.');
INSERT INTO directions (recipe_id, step_description) VALUES (10, 'Dip each chicken breast in the oil mixture, then in the bread crumb mixture.');
INSERT INTO directions (recipe_id, step_description) VALUES (10, 'Arrange the coated chicken breasts in the prepared baking dish, and top with any remaining bread crumb mixture.');
INSERT INTO directions (recipe_id, step_description) VALUES (10, 'Bake 30 minutes in the preheated oven, or until chicken is no longer pink and juices run clear.');


INSERT INTO meal (user_id, meal_description) VALUES (2, 'Tastes fried but baked!!!');

INSERT INTO recipe_meal (recipe_id, meal_id) VALUES (10,10);

COMMIT;