--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO huntermcreynolds;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO huntermcreynolds;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO huntermcreynolds;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO huntermcreynolds;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO huntermcreynolds;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO huntermcreynolds;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO huntermcreynolds;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO huntermcreynolds;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO huntermcreynolds;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO huntermcreynolds;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO huntermcreynolds;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO huntermcreynolds;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_appuser; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.paw_platoon_app_appuser (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    walker_id bigint
);


ALTER TABLE public.paw_platoon_app_appuser OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_appuser_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.paw_platoon_app_appuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paw_platoon_app_appuser_id_seq OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_appuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.paw_platoon_app_appuser_id_seq OWNED BY public.paw_platoon_app_appuser.id;


--
-- Name: paw_platoon_app_base; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.paw_platoon_app_base (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.paw_platoon_app_base OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_base_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.paw_platoon_app_base_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paw_platoon_app_base_id_seq OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.paw_platoon_app_base_id_seq OWNED BY public.paw_platoon_app_base.id;


--
-- Name: paw_platoon_app_pet; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.paw_platoon_app_pet (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    species character varying(255) NOT NULL,
    weight character varying(255) NOT NULL,
    age character varying(255) NOT NULL,
    pet_pic character varying(100) NOT NULL,
    owner_id bigint NOT NULL
);


ALTER TABLE public.paw_platoon_app_pet OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_pet_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.paw_platoon_app_pet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paw_platoon_app_pet_id_seq OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_pet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.paw_platoon_app_pet_id_seq OWNED BY public.paw_platoon_app_pet.id;


--
-- Name: paw_platoon_app_user; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.paw_platoon_app_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    profile_pic character varying(100) NOT NULL,
    is_provider boolean NOT NULL,
    is_user boolean NOT NULL,
    bio text NOT NULL,
    rate character varying(255) NOT NULL,
    zip_code character varying(5) NOT NULL
);


ALTER TABLE public.paw_platoon_app_user OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_user_bases; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.paw_platoon_app_user_bases (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    base_id bigint NOT NULL
);


ALTER TABLE public.paw_platoon_app_user_bases OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_user_bases_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.paw_platoon_app_user_bases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paw_platoon_app_user_bases_id_seq OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_user_bases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.paw_platoon_app_user_bases_id_seq OWNED BY public.paw_platoon_app_user_bases.id;


--
-- Name: paw_platoon_app_user_groups; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.paw_platoon_app_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.paw_platoon_app_user_groups OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.paw_platoon_app_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paw_platoon_app_user_groups_id_seq OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.paw_platoon_app_user_groups_id_seq OWNED BY public.paw_platoon_app_user_groups.id;


--
-- Name: paw_platoon_app_user_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.paw_platoon_app_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paw_platoon_app_user_id_seq OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.paw_platoon_app_user_id_seq OWNED BY public.paw_platoon_app_user.id;


--
-- Name: paw_platoon_app_user_user_permissions; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.paw_platoon_app_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.paw_platoon_app_user_user_permissions OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.paw_platoon_app_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paw_platoon_app_user_user_permissions_id_seq OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.paw_platoon_app_user_user_permissions_id_seq OWNED BY public.paw_platoon_app_user_user_permissions.id;


--
-- Name: paw_platoon_app_walk; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.paw_platoon_app_walk (
    id bigint NOT NULL,
    walk_length character varying(255) NOT NULL,
    walk_time character varying(255) NOT NULL,
    walker_id bigint NOT NULL,
    notes text NOT NULL,
    date character varying(255) NOT NULL,
    complete boolean NOT NULL,
    owner_id bigint
);


ALTER TABLE public.paw_platoon_app_walk OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_walk_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.paw_platoon_app_walk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paw_platoon_app_walk_id_seq OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_walk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.paw_platoon_app_walk_id_seq OWNED BY public.paw_platoon_app_walk.id;


--
-- Name: paw_platoon_app_walk_pets; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.paw_platoon_app_walk_pets (
    id bigint NOT NULL,
    walk_id bigint NOT NULL,
    pet_id bigint NOT NULL
);


ALTER TABLE public.paw_platoon_app_walk_pets OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_walk_pets_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.paw_platoon_app_walk_pets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paw_platoon_app_walk_pets_id_seq OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_walk_pets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.paw_platoon_app_walk_pets_id_seq OWNED BY public.paw_platoon_app_walk_pets.id;


--
-- Name: paw_platoon_app_walker; Type: TABLE; Schema: public; Owner: huntermcreynolds
--

CREATE TABLE public.paw_platoon_app_walker (
    id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.paw_platoon_app_walker OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_walker_id_seq; Type: SEQUENCE; Schema: public; Owner: huntermcreynolds
--

CREATE SEQUENCE public.paw_platoon_app_walker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paw_platoon_app_walker_id_seq OWNER TO huntermcreynolds;

--
-- Name: paw_platoon_app_walker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: huntermcreynolds
--

ALTER SEQUENCE public.paw_platoon_app_walker_id_seq OWNED BY public.paw_platoon_app_walker.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: paw_platoon_app_appuser id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_appuser ALTER COLUMN id SET DEFAULT nextval('public.paw_platoon_app_appuser_id_seq'::regclass);


--
-- Name: paw_platoon_app_base id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_base ALTER COLUMN id SET DEFAULT nextval('public.paw_platoon_app_base_id_seq'::regclass);


--
-- Name: paw_platoon_app_pet id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_pet ALTER COLUMN id SET DEFAULT nextval('public.paw_platoon_app_pet_id_seq'::regclass);


--
-- Name: paw_platoon_app_user id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user ALTER COLUMN id SET DEFAULT nextval('public.paw_platoon_app_user_id_seq'::regclass);


--
-- Name: paw_platoon_app_user_bases id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_bases ALTER COLUMN id SET DEFAULT nextval('public.paw_platoon_app_user_bases_id_seq'::regclass);


--
-- Name: paw_platoon_app_user_groups id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_groups ALTER COLUMN id SET DEFAULT nextval('public.paw_platoon_app_user_groups_id_seq'::regclass);


--
-- Name: paw_platoon_app_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.paw_platoon_app_user_user_permissions_id_seq'::regclass);


--
-- Name: paw_platoon_app_walk id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walk ALTER COLUMN id SET DEFAULT nextval('public.paw_platoon_app_walk_id_seq'::regclass);


--
-- Name: paw_platoon_app_walk_pets id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walk_pets ALTER COLUMN id SET DEFAULT nextval('public.paw_platoon_app_walk_pets_id_seq'::regclass);


--
-- Name: paw_platoon_app_walker id; Type: DEFAULT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walker ALTER COLUMN id SET DEFAULT nextval('public.paw_platoon_app_walker_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add app user	7	add_appuser
26	Can change app user	7	change_appuser
27	Can delete app user	7	delete_appuser
28	Can view app user	7	view_appuser
29	Can add base	8	add_base
30	Can change base	8	change_base
31	Can delete base	8	delete_base
32	Can view base	8	view_base
33	Can add pet	9	add_pet
34	Can change pet	9	change_pet
35	Can delete pet	9	delete_pet
36	Can view pet	9	view_pet
37	Can add walker	10	add_walker
38	Can change walker	10	change_walker
39	Can delete walker	10	delete_walker
40	Can view walker	10	view_walker
41	Can add walk	11	add_walk
42	Can change walk	11	change_walk
43	Can delete walk	11	delete_walk
44	Can view walk	11	view_walk
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	paw_platoon_app	user
7	paw_platoon_app	appuser
8	paw_platoon_app	base
9	paw_platoon_app	pet
10	paw_platoon_app	walker
11	paw_platoon_app	walk
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-08-07 09:20:53.733885-05
2	contenttypes	0002_remove_content_type_name	2022-08-07 09:20:53.746653-05
3	auth	0001_initial	2022-08-07 09:20:53.797659-05
4	auth	0002_alter_permission_name_max_length	2022-08-07 09:20:53.805152-05
5	auth	0003_alter_user_email_max_length	2022-08-07 09:20:53.812703-05
6	auth	0004_alter_user_username_opts	2022-08-07 09:20:53.822014-05
7	auth	0005_alter_user_last_login_null	2022-08-07 09:20:53.829757-05
8	auth	0006_require_contenttypes_0002	2022-08-07 09:20:53.836162-05
9	auth	0007_alter_validators_add_error_messages	2022-08-07 09:20:53.845281-05
10	auth	0008_alter_user_username_max_length	2022-08-07 09:20:53.860873-05
11	auth	0009_alter_user_last_name_max_length	2022-08-07 09:20:53.878684-05
12	auth	0010_alter_group_name_max_length	2022-08-07 09:20:53.900322-05
13	auth	0011_update_proxy_permissions	2022-08-07 09:20:53.928375-05
14	auth	0012_alter_user_first_name_max_length	2022-08-07 09:20:53.935439-05
15	paw_platoon_app	0001_initial	2022-08-07 09:20:54.105703-05
16	admin	0001_initial	2022-08-07 09:20:54.134595-05
17	admin	0002_logentry_remove_auto_add	2022-08-07 09:20:54.148008-05
18	admin	0003_logentry_add_action_flag_choices	2022-08-07 09:20:54.160108-05
19	sessions	0001_initial	2022-08-07 09:20:54.20031-05
20	paw_platoon_app	0002_alter_appuser_walker	2022-08-07 09:51:57.688435-05
21	paw_platoon_app	0003_alter_pet_owner	2022-08-07 09:52:48.427934-05
22	paw_platoon_app	0004_alter_appuser_walker	2022-08-07 11:39:38.781894-05
23	paw_platoon_app	0005_alter_appuser_walker	2022-08-07 11:56:53.014557-05
24	paw_platoon_app	0006_alter_appuser_walker	2022-08-07 11:58:11.233117-05
25	paw_platoon_app	0007_alter_appuser_walker	2022-08-07 11:59:35.871676-05
26	paw_platoon_app	0008_user_bio	2022-08-08 16:20:47.906384-05
27	paw_platoon_app	0009_walk_notes	2022-08-08 16:22:34.045724-05
28	paw_platoon_app	0010_alter_base_managers_alter_base_unique_together	2022-08-09 10:46:11.463525-05
29	paw_platoon_app	0011_alter_appuser_walker	2022-08-10 15:22:19.582708-05
30	paw_platoon_app	0012_remove_walk_pet_walk_pets_alter_appuser_walker	2022-08-10 15:22:19.734717-05
31	paw_platoon_app	0013_alter_walk_pets	2022-08-10 15:22:19.751432-05
32	paw_platoon_app	0014_walk_date	2022-08-14 14:31:22.936472-05
33	paw_platoon_app	0015_alter_walk_date_alter_walk_walk_length	2022-08-14 14:36:29.721413-05
34	paw_platoon_app	0016_walk_complete	2022-08-14 14:51:42.962902-05
35	paw_platoon_app	0017_alter_walk_pets	2022-08-14 16:34:01.466839-05
36	paw_platoon_app	0018_alter_base_managers	2022-08-16 08:34:53.673232-05
37	paw_platoon_app	0019_walk_owner	2022-08-16 08:34:53.825681-05
38	paw_platoon_app	0020_user_rate	2022-08-16 16:39:33.052102-05
39	paw_platoon_app	0021_alter_user_rate	2022-08-16 16:42:07.036339-05
40	paw_platoon_app	0022_user_zip_code	2022-08-16 18:31:26.457088-05
41	paw_platoon_app	0023_alter_pet_pet_pic_alter_user_profile_pic	2022-08-22 15:07:46.964515-05
42	paw_platoon_app	0024_alter_pet_pet_pic_alter_user_profile_pic	2022-08-23 10:16:49.809505-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
tmimxpq4w6xcek72gx8dgjpp2st1nudr	.eJxVjMsOwiAURP-FtSFc4fJw6d5vIDwuUjWQlHZl_HfbpAvN7OacmTfzYV2qXwfNfsrswkCw028ZQ3pS20l-hHbvPPW2zFPku8IPOvitZ3pdD_fvoIZRt7U2zhlJAqVOAUxOoEqK5Vyic9ZgIh2gAIIyihDzFhSUwaKNRipZ2OcL_Ss3vA:1oKmGV:ArKvHGrx1ncCMDb-lJBATgYXqqyHwsOTRXyz68tzUDA	2022-08-21 14:48:47.81806-05
ar5ueh36oig7g8wnisc68abahri1k1od	.eJxVjMsOwiAURP-FtSFc4fJw6d5vIDwuUjWQlHZl_HfbpAvN7OacmTfzYV2qXwfNfsrswkCw028ZQ3pS20l-hHbvPPW2zFPku8IPOvitZ3pdD_fvoIZRt7U2zhlJAqVOAUxOoEqK5Vyic9ZgIh2gAIIyihDzFhSUwaKNRipZ2OcL_Ss3vA:1oKlrW:fC3CLy-UxCflks8C64mw1TVKAgyb9jKHWt5nZ8CAcbs	2022-08-21 14:22:58.187266-05
blu6o7v8o5cqhze9x341rwsmgz1d5sak	.eJxVjMsOwiAURP-FtSFc4fJw6d5vIDwuUjWQlHZl_HfbpAvN7OacmTfzYV2qXwfNfsrswkCw028ZQ3pS20l-hHbvPPW2zFPku8IPOvitZ3pdD_fvoIZRt7U2zhlJAqVOAUxOoEqK5Vyic9ZgIh2gAIIyihDzFhSUwaKNRipZ2OcL_Ss3vA:1oKlro:s7rQX_C2l_2XDxljt06_RbRBP0FvLCuEWuPVQ4unDR8	2022-08-21 14:23:16.025889-05
ptft0p10auet0pc8h5o6oxlbv0602wxz	.eJxVjMsOwiAURP-FtSFc4fJw6d5vIDwuUjWQlHZl_HfbpAvN7OacmTfzYV2qXwfNfsrswkCw028ZQ3pS20l-hHbvPPW2zFPku8IPOvitZ3pdD_fvoIZRt7U2zhlJAqVOAUxOoEqK5Vyic9ZgIh2gAIIyihDzFhSUwaKNRipZ2OcL_Ss3vA:1oKltj:WX65k-ehOcPoGofQdVyMasKak2h_DLeEtMv74K5Z6Kc	2022-08-21 14:25:15.25285-05
pt3zdehwh4uln7ls3yv7dd14ezogsnh6	.eJxVjMsOwiAURP-FtSFc4fJw6d5vIDwuUjWQlHZl_HfbpAvN7OacmTfzYV2qXwfNfsrswkCw028ZQ3pS20l-hHbvPPW2zFPku8IPOvitZ3pdD_fvoIZRt7U2zhlJAqVOAUxOoEqK5Vyic9ZgIh2gAIIyihDzFhSUwaKNRipZ2OcL_Ss3vA:1oKm44:QXY5Q3rl-GCV7kaK_upZr8zKnEP-aZPg1jG5ctELy4w	2022-08-21 14:35:56.244204-05
\.


--
-- Data for Name: paw_platoon_app_appuser; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.paw_platoon_app_appuser (id, user_id, walker_id) FROM stdin;
3	10	1
4	12	1
\.


--
-- Data for Name: paw_platoon_app_base; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.paw_platoon_app_base (id, name) FROM stdin;
1	Allen Stagefield AL
2	Louisville Stagefield AL
3	White Sands Missile Range NM
4	Fort Monroe
5	MCB Camp Smith
6	MC Trng Area Bellows
7	Glenview
8	ALF Orange
9	McClellan AFB
10	Saylor Creek Air Force Range
11	Laughlin AFB
12	Buckley AFB
13	Tyndall AFB
14	Columbus Auxiliary Airfield
15	Goodfellow AFB
16	Fort Richardson
17	Birch Lake Recreation Annex
18	Louisville IAP-Standiford FL Site 1
19	Kelly AFB
20	NG Camp Joseph T Robinson
21	NG Camp Ashland
22	NG Bethel ARM FMS
23	NG GUARNG Barrigada Complex
24	NG Volkstone
25	NAVBASE Coronado
26	Finegayan South
27	Grand Forks Defense Fuel Support Point
28	CSO Barbers Point HI
29	Fort Bliss
30	Jim Creek
31	Pueblo Chemical Depot
32	Yuma Proving Ground
33	NTC and Fort Irwin
34	Hawthorne Army Depot
35	Lake City AAP
36	Point of Marsh Target
37	MCLB Barstow
38	NAS Oceana VA
39	Tenjo Vista
40	Offut AFB
41	Cavalier Asn
42	New Boston Air Station
43	Portland IAP ANG
44	Scott AFB
45	NG Camp Gruber
46	NG Mead TS/FMS 06/Utes 02
47	NG Greenlief TS/UTES 01
48	NG Silver Bell Army Heliport
49	NG Camp Villere
50	NG New Castle Readiness Center/FMS 9
51	NG Saginaw
52	NG Bremerton
53	Target B-17
54	Camp Morena
55	Upper Yard Annapolis
56	Yankee Target Range
57	Twin Cities AAP
58	Fort Gordon
59	Camp Mackall
60	Indiana Army Ammunition Plant
61	MCAS Beaufort
62	NAVSUPPACT Norfolk NSY
63	Lafayette Rvr Complex
64	Bangor WA
65	Eglin Air Force Auxiliary Field 3 Duke Fld
66	Wright-Patt AFB
67	Lackland AFB
68	NG Sparta Armory
69	NG MTA Camp Crowder Neosho
70	NG Hollidaysburg Readiness Center
71	NG Camp Beauregard
72	NG Helena Aviation RC- AASF- C12
73	NG Lansing Joint Forces Readiness Center
74	NG Camp Perry Joint Training Center
75	NG Oklahoma Military Department
76	NG Salina KS Training Center
77	NAVOBSSTA Flagstaff AZ
78	Target B-16
79	Barin Field
80	Old Town Site 1
81	Broadway Complex
82	Mission Gorge Rec Area
83	McGuire
84	Northside Mid-South
85	NSWC Carderock Div
86	Presidio of Monterey
87	Fort Buchanan
88	Fire Fighters School
89	Magazine Reservoir Naval Magazine
90	Arnold
91	Eglin AFB Site 2 Santa Rosa Island
92	Poinsett Range
93	Whiteman AFB
94	Niagara Falls
95	Cusick Survival Training Site
96	Truax ANGB
97	Ellington Field
98	Lincoln Map
99	JBSA Sam Houston
100	NG McConnelsville Training Site
101	NG St Cloud AASF
102	NG Camp Pendleton SMR
103	NG Jackson Airport Armory
104	ALF Cabaniss
105	San Nicolas Island
106	NAS Whiting Field Milton FL
107	Umatilla Chemical Depot
108	Defense Supply Center Columbus
109	US Army Garrison Selfridge
110	Fort Wingate Depot Activity
111	Pupukea Paalaa Uka Mil Road
112	MCRD Beaufort
113	Marine Corps Museum
114	Det Phil Pny Annex
115	Naval Station Newport RI
116	Sasa Valley
117	Utah Test and Training Range South UT
118	Hill AFB
119	Youngstown
120	Travis AFB
121	The Farish Memorial Recreational Annex
122	Grissom ARB
123	Pillar Point AFS
124	Maxwell AFB
125	Eielson AFB
126	Francis S Gabreski Airport
127	Quonset State Airport
128	NG Beightler Armory
129	NG Elkins AFRC
130	NG Anthony Cometa Complex
131	NG TS Camp Johnson
132	Amphib Base Coronado East
133	Warner Springs Rts
134	Carlisle Barracks
135	Peterson AFB
136	Tooele Army Depot
137	Fort Campbell TN
138	Arlington National Cemetery
139	Fort McCoy
140	Fort Lesley J McNair
141	Helemano Military Reservation
142	USA Field Station Kunia
143	Twentynine Palms
144	MCB Quantico
145	St Juliens Creek East
146	Elizabeth Rvr Channel
147	Naval Support Activity Wash
148	Naval Support Activity Panama City
149	Nellis Annex
150	JB Andrews
151	Schriever AFB
152	Charleston Defense Fuel Support Point
153	Joint Base Charleston Short Stay
154	Maxwell AFB Gunter Annex
155	Alpena County Regional Airport
156	Forbes Field ANG
157	Kingsley Field Cantonement Site 1
158	Nashville IAP
159	NG Fort Worth - Shoreview
160	NG Muscatatuck Urban Training Center
161	NG MTA Ft Wm Henry Harrison
162	NG Ayer
163	NG Macon TS
164	NG Johnson City Gray
165	NG Muskogee AFRC
166	NG Fort Pickett ARNG MTC
167	NOLF Choctaw
168	NOLF Evergreen
169	NAWS China Lake
170	Fort Hood
171	Air Force Plant 6
172	Subase Kings Bay GA
173	NAS Fallon NV
174	Kawaihae Mil Reserve
175	Fort Belvoir
176	Naval Support Activity Crane
177	Naval Magazine
178	Tinker AFB
179	Ellsworth AFB Site 2
180	Homestead ARB
181	Lackland Training Annex
182	Yukon Weapons Range
183	Jacksonville IAP
184	Site 1 Cantonement Area
185	Martin State Airport
186	Salt Lake City IAP
187	NG Carville Gillis Long Center
188	NG Springfield AVCRAD (New)
189	NG Alcantra Armory Complex
190	NG Camp Adair Corvallis
191	NG Kalaeloa
192	Aiea
193	Ewa
194	Sewage Evaporation Pond
195	Moody AFB
196	Tac X Stagefield AL
197	Fort Lewis
198	Hunter Army Airfield
199	Green River Test Complex UT
200	Apra Heights
201	Andy South
202	Marysville WA
203	Laughlin AFB Aux 1
204	Joint Base Charleston Naval Weapons Station
205	Luke Waste Annex
206	Great Falls IAP
207	Hector IAP
208	Stewart IAP
209	Burlington IAP
210	Canyon Lake Recreation Annex
211	NG Camp Dodge Johnston TS
212	NG Fort Indiantown Gap
213	NG Fort Wolters
214	NG Beauregard Training Range
215	NG ITC Camp San Luis Obisbo
216	NG Ft Allen Rq 177
217	NG TS Ethan Allen Range
218	NG Gulfport AVCRAD
219	NG Camp Swift
220	JBAB Anacostia Bolling
221	Honolulu
222	NAS JRB New Orleans LA
223	NOLF Spencer
224	NOTU Cape Canaveral
225	NAVWPNSYSTRAFAC Boardman
226	NAVSTA Everett WA
227	NAS Whidbey Island WA
228	Anniston Army Depot
229	Fort Carson
230	Radford AAP
231	Choc Mt Air Gnry Rng
232	Pearl City Annex
233	Yorktown Fuel Depot
234	Waterfront
235	Seymour Johnson AFB
236	Westover ARB
237	Eareckson AS
238	Cheyenne Regional Airport
239	Fort Smith Map
240	Memphis IAP
241	Springfield Beckley
242	Birmingham Airport
243	NG Camp Navajo
244	NG HMO3 (Snake Creek TS)
245	NG CTC Fort Custer Trng Center
246	NG West Camp
247	Naval Hospital
248	Brooks AFB
249	Dover AFB
250	Fort A P Hill
251	Tobyhanna Army Depot
252	MCAS Yuma
253	NNSY St Helena
254	Cheatham Annex
255	JEBLCFS Wallops Island VA
256	GL Camp JPJ
257	NAS Pensacola FL
258	Corry Station
259	Clear Air Force Station
260	Joe Foss Field
261	Des Moines IAP
262	EWVRA Shepherd Field
263	NG Camp Hartell
264	NG Martindale - AASF
265	NG Marseilles (MTA Tng Area)
266	NG Hollis Plains Training Site
267	NG Thunderbird Youth Academy
268	NG Fort McClellan ARNG Tng Center
269	NG CTA Camp Mccain
270	NG Camp Smith Tng Site
271	Harmon
272	NAVBASE Point Loma
273	NSA Andersen
274	Dania Beach (Lauderdale)
275	Yakima Training Center
276	Shell Basefield AL
277	Fort George G Meade
278	Scranton AAP
279	Watervliet Arsenal
280	MCLB Albany
281	MCAS Cherry Point
282	Former NTC
283	NSA Saratoga Springs NY
284	Pentagon Building Site
285	Elmendorf AFB
286	Fresno Yosemite International ANG
287	St Louis Air Force Station
288	NG Rickenbacker (MTA)
289	NG Camp Withycombe Clackamas
290	NG TS AFRC Los Alamitos
291	NG MTA Limestone Hills
292	NG MTC-H Camp Grayling
293	NG Kansas
294	Waipahu
295	Dredgers Key-Sigsbee
296	NAVBASE San Diego CA
297	Finegayan
298	Bridgeport
299	Haarp Research Station
300	Pohakuloa Training Area
301	Military Ocean Tml Sunny Point
302	Waianae Kai Military Reservation
303	Picatinny Arsenal
304	Arlington Service Ctr
305	CBC Gulfport MS
306	UTTR - North
307	March ARB
308	Newington Defense Fuel Support Point
309	Gila Bend Air Force Auxiliary Field
310	Lakehurst
311	Randolph AFB
312	NG Macon Readiness Center
313	NG MTA Camp Butner
314	NG MTA Camp Rilea
315	NG Frankfort Boone NG Center
316	Makaha Ridge
317	NOLF Wolf
318	NAVSUPPACT Annapolis
319	Jonathan Dickinson Tracking Annex
320	Fort Lee
321	Us Army Joint Sys Mfg CtrLima
322	Grand Prairie Reserve Complex
323	Kipapa Ammo Storage Site
324	NAVSTA Norfolk VA
325	Webster Field
326	Point Arena Air Force Station
327	Dobbins ARB
328	Columbus AFB
329	Bangor IAP
330	McGhee Tyson Airport
331	Gen Mitchell IAP
332	W K Kellogg
333	NG Stones Ranch Military Res
334	NG Jackson Bks
335	NG Shelbyville
336	NG Camp Ravenna Joint Military Training Center
337	NG Rochester NGA and OMS 2
338	NG Youngstown Tng Site
339	NG Ethan Allen AFB MTA
340	NG Camp Rapid
341	Kamokala Ridge
342	JBPHH Pearl Harbor HI
343	Vieques West PR
344	Trumbo Point Annex
345	Santa Cruz Island
346	Tumon Tank Farm
347	Parks Reserve Forces Tng Area
348	Highbluff Stagefield AL
349	Kahuku Tng Area
350	Kilauea Mil Reserve
351	W Silver Spring Complex
352	Defense Distrib Depot Susq
353	Fort Detrick
354	Devens Reserve Forces Tng Area
355	Fort Benjamin Harrison
356	MCAS Miramar
357	Gould Island RI
358	Saufley Field
359	Dyess AFB
360	Vance AFB
361	Sioux Gateway Airport (ANG)
362	General Wayne A Downing Peoria IAP
363	NG Camp Fogarty Tng Site
364	NG Bergstrom - (Abia)
365	NG Biak Training Center COUTES
366	NG Nashville
367	NG Papago Military Reservation
368	NG Indianapolis 38 ID
369	NG CTC Camp Dawson-Kingwood
370	NOLF Brewton
371	Amphib Base Coronado West
372	Balboa Hospital
373	NAVWPNSTA Seal Beach
374	Norco
375	Randsburg Wash Area
376	Verona Defense Fuel Support Point
377	F E Warren AFB
378	NARL Barrow Camp Tr1
379	Lake Of The Ozarks Recreation
380	Fort Shafter
381	OLF Atlantic
382	MCB Camp Pendleton
383	Sea Plane Base
384	Kegelman Air Force Auxiliary Field
385	Pittsburgh IAP (ANG)
386	Smoky Hill ANG Range
387	Seguin Auxiliary Field
388	NG Orchard Combat Training Center
389	NG Raleigh
390	NG TS Ike Skelton Jefferson City
391	NG Grand Island AASF/RC
392	NG Lawrenceville
393	Silver Strand South
394	Wahiawa
395	Dandan
396	SPAWARS South
397	Rome Laboratory
398	Aberdeen Proving Ground
399	Brown 4b Stagefield AL
400	Toth Stagefield AL
401	Schofield Barracks Military Reservation
402	Fort Hamilton
403	Iowa AAP
404	ALF Bogue
405	Naval Weapons Station Earle NJ
406	NAVSUPPACT Hampton Roads VA
407	Det Philadelphia PA
408	NAVBASE Guam
409	NAS Meridian MS
410	NAVSUPPACT Midsouth Memphis TN
411	Eglin AFB (Eglin Main and Reservation)
412	Bradley IAP
413	New Castle Airport
414	Pease ANGB
415	Savannah/Hilton Head IAP
416	MacDill AFB
417	NG TS Clark Natl Forest Wapp
418	NG Rosemount NG Armory
419	Holtville Carrier LS
420	West Bank
421	NOLF Summerdale
422	Santa Rosa Parcel B
423	Sheppard AFB
424	OLF Coupeville
425	Mountain Home AFB
426	Beale AFB
427	MCB Camp Lejeune (East Site)
428	Patrick AFB
429	Fort Jackson
430	Fort Polk
431	Hunt Stagefield AL
432	Fort De Russy
433	Fort Detrick Forest Glen Annex
434	SDA Area
435	Redington Township
436	Bratenahl
437	Avon Park AF Range
438	Langley AFB
439	Charleston AFB
440	McEntire Joint National Guard Base
441	Schenectady ANG MAP
442	Tulsa IAP
443	Hulman Fld
444	McConnell AFB
445	NG Grayling Airfield
446	NG Camp Ripley
447	NG Knightstown
448	NG Camp Atterbury
449	NG Rio Rancho TS
450	NG Sea Girt NJ NGTC
451	NG Floyd Edsall Training Center
452	NG MTA Camp Santiago
453	NG TS Keaukaha Mil Res
454	NAS Fort Worth JRB TX
455	NOLF Santa Rosa
456	Agana
457	Barrigada - NAVBASE Guam
458	NAVBASE Ventura Cty Point Mugu CA
459	NAVSUPPFAC Beaufort SC
460	Chesapeake Bay Detach
461	NAVPMOSSP Mtn View
462	Robins AFB
463	Military Ocean Terminal Concord
464	Fort Campbell KY
465	Rock Island Arsenal
466	Jacksonville FL Maint
467	Puuloa-Oahu
468	Fort Adams RI
469	NAVSTA Mayport FL
470	NAS Corpus Christi TX
471	Hurlburt Field
472	Minn-St Paul
473	Vandenberg Main Base
474	Will Rogers World Airport
475	NG MTCH Camp Guernsey
476	NG Fort Chaffee MTC
477	NG MTA Camp Shelby
478	NG Picacho Aviation TS
479	NG MTA Camp Edwards
480	NG MTA Camp Fretterd
481	NALF Goliad
482	Gambrills
483	NAVACAD North Severn
484	Navy Annex
485	Potts Tank Farm
486	Stump Neck Area
487	Keesler AFB
488	Shipyard Puget Sound
489	Fort Knox
490	Fort Leonard Wood
491	Fort Rucker AL
492	Detroit Arsenal
493	Fort Greely
494	Jefferson Proving Ground
495	Riverbank AAP
496	NSY Portsmouth
497	Cape Cod Air Station
498	Norwalk 2
499	Atlantic City IAP
500	Yeager Airport
501	NG Atlanta - Confederate Ave
502	NG Collegeville FMS 4
503	NG Buckeye TS
504	NG Oglethorpe Armory
505	NG River Road Training Site
506	NG Edgemeade TS Mtn Home
507	NG Norman CSMS
508	NG Westminster Training Site
509	NG VTS Catoosa
510	NG VTS Smyrna
511	NG Saint George/FMS 5B
512	NAF El Centro
513	OLF Whitehouse
514	Naval Support Activity Orlando
515	George AFB
516	NSA South Potomac
517	Grand Forks AFB
518	Ozol Defense Fuel Support Point
519	Fort Hunter Liggett
520	Fort Riley
521	Stinson 5AB Stagefield AL
522	Dugway Proving Ground
523	Rivanna Station
524	Fort Drum
525	US Army Soldier Systems Center Natick
526	Lone Star AAP (BRAC 2005)
527	Rocky Mountain Arsenal
528	Yermo Area
529	Craney Island
530	Naval Weapons Station Yorktown
531	JEBLCFS East
532	Creech AFB
533	Malmstrom AFB
534	Minot AFB
535	USAF Academy
536	Isabela Puerto Rico
537	Little Rock AFB
538	Bellows
539	Luke AFB
540	Jackson IAP Thompson Field
541	Otis ANG Base
542	Rickenbacker
543	Selfridge ANGB
544	Volk ANGB
545	Duluth IAP
546	Toledo/Exp Airport
547	NG Camp Niantic
548	NG Pelham Range Training Site - Fort McClellan
549	NG MTC-H Camp Roberts
550	NG St Cloud NG Armory
551	NG Baton Rouge AFRC
552	NG Camp Grafton
553	NG Spring City Readiness Center
554	NG MTA Gunpowder Military Reservation
555	NG Sioux Falls Benson Rd Complex
556	Pearl City
557	Marbo
558	Edwards AFB
559	Naval Observatory
560	Grant Training Annex
561	West Point Military Reservation
562	US Army Adelphi Laboratory Center
563	Fort Detrick Glen Haven Annex
564	Fort Wainwright
565	Savanna Depot Act
566	Cornhusker AAP
567	MCB Camp Lejeune (West Site)
568	MCB Hawaii (Kaneohe Bay)
569	Dam Neck
570	ALF Fentress Chesapke
571	NSWC Carderock
572	Barrigada - NSA Andersen
573	Manchester
574	Los Angeles Air Force Annex No4
575	Ellsworth AFB
576	Boise Air Terminal
577	Hancock Field
578	Montgomery Regional Airport ANGB
579	Sky Harbor IAP
580	Dix
581	Capital Airport
582	NG Orchard Mates Boise
583	NG Bend Cotef
584	NG VTS Milan
585	NG Florence Military Reservation
586	NG Cambridge Springs
587	NG Camp Williams Tomah MTA
588	ALF Waldron
589	NAS Key West FL
590	Holloman AFB
591	Bayview Idaho
592	Letterkenny Army Depot
593	Pinon Canyon
594	Skelly Stagefield AL
595	Tripler Army Medical Center
596	Oak Grove
597	JNTEXPBASE Little Creek FS VA
598	NAVMEDCEN Portsmouth VA
599	NAVSUPPACT Bethesda MD
600	Kirtland
601	Travis Annex  2
602	Luis Munoz Marin IAP
603	Camp Bullis Training Annex
604	NG Duluth NG Armory
605	NG General Lucius D Clay National Guard Center
606	NG Camp Sherman Joint Training Center
607	NG McNary Field Salem AASF
608	NG Jackson County AFRC
609	NG Havre De Grace Military Res
610	Target B-19
611	Port Hueneme
612	NAS Jacksonville FL
613	Dixie Target Range
614	Cape Canaveral Air Force Station
615	Solomons Island MD
616	Pine Bluff Arsenal
617	Holston AAP
618	Fort Leavenworth
619	England Authority
620	Makua Mil Reserve
621	Blossom Point Research Facility
622	MCRD San Diego
623	Barry Goldwater Range
624	NNSY South Gate
625	Fort Sheridan
626	Naval Station Great Lakes IL
627	NAS Kingsville TX
628	Davis Monthan AFB
629	Fairchild AFB
630	North Air Force Auxiliary Field
631	Altus AFB
632	Channel Islands ANG Station
633	Tucson IAP
634	Barnes Map (ANG)
635	Kelly Field Annex
636	NG Camp Minden Training Site
637	NG Camp Bowie (State)
638	NG Cumming
639	NG WH Ford Regional Tng Ctr
640	Target B-20
641	Fleming Key Magazine
642	Truman Annex
643	NMIC Suitland
644	Camp Michael Monsoor
645	NAVPMOSSP Magna Utah
646	Tumon
647	Kalaeloa
648	Keyport NUWC
649	Redstone Arsenal
650	Fort Huachuca
651	Cairns Basefield AL
652	Runkle Stagefield AL
653	Aliamanu Military Reservation
654	Dillingham Mil Res
655	Def Gen Supply Center
656	Fort Benning AL
657	TBR Main
658	Syracuse MCRC
659	Tinker Support Annex
660	Fort Fisher Recreation Site
661	Barksdale AFB
662	Cannon AFB
663	Cannon AFB Site 2
664	Luke Air Force Auxiliary Field No 1
665	Gulfport-Biloxi Regional Airport (ANG)
666	NG Auburn Training Site
667	NG Bangor Training Site
668	NG Santa Fe - Onate Complex TS
669	NG TS BBTS
670	NG Camp Murray
671	NG Williamstown
672	NG Camp Mabry
673	NG Mitchell Complex
674	Imperial Beach NOLF
675	NAS Lemoore CA
676	Harbor Drive
677	NGA Arnold Site
678	Nellis AFB
679	Naval Base Kitsap Bremerton WA
680	Fort Sill
681	Fort Benning GA
682	Red River Army Depot
683	Fort Monmouth Main Post
684	Destin Moreno Point
685	MCSF Blount Island (FL)
686	Brooklyn NY
687	Northwest Chesapeake VA
688	Naval Research Lab
689	FLC Fuel Depot Heckscher
690	OLF Bravo
691	Eglin Air Force Auxiliary Field 6
692	Fort Eustis
693	Pittsburgh IAP (ARS)
694	NG MTA Camp Clark Nevada
695	NG Arden Hills Army Training Site
696	NOLF Silverhill
697	San Clemente IS NALF
698	Long Beach Fuel Complex
699	Shaw AFB
700	Fort Myer
701	Stewart Annex
702	Joliet USARC/JTA
703	Fort Stewart
704	OLF Bronson
705	Woolmarket (De Soto)
706	Hanscom AFB
707	Tinker Aerospace Complex
708	USAF Academy Auxiliary Airfield
709	Joint Base Charleston North Yard
710	Charlotte/Douglas IAP
711	NG Springfield (TS Cp Lincoln)
712	NG Camp Bowie - Musgrave (Fed)
713	NG Camp Maxey
714	NG MTA-L Camp Williams
715	NG AASF Byrd Field
716	NG Ft Ruger
717	Tanguisson Point
718	Dryside
719	National City
720	NAVSUPPACT Monterey CA
721	Pumpkin Neck
722	Los Angeles AFB
723	NAVSUPPACT Mechanicsburg PA
724	King Salmon Airport
725	Goldberg Stagefield AL
726	Wheeler Army Airfield
727	Milan AAP
728	Longhorn AAP
729	Camp Frank D Merrill
730	Allegany Ballistics Lab
731	Nimitz Hill
732	White Bluff
733	The Barry M Goldwater Air Force Range
734	NG Hammond Airport
735	NG MTA Clarks Hill Reservation
736	NG Lane County AFRC FMS 5
737	NG Bog Brook Training Site
738	San Pedro Fuel Depot
739	Target 101 Shade Tree
740	Ramey AF Solar Observatory Research Site
741	Nellis Air Force Range
742	Sierra Army Depot
743	Blue Grass Army Depot
744	Fort Bragg
745	Seward Recreation Area
746	Badger AAP
747	Fort Gillem
748	Fallbrook California
749	NAVSUBASE New London CT
750	NAVBASE Guam, Naval Magazine
751	CNI NAVMAG Indian Island
752	Arbuckle Airfield
753	Dare County Range
754	Melrose Air Force Range
755	Reno Tahoe IAP
756	Rosecrans MAP (139AG)
757	Medical Center Annex
758	NG Bismarck RJB Complex
759	NG Esler Field
760	NG RW Shepherd Hope Hull
761	NG SMD
762	NG MTA Camp Curtis Guil
763	NG AASF02 Birmingham
764	NG Training Site
765	NG Las Cruces
766	NG Lincoln AASF/Readiness Center
767	NG Lexington AASF No 1
768	CNIC PMRF Barking Sands HI
769	Ford Island
770	NOLF Holley
771	Naval Air Station Patuxent River
772	NSF Indian Head
773	Tooele Army Depot South
774	Joliet AAP Elwood
\.


--
-- Data for Name: paw_platoon_app_pet; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.paw_platoon_app_pet (id, name, species, weight, age, pet_pic, owner_id) FROM stdin;
1	Neeley	Dog	65	11	pets/pet-pic-1.png	10
2	Loki	Dog	50	13	pets/pet-pic-2.png	10
3	Frannie	Cat	8	7	pets/pet-pic-3.png	10
\.


--
-- Data for Name: paw_platoon_app_user; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.paw_platoon_app_user (id, password, last_login, is_superuser, username, is_staff, is_active, date_joined, email, first_name, last_name, address, profile_pic, is_provider, is_user, bio, rate, zip_code) FROM stdin;
10	pbkdf2_sha256$320000$PhP918XXJU4QowFw1rvFHS$ptYvtb59l/olnE3/TOi9BdzoRFQnDSq4albPN9LI4yo=	2022-08-24 08:55:55.265131-05	f	crystal@google.com	f	t	2022-08-07 11:59:43.762969-05	crystal@google.com	Crystal	Jobe	126 Alaska Rd	users/profile-pic-10.png	f	t	Mom of 3 adorable fur babies!		79606
1	pbkdf2_sha256$320000$oP3GCtNjNB4VXFnOtVvHWU$ppOwhxXFzArkCLecLuAijgm33RcoHgTIPnBnI8Og2B0=	2022-08-24 09:09:34.02094-05	f	hunter@google.com	f	t	2022-08-07 10:05:23.115692-05	hunter@google.com	Hunter	Mac	119 Illinois rd	users/profile-pic-1.png	t	f	Friendly, energetic animal lover with 8+ years pet care experience. 	$30	79606
11	pbkdf2_sha256$320000$o3gCeLWyCmllGSfVBo2nt7$7cAPjyu2wvHQFxxnvUV3yBGDvsBwaxvjogV9GBrksNA=	2022-08-14 18:22:35.513192-05	f	example@google.com	f	t	2022-08-09 09:54:00.283734-05	example@google.com	John	Johnson	3435 Oak St		t	f		$25	79606
12	pbkdf2_sha256$320000$hnguTjSVcHxk5kMjr4AI56$etzpe12nYSwilUW2SeqxHunNg8DHQCanz1t6VATq0NU=	2022-08-16 16:37:03.319747-05	f	chevy@gmail.com	f	t	2022-08-14 18:23:32.875791-05	chevy@gmail.com	Chevy	Chase	2425 Russell St		f	t		$25	79606
\.


--
-- Data for Name: paw_platoon_app_user_bases; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.paw_platoon_app_user_bases (id, user_id, base_id) FROM stdin;
1	10	359
2	1	359
3	11	359
4	12	359
5	1	454
\.


--
-- Data for Name: paw_platoon_app_user_groups; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.paw_platoon_app_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: paw_platoon_app_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.paw_platoon_app_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: paw_platoon_app_walk; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.paw_platoon_app_walk (id, walk_length, walk_time, walker_id, notes, date, complete, owner_id) FROM stdin;
1	1 mile	0:0:11	1	Everything went great! They both pottied and threw ball.	8/14/2022	t	10
3		3:30:00 PM	1		8/25/2022	f	10
2	.5 mile	0:0:25	1	Loki did great today! He enjoyed his time outside.	8/16/2022	t	10
4		1:15:00 PM	1		8/23/2022	f	10
5		2:15:00 PM	1		8/18/2022	f	10
\.


--
-- Data for Name: paw_platoon_app_walk_pets; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.paw_platoon_app_walk_pets (id, walk_id, pet_id) FROM stdin;
1	1	1
2	1	2
3	2	2
4	3	1
5	3	2
6	4	2
7	5	1
8	5	2
\.


--
-- Data for Name: paw_platoon_app_walker; Type: TABLE DATA; Schema: public; Owner: huntermcreynolds
--

COPY public.paw_platoon_app_walker (id, user_id) FROM stdin;
1	1
2	11
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 42, true);


--
-- Name: paw_platoon_app_appuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.paw_platoon_app_appuser_id_seq', 4, true);


--
-- Name: paw_platoon_app_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.paw_platoon_app_base_id_seq', 774, true);


--
-- Name: paw_platoon_app_pet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.paw_platoon_app_pet_id_seq', 3, true);


--
-- Name: paw_platoon_app_user_bases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.paw_platoon_app_user_bases_id_seq', 5, true);


--
-- Name: paw_platoon_app_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.paw_platoon_app_user_groups_id_seq', 1, false);


--
-- Name: paw_platoon_app_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.paw_platoon_app_user_id_seq', 12, true);


--
-- Name: paw_platoon_app_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.paw_platoon_app_user_user_permissions_id_seq', 1, false);


--
-- Name: paw_platoon_app_walk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.paw_platoon_app_walk_id_seq', 5, true);


--
-- Name: paw_platoon_app_walk_pets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.paw_platoon_app_walk_pets_id_seq', 8, true);


--
-- Name: paw_platoon_app_walker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: huntermcreynolds
--

SELECT pg_catalog.setval('public.paw_platoon_app_walker_id_seq', 2, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: paw_platoon_app_appuser paw_platoon_app_appuser_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_appuser
    ADD CONSTRAINT paw_platoon_app_appuser_pkey PRIMARY KEY (id);


--
-- Name: paw_platoon_app_appuser paw_platoon_app_appuser_user_id_key; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_appuser
    ADD CONSTRAINT paw_platoon_app_appuser_user_id_key UNIQUE (user_id);


--
-- Name: paw_platoon_app_base paw_platoon_app_base_id_name_65cfe7d2_uniq; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_base
    ADD CONSTRAINT paw_platoon_app_base_id_name_65cfe7d2_uniq UNIQUE (id, name);


--
-- Name: paw_platoon_app_base paw_platoon_app_base_name_key; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_base
    ADD CONSTRAINT paw_platoon_app_base_name_key UNIQUE (name);


--
-- Name: paw_platoon_app_base paw_platoon_app_base_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_base
    ADD CONSTRAINT paw_platoon_app_base_pkey PRIMARY KEY (id);


--
-- Name: paw_platoon_app_pet paw_platoon_app_pet_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_pet
    ADD CONSTRAINT paw_platoon_app_pet_pkey PRIMARY KEY (id);


--
-- Name: paw_platoon_app_user_bases paw_platoon_app_user_bases_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_bases
    ADD CONSTRAINT paw_platoon_app_user_bases_pkey PRIMARY KEY (id);


--
-- Name: paw_platoon_app_user_bases paw_platoon_app_user_bases_user_id_base_id_98a11d50_uniq; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_bases
    ADD CONSTRAINT paw_platoon_app_user_bases_user_id_base_id_98a11d50_uniq UNIQUE (user_id, base_id);


--
-- Name: paw_platoon_app_user paw_platoon_app_user_email_key; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user
    ADD CONSTRAINT paw_platoon_app_user_email_key UNIQUE (email);


--
-- Name: paw_platoon_app_user_groups paw_platoon_app_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_groups
    ADD CONSTRAINT paw_platoon_app_user_groups_pkey PRIMARY KEY (id);


--
-- Name: paw_platoon_app_user_groups paw_platoon_app_user_groups_user_id_group_id_80406687_uniq; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_groups
    ADD CONSTRAINT paw_platoon_app_user_groups_user_id_group_id_80406687_uniq UNIQUE (user_id, group_id);


--
-- Name: paw_platoon_app_user paw_platoon_app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user
    ADD CONSTRAINT paw_platoon_app_user_pkey PRIMARY KEY (id);


--
-- Name: paw_platoon_app_user_user_permissions paw_platoon_app_user_use_user_id_permission_id_18d6ff32_uniq; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_user_permissions
    ADD CONSTRAINT paw_platoon_app_user_use_user_id_permission_id_18d6ff32_uniq UNIQUE (user_id, permission_id);


--
-- Name: paw_platoon_app_user_user_permissions paw_platoon_app_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_user_permissions
    ADD CONSTRAINT paw_platoon_app_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: paw_platoon_app_user paw_platoon_app_user_username_key; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user
    ADD CONSTRAINT paw_platoon_app_user_username_key UNIQUE (username);


--
-- Name: paw_platoon_app_walk_pets paw_platoon_app_walk_pets_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walk_pets
    ADD CONSTRAINT paw_platoon_app_walk_pets_pkey PRIMARY KEY (id);


--
-- Name: paw_platoon_app_walk_pets paw_platoon_app_walk_pets_walk_id_pet_id_d3711550_uniq; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walk_pets
    ADD CONSTRAINT paw_platoon_app_walk_pets_walk_id_pet_id_d3711550_uniq UNIQUE (walk_id, pet_id);


--
-- Name: paw_platoon_app_walk paw_platoon_app_walk_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walk
    ADD CONSTRAINT paw_platoon_app_walk_pkey PRIMARY KEY (id);


--
-- Name: paw_platoon_app_walker paw_platoon_app_walker_pkey; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walker
    ADD CONSTRAINT paw_platoon_app_walker_pkey PRIMARY KEY (id);


--
-- Name: paw_platoon_app_walker paw_platoon_app_walker_user_id_key; Type: CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walker
    ADD CONSTRAINT paw_platoon_app_walker_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: paw_platoon_app_appuser_walker_id_68ef17ae; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_appuser_walker_id_68ef17ae ON public.paw_platoon_app_appuser USING btree (walker_id);


--
-- Name: paw_platoon_app_base_name_a412bf21_like; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_base_name_a412bf21_like ON public.paw_platoon_app_base USING btree (name varchar_pattern_ops);


--
-- Name: paw_platoon_app_pet_owner_id_3cbdd142; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_pet_owner_id_3cbdd142 ON public.paw_platoon_app_pet USING btree (owner_id);


--
-- Name: paw_platoon_app_user_bases_base_id_83edc0ee; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_user_bases_base_id_83edc0ee ON public.paw_platoon_app_user_bases USING btree (base_id);


--
-- Name: paw_platoon_app_user_bases_user_id_dc98fc14; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_user_bases_user_id_dc98fc14 ON public.paw_platoon_app_user_bases USING btree (user_id);


--
-- Name: paw_platoon_app_user_email_13ad9bbc_like; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_user_email_13ad9bbc_like ON public.paw_platoon_app_user USING btree (email varchar_pattern_ops);


--
-- Name: paw_platoon_app_user_groups_group_id_28ac10a2; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_user_groups_group_id_28ac10a2 ON public.paw_platoon_app_user_groups USING btree (group_id);


--
-- Name: paw_platoon_app_user_groups_user_id_4a4d5215; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_user_groups_user_id_4a4d5215 ON public.paw_platoon_app_user_groups USING btree (user_id);


--
-- Name: paw_platoon_app_user_user_permissions_permission_id_7b10bdca; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_user_user_permissions_permission_id_7b10bdca ON public.paw_platoon_app_user_user_permissions USING btree (permission_id);


--
-- Name: paw_platoon_app_user_user_permissions_user_id_3b690c55; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_user_user_permissions_user_id_3b690c55 ON public.paw_platoon_app_user_user_permissions USING btree (user_id);


--
-- Name: paw_platoon_app_user_username_d121a8ea_like; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_user_username_d121a8ea_like ON public.paw_platoon_app_user USING btree (username varchar_pattern_ops);


--
-- Name: paw_platoon_app_walk_owner_id_f62dbc1f; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_walk_owner_id_f62dbc1f ON public.paw_platoon_app_walk USING btree (owner_id);


--
-- Name: paw_platoon_app_walk_pets_pet_id_e02f1a3f; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_walk_pets_pet_id_e02f1a3f ON public.paw_platoon_app_walk_pets USING btree (pet_id);


--
-- Name: paw_platoon_app_walk_pets_walk_id_992b2363; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_walk_pets_walk_id_992b2363 ON public.paw_platoon_app_walk_pets USING btree (walk_id);


--
-- Name: paw_platoon_app_walk_walker_id_97296754; Type: INDEX; Schema: public; Owner: huntermcreynolds
--

CREATE INDEX paw_platoon_app_walk_walker_id_97296754 ON public.paw_platoon_app_walk USING btree (walker_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_paw_platoon_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_paw_platoon_app_user_id FOREIGN KEY (user_id) REFERENCES public.paw_platoon_app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_appuser paw_platoon_app_appu_user_id_921d6bae_fk_paw_plato; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_appuser
    ADD CONSTRAINT paw_platoon_app_appu_user_id_921d6bae_fk_paw_plato FOREIGN KEY (user_id) REFERENCES public.paw_platoon_app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_appuser paw_platoon_app_appu_walker_id_68ef17ae_fk_paw_plato; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_appuser
    ADD CONSTRAINT paw_platoon_app_appu_walker_id_68ef17ae_fk_paw_plato FOREIGN KEY (walker_id) REFERENCES public.paw_platoon_app_walker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_pet paw_platoon_app_pet_owner_id_3cbdd142_fk_paw_plato; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_pet
    ADD CONSTRAINT paw_platoon_app_pet_owner_id_3cbdd142_fk_paw_plato FOREIGN KEY (owner_id) REFERENCES public.paw_platoon_app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_user_bases paw_platoon_app_user_base_id_83edc0ee_fk_paw_plato; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_bases
    ADD CONSTRAINT paw_platoon_app_user_base_id_83edc0ee_fk_paw_plato FOREIGN KEY (base_id) REFERENCES public.paw_platoon_app_base(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_user_groups paw_platoon_app_user_groups_group_id_28ac10a2_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_groups
    ADD CONSTRAINT paw_platoon_app_user_groups_group_id_28ac10a2_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_user_user_permissions paw_platoon_app_user_permission_id_7b10bdca_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_user_permissions
    ADD CONSTRAINT paw_platoon_app_user_permission_id_7b10bdca_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_user_user_permissions paw_platoon_app_user_user_id_3b690c55_fk_paw_plato; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_user_permissions
    ADD CONSTRAINT paw_platoon_app_user_user_id_3b690c55_fk_paw_plato FOREIGN KEY (user_id) REFERENCES public.paw_platoon_app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_user_groups paw_platoon_app_user_user_id_4a4d5215_fk_paw_plato; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_groups
    ADD CONSTRAINT paw_platoon_app_user_user_id_4a4d5215_fk_paw_plato FOREIGN KEY (user_id) REFERENCES public.paw_platoon_app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_user_bases paw_platoon_app_user_user_id_dc98fc14_fk_paw_plato; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_user_bases
    ADD CONSTRAINT paw_platoon_app_user_user_id_dc98fc14_fk_paw_plato FOREIGN KEY (user_id) REFERENCES public.paw_platoon_app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_walk paw_platoon_app_walk_owner_id_f62dbc1f_fk_paw_plato; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walk
    ADD CONSTRAINT paw_platoon_app_walk_owner_id_f62dbc1f_fk_paw_plato FOREIGN KEY (owner_id) REFERENCES public.paw_platoon_app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_walk_pets paw_platoon_app_walk_pet_id_e02f1a3f_fk_paw_plato; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walk_pets
    ADD CONSTRAINT paw_platoon_app_walk_pet_id_e02f1a3f_fk_paw_plato FOREIGN KEY (pet_id) REFERENCES public.paw_platoon_app_pet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_walker paw_platoon_app_walk_user_id_da0929ee_fk_paw_plato; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walker
    ADD CONSTRAINT paw_platoon_app_walk_user_id_da0929ee_fk_paw_plato FOREIGN KEY (user_id) REFERENCES public.paw_platoon_app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_walk_pets paw_platoon_app_walk_walk_id_992b2363_fk_paw_plato; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walk_pets
    ADD CONSTRAINT paw_platoon_app_walk_walk_id_992b2363_fk_paw_plato FOREIGN KEY (walk_id) REFERENCES public.paw_platoon_app_walk(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paw_platoon_app_walk paw_platoon_app_walk_walker_id_97296754_fk_paw_plato; Type: FK CONSTRAINT; Schema: public; Owner: huntermcreynolds
--

ALTER TABLE ONLY public.paw_platoon_app_walk
    ADD CONSTRAINT paw_platoon_app_walk_walker_id_97296754_fk_paw_plato FOREIGN KEY (walker_id) REFERENCES public.paw_platoon_app_walker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

