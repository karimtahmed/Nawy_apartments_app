--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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
-- Name: apartments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apartments (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    location character varying(100),
    price numeric(10,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    image_url character varying(255),
    description character varying(255),
    available_types character varying(255),
    developer character varying(255)
);


ALTER TABLE public.apartments OWNER TO postgres;

--
-- Name: apartments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apartments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apartments_id_seq OWNER TO postgres;

--
-- Name: apartments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apartments_id_seq OWNED BY public.apartments.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    location character varying(100),
    developer character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: apartments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartments ALTER COLUMN id SET DEFAULT nextval('public.apartments_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Data for Name: apartments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apartments (id, name, location, price, created_at, image_url, description, available_types, developer) FROM stdin;
1	Luxury Apartment	City Center	12000000.00	2024-08-13 07:37:53.553863	/img/apartment1.jpg	An Amazing Luxury Apartment for 12 Million EGP in City Center	Villa Twinhouse Chalet	Menassat Developments
2	High End Apartment	New Cairo	20000000.00	2024-08-13 08:09:54.449733	/img/apartment2.jpg	Best High End Apartment for 20 Million EGP in New Cairo	Apartment Duplex	Menassat Developments
3	East 90 Apartments	New Cairo	4000000.00	2024-08-15 12:38:57.554507	\N	Own your Apartment in the middle of New cairo, new everywhere and everyplace. Buy now	Apartment Duplex	Menassat Developments
4	Mivida Villa	Mivida, Cairo	12000000.00	2024-08-15 12:42:51.719462	\N	Own your apartment in one of the most luxuries compounds in Egypt. Buy now.	Villa	Menassat Developments
5	Mivida Villa	Mivida, Cairo	15000000.00	2024-08-15 13:11:50.181909	\N	Amazing, High, luxuries Villa	Villa	Menassat Developments
6	High End Apartment	New Cairo, Cairo	7000000.00	2024-08-15 13:17:05.185269	\N	Nice view Apartment in the middle of New Cairo	Apartment	Menassat Developments
7	New Town House	New Cairo, Cairo	15000000.00	2024-08-15 13:34:03.085547	/img/apartment4.jpg	Best Town House for your family	TownHouse	Menassat Developments
8	Vantage Villa	New Cairo, Cairo	25000000.00	2024-08-15 13:45:19.440212	\N	Vantage Villa	Villa	Menassat Developments
9	Heliopolis Studio	Heliopolis, Egypt	4000000.00	2024-08-15 13:46:58.210034	/img/apartment7.jpg	Amazing Studio near everywhere	Studio	Menassat Developments
10	East Zed Villa	New Cairo, Cairo	40000000.00	2024-08-15 13:59:18.815145	\N	East Zed Villa	Villa	Menassat Developments
11	Madinaty Studio	New Cairo, Cairo	2000000.00	2024-08-15 14:00:57.773713	/img/apartment5.jpg	Madinaty Studio	Studio	Menassat Developments
12	Duplex Apartment	New Cairo, Cairo	15000000.00	2024-08-15 17:14:50.233232	/img/apartment9.jpg	Duplex Apartment	Apartment	Menassat Developments
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, name, location, developer, created_at) FROM stdin;
1	Podia Tower	New Capital	Menassat Developments	2024-08-15 08:17:24.007306
2	Axle	New Capital	Menassat Developments	2024-08-15 08:17:53.521113
3	Valory Mall	New Capital	Menassat Developments	2024-08-15 08:18:58.520937
\.


--
-- Name: apartments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apartments_id_seq', 12, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 3, true);


--
-- Name: apartments apartments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

