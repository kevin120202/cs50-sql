CREATE table ingredients (
    id INTEGER,
    name TEXT NOT NULL,
    price_per_unit NUMERIC NOT NULL,
    unit TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE donuts (
    id INTEGER,
    name TEXT NOT NULL,
    is_gluten_free INTEGER NOT NULL,
    price NUMERIC NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE donut_ingredients (
    id INTEGER,
    donut_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(donut_id) REFERENCES donuts(id),
    FOREIGN KEY(ingredient_id) REFERENCES ingredients(id)
);

CREATE TABLE orders (
    id INTEGER,
    order_number INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

CREATE TABLE customers (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE donut_orders (
    id INTEGER,
    order_id INTEGER NOT NULL,
    donut_id INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(donut_id) REFERENCES donuts(id)
);

CREATE TABLE order_histories (
    id INTEGER,
    customer_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(customer_id) REFERENCES customers(id),
    FOREIGN KEY(order_id) REFERENCES orders(id)
);

INSERT INTO ingredients(name, price_per_unit, unit)
VALUES ('Cocoa', 5.00, 'pound');
INSERT INTO ingredients(name, price_per_unit, unit)
VALUES ('Sugar', 2.00, 'pound');
INSERT INTO ingredients(name, price_per_unit, unit)
VALUES ('Flour', 5.00, 'pound');
INSERT INTO ingredients(name, price_per_unit, unit)
VALUES ('Buttermilk', 6.00, 'pound');
INSERT INTO ingredients(name, price_per_unit, unit)
VALUES ('Sprinkles', 1.00, 'pound');

INSERT INTO donuts(name, is_gluten_free, price)
VALUES ('Belgian Dark Chocolate', 0, 4.00);
INSERT INTO donuts(name, is_gluten_free, price)
VALUES ('Back-To-School Sprinkles', 0, 4.00);

INSERT INTO donut_ingredients(donut_id, ingredient_id)
VALUES (1, 1);
INSERT INTO donut_ingredients(donut_id, ingredient_id)
VALUES (1, 3);
INSERT INTO donut_ingredients(donut_id, ingredient_id)
VALUES (1, 4);
INSERT INTO donut_ingredients(donut_id, ingredient_id)
VALUES (1, 2);

INSERT INTO donut_ingredients(donut_id, ingredient_id)
VALUES (2, 3);
INSERT INTO donut_ingredients(donut_id, ingredient_id)
VALUES (2, 4);
INSERT INTO donut_ingredients(donut_id, ingredient_id)
VALUES (2, 2);
INSERT INTO donut_ingredients(donut_id, ingredient_id)
VALUES (2, 5);

INSERT INTO customers(first_name, last_name)
VALUES ('Luis', 'Singh');

INSERT INTO orders(order_number, customer_id)
VALUES (1, 1);

INSERT INTO donut_orders(order_id, donut_id)
VALUES (1, 2);
INSERT INTO donut_orders(order_id, donut_id)
VALUES (1, 2);
INSERT INTO donut_orders(order_id, donut_id)
VALUES (1, 1);
INSERT INTO donut_orders(order_id, donut_id)
VALUES (1, 1);
INSERT INTO donut_orders(order_id, donut_id)
VALUES (1, 1);

INSERT INTO order_histories(order_id, customer_id)
VALUES (1, 1);