DROP TABLE IF EXISTS products CASCADE;

CREATE TABLE products
(
type_id SERIAL PRIMARY KEY,
type VARCHAR(255),
number_available INT,
number_sold INT
);

DROP TABLE IF EXISTS ci_modules CASCADE;

CREATE TABLE ci_modules
(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
brand VARCHAR(255),
price DECIMAL(7,2),
number_available INT,
number_sold INT,
type_id INT,
FOREIGN KEY (type_id) REFERENCES products(type_id),
provider VARCHAR(255),
encoding VARCHAR(255)
);

DROP TABLE IF EXISTS televisions CASCADE;

CREATE TABLE televisions
(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
brand VARCHAR(255),
price DECIMAL(7,2),
number_available INT,
number_sold INT,
type_id INT,
FOREIGN KEY (type_id) REFERENCES products(type_id),
screen_type VARCHAR(255),
format_inches INT,
screen_resolution_pixels INT,
refresh_rate_hertz INT,
has_wifi BOOLEAN,
is_smart BOOLEAN,
has_voice_control BOOLEAN,
is_hdr_compatible BOOLEAN,
compatible_ci_module_id INT,
FOREIGN KEY (compatible_ci_module_id) REFERENCES ci_modules(id)
);

DROP TABLE IF EXISTS remotes;

CREATE TABLE remotes
(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
brand VARCHAR(255),
price DECIMAL(7,2),
number_available INT,
number_sold INT,
type_id INT,
FOREIGN KEY (type_id) REFERENCES products(type_id),
battery_type VARCHAR(255),
compatible_tv_id INT,
FOREIGN KEY (compatible_tv_id) REFERENCES televisions(id),
is_smart BOOLEAN
);

DROP TABLE IF EXISTS brackets CASCADE;

CREATE TABLE brackets
(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
brand VARCHAR(255),
price DECIMAL(7,2),
number_available INT,
number_sold INT,
type_id INT,
FOREIGN KEY (type_id) REFERENCES products(type_id),
format_inches INT,
mount_type VARCHAR(255),
adjustable BOOLEAN
);

DROP TABLE IF EXISTS bracket_television_compatibilities;

CREATE TABLE bracket_television_compatibilities
(
bracket_television_id SERIAL PRIMARY KEY,
bracket_id INT,
FOREIGN KEY (bracket_id) REFERENCES brackets(id),
television_id INT,
FOREIGN KEY (television_id) REFERENCES televisions(id)
);

ALTER TABLE ci_modules
RENAME id TO ci_module_id;
ALTER TABLE televisions
RENAME id TO television_id;
ALTER TABLE brackets
RENAME id TO bracket_id;
ALTER TABLE remotes
RENAME id TO remote_id;

ALTER TABLE bracket_television_compatibilities
RENAME television_id TO fk_television;
ALTER TABLE bracket_television_compatibilities
RENAME bracket_id TO fk_bracket;

ALTER TABLE televisions
RENAME type_id TO fk_type ;
ALTER TABLE remotes
RENAME type_id TO fk_type ;
ALTER TABLE brackets
RENAME type_id TO fk_type ;
ALTER TABLE ci_modules
RENAME type_id TO fk_type ;
ALTER TABLE remotes
RENAME compatible_tv_id TO fk_compatible_tv;
ALTER TABLE televisions
RENAME compatible_ci_module_id TO fk_compatible_ci_module;

ALTER TABLE products
RENAME type TO product_type;

ALTER TABLE products
ALTER COLUMN product_type SET NOT NULL;
ALTER TABLE products
ALTER COLUMN number_available SET NOT NULL;
ALTER TABLE products
ALTER COLUMN number_sold SET NOT NULL;
ALTER TABLE televisions
ALTER COLUMN number_available SET NOT NULL;
ALTER TABLE televisions
ALTER COLUMN number_sold SET NOT NULL;
ALTER TABLE televisions
ALTER COLUMN name SET NOT NULL;
ALTER TABLE televisions
ALTER COLUMN brand SET NOT NULL;
ALTER TABLE televisions
ALTER COLUMN price SET NOT NULL;
ALTER TABLE televisions
ALTER COLUMN fk_type SET NOT NULL;
ALTER TABLE remotes
ALTER COLUMN number_available SET NOT NULL;
ALTER TABLE remotes
ALTER COLUMN number_sold SET NOT NULL;
ALTER TABLE remotes
ALTER COLUMN name SET NOT NULL;
ALTER TABLE remotes
ALTER COLUMN brand SET NOT NULL;
ALTER TABLE remotes
ALTER COLUMN price SET NOT NULL;
ALTER TABLE remotes
ALTER COLUMN fk_type SET NOT NULL;
ALTER TABLE brackets
ALTER COLUMN number_available SET NOT NULL;
ALTER TABLE brackets
ALTER COLUMN number_sold SET NOT NULL;
ALTER TABLE brackets
ALTER COLUMN name SET NOT NULL;
ALTER TABLE brackets
ALTER COLUMN brand SET NOT NULL;
ALTER TABLE brackets
ALTER COLUMN price SET NOT NULL;
ALTER TABLE brackets
ALTER COLUMN fk_type SET NOT NULL;
ALTER TABLE ci_modules
ALTER COLUMN number_available SET NOT NULL;
ALTER TABLE ci_modules
ALTER COLUMN number_sold SET NOT NULL;
ALTER TABLE ci_modules
ALTER COLUMN name SET NOT NULL;
ALTER TABLE ci_modules
ALTER COLUMN brand SET NOT NULL;
ALTER TABLE ci_modules
ALTER COLUMN price SET NOT NULL;
ALTER TABLE ci_modules
ALTER COLUMN fk_type SET NOT NULL;
ALTER TABLE products
ADD CONSTRAINT type_unique UNIQUE(product_type);
ALTER TABLE televisions
ADD CONSTRAINT tv_name_unique UNIQUE(name);
ALTER TABLE remotes
ADD CONSTRAINT remote_name_unique UNIQUE(name);
ALTER TABLE brackets
ADD CONSTRAINT bracket_name_unique UNIQUE(name);
ALTER TABLE ci_modules
ADD CONSTRAINT ci_module_name_unique UNIQUE(name);

ALTER TABLE remotes
ADD CONSTRAINT compatible_tv_unique UNIQUE(fk_compatible_tv);

ALTER TABLE remotes
ALTER COLUMN fk_compatible_tv SET NOT NULL;

