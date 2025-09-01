--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bracket_television_compatibilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bracket_television_compatibilities (
    bracket_television_id integer NOT NULL,
    bracket_id integer,
    television_id integer
);


ALTER TABLE public.bracket_television_compatibilities OWNER TO postgres;

--
-- Name: bracket_television_compatibilities_bracket_television_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bracket_television_compatibilities_bracket_television_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bracket_television_compatibilities_bracket_television_id_seq OWNER TO postgres;

--
-- Name: bracket_television_compatibilities_bracket_television_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bracket_television_compatibilities_bracket_television_id_seq OWNED BY public.bracket_television_compatibilities.bracket_television_id;


--
-- Name: brackets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brackets (
    id integer NOT NULL,
    name character varying(255),
    brand character varying(255),
    price numeric(7,2),
    number_available integer,
    number_sold integer,
    type_id integer,
    format_inches integer,
    mount_type character varying(255),
    adjustable boolean
);


ALTER TABLE public.brackets OWNER TO postgres;

--
-- Name: brackets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brackets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brackets_id_seq OWNER TO postgres;

--
-- Name: brackets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brackets_id_seq OWNED BY public.brackets.id;


--
-- Name: ci_modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ci_modules (
    id integer NOT NULL,
    name character varying(255),
    brand character varying(255),
    price numeric(7,2),
    number_available integer,
    number_sold integer,
    type_id integer,
    provider character varying(255),
    encoding character varying(255)
);


ALTER TABLE public.ci_modules OWNER TO postgres;

--
-- Name: ci_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ci_modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ci_modules_id_seq OWNER TO postgres;

--
-- Name: ci_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ci_modules_id_seq OWNED BY public.ci_modules.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    type_id integer NOT NULL,
    type character varying(255),
    number_available integer,
    number_sold integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_type_id_seq OWNER TO postgres;

--
-- Name: products_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_type_id_seq OWNED BY public.products.type_id;


--
-- Name: remotes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remotes (
    id integer NOT NULL,
    name character varying(255),
    brand character varying(255),
    price numeric(7,2),
    number_available integer,
    number_sold integer,
    type_id integer,
    battery_type character varying(255),
    compatible_tv_id integer,
    is_smart boolean
);


ALTER TABLE public.remotes OWNER TO postgres;

--
-- Name: remotes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remotes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remotes_id_seq OWNER TO postgres;

--
-- Name: remotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remotes_id_seq OWNED BY public.remotes.id;


--
-- Name: televisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.televisions (
    id integer NOT NULL,
    name character varying(255),
    brand character varying(255),
    price numeric(7,2),
    number_available integer,
    number_sold integer,
    type_id integer,
    screen_type character varying(255),
    format_inches integer,
    screen_resolution_pixels integer,
    refresh_rate_hertz integer,
    has_wifi boolean,
    is_smart boolean,
    has_voice_control boolean,
    is_hdr_compatible boolean,
    compatible_ci_module_id integer
);


ALTER TABLE public.televisions OWNER TO postgres;

--
-- Name: televisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.televisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.televisions_id_seq OWNER TO postgres;

--
-- Name: televisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.televisions_id_seq OWNED BY public.televisions.id;


--
-- Name: bracket_television_compatibilities bracket_television_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bracket_television_compatibilities ALTER COLUMN bracket_television_id SET DEFAULT nextval('public.bracket_television_compatibilities_bracket_television_id_seq'::regclass);


--
-- Name: brackets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brackets ALTER COLUMN id SET DEFAULT nextval('public.brackets_id_seq'::regclass);


--
-- Name: ci_modules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ci_modules ALTER COLUMN id SET DEFAULT nextval('public.ci_modules_id_seq'::regclass);


--
-- Name: products type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN type_id SET DEFAULT nextval('public.products_type_id_seq'::regclass);


--
-- Name: remotes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remotes ALTER COLUMN id SET DEFAULT nextval('public.remotes_id_seq'::regclass);


--
-- Name: televisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.televisions ALTER COLUMN id SET DEFAULT nextval('public.televisions_id_seq'::regclass);


--
-- Data for Name: bracket_television_compatibilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bracket_television_compatibilities (bracket_television_id, bracket_id, television_id) FROM stdin;
\.


--
-- Data for Name: brackets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brackets (id, name, brand, price, number_available, number_sold, type_id, format_inches, mount_type, adjustable) FROM stdin;
\.


--
-- Data for Name: ci_modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ci_modules (id, name, brand, price, number_available, number_sold, type_id, provider, encoding) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (type_id, type, number_available, number_sold) FROM stdin;
1	televisions	20	0
3	remotes	20	0
4	ci modules	20	0
5	brackets	20	0
\.


--
-- Data for Name: remotes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.remotes (id, name, brand, price, number_available, number_sold, type_id, battery_type, compatible_tv_id, is_smart) FROM stdin;
\.


--
-- Data for Name: televisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.televisions (id, name, brand, price, number_available, number_sold, type_id, screen_type, format_inches, screen_resolution_pixels, refresh_rate_hertz, has_wifi, is_smart, has_voice_control, is_hdr_compatible, compatible_ci_module_id) FROM stdin;
\.


--
-- Name: bracket_television_compatibilities_bracket_television_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bracket_television_compatibilities_bracket_television_id_seq', 1, false);


--
-- Name: brackets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brackets_id_seq', 1, false);


--
-- Name: ci_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ci_modules_id_seq', 1, false);


--
-- Name: products_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_type_id_seq', 5, true);


--
-- Name: remotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.remotes_id_seq', 1, false);


--
-- Name: televisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.televisions_id_seq', 1, false);


--
-- Name: bracket_television_compatibilities bracket_television_compatibilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bracket_television_compatibilities
    ADD CONSTRAINT bracket_television_compatibilities_pkey PRIMARY KEY (bracket_television_id);


--
-- Name: brackets brackets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brackets
    ADD CONSTRAINT brackets_pkey PRIMARY KEY (id);


--
-- Name: ci_modules ci_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ci_modules
    ADD CONSTRAINT ci_modules_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (type_id);


--
-- Name: remotes remotes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remotes
    ADD CONSTRAINT remotes_pkey PRIMARY KEY (id);


--
-- Name: televisions televisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.televisions
    ADD CONSTRAINT televisions_pkey PRIMARY KEY (id);


--
-- Name: bracket_television_compatibilities bracket_television_compatibilities_bracket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bracket_television_compatibilities
    ADD CONSTRAINT bracket_television_compatibilities_bracket_id_fkey FOREIGN KEY (bracket_id) REFERENCES public.brackets(id);


--
-- Name: bracket_television_compatibilities bracket_television_compatibilities_television_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bracket_television_compatibilities
    ADD CONSTRAINT bracket_television_compatibilities_television_id_fkey FOREIGN KEY (television_id) REFERENCES public.televisions(id);


--
-- Name: brackets brackets_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brackets
    ADD CONSTRAINT brackets_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.products(type_id);


--
-- Name: ci_modules ci_modules_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ci_modules
    ADD CONSTRAINT ci_modules_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.products(type_id);


--
-- Name: remotes remotes_compatible_tv_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remotes
    ADD CONSTRAINT remotes_compatible_tv_id_fkey FOREIGN KEY (compatible_tv_id) REFERENCES public.televisions(id);


--
-- Name: remotes remotes_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remotes
    ADD CONSTRAINT remotes_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.products(type_id);


--
-- Name: televisions televisions_compatible_ci_module_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.televisions
    ADD CONSTRAINT televisions_compatible_ci_module_id_fkey FOREIGN KEY (compatible_ci_module_id) REFERENCES public.ci_modules(id);


--
-- Name: televisions televisions_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.televisions
    ADD CONSTRAINT televisions_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.products(type_id);


--
-- PostgreSQL database dump complete
--

