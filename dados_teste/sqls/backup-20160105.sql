--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.0
-- Started on 2016-01-05 17:12:04 BRST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 199 (class 3079 OID 12123)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 199
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 24817)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 24815)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 181 (class 1259 OID 24827)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 24825)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 180
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 177 (class 1259 OID 24809)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 24807)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 183 (class 1259 OID 24835)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 24845)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 24843)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 182 (class 1259 OID 24833)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 187 (class 1259 OID 24853)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 24851)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 186
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 191 (class 1259 OID 24938)
-- Name: core_estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE core_estado (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    codigo integer NOT NULL
);


ALTER TABLE core_estado OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 24936)
-- Name: core_estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_estado_id_seq OWNER TO postgres;

--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 190
-- Name: core_estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_estado_id_seq OWNED BY core_estado.id;


--
-- TOC entry 193 (class 1259 OID 24946)
-- Name: core_mesoregiao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE core_mesoregiao (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    codigo integer NOT NULL,
    estado_id integer NOT NULL
);


ALTER TABLE core_mesoregiao OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 24944)
-- Name: core_mesoregiao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_mesoregiao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_mesoregiao_id_seq OWNER TO postgres;

--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 192
-- Name: core_mesoregiao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_mesoregiao_id_seq OWNED BY core_mesoregiao.id;


--
-- TOC entry 195 (class 1259 OID 24954)
-- Name: core_microregiao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE core_microregiao (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    codigo integer NOT NULL,
    mesoregiao_id integer NOT NULL
);


ALTER TABLE core_microregiao OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 24952)
-- Name: core_microregiao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_microregiao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_microregiao_id_seq OWNER TO postgres;

--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 194
-- Name: core_microregiao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_microregiao_id_seq OWNED BY core_microregiao.id;


--
-- TOC entry 197 (class 1259 OID 24962)
-- Name: core_municipio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE core_municipio (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    codigo integer NOT NULL,
    codigo_completo bigint NOT NULL,
    microregiao_id integer NOT NULL,
    estado_id integer NOT NULL
);


ALTER TABLE core_municipio OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24960)
-- Name: core_municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_municipio_id_seq OWNER TO postgres;

--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 196
-- Name: core_municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_municipio_id_seq OWNED BY core_municipio.id;


--
-- TOC entry 189 (class 1259 OID 24913)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
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


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 24911)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 188
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 175 (class 1259 OID 24799)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 24797)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 174
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 173 (class 1259 OID 24788)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 24786)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 172
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 198 (class 1259 OID 24980)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- TOC entry 2229 (class 2604 OID 24820)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 24830)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2228 (class 2604 OID 24812)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2231 (class 2604 OID 24838)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2232 (class 2604 OID 24848)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2233 (class 2604 OID 24856)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2236 (class 2604 OID 24941)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_estado ALTER COLUMN id SET DEFAULT nextval('core_estado_id_seq'::regclass);


--
-- TOC entry 2237 (class 2604 OID 24949)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_mesoregiao ALTER COLUMN id SET DEFAULT nextval('core_mesoregiao_id_seq'::regclass);


--
-- TOC entry 2238 (class 2604 OID 24957)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_microregiao ALTER COLUMN id SET DEFAULT nextval('core_microregiao_id_seq'::regclass);


--
-- TOC entry 2239 (class 2604 OID 24965)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_municipio ALTER COLUMN id SET DEFAULT nextval('core_municipio_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 24916)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 2227 (class 2604 OID 24802)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 2226 (class 2604 OID 24791)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2428 (class 0 OID 24817)
-- Dependencies: 179
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2430 (class 0 OID 24827)
-- Dependencies: 181
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 180
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2426 (class 0 OID 24809)
-- Dependencies: 177
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add estado	7	add_estado
20	Can change estado	7	change_estado
21	Can delete estado	7	delete_estado
22	Can add meso regiao	8	add_mesoregiao
23	Can change meso regiao	8	change_mesoregiao
24	Can delete meso regiao	8	delete_mesoregiao
25	Can add micro regiao	9	add_microregiao
26	Can change micro regiao	9	change_microregiao
27	Can delete micro regiao	9	delete_microregiao
28	Can add municipio	10	add_municipio
29	Can change municipio	10	change_municipio
30	Can delete municipio	10	delete_municipio
\.


--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 30, true);


--
-- TOC entry 2432 (class 0 OID 24835)
-- Dependencies: 183
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$IVBsjijIGljL$hbdTGvJSWVgjIxSrwWM43YSAgwackj3toC6yfl7xBpg=	2016-01-04 17:52:59.128542-02	t	admin			admin@ifes.edu.br	t	t	2016-01-04 17:52:46.75138-02
\.


--
-- TOC entry 2434 (class 0 OID 24845)
-- Dependencies: 185
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- TOC entry 2436 (class 0 OID 24853)
-- Dependencies: 187
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 186
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2440 (class 0 OID 24938)
-- Dependencies: 191
-- Data for Name: core_estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_estado (id, nome, codigo) FROM stdin;
1	Rondônia	11
2	Acre	12
3	Amazonas	13
4	Roraima	14
5	Pará	15
6	Amapá	16
7	Tocantins	17
8	Maranhão	21
9	Piauí	22
10	Ceará	23
11	Rio Grande do Norte	24
12	Paraíba	25
13	Pernambuco	26
14	Alagoas	27
15	Sergipe	28
16	Bahia	29
17	Minas Gerais	31
18	Espírito Santo	32
19	Rio de Janeiro	33
20	São Paulo	35
21	Paraná	41
22	Santa Catarina	42
23	Rio Grande do Sul	43
24	Mato Grosso do Sul	50
25	Mato Grosso	51
26	Goiás	52
27	Distrito Federal	53
\.


--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 190
-- Name: core_estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_estado_id_seq', 27, true);


--
-- TOC entry 2442 (class 0 OID 24946)
-- Dependencies: 193
-- Data for Name: core_mesoregiao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_mesoregiao (id, nome, codigo, estado_id) FROM stdin;
73	Noroeste Espírito-santense	1	18
74	Litoral Norte Espírito-santense	2	18
75	Central Espírito-santense	3	18
76	Sul Espírito-santense	4	18
\.


--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 192
-- Name: core_mesoregiao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_mesoregiao_id_seq', 76, true);


--
-- TOC entry 2444 (class 0 OID 24954)
-- Dependencies: 195
-- Data for Name: core_microregiao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_microregiao (id, nome, codigo, mesoregiao_id) FROM stdin;
1	Barra de São Francisco	1	73
2	Nova Venécia	2	73
3	Colatina	3	73
4	Montanha	4	74
5	São Mateus	5	74
6	Linhares	6	74
7	Afonso Cláudio	7	75
8	Santa Teresa	8	75
9	Vitória	9	75
10	Guarapari	10	75
11	Alegre	11	76
12	Cachoeiro de Itapemirim	12	76
13	Itapemirim	13	76
\.


--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 194
-- Name: core_microregiao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_microregiao_id_seq', 13, true);


--
-- TOC entry 2446 (class 0 OID 24962)
-- Dependencies: 197
-- Data for Name: core_municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_municipio (id, nome, codigo, codigo_completo, microregiao_id, estado_id) FROM stdin;
14	Água Doce do Norte	169	3200169	1	18
15	Barra de São Francisco	904	3200904	1	18
16	Ecoporanga	2108	3202108	1	18
17	Mantenópolis	3304	3203304	1	18
18	Águia Branca	136	3200136	2	18
19	Boa Esperança	1001	3201001	2	18
20	Nova Venécia	3908	3203908	2	18
21	São Gabriel da Palha	4708	3204708	2	18
22	Vila Pavão	5150	3205150	2	18
23	Vila Valério	5176	3205176	2	18
24	Alto Rio Novo	359	3200359	3	18
25	Baixo Guandu	805	3200805	3	18
26	Colatina	1506	3201506	3	18
27	Governador Lindenberg	2256	3202256	3	18
28	Marilândia	3353	3203353	3	18
29	Pancas	4005	3204005	3	18
30	São Domingos do Norte	4658	3204658	3	18
31	Montanha	3502	3203502	4	18
32	Mucurici	3601	3203601	4	18
33	Pinheiros	4104	3204104	4	18
34	Ponto Belo	4252	3204252	4	18
35	Conceição da Barra	1605	3201605	5	18
36	Jaguaré	3056	3203056	5	18
37	Pedro Canário	4054	3204054	5	18
38	São Mateus	4906	3204906	5	18
39	Aracruz	607	3200607	6	18
40	Fundão	2207	3202207	6	18
41	Ibiraçu	2504	3202504	6	18
42	João Neiva	3130	3203130	6	18
43	Linhares	3205	3203205	6	18
44	Rio Bananal	4351	3204351	6	18
45	Sooretama	5010	3205010	6	18
46	Afonso Cláudio	102	3200102	7	18
47	Brejetuba	1159	3201159	7	18
48	Conceição do Castelo	1704	3201704	7	18
49	Domingos Martins	1902	3201902	7	18
50	Laranja da Terra	3163	3203163	7	18
51	Marechal Floriano	3346	3203346	7	18
52	Venda Nova do Imigrante	5069	3205069	7	18
53	Itaguaçu	2702	3202702	8	18
54	Itarana	2900	3202900	8	18
55	Santa Leopoldina	4500	3204500	8	18
56	Santa Maria de Jetibá	4559	3204559	8	18
57	Santa Teresa	4609	3204609	8	18
58	São Roque do Canaã	4955	3204955	8	18
59	Cariacica	1308	3201308	9	18
60	Serra	5002	3205002	9	18
61	Viana	5101	3205101	9	18
62	Vila Velha	5200	3205200	9	18
63	Vitória	5309	3205309	9	18
64	Alfredo Chaves	300	3200300	10	18
65	Anchieta	409	3200409	10	18
66	Guarapari	2405	3202405	10	18
67	Iconha	2603	3202603	10	18
68	Piúma	4203	3204203	10	18
69	Rio Novo do Sul	4401	3204401	10	18
70	Alegre	201	3200201	11	18
71	Divino de São Lourenço	1803	3201803	11	18
72	Dores do Rio Preto	2009	3202009	11	18
73	Guaçuí	2306	3202306	11	18
74	Ibatiba	2454	3202454	11	18
75	Ibitirama	2553	3202553	11	18
76	Irupi	2652	3202652	11	18
77	Iúna	3007	3203007	11	18
78	Muniz Freire	3700	3203700	11	18
79	Apiacá	508	3200508	12	18
80	Atilio Vivacqua	706	3200706	12	18
81	Bom Jesus do Norte	1100	3201100	12	18
82	Cachoeiro de Itapemirim	1209	3201209	12	18
83	Castelo	1407	3201407	12	18
84	Jerônimo Monteiro	3106	3203106	12	18
85	Mimoso do Sul	3403	3203403	12	18
86	Muqui	3809	3203809	12	18
87	São José do Calçado	4807	3204807	12	18
88	Vargem Alta	5036	3205036	12	18
89	Itapemirim	2801	3202801	13	18
90	Marataízes	3320	3203320	13	18
91	Presidente Kennedy	4302	3204302	13	18
\.


--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 196
-- Name: core_municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_municipio_id_seq', 91, true);


--
-- TOC entry 2438 (class 0 OID 24913)
-- Dependencies: 189
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-01-04 19:18:44.556726-02	30	Metropolitana de São Paulo	3		8	1
2	2016-01-04 19:18:44.602095-02	29	Litoral Sul Paulista	3		8	1
3	2016-01-04 19:18:44.604201-02	28	Vale do Paraíba Paulista	3		8	1
4	2016-01-04 19:18:44.606512-02	27	Zona da Mata	3		8	1
5	2016-01-04 19:18:44.60883-02	26	Campo das Vertentes	3		8	1
6	2016-01-04 19:18:44.611153-02	25	Sul/Sudoeste de Minas	3		8	1
7	2016-01-04 19:18:44.613905-02	24	Oeste de Minas	3		8	1
8	2016-01-04 19:18:44.61637-02	23	Vale do Rio Doce	3		8	1
9	2016-01-04 19:18:44.618942-02	22	Sul Cearense	3		8	1
10	2016-01-04 19:18:44.621032-02	21	Sudeste Paraense	3		8	1
11	2016-01-04 19:18:44.622963-02	20	Sudoeste Paraense	3		8	1
12	2016-01-04 19:18:44.624814-02	19	Sul Amazonense	3		8	1
13	2016-01-04 19:18:44.626548-02	18	Centro Amazonense	3		8	1
14	2016-01-04 19:18:44.628951-02	17	Leste Rondoniense	3		8	1
15	2016-01-04 19:18:44.631508-02	16	Madeira-Guaporé	3		8	1
16	2016-01-04 20:08:53.422572-02	72	Distrito Federal	3		8	1
17	2016-01-04 20:08:53.46825-02	71	Noroeste Goiano	3		8	1
18	2016-01-04 20:08:53.470635-02	70	Norte Mato-grossense	3		8	1
19	2016-01-04 20:08:53.472828-02	69	Pantanais Sul Mato-grossense	3		8	1
20	2016-01-04 20:08:53.475544-02	68	Noroeste Rio-grandense	3		8	1
21	2016-01-04 20:08:53.477824-02	67	Oeste Catarinense	3		8	1
22	2016-01-04 20:08:53.480603-02	66	Noroeste Paranaense	3		8	1
23	2016-01-04 20:08:53.482719-02	65	São José do Rio Preto	3		8	1
24	2016-01-04 20:08:53.484575-02	64	Noroeste Fluminense	3		8	1
25	2016-01-04 20:08:53.486257-02	63	Noroeste Espírito-santense	3		8	1
26	2016-01-04 20:08:53.487901-02	62	Noroeste de Minas	3		8	1
27	2016-01-04 20:08:53.489704-02	61	Extremo Oeste Baiano	3		8	1
28	2016-01-04 20:08:53.492324-02	60	Sertão Sergipano	3		8	1
29	2016-01-04 20:08:53.495446-02	59	Sertão Alagoano	3		8	1
30	2016-01-04 20:08:53.497298-02	58	Sertão Pernambucano	3		8	1
31	2016-01-04 20:08:53.499069-02	57	Sertão Paraibano	3		8	1
32	2016-01-04 20:08:53.502338-02	56	Oeste Potiguar	3		8	1
33	2016-01-04 20:08:53.504211-02	55	Noroeste Cearense	3		8	1
34	2016-01-04 20:08:53.505885-02	54	Norte Piauiense	3		8	1
35	2016-01-04 20:08:53.507621-02	53	Norte Maranhense	3		8	1
36	2016-01-04 20:08:53.511736-02	52	Ocidental do Tocantins	3		8	1
37	2016-01-04 20:08:53.513857-02	51	Norte do Amapá	3		8	1
38	2016-01-04 20:08:53.51557-02	50	Baixo Amazonas	3		8	1
39	2016-01-04 20:08:53.517398-02	49	Norte de Roraima	3		8	1
40	2016-01-04 20:08:53.519222-02	48	Norte Amazonense	3		8	1
41	2016-01-04 20:08:53.52212-02	47	Vale do Juruá	3		8	1
42	2016-01-04 20:08:53.523721-02	46	Madeira-Guaporé	3		8	1
43	2016-01-04 20:08:53.526371-02	45	Metropolitana de São Paulo	3		8	1
44	2016-01-04 20:08:53.529871-02	44	Litoral Sul Paulista	3		8	1
45	2016-01-04 20:08:53.531723-02	43	Vale do Paraíba Paulista	3		8	1
46	2016-01-04 20:08:53.53339-02	42	Zona da Mata	3		8	1
47	2016-01-04 20:08:53.535044-02	41	Campo das Vertentes	3		8	1
48	2016-01-04 20:08:53.536712-02	40	Sul/Sudoeste de Minas	3		8	1
49	2016-01-04 20:08:53.538324-02	39	Oeste de Minas	3		8	1
50	2016-01-04 20:08:53.540641-02	38	Vale do Rio Doce	3		8	1
51	2016-01-04 20:08:53.544131-02	37	Sul Cearense	3		8	1
52	2016-01-04 20:08:53.546664-02	36	Sudeste Paraense	3		8	1
53	2016-01-04 20:08:53.548465-02	35	Sudoeste Paraense	3		8	1
54	2016-01-04 20:08:53.550113-02	34	Sul Amazonense	3		8	1
55	2016-01-04 20:08:53.552737-02	33	Centro Amazonense	3		8	1
56	2016-01-04 20:08:53.554502-02	32	Leste Rondoniense	3		8	1
57	2016-01-04 20:08:53.555998-02	31	Madeira-Guaporé	3		8	1
58	2016-01-05 00:00:38.620264-02	7	Afonso Cláudio	3		10	1
59	2016-01-05 00:00:38.693833-02	11	Alegre	3		10	1
60	2016-01-05 00:00:38.696153-02	10	Alfredo Chaves	3		10	1
61	2016-01-05 00:00:38.698165-02	3	Alto Rio Novo	3		10	1
62	2016-01-05 00:00:38.700031-02	12	Apiacá	3		10	1
63	2016-01-05 00:00:38.701929-02	6	Aracruz	3		10	1
64	2016-01-05 00:00:38.703833-02	9	Cariacica	3		10	1
65	2016-01-05 00:00:38.705775-02	5	Conceição da Barra	3		10	1
66	2016-01-05 00:00:38.707614-02	8	Itaguaçu	3		10	1
67	2016-01-05 00:00:38.709446-02	13	Itapemirim	3		10	1
68	2016-01-05 00:00:38.711222-02	4	Montanha	3		10	1
69	2016-01-05 00:00:38.713219-02	1	Água Doce do Norte	3		10	1
70	2016-01-05 00:00:38.715046-02	2	Águia Branca	3		10	1
\.


--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 188
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 70, true);


--
-- TOC entry 2424 (class 0 OID 24799)
-- Dependencies: 175
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	core	estado
8	core	mesoregiao
9	core	microregiao
10	core	municipio
\.


--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 174
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 10, true);


--
-- TOC entry 2422 (class 0 OID 24788)
-- Dependencies: 173
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-01-04 17:45:49.259066-02
2	auth	0001_initial	2016-01-04 17:45:49.668172-02
3	admin	0001_initial	2016-01-04 17:45:49.746159-02
4	admin	0002_logentry_remove_auto_add	2016-01-04 17:45:49.76722-02
5	contenttypes	0002_remove_content_type_name	2016-01-04 17:45:49.873579-02
6	auth	0002_alter_permission_name_max_length	2016-01-04 17:45:49.924757-02
7	auth	0003_alter_user_email_max_length	2016-01-04 17:45:49.961107-02
8	auth	0004_alter_user_username_opts	2016-01-04 17:45:49.979559-02
9	auth	0005_alter_user_last_login_null	2016-01-04 17:45:50.000055-02
10	auth	0006_require_contenttypes_0002	2016-01-04 17:45:50.016135-02
11	auth	0007_alter_validators_add_error_messages	2016-01-04 17:45:50.083308-02
12	core	0001_initial	2016-01-04 17:45:50.134336-02
13	sessions	0001_initial	2016-01-04 17:45:50.158957-02
14	core	0002_mesoregiao_estado	2016-01-04 18:08:27.386705-02
15	core	0003_auto_20160104_2257	2016-01-04 20:58:05.202252-02
\.


--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 172
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 15, true);


--
-- TOC entry 2447 (class 0 OID 24980)
-- Dependencies: 198
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
3wwvnqdhd4ssmd2g519z3aoi0sw78rfw	NWQwNjE4YTIxNTYxNzBkNjhjYjQxZjhkNGIzOTIwYWRjNzc5ZTI4Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImRlMTBiNDllMDJiMTVmMzBlMTY3NmY0N2ZlMzk1OTg3NzIzYTBhYTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-01-18 17:52:59.141065-02
\.


--
-- TOC entry 2253 (class 2606 OID 24824)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2259 (class 2606 OID 24879)
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 24832)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 24822)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 24865)
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2250 (class 2606 OID 24814)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 24850)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 24894)
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2263 (class 2606 OID 24840)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 24858)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 24908)
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 24842)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2284 (class 2606 OID 24943)
-- Name: core_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY core_estado
    ADD CONSTRAINT core_estado_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 24951)
-- Name: core_mesoregiao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY core_mesoregiao
    ADD CONSTRAINT core_mesoregiao_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 24959)
-- Name: core_microregiao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY core_microregiao
    ADD CONSTRAINT core_microregiao_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 24967)
-- Name: core_municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY core_municipio
    ADD CONSTRAINT core_municipio_pkey PRIMARY KEY (id);


--
-- TOC entry 2282 (class 2606 OID 24922)
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 24806)
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2245 (class 2606 OID 24804)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2241 (class 2606 OID 24796)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 24987)
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2251 (class 1259 OID 24867)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2256 (class 1259 OID 24880)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 2257 (class 1259 OID 24881)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2246 (class 1259 OID 24866)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- TOC entry 2267 (class 1259 OID 24896)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 2268 (class 1259 OID 24895)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 2273 (class 1259 OID 24910)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2274 (class 1259 OID 24909)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2264 (class 1259 OID 24882)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2285 (class 1259 OID 24996)
-- Name: core_mesoregiao_2c189993; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX core_mesoregiao_2c189993 ON core_mesoregiao USING btree (estado_id);


--
-- TOC entry 2288 (class 1259 OID 24973)
-- Name: core_microregiao_55e329a2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX core_microregiao_55e329a2 ON core_microregiao USING btree (mesoregiao_id);


--
-- TOC entry 2291 (class 1259 OID 25008)
-- Name: core_municipio_2c189993; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX core_municipio_2c189993 ON core_municipio USING btree (estado_id);


--
-- TOC entry 2292 (class 1259 OID 24979)
-- Name: core_municipio_376ba068; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX core_municipio_376ba068 ON core_municipio USING btree (microregiao_id);


--
-- TOC entry 2279 (class 1259 OID 24933)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 2280 (class 1259 OID 24934)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- TOC entry 2295 (class 1259 OID 24988)
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- TOC entry 2298 (class 1259 OID 24989)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2301 (class 2606 OID 24873)
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2300 (class 2606 OID 24868)
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2299 (class 2606 OID 24859)
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2303 (class 2606 OID 24888)
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2302 (class 2606 OID 24883)
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2305 (class 2606 OID 24902)
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2304 (class 2606 OID 24897)
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2308 (class 2606 OID 24997)
-- Name: core_mesoregiao_estado_id_de43b177_fk_core_estado_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_mesoregiao
    ADD CONSTRAINT core_mesoregiao_estado_id_de43b177_fk_core_estado_id FOREIGN KEY (estado_id) REFERENCES core_estado(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2309 (class 2606 OID 24968)
-- Name: core_microregiao_mesoregiao_id_d1550f1e_fk_core_mesoregiao_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_microregiao
    ADD CONSTRAINT core_microregiao_mesoregiao_id_d1550f1e_fk_core_mesoregiao_id FOREIGN KEY (mesoregiao_id) REFERENCES core_mesoregiao(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2311 (class 2606 OID 25009)
-- Name: core_municipio_estado_id_8d07bbda_fk_core_estado_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_municipio
    ADD CONSTRAINT core_municipio_estado_id_8d07bbda_fk_core_estado_id FOREIGN KEY (estado_id) REFERENCES core_estado(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2310 (class 2606 OID 24974)
-- Name: core_municipio_microregiao_id_d4c9f769_fk_core_microregiao_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_municipio
    ADD CONSTRAINT core_municipio_microregiao_id_d4c9f769_fk_core_microregiao_id FOREIGN KEY (microregiao_id) REFERENCES core_microregiao(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2306 (class 2606 OID 24923)
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2307 (class 2606 OID 24928)
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: paulo
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM paulo;
GRANT ALL ON SCHEMA public TO paulo;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-01-05 17:12:05 BRST

--
-- PostgreSQL database dump complete
--

