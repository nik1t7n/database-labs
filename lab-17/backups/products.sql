--
-- PostgreSQL database dump
--

\restrict RCIrTSqcUYkj8uvxqZeRjhGqME7evhbXlHc89SrOlUMEXA2Vgk8MkjfJbXVvaFK

-- Dumped from database version 18.6 (Homebrew)
-- Dumped by pg_dump version 18.6 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: products; Type: TABLE; Schema: public; Owner: nik1t7n
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name text NOT NULL,
    price numeric(10,2) NOT NULL,
    CONSTRAINT products_price_check CHECK ((price >= (0)::numeric))
);


ALTER TABLE public.products OWNER TO nik1t7n;

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.products (product_id, product_name, price) FROM stdin;
1	Notebook	25.00
2	Mouse	40.00
3	Keyboard	50.00
\.


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- PostgreSQL database dump complete
--

\unrestrict RCIrTSqcUYkj8uvxqZeRjhGqME7evhbXlHc89SrOlUMEXA2Vgk8MkjfJbXVvaFK
