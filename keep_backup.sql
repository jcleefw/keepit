--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: jcleefw; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(45)
);


ALTER TABLE categories OWNER TO jcleefw;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: jcleefw
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO jcleefw;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcleefw
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: channel_feeds; Type: TABLE; Schema: public; Owner: jcleefw; Tablespace: 
--

CREATE TABLE channel_feeds (
    id integer NOT NULL,
    channel_name character varying(100),
    channel_url character varying(250),
    category_id character varying(45),
    channel_desc text,
    channel_image character varying(250),
    popularity integer DEFAULT 0,
    imported boolean DEFAULT false
);


ALTER TABLE channel_feeds OWNER TO jcleefw;

--
-- Name: channel_feeds_id_seq; Type: SEQUENCE; Schema: public; Owner: jcleefw
--

CREATE SEQUENCE channel_feeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE channel_feeds_id_seq OWNER TO jcleefw;

--
-- Name: channel_feeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcleefw
--

ALTER SEQUENCE channel_feeds_id_seq OWNED BY channel_feeds.id;


--
-- Name: feed_variables; Type: TABLE; Schema: public; Owner: jcleefw; Tablespace: 
--

CREATE TABLE feed_variables (
    id integer NOT NULL,
    channel_feed_id integer NOT NULL,
    variable character varying(250),
    image_url_var character varying(250),
    article_link_var character varying(250),
    description_var character varying(250)
);


ALTER TABLE feed_variables OWNER TO jcleefw;

--
-- Name: feed_variables_channel_feed_id_seq; Type: SEQUENCE; Schema: public; Owner: jcleefw
--

CREATE SEQUENCE feed_variables_channel_feed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE feed_variables_channel_feed_id_seq OWNER TO jcleefw;

--
-- Name: feed_variables_channel_feed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcleefw
--

ALTER SEQUENCE feed_variables_channel_feed_id_seq OWNED BY feed_variables.channel_feed_id;


--
-- Name: feed_variables_id_seq; Type: SEQUENCE; Schema: public; Owner: jcleefw
--

CREATE SEQUENCE feed_variables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE feed_variables_id_seq OWNER TO jcleefw;

--
-- Name: feed_variables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcleefw
--

ALTER SEQUENCE feed_variables_id_seq OWNED BY feed_variables.id;


--
-- Name: feeds; Type: TABLE; Schema: public; Owner: jcleefw; Tablespace: 
--

CREATE TABLE feeds (
    id integer NOT NULL,
    channel_feed_id integer NOT NULL,
    date_created timestamp with time zone DEFAULT now(),
    content text,
    popularity integer DEFAULT 0
);


ALTER TABLE feeds OWNER TO jcleefw;

--
-- Name: feeds_channel_feed_id_seq; Type: SEQUENCE; Schema: public; Owner: jcleefw
--

CREATE SEQUENCE feeds_channel_feed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE feeds_channel_feed_id_seq OWNER TO jcleefw;

--
-- Name: feeds_channel_feed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcleefw
--

ALTER SEQUENCE feeds_channel_feed_id_seq OWNED BY feeds.channel_feed_id;


--
-- Name: feeds_id_seq; Type: SEQUENCE; Schema: public; Owner: jcleefw
--

CREATE SEQUENCE feeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE feeds_id_seq OWNER TO jcleefw;

--
-- Name: feeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcleefw
--

ALTER SEQUENCE feeds_id_seq OWNED BY feeds.id;


--
-- Name: raw_feeds; Type: TABLE; Schema: public; Owner: jcleefw; Tablespace: 
--

CREATE TABLE raw_feeds (
    id integer NOT NULL,
    channel_feed_id integer NOT NULL,
    date_created timestamp with time zone DEFAULT now(),
    data text
);


ALTER TABLE raw_feeds OWNER TO jcleefw;

--
-- Name: raw_feeds_channel_feed_id_seq; Type: SEQUENCE; Schema: public; Owner: jcleefw
--

CREATE SEQUENCE raw_feeds_channel_feed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE raw_feeds_channel_feed_id_seq OWNER TO jcleefw;

--
-- Name: raw_feeds_channel_feed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcleefw
--

ALTER SEQUENCE raw_feeds_channel_feed_id_seq OWNED BY raw_feeds.channel_feed_id;


--
-- Name: raw_feeds_id_seq; Type: SEQUENCE; Schema: public; Owner: jcleefw
--

CREATE SEQUENCE raw_feeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE raw_feeds_id_seq OWNER TO jcleefw;

--
-- Name: raw_feeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcleefw
--

ALTER SEQUENCE raw_feeds_id_seq OWNED BY raw_feeds.id;


--
-- Name: user_subscriptions; Type: TABLE; Schema: public; Owner: jcleefw; Tablespace: 
--

CREATE TABLE user_subscriptions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    channel_feed_id integer NOT NULL
);


ALTER TABLE user_subscriptions OWNER TO jcleefw;

--
-- Name: user_subscriptions_channel_feed_id_seq; Type: SEQUENCE; Schema: public; Owner: jcleefw
--

CREATE SEQUENCE user_subscriptions_channel_feed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_subscriptions_channel_feed_id_seq OWNER TO jcleefw;

--
-- Name: user_subscriptions_channel_feed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcleefw
--

ALTER SEQUENCE user_subscriptions_channel_feed_id_seq OWNED BY user_subscriptions.channel_feed_id;


--
-- Name: user_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: jcleefw
--

CREATE SEQUENCE user_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_subscriptions_id_seq OWNER TO jcleefw;

--
-- Name: user_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcleefw
--

ALTER SEQUENCE user_subscriptions_id_seq OWNED BY user_subscriptions.id;


--
-- Name: user_subscriptions_user_id_seq; Type: SEQUENCE; Schema: public; Owner: jcleefw
--

CREATE SEQUENCE user_subscriptions_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_subscriptions_user_id_seq OWNER TO jcleefw;

--
-- Name: user_subscriptions_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcleefw
--

ALTER SEQUENCE user_subscriptions_user_id_seq OWNED BY user_subscriptions.user_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jcleefw; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    password character varying(45),
    firstname character varying(50),
    lastname character varying(50),
    suburb character varying(45),
    country character varying(45),
    woeid integer
);


ALTER TABLE users OWNER TO jcleefw;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jcleefw
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO jcleefw;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcleefw
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jcleefw
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jcleefw
--

ALTER TABLE ONLY channel_feeds ALTER COLUMN id SET DEFAULT nextval('channel_feeds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jcleefw
--

ALTER TABLE ONLY feed_variables ALTER COLUMN id SET DEFAULT nextval('feed_variables_id_seq'::regclass);


--
-- Name: channel_feed_id; Type: DEFAULT; Schema: public; Owner: jcleefw
--

ALTER TABLE ONLY feed_variables ALTER COLUMN channel_feed_id SET DEFAULT nextval('feed_variables_channel_feed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jcleefw
--

ALTER TABLE ONLY feeds ALTER COLUMN id SET DEFAULT nextval('feeds_id_seq'::regclass);


--
-- Name: channel_feed_id; Type: DEFAULT; Schema: public; Owner: jcleefw
--

ALTER TABLE ONLY feeds ALTER COLUMN channel_feed_id SET DEFAULT nextval('feeds_channel_feed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jcleefw
--

ALTER TABLE ONLY raw_feeds ALTER COLUMN id SET DEFAULT nextval('raw_feeds_id_seq'::regclass);


--
-- Name: channel_feed_id; Type: DEFAULT; Schema: public; Owner: jcleefw
--

ALTER TABLE ONLY raw_feeds ALTER COLUMN channel_feed_id SET DEFAULT nextval('raw_feeds_channel_feed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jcleefw
--

ALTER TABLE ONLY user_subscriptions ALTER COLUMN id SET DEFAULT nextval('user_subscriptions_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: jcleefw
--

ALTER TABLE ONLY user_subscriptions ALTER COLUMN user_id SET DEFAULT nextval('user_subscriptions_user_id_seq'::regclass);


--
-- Name: channel_feed_id; Type: DEFAULT; Schema: public; Owner: jcleefw
--

ALTER TABLE ONLY user_subscriptions ALTER COLUMN channel_feed_id SET DEFAULT nextval('user_subscriptions_channel_feed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jcleefw
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: jcleefw
--

COPY categories (id, name) FROM stdin;
1	Games
2	News
3	LifeStyle
4	Design
5	Hacker Tips
6	Resources
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcleefw
--

SELECT pg_catalog.setval('categories_id_seq', 6, true);


--
-- Data for Name: channel_feeds; Type: TABLE DATA; Schema: public; Owner: jcleefw
--

COPY channel_feeds (id, channel_name, channel_url, category_id, channel_desc, channel_image, popularity, imported) FROM stdin;
1	Yanko Design	http://feeds.feedburner.com/yankodesign	4	Modern Industrial Design News	/images/yankodesign-logo.jpg	0	f
2	ABC World News	http://www.abc.net.au/news/feed/52278/rss.xml	2	Latest news as it happens from around the world	/images/abcnewsdefault_90.jpg	10	f
3	Angry Birds Nest	http://feeds.feedburner.com/angrybirdsnest	1	Angry Birds Walkthrough Videos, Golden Eggs, and more	/images/Angry_birds_listorylove_resize.png	0	f
4	Digg Daily Top Stories	http://digg.com/rss/top.rss	2	Digg - What the Internet is talking about right now	/images/Digg_Logo.png	3	f
5	Ikea Hackers	http://feeds.feedburner.com/Ikeahacker	5	Clever ideas and hacks for your IKEA	/images/ikean-hack-logo.png	9	f
6	Smashing Magazines	http://www.smashingmagazine.com/feed/	6	For Professional Web Designers and Developers	/images/smashing_magazine_logo5.jpg	15	f
7	Yahoo Weather Forecast	\N	\N	Weather forecast provided by yahoo	\N	0	f
\.


--
-- Name: channel_feeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcleefw
--

SELECT pg_catalog.setval('channel_feeds_id_seq', 7, true);


--
-- Data for Name: feed_variables; Type: TABLE DATA; Schema: public; Owner: jcleefw
--

COPY feed_variables (id, channel_feed_id, variable, image_url_var, article_link_var, description_var) FROM stdin;
3	2	---\n- title\n- link\n- description\n- pubDate\n- group\n	\N	\N	\N
5	5	---\n- title\n- pubDate\n- description\n- encoded\n- origLink\n	\N	\N	\N
6	6	---\n- title\n- link\n- pubDate\n- description\n	\N	\N	\N
4	4	---\n- title\n- description\n- link\n- pubDate\n	\N	\N	\N
1	1	---\n- title\n- description\n- pubDate\n- encoded\n- origLink\n	description	origLink	description
\.


--
-- Name: feed_variables_channel_feed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcleefw
--

SELECT pg_catalog.setval('feed_variables_channel_feed_id_seq', 1, false);


--
-- Name: feed_variables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcleefw
--

SELECT pg_catalog.setval('feed_variables_id_seq', 6, true);


--
-- Data for Name: feeds; Type: TABLE DATA; Schema: public; Owner: jcleefw
--

COPY feeds (id, channel_feed_id, date_created, content, popularity) FROM stdin;
\.


--
-- Name: feeds_channel_feed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcleefw
--

SELECT pg_catalog.setval('feeds_channel_feed_id_seq', 1, false);


--
-- Name: feeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcleefw
--

SELECT pg_catalog.setval('feeds_id_seq', 1, false);


--
-- Data for Name: raw_feeds; Type: TABLE DATA; Schema: public; Owner: jcleefw
--

COPY raw_feeds (id, channel_feed_id, date_created, data) FROM stdin;
\.


--
-- Name: raw_feeds_channel_feed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcleefw
--

SELECT pg_catalog.setval('raw_feeds_channel_feed_id_seq', 1, false);


--
-- Name: raw_feeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcleefw
--

SELECT pg_catalog.setval('raw_feeds_id_seq', 1, false);


--
-- Data for Name: user_subscriptions; Type: TABLE DATA; Schema: public; Owner: jcleefw
--

COPY user_subscriptions (id, user_id, channel_feed_id) FROM stdin;
1	1	1
\.


--
-- Name: user_subscriptions_channel_feed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcleefw
--

SELECT pg_catalog.setval('user_subscriptions_channel_feed_id_seq', 1, false);


--
-- Name: user_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcleefw
--

SELECT pg_catalog.setval('user_subscriptions_id_seq', 1, true);


--
-- Name: user_subscriptions_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcleefw
--

SELECT pg_catalog.setval('user_subscriptions_user_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jcleefw
--

COPY users (id, username, password, firstname, lastname, suburb, country, woeid) FROM stdin;
1	johnsmith	\N	John	\N	Melbourne	Australia	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcleefw
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: jcleefw; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: channel_feeds_pkey; Type: CONSTRAINT; Schema: public; Owner: jcleefw; Tablespace: 
--

ALTER TABLE ONLY channel_feeds
    ADD CONSTRAINT channel_feeds_pkey PRIMARY KEY (id);


--
-- Name: feed_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: jcleefw; Tablespace: 
--

ALTER TABLE ONLY feed_variables
    ADD CONSTRAINT feed_variables_pkey PRIMARY KEY (id);


--
-- Name: feeds_pkey; Type: CONSTRAINT; Schema: public; Owner: jcleefw; Tablespace: 
--

ALTER TABLE ONLY feeds
    ADD CONSTRAINT feeds_pkey PRIMARY KEY (id);


--
-- Name: raw_feeds_pkey; Type: CONSTRAINT; Schema: public; Owner: jcleefw; Tablespace: 
--

ALTER TABLE ONLY raw_feeds
    ADD CONSTRAINT raw_feeds_pkey PRIMARY KEY (id);


--
-- Name: user_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: jcleefw; Tablespace: 
--

ALTER TABLE ONLY user_subscriptions
    ADD CONSTRAINT user_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: jcleefw; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: jcleefw
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM jcleefw;
GRANT ALL ON SCHEMA public TO jcleefw;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

