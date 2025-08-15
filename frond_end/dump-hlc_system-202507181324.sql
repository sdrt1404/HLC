--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-07-18 13:24:03

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
-- TOC entry 236 (class 1259 OID 17024)
-- Name: branches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branches (
    id integer NOT NULL,
    name text NOT NULL,
    address text,
    is_active boolean DEFAULT true
);


ALTER TABLE public.branches OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17023)
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.branches_id_seq OWNER TO postgres;

--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 235
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;


--
-- TOC entry 218 (class 1259 OID 16888)
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    name text NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16887)
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_id_seq OWNER TO postgres;

--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 217
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- TOC entry 228 (class 1259 OID 16955)
-- Name: group_schedule_templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_schedule_templates (
    id integer NOT NULL,
    group_id integer,
    weekdays integer[] NOT NULL,
    time_start time without time zone NOT NULL,
    time_end time without time zone NOT NULL
);


ALTER TABLE public.group_schedule_templates OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16954)
-- Name: group_schedule_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_schedule_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_schedule_templates_id_seq OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 227
-- Name: group_schedule_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_schedule_templates_id_seq OWNED BY public.group_schedule_templates.id;


--
-- TOC entry 222 (class 1259 OID 16907)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name text NOT NULL,
    course_id integer,
    branch_id integer
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16906)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_id_seq OWNER TO postgres;

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 221
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 234 (class 1259 OID 17009)
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    student_id integer,
    message text NOT NULL,
    sent_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status text
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17008)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO postgres;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 233
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- TOC entry 232 (class 1259 OID 16989)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    student_id integer,
    group_id integer,
    amount numeric NOT NULL,
    month date NOT NULL,
    paid_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16988)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 231
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 230 (class 1259 OID 16969)
-- Name: student_course_discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_course_discounts (
    id integer NOT NULL,
    student_id integer,
    course_id integer,
    discount numeric NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.student_course_discounts OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16968)
-- Name: student_course_discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_course_discounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_course_discounts_id_seq OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 229
-- Name: student_course_discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_course_discounts_id_seq OWNED BY public.student_course_discounts.id;


--
-- TOC entry 226 (class 1259 OID 16937)
-- Name: student_group_enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_group_enrollments (
    id integer NOT NULL,
    student_id integer,
    group_id integer,
    enrolled_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.student_group_enrollments OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16936)
-- Name: student_group_enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_group_enrollments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_group_enrollments_id_seq OWNER TO postgres;

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 225
-- Name: student_group_enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_group_enrollments_id_seq OWNED BY public.student_group_enrollments.id;


--
-- TOC entry 224 (class 1259 OID 16926)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    full_name text NOT NULL,
    phone text,
    telegram_id bigint,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16925)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO postgres;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 223
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- TOC entry 240 (class 1259 OID 17066)
-- Name: teacher_branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher_branch (
    id integer NOT NULL,
    teacher_id integer,
    branch_id integer,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.teacher_branch OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17065)
-- Name: teacher_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teacher_branch_id_seq OWNER TO postgres;

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 239
-- Name: teacher_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_branch_id_seq OWNED BY public.teacher_branch.id;


--
-- TOC entry 238 (class 1259 OID 17048)
-- Name: teacher_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher_group (
    id integer NOT NULL,
    teacher_id integer,
    group_id integer,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.teacher_group OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17047)
-- Name: teacher_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teacher_group_id_seq OWNER TO postgres;

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 237
-- Name: teacher_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_group_id_seq OWNED BY public.teacher_group.id;


--
-- TOC entry 220 (class 1259 OID 16897)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    full_name text NOT NULL,
    phone text,
    telegram_id bigint,
    is_active boolean DEFAULT true
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16896)
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_id_seq OWNER TO postgres;

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 219
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- TOC entry 242 (class 1259 OID 17085)
-- Name: weekdays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weekdays (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    order_number integer NOT NULL,
    CONSTRAINT weekdays_order_number_check CHECK (((order_number >= 1) AND (order_number <= 7)))
);


ALTER TABLE public.weekdays OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17084)
-- Name: weekdays_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weekdays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weekdays_id_seq OWNER TO postgres;

--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 241
-- Name: weekdays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weekdays_id_seq OWNED BY public.weekdays.id;


--
-- TOC entry 4771 (class 2604 OID 17027)
-- Name: branches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 16891)
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 16958)
-- Name: group_schedule_templates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_schedule_templates ALTER COLUMN id SET DEFAULT nextval('public.group_schedule_templates_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 16910)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 4769 (class 2604 OID 17012)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 16992)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 16972)
-- Name: student_course_discounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_discounts ALTER COLUMN id SET DEFAULT nextval('public.student_course_discounts_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 16940)
-- Name: student_group_enrollments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_group_enrollments ALTER COLUMN id SET DEFAULT nextval('public.student_group_enrollments_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 16929)
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 17069)
-- Name: teacher_branch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_branch ALTER COLUMN id SET DEFAULT nextval('public.teacher_branch_id_seq'::regclass);


--
-- TOC entry 4773 (class 2604 OID 17051)
-- Name: teacher_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_group ALTER COLUMN id SET DEFAULT nextval('public.teacher_group_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 16900)
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- TOC entry 4777 (class 2604 OID 17088)
-- Name: weekdays id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weekdays ALTER COLUMN id SET DEFAULT nextval('public.weekdays_id_seq'::regclass);


--
-- TOC entry 4987 (class 0 OID 17024)
-- Dependencies: 236
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branches (id, name, address, is_active) FROM stdin;
1	Hisor 2nd floor	\N	t
2	bi1 3rd floor	\N	t
3	Dushanbe CS	Нусратулло Махсум	t
\.


--
-- TOC entry 4969 (class 0 OID 16888)
-- Dependencies: 218
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, name, price) FROM stdin;
4	Английский стандарт	200
5	Английский детский	250
6	Русский стандарт	200
7	Русский детский	250
8	Китайский стандарт	200
9	Немецкий	200
10	Компьютерный стандарт	350
11	Математика	250
12	Химия	200
13	Подкурс (для медицинского)	1000
14	Медицинский курс	700
15	Массажное дело	500
\.


--
-- TOC entry 4979 (class 0 OID 16955)
-- Dependencies: 228
-- Data for Name: group_schedule_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_schedule_templates (id, group_id, weekdays, time_start, time_end) FROM stdin;
\.


--
-- TOC entry 4973 (class 0 OID 16907)
-- Dependencies: 222
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name, course_id, branch_id) FROM stdin;
1	Английский утро	\N	\N
2	Математика вечер	\N	\N
3	Индивидуально: Абдуллоев	\N	\N
\.


--
-- TOC entry 4985 (class 0 OID 17009)
-- Dependencies: 234
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, student_id, message, sent_at, status) FROM stdin;
\.


--
-- TOC entry 4983 (class 0 OID 16989)
-- Dependencies: 232
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, student_id, group_id, amount, month, paid_at) FROM stdin;
\.


--
-- TOC entry 4981 (class 0 OID 16969)
-- Dependencies: 230
-- Data for Name: student_course_discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_course_discounts (id, student_id, course_id, discount, created_at) FROM stdin;
\.


--
-- TOC entry 4977 (class 0 OID 16937)
-- Dependencies: 226
-- Data for Name: student_group_enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_group_enrollments (id, student_id, group_id, enrolled_at) FROM stdin;
\.


--
-- TOC entry 4975 (class 0 OID 16926)
-- Dependencies: 224
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, full_name, phone, telegram_id, is_active, created_at) FROM stdin;
\.


--
-- TOC entry 4991 (class 0 OID 17066)
-- Dependencies: 240
-- Data for Name: teacher_branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher_branch (id, teacher_id, branch_id, assigned_at) FROM stdin;
\.


--
-- TOC entry 4989 (class 0 OID 17048)
-- Dependencies: 238
-- Data for Name: teacher_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher_group (id, teacher_id, group_id, assigned_at) FROM stdin;
5	3	2	2025-07-16 14:08:15.985837
6	4	2	2025-07-16 14:08:15.985837
\.


--
-- TOC entry 4971 (class 0 OID 16897)
-- Dependencies: 220
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, full_name, phone, telegram_id, is_active) FROM stdin;
3	Ivan	9019292029	\N	t
4	Vanya	9019292029	\N	t
\.


--
-- TOC entry 4993 (class 0 OID 17085)
-- Dependencies: 242
-- Data for Name: weekdays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weekdays (id, name, order_number) FROM stdin;
1	Monday	1
2	Tuesday	2
3	Wednesday	3
4	Thursday	4
5	Friday	5
6	Saturday	6
7	Sunday	7
\.


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 235
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branches_id_seq', 3, true);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 217
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 15, true);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 227
-- Name: group_schedule_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_schedule_templates_id_seq', 3, true);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 221
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 3, true);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 233
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 2, true);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 231
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 3, true);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 229
-- Name: student_course_discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_course_discounts_id_seq', 1, true);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 225
-- Name: student_group_enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_group_enrollments_id_seq', 3, true);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 223
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 2, true);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 239
-- Name: teacher_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_branch_id_seq', 1, false);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 237
-- Name: teacher_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_group_id_seq', 6, true);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 219
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 4, true);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 241
-- Name: weekdays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weekdays_id_seq', 7, true);


--
-- TOC entry 4798 (class 2606 OID 17032)
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- TOC entry 4780 (class 2606 OID 16895)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 4790 (class 2606 OID 16962)
-- Name: group_schedule_templates group_schedule_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_schedule_templates
    ADD CONSTRAINT group_schedule_templates_pkey PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 16914)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4796 (class 2606 OID 17017)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4794 (class 2606 OID 16997)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 4792 (class 2606 OID 16977)
-- Name: student_course_discounts student_course_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_discounts
    ADD CONSTRAINT student_course_discounts_pkey PRIMARY KEY (id);


--
-- TOC entry 4788 (class 2606 OID 16943)
-- Name: student_group_enrollments student_group_enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_group_enrollments
    ADD CONSTRAINT student_group_enrollments_pkey PRIMARY KEY (id);


--
-- TOC entry 4786 (class 2606 OID 16935)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 4802 (class 2606 OID 17072)
-- Name: teacher_branch teacher_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_branch
    ADD CONSTRAINT teacher_branch_pkey PRIMARY KEY (id);


--
-- TOC entry 4800 (class 2606 OID 17054)
-- Name: teacher_group teacher_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_group
    ADD CONSTRAINT teacher_group_pkey PRIMARY KEY (id);


--
-- TOC entry 4782 (class 2606 OID 16905)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- TOC entry 4804 (class 2606 OID 17093)
-- Name: weekdays weekdays_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weekdays
    ADD CONSTRAINT weekdays_name_key UNIQUE (name);


--
-- TOC entry 4806 (class 2606 OID 17095)
-- Name: weekdays weekdays_order_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weekdays
    ADD CONSTRAINT weekdays_order_number_key UNIQUE (order_number);


--
-- TOC entry 4808 (class 2606 OID 17091)
-- Name: weekdays weekdays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weekdays
    ADD CONSTRAINT weekdays_pkey PRIMARY KEY (id);


--
-- TOC entry 4813 (class 2606 OID 16963)
-- Name: group_schedule_templates group_schedule_templates_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_schedule_templates
    ADD CONSTRAINT group_schedule_templates_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;


--
-- TOC entry 4809 (class 2606 OID 17033)
-- Name: groups groups_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branches(id) ON DELETE SET NULL;


--
-- TOC entry 4810 (class 2606 OID 16915)
-- Name: groups groups_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE SET NULL;


--
-- TOC entry 4818 (class 2606 OID 17018)
-- Name: notifications notifications_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4816 (class 2606 OID 17003)
-- Name: payments payments_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;


--
-- TOC entry 4817 (class 2606 OID 16998)
-- Name: payments payments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4814 (class 2606 OID 16983)
-- Name: student_course_discounts student_course_discounts_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_discounts
    ADD CONSTRAINT student_course_discounts_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 4815 (class 2606 OID 16978)
-- Name: student_course_discounts student_course_discounts_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_discounts
    ADD CONSTRAINT student_course_discounts_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4811 (class 2606 OID 16949)
-- Name: student_group_enrollments student_group_enrollments_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_group_enrollments
    ADD CONSTRAINT student_group_enrollments_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;


--
-- TOC entry 4812 (class 2606 OID 16944)
-- Name: student_group_enrollments student_group_enrollments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_group_enrollments
    ADD CONSTRAINT student_group_enrollments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4821 (class 2606 OID 17078)
-- Name: teacher_branch teacher_branch_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_branch
    ADD CONSTRAINT teacher_branch_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branches(id) ON DELETE CASCADE;


--
-- TOC entry 4822 (class 2606 OID 17073)
-- Name: teacher_branch teacher_branch_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_branch
    ADD CONSTRAINT teacher_branch_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) ON DELETE CASCADE;


--
-- TOC entry 4819 (class 2606 OID 17060)
-- Name: teacher_group teacher_group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_group
    ADD CONSTRAINT teacher_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;


--
-- TOC entry 4820 (class 2606 OID 17055)
-- Name: teacher_group teacher_group_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_group
    ADD CONSTRAINT teacher_group_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) ON DELETE CASCADE;


-- Completed on 2025-07-18 13:24:04

--
-- PostgreSQL database dump complete
--

