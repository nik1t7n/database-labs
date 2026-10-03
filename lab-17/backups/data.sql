--
-- PostgreSQL database dump
--

\restrict OFZta550vyYxtibXxUywMDl38amGZWSYHNE9VtewTenkbeS8CkErAuehSh9HCKD

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

--
-- Data for Name: accepted_products; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.accepted_products (product_id, product_name, price) FROM stdin;
10	Pen	5.00
12	Eraser	3.00
\.


--
-- Data for Name: audit_log; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.audit_log (message) FROM stdin;
Created the teaching database
\.


--
-- Data for Name: customer_feedback; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.customer_feedback (feedback_id, comment) FROM stdin;
1	Good, useful product
2	The label says "USB"
3	Спасибо
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.customers (customer_id, name, email) FROM stdin;
1	Alice Johnson	alice@example.com
2	Bob Smith	\N
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.departments (department_id, name) FROM stdin;
1	IT
2	Sales
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.employees (employee_id, first_name, last_name, email, department_id) FROM stdin;
1	Alice	Johnson	alice@example.com	1
2	Bob	Smith	\N	2
\.


--
-- Data for Name: imported_employees; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.imported_employees (employee_id, first_name, last_name, email, department_id) FROM stdin;
1	Carol	Davis	carol@example.com	\N
\.


--
-- Data for Name: imported_feedback; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.imported_feedback (feedback_id, comment) FROM stdin;
1	Good, useful product
2	The label says "USB"
3	Спасибо
\.


--
-- Data for Name: imported_products; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.imported_products (product_id, product_name, price) FROM stdin;
1	Notebook	25.00
2	Mouse	40.00
3	Keyboard	50.00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.orders (order_id, customer_id, order_date, total) FROM stdin;
1	1	2024-01-15	25.00
2	2	2024-01-16	40.00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.products (product_id, product_name, price) FROM stdin;
1	Notebook	25.00
2	Mouse	40.00
3	Keyboard	50.00
\.


--
-- Data for Name: recovery_events; Type: TABLE DATA; Schema: public; Owner: nik1t7n
--

COPY public.recovery_events (event_id, description) FROM stdin;
1	Baseline before physical backup
\.


--
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nik1t7n
--

SELECT pg_catalog.setval('public.employees_employee_id_seq', 2, true);


--
-- Name: imported_employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nik1t7n
--

SELECT pg_catalog.setval('public.imported_employees_employee_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

\unrestrict OFZta550vyYxtibXxUywMDl38amGZWSYHNE9VtewTenkbeS8CkErAuehSh9HCKD
