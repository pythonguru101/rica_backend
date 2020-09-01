--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: core_ricaofficer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_ricaofficer (
    mobile_number character varying(100) NOT NULL,
    password character varying(100),
    name character varying(50),
    id_photo character varying(100),
    address character varying(100),
    is_checked boolean NOT NULL
);


ALTER TABLE public.core_ricaofficer OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    source_refresh_token_id bigint
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_application (
    id bigint DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass) NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO postgres;

--
-- Name: profiles_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    photo character varying(100),
    birthday date,
    location character varying(255),
    creation_time timestamp with time zone NOT NULL
);


ALTER TABLE public.profiles_user OWNER TO postgres;

--
-- Name: profiles_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.profiles_user_groups OWNER TO postgres;

--
-- Name: profiles_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profiles_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_user_groups_id_seq OWNER TO postgres;

--
-- Name: profiles_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profiles_user_groups_id_seq OWNED BY public.profiles_user_groups.id;


--
-- Name: profiles_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profiles_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_user_id_seq OWNER TO postgres;

--
-- Name: profiles_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profiles_user_id_seq OWNED BY public.profiles_user.id;


--
-- Name: profiles_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.profiles_user_user_permissions OWNER TO postgres;

--
-- Name: profiles_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profiles_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: profiles_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profiles_user_user_permissions_id_seq OWNED BY public.profiles_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: profiles_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user ALTER COLUMN id SET DEFAULT nextval('public.profiles_user_id_seq'::regclass);


--
-- Name: profiles_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user_groups ALTER COLUMN id SET DEFAULT nextval('public.profiles_user_groups_id_seq'::regclass);


--
-- Name: profiles_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.profiles_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add application	6	add_application
17	Can change application	6	change_application
18	Can delete application	6	delete_application
19	Can add access token	7	add_accesstoken
20	Can change access token	7	change_accesstoken
21	Can delete access token	7	delete_accesstoken
22	Can add grant	8	add_grant
23	Can change grant	8	change_grant
24	Can delete grant	8	delete_grant
25	Can add refresh token	9	add_refreshtoken
26	Can change refresh token	9	change_refreshtoken
27	Can delete refresh token	9	delete_refreshtoken
28	Can add user	10	add_user
29	Can change user	10	change_user
30	Can delete user	10	delete_user
31	Can add club bag	11	add_clubbag
32	Can change club bag	11	change_clubbag
33	Can delete club bag	11	delete_clubbag
34	Can add rica user	12	add_ricauser
35	Can change rica user	12	change_ricauser
36	Can delete rica user	12	delete_ricauser
37	Can add rica officer	13	add_ricaofficer
38	Can change rica officer	13	change_ricaofficer
39	Can delete rica officer	13	delete_ricaofficer
\.


--
-- Data for Name: core_ricaofficer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_ricaofficer (mobile_number, password, name, id_photo, address, is_checked) FROM stdin;
3245678760	durkfjrj	a		a	f
3245678761	durkfjrj	b		b	f
3245678722	durkfjrj	c		c	f
3245678720	durkfjrj	d		d	t
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-07-25 10:47:04.697376-07	2	osinov	1	[{"added": {}}]	10	1
2	2020-07-25 10:47:42.986633-07	2	osinov	2	[{"changed": {"fields": ["email", "photo", "birthday", "is_staff"]}}]	10	1
3	2020-07-25 10:52:57.080197-07	2	123456789	2	[{"changed": {"fields": ["username"]}}]	10	1
4	2020-07-25 10:56:02.122783-07	3	987654321	1	[{"added": {}}]	10	1
5	2020-07-25 10:56:25.501735-07	3	987654321	2	[{"changed": {"fields": ["email"]}}]	10	1
6	2020-07-25 10:56:36.248658-07	3	987654321	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	10	1
7	2020-07-25 11:01:24.809902-07	3	champion_327@hotmail.com	2	[{"changed": {"fields": ["username"]}}]	10	1
8	2020-07-25 11:09:35.726648-07	1	champion_327@hotmail.com	1	[{"added": {}}]	6	1
9	2020-07-25 11:11:07.586152-07	2	123456789	3		10	1
10	2020-07-27 02:02:28.59996-07	1	admin	2	[{"changed": {"fields": ["photo"]}}]	10	1
11	2020-07-28 09:44:07.570488-07	0711893333	RicaUser object (0711893333)	2	[{"changed": {"fields": ["mobile_number", "name", "surname", "id_passport", "selfie_photo", "id_photo", "address", "area_code", "dailing_number"]}}]	12	1
12	2020-07-28 09:45:02.758677-07	2345433445	RicaUser object (2345433445)	2	[{"changed": {"fields": ["mobile_number"]}}]	12	1
13	2020-07-28 09:56:47.557081-07	2345433445	RicaUser object (2345433445)	2	[{"changed": {"fields": ["name", "surname", "id_passport", "address", "id_passport_expiry_date", "area_code", "dailing_number", "suburb", "postal_code", "city_town", "country"]}}]	12	1
14	2020-07-28 09:57:13.211131-07	0711893333	RicaUser object (0711893333)	2	[{"changed": {"fields": ["name", "surname", "id_passport", "address", "area_code", "dailing_number"]}}]	12	1
15	2020-07-28 09:57:36.30026-07	a	RicaUser object (a)	3		12	1
16	2020-07-28 09:57:46.164626-07	0711893333	RicaUser object (0711893333)	2	[{"changed": {"fields": ["selfie_photo", "id_photo"]}}]	12	1
17	2020-07-28 09:58:18.597345-07	234564564	RicaUser object (234564564)	2	[{"changed": {"fields": ["mobile_number", "name", "surname", "id_passport", "address", "id_passport_expiry_date", "area_code", "dailing_number", "suburb", "postal_code", "city_town", "country"]}}]	12	1
18	2020-07-28 09:58:30.166155-07	b	RicaUser object (b)	3		12	1
19	2020-07-28 09:58:50.627947-07	2345433445	RicaUser object (2345433445)	2	[{"changed": {"fields": ["selfie_photo", "id_photo"]}}]	12	1
20	2020-07-28 09:59:09.744857-07	234564564	RicaUser object (234564564)	2	[{"changed": {"fields": ["selfie_photo", "id_photo"]}}]	12	1
21	2020-07-28 09:59:27.497228-07	2345645640	RicaUser object (2345645640)	2	[{"changed": {"fields": ["mobile_number"]}}]	12	1
22	2020-07-28 09:59:50.890391-07	234564564	RicaUser object (234564564)	3		12	1
23	2020-07-28 10:00:51.863355-07	4	surajbohra210@gmail.com	1	[{"added": {}}]	10	1
24	2020-07-28 10:01:07.139217-07	4	surajbohra210@gmail.com	2	[{"changed": {"fields": ["email", "is_staff"]}}]	10	1
25	2020-07-28 10:02:30.60487-07	2	surajbohra210@gmail.com	1	[{"added": {}}]	6	1
26	2020-07-28 19:51:42.497714-07	1	admin	2	[{"changed": {"fields": ["photo"]}}]	10	1
27	2020-07-28 19:52:03.489101-07	4	surajbohra210@gmail.com	2	[{"changed": {"fields": ["photo"]}}]	10	1
28	2020-07-30 13:07:50.882109-07	1	admin	2	[{"changed": {"fields": ["photo"]}}]	10	1
29	2020-07-30 13:32:16.366375-07	5	admir_darcuz@outlook.com	1	[{"added": {}}]	10	1
30	2020-07-30 13:32:36.293558-07	5	admir_darcuz@outlook.com	2	[{"changed": {"fields": ["email", "photo", "is_staff"]}}]	10	1
31	2020-07-30 13:32:54.799861-07	5	admir_darcuz@outlook.com	2	[{"changed": {"fields": ["photo"]}}]	10	1
32	2020-07-30 13:33:45.446543-07	3	champion_327@hotmail.com	2	[{"changed": {"fields": ["photo"]}}]	10	1
33	2020-07-30 15:30:32.99352-07	5	admir_darcuz@outlook.com	3		10	1
34	2020-07-30 19:16:36.355958-07	4	surajbohra210@gmail.com	2	[{"changed": {"fields": ["photo"]}}]	10	1
35	2020-07-30 19:17:38.485719-07	1	admin	2	[{"changed": {"fields": ["photo"]}}]	10	1
36	2020-07-31 01:07:51.307852-07	324235345	RicaUser object (324235345)	2	[{"changed": {"fields": ["mobile_number"]}}]	12	1
37	2020-07-31 01:08:06.815951-07	324235345	RicaUser object (324235345)	2	[{"changed": {"fields": ["selfie_photo", "id_photo"]}}]	12	1
38	2020-07-31 01:08:15.368033-07	f	RicaUser object (f)	3		12	1
39	2020-07-31 07:21:04.584616-07	0711893333	RicaUser object (0711893333)	2	[{"changed": {"fields": ["password"]}}]	12	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	oauth2_provider	application
7	oauth2_provider	accesstoken
8	oauth2_provider	grant
9	oauth2_provider	refreshtoken
10	profiles	user
11	profiles	clubbag
12	core	ricauser
13	core	ricaofficer
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-07-25 10:44:59.552333-07
2	contenttypes	0002_remove_content_type_name	2020-07-25 10:44:59.578587-07
3	auth	0001_initial	2020-07-25 10:44:59.689308-07
4	auth	0002_alter_permission_name_max_length	2020-07-25 10:44:59.696745-07
5	auth	0003_alter_user_email_max_length	2020-07-25 10:44:59.703885-07
6	auth	0004_alter_user_username_opts	2020-07-25 10:44:59.712206-07
7	auth	0005_alter_user_last_login_null	2020-07-25 10:44:59.71769-07
8	auth	0006_require_contenttypes_0002	2020-07-25 10:44:59.720778-07
9	auth	0007_alter_validators_add_error_messages	2020-07-25 10:44:59.730603-07
10	auth	0008_alter_user_username_max_length	2020-07-25 10:44:59.73863-07
11	auth	0009_alter_user_last_name_max_length	2020-07-25 10:44:59.745066-07
12	profiles	0001_initial	2020-07-25 10:44:59.874639-07
13	admin	0001_initial	2020-07-25 10:44:59.932443-07
14	admin	0002_logentry_remove_auto_add	2020-07-25 10:44:59.943881-07
15	oauth2_provider	0001_initial	2020-07-25 10:45:00.222548-07
16	oauth2_provider	0002_08_updates	2020-07-25 10:45:00.356361-07
17	oauth2_provider	0003_auto_20160316_1503	2020-07-25 10:45:00.373977-07
18	oauth2_provider	0004_auto_20160525_1623	2020-07-25 10:45:00.481593-07
19	oauth2_provider	0005_auto_20170514_1141	2020-07-25 10:45:01.710386-07
20	oauth2_provider	0006_auto_20171214_2232	2020-07-25 10:45:01.829181-07
21	sessions	0001_initial	2020-07-25 10:45:01.873551-07
22	profiles	0002_clubbag	2020-07-25 13:49:34.860018-07
23	core	0001_initial	2020-07-26 09:02:30.017015-07
24	profiles	0003_auto_20200726_1602	2020-07-26 09:02:30.09653-07
25	core	0002_auto_20200726_1634	2020-07-26 09:34:50.867947-07
26	core	0003_auto_20200726_1733	2020-07-26 10:33:26.093943-07
27	core	0002_auto_20200726_1810	2020-07-26 11:10:40.929631-07
28	core	0003_auto_20200728_1353	2020-07-28 06:53:21.834812-07
29	core	0004_auto_20200731_0806	2020-07-31 01:06:57.418786-07
30	core	0005_auto_20200805_0739	2020-08-05 00:39:23.054797-07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ykg2wfsfbolr8iyodtbk5vt5dynm2d14	YjA1NmQxNTgzZDdmNTRmODMxMjRmNzc0MmIzNDhmNWU1OTE4MWI4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5NWU4Yjk3NjU0YTE5NmIyMzAxYzMwYzZkOWVhMjA3NDFhNjEwYjFlIn0=	2020-08-08 10:46:22.77314-07
268dzzxa9bqp9avdip5pgqahtedgjdr7	YjA1NmQxNTgzZDdmNTRmODMxMjRmNzc0MmIzNDhmNWU1OTE4MWI4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5NWU4Yjk3NjU0YTE5NmIyMzAxYzMwYzZkOWVhMjA3NDFhNjEwYjFlIn0=	2020-08-08 13:50:31.127598-07
muzkojsrrzexeyhhqf05m1d9mng7t7v6	YjA1NmQxNTgzZDdmNTRmODMxMjRmNzc0MmIzNDhmNWU1OTE4MWI4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5NWU4Yjk3NjU0YTE5NmIyMzAxYzMwYzZkOWVhMjA3NDFhNjEwYjFlIn0=	2020-08-09 09:17:34.392344-07
1mjwsnimg8s9xnqdar1802y4h4jxop9k	YjA1NmQxNTgzZDdmNTRmODMxMjRmNzc0MmIzNDhmNWU1OTE4MWI4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5NWU4Yjk3NjU0YTE5NmIyMzAxYzMwYzZkOWVhMjA3NDFhNjEwYjFlIn0=	2020-08-10 02:01:41.133685-07
3lzoan12590yn9vb4p2tuba3rj2xrx88	YjA1NmQxNTgzZDdmNTRmODMxMjRmNzc0MmIzNDhmNWU1OTE4MWI4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5NWU4Yjk3NjU0YTE5NmIyMzAxYzMwYzZkOWVhMjA3NDFhNjEwYjFlIn0=	2020-08-13 19:17:57.550961-07
uhruigvszioq1xxmvsw8t9qco855aacq	YjA1NmQxNTgzZDdmNTRmODMxMjRmNzc0MmIzNDhmNWU1OTE4MWI4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5NWU4Yjk3NjU0YTE5NmIyMzAxYzMwYzZkOWVhMjA3NDFhNjEwYjFlIn0=	2020-08-14 20:07:04.4026-07
hyk490q2j2y6hormpgdrbk21hm7hdjik	YjA1NmQxNTgzZDdmNTRmODMxMjRmNzc0MmIzNDhmNWU1OTE4MWI4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5NWU4Yjk3NjU0YTE5NmIyMzAxYzMwYzZkOWVhMjA3NDFhNjEwYjFlIn0=	2020-08-19 01:07:42.361446-07
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated, source_refresh_token_id) FROM stdin;
1	G7TbH0BXx8rWXfdulQRRoW36MOiaEO	2020-07-26 11:10:27.221537-07	read write	1	3	2020-07-25 11:10:27.221921-07	2020-07-25 11:10:27.221929-07	\N
2	mhyU4YRwYYLiwkmgsIAxQs2icjDpIY	2020-07-26 14:06:40.513607-07	read write	1	3	2020-07-25 14:06:40.513984-07	2020-07-25 14:06:40.513992-07	\N
3	tyz4YG6RLwYE2PdCToY5LXQXUKD6rg	2020-07-26 14:16:49.822843-07	read write	1	3	2020-07-25 14:16:49.823144-07	2020-07-25 14:16:49.823152-07	\N
4	Q819msBDstBbfG3T6dNAKlbbkTdOKi	2020-07-27 04:09:18.124092-07	read write	1	3	2020-07-26 04:09:18.124499-07	2020-07-26 04:09:18.124509-07	\N
5	mVmlvh10EmdFnzcynajtZATK5AQmug	2020-07-29 00:38:17.034883-07	read write	1	3	2020-07-28 00:38:17.035268-07	2020-07-28 00:38:17.035276-07	\N
6	U6HbWzNhvaCO4STIb1yuHTHxJmKK3A	2020-07-29 06:11:56.68859-07	read write	1	3	2020-07-28 06:11:56.688978-07	2020-07-28 06:11:56.688986-07	\N
7	U8DwGzPyLVRQUUlcaD76TiitG7uz86	2020-07-29 10:03:56.637445-07	read write	2	4	2020-07-28 10:03:56.6379-07	2020-07-28 10:03:56.637908-07	\N
8	JlrzAP5HYKHNbJ5C8HslWaLb7yKESt	2020-07-29 10:45:57.768943-07	read write	2	4	2020-07-28 10:45:57.769291-07	2020-07-28 10:45:57.769299-07	\N
9	RtSwxewX9M1SEm2zBiQAQTLD43ST23	2020-07-29 10:46:01.401718-07	read write	2	4	2020-07-28 10:46:01.402046-07	2020-07-28 10:46:01.402054-07	\N
10	UZi8yOzKRxJ3dblL5Lv3A7VojLTdgN	2020-08-01 00:49:03.649692-07	read write	1	3	2020-07-31 00:49:03.650207-07	2020-07-31 00:49:03.650215-07	\N
11	9AK0QHAxGznbtQV3jUCRhHAHyeOZku	2020-08-01 07:17:45.407311-07	read write	1	3	2020-07-31 07:17:45.407663-07	2020-07-31 07:17:45.407671-07	\N
12	HLwSNN7DGQbtuEHiBdsiCuZV70iEpC	2020-08-02 04:14:23.72101-07	read write	1	3	2020-08-01 04:14:23.721409-07	2020-08-01 04:14:23.721421-07	\N
13	yyPQHLYy8T0bhBiRpv4thvQyZeg6hT	2020-08-02 11:45:12.119121-07	read write	1	3	2020-08-01 11:45:12.119519-07	2020-08-01 11:45:12.119526-07	\N
14	cyAvjD56kkToJ0Se0YrORdQho8C2Tl	2020-08-02 13:15:19.972067-07	read write	1	3	2020-08-01 13:15:19.97246-07	2020-08-01 13:15:19.972469-07	\N
15	CIPwsH0bLuasXGB87ET2jJIfRe7Y30	2020-08-06 01:05:41.183239-07	read write	1	3	2020-08-05 01:05:41.183615-07	2020-08-05 01:05:41.183622-07	\N
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
1	champion_327@hotmail.com		confidential	password		champion_327@hotmail.com	3	f	2020-07-25 11:09:35.71567-07	2020-07-25 11:09:35.715704-07
2	surajbohra210@gmail.com		confidential	password		surajbohra210@gmail.com	4	f	2020-07-28 10:02:30.590084-07	2020-07-28 10:02:30.590107-07
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
1	vxKwHYlrIEGxrjll5jWX5CnvbDsWoJ	1	1	3	2020-07-25 11:10:27.2384-07	2020-07-25 11:10:27.238415-07	\N
2	1zPsGQp4xV0bJq0hk0A0eNp2HJ3wdd	2	1	3	2020-07-25 14:06:40.532508-07	2020-07-25 14:06:40.532523-07	\N
3	BL9QVN5Q9LRBdkKoQOP88rcFKSQHNw	3	1	3	2020-07-25 14:16:49.828291-07	2020-07-25 14:16:49.828306-07	\N
4	lD0MnZbcbUfXib7hEmnhC8ZCoQdf3e	4	1	3	2020-07-26 04:09:18.155382-07	2020-07-26 04:09:18.155396-07	\N
5	FeKayXxffw40KBHj4Z7pt67VWJ66aj	5	1	3	2020-07-28 00:38:17.063888-07	2020-07-28 00:38:17.063901-07	\N
6	KFW7MhkK9QM8KYcd83eXF1KA4AU6hs	6	1	3	2020-07-28 06:11:56.711535-07	2020-07-28 06:11:56.711549-07	\N
7	aATxcC5hS02AtmnmYf8J39gGKxVYAO	7	2	4	2020-07-28 10:03:56.656385-07	2020-07-28 10:03:56.6564-07	\N
8	s8ip0U3DWPLV8fQPf8H8EEtML4OLfn	8	2	4	2020-07-28 10:45:57.776022-07	2020-07-28 10:45:57.776038-07	\N
9	7HP3iCndEwXyDgju9BELgWk4AYrIxc	9	2	4	2020-07-28 10:46:01.407006-07	2020-07-28 10:46:01.40702-07	\N
10	iNHqHW5kXw79QjpopKjsEoZDyyWaN5	10	1	3	2020-07-31 00:49:03.693517-07	2020-07-31 00:49:03.693546-07	\N
11	SOVeRdVTrTI9XwjjLbnYycAIu5udX7	11	1	3	2020-07-31 07:17:45.437702-07	2020-07-31 07:17:45.43773-07	\N
12	tX6cpNKlobrr4Vrw0WUC8DVGxW1tVK	12	1	3	2020-08-01 04:14:23.749546-07	2020-08-01 04:14:23.749561-07	\N
13	c9CFVWf1hHLRSZUgbzSAScAhabJMCo	13	1	3	2020-08-01 11:45:12.135944-07	2020-08-01 11:45:12.13596-07	\N
14	sKyb89cTb0abhdDzC8C8mmEauWgqS2	14	1	3	2020-08-01 13:15:19.979057-07	2020-08-01 13:15:19.97907-07	\N
15	3URg5y579HKtQHqnAzvffGxFWMatYZ	15	1	3	2020-08-05 01:05:41.206897-07	2020-08-05 01:05:41.206918-07	\N
\.


--
-- Data for Name: profiles_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, photo, birthday, location, creation_time) FROM stdin;
1	pbkdf2_sha256$100000$BiTmsey2fYss$OikAqJnZV82LMbaFYOGHWj0HL2MPjSjiXOysJMy/RvQ=	2020-08-05 01:07:42.347727-07	t	admin			admin@gmail.com	t	t	2020-07-25 10:46:08-07	userphotos/1.jpeg	\N	\N	2020-07-25 10:46:08-07
3	pbkdf2_sha256$100000$fmYfSfKeMVlw$ai+jODAqoqx0Ysm9CzfmrHPgxQlLPKqe1wySd7G5Uvo=	\N	t	champion_327@hotmail.com			champion_327@hotmail.com	t	t	2020-07-25 10:56:02-07	userphotos/6.jpeg	\N	\N	2020-07-25 10:56:02-07
4	pbkdf2_sha256$100000$8VwxPFqXTGAA$ngyuqTV3p8qo0zs8JPZb7NrwKWt2DiLwC/jfvpjx1Yk=	2020-07-28 20:35:03-07	f	surajbohra210@gmail.com			surajbohra210@gmail.com	t	t	2020-07-28 10:00:51-07	userphotos/5.jpeg	\N	\N	2020-07-28 10:00:51-07
\.


--
-- Data for Name: profiles_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: profiles_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 39, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 39, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 15, true);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 2, true);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 15, true);


--
-- Name: profiles_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profiles_user_groups_id_seq', 1, false);


--
-- Name: profiles_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profiles_user_id_seq', 5, true);


--
-- Name: profiles_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profiles_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: core_ricaofficer core_ricaofficer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_ricaofficer
    ADD CONSTRAINT core_ricaofficer_pkey PRIMARY KEY (mobile_number);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_source_refresh_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_source_refresh_token_id_key UNIQUE (source_refresh_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq UNIQUE (token, revoked);


--
-- Name: profiles_user_groups profiles_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user_groups
    ADD CONSTRAINT profiles_user_groups_pkey PRIMARY KEY (id);


--
-- Name: profiles_user_groups profiles_user_groups_user_id_group_id_8abc21ba_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user_groups
    ADD CONSTRAINT profiles_user_groups_user_id_group_id_8abc21ba_uniq UNIQUE (user_id, group_id);


--
-- Name: profiles_user profiles_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user
    ADD CONSTRAINT profiles_user_pkey PRIMARY KEY (id);


--
-- Name: profiles_user_user_permissions profiles_user_user_permi_user_id_permission_id_d7ec8e00_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user_user_permissions
    ADD CONSTRAINT profiles_user_user_permi_user_id_permission_id_d7ec8e00_uniq UNIQUE (user_id, permission_id);


--
-- Name: profiles_user_user_permissions profiles_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user_user_permissions
    ADD CONSTRAINT profiles_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: profiles_user profiles_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user
    ADD CONSTRAINT profiles_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: core_ricaofficer_mobile_number_2d95f573_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_ricaofficer_mobile_number_2d95f573_like ON public.core_ricaofficer USING btree (mobile_number varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: profiles_user_groups_group_id_352908a1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profiles_user_groups_group_id_352908a1 ON public.profiles_user_groups USING btree (group_id);


--
-- Name: profiles_user_groups_user_id_4d7ad1f7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profiles_user_groups_user_id_4d7ad1f7 ON public.profiles_user_groups USING btree (user_id);


--
-- Name: profiles_user_user_permissions_permission_id_11ba56f0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profiles_user_user_permissions_permission_id_11ba56f0 ON public.profiles_user_user_permissions USING btree (permission_id);


--
-- Name: profiles_user_user_permissions_user_id_d22af5be; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profiles_user_user_permissions_user_id_d22af5be ON public.profiles_user_user_permissions USING btree (user_id);


--
-- Name: profiles_user_username_5357bba6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profiles_user_username_5357bba6_like ON public.profiles_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_profiles_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_profiles_user_id FOREIGN KEY (user_id) REFERENCES public.profiles_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr FOREIGN KEY (source_refresh_token_id) REFERENCES public.oauth2_provider_refreshtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_user_id_6e4c9a65_fk_profiles_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_user_id_6e4c9a65_fk_profiles_ FOREIGN KEY (user_id) REFERENCES public.profiles_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_application_id_b22886e1_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_appl_user_id_79829054_fk_profiles_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_appl_user_id_79829054_fk_profiles_ FOREIGN KEY (user_id) REFERENCES public.profiles_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_application_id_81923564_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_application_id_81923564_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_profiles_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_profiles_user_id FOREIGN KEY (user_id) REFERENCES public.profiles_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_user_id_da837fce_fk_profiles_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_user_id_da837fce_fk_profiles_ FOREIGN KEY (user_id) REFERENCES public.profiles_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_application_id_2d1c311b_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_user_groups profiles_user_groups_group_id_352908a1_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user_groups
    ADD CONSTRAINT profiles_user_groups_group_id_352908a1_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_user_groups profiles_user_groups_user_id_4d7ad1f7_fk_profiles_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user_groups
    ADD CONSTRAINT profiles_user_groups_user_id_4d7ad1f7_fk_profiles_user_id FOREIGN KEY (user_id) REFERENCES public.profiles_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_user_user_permissions profiles_user_user_p_permission_id_11ba56f0_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user_user_permissions
    ADD CONSTRAINT profiles_user_user_p_permission_id_11ba56f0_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_user_user_permissions profiles_user_user_p_user_id_d22af5be_fk_profiles_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles_user_user_permissions
    ADD CONSTRAINT profiles_user_user_p_user_id_d22af5be_fk_profiles_ FOREIGN KEY (user_id) REFERENCES public.profiles_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

