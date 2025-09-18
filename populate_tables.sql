INSERT INTO products (product_type, number_available, number_sold)
VALUES ('televisions', 20, 0);

INSERT INTO products (product_type, number_available, number_sold)
VALUES ('remotes', 20, 0);

INSERT INTO products (product_type, number_available, number_sold)
VALUES ('brackets', 20, 0);

INSERT INTO products (product_type, number_available, number_sold)
VALUES ('ci modules', 20, 0);


INSERT INTO televisions (name, brand, price, number_available, number_sold, fk_type)
VALUES ('Super Big 4000', 'Sony', 4599.99, 2, 0, (SELECT type_id FROM products WHERE product_type = 'televisions'));
INSERT INTO televisions (name, brand, price, number_available, number_sold, fk_type)
VALUES ('tinytv', 'Sony', 1, 5, 0, (SELECT type_id FROM products WHERE product_type = 'televisions'));


UPDATE televisions
SET fk_type = (SELECT type_id FROM products WHERE product_type='televisions');

------------------------------------------------------------------------
---------------------------- Triggers ----------------------------------
------------------------------------------------------------------------
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

------------------------------------------------------------------------
------------------------------------------------------------------------

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

------------------------------------------------------------------------
------------------------------------------------------------------------

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

------------------------------------------------------------------------
------------------------------------------------------------------------

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

------------------------------------------------------------------------
------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_products_number_tvs_sold()
RETURNS TRIGGER AS $$
DECLARE
	total_tvs_sold INTEGER;
BEGIN
	-- Recalculate the total number of sold TVs.
	SELECT SUM(number_sold) INTO total_tvs_sold
	FROM televisions;

	-- Update the corresponding products row.
	UPDATE products
	SET number_sold = COALESCE(total_tvs_sold, 0)
	WHERE product_type = 'televisions';

	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_product_sales
AFTER INSERT OR UPDATE OR DELETE ON televisions
FOR EACH STATEMENT
EXECUTE FUNCTION update_products_number_tvs_sold();

------------------------------------------------------------------------
------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_products_number_remotes_sold()
RETURNS TRIGGER AS $$
DECLARE
	total_remotes_sold INTEGER;
BEGIN
	-- Recalculate the total number of sold remotes.
	SELECT SUM(number_sold) INTO total_remotes_sold
	FROM remotes;

	-- Update the corresponding products row.
	UPDATE products
	SET number_sold = COALESCE(total_remotes_sold, 0)
	WHERE product_type = 'remotes';

	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_product_sales
AFTER INSERT OR UPDATE OR DELETE ON remotes
FOR EACH STATEMENT
EXECUTE FUNCTION update_products_number_remotes_sold();

------------------------------------------------------------------------
------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_products_number_brackets_sold()
RETURNS TRIGGER AS $$
DECLARE
	total_brackets_sold INTEGER;
BEGIN
	-- Recalculate the total number of sold brackets.
	SELECT SUM(number_sold) INTO total_brackets_sold
	FROM brackets;

	-- Update the corresponding products row.
	UPDATE products
	SET number_sold = COALESCE(total_brackets_sold, 0)
	WHERE product_type = 'brackets';

	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_product_sales
AFTER INSERT OR UPDATE OR DELETE ON brackets
FOR EACH STATEMENT
EXECUTE FUNCTION update_products_number_brackets_sold();

------------------------------------------------------------------------
------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_products_number_ci_modules_sold()
RETURNS TRIGGER AS $$
DECLARE
	total_ci_modules_sold INTEGER;
BEGIN
	-- Recalculate the total number of sold ci_modules.
	SELECT SUM(number_sold) INTO total_ci_modules_sold
	FROM ci_modules;

	-- Update the corresponding products row.
	UPDATE products
	SET number_sold = COALESCE(total_ci_modules_sold, 0)
	WHERE product_type = 'ci_modules';

	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_product_sales
AFTER INSERT OR UPDATE OR DELETE ON ci_modules
FOR EACH STATEMENT
EXECUTE FUNCTION update_products_number_ci_modules_sold();

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

INSERT INTO televisions (name, brand, price, number_available, number_sold, fk_type)
VALUES ('grande', 'Sony', 99999.99, 1, 0, 1);

INSERT INTO remotes (name, brand, price, number_available, number_sold, fk_type, fk_compatible_tv)
VALUES ('brippy', 'Sony', 2, 1, 0, (SELECT type_id FROM products WHERE product_type = 'remotes'), (SELECT television_id FROM televisions WHERE name = 'grande'));

INSERT INTO brackets (name, brand, price, number_available, number_sold, fk_type)
VALUES ('Big Arm 4000', 'Sony', 200, 3, 0, (SELECT type_id FROM products WHERE product_type = 'brackets'));

INSERT INTO ci_modules (name, brand, price, number_available, number_sold, fk_type)
VALUES ('Martian Hat', 'Sony', 68, 13, 0, (SELECT type_id FROM products WHERE product_type = 'ci modules'));

INSERT INTO televisions (name, brand, price, number_available, number_sold, fk_type)
VALUES ('Gra', 'Sony', 399, 8, 0, 1);

INSERT INTO televisions (name, brand, price, number_available, number_sold, fk_type)
VALUES ('Blorp', 'Sony', 599, 18, 0, 1);

INSERT INTO bracket_television_compatibilities (fk_bracket, fk_television)
VALUES (1, 3);

INSERT INTO ci_modules (name, brand, price, number_available, number_sold, fk_type, provider, encoding)
VALUES ('Quarvine CI+ 23001', 'Quarvine', 52, 13, 2038, (SELECT type_id FROM products WHERE product_type = 'ci modules'), 'Biggo', 'secret');


INSERT INTO televisions (name, brand, price, number_available, number_sold, fk_type, screen_type, format_inches, screen_resolution_pixels, refresh_rate_hertz, has_wifi, is_smart, has_voice_control, is_hdr_compatible, fk_compatible_ci_module)
VALUES ('MegaScreener 9000', 'Toshiba', 1000.26, 39857, 0, (SELECT type_id FROM products WHERE product_type = 'televisions'), 'OLED', 200, 4096, 360, TRUE, TRUE, TRUE, FALSE, 2);

UPDATE televisions
SET fk_compatible_ci_module = 1
WHERE fk_compatible_ci_module IS NULL;

UPDATE products
SET product_type = 'ci_modules'
WHERE type_id = 4;

INSERT INTO ci_modules (name, brand, price, number_available, number_sold, fk_type, provider, encoding)
VALUES ('Quarvine CI+ 32', 'Quarvine', 32, 32, 32, (SELECT type_id FROM products WHERE product_type = 'ci_modules'), 'Biggo', 'ABC');

UPDATE televisions
SET format_inches = 60
WHERE number_available < 8;

INSERT INTO brackets (name, brand, price, number_available, number_sold, fk_type, format_inches, mount_type, adjustable)
VALUES ('Clippy Clip', 'Sony', 67.67, 67, 670, (SELECT type_id FROM products WHERE product_type = 'brackets'), 60, 'clip', FALSE);

INSERT INTO bracket_television_compatibilities (fk_bracket, fk_television)
SELECT brackets.bracket_id, televisions.television_id
FROM brackets
JOIN televisions ON brackets.format_inches = televisions.format_inches;

DELETE
FROM bracket_television_compatibilities
WHERE bracket_television_id > 4;


SELECT * FROM products ORDER BY type_id;
SELECT * FROM televisions ORDER BY television_id;
SELECT * FROM remotes ORDER BY remote_id;
SELECT * FROM ci_modules ORDER BY ci_module_id;
SELECT * FROM brackets ORDER BY bracket_id;
SELECT * FROM bracket_television_compatibilities ORDER BY bracket_television_id;
SELECT
	t.name,
	b.name
FROM televisions t
JOIN bracket_television_compatibilities j
	ON t.television_id = j.fk_television
JOIN brackets b
	ON b.bracket_id = j.fk_bracket;