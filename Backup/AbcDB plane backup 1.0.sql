--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-07-03 14:22:02

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

--
-- TOC entry 6 (class 2615 OID 16400)
-- Name: main_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA main_schema;


ALTER SCHEMA main_schema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 232 (class 1259 OID 16542)
-- Name: categories; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE main_schema.categories OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16580)
-- Name: comments; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.comments (
    id integer NOT NULL,
    comment_text text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    customer_id integer
);


ALTER TABLE main_schema.comments OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16579)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: main_schema; Owner: postgres
--

CREATE SEQUENCE main_schema.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main_schema.comments_id_seq OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 234
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: main_schema; Owner: postgres
--

ALTER SEQUENCE main_schema.comments_id_seq OWNED BY main_schema.comments.id;


--
-- TOC entry 228 (class 1259 OID 16511)
-- Name: country; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.country (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE main_schema.country OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16510)
-- Name: country_id_seq; Type: SEQUENCE; Schema: main_schema; Owner: postgres
--

CREATE SEQUENCE main_schema.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main_schema.country_id_seq OWNER TO postgres;

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 227
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: main_schema; Owner: postgres
--

ALTER SEQUENCE main_schema.country_id_seq OWNED BY main_schema.country.id;


--
-- TOC entry 224 (class 1259 OID 16497)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: main_schema; Owner: postgres
--

CREATE SEQUENCE main_schema.customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main_schema.customer_id_seq OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16411)
-- Name: customers; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.customers (
    id integer DEFAULT nextval('main_schema.customer_id_seq'::regclass) NOT NULL,
    full_name character varying(100),
    email character varying(100),
    last_login timestamp without time zone,
    password character varying(100),
    address character varying(100),
    country_id integer,
    postal_code character varying(50),
    phone character varying(50)
);


ALTER TABLE main_schema.customers OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16410)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: main_schema; Owner: postgres
--

CREATE SEQUENCE main_schema.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main_schema.customers_customer_id_seq OWNER TO postgres;

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 218
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: main_schema; Owner: postgres
--

ALTER SEQUENCE main_schema.customers_customer_id_seq OWNED BY main_schema.customers.id;


--
-- TOC entry 226 (class 1259 OID 16504)
-- Name: order_id_seq; Type: SEQUENCE; Schema: main_schema; Owner: postgres
--

CREATE SEQUENCE main_schema.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main_schema.order_id_seq OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16632)
-- Name: order_items; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.order_items (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE main_schema.order_items OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16427)
-- Name: orders; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.orders (
    id integer NOT NULL,
    customer_id integer,
    date timestamp without time zone,
    description text
);


ALTER TABLE main_schema.orders OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16426)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: main_schema; Owner: postgres
--

CREATE SEQUENCE main_schema.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main_schema.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: main_schema; Owner: postgres
--

ALTER SEQUENCE main_schema.orders_order_id_seq OWNED BY main_schema.orders.id;


--
-- TOC entry 233 (class 1259 OID 16550)
-- Name: product_categories; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.product_categories (
    product_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE main_schema.product_categories OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16541)
-- Name: product_category_id_seq; Type: SEQUENCE; Schema: main_schema; Owner: postgres
--

CREATE SEQUENCE main_schema.product_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main_schema.product_category_id_seq OWNER TO postgres;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 231
-- Name: product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: main_schema; Owner: postgres
--

ALTER SEQUENCE main_schema.product_category_id_seq OWNED BY main_schema.categories.id;


--
-- TOC entry 225 (class 1259 OID 16498)
-- Name: product_id_seq; Type: SEQUENCE; Schema: main_schema; Owner: postgres
--

CREATE SEQUENCE main_schema.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main_schema.product_id_seq OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16617)
-- Name: product_tags; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.product_tags (
    product_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE main_schema.product_tags OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16420)
-- Name: products; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.products (
    id integer DEFAULT nextval('main_schema.product_id_seq'::regclass) NOT NULL,
    name character varying(100),
    supplier integer,
    price numeric(10,2),
    product_description text,
    image character varying(255)
);


ALTER TABLE main_schema.products OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16594)
-- Name: products_comments; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.products_comments (
    product_id integer NOT NULL,
    comment_id integer NOT NULL
);


ALTER TABLE main_schema.products_comments OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16419)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: main_schema; Owner: postgres
--

CREATE SEQUENCE main_schema.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main_schema.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 220
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: main_schema; Owner: postgres
--

ALTER SEQUENCE main_schema.products_product_id_seq OWNED BY main_schema.products.id;


--
-- TOC entry 241 (class 1259 OID 16647)
-- Name: returned_items; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.returned_items (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    return_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE main_schema.returned_items OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16402)
-- Name: stored_queries; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.stored_queries (
    query_id integer NOT NULL,
    query_name character varying(100),
    query_text text
);


ALTER TABLE main_schema.stored_queries OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16401)
-- Name: stored_queries_query_id_seq; Type: SEQUENCE; Schema: main_schema; Owner: postgres
--

CREATE SEQUENCE main_schema.stored_queries_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main_schema.stored_queries_query_id_seq OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 216
-- Name: stored_queries_query_id_seq; Type: SEQUENCE OWNED BY; Schema: main_schema; Owner: postgres
--

ALTER SEQUENCE main_schema.stored_queries_query_id_seq OWNED BY main_schema.stored_queries.query_id;


--
-- TOC entry 230 (class 1259 OID 16535)
-- Name: suppliers; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.suppliers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(255),
    contact character varying(100)
);


ALTER TABLE main_schema.suppliers OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16534)
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: main_schema; Owner: postgres
--

CREATE SEQUENCE main_schema.supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main_schema.supplier_id_seq OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 229
-- Name: supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: main_schema; Owner: postgres
--

ALTER SEQUENCE main_schema.supplier_id_seq OWNED BY main_schema.suppliers.id;


--
-- TOC entry 238 (class 1259 OID 16610)
-- Name: tags; Type: TABLE; Schema: main_schema; Owner: postgres
--

CREATE TABLE main_schema.tags (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE main_schema.tags OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16609)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: main_schema; Owner: postgres
--

CREATE SEQUENCE main_schema.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main_schema.tags_id_seq OWNER TO postgres;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 237
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: main_schema; Owner: postgres
--

ALTER SEQUENCE main_schema.tags_id_seq OWNED BY main_schema.tags.id;


--
-- TOC entry 4704 (class 2604 OID 16545)
-- Name: categories id; Type: DEFAULT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.categories ALTER COLUMN id SET DEFAULT nextval('main_schema.product_category_id_seq'::regclass);


--
-- TOC entry 4705 (class 2604 OID 16583)
-- Name: comments id; Type: DEFAULT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.comments ALTER COLUMN id SET DEFAULT nextval('main_schema.comments_id_seq'::regclass);


--
-- TOC entry 4702 (class 2604 OID 16514)
-- Name: country id; Type: DEFAULT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.country ALTER COLUMN id SET DEFAULT nextval('main_schema.country_id_seq'::regclass);


--
-- TOC entry 4701 (class 2604 OID 16430)
-- Name: orders id; Type: DEFAULT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.orders ALTER COLUMN id SET DEFAULT nextval('main_schema.orders_order_id_seq'::regclass);


--
-- TOC entry 4698 (class 2604 OID 16405)
-- Name: stored_queries query_id; Type: DEFAULT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.stored_queries ALTER COLUMN query_id SET DEFAULT nextval('main_schema.stored_queries_query_id_seq'::regclass);


--
-- TOC entry 4703 (class 2604 OID 16538)
-- Name: suppliers id; Type: DEFAULT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.suppliers ALTER COLUMN id SET DEFAULT nextval('main_schema.supplier_id_seq'::regclass);


--
-- TOC entry 4707 (class 2604 OID 16613)
-- Name: tags id; Type: DEFAULT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.tags ALTER COLUMN id SET DEFAULT nextval('main_schema.tags_id_seq'::regclass);


--
-- TOC entry 4910 (class 0 OID 16542)
-- Dependencies: 232
-- Data for Name: categories; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.categories (id, name, description) FROM stdin;
1	Fashion	Clothing, footwear, accessories and other fashion products
2	Electronics	Devices, gadgets, and accessories like phones, laptops, and tablets
3	Home & Kitchen	Appliances, utensils, and other home and kitchen products
4	Books	Printed and digital books across various genres
5	Health & Beauty	Health care, wellness, and beauty products
6	Sports	Sporting goods, equipment, and accessories
7	Toys	Toys, games, and recreational products for children and adults
8	Automotive	Car parts, accessories, and other automotive products
9	Garden & Outdoors	Gardening tools, outdoor furniture, and other outdoor products
10	Office Supplies	Office equipment, stationery, and other office supplies
\.


--
-- TOC entry 4913 (class 0 OID 16580)
-- Dependencies: 235
-- Data for Name: comments; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.comments (id, comment_text, created_at, customer_id) FROM stdin;
1	Great product, highly recommend!	2024-07-02 22:32:21.731027	7
2	Not what I expected, quality could be better.	2024-07-02 22:32:21.731027	8
3	Excellent value for money.	2024-07-02 22:32:21.731027	9
4	Fast shipping, great customer service.	2024-07-02 22:32:21.731027	10
5	The product arrived damaged.	2024-07-02 22:32:21.731027	11
6	Very satisfied with the purchase.	2024-07-02 22:32:21.731027	12
7	Would buy again.	2024-07-02 22:32:21.731027	13
8	Not satisfied with the customer service.	2024-07-02 22:32:21.731027	14
9	Product is as described.	2024-07-02 22:32:21.731027	15
10	Amazing quality, will recommend to friends.	2024-07-02 22:32:21.731027	16
\.


--
-- TOC entry 4906 (class 0 OID 16511)
-- Dependencies: 228
-- Data for Name: country; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.country (id, name) FROM stdin;
1	Germany
2	France
3	Italy
4	Spain
5	Netherlands
6	Belgium
7	Austria
8	Sweden
9	Norway
10	Denmark
\.


--
-- TOC entry 4897 (class 0 OID 16411)
-- Dependencies: 219
-- Data for Name: customers; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.customers (id, full_name, email, last_login, password, address, country_id, postal_code, phone) FROM stdin;
7	Andrew Allen	dustingonzalez@example.org	2024-03-20 06:55:18	d805d109aaf28bbc34947e8dd36a0e8c	Concord	1	28027	936-453-5731
8	Adam Bellavance	clarktara@example.org	2024-05-31 18:52:09	0dbc7c83ebdd9276b15736c97181ca00	New York City	2	10009	472-904-2535x7989
9	Allen Armold	browncourtney@example.net	2024-03-10 10:18:29	29fb2c6e8e03282dd05330cd8e2f009a	Mesa	3	85204	880.968.3412x6467
10	Alan Barnes	mhowell@example.com	2024-04-29 12:02:19	4375ce39c424f1aa770308659d2acb05	Los Angeles	4	90036	001-377-448-8935x922
11	Alex Avila	ashleygross@example.net	2024-03-12 05:13:10	7907101f7f006f84c6c3919bb08b3e94	Minneapolis	5	55407	+1-535-636-1847x5276
12	Alejandro Ballentine	cnorris@example.net	2024-05-12 10:09:42	b3c7f7f38583b9dc0deafbb9e170ad14	Lorain	6	44052	001-590-579-5789x34901
13	Adrian Barton	lisalawrence@example.com	2024-06-10 12:26:07	8ea21a46baede8414e65700164598faf	Phoenix	7	85023	(300)570-4204x6401
14	Aimee Bixby	rpatel@example.net	2024-02-27 14:38:21	0363ae5f23cfa176a654a674736ef76f	Long Beach	8	11561	001-552-943-4627
15	Anna Andreadi	clarkanthony@example.com	2024-07-01 13:16:44	18f7e93c02019f41dd3a43647e6c326f	Chester	9	19013	(579)618-5603x680
16	Aaron Bergman	uoconnell@example.com	2024-02-28 22:04:21	292e8fbca5ef246e798fd7042c7b7f87	Seattle	1	98103	484.955.6153
\.


--
-- TOC entry 4918 (class 0 OID 16632)
-- Dependencies: 240
-- Data for Name: order_items; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.order_items (order_id, product_id, quantity, price) FROM stdin;
1	1	2	523.92
1	2	1	731.94
2	3	5	73.10
2	4	1	957.58
3	5	3	67.11
3	6	1	48.86
4	7	2	14.56
4	8	1	907.15
5	9	4	74.00
5	10	1	114.90
31	2	5	50.00
\.


--
-- TOC entry 4901 (class 0 OID 16427)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.orders (id, customer_id, date, description) FROM stdin;
1	7	2020-01-12 00:00:00	Discounted Order
2	8	2020-01-13 00:00:00	Discounted Order
3	9	2020-01-14 00:00:00	Discounted Order
4	10	2020-01-15 00:00:00	Discounted Order
5	11	2020-01-16 00:00:00	Discounted Order
6	12	2020-01-17 00:00:00	Discounted Order
7	13	2020-01-18 00:00:00	Discounted Order
8	14	2020-01-19 00:00:00	Discounted Order
9	15	2020-01-20 00:00:00	Discounted Order
14	10	2020-01-25 00:00:00	Discounted Order
16	12	2020-01-27 00:00:00	Discounted Order
18	14	2020-01-29 00:00:00	Discounted Order
22	8	2020-02-02 00:00:00	Discounted Order
24	10	2020-02-04 00:00:00	Discounted Order
27	13	2020-02-07 00:00:00	Discounted Order
30	16	2020-02-10 00:00:00	Discounted Order
10	16	2020-01-21 00:00:00	Standard Order
11	7	2020-01-22 00:00:00	Gift Order
12	8	2020-01-23 00:00:00	Standard Order
13	9	2020-01-24 00:00:00	Standard Order
15	11	2020-01-26 00:00:00	Gift Order
17	13	2020-01-28 00:00:00	Standard Order
19	15	2020-01-30 00:00:00	Standard Order
20	16	2020-01-31 00:00:00	Gift Order
21	7	2020-02-01 00:00:00	Standard Order
23	9	2020-02-03 00:00:00	Priority Order
25	11	2020-02-05 00:00:00	Standard Order
26	12	2020-02-06 00:00:00	Priority Order
28	14	2020-02-08 00:00:00	Gift Order
29	15	2020-02-09 00:00:00	Gift Order
31	7	2024-07-03 00:00:00	Order for Fashion Item
\.


--
-- TOC entry 4911 (class 0 OID 16550)
-- Dependencies: 233
-- Data for Name: product_categories; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.product_categories (product_id, category_id) FROM stdin;
1	1
2	1
3	4
4	1
5	6
6	1
7	5
3	2
4	3
2	2
\.


--
-- TOC entry 4917 (class 0 OID 16617)
-- Dependencies: 239
-- Data for Name: product_tags; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.product_tags (product_id, tag_id) FROM stdin;
1	2
2	2
3	3
4	2
5	3
6	2
7	4
8	1
9	3
10	3
\.


--
-- TOC entry 4899 (class 0 OID 16420)
-- Dependencies: 221
-- Data for Name: products; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.products (id, name, supplier, price, product_description, image) FROM stdin;
1	Bush Somerset Collection Bookcase	1	261.96	random description1	/images/01.img
2	Hon Deluxe Fabric Upholstered Stacking Chairs, Rounded Back	2	731.94	random description2	/images/02.img
3	Self-Adhesive Address Labels for Typewriters by Universal	3	14.62	random description3	/images/03.img
4	Bretford CR4500 Series Slim Rectangular Table	4	957.58	random description4	/images/04.img
5	Eldon Fold N Roll Cart System	5	22.37	random description5	/images/05.img
6	Eldon Expressions Wood and Plastic Desk Accessories, Cherry Wood	6	48.86	random description6	/images/06.img
7	Newell 322	1	7.28	random description7	/images/07.img
8	Mitel 5320 IP Phone VoIP phone	3	907.15	random description8	/images/08.img
9	DXL Angle-View Binders with Locking Rings by Samsill	5	18.50	random description9	/images/09.img
10	Belkin F5C206VTEL 6 Outlet Surge	9	114.90	random description10	/images/10.img
\.


--
-- TOC entry 4914 (class 0 OID 16594)
-- Dependencies: 236
-- Data for Name: products_comments; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.products_comments (product_id, comment_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
\.


--
-- TOC entry 4919 (class 0 OID 16647)
-- Dependencies: 241
-- Data for Name: returned_items; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.returned_items (order_id, product_id, quantity, return_date) FROM stdin;
1	1	1	2024-01-10 00:00:00
3	5	1	2024-03-20 00:00:00
4	7	1	2024-04-25 00:00:00
2	3	1	2024-02-15 00:00:00
5	9	1	2024-05-30 00:00:00
\.


--
-- TOC entry 4895 (class 0 OID 16402)
-- Dependencies: 217
-- Data for Name: stored_queries; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.stored_queries (query_id, query_name, query_text) FROM stdin;
4	Create Customers Table	CREATE TABLE main_schema.customers (customer_id SERIAL PRIMARY KEY, full_name VARCHAR(100), email VARCHAR(100), last_login TIMESTAMP, password VARCHAR(100), city VARCHAR(100), state VARCHAR(100), country VARCHAR(100), postal_code VARCHAR(20), phone VARCHAR(20));
5	Create Products Table	CREATE TABLE main_schema.products (product_id SERIAL PRIMARY KEY, name VARCHAR(100), supplier VARCHAR(100), price DECIMAL(10, 2), category VARCHAR(100), tags VARCHAR(100));
6	Create Orders Table	CREATE TABLE main_schema.orders (order_id SERIAL PRIMARY KEY, customer_id INTEGER REFERENCES main_schema.customers(customer_id), product_id INTEGER REFERENCES main_schema.products(product_id), quantity INTEGER, price DECIMAL(10, 2), date TIMESTAMP);
7	Add Foreign Key for customer_id in orders Table	ALTER TABLE main_schema.orders ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES main_schema.customers (customer_id);
8	Add Foreign Key for product_id in orders Table	ALTER TABLE main_schema.orders ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES main_schema.products (product_id);
14	Copy Orders Data	COPY main_schema.temp_orders (orderId, customerId, productId, quantity, price, date) FROM 'D:/01-DATA/02-Projects/University/04-Advanced_Database/Final_project/AbcDB/data/processed_Datasets/combined_orders.csv' DELIMITER ',' CSV HEADER;
12	Copy Customers Data	COPY main_schema.temp_customers (customerId, fullName, email, lastLogin, password, city, state, country, postalCode, phone) FROM 'D:\\01-DATA\\02-Projects\\University\\04-Advanced_Database\\Final_project\\AbcDB\\data\\processed_Datasets\\combined_customers.csv' DELIMITER ',' CSV HEADER;
13	Copy Products Data	COPY main_schema.temp_products (productId, name, supplier, price, category, tags) FROM 'D:\\01-DATA\\02-Projects\\University\\04-Advanced_Database\\Final_project\\AbcDB\\data\\processed_Datasets\\combined_products.csv' DELIMITER ',' CSV HEADER;
9	Create Temporary Customers Table	CREATE TABLE main_schema.temp_customers (customerId VARCHAR(50), fullName VARCHAR(100), email VARCHAR(100), lastLogin TIMESTAMP, password VARCHAR(100), city VARCHAR(100), state VARCHAR(100), country VARCHAR(100), postalCode VARCHAR(20), phone VARCHAR(50));
10	Create Temporary Products Table	CREATE TABLE main_schema.temp_products (productId VARCHAR(50), name VARCHAR(200), supplier VARCHAR(100), price DECIMAL(10, 2), category VARCHAR(100), tags VARCHAR(100));
11	Create Temporary Orders Table	Create Temporary Orders Table', 'CREATE TABLE main_schema.temp_orders (orderId VARCHAR(50), customerId VARCHAR(50), productId VARCHAR(50), quantity DECIMAL(10, 2), price DECIMAL(10, 2), date TIMESTAMP);
15	Keep Only First 10 Rows in temp_customers	WITH cte AS (SELECT customerId, fullName, email, lastLogin, password, city, state, country, postalCode, phone, ROW_NUMBER() OVER (ORDER BY customerId) AS rn FROM main_schema.temp_customers) DELETE FROM main_schema.temp_customers WHERE customerId IN (SELECT customerId FROM cte WHERE rn > 10);
16	Keep Only First 10 Rows in temp_products	WITH cte AS (SELECT productId, name, supplier, price, category, tags, ROW_NUMBER() OVER (ORDER BY productId) AS rn FROM main_schema.temp_products) DELETE FROM main_schema.temp_products WHERE productId IN (SELECT productId FROM cte WHERE rn > 10);
17	Keep Only First 10 Rows in temp_orders	WITH cte AS (SELECT orderId, customerId, productId, quantity, price, date, ROW_NUMBER() OVER (ORDER BY orderId) AS rn FROM main_schema.temp_orders) DELETE FROM main_schema.temp_orders WHERE orderId IN (SELECT orderId FROM cte WHERE rn > 10);
18	Keep Only First 10 Rows in temp_products	WITH cte AS (SELECT productId, name, supplier, price, category, tags, ROW_NUMBER() OVER (ORDER BY productId) AS rn FROM main_schema.temp_products) DELETE FROM main_schema.temp_products WHERE productId IN (SELECT productId FROM cte WHERE rn > 10);
19	Create customer_id sequence	CREATE SEQUENCE main_schema.customer_id_seq START WITH 1 INCREMENT BY 1;
20	Create product_id sequence	CREATE SEQUENCE main_schema.product_id_seq START WITH 1 INCREMENT BY 1;
21	Modify customers table to use sequence for customer_id	ALTER TABLE main_schema.customers ALTER COLUMN customer_id SET DEFAULT nextval('main_schema.customer_id_seq');
22	Modify products table to use sequence for product_id	ALTER TABLE main_schema.products ALTER COLUMN product_id SET DEFAULT nextval('main_schema.product_id_seq');
23	Adjust Length Limit for postal_code and phone Columns	ALTER TABLE main_schema.customers ALTER COLUMN postal_code TYPE VARCHAR(50), ALTER COLUMN phone TYPE VARCHAR(50);
24	Copy Data from temp_customers to customers	INSERT INTO main_schema.customers (full_name, email, last_login, password, city, state, country, postal_code, phone) SELECT fullName, email, lastLogin, password, city, state, country, postalCode, phone FROM main_schema.temp_customers;
25	Copy Data from temp_products to products	INSERT INTO main_schema.products (name, supplier, price, category, tags) SELECT name, supplier, price, category, tags FROM main_schema.temp_products;
26	Create order_id sequence	CREATE SEQUENCE main_schema.order_id_seq START WITH 1 INCREMENT BY 1;
27	Create order_id sequence	CREATE SEQUENCE main_schema.order_id_seq START WITH 1 INCREMENT BY 1;
28	Rename customer_id to id in customers table	ALTER TABLE main_schema.customers RENAME COLUMN customer_id TO id;
29	Rename product_id to id in products table	ALTER TABLE main_schema.products RENAME COLUMN product_id TO id;
30	Rename order_id to id in orders table	ALTER TABLE main_schema.orders RENAME COLUMN order_id TO id;
31	Drop temp_customers table	DROP TABLE IF EXISTS main_schema.temp_customers;
32	Drop temp_products table	DROP TABLE IF EXISTS main_schema.temp_products;
33	Drop temp_orders table	DROP TABLE IF EXISTS main_schema.temp_orders;
34	Drop temp_orders_extended table	DROP TABLE IF EXISTS main_schema.temp_orders_extended;
35	Create country table	CREATE TABLE main_schema.country (id SERIAL PRIMARY KEY, name VARCHAR(100) NOT NULL);
36	Insert 10 European Country Names	INSERT INTO main_schema.country (name) VALUES ('Germany'), ('France'), ('Italy'), ('Spain'), ('Netherlands'), ('Belgium'), ('Austria'), ('Sweden'), ('Norway'), ('Denmark');
37	Rename country column to country_id in customers table	ALTER TABLE main_schema.customers RENAME COLUMN country TO country_id;
38	Alter country_id column type to INTEGER in customers table	ALTER TABLE main_schema.customers ALTER COLUMN country_id TYPE INTEGER USING country_id::INTEGER;
39	Add foreign key constraint to country_id in customers table	ALTER TABLE main_schema.customers ADD CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES main_schema.country(id);
40	Delete state column from customers table	ALTER TABLE main_schema.customers DROP COLUMN state;
41	Rename city column to address in customers table	ALTER TABLE main_schema.customers RENAME COLUMN city TO address;
42	Create supplier table	CREATE TABLE main_schema.supplier (id SERIAL PRIMARY KEY, name VARCHAR(100) NOT NULL, address VARCHAR(255), contact VARCHAR(100));
43	Create product_category table	CREATE TABLE main_schema.product_category (id SERIAL PRIMARY KEY, name VARCHAR(100) NOT NULL, description TEXT);
44	Rename product_category table to categories	ALTER TABLE main_schema.product_category RENAME TO categories;
45	Create product_categories table	CREATE TABLE main_schema.product_categories (product_id INT NOT NULL, category_id INT NOT NULL, PRIMARY KEY (product_id, category_id), FOREIGN KEY (product_id) REFERENCES main_schema.products(id), FOREIGN KEY (category_id) REFERENCES main_schema.categories(id));
46	Remove category column from products table	ALTER TABLE main_schema.products DROP COLUMN category;
47	Rename supplier table to suppliers	ALTER TABLE main_schema.supplier RENAME TO suppliers;
48	Change supplier column to integer in products table	ALTER TABLE main_schema.products ALTER COLUMN supplier TYPE INTEGER USING supplier::INTEGER;
49	Add foreign key constraint to supplier column in products table	ALTER TABLE main_schema.products ADD CONSTRAINT fk_supplier FOREIGN KEY (supplier) REFERENCES main_schema.suppliers(id);
50	Add product_description and image columns to products table	ALTER TABLE main_schema.products ADD COLUMN product_description TEXT, ADD COLUMN image VARCHAR(255);
51	Create products_comments table	CREATE TABLE main_schema.products_comments (product_id INT NOT NULL, comment_id INT NOT NULL, PRIMARY KEY (product_id, comment_id), FOREIGN KEY (product_id) REFERENCES main_schema.products(id), FOREIGN KEY (comment_id) REFERENCES main_schema.comments(id));
52	Insert sample data into comments	INSERT INTO main_schema.comments (comment_text, customer_id) VALUES ('Great product, highly recommend!', 7), ('Not what I expected, quality could be better.', 8), ('Excellent value for money.', 9), ('Fast shipping, great customer service.', 10), ('The product arrived damaged.', 11), ('Very satisfied with the purchase.', 12), ('Would buy again.', 13), ('Not satisfied with the customer service.', 14), ('Product is as described.', 15), ('Amazing quality, will recommend to friends.', 16);
53	Create tags table	CREATE TABLE main_schema.tags (id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL);
54	Create product_tags table	CREATE TABLE main_schema.product_tags (product_id INT NOT NULL, tag_id INT NOT NULL, PRIMARY KEY (product_id, tag_id), FOREIGN KEY (product_id) REFERENCES main_schema.products(id), FOREIGN KEY (tag_id) REFERENCES main_schema.tags(id));
55	Remove tags column from products table	ALTER TABLE main_schema.products DROP COLUMN tags;
56	Create order_items table	CREATE TABLE main_schema.order_items (order_id INT NOT NULL, product_id INT NOT NULL, quantity INT NOT NULL, price DECIMAL(10, 2) NOT NULL, PRIMARY KEY (order_id, product_id), FOREIGN KEY (order_id) REFERENCES main_schema.orders(id), FOREIGN KEY (product_id) REFERENCES main_schema.products(id));
57	Create returned_items table	CREATE TABLE main_schema.returned_items (order_id INT NOT NULL, product_id INT NOT NULL, quantity INT NOT NULL, return_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (order_id, product_id), FOREIGN KEY (order_id) REFERENCES main_schema.orders(id), FOREIGN KEY (product_id) REFERENCES main_schema.products(id));
59	Remove product_id from orders table	ALTER TABLE main_schema.orders DROP COLUMN product_id;
60	Remove quantity from orders table	ALTER TABLE main_schema.orders DROP COLUMN quantity;
\.


--
-- TOC entry 4908 (class 0 OID 16535)
-- Dependencies: 230
-- Data for Name: suppliers; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.suppliers (id, name, address, contact) FROM stdin;
1	Global Supplies Ltd	123 Main St, Berlin	contact@globalsupplies.com
2	EuroGoods Inc	45 High St, Paris	info@eurogoods.fr
3	Continental Traders	78 Elm St, Madrid	sales@continental.com
4	Alpha Wholesale	12 King St, Rome	support@alphawholesale.it
5	Nordic Importers	34 Queen St, Stockholm	hello@nordicimporters.se
6	MedTech Supplies	56 Prince St, Vienna	service@medtech.com
7	Western Distributors	67 Duke St, Amsterdam	contact@westerndistributors.nl
8	Central Suppliers	89 Regent St, Brussels	info@centralsuppliers.be
9	Eastern Goods	23 Palace St, Warsaw	sales@easterngoods.pl
10	Southern Exports	90 Royal St, Athens	support@southernexports.gr
\.


--
-- TOC entry 4916 (class 0 OID 16610)
-- Dependencies: 238
-- Data for Name: tags; Type: TABLE DATA; Schema: main_schema; Owner: postgres
--

COPY main_schema.tags (id, name) FROM stdin;
1	Electronics
2	Furniture
3	Office Supplies
4	Health & Beauty
5	Toys
6	Sports
7	Books
8	Automotive
9	Fashion
10	Home & Kitchen
\.


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 234
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: main_schema; Owner: postgres
--

SELECT pg_catalog.setval('main_schema.comments_id_seq', 10, true);


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 227
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: main_schema; Owner: postgres
--

SELECT pg_catalog.setval('main_schema.country_id_seq', 10, true);


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 224
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: main_schema; Owner: postgres
--

SELECT pg_catalog.setval('main_schema.customer_id_seq', 16, true);


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 218
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: main_schema; Owner: postgres
--

SELECT pg_catalog.setval('main_schema.customers_customer_id_seq', 1, false);


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 226
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: main_schema; Owner: postgres
--

SELECT pg_catalog.setval('main_schema.order_id_seq', 1, false);


--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: main_schema; Owner: postgres
--

SELECT pg_catalog.setval('main_schema.orders_order_id_seq', 31, true);


--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 231
-- Name: product_category_id_seq; Type: SEQUENCE SET; Schema: main_schema; Owner: postgres
--

SELECT pg_catalog.setval('main_schema.product_category_id_seq', 10, true);


--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 225
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: main_schema; Owner: postgres
--

SELECT pg_catalog.setval('main_schema.product_id_seq', 10, true);


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 220
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: main_schema; Owner: postgres
--

SELECT pg_catalog.setval('main_schema.products_product_id_seq', 1, false);


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 216
-- Name: stored_queries_query_id_seq; Type: SEQUENCE SET; Schema: main_schema; Owner: postgres
--

SELECT pg_catalog.setval('main_schema.stored_queries_query_id_seq', 61, true);


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 229
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: main_schema; Owner: postgres
--

SELECT pg_catalog.setval('main_schema.supplier_id_seq', 10, true);


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 237
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: main_schema; Owner: postgres
--

SELECT pg_catalog.setval('main_schema.tags_id_seq', 10, true);


--
-- TOC entry 4726 (class 2606 OID 16588)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4718 (class 2606 OID 16516)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 4712 (class 2606 OID 16418)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 4734 (class 2606 OID 16636)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_id, product_id);


--
-- TOC entry 4716 (class 2606 OID 16432)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4724 (class 2606 OID 16554)
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (product_id, category_id);


--
-- TOC entry 4722 (class 2606 OID 16549)
-- Name: categories product_category_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.categories
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- TOC entry 4732 (class 2606 OID 16621)
-- Name: product_tags product_tags_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.product_tags
    ADD CONSTRAINT product_tags_pkey PRIMARY KEY (product_id, tag_id);


--
-- TOC entry 4728 (class 2606 OID 16598)
-- Name: products_comments products_comments_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.products_comments
    ADD CONSTRAINT products_comments_pkey PRIMARY KEY (product_id, comment_id);


--
-- TOC entry 4714 (class 2606 OID 16425)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4736 (class 2606 OID 16652)
-- Name: returned_items returned_items_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.returned_items
    ADD CONSTRAINT returned_items_pkey PRIMARY KEY (order_id, product_id);


--
-- TOC entry 4710 (class 2606 OID 16409)
-- Name: stored_queries stored_queries_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.stored_queries
    ADD CONSTRAINT stored_queries_pkey PRIMARY KEY (query_id);


--
-- TOC entry 4720 (class 2606 OID 16540)
-- Name: suppliers supplier_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.suppliers
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- TOC entry 4730 (class 2606 OID 16615)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4742 (class 2606 OID 16589)
-- Name: comments comments_customer_id_fkey; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.comments
    ADD CONSTRAINT comments_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES main_schema.customers(id);


--
-- TOC entry 4737 (class 2606 OID 16528)
-- Name: customers fk_country; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.customers
    ADD CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES main_schema.country(id);


--
-- TOC entry 4738 (class 2606 OID 16572)
-- Name: products fk_supplier; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.products
    ADD CONSTRAINT fk_supplier FOREIGN KEY (supplier) REFERENCES main_schema.suppliers(id);


--
-- TOC entry 4747 (class 2606 OID 16637)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES main_schema.orders(id);


--
-- TOC entry 4748 (class 2606 OID 16642)
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES main_schema.products(id);


--
-- TOC entry 4739 (class 2606 OID 16433)
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES main_schema.customers(id);


--
-- TOC entry 4740 (class 2606 OID 16560)
-- Name: product_categories product_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.product_categories
    ADD CONSTRAINT product_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES main_schema.categories(id);


--
-- TOC entry 4741 (class 2606 OID 16555)
-- Name: product_categories product_categories_product_id_fkey; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.product_categories
    ADD CONSTRAINT product_categories_product_id_fkey FOREIGN KEY (product_id) REFERENCES main_schema.products(id);


--
-- TOC entry 4745 (class 2606 OID 16622)
-- Name: product_tags product_tags_product_id_fkey; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.product_tags
    ADD CONSTRAINT product_tags_product_id_fkey FOREIGN KEY (product_id) REFERENCES main_schema.products(id);


--
-- TOC entry 4746 (class 2606 OID 16627)
-- Name: product_tags product_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.product_tags
    ADD CONSTRAINT product_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES main_schema.tags(id);


--
-- TOC entry 4743 (class 2606 OID 16604)
-- Name: products_comments products_comments_comment_id_fkey; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.products_comments
    ADD CONSTRAINT products_comments_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES main_schema.comments(id);


--
-- TOC entry 4744 (class 2606 OID 16599)
-- Name: products_comments products_comments_product_id_fkey; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.products_comments
    ADD CONSTRAINT products_comments_product_id_fkey FOREIGN KEY (product_id) REFERENCES main_schema.products(id);


--
-- TOC entry 4749 (class 2606 OID 16653)
-- Name: returned_items returned_items_order_id_fkey; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.returned_items
    ADD CONSTRAINT returned_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES main_schema.orders(id);


--
-- TOC entry 4750 (class 2606 OID 16658)
-- Name: returned_items returned_items_product_id_fkey; Type: FK CONSTRAINT; Schema: main_schema; Owner: postgres
--

ALTER TABLE ONLY main_schema.returned_items
    ADD CONSTRAINT returned_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES main_schema.products(id);


-- Completed on 2024-07-03 14:22:02

--
-- PostgreSQL database dump complete
--

