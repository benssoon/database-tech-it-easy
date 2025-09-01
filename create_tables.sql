CREATE TABLE products
(
type_id SERIAL PRIMARY KEY,
type VARCHAR(255),
number_available INT,
number_sold INT
);

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

CREATE TABLE bracket_television_compatibilities
(
bracket_television_id SERIAL PRIMARY KEY,
bracket_id INT,
FOREIGN KEY (bracket_id) REFERENCES brackets(id),
television_id INT,
FOREIGN KEY (television_id) REFERENCES televisions(id)
);