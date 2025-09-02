INSERT INTO products (type, number_available, number_sold)
VALUES ('televisions', 20, 0);

INSERT INTO products (type, number_available, number_sold)
VALUES ('remotes', 20, 0);

INSERT INTO products (type, number_available, number_sold)
VALUES ('brackets', 20, 0);

INSERT INTO products (type, number_available, number_sold)
VALUES ('ci modules', 20, 0);


INSERT INTO televisions (name, brand, price, number_available, number_sold)
VALUES ('Super Big 4000', 'Sony', 4599.99, 2, 0);
INSERT INTO televisions (name, brand, price, number_available, number_sold)
VALUES ('tinytv', 'Sony', 1, 5, 0);


UPDATE televisions
SET fk_type = (SELECT type_id FROM products WHERE product_type='televisions');


CREATE OR REPLACE FUNCTION update_products_number_tvs_available()
RETURNS TRIGGER AS $$
DECLARE
	total_tvs_available INTEGER;
BEGIN
	-- Recalculate the total number of available TVs.
	SELECT SUM(number_available) INTO total_tvs_available
	FROM televisions;

	-- Update the corresponding products row.
	UPDATE products
	SET number_available = COALESCE(total_tvs_available, 0)
	WHERE product_type = 'televisions';

	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_product_availability
AFTER INSERT OR UPDATE OR DELETE ON televisions
FOR EACH STATEMENT
EXECUTE FUNCTION update_products_number_tvs_available();






CREATE OR REPLACE FUNCTION update_products_number_remotes_available()
RETURNS TRIGGER AS $$
DECLARE
	total_remotes_available INTEGER;
BEGIN
	-- Recalculate the total number of available remotes.
	SELECT SUM(number_available) INTO total_remotes_available
	FROM remotes;

	-- Update the corresponding products row.
	UPDATE products
	SET number_available = COALESCE(total_remotes_available, 0)
	WHERE product_type = 'remotes';

	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_product_availability
AFTER INSERT OR UPDATE OR DELETE ON remotes
FOR EACH STATEMENT
EXECUTE FUNCTION update_products_number_remotes_available();





CREATE OR REPLACE FUNCTION update_products_number_brackets_available()
RETURNS TRIGGER AS $$
DECLARE
	total_brackets_available INTEGER;
BEGIN
	-- Recalculate the total number of available brackets.
	SELECT SUM(number_available) INTO total_brackets_available
	FROM brackets;

	-- Update the corresponding products row.
	UPDATE products
	SET number_available = COALESCE(total_brackets_available, 0)
	WHERE product_type = 'brackets';

	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_product_availability
AFTER INSERT OR UPDATE OR DELETE ON brackets
FOR EACH STATEMENT
EXECUTE FUNCTION update_products_number_brackets_available();




CREATE OR REPLACE FUNCTION update_products_number_ci_modules_available()
RETURNS TRIGGER AS $$
DECLARE
	total_ci_modules_available INTEGER;
BEGIN
	-- Recalculate the total number of available ci_modules.
	SELECT SUM(number_available) INTO total_ci_modules_available
	FROM ci_modules;

	-- Update the corresponding products row.
	UPDATE products
	SET number_available = COALESCE(total_ci_modules_available, 0)
	WHERE product_type = 'ci_modules';

	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_product_availability
AFTER INSERT OR UPDATE OR DELETE ON ci_modules
FOR EACH STATEMENT
EXECUTE FUNCTION update_products_number_ci_modules_available();







INSERT INTO televisions (name, brand, price, number_available, number_sold, fk_type)
VALUES ('grande', 'Sony', 99999.99, 1, 0, 1);

INSERT INTO remotes (name, brand, price, number_available, number_sold, fk_type, fk_compatible_tv)
VALUES ('brippy', 'Sony', 2, 1, 0, (SELECT type_id FROM products WHERE product_type = 'remotes'), (SELECT television_id FROM televisions WHERE name = 'grande'));

INSERT INTO brackets (name, brand, price, number_available, number_sold, fk_type)
VALUES ('Big Arm 4000', 'Sony', 200, 3, 0, (SELECT type_id FROM products WHERE product_type = 'brackets'));

INSERT INTO ci_modules (name, brand, price, number_available, number_sold, fk_type)
VALUES ('Martian Hat', 'Sony', 68, 13, 0, (SELECT type_id FROM products WHERE product_type = 'ci modules'));


INSERT INTO televisions (television_id, name, brand, price, number_available, number_sold, fk_type)
VALUES (3, 'Gra', 'Sony', 399, 8, 0, 1);

INSERT INTO televisions (name, brand, price, number_available, number_sold, fk_type)
VALUES ('Blorp', 'Sony', 599, 18, 0, 1);

SELECT * FROM products;
SELECT * FROM televisions;
SELECT * FROM remotes;
SELECT * FROM ci_modules;
SELECT * FROM brackets;
SELECT * FROM bracket_television_compatibilities;