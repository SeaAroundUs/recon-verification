--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.1
-- Started on 2015-04-03 14:11:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 16974)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO recon;

--
-- TOC entry 174 (class 1259 OID 16977)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO recon;

--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 174
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 175 (class 1259 OID 16979)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO recon;

--
-- TOC entry 176 (class 1259 OID 16982)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO recon;

--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 177 (class 1259 OID 16984)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO recon;

--
-- TOC entry 178 (class 1259 OID 16987)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO recon;

--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 179 (class 1259 OID 16989)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO recon;

--
-- TOC entry 180 (class 1259 OID 16992)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO recon;

--
-- TOC entry 181 (class 1259 OID 16995)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO recon;

--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 181
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 182 (class 1259 OID 16997)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO recon;

--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 183 (class 1259 OID 16999)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO recon;

--
-- TOC entry 184 (class 1259 OID 17002)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO recon;

--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 200 (class 1259 OID 17473)
-- Name: catch_type; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE catch_type (
    id integer NOT NULL,
    type character varying(200) NOT NULL
);


ALTER TABLE catch_type OWNER TO recon;

--
-- TOC entry 199 (class 1259 OID 17471)
-- Name: catch_type_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE catch_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catch_type_id_seq OWNER TO recon;

--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 199
-- Name: catch_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE catch_type_id_seq OWNED BY catch_type.id;


--
-- TOC entry 202 (class 1259 OID 17481)
-- Name: country; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE country (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE country OWNER TO recon;

--
-- TOC entry 201 (class 1259 OID 17479)
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE country_id_seq OWNER TO recon;

--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 201
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE country_id_seq OWNED BY country.id;


--
-- TOC entry 194 (class 1259 OID 17425)
-- Name: data_ingest_fileupload; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE data_ingest_fileupload (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    create_datetime timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE data_ingest_fileupload OWNER TO recon;

--
-- TOC entry 193 (class 1259 OID 17423)
-- Name: data_ingest_fileupload_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE data_ingest_fileupload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_ingest_fileupload_id_seq OWNER TO recon;

--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 193
-- Name: data_ingest_fileupload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE data_ingest_fileupload_id_seq OWNED BY data_ingest_fileupload.id;


--
-- TOC entry 196 (class 1259 OID 17433)
-- Name: data_ingest_rawcatch; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE data_ingest_rawcatch (
    id integer NOT NULL,
    fishing_entity character varying(200) NOT NULL,
    fishing_entity_id integer NOT NULL,
    original_country_fishing character varying(200) NOT NULL,
    eez_area character varying(200) NOT NULL,
    eez_id integer NOT NULL,
    eez_sub_area character varying(200),
    fao_area character varying(20),
    sub_regional_area character varying(200),
    province_state character varying(200),
    ices_division character varying(20),
    ices_subdivision character varying(20),
    nafo_division character varying(20),
    ccamlr_area character varying(20),
    layer integer NOT NULL,
    year integer NOT NULL,
    amount numeric(20,12) NOT NULL,
    adjustment_factor character varying(200),
    gear_type character varying(200),
    gear_type_id integer NOT NULL,
    taxon_name character varying(200) NOT NULL,
    taxon_key integer NOT NULL,
    original_fao_name character varying(200),
    sector character varying(200) NOT NULL,
    original_sector character varying(200),
    sector_id integer NOT NULL,
    catch_type character varying(200) NOT NULL,
    catch_type_id integer NOT NULL,
    input_type character varying(200),
    reference_id integer,
    forward_carry_rule character varying(400),
    notes character varying(2000),
    source_file_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE data_ingest_rawcatch OWNER TO recon;

--
-- TOC entry 195 (class 1259 OID 17431)
-- Name: data_ingest_rawcatch_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE data_ingest_rawcatch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_ingest_rawcatch_id_seq OWNER TO recon;

--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 195
-- Name: data_ingest_rawcatch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE data_ingest_rawcatch_id_seq OWNED BY data_ingest_rawcatch.id;


--
-- TOC entry 185 (class 1259 OID 17056)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
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


ALTER TABLE django_admin_log OWNER TO recon;

--
-- TOC entry 186 (class 1259 OID 17063)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO recon;

--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 186
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 187 (class 1259 OID 17065)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO recon;

--
-- TOC entry 188 (class 1259 OID 17068)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO recon;

--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 188
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 189 (class 1259 OID 17070)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO recon;

--
-- TOC entry 190 (class 1259 OID 17076)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO recon;

--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 190
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 191 (class 1259 OID 17078)
-- Name: django_session; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO recon;

--
-- TOC entry 204 (class 1259 OID 17489)
-- Name: eez; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE eez (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE eez OWNER TO recon;

--
-- TOC entry 203 (class 1259 OID 17487)
-- Name: eez_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE eez_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eez_id_seq OWNER TO recon;

--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 203
-- Name: eez_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE eez_id_seq OWNED BY eez.id;


--
-- TOC entry 208 (class 1259 OID 17505)
-- Name: fishing_sector; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE fishing_sector (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE fishing_sector OWNER TO recon;

--
-- TOC entry 207 (class 1259 OID 17503)
-- Name: fishing_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE fishing_sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fishing_sector_id_seq OWNER TO recon;

--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 207
-- Name: fishing_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE fishing_sector_id_seq OWNED BY fishing_sector.id;


--
-- TOC entry 198 (class 1259 OID 17462)
-- Name: reconstructed_catch; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE reconstructed_catch (
    id integer NOT NULL,
    year integer NOT NULL,
    amount numeric(20,12) NOT NULL,
    fao_area character varying(20),
    sub_regional_area character varying(200),
    province_state character varying(200),
    ices_division character varying(20),
    ices_subdivision character varying(20),
    nafo_division character varying(20),
    ccamlr_area character varying(20),
    input_type character varying(200),
    reference_id integer,
    forward_carry_rule character varying(400),
    adjustment_factor character varying(200),
    gear character varying(200),
    notes character varying(2000),
    catch_type_id integer NOT NULL,
    eez_id integer NOT NULL,
    fishing_entity_id integer NOT NULL,
    original_country_fishing_id integer NOT NULL,
    raw_catch_id integer NOT NULL,
    sector_id integer NOT NULL,
    taxon_id integer NOT NULL
);


ALTER TABLE reconstructed_catch OWNER TO recon;

--
-- TOC entry 197 (class 1259 OID 17460)
-- Name: reconstructed_catch_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE reconstructed_catch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reconstructed_catch_id_seq OWNER TO recon;

--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 197
-- Name: reconstructed_catch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE reconstructed_catch_id_seq OWNED BY reconstructed_catch.id;


--
-- TOC entry 206 (class 1259 OID 17497)
-- Name: reference; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE reference (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE reference OWNER TO recon;

--
-- TOC entry 205 (class 1259 OID 17495)
-- Name: reference_id_seq; Type: SEQUENCE; Schema: public; Owner: recon
--

CREATE SEQUENCE reference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reference_id_seq OWNER TO recon;

--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 205
-- Name: reference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recon
--

ALTER SEQUENCE reference_id_seq OWNED BY reference.id;


--
-- TOC entry 209 (class 1259 OID 17511)
-- Name: taxon; Type: TABLE; Schema: public; Owner: recon; Tablespace: 
--

CREATE TABLE taxon (
    taxon_key integer NOT NULL,
    name character varying(255) NOT NULL,
    scientific_name character varying(255) NOT NULL
);


ALTER TABLE taxon OWNER TO recon;

--
-- TOC entry 2862 (class 2604 OID 17090)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2863 (class 2604 OID 17091)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2864 (class 2604 OID 17092)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2865 (class 2604 OID 17093)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2866 (class 2604 OID 17094)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2867 (class 2604 OID 17095)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2875 (class 2604 OID 17476)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY catch_type ALTER COLUMN id SET DEFAULT nextval('catch_type_id_seq'::regclass);


--
-- TOC entry 2876 (class 2604 OID 17484)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY country ALTER COLUMN id SET DEFAULT nextval('country_id_seq'::regclass);


--
-- TOC entry 2872 (class 2604 OID 17428)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY data_ingest_fileupload ALTER COLUMN id SET DEFAULT nextval('data_ingest_fileupload_id_seq'::regclass);


--
-- TOC entry 2873 (class 2604 OID 17436)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY data_ingest_rawcatch ALTER COLUMN id SET DEFAULT nextval('data_ingest_rawcatch_id_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 17104)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 2870 (class 2604 OID 17105)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 2871 (class 2604 OID 17106)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2877 (class 2604 OID 17492)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY eez ALTER COLUMN id SET DEFAULT nextval('eez_id_seq'::regclass);


--
-- TOC entry 2879 (class 2604 OID 17508)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY fishing_sector ALTER COLUMN id SET DEFAULT nextval('fishing_sector_id_seq'::regclass);


--
-- TOC entry 2874 (class 2604 OID 17465)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY reconstructed_catch ALTER COLUMN id SET DEFAULT nextval('reconstructed_catch_id_seq'::regclass);


--
-- TOC entry 2878 (class 2604 OID 17500)
-- Name: id; Type: DEFAULT; Schema: public; Owner: recon
--

ALTER TABLE ONLY reference ALTER COLUMN id SET DEFAULT nextval('reference_id_seq'::regclass);


--
-- TOC entry 3082 (class 0 OID 16974)
-- Dependencies: 173
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: recon
--



--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 174
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 3084 (class 0 OID 16979)
-- Dependencies: 175
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: recon
--



--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3086 (class 0 OID 16984)
-- Dependencies: 177
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: recon
--

INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add country', 7, 'add_country');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change country', 7, 'change_country');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete country', 7, 'delete_country');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add eez', 8, 'add_eez');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change eez', 8, 'change_eez');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete eez', 8, 'delete_eez');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add taxon', 9, 'add_taxon');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change taxon', 9, 'change_taxon');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete taxon', 9, 'delete_taxon');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add sector', 10, 'add_sector');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change sector', 10, 'change_sector');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete sector', 10, 'delete_sector');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add catch type', 11, 'add_catchtype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change catch type', 11, 'change_catchtype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete catch type', 11, 'delete_catchtype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add catch', 12, 'add_catch');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change catch', 12, 'change_catch');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete catch', 12, 'delete_catch');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add file upload', 13, 'add_fileupload');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change file upload', 13, 'change_fileupload');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete file upload', 13, 'delete_fileupload');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can add raw catch', 14, 'add_rawcatch');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can change raw catch', 14, 'change_rawcatch');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can delete raw catch', 14, 'delete_rawcatch');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can add reference', 15, 'add_reference');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can change reference', 15, 'change_reference');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can delete reference', 15, 'delete_reference');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can add file upload', 16, 'add_fileupload');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can change file upload', 16, 'change_fileupload');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can delete file upload', 16, 'delete_fileupload');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add raw catch', 17, 'add_rawcatch');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change raw catch', 17, 'change_rawcatch');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete raw catch', 17, 'delete_rawcatch');


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('auth_permission_id_seq', 54, true);


--
-- TOC entry 3088 (class 0 OID 16989)
-- Dependencies: 179
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: recon
--

INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$15000$3GJ5OgOMTvmx$6NneQ5DP0iFya8iRNO+AHb3nfLOAx+zR+ImZDu+Y4cw=', '2015-04-03 15:29:41.279603+00', true, 'recon', '', '', 'recon@sau.org', true, true, '2015-01-14 16:55:11.067017+00');


--
-- TOC entry 3089 (class 0 OID 16992)
-- Dependencies: 180
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: recon
--



--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 181
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- TOC entry 3092 (class 0 OID 16999)
-- Dependencies: 183
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: recon
--



--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3108 (class 0 OID 17473)
-- Dependencies: 200
-- Data for Name: catch_type; Type: TABLE DATA; Schema: public; Owner: recon
--



--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 199
-- Name: catch_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('catch_type_id_seq', 1, false);


--
-- TOC entry 3110 (class 0 OID 17481)
-- Dependencies: 202
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: recon
--

INSERT INTO country (id, name) VALUES (43, 'Congo (ex-Zaire)');
INSERT INTO country (id, name) VALUES (164, 'Peru');
INSERT INTO country (id, name) VALUES (165, 'Philippines');
INSERT INTO country (id, name) VALUES (96, 'India');
INSERT INTO country (id, name) VALUES (74, 'Gambia');
INSERT INTO country (id, name) VALUES (171, 'Qatar');
INSERT INTO country (id, name) VALUES (42, 'Comoros');
INSERT INTO country (id, name) VALUES (122, 'Lithuania');
INSERT INTO country (id, name) VALUES (139, 'Montenegro');
INSERT INTO country (id, name) VALUES (31, 'Canada');
INSERT INTO country (id, name) VALUES (162, 'Panama');
INSERT INTO country (id, name) VALUES (97, 'Indonesia');
INSERT INTO country (id, name) VALUES (60, 'El Salvador');
INSERT INTO country (id, name) VALUES (158, 'Oman');
INSERT INTO country (id, name) VALUES (19, 'Belgium');
INSERT INTO country (id, name) VALUES (106, 'Japan');
INSERT INTO country (id, name) VALUES (198, 'Sweden');
INSERT INTO country (id, name) VALUES (222, 'Vanuatu');
INSERT INTO country (id, name) VALUES (204, 'Togo');
INSERT INTO country (id, name) VALUES (44, 'Congo, R. of');
INSERT INTO country (id, name) VALUES (12, 'Australia');
INSERT INTO country (id, name) VALUES (3, 'Algeria');
INSERT INTO country (id, name) VALUES (95, 'Iceland');
INSERT INTO country (id, name) VALUES (15, 'Bahrain');
INSERT INTO country (id, name) VALUES (121, 'Libya');
INSERT INTO country (id, name) VALUES (186, 'Singapore');
INSERT INTO country (id, name) VALUES (160, 'Palau');
INSERT INTO country (id, name) VALUES (201, 'Tanzania');
INSERT INTO country (id, name) VALUES (23, 'Bosnia & Herzegovina');
INSERT INTO country (id, name) VALUES (136, 'Micronesia');
INSERT INTO country (id, name) VALUES (144, 'Myanmar');
INSERT INTO country (id, name) VALUES (179, 'Saint Vincent & the Grenadines');
INSERT INTO country (id, name) VALUES (217, 'United Kingdom');
INSERT INTO country (id, name) VALUES (218, 'Uruguay');
INSERT INTO country (id, name) VALUES (208, 'Trinidad & Tobago');
INSERT INTO country (id, name) VALUES (224, 'Viet Nam');
INSERT INTO country (id, name) VALUES (80, 'Greece');
INSERT INTO country (id, name) VALUES (58, 'Ecuador');
INSERT INTO country (id, name) VALUES (85, 'Guatemala');
INSERT INTO country (id, name) VALUES (145, 'Namibia');
INSERT INTO country (id, name) VALUES (185, 'Sierra Leone');
INSERT INTO country (id, name) VALUES (176, 'Saint Kitts & Nevis');
INSERT INTO country (id, name) VALUES (54, 'Djibouti');
INSERT INTO country (id, name) VALUES (163, 'Papua New Guinea');
INSERT INTO country (id, name) VALUES (68, 'Finland');
INSERT INTO country (id, name) VALUES (125, 'Madagascar');
INSERT INTO country (id, name) VALUES (103, 'Italy');
INSERT INTO country (id, name) VALUES (167, 'Poland');
INSERT INTO country (id, name) VALUES (128, 'Maldives');
INSERT INTO country (id, name) VALUES (89, 'Haiti');
INSERT INTO country (id, name) VALUES (189, 'Somalia');
INSERT INTO country (id, name) VALUES (8, 'Antigua & Barbuda');
INSERT INTO country (id, name) VALUES (76, 'Georgia');
INSERT INTO country (id, name) VALUES (78, 'Ghana');
INSERT INTO country (id, name) VALUES (174, 'Russian Federation');
INSERT INTO country (id, name) VALUES (221, 'USA');
INSERT INTO country (id, name) VALUES (193, 'Sri Lanka');
INSERT INTO country (id, name) VALUES (196, 'Suriname');
INSERT INTO country (id, name) VALUES (229, 'Yemen');
INSERT INTO country (id, name) VALUES (61, 'Equatorial Guinea');
INSERT INTO country (id, name) VALUES (67, 'Fiji');
INSERT INTO country (id, name) VALUES (30, 'Cameroon');
INSERT INTO country (id, name) VALUES (157, 'Norway');
INSERT INTO country (id, name) VALUES (52, 'Denmark');
INSERT INTO country (id, name) VALUES (138, 'Monaco');
INSERT INTO country (id, name) VALUES (25, 'Brazil');
INSERT INTO country (id, name) VALUES (86, 'Guinea');
INSERT INTO country (id, name) VALUES (206, 'Tonga');
INSERT INTO country (id, name) VALUES (47, 'Côte d''Ivoire');
INSERT INTO country (id, name) VALUES (55, 'Dominica');
INSERT INTO country (id, name) VALUES (203, 'Timor Leste');
INSERT INTO country (id, name) VALUES (118, 'Latvia');
INSERT INTO country (id, name) VALUES (120, 'Liberia');
INSERT INTO country (id, name) VALUES (104, 'Jamaica');
INSERT INTO country (id, name) VALUES (183, 'Senegal');
INSERT INTO country (id, name) VALUES (212, 'Turkey');
INSERT INTO country (id, name) VALUES (56, 'Dominican Republic');
INSERT INTO country (id, name) VALUES (177, 'Saint Lucia');
INSERT INTO country (id, name) VALUES (50, 'Cuba');
INSERT INTO country (id, name) VALUES (98, 'Iran');
INSERT INTO country (id, name) VALUES (168, 'Portugal');
INSERT INTO country (id, name) VALUES (214, 'Tuvalu');
INSERT INTO country (id, name) VALUES (148, 'Netherlands');
INSERT INTO country (id, name) VALUES (152, 'Nicaragua');
INSERT INTO country (id, name) VALUES (233, 'South Cyprus');
INSERT INTO country (id, name) VALUES (87, 'Guinea-Bissau');
INSERT INTO country (id, name) VALUES (102, 'Israel');
INSERT INTO country (id, name) VALUES (142, 'Mozambique');
INSERT INTO country (id, name) VALUES (2, 'Albania');
INSERT INTO country (id, name) VALUES (88, 'Guyana');
INSERT INTO country (id, name) VALUES (188, 'Solomon Isl.');
INSERT INTO country (id, name) VALUES (6, 'Angola');
INSERT INTO country (id, name) VALUES (130, 'Marshall Isl.');
INSERT INTO country (id, name) VALUES (109, 'Jordan');
INSERT INTO country (id, name) VALUES (200, 'Taiwan');
INSERT INTO country (id, name) VALUES (114, 'Kiribati');
INSERT INTO country (id, name) VALUES (159, 'Pakistan');
INSERT INTO country (id, name) VALUES (21, 'Benin');
INSERT INTO country (id, name) VALUES (37, 'China');
INSERT INTO country (id, name) VALUES (29, 'Cambodia');
INSERT INTO country (id, name) VALUES (41, 'Colombia');
INSERT INTO country (id, name) VALUES (77, 'Germany');
INSERT INTO country (id, name) VALUES (173, 'Romania');
INSERT INTO country (id, name) VALUES (117, 'Kuwait');
INSERT INTO country (id, name) VALUES (182, 'Saudi Arabia');
INSERT INTO country (id, name) VALUES (51, 'Cyprus');
INSERT INTO country (id, name) VALUES (181, 'Sao Tome & Principe');
INSERT INTO country (id, name) VALUES (63, 'Estonia');
INSERT INTO country (id, name) VALUES (93, 'Honduras');
INSERT INTO country (id, name) VALUES (100, 'Ireland');
INSERT INTO country (id, name) VALUES (223, 'Venezuela');
INSERT INTO country (id, name) VALUES (127, 'Malaysia');
INSERT INTO country (id, name) VALUES (180, 'Samoa');
INSERT INTO country (id, name) VALUES (82, 'Grenada');
INSERT INTO country (id, name) VALUES (239, 'St Barthelemy (France)');
INSERT INTO country (id, name) VALUES (36, 'Chile');
INSERT INTO country (id, name) VALUES (195, 'Sudan');
INSERT INTO country (id, name) VALUES (190, 'South Africa');
INSERT INTO country (id, name) VALUES (69, 'France');
INSERT INTO country (id, name) VALUES (18, 'Barbados');
INSERT INTO country (id, name) VALUES (64, 'Ethiopia');
INSERT INTO country (id, name) VALUES (115, 'Korea (North)');
INSERT INTO country (id, name) VALUES (184, 'Seychelles');
INSERT INTO country (id, name) VALUES (27, 'Brunei Darussalam');
INSERT INTO country (id, name) VALUES (153, 'Nigeria');
INSERT INTO country (id, name) VALUES (192, 'Spain');
INSERT INTO country (id, name) VALUES (240, 'St Martin');
INSERT INTO country (id, name) VALUES (211, 'Tunisia');
INSERT INTO country (id, name) VALUES (14, 'Bahamas');
INSERT INTO country (id, name) VALUES (17, 'Bangladesh');
INSERT INTO country (id, name) VALUES (215, 'Ukraine');
INSERT INTO country (id, name) VALUES (231, 'Montenegro');
INSERT INTO country (id, name) VALUES (9, 'Argentina');
INSERT INTO country (id, name) VALUES (99, 'Iraq');
INSERT INTO country (id, name) VALUES (199, 'Syrian Arab Republic');
INSERT INTO country (id, name) VALUES (116, 'Korea (South)');
INSERT INTO country (id, name) VALUES (216, 'United Arab Emirates');
INSERT INTO country (id, name) VALUES (111, 'Kenya');
INSERT INTO country (id, name) VALUES (187, 'Slovenia');
INSERT INTO country (id, name) VALUES (135, 'Mexico');
INSERT INTO country (id, name) VALUES (72, 'Gabon');
INSERT INTO country (id, name) VALUES (119, 'Lebanon');
INSERT INTO country (id, name) VALUES (48, 'Croatia');
INSERT INTO country (id, name) VALUES (20, 'Belize');
INSERT INTO country (id, name) VALUES (232, 'North Cyprus');
INSERT INTO country (id, name) VALUES (202, 'Thailand');
INSERT INTO country (id, name) VALUES (151, 'New Zealand');
INSERT INTO country (id, name) VALUES (129, 'Malta');
INSERT INTO country (id, name) VALUES (146, 'Nauru');
INSERT INTO country (id, name) VALUES (59, 'Egypt');
INSERT INTO country (id, name) VALUES (132, 'Mauritania');
INSERT INTO country (id, name) VALUES (141, 'Morocco');
INSERT INTO country (id, name) VALUES (46, 'Costa Rica');
INSERT INTO country (id, name) VALUES (62, 'Eritrea');
INSERT INTO country (id, name) VALUES (133, 'Mauritius');
INSERT INTO country (id, name) VALUES (75, 'Gaza Strip');
INSERT INTO country (id, name) VALUES (33, 'Cape Verde');
INSERT INTO country (id, name) VALUES (28, 'Bulgaria');


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 201
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('country_id_seq', 1, false);


--
-- TOC entry 3102 (class 0 OID 17425)
-- Dependencies: 194
-- Data for Name: data_ingest_fileupload; Type: TABLE DATA; Schema: public; Owner: recon
--

INSERT INTO data_ingest_fileupload (id, file, create_datetime, user_id) VALUES (1, 'recon_data_upload_test_2.xlsx', '2015-04-03 17:01:19.222792+00', 1);
INSERT INTO data_ingest_fileupload (id, file, create_datetime, user_id) VALUES (2, 'recon_data_upload_test.xlsx', '2015-04-03 17:03:19.077937+00', 1);
INSERT INTO data_ingest_fileupload (id, file, create_datetime, user_id) VALUES (3, 'recon_data_upload_test.xlsx', '2015-04-03 17:04:27.529752+00', 1);
INSERT INTO data_ingest_fileupload (id, file, create_datetime, user_id) VALUES (4, 'recon_data_upload_test.xlsx', '2015-04-03 17:05:24.860061+00', 1);
INSERT INTO data_ingest_fileupload (id, file, create_datetime, user_id) VALUES (5, 'recon_files/20150403/recon_data_upload_test_6erYyIk.xlsx', '2015-04-03 17:05:25.406116+00', NULL);
INSERT INTO data_ingest_fileupload (id, file, create_datetime, user_id) VALUES (6, 'recon_data_upload_test_2.xlsx', '2015-04-03 17:05:47.213296+00', 1);
INSERT INTO data_ingest_fileupload (id, file, create_datetime, user_id) VALUES (7, 'recon_files/20150403/recon_data_upload_test_2_ablUrKS.xlsx', '2015-04-03 17:05:48.177991+00', NULL);
INSERT INTO data_ingest_fileupload (id, file, create_datetime, user_id) VALUES (8, 'recon_data_upload_test_2_errors.xlsx', '2015-04-03 17:43:28.006455+00', 1);
INSERT INTO data_ingest_fileupload (id, file, create_datetime, user_id) VALUES (9, 'recon_files/20150403/recon_data_upload_test_2_errors.xlsx', '2015-04-03 17:43:29.15257+00', NULL);


--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 193
-- Name: data_ingest_fileupload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('data_ingest_fileupload_id_seq', 9, true);


--
-- TOC entry 3104 (class 0 OID 17433)
-- Dependencies: 196
-- Data for Name: data_ingest_rawcatch; Type: TABLE DATA; Schema: public; Owner: recon
--

INSERT INTO data_ingest_rawcatch (id, fishing_entity, fishing_entity_id, original_country_fishing, eez_area, eez_id, eez_sub_area, fao_area, sub_regional_area, province_state, ices_division, ices_subdivision, nafo_division, ccamlr_area, layer, year, amount, adjustment_factor, gear_type, gear_type_id, taxon_name, taxon_key, original_fao_name, sector, original_sector, sector_id, catch_type, catch_type_id, input_type, reference_id, forward_carry_rule, notes, source_file_id, user_id) VALUES (11, 'Iran', 98, '', 'Iran', 364, 'Persian Gulf', '51', '', '', '', '', '', '', 0, 1997, 445.538825280668, '', '', 0, 'Silver pomfret', 600491, 'Marine fishes nei', 'Artisanal', '', 0, 'Reported landings', 0, 'FAO', 99, '', '', 8, 1);
INSERT INTO data_ingest_rawcatch (id, fishing_entity, fishing_entity_id, original_country_fishing, eez_area, eez_id, eez_sub_area, fao_area, sub_regional_area, province_state, ices_division, ices_subdivision, nafo_division, ccamlr_area, layer, year, amount, adjustment_factor, gear_type, gear_type_id, taxon_name, taxon_key, original_fao_name, sector, original_sector, sector_id, catch_type, catch_type_id, input_type, reference_id, forward_carry_rule, notes, source_file_id, user_id) VALUES (12, 'Iran', 98, '', 'Iran', 364, 'Sistan & Baluchestan', '51', '', '', '', '', '', '', 0, 1997, 103.236944023808, '', '', 0, 'Silver pomfret', 600491, 'Marine fishes nei', 'Artisanal', '', 0, 'Reported landings', 0, 'FAO', 99, '', '', 8, 1);
INSERT INTO data_ingest_rawcatch (id, fishing_entity, fishing_entity_id, original_country_fishing, eez_area, eez_id, eez_sub_area, fao_area, sub_regional_area, province_state, ices_division, ices_subdivision, nafo_division, ccamlr_area, layer, year, amount, adjustment_factor, gear_type, gear_type_id, taxon_name, taxon_key, original_fao_name, sector, original_sector, sector_id, catch_type, catch_type_id, input_type, reference_id, forward_carry_rule, notes, source_file_id, user_id) VALUES (13, 'Iran', 98, '', 'Iran', 364, 'Persian Gulf', '51', '', '', '', '', '', '', 0, 1997, 1959.599248456873, '', '', 0, 'Black pomfret', 601947, 'Black pomfret', 'Artisanal', '', 0, 'Reported landings', 0, 'FAO', 99, '', '', 8, 1);
INSERT INTO data_ingest_rawcatch (id, fishing_entity, fishing_entity_id, original_country_fishing, eez_area, eez_id, eez_sub_area, fao_area, sub_regional_area, province_state, ices_division, ices_subdivision, nafo_division, ccamlr_area, layer, year, amount, adjustment_factor, gear_type, gear_type_id, taxon_name, taxon_key, original_fao_name, sector, original_sector, sector_id, catch_type, catch_type_id, input_type, reference_id, forward_carry_rule, notes, source_file_id, user_id) VALUES (14, 'Iran', 98, '', 'Iran', 364, 'Sistan & Baluchestan', '51', '', '', '', '', '', '', 0, 1997, 454.063768280121, '', '', 0, 'Black pomfret', 601947, 'Black pomfret', 'Artisanal', '', 0, 'Reported landings', 0, 'FAO', 99, '', '', 8, 1);
INSERT INTO data_ingest_rawcatch (id, fishing_entity, fishing_entity_id, original_country_fishing, eez_area, eez_id, eez_sub_area, fao_area, sub_regional_area, province_state, ices_division, ices_subdivision, nafo_division, ccamlr_area, layer, year, amount, adjustment_factor, gear_type, gear_type_id, taxon_name, taxon_key, original_fao_name, sector, original_sector, sector_id, catch_type, catch_type_id, input_type, reference_id, forward_carry_rule, notes, source_file_id, user_id) VALUES (15, 'Iran', 98, '', 'Irran', 0, 'Persian Gulf', '51', '', '', '', '', '', '', 0, 1997, 348.266208449029, '', '', 0, 'Black pomfret', 601947, 'Marine fishes nei', 'Artisanal', '', 0, 'Reported landings', 0, 'FAO', 99, '', '', 8, 1);
INSERT INTO data_ingest_rawcatch (id, fishing_entity, fishing_entity_id, original_country_fishing, eez_area, eez_id, eez_sub_area, fao_area, sub_regional_area, province_state, ices_division, ices_subdivision, nafo_division, ccamlr_area, layer, year, amount, adjustment_factor, gear_type, gear_type_id, taxon_name, taxon_key, original_fao_name, sector, original_sector, sector_id, catch_type, catch_type_id, input_type, reference_id, forward_carry_rule, notes, source_file_id, user_id) VALUES (16, 'Iranian', 0, '', 'Iran', 364, 'Sistan & Baluchestan', '51', '', '', '', '', '', '', 0, 1997, 80.697656471099, '', '', 0, 'Black pomfret', 601947, 'Marine fishes nei', 'Artisanal', '', 0, 'Reported landings', 0, 'FAO', 99, '', '', 8, 1);
INSERT INTO data_ingest_rawcatch (id, fishing_entity, fishing_entity_id, original_country_fishing, eez_area, eez_id, eez_sub_area, fao_area, sub_regional_area, province_state, ices_division, ices_subdivision, nafo_division, ccamlr_area, layer, year, amount, adjustment_factor, gear_type, gear_type_id, taxon_name, taxon_key, original_fao_name, sector, original_sector, sector_id, catch_type, catch_type_id, input_type, reference_id, forward_carry_rule, notes, source_file_id, user_id) VALUES (17, 'Iran', 98, '', 'Iran', 364, 'Persian Gulf', '51', '', '', '', '', '', '', 0, 1997, 5916.064292092460, '', '', 0, 'Penaeid shrimps', 490043, 'Natantian decapods nei', 'Artisanal', '', 0, 'Reported landings', 0, 'FAO', 99, '', '', 8, 1);
INSERT INTO data_ingest_rawcatch (id, fishing_entity, fishing_entity_id, original_country_fishing, eez_area, eez_id, eez_sub_area, fao_area, sub_regional_area, province_state, ices_division, ices_subdivision, nafo_division, ccamlr_area, layer, year, amount, adjustment_factor, gear_type, gear_type_id, taxon_name, taxon_key, original_fao_name, sector, original_sector, sector_id, catch_type, catch_type_id, input_type, reference_id, forward_carry_rule, notes, source_file_id, user_id) VALUES (18, 'Iran', 98, '', 'Iran', 364, 'Sistan & Baluchestan', '51', '', '', '', '', '', '', 0, 1997, 1370.826431970889, '', '', 0, 'Penaeid shrimp', 0, 'Natantian decapods nei', 'Artisanal', '', 0, 'Reported landings', 0, 'FAO', 99, '', '', 8, 1);


--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 195
-- Name: data_ingest_rawcatch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('data_ingest_rawcatch_id_seq', 18, true);


--
-- TOC entry 3094 (class 0 OID 17056)
-- Dependencies: 185
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: recon
--



--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 186
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- TOC entry 3096 (class 0 OID 17065)
-- Dependencies: 187
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: recon
--

INSERT INTO django_content_type (id, name, app_label, model) VALUES (1, 'log entry', 'admin', 'logentry');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (2, 'permission', 'auth', 'permission');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (3, 'group', 'auth', 'group');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (4, 'user', 'auth', 'user');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (5, 'content type', 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (6, 'session', 'sessions', 'session');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (7, 'country', 'catch', 'country');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (8, 'eez', 'catch', 'eez');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (9, 'taxon', 'catch', 'taxon');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (10, 'sector', 'catch', 'sector');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (11, 'catch type', 'catch', 'catchtype');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (12, 'catch', 'catch', 'catch');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (13, 'file upload', 'ingest', 'fileupload');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (14, 'raw catch', 'ingest', 'rawcatch');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (15, 'reference', 'catch', 'reference');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (16, 'file upload', 'data_ingest', 'fileupload');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (17, 'raw catch', 'data_ingest', 'rawcatch');


--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 188
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


--
-- TOC entry 3098 (class 0 OID 17070)
-- Dependencies: 189
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: recon
--

INSERT INTO django_migrations (id, app, name, applied) VALUES (32, 'contenttypes', '0001_initial', '2015-04-03 16:28:53.624916+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (33, 'auth', '0001_initial', '2015-04-03 16:28:53.702916+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (34, 'admin', '0001_initial', '2015-04-03 16:28:53.780917+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (35, 'data_ingest', '0001_initial', '2015-04-03 16:28:54.155319+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (36, 'catch', '0001_initial', '2015-04-03 16:28:55.481328+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (37, 'sessions', '0001_initial', '2015-04-03 16:28:55.543728+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (38, 'catch', '0002_auto_20150403_0935', '2015-04-03 16:36:01.760236+00');


--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 190
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('django_migrations_id_seq', 38, true);


--
-- TOC entry 3100 (class 0 OID 17078)
-- Dependencies: 191
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: recon
--

INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('p4gl24wjxfg6r7upp36f2g41hktk9mrq', 'NGJlOGQ2Y2NkY2JhYzRmNTNiYmVmZTVkNmRmYmM2ZDUzOTI3Y2ZkZjp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6IjNjNmYwYTcyYTYyMzkxZmYxZDA5ZmFmMzg2OTc3ZGY0MTIzZTY2ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2015-01-28 16:55:17.795887+00');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('24bsxbmt53k936bsnoxbkplf15x8i8wx', 'NGJkMzU1ZGVkMDZiOWE1MjNkZDIxNWE3OWQ2NGRmNGU3NmFkZjM5Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9oYXNoIjoiM2M2ZjBhNzJhNjIzOTFmZjFkMDlmYWYzODY5NzdkZjQxMjNlNjZlOCJ9', '2015-01-29 20:52:18.468843+00');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('jsxwsc64teumi9ymjnouqavhhlxbotkj', 'NmE5ZmRiMzU3NmQzZjRmNjhmMmNlY2I3MzI0YjRiNmU0YmJmMTQ3Yzp7fQ==', '2015-02-15 03:18:29.025971+00');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('p2bkn14zkh8h6eg5bbgpng28yk8lmni0', 'NmE5ZmRiMzU3NmQzZjRmNjhmMmNlY2I3MzI0YjRiNmU0YmJmMTQ3Yzp7fQ==', '2015-02-15 03:18:35.945971+00');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('1p5wex44mdktbfgflwwqktugp6ax3dd9', 'NGJlOGQ2Y2NkY2JhYzRmNTNiYmVmZTVkNmRmYmM2ZDUzOTI3Y2ZkZjp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6IjNjNmYwYTcyYTYyMzkxZmYxZDA5ZmFmMzg2OTc3ZGY0MTIzZTY2ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2015-02-16 18:10:50.987267+00');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('h0bjapyh2hjjr8kb62btvnzce7z60gto', 'MzNkMWIyMjg5Y2FiNmExOTM2MmUwMjg5YTgyYzliM2FkMTQ0YTk2ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTVlOWIwYTNjNzc2N2IyYTdhMDNkODUzMGQyYTJkMGQ1MzZhZjY5OCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2015-04-17 15:29:41.321607+00');


--
-- TOC entry 3112 (class 0 OID 17489)
-- Dependencies: 204
-- Data for Name: eez; Type: TABLE DATA; Schema: public; Owner: recon
--

INSERT INTO eez (id, name, country_id) VALUES (711, 'Prince Edward Isl. (South Africa)', 190);
INSERT INTO eez (id, name, country_id) VALUES (780, 'Trinidad & Tobago', 208);
INSERT INTO eez (id, name, country_id) VALUES (784, 'United Arab Emirates', 216);
INSERT INTO eez (id, name, country_id) VALUES (895, 'St Paul & Amsterdam Isl. (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (768, 'Togo', 204);
INSERT INTO eez (id, name, country_id) VALUES (258, 'French Polynesia', 69);
INSERT INTO eez (id, name, country_id) VALUES (736, 'Sudan', 195);
INSERT INTO eez (id, name, country_id) VALUES (410, 'Korea (South)', 116);
INSERT INTO eez (id, name, country_id) VALUES (384, 'Côte d''Ivoire', 47);
INSERT INTO eez (id, name, country_id) VALUES (393, 'Japan (outer islands)', 106);
INSERT INTO eez (id, name, country_id) VALUES (650, 'Russia (Siberia)', 174);
INSERT INTO eez (id, name, country_id) VALUES (292, 'Gibraltar (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (70, 'Bosnia & Herzegovina', 23);
INSERT INTO eez (id, name, country_id) VALUES (796, 'Turks & Caicos Isl. (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (440, 'Lithuania', 122);
INSERT INTO eez (id, name, country_id) VALUES (278, 'Germany (Baltic Sea)', 77);
INSERT INTO eez (id, name, country_id) VALUES (760, 'Syria', 199);
INSERT INTO eez (id, name, country_id) VALUES (764, 'Thailand', 202);
INSERT INTO eez (id, name, country_id) VALUES (851, 'United States, East Coast', 221);
INSERT INTO eez (id, name, country_id) VALUES (344, 'Hong Kong', 37);
INSERT INTO eez (id, name, country_id) VALUES (84, 'Belize', 20);
INSERT INTO eez (id, name, country_id) VALUES (197, 'Cyprus (North)', 51);
INSERT INTO eez (id, name, country_id) VALUES (154, 'Desventuradas Isl. (Chile)', 36);
INSERT INTO eez (id, name, country_id) VALUES (288, 'Ghana', 78);
INSERT INTO eez (id, name, country_id) VALUES (740, 'Suriname', 196);
INSERT INTO eez (id, name, country_id) VALUES (274, 'Gaza Strip', 75);
INSERT INTO eez (id, name, country_id) VALUES (644, 'Russian Fed (Asia)', 174);
INSERT INTO eez (id, name, country_id) VALUES (710, 'South Africa', 190);
INSERT INTO eez (id, name, country_id) VALUES (583, 'Micronesia', 136);
INSERT INTO eez (id, name, country_id) VALUES (616, 'Poland', 167);
INSERT INTO eez (id, name, country_id) VALUES (654, 'Saint Helena (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (683, 'Saudi Arabia (Red Sea)', 182);
INSERT INTO eez (id, name, country_id) VALUES (428, 'Latvia', 118);
INSERT INTO eez (id, name, country_id) VALUES (191, 'Croatia', 48);
INSERT INTO eez (id, name, country_id) VALUES (724, 'Spain', 192);
INSERT INTO eez (id, name, country_id) VALUES (92, 'British Virgin Isl. (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (270, 'Gambia', 74);
INSERT INTO eez (id, name, country_id) VALUES (368, 'Iraq', 99);
INSERT INTO eez (id, name, country_id) VALUES (152, 'Chile', 36);
INSERT INTO eez (id, name, country_id) VALUES (826, 'United Kingdom', 217);
INSERT INTO eez (id, name, country_id) VALUES (450, 'Madagascar', 125);
INSERT INTO eez (id, name, country_id) VALUES (847, 'United States, East Coast and Gulf of Mexico', 221);
INSERT INTO eez (id, name, country_id) VALUES (678, 'Sao Tome & Principe', 181);
INSERT INTO eez (id, name, country_id) VALUES (144, 'Sri Lanka', 193);
INSERT INTO eez (id, name, country_id) VALUES (772, 'Tokelau (New Zealand)', 151);
INSERT INTO eez (id, name, country_id) VALUES (684, 'Saudi Arabia (Persian Gulf)', 182);
INSERT INTO eez (id, name, country_id) VALUES (266, 'Gabon', 72);
INSERT INTO eez (id, name, country_id) VALUES (77, 'Trindade & Martim Vaz Isl. (Brazil)', 25);
INSERT INTO eez (id, name, country_id) VALUES (219, 'Galapagos Isl. (Ecuador)', 58);
INSERT INTO eez (id, name, country_id) VALUES (180, 'Congo (ex-Zaire)', 43);
INSERT INTO eez (id, name, country_id) VALUES (574, 'Norfolk Isl. (Australia)', 12);
INSERT INTO eez (id, name, country_id) VALUES (226, 'Equatorial Guinea', 61);
INSERT INTO eez (id, name, country_id) VALUES (705, 'Slovenia', 187);
INSERT INTO eez (id, name, country_id) VALUES (192, 'Cuba', 50);
INSERT INTO eez (id, name, country_id) VALUES (132, 'Cape Verde', 33);
INSERT INTO eez (id, name, country_id) VALUES (37, 'Macquarie Isl. (Australia)', 12);
INSERT INTO eez (id, name, country_id) VALUES (48, 'Bahrain', 15);
INSERT INTO eez (id, name, country_id) VALUES (90, 'Solomon Isl.', 188);
INSERT INTO eez (id, name, country_id) VALUES (16, 'American Samoa', 221);
INSERT INTO eez (id, name, country_id) VALUES (362, 'Indonesia (Western)', 97);
INSERT INTO eez (id, name, country_id) VALUES (706, 'Somalia', 189);
INSERT INTO eez (id, name, country_id) VALUES (32, 'Argentina', 9);
INSERT INTO eez (id, name, country_id) VALUES (100, 'Bulgaria', 28);
INSERT INTO eez (id, name, country_id) VALUES (12, 'Algeria', 3);
INSERT INTO eez (id, name, country_id) VALUES (296, 'Kiribati', 114);
INSERT INTO eez (id, name, country_id) VALUES (570, 'Niue (New Zealand)', 151);
INSERT INTO eez (id, name, country_id) VALUES (798, 'Tuvalu', 214);
INSERT INTO eez (id, name, country_id) VALUES (96, 'Brunei Darussalam', 27);
INSERT INTO eez (id, name, country_id) VALUES (558, 'Nicaragua', 152);
INSERT INTO eez (id, name, country_id) VALUES (694, 'Sierra Leone', 185);
INSERT INTO eez (id, name, country_id) VALUES (396, 'Johnston Atoll (USA)', 221);
INSERT INTO eez (id, name, country_id) VALUES (845, 'Jarvis Isl. (USA)', 221);
INSERT INTO eez (id, name, country_id) VALUES (533, 'Leeward Netherlands Antilles', 148);
INSERT INTO eez (id, name, country_id) VALUES (434, 'Libya', 121);
INSERT INTO eez (id, name, country_id) VALUES (732, 'Western Sahara (Morocco)', 141);
INSERT INTO eez (id, name, country_id) VALUES (843, 'Navassa Isl. (Haiti)', 221);
INSERT INTO eez (id, name, country_id) VALUES (776, 'Tonga', 206);
INSERT INTO eez (id, name, country_id) VALUES (422, 'Lebanon', 119);
INSERT INTO eez (id, name, country_id) VALUES (902, 'Sardinia (Italy)', 103);
INSERT INTO eez (id, name, country_id) VALUES (852, 'United States, Gulf of Mexico', 221);
INSERT INTO eez (id, name, country_id) VALUES (50, 'Bangladesh', 17);
INSERT INTO eez (id, name, country_id) VALUES (516, 'Namibia', 145);
INSERT INTO eez (id, name, country_id) VALUES (566, 'Nigeria', 153);
INSERT INTO eez (id, name, country_id) VALUES (364, 'Iran', 98);
INSERT INTO eez (id, name, country_id) VALUES (608, 'Philippines', 165);
INSERT INTO eez (id, name, country_id) VALUES (86, 'Chagos Archipel., Brit. Ind. Oc. Terr. (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (400, 'Jordan', 109);
INSERT INTO eez (id, name, country_id) VALUES (504, 'Morocco', 141);
INSERT INTO eez (id, name, country_id) VALUES (372, 'Ireland', 100);
INSERT INTO eez (id, name, country_id) VALUES (844, 'Palmyra Atoll & Kingman Reef (USA)', 221);
INSERT INTO eez (id, name, country_id) VALUES (153, 'Easter Isl. (Chile)', 36);
INSERT INTO eez (id, name, country_id) VALUES (124, 'Canada', 31);
INSERT INTO eez (id, name, country_id) VALUES (670, 'Saint Vincent & the Grenadines', 179);
INSERT INTO eez (id, name, country_id) VALUES (74, 'Bouvet Isl. (Norway)', 157);
INSERT INTO eez (id, name, country_id) VALUES (352, 'Iceland', 95);
INSERT INTO eez (id, name, country_id) VALUES (332, 'Haiti', 89);
INSERT INTO eez (id, name, country_id) VALUES (876, 'Wallis & Futuna Isl. (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (316, 'Guam (USA)', 221);
INSERT INTO eez (id, name, country_id) VALUES (900, 'Crete (Greece)', 80);
INSERT INTO eez (id, name, country_id) VALUES (104, 'Myanmar', 144);
INSERT INTO eez (id, name, country_id) VALUES (540, 'New Caledonia (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (896, 'Crozet Isl. (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (304, 'Greenland', 52);
INSERT INTO eez (id, name, country_id) VALUES (899, 'Corsica (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (788, 'Tunisia', 211);
INSERT INTO eez (id, name, country_id) VALUES (480, 'Mauritius', 133);
INSERT INTO eez (id, name, country_id) VALUES (492, 'Monaco', 138);
INSERT INTO eez (id, name, country_id) VALUES (76, 'Brazil', 25);
INSERT INTO eez (id, name, country_id) VALUES (548, 'Vanuatu', 222);
INSERT INTO eez (id, name, country_id) VALUES (8, 'Albania', 2);
INSERT INTO eez (id, name, country_id) VALUES (155, 'J. Fernandez, Felix and Ambrosio Isl. (Chile)', 36);
INSERT INTO eez (id, name, country_id) VALUES (414, 'Kuwait', 117);
INSERT INTO eez (id, name, country_id) VALUES (162, 'Christmas Isl. (Australia)', 12);
INSERT INTO eez (id, name, country_id) VALUES (898, 'Clipperton Isl.  (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (645, 'Russia (Barents Sea)', 174);
INSERT INTO eez (id, name, country_id) VALUES (204, 'Benin', 21);
INSERT INTO eez (id, name, country_id) VALUES (252, 'Tromelin Isl. (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (276, 'Germany', 77);
INSERT INTO eez (id, name, country_id) VALUES (324, 'Guinea', 86);
INSERT INTO eez (id, name, country_id) VALUES (312, 'Guadeloupe  (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (463, 'Malaysia (Sarawak)', 127);
INSERT INTO eez (id, name, country_id) VALUES (36, 'Australia', 12);
INSERT INTO eez (id, name, country_id) VALUES (334, 'Heard & McDonald Isl. (Australia)', 12);
INSERT INTO eez (id, name, country_id) VALUES (850, 'US Virgin Isl.', 221);
INSERT INTO eez (id, name, country_id) VALUES (166, 'Cocos (Keeling) Isl. (Australia)', 12);
INSERT INTO eez (id, name, country_id) VALUES (178, 'Congo, R. of', 44);
INSERT INTO eez (id, name, country_id) VALUES (250, 'France', 69);
INSERT INTO eez (id, name, country_id) VALUES (520, 'Nauru', 146);
INSERT INTO eez (id, name, country_id) VALUES (376, 'Israel', 102);
INSERT INTO eez (id, name, country_id) VALUES (744, 'Svalbard Isl. (Norway)', 157);
INSERT INTO eez (id, name, country_id) VALUES (856, 'Tristan da Cunha Isl. (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (188, 'Costa Rica', 46);
INSERT INTO eez (id, name, country_id) VALUES (277, 'Germany (North Sea)', 77);
INSERT INTO eez (id, name, country_id) VALUES (116, 'Cambodia', 29);
INSERT INTO eez (id, name, country_id) VALUES (174, 'Comoros Isl.', 42);
INSERT INTO eez (id, name, country_id) VALUES (239, 'South Georgia & Sandwich Isl. (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (488, 'Hawaii Northwest Islands (USA)', 221);
INSERT INTO eez (id, name, country_id) VALUES (686, 'Senegal', 183);
INSERT INTO eez (id, name, country_id) VALUES (170, 'Colombia', 41);
INSERT INTO eez (id, name, country_id) VALUES (666, 'Saint Pierre & Miquelon (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (28, 'Antigua & Barbuda', 8);
INSERT INTO eez (id, name, country_id) VALUES (242, 'Fiji', 67);
INSERT INTO eez (id, name, country_id) VALUES (56, 'Belgium', 19);
INSERT INTO eez (id, name, country_id) VALUES (218, 'Ecuador', 58);
INSERT INTO eez (id, name, country_id) VALUES (300, 'Greece', 80);
INSERT INTO eez (id, name, country_id) VALUES (690, 'Seychelles', 184);
INSERT INTO eez (id, name, country_id) VALUES (794, 'Turkey (Black Sea)', 212);
INSERT INTO eez (id, name, country_id) VALUES (620, 'Portugal', 168);
INSERT INTO eez (id, name, country_id) VALUES (897, 'Kerguelen Isl. (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (157, 'Taiwan', 200);
INSERT INTO eez (id, name, country_id) VALUES (184, 'Cook Islands', 151);
INSERT INTO eez (id, name, country_id) VALUES (208, 'Denmark', 52);
INSERT INTO eez (id, name, country_id) VALUES (512, 'Oman', 158);
INSERT INTO eez (id, name, country_id) VALUES (320, 'Guatemala', 85);
INSERT INTO eez (id, name, country_id) VALUES (586, 'Pakistan', 159);
INSERT INTO eez (id, name, country_id) VALUES (626, 'Timor Leste', 203);
INSERT INTO eez (id, name, country_id) VALUES (634, 'Qatar', 171);
INSERT INTO eez (id, name, country_id) VALUES (308, 'Grenada', 82);
INSERT INTO eez (id, name, country_id) VALUES (622, 'Azores Isl. (Portugal)', 168);
INSERT INTO eez (id, name, country_id) VALUES (662, 'Saint Lucia', 177);
INSERT INTO eez (id, name, country_id) VALUES (858, 'Uruguay', 218);
INSERT INTO eez (id, name, country_id) VALUES (44, 'Bahamas', 14);
INSERT INTO eez (id, name, country_id) VALUES (905, 'St Martin (France)', 240);
INSERT INTO eez (id, name, country_id) VALUES (647, 'Russia (Black Sea)', 174);
INSERT INTO eez (id, name, country_id) VALUES (380, 'Italy', 103);
INSERT INTO eez (id, name, country_id) VALUES (459, 'Malaysia (Peninsula West)', 127);
INSERT INTO eez (id, name, country_id) VALUES (591, 'Panama', 162);
INSERT INTO eez (id, name, country_id) VALUES (508, 'Mozambique', 142);
INSERT INTO eez (id, name, country_id) VALUES (882, 'Samoa', 180);
INSERT INTO eez (id, name, country_id) VALUES (196, 'Cyprus', 51);
INSERT INTO eez (id, name, country_id) VALUES (212, 'Dominica', 55);
INSERT INTO eez (id, name, country_id) VALUES (246, 'Finland', 68);
INSERT INTO eez (id, name, country_id) VALUES (891, 'Montenegro', 139);
INSERT INTO eez (id, name, country_id) VALUES (834, 'Tanzania', 201);
INSERT INTO eez (id, name, country_id) VALUES (500, 'Montserrat (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (38, 'Lord Howe Isl. (Australia)', 12);
INSERT INTO eez (id, name, country_id) VALUES (702, 'Singapore', 186);
INSERT INTO eez (id, name, country_id) VALUES (356, 'India (mainland)', 96);
INSERT INTO eez (id, name, country_id) VALUES (120, 'Cameroon', 30);
INSERT INTO eez (id, name, country_id) VALUES (360, 'Indonesia', 97);
INSERT INTO eez (id, name, country_id) VALUES (390, 'Japan (main islands)', 106);
INSERT INTO eez (id, name, country_id) VALUES (175, 'Mayotte (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (340, 'Honduras', 93);
INSERT INTO eez (id, name, country_id) VALUES (887, 'Yemen', 229);
INSERT INTO eez (id, name, country_id) VALUES (604, 'Peru', 164);
INSERT INTO eez (id, name, country_id) VALUES (642, 'Romania', 173);
INSERT INTO eez (id, name, country_id) VALUES (430, 'Liberia', 120);
INSERT INTO eez (id, name, country_id) VALUES (621, 'Madeira Isl. (Portugal)', 168);
INSERT INTO eez (id, name, country_id) VALUES (872, 'Wake Isl. (USA)', 221);
INSERT INTO eez (id, name, country_id) VALUES (251, 'Mozambique Channel Isl. (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (904, 'St Barthelemy (France)', 239);
INSERT INTO eez (id, name, country_id) VALUES (233, 'Estonia', 63);
INSERT INTO eez (id, name, country_id) VALUES (723, 'Canary Isl. (Spain)', 192);
INSERT INTO eez (id, name, country_id) VALUES (238, 'Falkland Isl. (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (328, 'Guyana', 88);
INSERT INTO eez (id, name, country_id) VALUES (660, 'Anguilla (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (579, 'Jan Mayen Isl. (Norway)', 157);
INSERT INTO eez (id, name, country_id) VALUES (254, 'French Guiana', 69);
INSERT INTO eez (id, name, country_id) VALUES (659, 'Saint Kitts & Nevis', 176);
INSERT INTO eez (id, name, country_id) VALUES (862, 'Venezuela', 223);
INSERT INTO eez (id, name, country_id) VALUES (793, 'Turkey (Mediterranean Sea)', 212);
INSERT INTO eez (id, name, country_id) VALUES (841, 'Alaska (USA)', 221);
INSERT INTO eez (id, name, country_id) VALUES (60, 'Bermuda (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (818, 'Egypt', 59);
INSERT INTO eez (id, name, country_id) VALUES (156, 'China', 37);
INSERT INTO eez (id, name, country_id) VALUES (555, 'Kermadec Isl. (New Zealand)', 151);
INSERT INTO eez (id, name, country_id) VALUES (842, 'Hawaii Main Islands (USA)', 221);
INSERT INTO eez (id, name, country_id) VALUES (136, 'Cayman Isl. (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (651, 'Russia (Baltic Sea, St. Petersburg)', 174);
INSERT INTO eez (id, name, country_id) VALUES (804, 'Ukraine', 215);
INSERT INTO eez (id, name, country_id) VALUES (638, 'Réunion (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (361, 'Indonesia (Eastern)', 97);
INSERT INTO eez (id, name, country_id) VALUES (532, 'Windward Netherlands Antilles', 148);
INSERT INTO eez (id, name, country_id) VALUES (648, 'Russia (Baltic Sea, Kaliningrad)', 174);
INSERT INTO eez (id, name, country_id) VALUES (357, 'Andaman & Nicobar Isl. (India)', 96);
INSERT INTO eez (id, name, country_id) VALUES (222, 'El Salvador', 60);
INSERT INTO eez (id, name, country_id) VALUES (752, 'Sweden', 198);
INSERT INTO eez (id, name, country_id) VALUES (901, 'Sicily (Italy)', 103);
INSERT INTO eez (id, name, country_id) VALUES (580, 'Northern Marianas (USA)', 221);
INSERT INTO eez (id, name, country_id) VALUES (848, 'United States, West Coast', 221);
INSERT INTO eez (id, name, country_id) VALUES (460, 'Malaysia (Peninsula East)', 127);
INSERT INTO eez (id, name, country_id) VALUES (855, 'Ascension Isl. (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (846, 'Howland & Baker Isl. (USA)', 221);
INSERT INTO eez (id, name, country_id) VALUES (554, 'New Zealand', 151);
INSERT INTO eez (id, name, country_id) VALUES (214, 'Dominican Republic', 56);
INSERT INTO eez (id, name, country_id) VALUES (404, 'Kenya', 111);
INSERT INTO eez (id, name, country_id) VALUES (624, 'Guinea-Bissau', 87);
INSERT INTO eez (id, name, country_id) VALUES (470, 'Malta', 129);
INSERT INTO eez (id, name, country_id) VALUES (446, 'Macau (China)', 37);
INSERT INTO eez (id, name, country_id) VALUES (649, 'Russia (Pacific)', 174);
INSERT INTO eez (id, name, country_id) VALUES (198, 'Cyprus (South)', 51);
INSERT INTO eez (id, name, country_id) VALUES (903, 'Balearic Island (Spain)', 192);
INSERT INTO eez (id, name, country_id) VALUES (484, 'Mexico', 135);
INSERT INTO eez (id, name, country_id) VALUES (598, 'Papua New Guinea', 163);
INSERT INTO eez (id, name, country_id) VALUES (111, 'Eritrea', 62);
INSERT INTO eez (id, name, country_id) VALUES (528, 'Netherlands', 148);
INSERT INTO eez (id, name, country_id) VALUES (578, 'Norway', 157);
INSERT INTO eez (id, name, country_id) VALUES (392, 'Japan (main islands)', 106);
INSERT INTO eez (id, name, country_id) VALUES (52, 'Barbados', 18);
INSERT INTO eez (id, name, country_id) VALUES (584, 'Marshall Isl.', 130);
INSERT INTO eez (id, name, country_id) VALUES (585, 'Palau', 160);
INSERT INTO eez (id, name, country_id) VALUES (268, 'Georgia', 76);
INSERT INTO eez (id, name, country_id) VALUES (262, 'Djibouti', 54);
INSERT INTO eez (id, name, country_id) VALUES (630, 'Puerto Rico (USA)', 221);
INSERT INTO eez (id, name, country_id) VALUES (461, 'Malaysia (Sabah)', 127);
INSERT INTO eez (id, name, country_id) VALUES (478, 'Mauritania', 132);
INSERT INTO eez (id, name, country_id) VALUES (24, 'Angola', 6);
INSERT INTO eez (id, name, country_id) VALUES (388, 'Jamaica', 104);
INSERT INTO eez (id, name, country_id) VALUES (462, 'Maldives', 128);
INSERT INTO eez (id, name, country_id) VALUES (474, 'Martinique (France)', 69);
INSERT INTO eez (id, name, country_id) VALUES (612, 'Pitcairn (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (234, 'Faeroe Isl. (Denmark)', 52);
INSERT INTO eez (id, name, country_id) VALUES (830, 'Channel Isl. (UK)', 217);
INSERT INTO eez (id, name, country_id) VALUES (704, 'Viet Nam', 224);
INSERT INTO eez (id, name, country_id) VALUES (408, 'Korea (North)', 115);
INSERT INTO eez (id, name, country_id) VALUES (840, 'USA (contiguous states)', 221);


--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 203
-- Name: eez_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('eez_id_seq', 1, false);


--
-- TOC entry 3116 (class 0 OID 17505)
-- Dependencies: 208
-- Data for Name: fishing_sector; Type: TABLE DATA; Schema: public; Owner: recon
--



--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 207
-- Name: fishing_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('fishing_sector_id_seq', 1, false);


--
-- TOC entry 3106 (class 0 OID 17462)
-- Dependencies: 198
-- Data for Name: reconstructed_catch; Type: TABLE DATA; Schema: public; Owner: recon
--



--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 197
-- Name: reconstructed_catch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('reconstructed_catch_id_seq', 1, false);


--
-- TOC entry 3114 (class 0 OID 17497)
-- Dependencies: 206
-- Data for Name: reference; Type: TABLE DATA; Schema: public; Owner: recon
--



--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 205
-- Name: reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recon
--

SELECT pg_catalog.setval('reference_id_seq', 1, false);


--
-- TOC entry 3117 (class 0 OID 17511)
-- Dependencies: 209
-- Data for Name: taxon; Type: TABLE DATA; Schema: public; Owner: recon
--

INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100000, 'Marine animals', 'Marine animals');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100011, 'Carps and barbels other cyprinids', 'Carps or barbels and other cyprinids');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100021, 'Sturgeons and paddlefishes', 'Sturgeons and paddlefishes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100025, 'Diadromous fishes', 'Miscellaneous diadromous fishes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100031, 'Flounders  halibuts and soles', 'Flounders or halibuts and soles');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100035, 'Herrings  sardines and  anchovies', 'Clupeoids');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100036, 'Tunas  bonitos and billfishes', 'Scombroids');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100038, 'Sharks  rays and  skates  etc', 'Sharks or rays and chimaeras');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100039, 'Marine fishes', 'Marine fishes not identified');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100043, 'Lobsters and spiny-rock lobsters', 'Homaridae and Palinuridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100044, 'Craylets and squat lobsters', 'King crabs and squat-lobsters');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100045, 'Shrimps and prawns', 'Shrimps andprawns');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100047, 'Marine crustaceans', 'Miscellaneous marine crustaceans');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100053, 'Oysters', 'Oysters');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100054, 'Mussels', 'Mussels');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100056, 'Clams  cockles and arkshells', 'Clams or cockles and arkshells');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100058, 'Marine molluscs', 'Miscellaneous marine molluscs');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100077, 'Aquatic invertebrates', 'Miscellaneous aquatic invertebrates');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100081, 'Pearls and mother-of-pearl  shells', 'Pearls or mother-of-pearl and shells');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100139, 'Finfishes', 'Marine fishes not identified');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100176, 'Starfishes', 'Starfish and other echinoderms');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100195, 'Ex Mollusca', 'Marine shells nei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100196, 'Cnidarians and coelenterates', 'Cnidaria');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100239, 'Groundfishes', 'Marine fishes not identified');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100276, 'Sea urchins', 'Sea-urchins and other echinoderms');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100338, 'Cartilaginous fishes', 'Sharks rays and chimaeras');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100339, 'Pelagic fishes', 'Marine fishes not identified');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100345, 'Natantian decapods', 'Shrimps and prawns');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (100538, 'Various sharks', 'Sharks rays and chimaeras');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (200003, 'Chimaeras and ratfish and rabbitfish', 'Holocephali');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (200004, 'Sharks and rays', 'Elasmobranchii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (200007, 'Sharks', 'Selachimorpha');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (290002, 'Cephalopods', 'Cephalopoda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (290004, 'Clams', 'Bivalvia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (290005, 'Sea squirts', 'Ascidiacea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (290006, 'Gastropods', 'Gastropoda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (290010, 'Sea stars', 'Asteroidea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (290011, 'Sea urchins', 'Echinoidea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (290012, 'Sea cucumbers', 'Holothuroidea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (290013, 'Jellyfish', 'Scyphozoa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (290022, 'Crustaceans', 'Crustacea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300003, 'Chimaeras', 'Chimaeriformes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300007, 'Mackerel sharks', 'Lamniformes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300008, 'Ground sharks', 'Carcharhiniformes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300009, 'Bramble and sleeper and dogfish sharks', 'Squaliformes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300014, 'Skates and rays', 'Rajiformes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300026, 'Eels and morays', 'Anguilliformes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300028, 'Herrings', 'Clupeiformes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300032, 'Catfish', 'Siluriformes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300044, 'Cods', 'Gadiformes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300059, 'Scorpionfishes and flatheads', 'Scorpaeniformes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300060, 'Perch-likes', 'Perciformes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300061, 'Flatfishes', 'Pleuronectiformes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (300063, 'Skates and rays', 'Batoidea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (390002, 'Squids', 'Teuthida');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (390006, 'Cuttlefishes', 'Sepiida');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (390007, 'Octopuses', 'Octopoda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (390011, 'Abalones and winkles', 'Archaeogastropoda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (390013, 'Crabs lobsters and shrimps', 'Decapoda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (390017, 'Mantis shrimps', 'Stomatopoda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (390044, 'Merostomata', 'Merostomata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400001, 'Lampreys', 'Petromyzontidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400002, 'Hagfishes', 'Myxinidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400009, 'Mackerel sharks and white sharks', 'Lamnidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400010, 'Cat sharks', 'Scyliorhinidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400011, 'Requiem sharks', 'Carcharhinidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400012, 'Hammerhead  and bonnethead  and scoophead shark', 'Sphyrnidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400013, 'Dogfish sharks', 'Squalidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400015, 'Angel sharks', 'Squatinidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400016, 'Sawfishes', 'Pristidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400017, 'Guitarfishes', 'Rhinobatidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400018, 'Electric rays', 'Torpedinidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400019, 'Skates', 'Rajidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400020, 'Stingrays', 'Dasyatidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400022, 'Eagle and manta rays', 'Myliobatidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400024, 'Plownose chimaeras', 'Callorhinchidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400032, 'Sturgeons', 'Acipenseridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400043, 'Herrings and shads and sardines and menhadens', 'Clupeidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400048, 'Bonefishes', 'Albulidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400056, 'Moray eels', 'Muraenidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400062, 'Conger and garden eels', 'Congridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400066, 'Snake eels', 'Ophichthidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400076, 'Salmonids', 'Salmonidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400080, 'Smelts', 'Osmeridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400082, 'Icefishes or noodlefishes', 'Salangidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400084, 'Deep-sea smelts', 'Bathylagidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400145, 'Sea catfishes', 'Ariidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400149, 'Eeltail catfishes', 'Plotosidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400160, 'Lizardfishes', 'Synodontidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400163, 'Greeneyes', 'Chlorophthalmidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400167, 'Lanternfishes', 'Myctophidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400176, 'Trout-perches', 'Percopsidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400180, 'Codlings', 'Moridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400183, 'Cods and haddocks', 'Gadidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400185, 'Grenadiers or rattails', 'Macrouridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400186, 'Cusk-eels', 'Ophidiidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400189, 'Toadfishes', 'Batrachoididae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400190, 'Goosefishes', 'Lophiidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400206, 'Flyingfishes', 'Exocoetidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400207, 'Needlefishes', 'Belonidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400208, 'Sauries', 'Scomberesocidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400218, 'Silversides', 'Atherinidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400236, 'Slimeheads', 'Trachichthyidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400240, 'Alfonsinos', 'Berycidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400243, 'Squirrelfishes and soldierfishes', 'Holocentridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400249, 'Dories', 'Zeidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400250, 'Oreos', 'Oreosomatidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400252, 'Boarfishes', 'Caproidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400253, 'Trumpetfishes', 'Aulostomidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400254, 'Cornetfishes', 'Fistulariidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400264, 'Scorpionfishes or rockfishes', 'Scorpaenidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400266, 'Searobins', 'Triglidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400271, 'Greenlings', 'Hexagrammidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400273, 'Flatheads', 'Platycephalidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400277, 'Sculpins', 'Cottidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400287, 'Snooks', 'Centropomidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400289, 'Sea basses or groupers and fairy basslets', 'Serranidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400299, 'Grunters or tigerperches', 'Terapontidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400301, 'Aholeholes', 'Kuhliidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400303, 'Bigeyes or catalufas', 'Priacanthidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400304, 'Cardinalfishes', 'Apogonidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400306, 'Perches', 'Percidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400307, 'Smelt-whitings', 'Sillaginidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400308, 'Tilefishes', 'Malacanthidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400312, 'Cobia', 'Rachycentridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400313, 'Remoras', 'Echeneidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400314, 'Jacks and pompanos', 'Carangidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400317, 'Moonfish', 'Menidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400318, 'Slimys  slipmouths  or ponyfishes', 'Leiognathidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400319, 'Pomfrets', 'Bramidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400323, 'Snappers', 'Lutjanidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400324, 'Threadfin breams and Whiptail breams', 'Nemipteridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400326, 'Mojarras', 'Gerreidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400327, 'Grunts', 'Haemulidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400328, 'Emperors or scavengers', 'Lethrinidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400330, 'Porgies', 'Sparidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400331, 'Drums or croakers', 'Sciaenidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400332, 'Goatfishes', 'Mullidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400334, 'Sweepers', 'Pempheridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400339, 'Sea chubs', 'Kyphosidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400340, 'Spadefishes and batfishes and scats', 'Ephippidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400343, 'Butterflyfishes', 'Chaetodontidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400350, 'Damselfishes', 'Pomacentridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400352, 'Hawkfishes', 'Cirrhitidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400356, 'Trumpeters', 'Latridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400359, 'Mullets', 'Mugilidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400360, 'Barracudas', 'Sphyraenidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400361, 'Threadfins', 'Polynemidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400362, 'Wrasses', 'Labridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400364, 'Parrotfishes', 'Scaridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400371, 'Sandperches', 'Pinguipedidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400377, 'Weeverfishes', 'Trachinidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400382, 'Cod icefishes', 'Nototheniidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400383, 'Antarctic dragonfishes', 'Bathydraconidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400384, 'Crocodile icefishes', 'Channichthyidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400392, 'Combtooth blennies', 'Blenniidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400396, 'Wolffishes', 'Anarhichadidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400402, 'Sand lances', 'Ammodytidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400405, 'Gobies', 'Gobiidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400412, 'Surgeonfishes and tangs and unicornfishes', 'Acanthuridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400413, 'Rabbitfishes', 'Siganidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400414, 'Snake mackerels', 'Gempylidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400415, 'Cutlassfishes', 'Trichiuridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400416, 'Mackerels  tunas and bonitos', 'Scombridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400417, 'Swordfish', 'Xiphiidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400419, 'Billfishes', 'Istiophoridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400421, 'Medusafishes', 'Centrolophidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400425, 'Butterfishes', 'Stromateidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400437, 'Psettodids', 'Psettodidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400439, 'Lefteye flounders', 'Bothidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400440, 'Righteye flounders', 'Pleuronectidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400441, 'Soles', 'Soleidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400442, 'Tonguefishes', 'Cynoglossidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400444, 'Triplespines', 'Triacanthidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400445, 'Triggerfishes', 'Balistidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400446, 'Boxfishes (cowfish and trunkfish)', 'Ostraciidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400448, 'Puffers', 'Tetraodontidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400449, 'Porcupinefishes (burrfishes)', 'Diodontidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400454, 'Anchovies', 'Engraulidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400459, 'Fusiliers', 'Caesionidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400460, 'Angelfishes', 'Pomacanthidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400475, 'Halfbeaks', 'Hemiramphidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400479, 'Bonnetmouths', 'Inermiidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400488, 'Houndsharks', 'Triakidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400500, 'Round rays', 'Urolophidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400504, 'Pike congers', 'Muraenesocidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400509, 'Asiatic glassfishes', 'Ambassidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400514, 'Large-tooth flounders', 'Paralichthyidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400515, 'Turbots', 'Scophthalmidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400517, 'Filefishes', 'Monacanthidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400573, 'Rockfishes and rockcods and thornyheads', 'Sebastidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400578, 'Stonefishes', 'Synanceiidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400581, 'Armored searobins or armored gurnards', 'Peristediidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400585, 'Sea ravens or sailfin sculpins', 'Hemitripteridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400591, 'Barbled plunderfishes', 'Artedidraconidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400595, 'Snipefishes', 'Macroramphosidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400627, 'Asian seaperches', 'Lateolabracidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400631, 'Lates perches', 'Latidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (400669, 'American round stingrays', 'Urotrygonidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490004, 'Arrow squids', 'Ommastrephidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490010, 'Common squids', 'Loliginidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490011, 'Cuttlefishes', 'Sepiidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490012, 'Octopuses', 'Octopodidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490020, 'Abalones', 'Haliotidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490021, 'Buccinidae', 'Buccinidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490023, 'Littorinidae', 'Littorinidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490030, 'Palaemonid shrimps', 'Palaemonidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490031, 'Swimming crabs', 'Portunidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490036, 'King crabs', 'Lithodidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490037, 'Xanthidae', 'Xanthidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490039, 'Spiny lobsters', 'Palinuridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490040, 'Slipper lobsters', 'Scyllaridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490041, 'Sergestid shrimp', 'Sergestidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490042, 'Aristeid shrimps', 'Aristeidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490043, 'Penaeid shrimps', 'Penaeidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490044, 'Crongonid shrimp', 'Crangonidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490046, 'Norther shrimps', 'Pandalidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490052, 'Mantis shrimps', 'Squillidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490054, 'Sea mussels', 'Mytilidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490055, 'Scallops', 'Pectinidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490058, 'Cockles', 'Cardiidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490060, 'Venus clams', 'Veneridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490061, 'Razor clams and knife clams', 'Solenidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490062, 'Tridacnidae', 'Tridacnidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490063, 'Mactra surf clams', 'Mactridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490071, 'Jellyfishes', 'Rhizostomatidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490097, 'Marine crabs', 'Brachyura');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490124, 'Squat lobsters', 'Galatheidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490125, 'Tellinidae', 'Tellinidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490132, 'sea cucumbers', 'Holothuriidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490133, 'HELMET SHELLS', 'Cassidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490134, 'CONE SHELLS', 'Conidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490135, 'Cowrys', 'Cypraeidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490137, 'Hermit crabs', 'Diogenidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490138, 'Urchin', 'Diadematidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490142, 'NERITES', 'Neritidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490143, 'TRUE OYSTERS', 'Ostreidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490146, 'Augur shell', 'Terebridae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490148, 'Flower sea urchin', 'Toxopneustidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490152, 'CHITONS', 'Chitonidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (490159, 'Carditid clams', 'Carditidae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500036, 'Pseudohemiodon', 'Pseudohemiodon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500048, 'American flounders', 'Paralichthys');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500099, 'Brotulas', 'Brotula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500107, 'Dogfishes', 'Squalus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500108, 'Skates', 'Raja');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500112, 'Monkfishes', 'Lophius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500114, 'Hairtails', 'Trichiurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500116, 'Coryphaena', 'Coryphaena');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500122, 'Weevers', 'Trachinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500124, 'Sandlances', 'Ammodytes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500125, 'Stargazers', 'Uranoscopus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500134, 'Scorpionfish', 'Scorpaena');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500136, 'Salmon and trout', 'Salmo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500142, 'Mackerels', 'Scomber');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500143, 'Western goatfishes', 'Mullus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500144, 'Gurnards', 'Trigla');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500147, 'Argentines', 'Argentina');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500152, 'Grey mullets', 'Mugil');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500153, 'Threadfins', 'Polynemus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500154, 'Diodon', 'Diodon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500158, 'Coryphaenoides', 'Coryphaenoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500211, 'Deaf fishes', 'Trachipterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500240, 'Rabbitfishes', 'Siganus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500242, 'Scarus', 'Scarus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500327, 'Grenadiers', 'Macrourus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500348, 'Smooth-hounds', 'Mustelus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500351, 'Guitarfish', 'Rhinobatos');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500352, 'Shads', 'Alosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500357, 'Snappers', 'Lutjanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500358, 'Mola', 'Mola');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500366, 'Groupers', 'Epinephelus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500372, 'Barracudas', 'Sphyraena');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500384, 'Gymnothorax', 'Gymnothorax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500391, 'Lampris', 'Lampris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500398, 'Odontognathus', 'Odontognathus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500442, 'Hinds', 'Cephalopholis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500467, 'Jacks', 'Caranx');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500468, 'Queenfishes', 'Scomberoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500475, 'Fusiliers', 'Caesio');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500476, 'Plectorhinchus', 'Plectorhinchus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500477, 'Sea chubs', 'Kyphosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500480, 'Naso', 'Naso');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500487, 'Seerfishes', 'Scomberomorus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500488, 'Sailfishes', 'Istiophorus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500495, 'Sea robins', 'Prionotus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500504, 'Snooks', 'Centropomus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500508, 'Cheilinus', 'Cheilinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500515, 'Slipmouths', 'Leiognathus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500516, 'Grunts', 'Pomadasys');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500537, 'Achirus', 'Achirus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500538, 'Blue marlins', 'Makaira');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500551, 'Eel catfishes', 'Plotosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500598, 'Pompanos', 'Trachinotus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500618, 'Soles', 'Solea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500638, 'Mako sharks', 'Isurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500639, 'Thresher sharks', 'Alopias');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500640, 'Catsharks', 'Galeus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500642, 'Lanternsharks', 'Etmopterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500646, 'Stingrays', 'Dasyatis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500654, 'Hakes', 'Merluccius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500657, 'Hippocampus', 'Hippocampus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500661, 'Jack and horse mackerels', 'Trachurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500679, 'Picarels', 'Spicara');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500686, 'Rocklings', 'Gaidropsarus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500693, 'Hammerhead sharks', 'Sphyrna');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500705, 'Seabreams and porgies', 'Diplodus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500716, 'Cardinalfishes', 'Epigonus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500717, 'Sculpins', 'Myoxocephalus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500732, 'Ogcocephalus', 'Ogcocephalus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500737, 'Morone', 'Morone');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500808, 'Monocle breams', 'Scolopsis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500809, 'Seabreams (Dentex spp)', 'Dentex');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500814, 'Lesser catsharks', 'Scyliorhinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500816, 'Sharks', 'Carcharhinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500854, 'Aluterus', 'Aluterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500856, 'Wolf herring', 'Chirocentrus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500871, 'Needlefishes', 'Belone');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500891, 'Sillago', 'Sillago');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500901, 'Groupers', 'Serranus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500903, 'Seabreams (Pagrus spp)', 'Pagrus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500912, 'Bigeyes', 'Priacanthus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500913, 'Trumpeters', 'Terapon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500928, 'Amberjacks', 'Seriola');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (500934, 'Batfishes', 'Platax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501026, 'Tonguesoles', 'Cynoglossus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501055, 'Silver biddies', 'Gerres');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501096, 'Lings', 'Molva');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501116, 'Etelis', 'Etelis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501129, 'Alfonsinos', 'Beryx');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501130, 'Myripristis', 'Myripristis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501132, 'Tropical goatfishes', 'Upeneus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501135, 'Redfishes', 'Sebastes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501143, 'Haemulon', 'Haemulon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501144, 'Lethrinus', 'Lethrinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501145, 'Pandoras', 'Pagellus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501163, 'Frigate tuna', 'Auxis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501164, 'Harvestfishes', 'Peprilus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501241, 'Sicklefishes', 'Drepane');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501242, 'Scats', 'Scatophagus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501327, 'Western croakers', 'Micropogonias');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501345, 'Needlefishes', 'Tylosurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501410, 'Char', 'Salvelinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501418, 'Iberian soles', 'Microchirus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501441, 'Whiprays', 'Himantura');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501464, 'Sawsharks', 'Pristiophorus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501486, 'Eelpouts', 'Lycodes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501523, 'Porae', 'Nemadactylus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501548, 'Seabreams', 'Chrysoblephus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501550, 'Steenbras', 'Lithognathus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501551, 'Porgies', 'Calamus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501552, 'Threadfin breams', 'Nemipterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501573, 'Scads', 'Alepes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501634, 'Cypselurus', 'Cypselurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501677, 'Filefishes', 'Cantherhines');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501682, 'Sea catfishes', 'Arius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501826, 'Conger eels', 'Muraenesox');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501905, 'Tuna', 'Thunnus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501940, 'Sardinella', 'Sardinella');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501941, 'Herring', 'Harengula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501944, 'Ilishas', 'Pellona');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (501945, 'Dussumieria', 'Dussumieria');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502004, 'Barrelfishes', 'Seriolella');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502057, 'Lizardfishes', 'Saurida');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502100, 'Trevallies', 'Carangoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502102, 'Scads', 'Decapterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502124, 'Pristipomoides', 'Pristipomoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502224, 'Porichthys', 'Porichthys');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502364, 'Sand basses', 'Paralabrax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502403, 'Eucinostomus', 'Eucinostomus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502417, 'Cusk eels', 'Genypterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502582, 'Halfbeaks', 'Hyporhamphus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502666, 'Macolor', 'Macolor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502682, 'European/spotted seabass', 'Dicentrarchus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502724, 'Pacific salmon', 'Oncorhynchus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502730, 'Pontinus', 'Pontinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502790, 'Kingcroakers', 'Menticirrhus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502794, 'Weakfishes', 'Cynoscion');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502906, 'Flounders', 'Pseudorhombus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (502996, 'Acanthocybium', 'Acanthocybium');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (503028, 'Cat groupers', 'Mycteroperca');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (503078, 'Chimaeras', 'Hydrolagus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (503124, 'Megrims', 'Lepidorhombus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (503128, 'Flounders', 'Rhombosolea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (503152, 'Croakers', 'Pseudotolithus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (503328, 'Lampfish', 'Notoscopelus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (503456, 'Parupeneus', 'Parupeneus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (503580, 'Large-eye breams', 'Gymnocranius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (503663, 'Vimba', 'Vimba');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (503990, 'Bathylagus', 'Bathylagus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (504054, 'Moray cods', 'Muraenolepis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (504140, 'Frostfishes', 'Benthodesmus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (504212, 'Liza', 'Liza');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (504872, 'Toothfishes', 'Dissostichus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (504943, 'Pterygotrigla', 'Pterygotrigla');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (505460, 'Notolepis', 'Notolepis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (505469, 'Indo-Pacific mackerels', 'Rastrelliger');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (505577, 'Hysteronotus', 'Hysteronotus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (505586, 'Anchoviella', 'Anchoviella');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (505799, 'Southern soles', 'Austroglossus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (505897, 'Wolffish', 'Anarhichas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (506253, 'Whitefishes', 'Coregonus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (507028, 'Mulloidichthys', 'Mulloidichthys');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (507278, 'Croakers', 'Otolithoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (507412, 'Croakers', 'Pennahia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (507720, 'Indo-Pacific anchovies', 'Stolephorus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (508611, 'Skates', 'Bathyraja');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (509125, 'Puffers', 'Sphoeroides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (509206, 'Abudefduf', 'Abudefduf');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (509207, 'Acanthurus', 'Acanthurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (509232, 'Thryssa', 'Thryssa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (509274, 'Electric rays', 'Torpedo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (509279, 'Anguilla', 'Anguilla');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (509289, 'Halfbeaks', 'Hemiramphus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (509303, 'Gunnels and forkbeards', 'Phycis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (509309, 'Sargocentron', 'Sargocentron');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (509366, 'Antarctic rockcods', 'Trematomus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (520007, 'Silver pomfrets', 'Pampus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590010, 'Common squids', 'Loligo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590011, 'Sepia', 'Sepia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590013, 'Octopuses', 'Octopus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590014, 'Cupped oysters', 'Crassostrea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590024, 'Horned and musky octopuses', 'Eledone');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590046, 'Abalones', 'Haliotis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590049, 'Periwinkles', 'Littorina');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590050, 'Murex shells', 'Murex');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590051, 'Stromboid conchs', 'Strombus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590053, 'Turbo snails', 'Turbo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590060, 'Pacifastacus', 'Pacifastacus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590062, 'Blue crabs', 'Callinectes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590065, 'Pacific snow crabs', 'Chionoecetes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590067, 'Deepsea crabs', 'Geryon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590070, 'Lithodes', 'Lithodes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590073, 'King crabs', 'Paralithodes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590074, 'Paralomis', 'Paralomis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590075, 'Swims crabs', 'Portunus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590076, 'Scylla', 'Scylla');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590079, 'Lobsterette', 'Metanephrops');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590082, 'Spiny lobsters', 'Palinurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590083, 'Tropical spiny lobsters', 'Panulirus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590085, 'Acetes', 'Acetes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590088, 'Sand shrimps', 'Crangon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590089, 'Knife shrimps', 'Haliporoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590091, 'Metapenaeus shrimps', 'Metapenaeus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590092, 'Palaemon', 'Palaemon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590093, 'Pandalus shrimps', 'Pandalus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590094, 'Shrimps', 'Parapenaeopsis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590096, 'Penaeus shrimps', 'Penaeus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590103, 'Euphausia', 'Euphausia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590107, 'Goose barnacles', 'Lepas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590110, 'Whelks', 'Busycon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590111, 'Sea snails', 'Rapana');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590112, 'Flat oysters', 'Ostrea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590116, 'Horse mussels', 'Modiolus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590117, 'Mussels', 'Mytilus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590120, 'Chlamys', 'Chlamys');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590124, 'Anadara clams', 'Anadara');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590125, 'Ark clams', 'Arca');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590128, 'Donax clams', 'Donax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590129, 'Dosinia', 'Dosinia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590130, 'Ensis', 'Ensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590134, 'Hard clams', 'Meretrix');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590137, 'Taquilla clams', 'Mulinia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590139, 'Short neck clams', 'Paphia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590140, 'Protothaca', 'Protothaca');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590141, 'Carpet shell', 'Ruditapes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590143, 'Arks', 'Scapharca');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590145, 'Razor clams', 'Solen');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590146, 'Surf clam', 'Spisula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590147, 'Tapes clams', 'Tapes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590148, 'Giant clams', 'Tridacna');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590158, 'Sea urchins', 'Strongylocentrotus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590159, 'Rhopilema Jellyfishes', 'Rhopilema');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590160, 'Pearl oyster shells', 'Pinctada');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590195, 'Trochus', 'Trochus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590201, 'Hyas', 'Hyas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590242, 'Limpets', 'Patella');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590244, 'Scyllarides', 'Scyllarides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590248, 'Ghost shimps', 'Callianassa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590252, 'Gondolas', 'Cymbium');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590260, 'Sculptured shrimps', 'Sclerocrangon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590262, 'Tellins', 'Tellina');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590269, 'Gaper clams', 'Tresus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590272, 'Indo-Pacific swimming crabs', 'Charybdis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590323, 'SPIDER CONCH', 'Lambis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590401, 'Jellyfishes', 'Stomolophus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (590403, 'Scallops', 'Amusium');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600003, 'Mozambique tilapia', 'Oreochromis mossambicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600004, 'Anchoveta', 'Engraulis ringens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600005, 'Pigfish', 'Orthopristis chrysoptera');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600006, 'Common dolphinfish', 'Coryphaena hippurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600009, 'Starry triggerfish', 'Abalistes stellaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600010, 'Indian threadfish', 'Alectis indica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600012, 'Graysby', 'Cephalopholis cruentata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600014, 'Rock hind', 'Epinephelus adscensionis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600015, 'Red hind', 'Epinephelus guttatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600016, 'Goliath grouper', 'Epinephelus itajara');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600017, 'Red grouper', 'Epinephelus morio');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600018, 'Nassau grouper', 'Epinephelus striatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600020, 'Argentine', 'Argentina sphyraena');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600024, 'Atlantic herring', 'Clupea harengus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600025, 'Silvery pout', 'Gadiculus argenteus thori');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600026, 'Witch flounder', 'Glyptocephalus cynoglossus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600027, 'Fourspotted megrim', 'Lepidorhombus boscii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600028, 'Megrim', 'Lepidorhombus whiffiagonis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600029, 'Whiting', 'Merlangius merlangus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600030, 'European hake', 'Merluccius merluccius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600031, 'Blue whiting', 'Micromesistius poutassou');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600032, 'Thickback sole', 'Microchirus variegatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600033, 'Ling', 'Molva molva');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600034, 'Pollack', 'Pollachius pollachius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600035, 'European eel', 'Anguilla anguilla');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600039, 'Transparent goby', 'Aphia minuta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600041, 'Scaldfish', 'Arnoglossus laterna');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600044, 'East Atlantic red gurnard', 'Chelidonichthys cuculus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600045, 'Sand smelt', 'Atherina presbyter');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600047, 'Garpike', 'Belone belone');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600051, 'Tusk', 'Brosme brosme');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600054, 'Boarfish', 'Capros aper');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600056, 'Red bandfish', 'Cepola macrophthalma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600058, 'Mediterranean rainbow wrasse', 'Coris julis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600059, 'Corkwing wrasse', 'Symphodus melops');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600061, 'Goldsinny-wrasse', 'Ctenolabrus rupestris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600062, 'Lumpsucker', 'Cyclopterus lumpus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600063, 'European seabass', 'Dicentrarchus labrax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600066, 'European anchovy', 'Engraulis encrasicolus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600068, 'Grey gurnard', 'Eutrigla gurnardus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600069, 'Atlantic cod', 'Gadus morhua');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600071, 'Crevalle jack', 'Caranx hippos');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600072, 'Black goby', 'Gobius niger');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600076, 'Blackbelly rosefish', 'Helicolenus dactylopterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600077, 'Indo-Pacific sailfish', 'Istiophorus platypterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600078, 'Atlantic sailfish', 'Istiophorus albicans');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600080, 'Milkfish', 'Chanos chanos');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600081, 'Small toothed jobfish', 'Aphareus furca');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600083, 'Rusty jobfish', 'Aphareus rutilans');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600084, 'Green jobfish', 'Aprion virescens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600086, 'African forktail snapper', 'Apsilus fuscus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600087, 'Ruby snapper', 'Etelis carbunculus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600088, 'Porbeagle', 'Lamna nasus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600089, 'Wahoo', 'Acanthocybium solandri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600090, 'Basking shark', 'Cetorhinus maximus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600091, 'Slender tuna', 'Allothunnus fallai');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600093, 'Bullet tuna', 'Auxis rochei rochei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600094, 'Frigate tuna', 'Auxis thazard thazard');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600096, 'Kawakawa', 'Euthynnus affinis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600097, 'Little tunny', 'Euthynnus alletteratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600098, 'Black skipjack', 'Euthynnus lineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600101, 'Allis shad', 'Alosa alosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600104, 'Double-lined mackerel', 'Grammatorcynus bilineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600105, 'Pontic shad', 'Alosa immaculata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600106, 'Dogtooth tuna', 'Gymnosarda unicolor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600107, 'Skipjack tuna', 'Katsuwonus pelamis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600108, 'Plain bonito', 'Orcynopsis unicolor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600109, 'Short mackerel', 'Rastrelliger brachysoma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600111, 'Indian mackerel', 'Rastrelliger kanagurta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600113, 'Eastern Pacific bonito', 'Sarda chiliensis chiliensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600114, 'Striped bonito', 'Sarda orientalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600115, 'Atlantic bonito', 'Sarda sarda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600116, 'Blue mackerel', 'Scomber australasicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600117, 'Chub mackerel', 'Scomber japonicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600118, 'Atlantic mackerel', 'Scomber scombrus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600119, 'Serra Spanish mackerel', 'Scomberomorus brasiliensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600120, 'King mackerel', 'Scomberomorus cavalla');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600121, 'Narrow-barred Spanish mackerel', 'Scomberomorus commerson');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600123, 'Indo-Pacific king mackerel', 'Scomberomorus guttatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600125, 'Streaked seerfish', 'Scomberomorus lineolatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600126, 'Spanish mackerel', 'Scomberomorus maculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600131, 'Japanese Spanish mackerel', 'Scomberomorus niphonius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600134, 'Cero', 'Scomberomorus regalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600135, 'Broad-barred king mackerel', 'Scomberomorus semifasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600136, 'Pacific sierra', 'Scomberomorus sierra');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600138, 'Greenland shark', 'Somniosus microcephalus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600139, 'Piked dogfish', 'Squalus acanthias');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600140, 'Chola guitarfish', 'Rhinobatos percellens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600141, 'West African Spanish mackerel', 'Scomberomorus tritor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600142, 'Albacore', 'Thunnus alalunga');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600143, 'Yellowfin tuna', 'Thunnus albacares');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600144, 'Blackfin tuna', 'Thunnus atlanticus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600145, 'Southern bluefin tuna', 'Thunnus maccoyii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600146, 'Bigeye tuna', 'Thunnus obesus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600147, 'Atlantic bluefin tuna', 'Thunnus thynnus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600148, 'Longtail tuna', 'Thunnus tonggol');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600149, 'Pacific guitarfish', 'Rhinobatos planiceps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600152, 'Spotted rose snapper', 'Lutjanus guttatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600154, 'Dog snapper', 'Lutjanus jocu');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600155, 'Jordans snapper', 'Lutjanus jordani');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600156, 'Common bluestripe snapper', 'Lutjanus kasmira');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600159, 'Bigeye snapper', 'Lutjanus lutjanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600162, 'Malabar blood snapper', 'Lutjanus malabaricus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600166, 'Onespot snapper', 'Lutjanus monostigma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600167, 'Cape elephantfish', 'Callorhinchus capensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600170, 'Pacific red snapper', 'Lutjanus peru');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600171, 'Southern red snapper', 'Lutjanus purpureus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600172, 'Five-lined snapper', 'Lutjanus quinquelineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600175, 'Ladyfish', 'Elops saurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600176, 'Russell''s snapper', 'Lutjanus russellii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600181, 'Lane snapper', 'Lutjanus synagris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600185, 'Silk snapper', 'Lutjanus vivanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600186, 'Midnight snapper', 'Macolor macularis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600187, 'Black and white snapper', 'Macolor niger');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600188, 'Yellowtail snapper', 'Ocyurus chrysurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600191, 'Saddle-back snapper', 'Paracaesio kusakarii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600192, 'Dirty ordure snapper', 'Paracaesio sordida');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600193, 'Cocoa snapper', 'Paracaesio stonei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600194, 'Yellowtail blue snapper', 'Paracaesio xanthura');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600199, 'Ornate jobfish', 'Pristipomoides argyrogrammicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600200, 'Goldflag jobfish', 'Pristipomoides auricilla');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600201, 'Crimson jobfish', 'Pristipomoides filamentosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600202, 'Golden eye jobfish', 'Pristipomoides flavipinnis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600203, 'Bogue', 'Boops boops');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600204, 'Salema', 'Sarpa salpa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600206, 'Cardinal snapper', 'Pristipomoides macrophthalmus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600207, 'Wide-eyed flounder', 'Bothus podas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600208, 'Goldbanded jobfish', 'Pristipomoides multidens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600209, 'Lavender jobfish', 'Pristipomoides sieboldii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600211, 'Oblique-banded snapper', 'Pristipomoides zonatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600213, 'Vermilion snapper', 'Rhomboplites aurorubens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600214, 'Sailfin snapper', 'Symphorichthys spilurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600216, 'Atlantic blue marlin', 'Makaira nigricans');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600217, 'Black marlin', 'Makaira indica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600218, 'Indo-Pacific blue marlin', 'Makaira mazara');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600219, 'Atlantic white marlin', 'Tetrapturus albidus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600220, 'Longbill spearfish', 'Tetrapturus pfluegeri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600223, 'Striped marlin', 'Tetrapturus audax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600226, 'Swordfish', 'Xiphias gladius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600227, 'Indo-Pacific tarpon', 'Megalops cyprinoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600228, 'Bonefish', 'Albula vulpes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600229, 'Longfin bonefish', 'Pterothrissus belloci');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600230, 'Baird''s slickhead', 'Alepocephalus bairdii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600231, 'Vendace', 'Coregonus albula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600232, 'European whitefish', 'Coregonus lavaretus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600233, 'Houting', 'Coregonus oxyrinchus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600236, 'Atlantic salmon', 'Salmo salar');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600238, 'Sea trout', 'Salmo trutta trutta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600239, 'Rainbow trout', 'Oncorhynchus mykiss');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600240, 'Pink salmon', 'Oncorhynchus gorbuscha');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600241, 'Chum salmon', 'Oncorhynchus keta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600242, 'Cherry salmon', 'Oncorhynchus masou masou');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600243, 'Sockeye salmon', 'Oncorhynchus nerka');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600244, 'Chinook salmon', 'Oncorhynchus tshawytscha');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600245, 'Coho salmon', 'Oncorhynchus kisutch');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600246, 'Brook trout', 'Salvelinus fontinalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600247, 'Arctic char', 'Salvelinus alpinus alpinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600249, 'Rudderfish', 'Centrolophus niger');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600250, 'Imperial blackfish', 'Schedophilus ovalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600251, 'Ayu sweetfish', 'Plecoglossus altivelis altivelis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600252, 'Capelin', 'Mallotus villosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600253, 'Rainbow smelt', 'Osmerus mordax mordax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600255, 'Surf smelt', 'Hypomesus pretiosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600256, 'Eulachon', 'Thaleichthys pacificus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600257, 'Deepsea smelt', 'Glossanodon semifasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600258, 'Northern pike', 'Esox lucius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600259, 'Hectors lanternfish', 'Lampanyctodes hectoris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600260, 'Bombay duck', 'Harpadon nehereus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600261, 'Dory snapper', 'Lutjanus fulviflamma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600262, 'Blacktail snapper', 'Lutjanus fulvus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600264, 'Johns snapper', 'Lutjanus johnii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600265, 'Humpback red snapper', 'Lutjanus gibbus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600266, 'Grey snapper', 'Lutjanus griseus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600269, 'Tench', 'Tinca tinca');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600270, 'Crucian carp', 'Carassius carassius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600272, 'Roach', 'Rutilus rutilus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600274, 'Silver carp', 'Hypophthalmichthys molitrix');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600275, 'Bighead carp', 'Hypophthalmichthys nobilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600283, 'Ziege', 'Pelecus cultratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600286, 'Silver barb', 'Barbonymus gonionotus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600288, 'White baggar', 'Galeichthys feliceps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600289, 'Wels catfish', 'Silurus glanis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600298, 'Daggertooth pike conger', 'Muraenesox cinereus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600299, 'Argentine conger', 'Conger orbignianus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600300, 'American conger', 'Conger oceanicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600301, 'European conger', 'Conger conger');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600302, 'Whitespotted conger', 'Conger myriaster');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600303, 'Pacific saury', 'Cololabis saira');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600305, 'Japanese halfbeak', 'Hyporhamphus sajori');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600306, 'Tadpole codling', 'Salilota australis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600308, 'Pacific cod', 'Gadus macrocephalus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600309, 'Greenland cod', 'Gadus ogac');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600310, 'Burbot', 'Lota lota');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600311, 'Brazilian codling', 'Urophycis brasiliensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600312, 'Red hake', 'Urophycis chuss');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600313, 'White hake', 'Urophycis tenuis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600314, 'Navaga', 'Eleginus nawaga');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600315, 'Saffron cod', 'Eleginus gracilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600316, 'Atlantic tomcod', 'Microgadus tomcod');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600318, 'Alaska Pollock', 'Theragra chalcogramma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600319, 'Polar cod', 'Boreogadus saida');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600320, 'Southern blue whiting', 'Micromesistius australis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600321, 'Senegalese hake', 'Merluccius senegalensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600322, 'Southern hake', 'Merluccius australis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600323, 'Silver hake', 'Merluccius bilinearis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600324, 'South Pacific hake', 'Merluccius gayi gayi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600325, 'Argentine hake', 'Merluccius hubbsi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600326, 'North Pacific hake', 'Merluccius productus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600327, 'Benguela hake', 'Merluccius polli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600329, 'Patagonian grenadier', 'Macruronus magellanicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600331, 'Onion-eye grenadier', 'Macrourus berglax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600332, 'Roundnose grenadier', 'Coryphaenoides rupestris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600333, 'Longspine snipefish', 'Macroramphosus scolopax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600334, 'Orange roughy', 'Hoplostethus atlanticus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600336, 'Silvery John dory', 'Zenopsis conchifer');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600338, 'Bobo mullet', 'Joturus pichardi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600339, 'Atlantic silverside', 'Menidia menidia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600340, 'Fourfinger threadfin', 'Eleutheronema tetradactylum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600341, 'Lesser African threadfin', 'Galeoides decadactylus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600342, 'Royal threadfin', 'Pentanemus quinquarius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600344, 'Indonesian snakehead', 'Channa micropeltes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600345, 'Common snook', 'Centropomus undecimalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600346, 'Barramundi', 'Lates calcarifer');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600348, 'Spotted grouper', 'Epinephelus analogus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600349, 'Wreckfish', 'Polyprion americanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600350, 'Hapuka', 'Polyprion oxygeneios');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600351, 'Sea bass', 'Acanthistius brasilianus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600352, 'Peruvian rock seabass', 'Paralabrax humeralis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600353, 'Striped sea-bass', 'Morone saxatilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600355, 'White perch', 'Morone americana');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600356, 'Red bigeye', 'Priacanthus macracanthus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600357, 'Japanese splitfin', 'Synagrops japonicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600358, 'European perch', 'Perca fluviatilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600360, 'Pike-perch', 'Sander lucioperca');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600361, 'Black seabass', 'Centropristis striata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600362, 'Great northern tilefish', 'Lopholatilus chamaeleonticeps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600363, 'False trevally', 'Lactarius lactarius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600364, 'Bluefish', 'Pomatomus saltatrix');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600366, 'Japanese jack mackerel', 'Trachurus japonicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600367, 'Inca scad', 'Trachurus murphyi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600368, 'Pacific jack mackerel', 'Trachurus symmetricus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600369, 'Rough scad', 'Trachurus lathami');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600371, 'Cunene horse mackerel', 'Trachurus trecae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600372, 'Greenback horse mackerel', 'Trachurus declivis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600374, 'Indian scad', 'Decapterus russelli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600378, 'Atlantic moonfish', 'Selene setapinnis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600379, 'African moonfish', 'Selene dorsalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600380, 'Florida pompano', 'Trachinotus carolinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600381, 'Japanese amberjack', 'Seriola quinqueradiata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600382, 'Yellowtail amberjack', 'Seriola lalandi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600384, 'Torpedo scad', 'Megalaspis cordyla');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600385, 'Atlantic bumper', 'Chloroscombrus chrysurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600386, 'Parona leatherjacket', 'Parona signata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600387, 'Bigeye scad', 'Selar crumenophthalmus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600388, 'Yellowstripe scad', 'Selaroides leptolepis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600390, 'Moonfish', 'Mene maculata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600391, 'Atlantic pomfret', 'Brama brama');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600392, 'Australian ruff', 'Arripis georgianus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600394, 'Spotted seabass', 'Dicentrarchus punctatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600395, 'Redbait', 'Emmelichthys nitidus nitidus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600396, 'Golden threadfin bream', 'Nemipterus virgatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600397, 'Cabinza grunt', 'Isacia conceptionis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600398, 'Rubberlip grunt', 'Plectorhinchus mediterraneus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600399, 'Silver grunt', 'Pomadasys argenteus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600400, 'Bigeye grunt', 'Brachydeuterus auritus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600401, 'Barred grunt', 'Conodon nobilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600403, 'Peruvian weakfish', 'Cynoscion analis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600405, 'Spotted weakfish', 'Cynoscion nebulosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600406, 'Gray weakfish', 'Cynoscion regalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600407, 'South American striped weakfish', 'Cynoscion striatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600408, 'Atlantic croaker', 'Micropogonias undulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600409, 'Southern kingcroaker', 'Menticirrhus americanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600410, 'Northern kingcroaker', 'Menticirrhus saxatilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600411, 'Gulf kingcroaker', 'Menticirrhus littoralis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600412, 'Rainbow runner', 'Elagatis bipinnulata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600413, 'Argentine croaker', 'Umbrina canosai');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600416, 'Yellow croaker', 'Larimichthys polyactis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600417, 'King weakfish', 'Macrodon ancylodon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600418, 'Meagre', 'Argyrosomus regius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600419, 'Southern meagre', 'Argyrosomus hololepidotus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600420, 'Geelbeck croaker', 'Atractoscion aequidens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600422, 'White croaker', 'Genyonemus lineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600423, 'Boe drum', 'Pteroscion peli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600424, 'Peruvian banded croaker', 'Paralonchurus peruanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600425, 'Black drum', 'Pogonias cromis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600426, 'White grouper', 'Epinephelus aeneus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600427, 'Nibe croaker', 'Nibea mitsukurii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600428, 'Large yellow croaker', 'Larimichthys crocea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600429, 'Spot croaker', 'Leiostomus xanthurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600432, 'Cassava croaker', 'Pseudotolithus senegalensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600433, 'Bobo croaker', 'Pseudotolithus elongatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600434, 'White croaker', 'Pennahia argentata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600436, 'Red pandora', 'Pagellus bellottii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600438, 'Large-eye dentex', 'Dentex macrophthalmus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600439, 'Common dentex', 'Dentex dentex');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600440, 'Angola dentex', 'Dentex angolensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600441, 'Sheepshead seabream', 'Archosargus probatocephalus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600442, 'King soldierbream', 'Argyrops spinifer');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600443, 'Carpenter seabream', 'Argyrozona argyrozona');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600444, 'Santer seabream', 'Cheimerius nufar');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600445, 'Red seabream', 'Pagrus major');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600447, 'Red steenbras', 'Petrus rupestris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600448, 'Panga seabream', 'Pterogymnus laniarius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600449, 'White stumpnose', 'Rhabdosargus globiceps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600450, 'White steenbras', 'Lithognathus lithognathus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600452, 'Scup', 'Stenotomus chrysops');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600453, 'West African goatfish', 'Pseudupeneus prayensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600454, 'Spotted sicklefish', 'Drepane punctata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600458, 'Tautog', 'Tautoga onitis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600460, 'White morwong', 'Nemadactylus bergi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600461, 'Peruvian morwong', 'Cheilodactylus variegatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600463, 'Sailfin sandfish', 'Arctoscopus japonicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600464, 'Blue cod', 'Parapercis colias');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600465, 'Brazilian flathead', 'Percophis brasiliensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600466, 'Patagonian blennie', 'Eleginops maclovinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600467, 'Patagonian toothfish', 'Dissostichus eleginoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600468, 'Marbled rockcod', 'Notothenia rossii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600472, 'Antarctic silverfish', 'Pleuragramma antarctica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600473, 'Blackfin icefish', 'Chaenocephalus aceratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600474, 'Mackerel icefish', 'Champsocephalus gunnari');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600475, 'South Georgia icefish', 'Pseudochaenichthys georgianus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600476, 'Ocellated icefish', 'Chionodraco rastrospinosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600477, 'Unicorn icefish', 'Channichthys rhinoceratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600478, 'Spiny icefish', 'Chaenodraco wilsoni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600479, 'Viviparous blenny', 'Zoarces viviparus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600480, 'Ocean pout', 'Zoarces americanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600481, 'Poor cod', 'Trisopterus minutus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600482, 'Pink cusk-eel', 'Genypterus blacodes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600483, 'Red cusk-eel', 'Genypterus chilensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600484, 'Black cusk-eel', 'Genypterus maculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600485, 'Kingklip', 'Genypterus capensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600486, 'Bearded brotula', 'Brotula barbata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600487, 'Pacific sandeel', 'Ammodytes personatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600488, 'Korean sandeel', 'Hypoptychus dybowskii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600489, 'Snoek', 'Thyrsites atun');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600490, 'White snake mackerel', 'Thyrsitops lepidopoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600491, 'Silver pomfret', 'Pampus argenteus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600492, 'American butterfish', 'Peprilus triacanthus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600493, 'Pacific pompano', 'Peprilus simillimus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600496, 'Antarctic butterfish', 'Hyperoglyphe antarctica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600497, 'Melon seed', 'Psenopsis anomala');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600501, 'Ocean perch', 'Sebastes marinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600502, 'Widow rockfish', 'Sebastes entomelas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600503, 'Yellowtail rockfish', 'Sebastes flavidus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600504, 'Pacific ocean perch', 'Sebastes alutus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600505, 'Deepwater redfish', 'Sebastes mentella');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600507, 'Bluefin gurnard', 'Chelidonichthys kumu');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600508, 'Latchet', 'Pterygotrigla polyommata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600509, 'Lingcod', 'Ophiodon elongatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600510, 'Okhostk atka mackerel', 'Pleurogrammus azonus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600512, 'Sablefish', 'Anoplopoma fimbria');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600513, 'Indian spiny turbot', 'Psettodes erumei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600514, 'Pacific halibut', 'Hippoglossus stenolepis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600516, 'Greenland halibut', 'Reinhardtius hippoglossoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600517, 'Arrowtooth flounder', 'Atheresthes stomias');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600518, 'Kamchatka flounder', 'Atheresthes evermanni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600519, 'Flathead sole', 'Hippoglossoides elassodon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600520, 'Yellowfin sole', 'Limanda aspera');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600521, 'Yellowtail flounder', 'Limanda ferruginea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600524, 'Winter flounder', 'Pseudopleuronectes americanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600525, 'Common sole', 'Solea solea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600526, 'Wedge sole', 'Dicologlossa cuneata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600527, 'West coast sole', 'Austroglossus microlepis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600528, 'Mud sole', 'Austroglossus pectoralis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600529, 'Brill', 'Scophthalmus rhombus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600530, 'Windowpane', 'Scophthalmus aquosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600531, 'Thread-sail filefish', 'Stephanolepis cirrhifer');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600532, 'American angler', 'Lophius americanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600545, 'Bay anchovy', 'Anchoa mitchilli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600547, 'Atlantic anchoveta', 'Cetengraulis edentulus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600548, 'Pacific anchoveta', 'Cetengraulis mysticetus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600555, 'Devis anchovy', 'Encrasicholina devisi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600556, 'Shorthead anchovy', 'Encrasicholina heteroloba');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600558, 'Buccaneer anchovy', 'Encrasicholina punctifer');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600569, 'Indian anchovy', 'Stolephorus indicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600571, 'Hardenbergs anchovy', 'Stolephorus insularis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600572, 'Ballan wrasse', 'Labrus bergylta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600575, 'Pacific anchovy', 'Stolephorus pacificus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600636, 'Sharpnose sevengill shark', 'Heptranchias perlo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600637, 'Bluntnose sixgill shark', 'Hexanchus griseus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600641, 'Bramble shark', 'Echinorhinus brucus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600645, 'Silver scabbardfish', 'Lepidopus caudatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600646, 'Black scabbardfish', 'Aphanopus carbo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600648, 'Gulper shark', 'Centrophorus granulosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600650, 'Lowfin gulper shark', 'Centrophorus lusitanicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600653, 'Leafscale gulper shark', 'Centrophorus squamosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600656, 'Black dogfish', 'Centroscyllium fabricii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600662, 'Portuguese dogfish', 'Centroscymnus coelolepis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600663, 'Longnose velvet dogfish', 'Centroscymnus crepidater');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600664, 'Shortnose velvet dogfish', 'Centroscymnus cryptacanthus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600669, 'Kitefin shark', 'Dalatias licha');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600670, 'Birdbeak dogfish', 'Deania calcea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600671, 'Rough longnose dogfish', 'Deania hystricosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600679, 'Southern lanternshark', 'Etmopterus granulosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600687, 'Velvet belly lantern shark', 'Etmopterus spinax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600692, 'Leerfish', 'Lichia amia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600695, 'Dab', 'Limanda limanda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600700, 'Knifetooth dogfish', 'Scymnodon ringens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600704, 'Little sleeper shark', 'Somniosus rostratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600706, 'Striped seabream', 'Lithognathus mormyrus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600716, 'Angler', 'Lophius piscatorius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600718, 'Angular roughshark', 'Oxynotus centrina');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600719, 'Sailfin roughshark', 'Oxynotus paradoxus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600727, 'Argentine angelshark', 'Squatina argentina');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600736, 'Angelshark', 'Squatina squatina');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600747, 'Sand tiger shark', 'Carcharias taurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600751, 'Great white shark', 'Carcharodon carcharias');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600752, 'Shortfin mako', 'Isurus oxyrinchus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600753, 'Longfin mako', 'Isurus paucus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600754, 'Pearlsides', 'Maurolicus muelleri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600779, 'Deepwater catshark', 'Apristurus profundorum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600785, 'Flathead mullet', 'Mugil cephalus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600790, 'Red mullet', 'Mullus barbatus barbatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600807, 'Blackmouth catshark', 'Galeus melastomus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600808, 'Mouse catshark', 'Galeus murinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600817, 'Dusky catshark', 'Bythaelurus canescens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600845, 'Smallspotted catshark', 'Scyliorhinus canicula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600850, 'Saddled seabream', 'Oblada melanura');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600854, 'Nursehound', 'Scyliorhinus stellaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600858, 'Silvertip shark', 'Carcharhinus albimarginatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600861, 'Grey reef shark', 'Carcharhinus amblyrhynchos');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600864, 'Copper shark', 'Carcharhinus brachyurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600868, 'Silky shark', 'Carcharhinus falciformis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600870, 'Galapagos shark', 'Carcharhinus galapagensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600873, 'Bull shark', 'Carcharhinus leucas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600874, 'Blacktip shark', 'Carcharhinus limbatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600875, 'Oceanic whitetip shark', 'Carcharhinus longimanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600877, 'Blacktip reef shark', 'Carcharhinus melanopterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600878, 'Dusky shark', 'Carcharhinus obscurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600880, 'Sandbar shark', 'Carcharhinus plumbeus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600881, 'Smalltail shark', 'Carcharhinus porosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600884, 'Spottail shark', 'Carcharhinus sorrah');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600886, 'Tiger shark', 'Galeocerdo cuvier');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600889, 'Axillary seabream', 'Pagellus acarne');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600890, 'Blackspot seabream', 'Pagellus bogaraveo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600893, 'Common pandora', 'Pagellus erythrinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600897, 'Lemon shark', 'Negaprion brevirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600898, 'Blue shark', 'Prionace glauca');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600903, 'Caribbean sharpnose shark', 'Rhizoprionodon porosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600905, 'Atlantic sharpnose shark', 'Rhizoprionodon terraenovae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600907, 'Whitetip reef shark', 'Triaenodon obesus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600912, 'Scalloped hammerhead', 'Sphyrna lewini');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600914, 'Great hammerhead', 'Sphyrna mokarran');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600915, 'Bonnethead', 'Sphyrna tiburo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600917, 'Smooth hammerhead', 'Sphyrna zygaena');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600918, 'Blue and gold fusilier', 'Caesio caerulaurea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600920, 'Lunar fusilier', 'Caesio lunaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600923, 'Yellow and blueback fusilier', 'Caesio teres');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600935, 'Marr''s fusilier', 'Pterocaesio marri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600936, 'Banana fusilier', 'Pterocaesio pisang');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600939, 'Dark-banded fusilier', 'Pterocaesio tile');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600940, 'Red stingray', 'Dasyatis akajei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600941, 'Longfin kob', 'Atrobucca nibe');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600948, 'Couma sea catfish', 'Sciades couma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600949, 'Thomas sea catfish', 'Notarius grandicassis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600950, 'Bartail flathead', 'Platycephalus indicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600952, 'Gillbacker sea catfish', 'Sciades parkeri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600953, 'Passany sea catfish', 'Sciades passany');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600954, 'Kukwari sea catfish', 'Amphiarius phrygiatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600955, 'Crucifix sea catfish', 'Sciades proops');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600956, 'Bressou sea catfish', 'Aspistor quadriscutis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600958, 'Coco sea catfish', 'Bagre bagre');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600966, 'Black triggerfish', 'Melichthys niger');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600972, 'Flat needlefish', 'Ablennes hians');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600977, 'Hound needlefish', 'Tylosurus crocodilus crocodilus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600983, 'Atlantic goldeye tilefish', 'Caulolatilus chrysops');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600988, 'African pompano', 'Alectis ciliaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600993, 'Mackerel scad', 'Decapterus macarellus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600994, 'Round scad', 'Decapterus punctatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (600998, 'Pilotfish', 'Naucrates ductor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601002, 'White trevally', 'Pseudocaranx dentex');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601004, 'Lookdown', 'Selene vomer');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601005, 'Greater amberjack', 'Seriola dumerili');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601007, 'Longfin yellowtail', 'Seriola rivoliana');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601009, 'Cayenne pompano', 'Trachinotus cayennensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601011, 'Great pompano', 'Trachinotus goodei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601012, 'Cottonmouth jack', 'Uraspis secunda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601021, 'Flying gurnard', 'Dactylopterus volitans');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601022, 'Spot-fin porcupinefish', 'Diodon hystrix');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601023, 'Norway pout', 'Trisopterus esmarkii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601024, 'Atlantic spadefish', 'Chaetodipterus faber');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601042, 'Escolar', 'Lepidocybium flavobrunneum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601043, 'Round sardinella', 'Sardinella aurita');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601044, 'Oilfish', 'Ruvettus pretiosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601047, 'Madeiran sardinella', 'Sardinella maderensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601048, 'Caitipa mojarra', 'Diapterus rhombeus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601049, 'Silver mojarra', 'Eucinostomus argenteus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601054, 'Yellow fin mojarra', 'Gerres cinereus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601055, 'Brushtooth lizardfish', 'Saurida undosquamis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601058, 'Bermuda halfbeak', 'Hemiramphus bermudensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601059, 'Ballyhoo', 'Hemiramphus brasiliensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601061, 'Squirrelfish', 'Holocentrus adscensionis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601063, 'Blackbar soldierfish', 'Myripristis jacobus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601066, 'Spotfin hogfish', 'Bodianus pulchellus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601071, 'Hogfish', 'Lachnolaimus maximus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601072, 'Opah', 'Lampris guttatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601077, 'Atlantic tripletail', 'Lobotes surinamensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601078, 'Blackfin goosefish', 'Lophius gastrophysus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601079, 'Tarpon', 'Megalops atlanticus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601084, 'Atlantic saury', 'Scomberesox saurus saurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601089, 'Parassi mullet', 'Mugil incilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601090, 'Liza', 'Mugil liza');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601092, 'Yellow goatfish', 'Mulloidichthys martinicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601094, 'Spotted goatfish', 'Pseudupeneus maculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601110, 'Atlantic threadfin', 'Polydactylus octonemus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601126, 'White margate', 'Haemulon album');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601128, 'Tomtate grunt', 'Haemulon aurolineatum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601129, 'Black grunt', 'Haemulon bonariense');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601130, 'Bronzestripe grunt', 'Haemulon boschmae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601133, 'Broad-striped anchovy', 'Anchoa hepsetus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601140, 'White grunt', 'Haemulon plumierii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601141, 'Bluestriped grunt', 'Haemulon sciurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601142, 'Chere-chere grunt', 'Haemulon steindachneri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601146, 'Roughneck grunt', 'Pomadasys corvinaeformis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601149, 'Atlantic bigeye', 'Priacanthus arenatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601150, 'Glasseye', 'Heteropriacanthus cruentatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601161, 'Stoplight parrotfish', 'Sparisoma viride');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601164, 'Gilthead seabream', 'Sparus aurata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601166, 'Ground croaker', 'Bairdiella ronchus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601168, 'Barbel drum', 'Ctenosciaena gracilicirrhus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601169, 'Acoupa weakfish', 'Cynoscion acoupa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601170, 'Sand weakfish', 'Cynoscion arenarius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601171, 'Jamaica weakfish', 'Cynoscion jamaicensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601177, 'Smalltooth weakfish', 'Cynoscion steindachneri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601178, 'Green weakfish', 'Cynoscion virescens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601180, 'Shorthead drum', 'Larimus breviceps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601181, 'Northern puffer', 'Sphoeroides maculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601184, 'Smalleye croaker', 'Nebris microps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601191, 'Red drum', 'Sciaenops ocellatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601198, 'Blue butterfish', 'Stromateus fiatola');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601203, 'Sand seabass', 'Diplectrum formosum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601205, 'Yellowedge grouper', 'Hyporthodus flavolimbatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601206, 'Misty grouper', 'Hyporthodus mystacinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601207, 'Warsaw grouper', 'Hyporthodus nigritus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601208, 'Snowy grouper', 'Hyporthodus niveatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601209, 'Black grouper', 'Mycteroperca bonaci');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601211, 'Yellowmouth grouper', 'Mycteroperca interstitialis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601212, 'Gag', 'Mycteroperca microlepis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601213, 'Scamp', 'Mycteroperca phenax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601214, 'Mottled grouper', 'Mycteroperca rubra');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601215, 'Tiger grouper', 'Mycteroperca tigris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601216, 'Yellowfin grouper', 'Mycteroperca venenosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601217, 'Creole-fish', 'Paranthias furcifer');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601219, 'Western Atlantic seabream', 'Archosargus rhomboidalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601221, 'Jolthead porgy', 'Calamus bajonado');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601222, 'Saucereye porgy', 'Calamus calamus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601235, 'Great barracuda', 'Sphyraena barracuda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601236, 'Guachanche barracuda', 'Sphyraena guachancho');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601239, 'Smooth puffer', 'Lagocephalus laevigatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601248, 'Longnose stingray', 'Dasyatis guttata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601250, 'Spotted eagle ray', 'Aetobatus narinari');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601255, 'Elongate surgeonfish', 'Acanthurus mata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601256, 'Eyestripe surgeonfish', 'Acanthurus dussumieri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601258, 'Lined surgeonfish', 'Acanthurus lineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601260, 'Convict surgeonfish', 'Acanthurus triostegus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601261, 'Yellowfin surgeonfish', 'Acanthurus xanthopterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601262, 'Striated surgeonfish', 'Ctenochaetus striatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601263, 'Sleek unicornfish', 'Naso hexacanthus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601264, 'Orangespine unicornfish', 'Naso lituratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601265, 'Bluespine unicornfish', 'Naso unicornis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601266, 'Sailfin tang', 'Zebrasoma velifer');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601274, 'Indonesian shortfin eel', 'Anguilla bicolor bicolor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601278, 'Mediterranean horse mackerel', 'Trachurus mediterraneus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601279, 'Blue jack mackerel', 'Trachurus picturatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601288, 'Largehead hairtail', 'Trichiurus lepturus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601290, 'Fivebeard rockling', 'Ciliata mustela');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601300, 'Indian driftfish', 'Ariomma indicum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601303, 'Hardyhead silverside', 'Atherinomorus lacunosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601306, 'Shi drum', 'Umbrina cirrosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601307, 'Samoan silverside', 'Hypoatherina temminckii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601309, 'Chinese trumpetfish', 'Aulostomus chinensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601311, 'Redtoothed triggerfish', 'Odonus niger');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601312, 'Masked triggerfish', 'Sufflamen fraenatum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601314, 'Keeled needlefish', 'Platybelone argalus platyura');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601317, 'Keel-jawed needle fish', 'Tylosurus acus melanotus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601319, 'Alfonsino', 'Beryx decadactylus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601320, 'Splendid alfonsino', 'Beryx splendens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601321, 'Leopard flounder', 'Bothus pantherinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601327, 'Striped red mullet', 'Mullus surmuletus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601334, 'European smelt', 'Osmerus eperlanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601336, 'Sand sole', 'Pegusa lascaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601338, 'Summer flounder', 'Paralichthys dentatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601340, 'Greater forkbeard', 'Phycis blennoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601341, 'Flounder', 'Platichthys flesus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601342, 'European plaice', 'Pleuronectes platessa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601343, 'Saithe', 'Pollachius virens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601348, 'Turbot', 'Scophthalmus maximus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601350, 'European pilchard', 'Sardina pilchardus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601351, 'Bastard halibut', 'Paralichthys olivaceus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601352, 'Norway redfish', 'Sebastes viviparus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601353, 'Comber', 'Serranus cabrilla');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601356, 'Black seabream', 'Spondyliosoma cantharus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601357, 'European sprat', 'Sprattus sprattus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601363, 'Greater weever', 'Trachinus draco');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601365, 'Atlantic horse mackerel', 'Trachurus trachurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601366, 'Tub gurnard', 'Chelidonichthys lucerna');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601367, 'Pouting', 'Trisopterus luscus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601370, 'John dory', 'Zeus faber');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601371, 'Atlantic halibut', 'Hippoglossus hippoglossus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601381, 'Haddock', 'Melanogrammus aeglefinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601382, 'Lemon sole', 'Microstomus kitt');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601383, 'Blue ling', 'Molva dypterygia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601385, 'Flame snapper', 'Etelis coruscans');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601391, 'Queen snapper', 'Etelis oculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601403, 'Mutton snapper', 'Lutjanus analis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601404, 'Schoolmaster snapper', 'Lutjanus apodus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601406, 'Crimson snapper', 'Lutjanus erythropterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601407, 'Mangrove red snapper', 'Lutjanus argentimaculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601408, 'Yellow snapper', 'Lutjanus argentiventris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601417, 'Two-spot red snapper', 'Lutjanus bohar');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601423, 'Northern red snapper', 'Lutjanus campechanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601427, 'Cubera snapper', 'Lutjanus cyanopterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601450, 'Common carp', 'Cyprinus carpio carpio');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601452, 'Whitefin wolf-herring', 'Chirocentrus nudus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601453, 'Rainbow sardine', 'Dussumieria acuta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601454, 'Slender rainbow sardine', 'Dussumieria elopsoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601455, 'Round herring', 'Etrumeus teres');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601456, 'Whiteheads round herring', 'Etrumeus whiteheadi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601457, 'Delicate round herring', 'Spratelloides delicatulus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601458, 'Silverstriped round herring', 'Spratelloides gracilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601466, 'Falkland sprat', 'Sprattus fuegensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601470, 'Black Sea sprat', 'Clupeonella cultriventris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601471, 'Anchovy sprat', 'Clupeonella engrauliformis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601477, 'South American pilchard', 'Sardinops sagax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601478, 'False herring', 'Harengula clupeola');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601479, 'Redear herring', 'Harengula humeralis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601480, 'Scaled herring', 'Harengula jaguana');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601484, 'Pacific thread herring', 'Opisthonema libertate');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601486, 'Atlantic thread herring', 'Opisthonema oglinum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601494, 'Bluestripe herring', 'Herklotsichthys quadrimaculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601501, 'Spotted sardinella', 'Amblygaster sirm');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601505, 'Brazilian sardinella', 'Sardinella janeiro');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601507, 'Fringescale sardinella', 'Sardinella fimbriata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601508, 'Goldstripe sardinella', 'Sardinella gibbosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601510, 'Bali sardinella', 'Sardinella lemuru');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601511, 'Indian oil sardine', 'Sardinella longiceps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601519, 'Japanese sardinella', 'Sardinella zunasi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601520, 'Pacific herring', 'Clupea pallasii pallasii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601530, 'Araucanian herring', 'Strangomera bentincki');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601574, 'Blueback shad', 'Alosa aestivalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601582, 'Hickory shad', 'Alosa mediocris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601583, 'Alewife', 'Alosa pseudoharengus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601584, 'American shad', 'Alosa sapidissima');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601587, 'Brazilian menhaden', 'Brevoortia aurea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601589, 'Gulf menhaden', 'Brevoortia patronus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601590, 'Argentine menhaden', 'Brevoortia pectinata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601592, 'Atlantic menhaden', 'Brevoortia tyrannus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601593, 'Pacific menhaden', 'Ethmidium maculatum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601594, 'Bonga shad', 'Ethmalosa fimbriata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601595, 'Kelee shad', 'Hilsa kelee');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601596, 'Hilsa shad', 'Tenualosa ilisha');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601600, 'Toli shad', 'Tenualosa toli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601604, 'American gizzard shad', 'Dorosoma cepedianum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601608, 'Chinese gizzard shad', 'Clupanodon thrissa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601609, 'Konoshiro gizzard shad', 'Konosirus punctatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601616, 'Blochs gizzard shad', 'Nematalosa nasus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601619, 'Chacunda gizzard shad', 'Anodontostoma chacunda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601625, 'West African ilisha', 'Ilisha africana');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601627, 'Elongate ilisha', 'Ilisha elongata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601641, 'Indian pellona', 'Pellona ditchela');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601655, 'Guiana longfin herring', 'Odontognathus mucronatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601659, 'Argentine anchoita', 'Engraulis anchoita');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601661, 'Cape anchovy', 'Engraulis capensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601663, 'Japanese anchovy', 'Engraulis japonicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601664, 'Californian anchovy', 'Engraulis mordax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601684, 'Bermuda anchovy', 'Anchoa choerostoma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601692, 'Swallowtail seaperch', 'Anthias anthias');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601696, 'Big-scale sand smelt', 'Atherina boyeri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601706, 'Damselfish', 'Chromis chromis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601707, 'Brown meagre', 'Sciaena umbra');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601722, 'Large-scaled gurnard', 'Lepidotrigla cavillone');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601729, 'Mediterranean moray', 'Muraena helena');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601730, 'Brown moray', 'Gymnothorax unicolor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601732, 'Ocean sunfish', 'Mola mola');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601734, 'Common mora', 'Mora moro');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601735, 'Golden grey mullet', 'Liza aurata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601736, 'Leaping mullet', 'Liza saliens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601747, 'Forkbeard', 'Phycis phycis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601749, 'Sharpsnout seabream', 'Diplodus puntazzo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601752, 'Annular seabream', 'Diplodus annularis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601753, 'White seabream', 'Diplodus sargus sargus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601754, 'Common two-banded seabream', 'Diplodus vulgaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601756, 'Common seabream', 'Pagrus pagrus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601758, 'Black scorpionfish', 'Scorpaena porcus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601759, 'Largescaled scorpionfish', 'Scorpaena scrofa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601765, 'European barracuda', 'Sphyraena sphyraena');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601766, 'Picarel', 'Spicara smaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601773, 'Derbio', 'Trachinotus ovatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601779, 'Atlantic stargazer', 'Uranoscopus scaber');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601800, 'Monrovia doctorfish', 'Acanthurus monroviae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601825, 'Blue grenadier', 'Macruronus novaezelandiae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601826, 'Deep-water Cape hake', 'Merluccius paradoxus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601827, 'Panama hake', 'Merluccius angustimanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601828, 'Shallow-water Cape hake', 'Merluccius capensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601832, 'Striped large-eye bream', 'Gnathodentex aureolineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601833, 'Grey large-eye bream', 'Gymnocranius griseus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601834, 'Blue-lined large-eye bream', 'Gymnocranius grandoculis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601837, 'Japanese large-eye bream', 'Gymnocranius euanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601839, 'Blue-spotted large-eye bream', 'Gymnocranius microdon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601842, 'Longfin emperor', 'Lethrinus erythropterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601843, 'Sky emperor', 'Lethrinus mahsena');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601844, 'Snubnose emperor', 'Lethrinus borbonicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601845, 'Smalltooth emperor', 'Lethrinus microdon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601846, 'Spangled emperor', 'Lethrinus nebulosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601847, 'Orange-striped emperor', 'Lethrinus obsoletus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601848, 'Spotcheek emperor', 'Lethrinus rubrioperculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601849, 'Black blotch emperor', 'Lethrinus semicinctus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601850, 'Slender emperor', 'Lethrinus variegatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601851, 'Thumbprint emperor', 'Lethrinus harak');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601852, 'Yellowlip emperor', 'Lethrinus xanthochilus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601853, 'Ambon emperor', 'Lethrinus amboinensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601854, 'Pacific yellowtail emperor', 'Lethrinus atkinsoni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601858, 'Trumpet emperor', 'Lethrinus miniatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601862, 'Orange-spotted emperor', 'Lethrinus erythracanthus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601863, 'Pink ear emperor', 'Lethrinus lentjan');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601864, 'Longface emperor', 'Lethrinus olivaceus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601866, 'Ornate emperor', 'Lethrinus ornatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601867, 'Atlantic emperor', 'Lethrinus atlanticus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601869, 'Humpnose big-eye bream', 'Monotaxis grandoculis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601870, 'Mozambique large-eye bream', 'Wattsia mossambica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601874, 'Fourbeard rockling', 'Enchelyopus cimbrius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601879, 'Pacific tomcod', 'Microgadus proximus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601886, 'Three-stripe fusilier', 'Pterocaesio trilineata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601888, 'African threadfish', 'Alectis alexandrinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601889, 'Shrimp scad', 'Alepes djedaba');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601893, 'Yellowtail scad', 'Atule mate');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601895, 'Giant trevally', 'Caranx ignobilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601899, 'False scad', 'Caranx rhonchus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601906, 'Bluefin trevally', 'Caranx melampygus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601907, 'Bumpnose trevally', 'Carangoides hedlandensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601909, 'Island trevally', 'Carangoides orthogrammus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601910, 'Barcheek trevally', 'Carangoides plagiotaenia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601916, 'Longfin trevally', 'Carangoides armatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601917, 'Bigeye trevally', 'Caranx sexfasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601918, 'Bar jack', 'Carangoides ruber');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601921, 'Blue trevally', 'Carangoides ferdau');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601923, 'Orangespotted trevally', 'Carangoides bajad');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601924, 'Coastal trevally', 'Carangoides coeruleopinnatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601926, 'Yellowspotted trevally', 'Carangoides fulvoguttatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601931, 'Silvermouth trevally', 'Ulua aurochs');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601933, 'Blue runner', 'Caranx crysos');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601935, 'Horse-eye jack', 'Caranx latus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601936, 'Black jack', 'Caranx lugubris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601937, 'Pacific bumper', 'Chloroscombrus orqueta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601938, 'Shortfin scad', 'Decapterus macrosoma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601939, 'Japanese scad', 'Decapterus maruadsi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601947, 'Black pomfret', 'Parastromateus niger');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601950, 'Talang queenfish', 'Scomberoides commersonnianus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601951, 'Doublespotted queenfish', 'Scomberoides lysan');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601953, 'Needlescaled queenfish', 'Scomberoides tol');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601954, 'Oxeye scad', 'Selar boops');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601956, 'Hairfin lookdown', 'Selene brevoortii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601962, 'Blackbanded trevally', 'Seriolina nigrofasciata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601963, 'Snubnose pompano', 'Trachinotus blochii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601964, 'Indian pompano', 'Trachinotus mookalee');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601978, 'Smallspotted dart', 'Trachinotus baillonii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601983, 'Whitemouth jack', 'Uraspis helvola');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (601984, 'Whitetongue jack', 'Uraspis uraspis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602005, 'Blue antimora', 'Antimora rostrata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602012, 'Slender codling', 'Halargyreus johnsonii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602014, 'Longfin codling', 'Laemonema longipes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602020, 'Red codling', 'Pseudophycis bachus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602023, 'Grenadier cod', 'Tripterophycis gilchristi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602058, 'Blue skate', 'Dipturus batis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602059, 'Thornback ray', 'Raja clavata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602060, 'Common stingray', 'Dasyatis pastinaca');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602065, 'Starry sturgeon', 'Acipenser stellatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602066, 'Sturgeon', 'Acipenser sturio');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602067, 'Beluga', 'Huso huso');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602081, 'Whale shark', 'Rhincodon typus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602083, 'Brown trout', 'Salmo trutta fario');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602300, 'Clown triggerfish', 'Balistoides conspicillum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602420, 'Three-spined stickleback', 'Gasterosteus aculeatus aculeatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602467, 'Live sharksucker', 'Echeneis naucrates');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602497, 'Zebra seabream', 'Diplodus cervinus cervinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602498, 'Bermuda sea chub', 'Kyphosus saltatrix');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602499, 'Thicklip grey mullet', 'Chelon labrosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602500, 'Ornate wrasse', 'Thalassoma pavo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602501, 'Wolf-fish', 'Anarhichas lupus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602503, 'Rabbit fish', 'Chimaera monstrosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602508, 'Bulls-eye', 'Epigonus telescopus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602513, 'Hagfish', 'Myxine glutinosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602530, 'Sea lamprey', 'Petromyzon marinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602531, 'Broadnose sevengill shark', 'Notorynchus cepedianus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602532, 'Nurse shark', 'Ginglymostoma cirratum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602534, 'Bigeye thresher', 'Alopias superciliosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602535, 'Thintail thresher', 'Alopias vulpinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602536, 'False catshark', 'Pseudotriakis microdon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602540, 'Brown smooth-hound', 'Mustelus henlei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602544, 'Pacific sleeper shark', 'Somniosus pacificus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602557, 'Little skate', 'Leucoraja erinacea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602561, 'Barndoor skate', 'Dipturus laevis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602570, 'Starry skate', 'Raja stellulata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602572, 'Roughtail stingray', 'Dasyatis centroura');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602577, 'Spiny butterfly ray', 'Gymnura altavela');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602579, 'Smooth butterfly ray', 'Gymnura micrura');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602589, 'Spotted ratfish', 'Hydrolagus colliei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602592, 'Green sturgeon', 'Acipenser medirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602594, 'White sturgeon', 'Acipenser transmontanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602661, 'Spiny eel', 'Notacanthus chemnitzii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602669, 'Arctic cisco', 'Coregonus autumnalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602674, 'Broad whitefish', 'Coregonus nasus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602676, 'Humpback whitefish', 'Coregonus pidschian');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602678, 'Sardine cisco', 'Coregonus sardinella');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602691, 'Dolly varden', 'Salvelinus malma malma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602692, 'Inconnu', 'Stenodus leucichthys');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602700, 'Greater argentine', 'Argentina silus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602801, 'Orfe', 'Leuciscus idus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (602951, 'Rudd', 'Scardinius erythrophthalmus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603249, 'Longjaw squirrelfish', 'Neoniphon marianus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603255, 'Mirror dory', 'Zenopsis nebulosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603265, 'Dealfish', 'Trachipterus arcticus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603267, 'King of herrings', 'Regalecus glesne');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603275, 'Cornet fish', 'Fistularia tabacaria');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603310, 'Giant sea-bass', 'Stereolepis gigas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603334, 'Broomtail grouper', 'Mycteroperca xenarcha');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603539, 'Ocean whitefish', 'Caulolatilus princeps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603542, 'Cobia', 'Rachycentron canadum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603561, 'Sickle pomfret', 'Taractichthys steindachneri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603565, 'Graceful mojarra', 'Eucinostomus gracilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603572, 'Boga', 'Haemulon vittata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603574, 'South American silver porgy', 'Diplodus argenteus argenteus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603578, 'White weakfish', 'Atractoscion nobilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603594, 'Opaleye', 'Girella nigricans');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603599, 'Pacific spadefish', 'Chaetodipterus zonatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603611, 'Pelagic armorhead', 'Pseudopentaceros richardsoni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603671, 'California sheephead', 'Semicossyphus pulcher');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603672, 'Cunner', 'Tautogolabrus adspersus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603680, 'Blue bobo', 'Polydactylus approximans');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603810, 'Northern wolffish', 'Anarhichas denticulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603811, 'Spotted wolffish', 'Anarhichas minor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603915, 'Shortbill spearfish', 'Tetrapturus angustirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603920, 'Black driftfish', 'Hyperoglyphe bythites');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603923, 'Harvestfish', 'Peprilus alepidotus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603971, 'Chilipepper', 'Sebastes goodei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603979, 'Black rockfish', 'Sebastes melanops');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603987, 'Bocaccio', 'Sebastes paucispinis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (603989, 'Canary rockfish', 'Sebastes pinniger');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604009, 'Shortspine thornyhead', 'Sebastolobus alascanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604011, 'Atlantic thornyhead', 'Trachyscorpia cristulata cristulata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604014, 'Horned searobin', 'Bellator militaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604025, 'Blackwing searobin', 'Prionotus rubio');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604029, 'Lumptail searobin', 'Prionotus stephanophrys');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604037, 'Atka mackerel', 'Pleurogrammus monopterygius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604122, 'Fourhorn sculpin', 'Triglopsis quadricornis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604140, 'Cabezon', 'Scorpaenichthys marmoratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604215, 'Pacific sanddab', 'Citharichthys sordidus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604228, 'California flounder', 'Paralichthys californicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604237, 'Petrale sole', 'Eopsetta jordani');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604238, 'Rex sole', 'Glyptocephalus zachirus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604239, 'American plaice', 'Hippoglossoides platessoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604247, 'Dover sole', 'Microstomus pacificus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604248, 'English sole', 'Parophrys vetulus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604249, 'Starry flounder', 'Platichthys stellatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604250, 'Alaska plaice', 'Pleuronectes quadrituberculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604252, 'Curlfin sole', 'Pleuronichthys decurrens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604255, 'West American sand sole', 'Psettichthys melanostictus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604275, 'Scrawled filefish', 'Aluterus scriptus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604278, 'Ocean triggerfish', 'Canthidermis maculata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604279, 'Ocean triggerfish', 'Canthidermis sufflamen');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604304, 'Grey bambooshark', 'Chiloscyllium griseum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604306, 'Achilles tang', 'Acanthurus achilles');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604313, 'Normans camote', 'Normanichthys crockeri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604318, 'Velvet whalefish', 'Barbourisia rufa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604326, 'Cuckoo ray', 'Leucoraja naevus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604329, 'Spotted ray', 'Raja montagui');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604330, 'Common eagle ray', 'Myliobatis aquila');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604333, 'Greater eelpout', 'Lycodes esmarkii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604340, 'Whitebar gregory', 'Stegastes albifasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604351, 'Blunt snout gregory', 'Stegastes lividus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604355, 'Carolines parrotfish', 'Calotomus carolinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604357, 'Spinytooth parrotfish', 'Calotomus spinidens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604360, 'Marbled parrotfish', 'Leptoscarus vaigiensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604443, 'Malabar trevally', 'Carangoides malabaricus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604445, 'Sulphur goatfish', 'Upeneus sulphureus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604451, 'Common ponyfish', 'Leiognathus equulus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604456, 'White-spotted spinefoot', 'Siganus canaliculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604457, 'Little spinefoot', 'Siganus spinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604458, 'Jarbua terapon', 'Terapon jarbua');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604460, 'Brown-marbled grouper', 'Epinephelus fuscoguttatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604461, 'Greasy grouper', 'Epinephelus tauvina');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604462, 'Toothpony', 'Gazza minuta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604464, 'Golden trevally', 'Gnathanodon speciosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604465, 'Painted sweetlips', 'Diagramma picta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604466, 'Yellow-spotted triggerfish', 'Pseudobalistes fuscus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604474, 'Ruffe', 'Gymnocephalus cernua');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604485, 'Oriental flying gurnard', 'Dactyloptena orientalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604493, 'Obtuse barracuda', 'Sphyraena obtusata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604499, 'Sobaity seabream', 'Sparidentex hasta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604504, 'Spottail spiny turbot', 'Psettodes belcheri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604505, 'Threetooth puffer', 'Triodon macropterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604508, 'Bluespotted stingray', 'Neotrygon kuhlii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604534, 'Gracile lizardfish', 'Saurida gracilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604536, 'Pink dentex', 'Dentex gibbosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604538, 'Morocco dentex', 'Dentex maroccanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604539, 'Canary dentex', 'Dentex canariensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604540, 'Bluespotted seabream', 'Pagrus caeruleostictus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604543, 'Twobar seabream', 'Acanthopagrus bifasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604544, 'Silver sillago', 'Sillago sihama');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604548, 'Canary drum', 'Umbrina canariensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604552, 'Blonde ray', 'Raja brachyura');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604556, 'Roughsnout grenadier', 'Trachyrincus scabrus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604559, 'Japanese threadfin bream', 'Nemipterus japonicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604561, 'Vermiculated spinefoot', 'Siganus vermiculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604569, 'Mi-iuy croaker', 'Miichthys miiuy');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604581, 'Pearly razorfish', 'Xyrichtys novacula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604582, 'Brown wrasse', 'Labrus merula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604583, 'Thinlip grey mullet', 'Liza ramada');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604588, 'Goldlined spinefoot', 'Siganus guttatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604589, 'Japanese seaperch', 'Lateolabrax japonicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604597, 'False kelpfish', 'Sebastiscus marmoratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604598, 'Red gurnard', 'Chelidonichthys spinosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604599, 'Rosy seabass', 'Doederleinia berycoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604604, 'Sterlet', 'Acipenser ruthenus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604611, 'Blue-spotted spinefoot', 'Siganus corallinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604613, 'Dusky spinefoot', 'Siganus luridus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604614, 'Streamlined spinefoot', 'Siganus argenteus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604615, 'Shoemaker spinefoot', 'Siganus sutor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604620, 'Peppered spinefoot', 'Siganus punctatissimus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604621, 'Goldspotted spinefoot', 'Siganus punctatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604625, 'Golden-lined spinefoot', 'Siganus lineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604626, 'Variegated spinefoot', 'Siganus randalli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604641, 'Congo dentex', 'Dentex congoensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604642, 'Tope shark', 'Galeorhinus galeus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604683, 'Siberian sturgeon', 'Acipenser baerii baerii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604698, 'Spotted scat', 'Scatophagus argus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604699, 'Crown squirrelfish', 'Sargocentron diadema');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604702, 'Yellowbelly rockcod', 'Notothenia coriiceps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604706, 'Striped eel catfish', 'Plotosus lineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604708, 'Sompat grunt', 'Pomadasys jubelini');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604712, 'Russian sturgeon', 'Acipenser gueldenstaedtii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604722, 'Ghost shark', 'Callorhinchus milii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604733, 'Bluelined surgeon', 'Acanthurus nubilus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604736, 'Whitespotted surgeonfish', 'Acanthurus guttatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604739, 'Brown surgeonfish', 'Acanthurus nigrofuscus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604740, 'Sohal surgeonfish', 'Acanthurus sohal');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604742, 'Chocolate surgeonfish', 'Acanthurus pyroferus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604744, 'Orangespot surgeonfish', 'Acanthurus olivaceus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604746, 'White freckled surgeonfish', 'Acanthurus maculiceps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604747, 'Epaulette surgeonfish', 'Acanthurus nigricauda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604750, 'Ringtail surgeonfish', 'Acanthurus blochii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604783, 'Asp', 'Aspius aspius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604791, 'So-iuy mullet', 'Mugil soiuy');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604796, 'Pacific bonito', 'Sarda chiliensis lineolata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604821, 'Yellowstriped goatfish', 'Upeneus vittatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604824, 'Tiger-toothed croaker', 'Otolithes ruber');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604826, 'Leopard coralgrouper', 'Plectropomus leopardus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604827, 'Pickhandle barracuda', 'Sphyraena jello');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604887, 'Blotched picarel', 'Spicara maena');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604888, 'Bluespotted wrasse', 'Anampses caeruleopunctatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604905, 'Undulated moray', 'Gymnothorax undulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604906, 'Speckled squirrelfish', 'Sargocentron punctatissimum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604907, 'Silverspot squirrelfish', 'Sargocentron caudimaculatum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604908, 'Bluelined squirrelfish', 'Sargocentron tiere');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604909, 'Violet squirrelfish', 'Sargocentron violaceum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604910, 'Blotcheye soldierfish', 'Myripristis berndti');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604911, 'Sammara squirrelfish', 'Neoniphon sammara');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604913, 'Radial firefish', 'Pterois radiata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604921, 'False stonefish', 'Scorpaenopsis diabolus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604923, 'Honeycomb grouper', 'Epinephelus merra');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604925, 'Goldenstriped soapfish', 'Grammistes sexlineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604943, 'Atlantic spotted flounder', 'Citharus linguatula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604959, 'West African ladyfish', 'Elops lacerta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604961, 'Dungat grouper', 'Epinephelus goreensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604964, 'Mediterranean slimehead', 'Hoplostethus mediterraneus mediterraneus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604969, 'Rivulated parrotfish', 'Scarus rivulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604970, 'Globehead parrotfish', 'Scarus globiceps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604973, 'Yellowbarred parrotfish', 'Scarus dimidiatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604975, 'Yellowband parrotfish', 'Scarus schlegeli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604984, 'Blackspotted wrasse', 'Macropharyngodon meleagris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604988, 'Shortspine African angler', 'Lophius vaillanti');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604996, 'Smooth-hound', 'Mustelus mustelus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (604997, 'Common Atlantic grenadier', 'Nezumia aequalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605002, 'Giant African threadfin', 'Polydactylus quadrifilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605003, 'Bastard grunt', 'Pomadasys incisus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605007, 'Offshore rockfish', 'Pontinus kuhlii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605008, 'Roudi escolar', 'Promethichthys prometheus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605009, 'Law croaker', 'Pseudotolithus senegallus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605014, 'Brown ray', 'Raja miraletus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605038, 'Piper gurnard', 'Trigla lyra');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605048, 'Eastern Australian salmon', 'Arripis trutta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605066, 'Redbanded seabream', 'Pagrus auriga');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605068, 'Spiny turbot', 'Psettodes bennettii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605071, 'Rissos smooth-head', 'Alepocephalus rostratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605081, 'Streaked gurnard', 'Trigloporus lastoviza');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605094, 'Black-bellied angler', 'Lophius budegassa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605098, 'Borostomias antarcticus', 'Borostomias antarcticus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605109, 'Tubelip wrasse', 'Labrichthys unilineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605110, 'Whitetail dascyllus', 'Dascyllus aruanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605112, 'Threespot dascyllus', 'Dascyllus trimaculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605122, 'Yellowing flyingfish', 'Cypselurus poecilopterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605133, 'Pike icefish', 'Champsocephalus esox');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605158, 'Hong Kong grouper', 'Epinephelus akaara');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605188, 'Puntius katolo', 'Puntius katolo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605195, 'Red lionfish', 'Pterois volitans');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605345, 'Blackblotch squirrelfish', 'Sargocentron melanospilos');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605348, 'Blacktip grouper', 'Epinephelus fasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605350, 'Highfin grouper', 'Epinephelus maculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605353, 'Comet grouper', 'Epinephelus morrhua');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605354, 'Yellow-edged lyretail', 'Variola louti');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605355, 'Twaite shad', 'Alosa fallax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605366, 'Garish hind', 'Cephalopholis igarashiensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605367, 'Areolate grouper', 'Epinephelus areolatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605368, 'Goldlined seabream', 'Rhabdosargus sarba');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605376, 'Marble goby', 'Oxyeleotris marmorata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605382, 'Cape horse mackerel', 'Trachurus capensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605388, 'Snowflake moray', 'Echidna nebulosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605389, 'Barred moray', 'Echidna polyzona');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605392, 'Yellow-edged moray', 'Gymnothorax flavimarginatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605393, 'Blotch-necked moray', 'Gymnothorax margaritophorus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605394, 'Turkey moray', 'Gymnothorax meleagris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605396, 'Banded moray', 'Gymnothorax rueppellii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605398, 'Variegated lizardfish', 'Synodus variegatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605402, 'Scarlet frogfish', 'Antennarius coccineus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605404, 'Black-barred halfbeak', 'Hemiramphus far');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605406, 'Threespot squirrelfish', 'Sargocentron cornutum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605408, 'Pinecone soldierfish', 'Myripristis murdjan');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605425, 'White-spotted puffer', 'Arothron hispidus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605429, 'Lusitanian toadfish', 'Halobatrachus didactylus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605444, 'Bluespotted cornetfish', 'Fistularia commersonii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605457, 'Lemonpeel angelfish', 'Centropyge flavissima');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605459, 'Bluestreak cleaner wrasse', 'Labroides dimidiatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605477, 'Staghorn damselfish', 'Amblyglyphidodon curacao');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605482, 'Fivelined cardinalfish', 'Cheilodipterus quinquelineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605492, 'Small-eyed ray', 'Raja microocellata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605498, 'Axilspot hogfish', 'Bodianus axillaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605503, 'Giant guitarfish', 'Rhynchobatus djiddensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605504, 'Cape gurnard', 'Chelidonichthys capensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605524, 'Brownspotted grouper', 'Epinephelus chlorostigma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605526, 'Picnic seabream', 'Acanthopagrus berda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605537, 'Green humphead parrotfish', 'Bolbometopon muricatum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605538, 'Bicolour parrotfish', 'Cetoscarus bicolor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605539, 'Pacific longnose parrotfish', 'Hipposcarus longiceps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605540, 'Filament-finned parrotfish', 'Scarus altipinnis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605544, 'Festive parrotfish', 'Scarus festivus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605545, 'Forstens parrotfish', 'Scarus forsteni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605546, 'Bridled parrotfish', 'Scarus frenatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605547, 'Tan-faced parrotfish', 'Chlorurus frontalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605548, 'Blue-barred parrotfish', 'Scarus ghobban');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605550, 'Dusky parrotfish', 'Scarus niger');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605551, 'Darkcapped parrotfish', 'Scarus oviceps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605553, 'Common parrotfish', 'Scarus psittacus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605555, 'Ember parrotfish', 'Scarus rubroviolaceus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605556, 'Daisy parrotfish', 'Chlorurus sordidus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605557, 'Threadfin butterflyfish', 'Chaetodon auriga');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605559, 'Bluelashed butterflyfish', 'Chaetodon bennetti');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605561, 'Speckled butterflyfish', 'Chaetodon citrinellus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605562, 'Saddle butterflyfish', 'Chaetodon ephippium');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605564, 'Lined butterflyfish', 'Chaetodon lineolatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605565, 'Raccoon butterflyfish', 'Chaetodon lunula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605566, 'Blackback butterflyfish', 'Chaetodon melannotus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605567, 'Atoll butterflyfish', 'Chaetodon mertensii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605572, 'Fourspot butterflyfish', 'Chaetodon quadrimaculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605574, 'Mailed butterflyfish', 'Chaetodon reticulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605578, 'Chevron butterflyfish', 'Chaetodon trifascialis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605580, 'Pacific doublesaddle butterflyfish', 'Chaetodon ulietensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605581, 'Teardrop butterflyfish', 'Chaetodon unimaculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605584, 'Longnose butterfly fish', 'Forcipiger flavissimus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605586, 'Pyramid butterflyfish', 'Hemitaurichthys polylepis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605588, 'Pennant coralfish', 'Heniochus acuminatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605589, 'Threeband pennantfish', 'Heniochus chrysostomus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605590, 'Masked bannerfish', 'Heniochus monoceros');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605591, 'Singular bannerfish', 'Heniochus singularius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605595, 'Speckled maori wrasse', 'Oxycheilinus arenatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605597, 'Celebes wrasse', 'Oxycheilinus celebicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605598, 'Floral wrasse', 'Cheilinus chlorourus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605599, 'Cheeklined wrasse', 'Oxycheilinus digramma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605600, 'Redbreast wrasse', 'Cheilinus fasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605601, 'Oriental maori wrasse', 'Oxycheilinus orientalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605603, 'Tripletail wrasse', 'Cheilinus trilobatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605604, 'Humphead wrasse', 'Cheilinus undulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605605, 'Ringtail maori wrasse', 'Oxycheilinus unifasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605606, 'Slingjaw wrasse', 'Epibulus insidiator');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605607, 'Knife razorfish', 'Cymolutes praetextatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605610, 'Rockmover wrasse', 'Novaculichthys taeniourus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605611, 'Yellowblotch razorfish', 'Iniistius aneitensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605613, 'Peacock wrasse', 'Iniistius pavo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605621, 'Sneaky wrasse', 'Pteragogus guttatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605623, 'Cigar wrasse', 'Cheilio inermis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605624, 'Clown coris', 'Coris aygula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605626, 'Bird wrasse', 'Gomphosus varius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605627, 'Redlined wrasse', 'Halichoeres biocellatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605630, 'Pink-belly wrasse', 'Halichoeres margaritaceus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605631, 'Dusky wrasse', 'Halichoeres marginatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605632, 'Richmonds wrasse', 'Halichoeres richmondi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605634, 'Threespot wrasse', 'Halichoeres trimaculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605635, 'Barred thicklip', 'Hemigymnus fasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605636, 'Blackeye thicklip', 'Hemigymnus melapterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605638, 'Pastel ringwrasse', 'Hologymnosus doliatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605640, 'Red shoulder wrasse', 'Stethojulis bandanensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605643, 'Sixbar wrasse', 'Thalassoma hardwicke');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605645, 'Moon wrasse', 'Thalassoma lunare');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605646, 'Yellow-brown wrasse', 'Thalassoma lutescens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605647, 'Surge wrasse', 'Thalassoma purpureum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605648, 'Fivestripe wrasse', 'Thalassoma quinquevittatum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605649, 'Christmas wrasse', 'Thalassoma trilobatum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605652, 'Acute-jawed mullet', 'Neomyxus leuciscus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605653, 'Fringelip mullet', 'Crenimugil crenilabis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605656, 'Squaretail mullet', 'Liza vaigiensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605658, 'Kanda', 'Valamugil engeli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605659, 'Bluespot mullet', 'Valamugil seheli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605675, 'Bicolor chromis', 'Chromis margaritifer');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605677, 'Ternate chromis', 'Chromis ternatensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605679, 'Blue-green damselfish', 'Chromis viridis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605687, 'Banded sergeant', 'Abudefduf septemfasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605688, 'Scissortail sergeant', 'Abudefduf sexfasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605689, 'Blackspot sergeant', 'Abudefduf sordidus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605693, 'Twinspot damselfish', 'Chrysiptera biocellata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605696, 'Grey demoiselle', 'Chrysiptera glauca');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605712, 'Whitespotted devil', 'Plectroglyphidodon lacrymatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605713, 'Singlebar devil', 'Plectroglyphidodon leucozonus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605715, 'Ambon damsel', 'Pomacentrus amboinensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605726, 'Sapphire damsel', 'Pomacentrus pavo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605730, 'Ocellate damselfish', 'Pomacentrus vaiuli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605733, 'Sharpfin barracuda', 'Sphyraena acutipinnis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605734, 'Bigeye barracuda', 'Sphyraena forsteri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605736, 'Australian barracuda', 'Sphyraena novaehollandiae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605737, 'Orbicular batfish', 'Platax orbicularis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605738, 'Dusky batfish', 'Platax pinnatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605739, 'Tiera batfish', 'Platax teira');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605740, 'Ocellated cardinalfish', 'Apogonichthys ocellatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605748, 'Three-spot cardinalfish', 'Apogon trimaculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605752, 'Ruby cardinalfish', 'Apogon coccineus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605756, 'Narrowstripe cardinalfish', 'Apogon exostigma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605758, 'Iridescent cardinalfish', 'Apogon kallopterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605761, 'Humpback cardinal', 'Ostorhinchus lateralis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605763, 'Bigeye cardinalfish', 'Nectamia bandanensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605764, 'Samoan cardinalfish', 'Nectamia savayensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605765, 'Guam cardinalfish', 'Apogon guamensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605766, 'Broadstriped cardinalfish', 'Apogon angustatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605767, 'Reef-flat cardinalfish', 'Apogon taeniophorus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605768, 'Sevenstriped cardinalfish', 'Apogon novemfasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605772, 'Gilberts cardinalfish', 'Zoramia gilberti');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605774, 'Pearly cardinalfish', 'Zoramia perlita');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605780, 'Wolf cardinalfish', 'Cheilodipterus artus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605781, 'Largetoothed cardinalfish', 'Cheilodipterus macrodon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605782, 'Truncate cardinalfish', 'Cheilodipterus singapurensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605790, 'Barred flagtail', 'Kuhlia mugil');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605791, 'Moontail bullseye', 'Priacanthus hamrur');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605795, 'Quakerfish', 'Malacanthus brevirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605796, 'Blue blanquillo', 'Malacanthus latovittatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605797, 'Smalltoothed ponyfish', 'Gazza achlamys');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605798, 'Oblong slipmouth', 'Equulites stercorarius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605799, 'Common mojarra', 'Gerres argyreus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605801, 'Slender silverbiddy', 'Gerres oblongus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605802, 'Silver sweeper', 'Pempheris oualensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605803, 'Pigmy sweeper', 'Parapriacanthus ransonneti');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605804, 'Grey sea chub', 'Kyphosus bigibbus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605805, 'Blue seachub', 'Kyphosus cinerascens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605806, 'Brassy chub', 'Kyphosus vaigiensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605807, 'Silver moony', 'Monodactylus argenteus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605814, 'Barchin scorpionfish', 'Sebastapistes strongia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605819, 'Guam scorpionfish', 'Scorpaenodes guamensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605820, 'Flasher scorpionfish', 'Scorpaenopsis macrochir');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605822, 'Tassled scorpionfish', 'Scorpaenopsis oxycephala');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605825, 'Stonefish', 'Synanceia verrucosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605831, 'Stocky hawkfish', 'Cirrhitus pinnulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605832, 'Flame hawkfish', 'Neocirrhites armatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605836, 'Whitespotted filefish', 'Cantherhines dumerilii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605838, 'Pinktail triggerfish', 'Melichthys vidua');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605839, 'White-banded triggerfish', 'Rhinecanthus aculeatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605840, 'Wedge-tail triggerfish', 'Rhinecanthus rectangulus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605841, 'Smallmouth squirrelfish', 'Sargocentron microstoma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605842, 'Halfmoon triggerfish', 'Sufflamen chrysopterum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605852, 'Randalls threadfin bream', 'Nemipterus randalli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605867, 'Small-toothed whiptail', 'Pentapodus caninus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605873, 'Three-striped whiptail', 'Pentapodus trivittatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605877, 'Striped monocle bream', 'Scolopsis lineata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605885, 'Two-lined monocle bream', 'Scolopsis bilineata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605889, 'Black-streaked monocle bream', 'Scolopsis taeniata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605891, 'Pelagic thresher', 'Alopias pelagicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605895, 'Tawny nurse shark', 'Nebrius ferrugineus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605933, 'Spotted estuary smooth-hound', 'Mustelus lenticulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605937, 'Narrownose smooth-hound', 'Mustelus schmitti');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605938, 'Starry smooth-hound', 'Mustelus asterias');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605950, 'Moorish idol', 'Zanclus cornutus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605952, 'Blackside hawkfish', 'Paracirrhites forsteri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605953, 'Whitespot hawkfish', 'Paracirrhites hemistictus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605961, 'Scribbled pipefish', 'Corythoichthys intestinalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605983, 'Yellowstripe goatfish', 'Mulloidichthys flavolineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605984, 'Yellowfin goatfish', 'Mulloidichthys vanicolensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605985, 'Orange goatfish', 'Mulloidichthys pfluegeri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605986, 'Bicolor goatfish', 'Parupeneus barberinoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605987, 'Dash-and-dot goatfish', 'Parupeneus barberinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605988, 'Doublebar goatfish', 'Parupeneus trifasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605989, 'Whitesaddle goatfish', 'Parupeneus ciliatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605990, 'Goldsaddle goatfish', 'Parupeneus cyclostomus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605991, 'Cinnabar goatfish', 'Parupeneus heptacanthus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605992, 'Indian goatfish', 'Parupeneus indicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605993, 'Manybar goatfish', 'Parupeneus multifasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605994, 'Sidespot goatfish', 'Parupeneus pleurostigma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605995, 'Finstripe goatfish', 'Upeneus taeniopterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (605996, 'Common silver-biddy', 'Gerres oyena');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606006, 'Javelin grunter', 'Pomadasys kaakan');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606011, 'Whitecheek surgeonfish', 'Acanthurus nigricans');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606012, 'Twospot surgeonfish', 'Ctenochaetus binotatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606017, 'Palette surgeonfish', 'Paracanthurus hepatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606018, 'Yellow tang', 'Zebrasoma flavescens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606019, 'Whitemargin unicornfish', 'Naso annulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606020, 'Humpback unicornfish', 'Naso brachycentron');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606021, 'Spotted unicornfish', 'Naso brevirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606023, 'Humpnose unicornfish', 'Naso tuberosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606024, 'Bignose unicornfish', 'Naso vlamingii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606025, 'Orange-lined triggerfish', 'Balistapus undulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606026, 'Titan triggerfish', 'Balistoides viridescens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606027, 'Yellowmargin triggerfish', 'Pseudobalistes flavimarginatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606028, 'Blackbelly triggerfish', 'Rhinecanthus verrucosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606029, 'Boomerang triggerfish', 'Sufflamen bursa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606030, 'Gilded triggerfish', 'Xanthichthys auromarginatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606049, 'Rippled rockskipper', 'Istiblennius edentulus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606058, 'Jewelled blenny', 'Salarias fasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606082, 'Squaretail coralgrouper', 'Plectropomus areolatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606317, 'Totoaba', 'Totoaba macdonaldi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606356, 'Yellowfin seabream', 'Acanthopagrus latus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606358, 'Dorab wolf-herring', 'Chirocentrus dorab');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606359, 'Outrigger triggerfish', 'Xanthichthys caeruleolineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606360, 'Brassy trevally', 'Caranx papuensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606362, 'Two-stripe sweetlips', 'Plectorhinchus albovittatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606366, 'Harry hotlips', 'Plectorhinchus gibbosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606368, 'Giant sweetlips', 'Plectorhinchus obscurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606369, 'Oriental sweetlips', 'Plectorhinchus orientalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606370, 'Painted sweetlip', 'Plectorhinchus picus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606380, 'Giant moray', 'Gymnothorax javanicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606395, 'Peppered moray', 'Gymnothorax pictus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606396, 'Peacock hind', 'Cephalopholis argus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606399, 'Longhorn cowfish', 'Lactoria cornuta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606400, 'Blackspotted puffer', 'Arothron nigropunctatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606416, 'Sixfinger threadfin', 'Polydactylus sexfilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606422, 'Sailray', 'Dipturus linteus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606426, 'Squirefish', 'Pagrus auratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606438, 'Tricolour parrotfish', 'Scarus tricolor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606439, 'Malabar grouper', 'Epinephelus malabaricus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606440, 'Whitespotted grouper', 'Epinephelus coeruleopunctatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606441, 'Redmouth grouper', 'Aethaloperca rogaa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606444, 'Chocolate hind', 'Cephalopholis boenak');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606447, 'Yellowfin hind', 'Cephalopholis hemistiktos');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606448, 'Leopard hind', 'Cephalopholis leopardus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606450, 'Coral hind', 'Cephalopholis miniata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606452, 'Harlequin hind', 'Cephalopholis polleni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606453, 'Sixblotch hind', 'Cephalopholis sexmaculata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606454, 'Tomato hind', 'Cephalopholis sonnerati');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606455, 'Strawberry hind', 'Cephalopholis spiloparaea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606456, 'Darkfin hind', 'Cephalopholis urodeta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606457, 'Humpback grouper', 'Cromileptes altivelis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606465, 'Orange-spotted grouper', 'Epinephelus coioides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606466, 'Coral grouper', 'Epinephelus corallicola');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606468, 'Giant grouper', 'Epinephelus lanceolatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606470, 'Dusky grouper', 'Epinephelus marginatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606471, 'One-blotch grouper', 'Epinephelus melanostigma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606473, 'Camouflage grouper', 'Epinephelus polyphekadion');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606477, 'Masked grouper', 'Gracila albomarginata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606478, 'White-edged lyretail', 'Variola albimarginata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606479, 'Greater lizardfish', 'Saurida tumbil');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606482, 'Round ribbontail ray', 'Taeniura meyeni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606490, 'White-margined moray', 'Enchelycore schismatorhynchus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606495, 'Fimbriated moray', 'Gymnothorax fimbriatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606503, 'Razorfish', 'Aeoliscus strigatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606504, 'Emperor angelfish', 'Pomacanthus imperator');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606505, 'Whitetip soldierfish', 'Myripristis vittata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606506, 'Shadowfin soldierfish', 'Myripristis adusta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606507, 'Sabre squirrelfish', 'Sargocentron spiniferum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606526, 'Stellate puffer', 'Arothron stellatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606531, 'Black porgy', 'Acanthopagrus schlegelii schlegelii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606532, 'Barred knifejaw', 'Oplegnathus fasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606534, 'Korean rockfish', 'Sebastes schlegelii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606537, 'Girella punctata', 'Girella punctata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606550, 'Ornate butterflyfish', 'Chaetodon ornatissimus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606559, 'Harlequin filefish', 'Oxymonacanthus longirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606561, 'Latticed sandperch', 'Parapercis clathrata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606572, 'Royal angelfish', 'Pygoplites diacanthus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606574, 'Convict grouper', 'Hyporthodus septemfasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606575, 'Blueband goby', 'Valenciennea strigata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606578, 'Spotted sharpnose', 'Canthigaster solandri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606582, 'Black squirrelfish', 'Neoniphon opercularis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606630, 'Indo-Pacific sergeant', 'Abudefduf vaigiensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606635, 'Honeycomb filefish', 'Cantherhines pardalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606660, 'Starspotted grouper', 'Epinephelus hexagonatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606661, 'Snubnose grouper', 'Epinephelus macrospilos');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606670, 'Blackdotted sand perch', 'Parapercis millepunctata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606672, 'Broom filefish', 'Amanses scopas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606932, 'Oneknife unicornfish', 'Naso thynnoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606940, 'Yellowbanded sweetlips', 'Plectorhinchus lineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606948, 'Eatons skate', 'Bathyraja eatonii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606950, 'McCains skate', 'Bathyraja maccaini');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606951, 'Dark-belly skate', 'Bathyraja meridionalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606952, 'Murrays skate', 'Bathyraja murrayi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606953, 'Antarctic starry skate', 'Amblyraja georgiana');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606957, 'Basketwork eel', 'Diastobranchus capensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (606974, 'Benthalbella elongata', 'Benthalbella elongata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607039, 'Antarctic toothfish', 'Dissostichus mawsoni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607040, 'Triangular notothen', 'Gobionotothen acuta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607041, 'Humped rockcod', 'Gobionotothen gibberifrons');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607045, 'Grey rockcod', 'Lepidonotothen squamifrons');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607046, 'Toad notothen', 'Lepidonotothen mizops');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607047, 'Gaudy notothen', 'Lepidonotothen nudifrons');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607048, 'Lepidonotothen larseni', 'Lepidonotothen larseni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607052, 'Patagonian rockcod', 'Patagonotothen brevicauda brevicauda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607054, 'Blunt scalyhead', 'Trematomus eulepidotus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607055, 'Striped rockcod', 'Trematomus hansoni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607082, 'Pogonophryne permitini', 'Pogonophryne permitini');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607108, 'Chionobathyscus dewitti', 'Chionobathyscus dewitti');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607110, 'Chionodraco myersi', 'Chionodraco myersi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607111, 'Cryodraco antarcticus', 'Cryodraco antarcticus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607113, 'Bible icefish', 'Neopagetopsis ionah');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607117, 'Slender escolar', 'Paradiplospinus gracilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607120, 'Antarctic armless flounder', 'Mancopsetta maculata antarctica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607124, 'Marbled moray cod', 'Muraenolepis marmorata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607126, 'Smalleye moray cod', 'Muraenolepis microps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607132, 'Marinis grenadier', 'Coelorinchus marinii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607136, 'Dogtooth grenadier', 'Cynomacrurus piriei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607138, 'Bigeye grenadier', 'Macrourus holotrachys');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607139, 'Whitson''s grenadier', 'Macrourus whitsoni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607151, 'Smooth oreo', 'Pseudocyttus maculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607152, 'Spiny horsefish', 'Zanclorhynchus spinifer');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607184, 'Splitfin flashlightfish', 'Anomalops katoptron');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607187, 'Narrow-lined puffer', 'Arothron manilensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607211, 'Tangaroa shrimpgoby', 'Ctenogobiops tangaroai');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607292, 'Two-spot lizard fish', 'Synodus binotatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607306, 'Shoulderbar soldierfish', 'Myripristis kuntee');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607308, 'Scarlet soldierfish', 'Myripristis pralinia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607309, 'Lattice soldierfish', 'Myripristis violacea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607310, 'Clearfin squirrelfish', 'Neoniphon argenteus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607311, 'Pink squirrelfish', 'Sargocentron tiereoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607327, 'Grey triggerfish', 'Balistes capriscus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607329, 'Yellow grouper', 'Epinephelus awoara');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607348, 'Blacksaddle grouper', 'Epinephelus howlandi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607354, 'White-blotched grouper', 'Epinephelus multinotatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607355, 'Eightbar grouper', 'Hyporthodus octofasciatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607358, 'Smallscaled grouper', 'Epinephelus polylepis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607362, 'Surge grouper', 'Epinephelus socialis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607366, 'Summan grouper', 'Epinephelus summana');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607367, 'Yellowspotted grouper', 'Epinephelus timorensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607372, 'Blacksaddled coralgrouper', 'Plectropomus laevis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607374, 'Golden grouper', 'Saloptia powelli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607376, 'Deepwater stingray', 'Plesiobatis daviesi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607430, 'Roving coralgrouper', 'Plectropomus pessuliferus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607447, 'Pinda moray', 'Gymnothorax pindae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607530, 'Caribbean flounder', 'Trichopsetta caribbaea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607532, 'Duskycheek tonguefish', 'Symphurus plagusia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607535, 'Torroto grunt', 'Genyatremus luteus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607547, 'Spotted moray', 'Gymnothorax moringa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607553, 'Shortbeard cusk-eel', 'Lepophidium brevibarbe');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607580, 'Slipper sole', 'Trinectes paulistanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607614, 'Sandy ray', 'Leucoraja circularis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607616, 'Longnosed skate', 'Dipturus oxyrinchus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607617, 'Undulate ray', 'Raja undulata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607618, 'Devil fish', 'Mobula mobular');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607619, 'Shagreen ray', 'Leucoraja fullonica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607620, 'Whitemouth croaker', 'Micropogonias furnieri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607626, 'Sordid rubberlip', 'Plectorhinchus sordidus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607641, 'Flowery flounder', 'Bothus mancus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607691, 'Starry flying gurnard', 'Dactyloptena peterseni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607699, 'Longtail silverbiddy', 'Gerres longirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607700, 'Striped silver biddy', 'Gerres methueni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607703, 'Blackspotted rubberlips', 'Plectorhinchus gaterinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607706, 'Minstrel sweetlip', 'Plectorhinchus schotaf');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607708, 'Striped piggy', 'Pomadasys stridens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607714, 'Dark-striped squirrelfish', 'Sargocentron praslin');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607715, 'Rock flagtail', 'Kuhlia rupestris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607773, 'Brick soldierfish', 'Myripristis amaena');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607848, 'Amboina cardinalfish', 'Apogon amboinensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607897, 'Halfspined flathead', 'Sorsogona prionota');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607903, 'Yellowbar angelfish', 'Pomacanthus maculosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607931, 'Karenteen seabream', 'Crenidens crenidens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607937, 'Yellowtail barracuda', 'Sphyraena flavicauda');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607938, 'Sawtooth barracuda', 'Sphyraena putnamae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607939, 'Blackfin barracuda', 'Sphyraena qenie');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607943, 'Lighthouse lizardfish', 'Synodus jaculum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (607945, 'Fourlined terapon', 'Pelates quadrilineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608053, 'Harlequin snake-eel', 'Myrichthys colubrinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608092, 'African striped grunt', 'Parapristipoma octolineatum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608097, 'Steephead parrotfish', 'Chlorurus microrhinos');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608121, 'Reef needlefish', 'Strongylura incisa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608166, 'Haffara seabream', 'Rhabdosargus haffara');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608172, 'Silverside', 'Odontesthes regia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608173, 'Luderick', 'Girella tricuspidata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608187, 'Chinese silver pomfret', 'Pampus chinensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608198, 'Japanese pufferfish', 'Takifugu rubripes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608273, 'Bollmannia chlamydes', 'Bollmannia chlamydes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608275, 'Pacific bearded brotula', 'Brotula clarkae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608280, 'Large-headed scorpionfish', 'Pontinus macrocephalus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608289, 'Pacific cornetfish', 'Fistularia corneta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608315, 'Trout sweetlips', 'Plectorhinchus pictus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608326, 'Panama spadefish', 'Parapsettus panamensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608390, 'Choicy ruff', 'Seriolella porosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608421, 'Spotted codlet', 'Bregmaceros mcclellandi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608483, 'Thorntooth grenadier', 'Lepidorhynchus denticulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608490, 'Silver gemfish', 'Rexea solandri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608540, 'Intermediate scabbardfish', 'Aphanopus intermedius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608556, 'Littlemouth flounder', 'Pseudopleuronectes herzensteini');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608816, 'Coney', 'Cephalopholis fulva');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608852, 'Senegalese sole', 'Solea senegalensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608924, 'Starry ray', 'Raja asterias');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608936, 'Bigelows ray', 'Rajella bigelowi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (608991, 'Pudgy cuskeel', 'Spectrunculus grandis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (609000, 'Large-eyed rabbitfish', 'Hydrolagus mirabilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (609005, 'Spearnose chimaera', 'Rhinochimaera atlantica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (609033, 'Sharktooth moray', 'Gymnothorax maderensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (609146, 'Spiky oreo', 'Neocyttus rhomboidalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (609171, 'Agassiz slickhead', 'Alepocephalus agassizii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (609204, 'Graceful pearlfish', 'Encheliophis gracilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (609256, 'Arctic skate', 'Amblyraja hyperborea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (609648, 'Feathered river-garfish', 'Zenarchopterus dispar');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (609891, 'Pristigenys meyeri', 'Pristigenys meyeri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (609907, 'Guinean striped mojarra', 'Gerres nigri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (609908, 'Biglip grunt', 'Plectorhinchus macrolepis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (610106, 'Tarakihi', 'Nemadactylus macropterus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (610126, 'Slender guitarfish', 'Rhinobatos holcorhynchus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (610190, 'Pemarco blackfish', 'Schedophilus pemarco');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (610220, 'Giant catfish', 'Netuma thalassina');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (610238, 'Skinnycheek lanternfish', 'Benthosema pterotum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (610256, 'Cape monk', 'Lophius vomerinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (610285, 'Kai soldierfish', 'Ostichthys kaianus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (610301, 'Pear puffer', 'Takifugu vermicularis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (610307, 'Japanese flyingfish', 'Cheilopogon agoo');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (610308, 'Ramsay''s icefish', 'Patagonotothen ramsayi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (610430, 'Peruvian mojarra', 'Diapterus peruvianus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (610676, 'King dory', 'Cyttus traversi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (611002, 'Stolzmanns weakfish', 'Cynoscion stolzmanni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (611111, 'Mango angelfish', 'Centropyge shepardi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (611512, 'Roundjaw bonefish', 'Albula glossodonta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (611713, 'Indian pike conger', 'Congresox talabonoides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (611783, 'Buru glass perchlet', 'Ambassis buruensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (611820, 'Canary damsel', 'Abudefduf luridus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612005, 'Sandpaper fish', 'Paratrachichthys trailli');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612081, 'Pacora', 'Plagioscion surinamensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612128, 'Ara', 'Niphon spinosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612288, 'Rubyfish', 'Plagiogeneion rubiginosum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612354, 'Giant boarfish', 'Paristiopterus labiosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612357, 'Bigspined boarfish', 'Pentaceros decacanthus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612361, 'Longfin armorhead', 'Pseudopentaceros wheeleri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612547, 'Muksun', 'Coregonus muksun');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612586, 'Mangrove whipray', 'Himantura granulata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612587, 'Pink whipray', 'Himantura fai');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612596, 'Yellowfin soldierfish', 'Myripristis chryseres');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612620, 'Sand lizardfish', 'Synodus dermatogenys');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612663, 'Checkerboard wrasse', 'Halichoeres hortulanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612744, 'Blackfin hogfish', 'Bodianus loxozonus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612848, 'Liopropoma maculatum', 'Liopropoma maculatum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612896, 'Yellowstriped squirrelfish', 'Neoniphon aurolineatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612917, 'Tilefish', 'Prolatilus jugularis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612918, 'Common warehou', 'Seriolella brama');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612919, 'White warehou', 'Seriolella caerulea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612920, 'Giant stargazer', 'Kathetostoma giganteum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612922, 'Silver warehou', 'Seriolella punctata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612925, 'Porichthys porosissimus', 'Porichthys porosissimus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612961, 'Englemans lizardfish', 'Synodus englemani');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612962, 'Black oreo', 'Allocyttus niger');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (612996, 'Silver eye', 'Polymixia japonica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613025, 'Parrotfish', 'Sparisoma cretense');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613135, 'Garfish', 'Hyporhamphus ihi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613139, 'Velvet leatherjacket', 'Meuschenia scaber');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613144, 'New Zealand rough skate', 'Zearaja nasuta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613146, 'Dark ghost shark', 'Hydrolagus novaezealandiae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613429, 'Brown sole', 'Achirus klunzingeri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613558, 'Speckled-tail flounder', 'Engyophrys sanctilaurentii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613632, 'Inkspot tonguefish', 'Symphurus atramentatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613664, 'Greyfin croaker', 'Pennahia anea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613721, 'Shining grunt', 'Haemulopsis nitidus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613734, 'Yellowstripe grunt', 'Haemulopsis axillaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613738, 'Longspine grunt', 'Pomadasys macracanthus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613740, 'Panama grunt', 'Pomadasys panamensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613954, 'Toothed flounder', 'Cyclopsetta querna');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613978, 'Oval flounder', 'Syacium ovale');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (613998, 'Tallfin croaker', 'Micropogonias altipinnis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614009, 'Pacific drum', 'Larimus pacificus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614015, 'Steeplined drum', 'Larimus acclivis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614018, 'Silver weakfish', 'Isopisthus remifer');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614030, 'Striped weakfish', 'Cynoscion reticulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614063, 'Argentine goatfish', 'Mullus argentinae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614069, 'Suco croaker', 'Paralonchurus dumerilii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614084, 'Silver stardrum', 'Stellifer illecebrosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614090, 'Softhead stardrum', 'Stellifer zestocarus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614129, 'Redfish', 'Centroberyx affinis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614146, 'Salema butterfish', 'Peprilus snyderi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614155, 'Shorthead lizardfish', 'Synodus scituliceps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614220, 'Reddish scorpionfish', 'Scorpaena russula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614242, 'Banded yellowfish', 'Centriscops humerosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614248, 'Inshore sand perch', 'Diplectrum pacificum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614282, 'St. Pauls fingerfin', 'Nemadactylus monodactylus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614290, 'Pacific bluefin tuna', 'Thunnus orientalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614296, 'Bigeye bass', 'Pronotogrammus eos');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614300, 'Oval butterflyfish', 'Chaetodon lunulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614303, 'Jumping halfbeak', 'Hemiramphus archipelagicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614327, 'Spotted gurnard', 'Pterygotrigla picta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614354, 'Orange perch', 'Lepidoperca pulchella');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614383, 'Gulf parrotfish', 'Scarus persicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614575, 'New Zealand dory', 'Cyttus novaezealandiae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614693, 'Peruvian hake', 'Merluccius gayi peruanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (614983, 'Bluegill longfin', 'Plesiops corallicola');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (615086, 'Pink maomao', 'Caprodon longimanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (615380, 'White-spotted shovelnose ray', 'Rhynchobatus australiae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (615483, 'Sharpnose stingray', 'Himantura gerrardi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (615628, 'Naso caesius', 'Naso caesius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (616720, 'Barnard''s lanternfish', 'Symbolophorus barnardi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (617190, 'Whitespot soldierfish', 'Myripristis woodsi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (617304, 'Candidia barbata', 'Candidia barbata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (617471, 'Black surgeonfish', 'Acanthurus gahhm');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (622522, 'Mottled sole', 'Aseraggodes melanostictus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (622620, 'Rio de Oreo blenny', 'Spaniblennius riodourensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (623130, 'Elegant moray', 'Gymnothorax elegans');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (623333, 'Checked swallowtail', 'Odontanthias borbonius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (623343, 'Sargocentron furcatum', 'Sargocentron furcatum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (624115, 'Liparis tanakae', 'Liparis tanakae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (624237, 'Rock sole', 'Lepidopsetta bilineata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (625225, 'Yellowtail mullet', 'Sicamugil cascasia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (625706, 'Indian Ocean oriental sweetlips', 'Plectorhinchus vittatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (626675, 'Corvina drum', 'Cilus gilberti');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (627348, 'Spiny squirrelfish', 'Sargocentron lepros');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (628128, 'Spotfin flathead', 'Grammoplites suppositus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (628143, 'American harvestfish', 'Peprilus paru');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (628232, 'Scaly gurnard', 'Lepidotrigla brachyoptera');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (646376, 'Klunzingers mullet', 'Liza klunzingeri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (646941, 'Bering cisco', 'Coregonus laurettae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (646950, 'Sand fish', 'Awaous tajasica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (648104, 'Allis and twaite shads', 'Alosa alosa, A.fallax');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (648134, 'Baltic herring', 'Clupea harengus membras');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (648382, 'Baltic sprat', 'Sprattus sprattus balticus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (649232, 'Capro dory', 'Capromimus abbreviatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (650023, 'Lizardfish', 'Synodus marchenae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (650099, 'Stingray', 'Urotrygon serrula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (650136, 'Argentinian sandperch', 'Pseudopercis semifasciata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (651212, 'Channel bull blenny', 'Cottoperca gobio');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (654963, 'Paralichthys microps', 'Paralichthys microps');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (656326, 'Surge damselfish', 'Chrysiptera brownriggii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (657505, 'Kerguelen sandpaper skate', 'Bathyraja irrasa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (657506, 'So-iny mullet', 'Liza haematocheilus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (658000, 'Golden hind', 'Cephalopholis aurantia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (658001, 'African coris', 'Coris gaimard');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (658002, 'BASSLET', 'Plectranthias kamii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (658003, 'Greyface moray', 'Gymnothorax thyrsoideus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (658004, 'Longfin African conger', 'Conger cinereus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (661067, 'Golden redfish', 'Sebastes norvegicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690003, 'Aesop shrimp', 'Pandalus montagui');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690005, 'Akiami paste shrimp', 'Acetes japonicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690009, 'American cupped oyster', 'Crassostrea virginica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690010, 'American lobster', 'Homarus americanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690011, 'American sea scallop', 'Placopecten magellanicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690013, 'Andaman lobster', 'Metanephrops andamanicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690016, 'Antarctic krill', 'Euphausia superba');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690018, 'Antarctic stone crab', 'Paralomis spinosissima');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690022, 'Argentine red shrimp', 'Pleoticus muelleri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690023, 'Argentine shortfin squid', 'Illex argentinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690024, 'Argentine stiletto shrimp', 'Artemesia longinaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690029, 'Atlantic razor clam', 'Ensis directus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690030, 'Atlantic bay scallop', 'Argopecten irradians');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690031, 'Atlantic rock crab', 'Cancer irroratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690032, 'Atlantic seabob', 'Xiphopenaeus kroyeri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690033, 'Atlantic surf clam', 'Spisula solidissima');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690036, 'Australian mussel', 'Mytilus planulatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690039, 'Australian spiny lobster', 'Panulirus cygnus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690042, 'Banana prawn', 'Fenneropenaeus merguiensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690043, 'Barnacle', 'Pollicipes pollicipes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690044, 'Bear paw clam', 'Hippopus hippopus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690047, 'Black stone crab', 'Menippe mercenaria');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690048, 'Pacific pearl-oyster', 'Pinctada margaritifera');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690049, 'Blacklip abalone', 'Haliotis rubra');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690050, 'Granular ark', 'Tegillarca granosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690051, 'Blue and red shrimp', 'Aristeus antennatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690052, 'Blue crab', 'Callinectes sapidus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690053, 'Blue mussel', 'Mytilus edulis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690054, 'Blue shrimp', 'Litopenaeus stylirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690055, 'Blue swimming crab', 'Portunus pelagicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690058, 'Brine shrimp', 'Artemia salina');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690059, 'Broadtail shortfin squid', 'Illex coindetii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690060, 'Brown mussel', 'Perna viridis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690064, 'Butter clam', 'Saxidomus gigantea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690065, 'Calico scallop', 'Argopecten gibbus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690067, 'European squid', 'Loligo vulgaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690069, 'Cape rock lobster', 'Jasus lalandii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690070, 'Caramote prawn', 'Melicertus kerathurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690071, 'Caribbean spiny lobster', 'Panulirus argus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690075, 'Chilean flat oyster', 'Ostrea chilensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690076, 'Chilean mussel', 'Mytilus chilensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690077, 'Chilean nylon shrimp', 'Heterocarpus reedi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690078, 'Chilean sea urchin', 'Loxechinus albus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690081, 'Cholga mussel', 'Aulacomya ater');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690082, 'Choro mussel', 'Choromytilus chorus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690085, 'Common cuttlefish', 'Sepia officinalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690087, 'Common edible cockle', 'Cardium edule');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690088, 'Common octopus', 'Octopus vulgaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690089, 'Common periwinkle', 'Littorina littorea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690090, 'Common prawn', 'Palaemon serratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690091, 'Common shrimp', 'Crangon crangon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690092, 'Common spiny lobster', 'Palinurus elephas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690094, 'Cortez oyster', 'Crassostrea corteziensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690100, 'Crystal shrimp', 'Farfantepenaeus brevirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690105, 'Dana''s swimming crab', 'Callinectes danae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690109, 'Deepwater rose shrimp', 'Parapenaeus longirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690115, 'Dungeness crab', 'Cancer magister');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690119, 'Edible crab', 'Cancer pagurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690120, 'Endeavour shrimp', 'Metapenaeus endeavouri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690122, 'European edible sea urchin', 'Echinus esculentus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690123, 'European flat oyster', 'Ostrea edulis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690124, 'European flying squid', 'Todarodes sagittatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690125, 'European lobster', 'Homarus gammarus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690126, 'European razor clam', 'Solen vagina');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690127, 'False abalone', 'Concholepas concholepas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690129, 'Farrer''s scallop', 'Chlamys farreri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690133, 'Fleshy prawn', 'Fenneropenaeus chinensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690134, 'Fluted giant clam', 'Tridacna squamosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690143, 'Gazami crab', 'Portunus trituberculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690146, 'Giant abalone', 'Haliotis gigantea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690147, 'Giant clam', 'Tridacna gigas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690151, 'Giant tiger prawn', 'Penaeus monodon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690153, 'Globose clam', 'Mactra veneriformis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690155, 'Greasyback shrimp', 'Metapenaeus ensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690156, 'Great Atlantic scallop', 'Pecten maximus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690157, 'Great Mediterranean scallop', 'Pecten jacobaeus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690158, 'Green crab', 'Carcinus maenas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690161, 'Green rock lobster', 'Jasus verreauxi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690163, 'Green tiger prawn', 'Penaeus semisulcatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690166, 'Grooved carpet shell', 'Ruditapes decussatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690167, 'Grooved sea squirt', 'Microcosmus sulcatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690168, 'Guinea shrimp', 'Parapenaeopsis atlantica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690169, 'Half-crenated ark', 'Scapharca cornea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690176, 'Hen clam', 'Mactra sachalinensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690177, 'Hooded oyster', 'Saccostrea cuccullata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690180, 'Horned turban', 'Turbo cornutus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690182, 'Horseshoe crab', 'Limulus polyphemus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690185, 'Iceland scallop', 'Chlamys islandica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690186, 'Indian backwater oyster', 'Crassostrea madrasensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690189, 'Indian white prawn', 'Fenneropenaeus indicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690190, 'Indo-Pacific swamp crab', 'Scylla serrata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690191, 'Inflated ark', 'Scapharca broughtoni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690194, 'Jack-knife shrimp', 'Haliporoides sibogae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690195, 'Japanese abalone', 'Haliotis discus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690196, 'Japanese carpet shell', 'Ruditapes philippinarum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690198, 'Japanese flying squid', 'Todarodes pacificus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690199, 'Japanese hard clam', 'Meretrix lusoria');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690200, 'Japanese pearl oyster', 'Pinctada fucata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690201, 'Japanese sea cucumber', 'Apostichopus japonicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690203, 'Jonah crab', 'Cancer borealis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690205, 'Juan Fernandez rock lobster', 'Jasus frontalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690206, 'Jumbo flying squid', 'Dosidicus gigas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690215, 'Knife shrimp', 'Haliporoides triarthrus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690216, 'Coastal mud shrimp', 'Solenocera crassicornis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690217, 'Kolibri shrimp', 'Solenocera agassizii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690218, 'Korean mussel', 'Mytilus coruscus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690219, 'Kuruma prawn', 'Marsupenaeus japonicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690227, 'Longfin squid', 'Loligo pealeii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690228, 'Longlegged spiny lobster', 'Panulirus longipes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690229, 'Lugubrious cupped oyster', 'Crassostrea belcheri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690230, 'Macha clam', 'Mesodesma donacium');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690232, 'Mangrove cupped oyster', 'Crassostrea rhizophorae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690233, 'Asiatic clam', 'Corbicula manilensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690241, 'Mediterranean mussel', 'Mytilus galloprovincialis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690242, 'Mediterranean shore crab', 'Carcinus aestuarii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690249, 'Mozambique lobster', 'Metanephrops mozambicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690250, 'Mud spiny lobster', 'Panulirus polyphagus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690253, 'Natal spiny lobster', 'Palinurus delagoae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690256, 'New Zealand dredge oyster', 'Ostrea lutaria');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690257, 'New Zealand lobster', 'Metanephrops challengeri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690258, 'New Zealand green mussel', 'Perna canaliculus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690259, 'New Zealand scallop', 'Pecten novaezelandiae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690262, 'Noble scallop', 'Chlamys nobilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690265, 'Northern brown shrimp', 'Farfantepenaeus aztecus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690268, 'Northern pink shrimp', 'Farfantepenaeus duorarum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690269, 'Northern prawn', 'Pandalus borealis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690270, 'Northern quahog', 'Mercenaria mercenaria');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690271, 'Northern shortfin squid', 'Illex illecebrosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690272, 'Northern white shrimp', 'Litopenaeus setiferus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690273, 'Norway lobster', 'Nephrops norvegicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690274, 'Norwegian krill', 'Meganyctiphanes norvegica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690275, 'Ocean quahog', 'Arctica islandica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690279, 'Olympia flat oyster', 'Ostrea lurida');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690282, 'Pacific calico scallop', 'Argopecten ventricosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690283, 'Pacific cupped oyster', 'Crassostrea gigas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690284, 'Pacific geoduck', 'Panopea abrupta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690285, 'Pacific littleneck clam', 'Protothaca staminea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690286, 'Pacific razor clam', 'Siliqua patula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690287, 'Pacific rock crab', 'Cancer productus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690288, 'Atlantic seabob', 'Xiphopenaeus kroyeri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690296, 'Patagonian squid', 'Loligo gahi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690300, 'Penguin wing oyster', 'Pteria penguin');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690302, 'Perlemoen abalone', 'Haliotis midae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690303, 'Peruvian calico scallop', 'Argopecten purpuratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690304, 'Pink conch', 'Lobatus gigas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690305, 'Pink spiny lobster', 'Palinurus mauritanicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690306, 'Portuguese cupped oyster', 'Crassostrea angulata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690309, 'Pullet carpet shell', 'Tapes pullastra');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690311, 'Purple sea urchin', 'Paracentrotus lividus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690313, 'Queen crab', 'Chionoecetes opilio');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690314, 'Queen scallop', 'Aequipecten opercularis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690317, 'Red abalone', 'Haliotis rufescens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690318, 'Red bait', 'Pyura stolonifera');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690320, 'Red deepsea crab', 'Chaceon quinquedens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690321, 'Red rock lobster', 'Jasus edwardsii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690322, 'Red sea squirt', 'Pyura chilensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690324, 'Red starfish', 'Asterias rubens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690325, 'Red stone crab', 'Paralomis aculeata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690327, 'Redspotted shrimp', 'Farfantepenaeus brasiliensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690328, 'Redtail prawn', 'Penaeus penicillatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690332, 'River Plata mussel', 'Mytilus platensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690334, 'Rock shrimp', 'Sicyonia brevirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690335, 'Royal red shrimp', 'Pleoticus robustus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690336, 'Royal spiny lobster', 'Panulirus regius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690337, 'Sand gaper', 'Mya arenaria');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690338, 'Sao Paulo shrimp', 'Farfantepenaeus paulensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690341, 'Scalloped spiny lobster', 'Panulirus homarus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690343, 'Scarlet shrimp', 'Plesiopenaeus edwardsianus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690354, 'Sevenstar flying squid', 'Martialia hyadesi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690356, 'Shiba shrimp', 'Metapenaeus joyneri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690363, 'Silver-lip pearl oyster', 'Pinctada maxima');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690364, 'Slipper cupped oyster', 'Crassostrea iredalei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690366, 'Small abalone', 'Haliotis diversicolor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690368, 'Smooth mactra', 'Mactra glabrata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690370, 'Softshell red crab', 'Paralomis granulosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690374, 'South American rock mussel', 'Perna perna');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690376, 'Southern brown shrimp', 'Farfantepenaeus subtilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690377, 'Southern king crab', 'Lithodes antarcticus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690378, 'Southern pink shrimp', 'Farfantepenaeus notialis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690379, 'Southern rough shrimp', 'Trachysalambria curvirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690381, 'Southern spiny lobster', 'Palinurus gilchristi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690382, 'Southern white shrimp', 'Litopenaeus schmitti');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690383, 'Speckled shrimp', 'Metapenaeus monoceros');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690387, 'Spinous spider crab', 'Maja squinado');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690392, 'Spottail mantis squillid', 'Squilla mantis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690393, 'Squilla biformis', 'Squilla biformis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690398, 'Stimpsons surf clam', 'Mactromeris polynyma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690399, 'Stone king crab', 'Lithodes maia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690400, 'Stony sea urchin', 'Paracentrotus lividus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690403, 'Striped red shrimp', 'Aristeus varidens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690404, 'Striped venus', 'Venus gallina');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690406, 'Subantarctic stone crab', 'Lithodes murrayi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690407, 'Suminoe oyster', 'Crassostrea rivularis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690411, 'Taca clam', 'Protothaca thaca');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690416, 'Tristan da Cunha lobster', 'Jasus tristani');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690420, 'Tuberculate abalone', 'Haliotis tuberculata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690423, 'Variegated scallop', 'Mimachlamys varia');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690425, 'Velvet swimcrab', 'Necora puber');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690429, 'Weathervane scallop', 'Patinopecten caurinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690430, 'Wellington flying squid', 'Nototodarus sloanii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690432, 'Western king prawn', 'Melicertus latisulcatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690433, 'Western white shrimp', 'Litopenaeus occidentalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690434, 'Whelk', 'Buccinum undatum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690440, 'Whiteleg shrimp', 'Litopenaeus vannamei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690444, 'Yellowleg shrimp', 'Farfantepenaeus californiensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690445, 'Yesso scallop', 'Pecten yessoensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690470, 'Neon flying squid', 'Ommastrephes bartramii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690494, 'Green sea urchin', 'Strongylocentrotus droebachiensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690595, 'Veined Squid', 'Loligo forbesii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690598, 'Mediterranean slipper lobster', 'Scyllarides latus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690599, 'Hays rock-shell', 'Stramonita haemastoma');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690603, 'Queen scallop', 'Aequipecten opercularis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690605, 'common edible cockle', 'Cerastoderma edule');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690606, 'Carrot Squat Lobster', 'Cervimunida johni');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690608, 'Hair Crab', 'Erimacrus isenbeckii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690609, 'Chilean nylon shrimp', 'Haliporoides diomedeae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690610, 'Northern nylon shrimp', 'Heterocarpus vicarius');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690611, 'Sand Crayfish', 'Ibacus ciliatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690612, 'Same-spine stone crab', 'Lithodes aequispinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690613, 'Giant barnacle', 'Megabalanus psittacus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690614, 'Armored spider crab', 'Mithrax armatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690615, 'Sidestripe shrimp', 'Pandalopsis japonica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690616, 'Humpy shrimp', 'Pandalus goniurus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690617, 'Humpback shrimp', 'Pandalus hypsinotus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690618, 'Grass shrimp', 'Pandalus kessleri');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690619, 'Blue spiny lobster', 'Panulirus gracilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690620, 'Spiny king crab', 'Paralithodes brevipes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690621, 'Red king crab', 'Paralithodes camtschaticus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690622, 'Blue King Crab', 'Paralithodes platypus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690624, 'Squat Lobster', 'Pleuroncodes monodon');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690625, 'Pelagic red crab', 'Pleuroncodes planipes');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690627, 'Corvina', 'Cilus gilberti');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690628, 'Ridgeback rock shrimp', 'Sicyonia ingentis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690629, 'Trigonal tivela', 'Tivela mactroides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690630, 'Pullet carpet shell', 'Venerupis pullastra');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690631, 'Venus clam', 'Spisula ovalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690649, 'Blood ark', 'Anadara ovalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690651, 'Nuttall cockle', 'Clinocardium nuttallii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690658, 'California market squid', 'Loligo opalescens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690660, 'Ocean shrimp', 'Pandalus jordani');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690664, 'Pacific gaper clam', 'Tresus nuttallii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690665, 'Blue mud shrimp', 'Upogebia pugettensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690666, 'Blue Land Crab', 'Cardisoma guanhumi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690670, 'Bigfin reef squid', 'Sepioteuthis lessoniana');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690671, 'Surf clam', 'Spisula solida');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690673, 'Maxima clam', 'Tridacna maxima');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690674, 'Angulate volute', 'Zidona dufresnei');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690675, 'Banded carpet shell', 'Tapes rhomboides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690676, 'Blue-leg swimcrab', 'Liocarcinus depurator');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690677, 'Chilean semele', 'Semele solida');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690678, 'Dog cockle', 'Glycymeris glycymeris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690679, 'Delicate scallop', 'Chlamys delicatula');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690680, 'Delta prawn', 'Palaemon longirostris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690681, 'Flathead lobster', 'Thenus orientalis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690682, 'Gay''s little venus', 'Tawera gayi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690683, 'Giant red shrimp', 'Aristaeomorpha foliacea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690684, 'Horned octopus', 'Eledone cirrhosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690685, 'Knobbed triton', 'Charonia lampas');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690686, 'Patagonean scallop', 'Zygochlamys patagonica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690687, 'Peppery furrow shell', 'Scrobicularia plana');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690688, 'Pipi wedge clam', 'Paphies australis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690689, 'Purple dye murex', 'Bolinus brandaris');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690690, 'Smooth callista', 'Callista chione');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690691, 'St.Paul rock lobster', 'Jasus paulensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690692, 'Stutchbury''s venus', 'Chione stutchburyi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690693, 'Warty venus', 'Venus verrucosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690694, 'Whitebelly prawn', 'Nematopalaemon schmitti');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690695, 'Oriental cyclina', 'Cyclina sinensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690696, 'Southern rock lobster', 'Jasus novaehollandiae');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690698, 'Chinese razor clam', 'Sinonovacula constricta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690750, 'Helmet ton', 'Tonna galea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690751, 'Rostrate pitar', 'Pitar rostratus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690752, 'Tuberculate cockle', 'Acanthocardia tuberculata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690753, 'Deep-sea red crab', 'Chaceon affinis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690754, 'Pod razor', 'Ensis ensis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690755, 'Sword razor shell', 'Ensis siliqua');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690756, 'Norwegian egg cockle', 'Laevicardium crassum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690758, 'Atlantic ditch shrimp', 'Palaemonetes varians');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690759, 'Bean solen', 'Pharus legumen');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690761, 'Fly spotted auger', 'Terebra areolata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690762, 'Crenate swimming crab', 'Thalamita crenata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690763, 'Pacific partridge tun', 'Tonna perdix');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690764, 'FLOWER URCHIN', 'Toxopneustes pileolus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690765, 'SHORTSPINE URCHIN', 'Tripneustes gratilla');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690766, 'commercial top', 'Trochus niloticus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690767, 'Rough turban', 'Turbo setosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690768, 'top vase', 'Vasum turbinellum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690769, 'SHALLOW REEF CRAB', 'Zosimus aeneus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690770, 'Red reef crab', 'Carpilius convexus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690771, 'spotted reef crab', 'Carpilius maculatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690772, 'HORNED HELMET', 'Cassis cornuta');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690773, 'HEBREW CONE', 'Conus ebraeus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690774, 'STRIATED CONE', 'Conus striatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690781, 'horrid elbow crab', 'Daldorfia horrida');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690782, 'whitespotted hermit', 'Dardanus megistos');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690783, 'savigny''s long-spine sea urchin', 'Diadema savignyi');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690786, 'REDEYE CRAB', 'Eriphia sebana');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690787, 'splendid spooner', 'Etisus splendidus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690788, 'TUMID VENUS', 'Gafrarium tumidum');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690789, 'Spanish dancer', 'Hexabranchus sanguineus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690790, 'LOLLYFISH', 'Holothuria atra');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690791, 'PINKFISH', 'Holothuria edulis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690793, 'COMMON SPIDER CONCH', 'Lambis lambis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690794, 'GIANT SPIDER CONCH', 'Lambis truncata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690795, 'PLICATE NERITE', 'Nerita plicata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690796, 'POLISHED NERITE', 'Nerita polita');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690797, 'ORNATE OCTOPUS', 'Octopus ornatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690798, 'Japanese squillid mantis shrimp', 'Oratosquilla oratoria');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690799, 'Indo-Pacific furry lobster', 'Palinurellus wieneckii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690800, 'Ornate spiny lobster', 'Panulirus ornatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690801, 'Pronghorn spiny lobster', 'Panulirus penicillatus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690802, 'PAINTED spiny lobster', 'Panulirus versicolor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690803, 'Sculptured mitten lobster', 'Parribacus antarcticus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690804, 'BICOLOR PEN SHELL', 'Pinna bicolor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690806, 'BROADCLUB CUTTLEFISH', 'Sepia latimanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690807, 'Selenka''s sea cucumber', 'Stichopus horrens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690808, 'GIBBOSE CONCH', 'Strombus gibberulus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690809, 'Strawberry conch', 'Strombus luhuanus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690810, 'PYRAMID TOP', 'Tectus pyramis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690811, 'CRENULATED AUGER', 'Terebra crenulata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690812, 'MARLINSPIKE', 'Terebra maculata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690813, 'Northern spined chiton', 'Acanthopleura gemmata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690814, 'SPINEY CHITON', 'Acanthopleura spinosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690815, 'SEA CUCUMBER', 'Actinopyga obesa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690816, 'Pacific asaphis', 'Asaphis violascens');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690817, 'Gaudy asaphis', 'Asaphis deflorata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690819, 'Chalky cucumber', 'Bohadschia marmorata');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690821, 'BOX CRAB', 'Calappa hepatica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690882, 'Caledonian mitten lobster', 'Parribacus caledonicus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690883, 'Kona crab                ', 'Ranina ranina');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690887, 'West African mangrove oyster ', 'Crassostrea tulipa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690888, 'Kumamoto oyster', 'Crassostrea sikamea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690889, 'giant rock-scallop ', 'Crassadoma gigantea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690891, 'North Pacific giant octopus', 'Enteroctopus dofleini');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690892, 'long arm octopus', 'Octopus minor');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690893, 'lion''s paw scallop ', 'Nodipecten nodosus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690894, 'Gomphina veneriformis', 'Gomphina veneriformis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690895, 'diphos sanguin ', 'Soletellina diphos');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690896, 'Goneplax rhomboides', 'Goneplax rhomboides');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690897, 'Purple whelk', 'Rapana venosa');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690906, 'Big blue octopus', 'Octopus cyanea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690909, 'West Indian top shell', 'Cittarium pica');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690910, 'Plesionika trispinus', 'Plesionika trispinus');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690911, 'Caribbean reef squid', 'Sepioteuthis sepioidea');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690912, 'Spear shrimp', 'Parapenaeopsis hardwickii');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690913, 'Rainbow shrimp', 'Parapenaeopsis sculptilis');
INSERT INTO taxon (taxon_key, name, scientific_name) VALUES (690914, 'Strong elbow crab', 'Platylambrus validus');


--
-- TOC entry 2881 (class 2606 OID 17108)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2887 (class 2606 OID 17110)
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 2889 (class 2606 OID 17112)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2883 (class 2606 OID 17114)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 17116)
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 2894 (class 2606 OID 17118)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2902 (class 2606 OID 17120)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 17122)
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 2896 (class 2606 OID 17124)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2908 (class 2606 OID 17126)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2910 (class 2606 OID 17128)
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 2898 (class 2606 OID 17130)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2941 (class 2606 OID 17478)
-- Name: catch_type_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY catch_type
    ADD CONSTRAINT catch_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2943 (class 2606 OID 17486)
-- Name: country_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 2926 (class 2606 OID 17430)
-- Name: data_ingest_fileupload_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY data_ingest_fileupload
    ADD CONSTRAINT data_ingest_fileupload_pkey PRIMARY KEY (id);


--
-- TOC entry 2930 (class 2606 OID 17441)
-- Name: data_ingest_rawcatch_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY data_ingest_rawcatch
    ADD CONSTRAINT data_ingest_rawcatch_pkey PRIMARY KEY (id);


--
-- TOC entry 2914 (class 2606 OID 17152)
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2916 (class 2606 OID 17154)
-- Name: django_content_type_app_label_357160df_uniq; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_357160df_uniq UNIQUE (app_label, model);


--
-- TOC entry 2918 (class 2606 OID 17156)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2920 (class 2606 OID 17158)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2923 (class 2606 OID 17160)
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2946 (class 2606 OID 17494)
-- Name: eez_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY eez
    ADD CONSTRAINT eez_pkey PRIMARY KEY (id);


--
-- TOC entry 2950 (class 2606 OID 17510)
-- Name: fishing_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY fishing_sector
    ADD CONSTRAINT fishing_sector_pkey PRIMARY KEY (id);


--
-- TOC entry 2939 (class 2606 OID 17470)
-- Name: reconstructed_catch_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY reconstructed_catch
    ADD CONSTRAINT reconstructed_catch_pkey PRIMARY KEY (id);


--
-- TOC entry 2948 (class 2606 OID 17502)
-- Name: reference_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY reference
    ADD CONSTRAINT reference_pkey PRIMARY KEY (id);


--
-- TOC entry 2952 (class 2606 OID 17518)
-- Name: taxon_pkey; Type: CONSTRAINT; Schema: public; Owner: recon; Tablespace: 
--

ALTER TABLE ONLY taxon
    ADD CONSTRAINT taxon_pkey PRIMARY KEY (taxon_key);


--
-- TOC entry 2884 (class 1259 OID 17161)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 2885 (class 1259 OID 17162)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2890 (class 1259 OID 17163)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- TOC entry 2899 (class 1259 OID 17164)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 2900 (class 1259 OID 17165)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 2905 (class 1259 OID 17166)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2906 (class 1259 OID 17167)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2924 (class 1259 OID 17447)
-- Name: data_ingest_fileupload_e8701ad4; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX data_ingest_fileupload_e8701ad4 ON data_ingest_fileupload USING btree (user_id);


--
-- TOC entry 2927 (class 1259 OID 17458)
-- Name: data_ingest_rawcatch_01490fd0; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX data_ingest_rawcatch_01490fd0 ON data_ingest_rawcatch USING btree (source_file_id);


--
-- TOC entry 2928 (class 1259 OID 17459)
-- Name: data_ingest_rawcatch_e8701ad4; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX data_ingest_rawcatch_e8701ad4 ON data_ingest_rawcatch USING btree (user_id);


--
-- TOC entry 2911 (class 1259 OID 17178)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 2912 (class 1259 OID 17179)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- TOC entry 2921 (class 1259 OID 17180)
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- TOC entry 2944 (class 1259 OID 17524)
-- Name: eez_93bfec8a; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX eez_93bfec8a ON eez USING btree (country_id);


--
-- TOC entry 2931 (class 1259 OID 17531)
-- Name: reconstructed_catch_02655565; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX reconstructed_catch_02655565 ON reconstructed_catch USING btree (eez_id);


--
-- TOC entry 2932 (class 1259 OID 17537)
-- Name: reconstructed_catch_45e4b6df; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX reconstructed_catch_45e4b6df ON reconstructed_catch USING btree (fishing_entity_id);


--
-- TOC entry 2933 (class 1259 OID 17543)
-- Name: reconstructed_catch_4a97df82; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX reconstructed_catch_4a97df82 ON reconstructed_catch USING btree (original_country_fishing_id);


--
-- TOC entry 2934 (class 1259 OID 17555)
-- Name: reconstructed_catch_5b1d2adf; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX reconstructed_catch_5b1d2adf ON reconstructed_catch USING btree (sector_id);


--
-- TOC entry 2935 (class 1259 OID 17549)
-- Name: reconstructed_catch_87261c8f; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX reconstructed_catch_87261c8f ON reconstructed_catch USING btree (raw_catch_id);


--
-- TOC entry 2936 (class 1259 OID 17525)
-- Name: reconstructed_catch_8a985b4b; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX reconstructed_catch_8a985b4b ON reconstructed_catch USING btree (catch_type_id);


--
-- TOC entry 2937 (class 1259 OID 17561)
-- Name: reconstructed_catch_96912c2c; Type: INDEX; Schema: public; Owner: recon; Tablespace: 
--

CREATE INDEX reconstructed_catch_96912c2c ON reconstructed_catch USING btree (taxon_id);


--
-- TOC entry 2953 (class 2606 OID 17181)
-- Name: auth_group_permiss_permission_id_13f8369d_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_13f8369d_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2954 (class 2606 OID 17186)
-- Name: auth_group_permissions_group_id_73b78026_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_73b78026_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2955 (class 2606 OID 17191)
-- Name: auth_permiss_content_type_id_5ee6a1a4_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_5ee6a1a4_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2956 (class 2606 OID 17196)
-- Name: auth_user_groups_group_id_241d01c8_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_241d01c8_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2957 (class 2606 OID 17201)
-- Name: auth_user_groups_user_id_14f45a0e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_14f45a0e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2958 (class 2606 OID 17206)
-- Name: auth_user_user_per_permission_id_7a5d42b9_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_7a5d42b9_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2959 (class 2606 OID 17211)
-- Name: auth_user_user_permissions_user_id_128b49fe_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_128b49fe_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2963 (class 2606 OID 17448)
-- Name: data_inges_source_file_id_4a9039ab_fk_data_ingest_fileupload_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY data_ingest_rawcatch
    ADD CONSTRAINT data_inges_source_file_id_4a9039ab_fk_data_ingest_fileupload_id FOREIGN KEY (source_file_id) REFERENCES data_ingest_fileupload(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2962 (class 2606 OID 17442)
-- Name: data_ingest_fileupload_user_id_5b3dc4f3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY data_ingest_fileupload
    ADD CONSTRAINT data_ingest_fileupload_user_id_5b3dc4f3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2964 (class 2606 OID 17453)
-- Name: data_ingest_rawcatch_user_id_23b03467_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY data_ingest_rawcatch
    ADD CONSTRAINT data_ingest_rawcatch_user_id_23b03467_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2960 (class 2606 OID 17256)
-- Name: django_admin_content_type_id_477afe5d_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_477afe5d_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2961 (class 2606 OID 17261)
-- Name: django_admin_log_user_id_226e739d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_226e739d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2972 (class 2606 OID 17519)
-- Name: eez_country_id_10cc4a7_fk_country_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY eez
    ADD CONSTRAINT eez_country_id_10cc4a7_fk_country_id FOREIGN KEY (country_id) REFERENCES country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2968 (class 2606 OID 17544)
-- Name: reconstructe_original_country_fishing_id_5c6ab214_fk_country_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY reconstructed_catch
    ADD CONSTRAINT reconstructe_original_country_fishing_id_5c6ab214_fk_country_id FOREIGN KEY (original_country_fishing_id) REFERENCES country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2969 (class 2606 OID 17550)
-- Name: reconstructed__raw_catch_id_75639228_fk_data_ingest_rawcatch_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY reconstructed_catch
    ADD CONSTRAINT reconstructed__raw_catch_id_75639228_fk_data_ingest_rawcatch_id FOREIGN KEY (raw_catch_id) REFERENCES data_ingest_rawcatch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2965 (class 2606 OID 17526)
-- Name: reconstructed_catch_catch_type_id_17b0ba3b_fk_catch_type_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY reconstructed_catch
    ADD CONSTRAINT reconstructed_catch_catch_type_id_17b0ba3b_fk_catch_type_id FOREIGN KEY (catch_type_id) REFERENCES catch_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2966 (class 2606 OID 17532)
-- Name: reconstructed_catch_eez_id_2f6f5d68_fk_eez_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY reconstructed_catch
    ADD CONSTRAINT reconstructed_catch_eez_id_2f6f5d68_fk_eez_id FOREIGN KEY (eez_id) REFERENCES eez(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2967 (class 2606 OID 17538)
-- Name: reconstructed_catch_fishing_entity_id_5141603d_fk_country_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY reconstructed_catch
    ADD CONSTRAINT reconstructed_catch_fishing_entity_id_5141603d_fk_country_id FOREIGN KEY (fishing_entity_id) REFERENCES country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2970 (class 2606 OID 17556)
-- Name: reconstructed_catch_sector_id_6388b257_fk_fishing_sector_id; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY reconstructed_catch
    ADD CONSTRAINT reconstructed_catch_sector_id_6388b257_fk_fishing_sector_id FOREIGN KEY (sector_id) REFERENCES fishing_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2971 (class 2606 OID 17562)
-- Name: reconstructed_catch_taxon_id_4017bbd5_fk_taxon_taxon_key; Type: FK CONSTRAINT; Schema: public; Owner: recon
--

ALTER TABLE ONLY reconstructed_catch
    ADD CONSTRAINT reconstructed_catch_taxon_id_4017bbd5_fk_taxon_taxon_key FOREIGN KEY (taxon_id) REFERENCES taxon(taxon_key) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: recon
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM recon;
GRANT ALL ON SCHEMA public TO recon;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-04-03 14:11:51

--
-- PostgreSQL database dump complete
--

