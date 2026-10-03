--
-- PostgreSQL database dump
--

\restrict n6ulbqZsRdbY0f48STzvHjK5fFk17Ggh7GHtLG7DgocMGdLktMz7HzjGbnwcpNd

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
-- Name: accepted_products; Type: TABLE; Schema: public; Owner: nik1t7n
--

CREATE TABLE public.accepted_products (
    product_id integer CONSTRAINT products_product_id_not_null NOT NULL,
    product_name text CONSTRAINT products_product_name_not_null NOT NULL,
    price numeric(10,2) CONSTRAINT products_price_not_null NOT NULL,
    CONSTRAINT products_price_check CHECK ((price >= (0)::numeric))
);


ALTER TABLE public.accepted_products OWNER TO nik1t7n;

--
-- Name: audit_log; Type: TABLE; Schema: public; Owner: nik1t7n
--

CREATE TABLE public.audit_log (
    message text
);


ALTER TABLE public.audit_log OWNER TO nik1t7n;

--
-- Name: customer_feedback; Type: TABLE; Schema: public; Owner: nik1t7n
--

CREATE TABLE public.customer_feedback (
    feedback_id integer NOT NULL,
    comment text
);


ALTER TABLE public.customer_feedback OWNER TO nik1t7n;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: nik1t7n
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name text NOT NULL,
    email text
);


ALTER TABLE public.customers OWNER TO nik1t7n;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: nik1t7n
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.departments OWNER TO nik1t7n;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: nik1t7n
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text,
    department_id integer
);


ALTER TABLE public.employees OWNER TO nik1t7n;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: nik1t7n
--

ALTER TABLE public.employees ALTER COLUMN employee_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employees_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: imported_employees; Type: TABLE; Schema: public; Owner: nik1t7n
--

CREATE TABLE public.imported_employees (
    employee_id integer CONSTRAINT employees_employee_id_not_null NOT NULL,
    first_name text CONSTRAINT employees_first_name_not_null NOT NULL,
    last_name text CONSTRAINT employees_last_name_not_null NOT NULL,
    email text,
    department_id integer
);


ALTER TABLE public.imported_employees OWNER TO nik1t7n;

--
-- Name: imported_employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: nik1t7n
--

ALTER TABLE public.imported_employees ALTER COLUMN employee_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.imported_employees_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
);


--
-- Name: imported_feedback; Type: TABLE; Schema: public; Owner: nik1t7n
--

CREATE TABLE public.imported_feedback (
    feedback_id integer CONSTRAINT customer_feedback_feedback_id_not_null NOT NULL,
    comment text
);


ALTER TABLE public.imported_feedback OWNER TO nik1t7n;

--
-- Name: imported_products; Type: TABLE; Schema: public; Owner: nik1t7n
--

CREATE TABLE public.imported_products (
    product_id integer CONSTRAINT products_product_id_not_null NOT NULL,
    product_name text CONSTRAINT products_product_name_not_null NOT NULL,
    price numeric(10,2) CONSTRAINT products_price_not_null NOT NULL,
    CONSTRAINT products_price_check CHECK ((price >= (0)::numeric))
);


ALTER TABLE public.imported_products OWNER TO nik1t7n;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: nik1t7n
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    order_date date NOT NULL,
    total numeric(10,2) NOT NULL
);


ALTER TABLE public.orders OWNER TO nik1t7n;

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
-- Name: recovery_events; Type: TABLE; Schema: public; Owner: nik1t7n
--

CREATE TABLE public.recovery_events (
    event_id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.recovery_events OWNER TO nik1t7n;

--
-- Name: accepted_products accepted_products_pkey; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.accepted_products
    ADD CONSTRAINT accepted_products_pkey PRIMARY KEY (product_id);


--
-- Name: customer_feedback customer_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.customer_feedback
    ADD CONSTRAINT customer_feedback_pkey PRIMARY KEY (feedback_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: departments departments_name_key; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_name_key UNIQUE (name);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: imported_employees imported_employees_pkey; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.imported_employees
    ADD CONSTRAINT imported_employees_pkey PRIMARY KEY (employee_id);


--
-- Name: imported_feedback imported_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.imported_feedback
    ADD CONSTRAINT imported_feedback_pkey PRIMARY KEY (feedback_id);


--
-- Name: imported_products imported_products_pkey; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.imported_products
    ADD CONSTRAINT imported_products_pkey PRIMARY KEY (product_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: recovery_events recovery_events_pkey; Type: CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.recovery_events
    ADD CONSTRAINT recovery_events_pkey PRIMARY KEY (event_id);


--
-- Name: employees employees_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nik1t7n
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- PostgreSQL database dump complete
--

\unrestrict n6ulbqZsRdbY0f48STzvHjK5fFk17Ggh7GHtLG7DgocMGdLktMz7HzjGbnwcpNd
