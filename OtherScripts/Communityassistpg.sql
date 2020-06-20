--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.3

-- Started on 2020-06-20 11:26:28

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
-- TOC entry 3 (class 3079 OID 25731)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 2 (class 3079 OID 25768)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 278 (class 1255 OID 25779)
-- Name: createpassword(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.createpassword(pass character varying) RETURNS text
    LANGUAGE sql
    AS $$Select crypt(pass, gen_salt('bf', 8))$$;


ALTER FUNCTION public.createpassword(pass character varying) OWNER TO postgres;

--
-- TOC entry 291 (class 1255 OID 25780)
-- Name: validatelogin(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validatelogin(username character varying, pass character varying) RETURNS integer
    LANGUAGE sql
    AS $$
Select LoginKey from LoginTable where PersonUserName =username
and PersonPassword=crypt(pass,PersonPassword)
$$;


ALTER FUNCTION public.validatelogin(username character varying, pass character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 204 (class 1259 OID 25781)
-- Name: businessrule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.businessrule (
    businessrulekey integer NOT NULL,
    businessruletext text NOT NULL
);


ALTER TABLE public.businessrule OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 25787)
-- Name: businessrule_businessrulekey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.businessrule_businessrulekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businessrule_businessrulekey_seq OWNER TO postgres;

--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 205
-- Name: businessrule_businessrulekey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.businessrule_businessrulekey_seq OWNED BY public.businessrule.businessrulekey;


--
-- TOC entry 206 (class 1259 OID 25789)
-- Name: donation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donation (
    donationkey integer NOT NULL,
    personkey integer,
    donationamount numeric NOT NULL,
    donationdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    donationvalidation uuid DEFAULT public.uuid_generate_v4()
);


ALTER TABLE public.donation OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 25797)
-- Name: donation_donationkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.donation_donationkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.donation_donationkey_seq OWNER TO postgres;

--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 207
-- Name: donation_donationkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.donation_donationkey_seq OWNED BY public.donation.donationkey;


--
-- TOC entry 208 (class 1259 OID 25799)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employeekey integer NOT NULL,
    personkey integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 25802)
-- Name: employee_employeekey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employeekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employeekey_seq OWNER TO postgres;

--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 209
-- Name: employee_employeekey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employeekey_seq OWNED BY public.employee.employeekey;


--
-- TOC entry 210 (class 1259 OID 25804)
-- Name: employeeposition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employeeposition (
    employeepositionkey integer NOT NULL,
    employeekey integer,
    positionkey integer,
    employeepositionstartdate date
);


ALTER TABLE public.employeeposition OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 25807)
-- Name: employeeposition_employeepositionkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employeeposition_employeepositionkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employeeposition_employeepositionkey_seq OWNER TO postgres;

--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 211
-- Name: employeeposition_employeepositionkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employeeposition_employeepositionkey_seq OWNED BY public.employeeposition.employeepositionkey;


--
-- TOC entry 212 (class 1259 OID 25809)
-- Name: grantapplication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grantapplication (
    grantapplicationkey integer NOT NULL,
    grantapplicationdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    personkey integer,
    granttypekey integer,
    grantapplicationamount numeric NOT NULL,
    grantapplicationexplain text NOT NULL,
    grantapplicationconfirm uuid DEFAULT public.uuid_generate_v4()
);


ALTER TABLE public.grantapplication OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 25817)
-- Name: grantapplication_grantapplicationkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grantapplication_grantapplicationkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grantapplication_grantapplicationkey_seq OWNER TO postgres;

--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 213
-- Name: grantapplication_grantapplicationkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grantapplication_grantapplicationkey_seq OWNED BY public.grantapplication.grantapplicationkey;


--
-- TOC entry 214 (class 1259 OID 25819)
-- Name: grantreview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grantreview (
    grantreviewkey integer NOT NULL,
    grantapplicationkey integer,
    employeekey integer,
    grantreviewdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    grantreviewcomment text
);


ALTER TABLE public.grantreview OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25826)
-- Name: grantreview_grantreviewkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grantreview_grantreviewkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grantreview_grantreviewkey_seq OWNER TO postgres;

--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 215
-- Name: grantreview_grantreviewkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grantreview_grantreviewkey_seq OWNED BY public.grantreview.grantreviewkey;


--
-- TOC entry 216 (class 1259 OID 25828)
-- Name: grantstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grantstatus (
    grantstatuskey integer NOT NULL,
    grantapplicationkey integer,
    statuskey integer DEFAULT 1,
    grantstatusfinalallocation numeric
);


ALTER TABLE public.grantstatus OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25835)
-- Name: grantstatus_grantstatuskey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grantstatus_grantstatuskey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grantstatus_grantstatuskey_seq OWNER TO postgres;

--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 217
-- Name: grantstatus_grantstatuskey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grantstatus_grantstatuskey_seq OWNED BY public.grantstatus.grantstatuskey;


--
-- TOC entry 218 (class 1259 OID 25837)
-- Name: granttype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.granttype (
    granttypekey integer NOT NULL,
    granttypename character varying(255),
    granttypeonetimemax numeric NOT NULL,
    granttypelifetimemax numeric NOT NULL
);


ALTER TABLE public.granttype OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25843)
-- Name: granttype_granttypekey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.granttype_granttypekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.granttype_granttypekey_seq OWNER TO postgres;

--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 219
-- Name: granttype_granttypekey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.granttype_granttypekey_seq OWNED BY public.granttype.granttypekey;


--
-- TOC entry 220 (class 1259 OID 25845)
-- Name: jobposition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobposition (
    positionkey integer NOT NULL,
    positionname character varying(255),
    positiondescript character varying(255)
);


ALTER TABLE public.jobposition OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25851)
-- Name: jobposition_positionkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobposition_positionkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobposition_positionkey_seq OWNER TO postgres;

--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 221
-- Name: jobposition_positionkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobposition_positionkey_seq OWNED BY public.jobposition.positionkey;


--
-- TOC entry 222 (class 1259 OID 25853)
-- Name: loginhistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loginhistory (
    loginhistorykey integer NOT NULL,
    loginkey integer,
    logintimestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.loginhistory OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25857)
-- Name: loginhistory_loginhistorykey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loginhistory_loginhistorykey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loginhistory_loginhistorykey_seq OWNER TO postgres;

--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 223
-- Name: loginhistory_loginhistorykey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loginhistory_loginhistorykey_seq OWNED BY public.loginhistory.loginhistorykey;


--
-- TOC entry 224 (class 1259 OID 25859)
-- Name: logintable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logintable (
    loginkey integer NOT NULL,
    personkey integer,
    personusername character varying(50) NOT NULL,
    personpassword text NOT NULL
);


ALTER TABLE public.logintable OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25865)
-- Name: logintable_loginkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logintable_loginkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logintable_loginkey_seq OWNER TO postgres;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 225
-- Name: logintable_loginkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logintable_loginkey_seq OWNED BY public.logintable.loginkey;


--
-- TOC entry 226 (class 1259 OID 25867)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    personkey integer NOT NULL,
    personlastname character varying(255) NOT NULL,
    personfirstname character varying(255),
    personemail character varying(255) NOT NULL,
    personprimaryphone character(13),
    persondateadded date NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25873)
-- Name: person_personkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_personkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_personkey_seq OWNER TO postgres;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 227
-- Name: person_personkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_personkey_seq OWNED BY public.person.personkey;


--
-- TOC entry 228 (class 1259 OID 25875)
-- Name: personaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personaddress (
    personaddresskey integer NOT NULL,
    personkey integer,
    personaddressstreet character varying(255) NOT NULL,
    personaddresscity character varying(255) DEFAULT 'Seattle'::character varying,
    personaddressstate character(2) DEFAULT 'WA'::bpchar,
    personaddresszipcode character(11) NOT NULL,
    personaddressapt character varying(255)
);


ALTER TABLE public.personaddress OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25883)
-- Name: personaddress_personaddresskey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personaddress_personaddresskey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personaddress_personaddresskey_seq OWNER TO postgres;

--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 229
-- Name: personaddress_personaddresskey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personaddress_personaddresskey_seq OWNED BY public.personaddress.personaddresskey;


--
-- TOC entry 230 (class 1259 OID 25885)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    statuskey integer NOT NULL,
    statusname character varying(255) NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25888)
-- Name: status_statuskey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_statuskey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_statuskey_seq OWNER TO postgres;

--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 231
-- Name: status_statuskey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_statuskey_seq OWNED BY public.status.statuskey;


--
-- TOC entry 2825 (class 2604 OID 25890)
-- Name: businessrule businessrulekey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businessrule ALTER COLUMN businessrulekey SET DEFAULT nextval('public.businessrule_businessrulekey_seq'::regclass);


--
-- TOC entry 2828 (class 2604 OID 25891)
-- Name: donation donationkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donation ALTER COLUMN donationkey SET DEFAULT nextval('public.donation_donationkey_seq'::regclass);


--
-- TOC entry 2829 (class 2604 OID 25892)
-- Name: employee employeekey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employeekey SET DEFAULT nextval('public.employee_employeekey_seq'::regclass);


--
-- TOC entry 2830 (class 2604 OID 25893)
-- Name: employeeposition employeepositionkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeeposition ALTER COLUMN employeepositionkey SET DEFAULT nextval('public.employeeposition_employeepositionkey_seq'::regclass);


--
-- TOC entry 2833 (class 2604 OID 25894)
-- Name: grantapplication grantapplicationkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grantapplication ALTER COLUMN grantapplicationkey SET DEFAULT nextval('public.grantapplication_grantapplicationkey_seq'::regclass);


--
-- TOC entry 2835 (class 2604 OID 25895)
-- Name: grantreview grantreviewkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grantreview ALTER COLUMN grantreviewkey SET DEFAULT nextval('public.grantreview_grantreviewkey_seq'::regclass);


--
-- TOC entry 2837 (class 2604 OID 25896)
-- Name: grantstatus grantstatuskey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grantstatus ALTER COLUMN grantstatuskey SET DEFAULT nextval('public.grantstatus_grantstatuskey_seq'::regclass);


--
-- TOC entry 2838 (class 2604 OID 25897)
-- Name: granttype granttypekey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.granttype ALTER COLUMN granttypekey SET DEFAULT nextval('public.granttype_granttypekey_seq'::regclass);


--
-- TOC entry 2839 (class 2604 OID 25898)
-- Name: jobposition positionkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobposition ALTER COLUMN positionkey SET DEFAULT nextval('public.jobposition_positionkey_seq'::regclass);


--
-- TOC entry 2841 (class 2604 OID 25899)
-- Name: loginhistory loginhistorykey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loginhistory ALTER COLUMN loginhistorykey SET DEFAULT nextval('public.loginhistory_loginhistorykey_seq'::regclass);


--
-- TOC entry 2842 (class 2604 OID 25900)
-- Name: logintable loginkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logintable ALTER COLUMN loginkey SET DEFAULT nextval('public.logintable_loginkey_seq'::regclass);


--
-- TOC entry 2843 (class 2604 OID 25901)
-- Name: person personkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN personkey SET DEFAULT nextval('public.person_personkey_seq'::regclass);


--
-- TOC entry 2846 (class 2604 OID 25902)
-- Name: personaddress personaddresskey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personaddress ALTER COLUMN personaddresskey SET DEFAULT nextval('public.personaddress_personaddresskey_seq'::regclass);


--
-- TOC entry 2847 (class 2604 OID 25903)
-- Name: status statuskey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN statuskey SET DEFAULT nextval('public.status_statuskey_seq'::regclass);


--
-- TOC entry 3018 (class 0 OID 25781)
-- Dependencies: 204
-- Data for Name: businessrule; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.businessrule VALUES (2, 'Every person is given a login in the logintable.');
INSERT INTO public.businessrule VALUES (3, 'In the logintable the user name is the first letter of the first name and the whole last name.');
INSERT INTO public.businessrule VALUES (4, 'For our purposes the plain text password is the user last name concatenated with the word "Pass."');
INSERT INTO public.businessrule VALUES (5, 'Applicants can only apply for a grant of one of the listed types.');
INSERT INTO public.businessrule VALUES (7, 'Each grant must be reviewed by an employee.');
INSERT INTO public.businessrule VALUES (1, 'All users, whether employees, donors, or applicants, are stored in the person table.');
INSERT INTO public.businessrule VALUES (6, 'Each type has a one-time maximum and a lifetime maximum that can be applied for.');
INSERT INTO public.businessrule VALUES (8, 'A grant has a current status: pending, granted, reduced, or denied.');


--
-- TOC entry 3020 (class 0 OID 25789)
-- Dependencies: 206
-- Data for Name: donation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.donation VALUES (1, 6, 500.00, '2020-05-12 00:00:00', '74222c8c-b7f3-4d67-b8d4-8f43a07f9225');
INSERT INTO public.donation VALUES (2, 7, 2500.00, '2020-05-21 00:00:00', '01ff6159-b134-43d5-be9d-d6ea5c9106aa');
INSERT INTO public.donation VALUES (3, 8, 350.00, '2020-06-01 00:00:00', '6618b608-079a-4bd2-84fa-61981b3a1cee');
INSERT INTO public.donation VALUES (4, 9, 1200.00, '2020-06-10 00:00:00', '7bb28f93-6937-4f0a-bec0-9f4df128f3ce');
INSERT INTO public.donation VALUES (5, 10, 500.00, '2020-06-15 00:00:00', 'f51c6b38-a935-42a0-b06e-e4e1b5ce37f1');
INSERT INTO public.donation VALUES (6, 11, 5000.00, '2020-06-17 00:00:00', '16393bc5-2c5a-40bb-a079-f72dcc5f0cc0');
INSERT INTO public.donation VALUES (7, 12, 150.00, '2020-06-17 00:00:00', 'c38ce26b-0397-4e9b-b8b4-cee2a87240b6');
INSERT INTO public.donation VALUES (8, 13, 750.00, '2020-06-02 00:00:00', 'd888b0cd-76de-4d56-aad7-4bf6bac6d390');
INSERT INTO public.donation VALUES (9, 14, 500.00, '2020-07-03 00:00:00', '02a78f2f-0dd9-4b20-8d11-6b28bea299b9');
INSERT INTO public.donation VALUES (10, 15, 1500.00, '2020-07-06 00:00:00', '912f87be-0bae-461e-8e3a-d352f3d40ef5');
INSERT INTO public.donation VALUES (11, 19, 3000.00, '2020-07-15 00:00:00', '263cb5f6-51c5-401b-bd2f-0bdb617b4abe');
INSERT INTO public.donation VALUES (12, 20, 250.00, '2020-07-15 00:00:00', '1f210920-96eb-413a-a95c-989574f576b3');
INSERT INTO public.donation VALUES (13, 21, 1500.00, '2020-08-10 00:00:00', '8b11cc9f-07a8-4f85-8736-31e2442dd567');
INSERT INTO public.donation VALUES (14, 22, 1000.00, '2020-08-22 00:00:00', 'b1d39d36-8f19-4dbf-ab65-95432f9697f0');
INSERT INTO public.donation VALUES (15, 23, 3000.00, '2020-08-23 00:00:00', 'd3546e5a-a234-450f-9301-27d3df8fecbe');
INSERT INTO public.donation VALUES (16, 28, 345.50, '2020-09-05 00:00:00', '8ec89fca-e872-4952-ae9b-53871c304b67');
INSERT INTO public.donation VALUES (17, 30, 1360.00, '2020-09-10 00:00:00', '4e4c5f84-d263-4655-be64-94db974f20d9');
INSERT INTO public.donation VALUES (18, 31, 1000.50, '2020-09-15 00:00:00', 'fb92ade3-f133-4476-8780-039221a26bc1');
INSERT INTO public.donation VALUES (19, 33, 500.50, '2020-09-18 00:00:00', 'd6b6798d-a4d4-4e55-aae4-170f2899d85f');
INSERT INTO public.donation VALUES (20, 35, 125.50, '2020-09-21 00:00:00', 'd9ecc45d-567e-4a6d-a60e-757b3f03215c');
INSERT INTO public.donation VALUES (21, 38, 100, '2020-10-10 00:00:00', '90c75b08-73fe-4ce3-82a5-c26ef12f2318');
INSERT INTO public.donation VALUES (22, 39, 125.50, '2020-10-15 00:00:00', '1fcf0a59-c8ca-4646-873b-b728653c94c4');
INSERT INTO public.donation VALUES (23, 42, 350.00, '2020-10-18 00:00:00', 'c7a21fb4-5bf9-4c0d-9340-28b177ff5be8');
INSERT INTO public.donation VALUES (24, 43, 500.00, '2020-10-22 00:00:00', 'ff9de7ab-67f0-4305-ad4a-039296198a81');
INSERT INTO public.donation VALUES (25, 44, 50.00, '2020-10-28 00:00:00', '53dede8b-ba60-4bf7-8f0f-c1f182a3f905');
INSERT INTO public.donation VALUES (26, 48, 900.00, '2020-11-15 00:00:00', 'f55ff3cb-cf60-4484-86a0-917c9df87d69');
INSERT INTO public.donation VALUES (27, 50, 25, '2020-11-20 00:00:00', 'd58ad6f4-f1e2-4cc8-bfed-920d061abb58');
INSERT INTO public.donation VALUES (28, 52, 250, '2020-11-25 00:00:00', '3f4a1b2f-2820-4e13-ba9f-7094258ba7a2');
INSERT INTO public.donation VALUES (29, 55, 650, '2020-12-02 00:00:00', '0f3c90a1-2f9e-432c-a83f-026322546b04');
INSERT INTO public.donation VALUES (30, 57, 100, '2020-12-05 00:00:00', 'd71da278-4bdd-42ed-866e-62adb6796509');
INSERT INTO public.donation VALUES (31, 60, 365, '2020-12-16 00:00:00', 'fd1c7807-28ac-4803-bc59-999317ee1cae');
INSERT INTO public.donation VALUES (32, 61, 25, '2020-12-20 00:00:00', 'b3c35b14-b0bc-4647-9b7d-723915e2717a');
INSERT INTO public.donation VALUES (33, 13, 400, '2020-12-23 00:00:00', '4ea7a776-097c-4833-b85b-bc716e7f58d6');
INSERT INTO public.donation VALUES (34, 20, 25, '2020-12-23 00:00:00', '967f7773-e0f7-40a3-91a5-c33bb2b49c73');
INSERT INTO public.donation VALUES (35, 28, 500, '2020-12-29 00:00:00', '3becd3e7-c105-49bc-ab2b-abd6ee7a0936');
INSERT INTO public.donation VALUES (36, 66, 300, '2021-01-06 00:00:00', '7b025821-99ab-438b-9a14-df5e4d3189b8');
INSERT INTO public.donation VALUES (37, 68, 150.00, '2021-01-15 00:00:00', 'd9c87cc3-95c9-4d03-88d4-41fa0947ee33');
INSERT INTO public.donation VALUES (38, 69, 1250.95, '2021-01-18 00:00:00', '6c0436d0-747e-4cfc-8b63-018f0c42c09d');
INSERT INTO public.donation VALUES (39, 70, 500, '2021-01-27 00:00:00', '51b8f165-ddc2-4138-b80a-57bf00166f4f');
INSERT INTO public.donation VALUES (40, 73, 450.00, '2021-02-05 00:00:00', '835b3553-af82-4675-9204-696691f43ab1');
INSERT INTO public.donation VALUES (41, 74, 325.50, '2021-02-12 00:00:00', '7225be5f-53a8-4e2c-8b3b-a145b8a9a9fa');
INSERT INTO public.donation VALUES (42, 77, 5000.00, '2021-03-18 00:00:00', '4a669977-3d23-4d6a-a08c-4e0c80ff09c9');
INSERT INTO public.donation VALUES (43, 79, 5000.00, '2021-03-20 00:00:00', 'f49f3e4e-02e8-4922-aa86-f8c2c4600423');
INSERT INTO public.donation VALUES (44, 80, 225.00, '2021-03-26 00:00:00', '477f4a32-4ee8-4d21-ad27-1f5a900501d7');
INSERT INTO public.donation VALUES (45, 84, 500.00, '2021-04-18 00:00:00', '56a72eeb-60ad-45cd-8275-12b76af926c0');
INSERT INTO public.donation VALUES (46, 87, 500.00, '2021-05-12 00:00:00', 'b33aba05-cbdb-4bf5-95ae-c8c329d87084');
INSERT INTO public.donation VALUES (47, 88, 325.00, '2021-05-15 00:00:00', 'f7660d83-794a-40d9-9cdd-f74122c53267');
INSERT INTO public.donation VALUES (48, 89, 1200.00, '2021-05-18 00:00:00', '7f367adf-eeb4-4c0a-b116-4cf99388cdc0');
INSERT INTO public.donation VALUES (49, 94, 145.00, '2021-07-07 00:00:00', '20b08b43-4a8d-4689-ba88-f72f55bb2098');
INSERT INTO public.donation VALUES (50, 97, 2500.00, '2021-07-18 00:00:00', '81437882-2985-423e-98e6-f127ccfcfa96');
INSERT INTO public.donation VALUES (51, 100, 1200.00, '2021-07-28 00:00:00', '7d729637-5229-4c2a-a333-a60c56e87f1b');
INSERT INTO public.donation VALUES (52, 101, 500.00, '2021-08-12 00:00:00', '4f892380-c3ea-4fe8-9a14-2fdacd8c92d0');
INSERT INTO public.donation VALUES (53, 102, 250.00, '2021-08-12 00:00:00', '4698ab71-b562-4346-a3f4-82c39198588a');
INSERT INTO public.donation VALUES (54, 103, 900.00, '2021-08-12 00:00:00', 'cd639c83-d973-4972-bf6e-7e59f95a1c5b');
INSERT INTO public.donation VALUES (55, 105, 325.50, '2021-09-07 00:00:00', '8869868b-ea7d-4971-8d8f-19af621a5008');
INSERT INTO public.donation VALUES (56, 106, 750.50, '2021-09-13 00:00:00', 'b7500e8c-2b44-4e0a-ab61-2773ce2646fe');
INSERT INTO public.donation VALUES (57, 107, 200.00, '2021-09-21 00:00:00', '0dd00e41-2c92-4cca-9446-64b5b5cab299');
INSERT INTO public.donation VALUES (58, 112, 450.00, '2021-10-13 00:00:00', '1b14a299-f77b-429b-aa78-5266a728e4c3');
INSERT INTO public.donation VALUES (59, 113, 500.00, '2021-10-13 00:00:00', 'e646ea03-161d-4103-932e-55904d32a378');
INSERT INTO public.donation VALUES (60, 114, 950.00, '2021-10-13 00:00:00', '748732ca-129c-4253-989a-fc1ce3488363');
INSERT INTO public.donation VALUES (61, 116, 1300.00, '2021-11-03 00:00:00', '178f8f74-ec8f-4fc1-ba35-f75c9c5ff6e5');
INSERT INTO public.donation VALUES (62, 120, 250.00, '2021-11-19 00:00:00', 'ee4512d3-d447-4930-a909-cd6c893d12a9');
INSERT INTO public.donation VALUES (63, 121, 2500.00, '2021-11-21 00:00:00', '3c76b2e5-e3a5-4d12-9925-10060a2289a6');
INSERT INTO public.donation VALUES (64, 122, 10000.00, '2021-11-03 00:00:00', '130227fd-7b2b-4738-af0a-33dc41c7e602');
INSERT INTO public.donation VALUES (65, 127, 200.00, '2021-12-13 00:00:00', '21246a8d-898f-4167-9fa3-2d100df5286b');
INSERT INTO public.donation VALUES (66, 128, 500.00, '2021-12-15 00:00:00', '05447efd-f66c-4709-ad7f-c8d8ba3de842');
INSERT INTO public.donation VALUES (67, 131, 700.00, '2021-12-20 00:00:00', '2ee17529-be8b-47b3-b90d-892de6f2c427');


--
-- TOC entry 3022 (class 0 OID 25799)
-- Dependencies: 208
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee VALUES (1, 1);
INSERT INTO public.employee VALUES (2, 3);
INSERT INTO public.employee VALUES (3, 4);
INSERT INTO public.employee VALUES (4, 5);
INSERT INTO public.employee VALUES (5, 17);
INSERT INTO public.employee VALUES (6, 29);
INSERT INTO public.employee VALUES (7, 58);


--
-- TOC entry 3024 (class 0 OID 25804)
-- Dependencies: 210
-- Data for Name: employeeposition; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employeeposition VALUES (9, 1, 1, '2019-02-02');
INSERT INTO public.employeeposition VALUES (10, 1, 2, '2019-02-02');
INSERT INTO public.employeeposition VALUES (11, 1, 6, '2019-02-02');
INSERT INTO public.employeeposition VALUES (12, 2, 4, '2019-02-03');
INSERT INTO public.employeeposition VALUES (13, 3, 3, '2019-02-02');
INSERT INTO public.employeeposition VALUES (14, 4, 5, '2019-02-03');
INSERT INTO public.employeeposition VALUES (15, 4, 7, '2019-02-03');
INSERT INTO public.employeeposition VALUES (17, 6, 4, '2019-09-10');
INSERT INTO public.employeeposition VALUES (16, 5, 9, '2019-03-01');
INSERT INTO public.employeeposition VALUES (5, 7, 8, '2019-12-05');


--
-- TOC entry 3026 (class 0 OID 25809)
-- Dependencies: 212
-- Data for Name: grantapplication; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grantapplication VALUES (2, '2020-07-13 00:00:00', 18, 2, 500, 'I am short on rent this month', '7cf2b79d-83fb-4d8e-8869-fd8e3bbccc3f');
INSERT INTO public.grantapplication VALUES (3, '2020-08-25 00:00:00', 24, 7, 200, 'I need help with childcare until my check comes in from my new job', 'c7111d67-2784-4d84-ae84-8932c3542db9');
INSERT INTO public.grantapplication VALUES (4, '2020-08-25 00:00:00', 15, 1, 225, 'I need help with food for my family', '0c0616a2-1119-49c8-b6fa-daea1e701789');
INSERT INTO public.grantapplication VALUES (5, '2020-08-26 00:00:00', 26, 4, 200, 'I need help paying my dental bill', 'd7d7ce2a-caa9-45fd-880a-67de04a168ef');
INSERT INTO public.grantapplication VALUES (7, '2020-09-17 00:00:00', 32, 2, 600, 'I need help covering my rent this month', '030dc2f8-36c0-40d3-9c86-586dcfd6f827');
INSERT INTO public.grantapplication VALUES (8, '2020-10-03 00:00:00', 36, 1, 150, 'I need help with groceries', '17a94dcb-a532-4c8b-ad8a-485527ba1afd');
INSERT INTO public.grantapplication VALUES (6, '2020-08-23 00:00:00', 28, 9, 200, 'I need house repairs that can''t wait', '9d689406-698a-4c13-a229-d311884d7ff2');
INSERT INTO public.grantapplication VALUES (11, '2020-10-18 00:00:00', 41, 1, 120.00, 'I need extra grocery money to feed the kids', '7a8e1a68-9594-4f5f-8501-9055dff79965');
INSERT INTO public.grantapplication VALUES (12, '2020-11-01 00:00:00', 45, 2, 200, 'I am 200 short this month on my rent', 'c144e697-dae6-4bb5-b3be-8f9df00b9106');
INSERT INTO public.grantapplication VALUES (15, '2020-11-17 00:00:00', 49, 9, 125.00, 'I have higher than usual utility bills this month', 'c2d639d5-b056-4926-8fa5-8e0e594bd2d0');
INSERT INTO public.grantapplication VALUES (16, '2020-11-26 00:00:00', 53, 3, 450.00, 'My financial aid was dropped and I need this much to retain classes', '2f58d290-fbcb-4fed-b1b6-f15c244fd0c8');
INSERT INTO public.grantapplication VALUES (17, '2020-11-27 00:00:00', 54, 1, 150.00, 'food stamp allotment was lowered', '213c77cc-54ca-4d75-a0ca-88d3b13340b7');
INSERT INTO public.grantapplication VALUES (18, '2020-12-03 00:00:00', 56, 2, 800.00, 'I can''t cover rent this month', '4730b1ca-8437-4fab-8cd2-b1d6f8007404');
INSERT INTO public.grantapplication VALUES (19, '2020-12-15 00:00:00', 59, 7, 375.50, 'Just started a new job and need help with first childcare payment', '87aa9d67-604f-41b8-900a-dd8a233e9f2f');
INSERT INTO public.grantapplication VALUES (20, '2020-12-20 00:00:00', 62, 1, 450.00, 'Just need a little help with groceries', 'fc4c3921-2697-4bec-8ac2-7ca96fc28f4a');
INSERT INTO public.grantapplication VALUES (22, '2021-02-03 00:00:00', 72, 2, 1300.00, 'Unable to pay rent this month', '08ae6b8d-5a7b-4a8c-b33e-f5c947be993a');
INSERT INTO public.grantapplication VALUES (23, '2021-02-21 00:00:00', 75, 7, 250, 'Need help with childcare this month', '90578696-ae0a-4cf7-8701-4ca24cf91707');
INSERT INTO public.grantapplication VALUES (24, '2021-03-12 00:00:00', 76, 3, 200, 'I need help getting my school books', '69bcdedf-8027-49f4-b3e6-2cff4fffec06');
INSERT INTO public.grantapplication VALUES (25, '2021-03-20 00:00:00', 78, 5, 800.74, 'I had an accident and had unexpected medical costs', 'd240b254-8e29-4267-8d1d-5b50730df217');
INSERT INTO public.grantapplication VALUES (26, '2021-04-01 00:00:00', 81, 4, 600, 'I must have a wisdom tooth extracted', '9c952804-af0a-40ed-b94c-37c78513c520');
INSERT INTO public.grantapplication VALUES (27, '2021-04-05 00:00:00', 82, 4, 300, 'I need help with childcare', '6ec30c2c-52f2-4780-92b4-3519485cdcf6');
INSERT INTO public.grantapplication VALUES (28, '2021-04-11 00:00:00', 83, 1, 200, 'After bills I have nothing left to buy food with', 'b4f3b81c-9f38-439b-a018-a48a517d5290');
INSERT INTO public.grantapplication VALUES (29, '2021-04-01 00:00:00', 85, 7, 200, 'I have a new job and need help with childcare until I am paid', '4e40f3b5-2e84-47bd-9584-9f9e7a840bb3');
INSERT INTO public.grantapplication VALUES (30, '2021-05-05 00:00:00', 86, 1, 200, 'Rent took all my money and I have none left over for food', '03277d80-a434-46b7-b827-3a1b22f463c7');
INSERT INTO public.grantapplication VALUES (31, '2021-05-23 00:00:00', 90, 7, 200, 'I am a little short for childcare this month', '484796e4-0925-45af-881f-5f1d632504ba');
INSERT INTO public.grantapplication VALUES (32, '2021-06-08 00:00:00', 91, 4, 200, 'I needed a root canal. This 200 only makes one payment', 'f6d2b5a3-d409-498d-829f-3e2c772d9807');
INSERT INTO public.grantapplication VALUES (33, '2021-06-19 00:00:00', 92, 7, 250, 'I can''t make my childcare payment this month', 'cf05b39e-aed5-4fa8-9800-42a1fde04ca0');
INSERT INTO public.grantapplication VALUES (35, '2021-07-12 00:00:00', 95, 5, 500.00, 'I injured my back while moving to this apartment', '8cdad9e0-4bb7-4153-baf8-53ea5427ddfb');
INSERT INTO public.grantapplication VALUES (36, '2021-07-13 00:00:00', 96, 1, 200, 'I need help feeding my kids', '1f334ca3-7c7d-4fc5-87d5-3cfe02029462');
INSERT INTO public.grantapplication VALUES (37, '2021-07-21 00:00:00', 98, 5, 300.00, 'I injured my back while moving to this apartment', '4abc24bb-340e-4690-b88e-fdb9f9aefe50');
INSERT INTO public.grantapplication VALUES (38, '2021-07-12 00:00:00', 99, 4, 200.00, 'I need help paying for an emergency dental appointment', '4c7096d4-252b-473f-8c20-e844e40a9e4f');
INSERT INTO public.grantapplication VALUES (39, '2021-09-03 00:00:00', 104, 3, 500.00, 'Financial aid is not covering all my tuition', '8dc5dc81-4e99-41cc-b9b5-08047f8ae642');
INSERT INTO public.grantapplication VALUES (40, '2021-09-07 00:00:00', 108, 3, 300.00, 'I need help purchasing textbooks', '37af5a0d-5c35-4d73-b22a-e58021e10ead');
INSERT INTO public.grantapplication VALUES (41, '2021-09-23 00:00:00', 109, 2, 500.00, 'I need help paying the deposit on my new apartment', '1ffacefd-45b1-4140-9672-8bbc207af22b');
INSERT INTO public.grantapplication VALUES (42, '2021-09-27 00:00:00', 110, 7, 500.00, 'Childcare has an initial deposit that I can''t pay', '6c2ed5fe-4e8a-4c5d-a7e7-69f86a124891');
INSERT INTO public.grantapplication VALUES (44, '2021-10-20 00:00:00', 115, 7, 200.00, 'Need help with childcare expenses', '2561c601-031a-4d78-a508-29ae24893fb8');
INSERT INTO public.grantapplication VALUES (45, '2021-11-07 00:00:00', 117, 2, 200.00, 'I spent all my money on rent and school', '87c3f963-840d-42ee-8ce0-82adbd213c95');
INSERT INTO public.grantapplication VALUES (46, '2021-11-12 00:00:00', 118, 1, 800.00, 'I lost a roommate and can''t cover his rent', '5b1a6865-82e8-453f-806e-f37753d96ea0');
INSERT INTO public.grantapplication VALUES (47, '2021-11-16 00:00:00', 119, 3, 200.00, 'I really need to get the biology textbook', 'b421d5de-641a-46f1-b86c-1c54a4535b84');
INSERT INTO public.grantapplication VALUES (48, '2021-11-25 00:00:00', 123, 4, 200.00, 'I need to make a payment to my dentist', '15f41439-5121-4527-a0d2-ee3230ad725c');
INSERT INTO public.grantapplication VALUES (49, '2021-11-28 00:00:00', 124, 1, 200.00, 'I overspent my budget this month and can''t afford groceries', '63a04145-a3df-4f88-81c3-c5c324eceec3');
INSERT INTO public.grantapplication VALUES (53, '2021-12-20 00:00:00', 130, 3, 600.00, 'I need to purchase a laptop for my computer classes', 'a1137b89-b408-46d5-8a04-ec385c5c796b');
INSERT INTO public.grantapplication VALUES (9, '2020-10-10 00:00:00', 37, 7, 425, 'I can''t cover childcare this month', 'ae61fd44-3de8-479b-9d5b-55329c23bd89');
INSERT INTO public.grantapplication VALUES (10, '2020-10-17 00:00:00', 40, 4, 426.79, 'I had emergency dental work and cannot pay this remainder', '8fae8cc6-f830-4b98-beba-b746cd80e9f5');
INSERT INTO public.grantapplication VALUES (13, '2020-11-03 00:00:00', 46, 7, 500, 'I have unexpected childcare costs', '9019e32a-e7a3-4184-9dbb-167b9a19d04a');
INSERT INTO public.grantapplication VALUES (43, '2021-09-30 00:00:00', 111, 9, 150.00, 'I need this to pay dues for an apprenticeship', '6e8356d7-222d-4526-8321-7c56ea404380');
INSERT INTO public.grantapplication VALUES (51, '2021-12-07 00:00:00', 126, 7, 300.00, 'I need money for an initial childcare payment', '6d4d4cef-d680-4538-85d1-4601c119b752');
INSERT INTO public.grantapplication VALUES (52, '2021-12-18 00:00:00', 129, 3, 450.00, 'I need help with tuition for the coming quarter. It is my last quarter', 'bff6e559-76ed-4289-81f6-b708f79ceb4f');
INSERT INTO public.grantapplication VALUES (54, '2021-12-22 00:00:00', 132, 5, 400.00, 'Help paying off an emergency room visit', '06032ddb-1598-40ed-b409-b9c67770d2b3');
INSERT INTO public.grantapplication VALUES (1, '2020-07-06 00:00:00', 16, 3, 450, 'I managed tuition but I cannot afford the math and biology textbooks.', '43ae7bd1-7dc1-4f6a-9406-2b0ee41dd6f4');
INSERT INTO public.grantapplication VALUES (14, '2020-11-10 00:00:00', 47, 2, 350, 'A roommate left and I have to cover his rent this month', '47c69261-fe1e-4e5c-9955-29ae37c1c368');
INSERT INTO public.grantapplication VALUES (21, '2020-12-21 00:00:00', 63, 4, 650.00, 'I had to have an emergency root canal', '5836d15c-6cc3-4f52-a09b-0f188add1bcc');
INSERT INTO public.grantapplication VALUES (34, '2021-06-08 00:00:00', 93, 2, 800, 'A roommate left and I have to cover his payment until I get a new roommate', '2704f8ad-0953-434c-bea7-20adaf905473');
INSERT INTO public.grantapplication VALUES (50, '2021-12-02 00:00:00', 125, 7, 150.00, 'I had to change childcare providers and there is an initial deposit.', '11e1d585-1d98-4629-a207-70e3fa93fa87');


--
-- TOC entry 3028 (class 0 OID 25819)
-- Dependencies: 214
-- Data for Name: grantreview; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grantreview VALUES (34, 29, 1, '2021-04-12 00:00:00', 'Recommend. Somehow this one got away from me. Took too long to respond.');
INSERT INTO public.grantreview VALUES (66, 53, 6, '2021-12-02 00:00:00', 'I suggest grant. Also we should maybe make computers and phones a new category for grants.');
INSERT INTO public.grantreview VALUES (1, 1, 2, '2020-07-07 00:00:00', 'Request seems reasonable, recommend grant.');
INSERT INTO public.grantreview VALUES (2, 2, 2, '2020-07-15 00:00:00', 'Recommend grant.');
INSERT INTO public.grantreview VALUES (3, 3, 2, '2020-08-27 00:00:00', 'Recommend grant.');
INSERT INTO public.grantreview VALUES (4, 4, 2, '2020-08-27 00:00:00', 'We have located other resources to help, reduce grant to 150.');
INSERT INTO public.grantreview VALUES (5, 5, 2, '2020-08-27 00:00:00', 'Looking into making a payment arrangement with dentist.');
INSERT INTO public.grantreview VALUES (6, 5, 2, '2020-07-07 00:00:00', 'Payment arranged, deny grant.');
INSERT INTO public.grantreview VALUES (7, 6, 6, '2020-08-25 00:00:00', 'We found other means for the applicant to get help with house repairs.');
INSERT INTO public.grantreview VALUES (8, 7, 2, '2020-09-20 00:00:00', 'Recommend grant but explore other solutions for future shortfalls.');
INSERT INTO public.grantreview VALUES (11, 10, 2, '2020-10-18 00:00:00', 'Very specific amount. Suggest granting.');
INSERT INTO public.grantreview VALUES (12, 11, 2, '2020-10-18 00:00:00', 'Grant one time, but we should look at alternative funding.');
INSERT INTO public.grantreview VALUES (13, 12, 6, '2020-10-18 00:00:00', 'Suggest granting.');
INSERT INTO public.grantreview VALUES (15, 14, 6, '2020-11-12 00:00:00', 'Suggest request be  granted.');
INSERT INTO public.grantreview VALUES (16, 15, 2, '2020-11-18 00:00:00', 'Grant.');
INSERT INTO public.grantreview VALUES (17, 16, 6, '2020-11-27 00:00:00', 'Can''t pay tuition for this person every quarter.');
INSERT INTO public.grantreview VALUES (18, 16, 6, '2020-11-28 00:00:00', 'On follow up, this is last quarter, recommend grant.');
INSERT INTO public.grantreview VALUES (19, 17, 2, '2020-11-28 00:00:00', 'This could be an ongoing problem grant once then follow up to find other solutions.');
INSERT INTO public.grantreview VALUES (20, 18, 2, '2020-12-03 00:00:00', 'We can''t fund every month''s rent.');
INSERT INTO public.grantreview VALUES (21, 18, 2, '2020-12-04 00:00:00', 'We arranged an additional roommate. Request reduced to 300--one time only.');
INSERT INTO public.grantreview VALUES (22, 19, 6, '2020-12-15 00:00:00', 'Grant.');
INSERT INTO public.grantreview VALUES (44, 36, 6, '2021-07-15 00:00:00', 'Grant one time. Referred to other services.');
INSERT INTO public.grantreview VALUES (45, 37, 6, '2021-07-22 00:00:00', 'Similar to recent claim, but this one does have medical documentation. Grant.');
INSERT INTO public.grantreview VALUES (46, 38, 6, '2021-07-14 00:00:00', 'Grant.');
INSERT INTO public.grantreview VALUES (47, 39, 1, '2021-09-04 00:00:00', 'Recommend granting but also finding other assistance.');
INSERT INTO public.grantreview VALUES (48, 40, 1, '2021-09-09 00:00:00', 'Recommend grant.');
INSERT INTO public.grantreview VALUES (49, 41, 6, '2021-09-29 00:00:00', 'Recommend grant.');
INSERT INTO public.grantreview VALUES (50, 42, 6, '2021-09-29 00:00:00', 'Recommend grant.');
INSERT INTO public.grantreview VALUES (51, 43, 1, '2021-10-01 00:00:00', 'Recommend granting but also finding other assistance.');
INSERT INTO public.grantreview VALUES (52, 44, 1, '2021-10-20 00:00:00', 'Suggest granting but find other longer term help.');
INSERT INTO public.grantreview VALUES (58, 45, 1, '2021-11-08 00:00:00', 'Recommend granting with further counseling.');
INSERT INTO public.grantreview VALUES (59, 46, 6, '2021-11-14 00:00:00', 'Found a roommate. Cancel request.');
INSERT INTO public.grantreview VALUES (60, 47, 6, '2021-11-16 00:00:00', 'Grant.');
INSERT INTO public.grantreview VALUES (61, 48, 1, '2021-11-27 00:00:00', 'Grant. Also note: we really need to increase size of grants for dental.');
INSERT INTO public.grantreview VALUES (62, 49, 6, '2021-11-29 00:00:00', 'Not specific about how overspent. Deny and provide counseling.');
INSERT INTO public.grantreview VALUES (63, 50, 1, '2021-12-02 00:00:00', 'Grant.');
INSERT INTO public.grantreview VALUES (64, 51, 1, '2021-12-07 00:00:00', 'Grant.');
INSERT INTO public.grantreview VALUES (65, 52, 1, '2021-12-18 00:00:00', 'Grant.');
INSERT INTO public.grantreview VALUES (67, 54, 6, '2021-12-22 00:00:00', 'Grant.');
INSERT INTO public.grantreview VALUES (9, 8, 6, '2020-10-05 00:00:00', 'Recommend grant.');
INSERT INTO public.grantreview VALUES (10, 9, 6, '2020-10-11 00:00:00', 'Recommend one-time grant.');
INSERT INTO public.grantreview VALUES (14, 13, 6, '2020-11-03 00:00:00', 'This is a reasonable one-time request.');
INSERT INTO public.grantreview VALUES (24, 21, 2, '2020-12-23 00:00:00', 'Arranged payment schedule with dentist, reduce to 200.');
INSERT INTO public.grantreview VALUES (23, 20, 2, '2020-12-21 00:00:00', 'Need to find additional funding directed to food bank reduce to 150.');
INSERT INTO public.grantreview VALUES (25, 22, 1, '2021-02-03 00:00:00', 'This looks like a recurring issue. We should find alternate solution.');
INSERT INTO public.grantreview VALUES (27, 23, 1, '2021-02-23 00:00:00', 'Grant request.');
INSERT INTO public.grantreview VALUES (28, 24, 1, '2021-03-14 00:00:00', 'Recommend granting.');
INSERT INTO public.grantreview VALUES (29, 25, 1, '2021-03-24 00:00:00', 'Recommend granting but would like another review.');
INSERT INTO public.grantreview VALUES (30, 25, 6, '2021-03-25 00:00:00', 'I concur. It is a one-time expense.');
INSERT INTO public.grantreview VALUES (31, 26, 1, '2021-04-02 00:00:00', 'We met with dentist and have reduced the amount to 300.');
INSERT INTO public.grantreview VALUES (33, 28, 6, '2021-04-11 00:00:00', 'Recommend grant but also getting client enrolled for financial planning.');
INSERT INTO public.grantreview VALUES (35, 30, 6, '2021-05-05 00:00:00', 'Doesn''t seem to be an ongoing problem. Recommend grant.');
INSERT INTO public.grantreview VALUES (37, 32, 1, '2021-06-10 00:00:00', 'Recommend pay.');
INSERT INTO public.grantreview VALUES (38, 33, 6, '2021-06-20 00:00:00', 'Recommend pay, but also help find other resources.');
INSERT INTO public.grantreview VALUES (39, 34, 6, '2021-06-10 00:00:00', 'Recommend, also help find a roommate.');
INSERT INTO public.grantreview VALUES (40, 35, 6, '2021-07-14 00:00:00', 'Not sure of this one. I don''t think it is a legitimate claim.');
INSERT INTO public.grantreview VALUES (41, 35, 1, '2021-07-15 00:00:00', 'I agree. There is no medical record.');
INSERT INTO public.grantreview VALUES (42, 35, 6, '2021-07-15 00:00:00', 'Decision to deny.');
INSERT INTO public.grantreview VALUES (43, 36, 1, '2021-07-15 00:00:00', 'Legitimate, but we need to find longer term assistance.');
INSERT INTO public.grantreview VALUES (26, 22, 6, '2021-02-04 00:00:00', 'Agreed. Have directed the client to Rent Assistance org.');
INSERT INTO public.grantreview VALUES (32, 27, 1, '2021-04-06 00:00:00', 'This is a recurring problem. I directed her to other agencies that could provide more long-term help..');
INSERT INTO public.grantreview VALUES (36, 31, 6, '2021-05-25 00:00:00', 'Recommend grant.');


--
-- TOC entry 3030 (class 0 OID 25828)
-- Dependencies: 216
-- Data for Name: grantstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grantstatus VALUES (1, 1, 2, 450);
INSERT INTO public.grantstatus VALUES (2, 2, 2, 500);
INSERT INTO public.grantstatus VALUES (3, 3, 2, 300);
INSERT INTO public.grantstatus VALUES (4, 4, 3, 150);
INSERT INTO public.grantstatus VALUES (5, 5, 4, 0);
INSERT INTO public.grantstatus VALUES (6, 6, 4, 0);
INSERT INTO public.grantstatus VALUES (7, 7, 1, 600);
INSERT INTO public.grantstatus VALUES (8, 8, 1, 150);
INSERT INTO public.grantstatus VALUES (9, 9, 1, 425);
INSERT INTO public.grantstatus VALUES (10, 10, 2, 469.79);
INSERT INTO public.grantstatus VALUES (11, 11, 2, 120);
INSERT INTO public.grantstatus VALUES (12, 12, 2, 200);
INSERT INTO public.grantstatus VALUES (13, 13, 2, 500);
INSERT INTO public.grantstatus VALUES (14, 14, 2, 350);
INSERT INTO public.grantstatus VALUES (15, 15, 2, 125);
INSERT INTO public.grantstatus VALUES (16, 16, 2, 450.00);
INSERT INTO public.grantstatus VALUES (17, 17, 2, 150.00);
INSERT INTO public.grantstatus VALUES (18, 18, 3, 300.00);
INSERT INTO public.grantstatus VALUES (19, 19, 2, 375.50);
INSERT INTO public.grantstatus VALUES (20, 20, 3, 150.00);
INSERT INTO public.grantstatus VALUES (21, 21, 2, 200.00);
INSERT INTO public.grantstatus VALUES (22, 22, 4, 0.00);
INSERT INTO public.grantstatus VALUES (23, 23, 2, 250.00);
INSERT INTO public.grantstatus VALUES (24, 24, 2, 200.00);
INSERT INTO public.grantstatus VALUES (25, 25, 2, 800.74);
INSERT INTO public.grantstatus VALUES (26, 26, 3, 300);
INSERT INTO public.grantstatus VALUES (27, 27, 4, 0.00);
INSERT INTO public.grantstatus VALUES (28, 28, 2, 200);
INSERT INTO public.grantstatus VALUES (29, 29, 2, 200);
INSERT INTO public.grantstatus VALUES (30, 30, 2, 200.00);
INSERT INTO public.grantstatus VALUES (31, 31, 2, 200.00);
INSERT INTO public.grantstatus VALUES (32, 32, 2, 200.00);
INSERT INTO public.grantstatus VALUES (33, 33, 2, 250.00);
INSERT INTO public.grantstatus VALUES (34, 34, 2, 800);
INSERT INTO public.grantstatus VALUES (35, 35, 4, 0.00);
INSERT INTO public.grantstatus VALUES (36, 36, 2, 200.00);
INSERT INTO public.grantstatus VALUES (37, 37, 2, 300.00);
INSERT INTO public.grantstatus VALUES (38, 38, 2, 200.00);
INSERT INTO public.grantstatus VALUES (39, 39, 2, 500.00);
INSERT INTO public.grantstatus VALUES (40, 40, 2, 300.00);
INSERT INTO public.grantstatus VALUES (41, 41, 2, 500.00);
INSERT INTO public.grantstatus VALUES (42, 42, 2, 500.00);
INSERT INTO public.grantstatus VALUES (43, 43, 2, 150.00);
INSERT INTO public.grantstatus VALUES (44, 44, 2, 200.00);
INSERT INTO public.grantstatus VALUES (45, 45, 2, 200.00);
INSERT INTO public.grantstatus VALUES (46, 46, 4, 0.00);
INSERT INTO public.grantstatus VALUES (47, 47, 2, 200.00);
INSERT INTO public.grantstatus VALUES (48, 48, 2, 200.00);
INSERT INTO public.grantstatus VALUES (49, 45, 4, 0.00);
INSERT INTO public.grantstatus VALUES (50, 50, 2, 150.00);
INSERT INTO public.grantstatus VALUES (51, 51, 2, 300.00);
INSERT INTO public.grantstatus VALUES (52, 52, 2, 450.00);
INSERT INTO public.grantstatus VALUES (53, 53, 2, 600.00);
INSERT INTO public.grantstatus VALUES (54, 54, 2, 400.00);


--
-- TOC entry 3032 (class 0 OID 25837)
-- Dependencies: 218
-- Data for Name: granttype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.granttype VALUES (1, 'Food', 200, 600);
INSERT INTO public.granttype VALUES (2, 'Rent', 800, 1600);
INSERT INTO public.granttype VALUES (3, 'School', 600, 2400);
INSERT INTO public.granttype VALUES (4, 'Dental', 200, 600);
INSERT INTO public.granttype VALUES (5, 'Medical', 700, 3000);
INSERT INTO public.granttype VALUES (6, 'Travel', 600, 2800);
INSERT INTO public.granttype VALUES (7, 'Childcare', 300, 5000);
INSERT INTO public.granttype VALUES (9, 'Misc', 200, 800);
INSERT INTO public.granttype VALUES (8, 'Funeral', 900, 900);


--
-- TOC entry 3034 (class 0 OID 25845)
-- Dependencies: 220
-- Data for Name: jobposition; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.jobposition VALUES (1, 'President', NULL);
INSERT INTO public.jobposition VALUES (3, 'Grant Manager', NULL);
INSERT INTO public.jobposition VALUES (4, 'Grant Reviewer', NULL);
INSERT INTO public.jobposition VALUES (8, 'Volunteer', NULL);
INSERT INTO public.jobposition VALUES (2, 'Manager', NULL);
INSERT INTO public.jobposition VALUES (6, 'Publicist', NULL);
INSERT INTO public.jobposition VALUES (9, 'Accounting Assistant', NULL);
INSERT INTO public.jobposition VALUES (5, 'Donation Manager', NULL);
INSERT INTO public.jobposition VALUES (7, 'Accounting Manager', NULL);


--
-- TOC entry 3036 (class 0 OID 25853)
-- Dependencies: 222
-- Data for Name: loginhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.loginhistory VALUES (1, 30, '2021-04-13 10:29:58.370608');


--
-- TOC entry 3038 (class 0 OID 25859)
-- Dependencies: 224
-- Data for Name: logintable; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logintable VALUES (113, 112, 'tmandela', '$2a$08$CpZasMah9wlv8cRfRtSsI..DQvjluKq3uXK/va.qvVfIb6NEGZyXa');
INSERT INTO public.logintable VALUES (114, 113, 'lsnow', '$2a$08$8qNOJHfRXCaRpBkqZ3f0cuExU9BePwCauXkB4uxcZ3ZXk2aonU.jC');
INSERT INTO public.logintable VALUES (115, 114, 'amiller', '$2a$08$thkuP/o3ULNIAAzYwqEkmez9gcodXMDv1FggZUA1u3TcemjGx64FC');
INSERT INTO public.logintable VALUES (116, 115, 'jrogers', '$2a$08$n7TBCiiYyPvJ8nv04dGuDOlQOFH5XYErUYApc6/irDW99pxmf2Kgq');
INSERT INTO public.logintable VALUES (117, 116, 'msung', '$2a$08$k0IPFAHYVg/huXkAkzhI0.Gm2h8QnOz2IKFMveixRxZ7X6Iugcd4G');
INSERT INTO public.logintable VALUES (118, 117, 'ljones', '$2a$08$97GMkGYs4uXqydwFbpf.VOxQam.w0CFDBCjTFPIy38qwiuebKpUXS');
INSERT INTO public.logintable VALUES (119, 118, 'nxui', '$2a$08$qDkkpGAgltr.uZMRfQHepedHo3Uc7s8oBdR3ID7yXlgDHAC9Polv2');
INSERT INTO public.logintable VALUES (120, 119, 'lyun', '$2a$08$4FZNeBR0F4D3FJmN4Cdw6uW4COHmx9CKMPCCYTSx6QMEFptkDiB.q');
INSERT INTO public.logintable VALUES (121, 120, 'pkendrick', '$2a$08$yHH47j7TEQlozEN6wen.muHdCNXMjQYxsSL4eFKclLALLPq6R90ae');
INSERT INTO public.logintable VALUES (122, 121, 'tbaker', '$2a$08$wcsQoQydsmCwdqdg0VG4NO33FjPDx4gwq9r2XSkx0lVzwGQvRgQke');
INSERT INTO public.logintable VALUES (123, 122, 'sliddell', '$2a$08$sjgKF7IZFEP63o5NtMV3OuRPuU25RSHyIYhgyCcarxoYouFuLCXE6');
INSERT INTO public.logintable VALUES (124, 123, 'lnguyen', '$2a$08$eJNiqYlBTOlfmwHZisERV.XfAMB4rbCYGMJX9KLoRJzslHQPr1.Ni');
INSERT INTO public.logintable VALUES (125, 124, 'sbrowning', '$2a$08$.ZAQFneFqhkOKnrSTAOb.uhIoFhwDZruOwDvFw9wDW7N04tqcBSYu');
INSERT INTO public.logintable VALUES (126, 125, 'cstevens', '$2a$08$I1c7MPF3gs4LHKAuWGh0KerfIr73QgSr/yqZCvvqQW0P6y8bj8Grq');
INSERT INTO public.logintable VALUES (127, 126, 'bsteeler', '$2a$08$SbafHG2nIDtU2tynOUTYq.IYSohqWtliwUsnpLYVuKvky0Z1A8cBS');
INSERT INTO public.logintable VALUES (128, 127, 'pdavidson', '$2a$08$P9xcBjS6yuWLyaqpwVp.sOjSKa30aiZyM7I0022cVsUDkdaMKhXzm');
INSERT INTO public.logintable VALUES (129, 128, 'jdexter', '$2a$08$emuXaCD4SUM4NIIXIKDxduhne8M6ETsYjqZw6xQXFrSwzqVZw9hLG');
INSERT INTO public.logintable VALUES (130, 129, 'jnorman', '$2a$08$zuknjbek3IuryzDW/ypmJO7g5V5UUu9UJ8uDBpr4ot.lZhKDaJ3Dq');
INSERT INTO public.logintable VALUES (131, 130, 'mnelson', '$2a$08$UjlIlUoSeDBlyhSsVcxwdOI402IGEZwOgoFUFpY.2f7WH3k9UbSdq');
INSERT INTO public.logintable VALUES (132, 131, 'tmason', '$2a$08$Inp0.8FsTlDWBxYCd0gZiusC9au7t94fCNS0FB9JafqBg/S4OQij2');
INSERT INTO public.logintable VALUES (133, 132, 'fjohnson', '$2a$08$Vo.oCXfumxFTtvl.5Ol84OxegpY46YCQqmo.2pxuU3aclJ9VWLM/W');
INSERT INTO public.logintable VALUES (2, 2, 'clinda', '$2a$08$3VFMFhs0pc3KjTqEmzZLbu5.liR2wYfW5AetcLS117.cqRVRLn3X2');
INSERT INTO public.logintable VALUES (5, 4, 'tzimmerman', '$2a$08$yFuRfljXEz5gK9T.aoFcyuQVrnVAZseyqxQu5l1JRpFwhGcY/htSK');
INSERT INTO public.logintable VALUES (7, 6, 'bcarmel', '$2a$08$EF1G4w42G6RkaYwUbHrdPudd.Mmt9fWtlAN/I7k0jrDoz8CgLf1w6');
INSERT INTO public.logintable VALUES (8, 7, 'mlewis', '$2a$08$Wwlq7L/vL5yPAI/XcLFPueGBheNGGAq9/NpgDonL78VPslQoD77C2');
INSERT INTO public.logintable VALUES (9, 8, 'ttanner', '$2a$08$cSMLFSdHFA3Zya8PlhOTX.BViAu.AHwQIVZ1M8GNfOn8BE.qAwp.K');
INSERT INTO public.logintable VALUES (10, 9, 'jpatterson', '$2a$08$oD//4949bUJa25vAm/Ha2.2It00DmTzxYwPCMPo83Cxo705uhRBQu');
INSERT INTO public.logintable VALUES (11, 10, 'mbrown', '$2a$08$4tgo67NGnCnFHN0U3VD8B.vfd.amxIw/mIJLnn3I5vlCoORoMmzLK');
INSERT INTO public.logintable VALUES (12, 11, 'jsmith', '$2a$08$SzrRddhBpjm.hjP2HKMoL.1jlb.cwFPSxV5ngXup2IDFZxl6BgSDq');
INSERT INTO public.logintable VALUES (13, 12, 'jpeters', '$2a$08$0gLLAwP9njd0.5.zery3IuNr9O0eAh0OVza61N0x.TLIf76wcEdLW');
INSERT INTO public.logintable VALUES (14, 13, 'fmasters', '$2a$08$JfeRqeQEOVOGKbDW6JUU/eVaPtjdR.5nXAJ.YeRIu5lfUPC4ITeYC');
INSERT INTO public.logintable VALUES (15, 14, 'tmoon', '$2a$08$orXNQ08u504Z.02mIviiNuVmsWkwcKm8NEJGJgeHIRG8OHyo.bhg.');
INSERT INTO public.logintable VALUES (16, 15, 'lnguyen', '$2a$08$mrBWmAj/nn1ZuAgr0dUCdOHjM4LXpyTbeyDRIC5dN4edLdIVjvNj.');
INSERT INTO public.logintable VALUES (17, 16, 'mchau', '$2a$08$WmyPSOKohRvHcUtWZrFyA.fbLG1xfbAPDZBdvJ7C9oxq.B1mjG.Va');
INSERT INTO public.logintable VALUES (19, 18, 'mrobinson', '$2a$08$FwwWtXJ/Dn9Zrr1SK/qmx.krDL/zjbthoVjk8BoT.cpwFk57Uvhzq');
INSERT INTO public.logintable VALUES (20, 19, 'mtaylor', '$2a$08$SMpLsYRrr3FXvQ9MWOeq8.SQxwq4zyK82AWRXlK9f6qHtHFGeIPA2');
INSERT INTO public.logintable VALUES (21, 20, 'amcgraw', '$2a$08$2OmtcvCBYqLcHpj9NJM7zuZ3EW6jUQnyGr8mkj25q28sPgP4Q2VDW');
INSERT INTO public.logintable VALUES (22, 21, 'cmorgan', '$2a$08$fg.1Slou/as0zyW6kPN0RuBFmB7RsqhAcztA1L6sY7.se1iDqAkCy');
INSERT INTO public.logintable VALUES (23, 22, 'ltan', '$2a$08$OrnzVXziT353iYEwaDUQ6eN1sf4Iaml5q2IKOi7v6vUYAclMo6psa');
INSERT INTO public.logintable VALUES (24, 23, 'rjameson', '$2a$08$PDvmqU3h7gvD3RWpp3wPMOvlsFBiMLtiyKbq7KfPKUebszmwnPB4W');
INSERT INTO public.logintable VALUES (25, 24, 'jbanner', '$2a$08$bZF8CMooY5f4ocgGIYoP9ehkdE1VcoAemrXupCCVaKtKkTWMEBATO');
INSERT INTO public.logintable VALUES (26, 25, 'tlee', '$2a$08$e8k.TneYS5aSwlhNPf/xWu6xz7RpJWp6c5/ntmmbrLpf6ek2ig5Iu');
INSERT INTO public.logintable VALUES (27, 26, 'jfabre', '$2a$08$0gLEcxMPNak.xG5QrOLe3eZg4j6ykgQML4G69GBgZx40Sui8GgsBq');
INSERT INTO public.logintable VALUES (28, 27, 'tgardner', '$2a$08$ZWELqeMDHaiYykpeepxNJOmAggrY9L92sDy1CJmu9Nalwv.tXKy5K');
INSERT INTO public.logintable VALUES (29, 28, 'byesler', '$2a$08$2P3Lz6LRXBlC2mn/nzgdUONkvSTMn7O.M6wVRmw0dFeeBItM1LI3y');
INSERT INTO public.logintable VALUES (31, 30, 'tlamont', '$2a$08$xSwsi.NW/KjGn/jAyqZ0eeLVUhqxHmYmcrpCtRmNcnDYrff1bCD..');
INSERT INTO public.logintable VALUES (32, 31, 'sjohnston', '$2a$08$I1wiJdFSsyreRlDOtfF5DOnwrZmf3kfaAvsj33sVzAgafESvOpCzC');
INSERT INTO public.logintable VALUES (33, 32, 'jeliot', '$2a$08$O5bkbJW75qjkn6kv1RljuulCGYlVAN6mgcUMQd9LTA8QSCQqivKYS');
INSERT INTO public.logintable VALUES (34, 33, 'jnguyen', '$2a$08$75ugpw3f7rvboU2GoQUuW.jwQLFLLDdru2NDSFfi7WBtd.sT5jnBe');
INSERT INTO public.logintable VALUES (35, 34, 'lperry', '$2a$08$UYhwdhRKRCipFKSf0vnujemP1GZqJJHE32xnr0nFoobjttU3Q5iz6');
INSERT INTO public.logintable VALUES (36, 35, 'cnortan', '$2a$08$DaLzvrYt7MMw0uNQMbUJael2RCr0Qdm6DPR32R8bPnETp/1coHpym');
INSERT INTO public.logintable VALUES (37, 36, 'mfarris', '$2a$08$zN/OSJYnfpZsLmG2TIKTnek2Upj2SyDBX5AHfkNPMGfS8AUUGV77y');
INSERT INTO public.logintable VALUES (38, 37, 'tfarmer', '$2a$08$8y1G8PPx5mi4Ofdft3Q4HuP8.lteMXI5su5UNrpXdAV39O4iSAVje');
INSERT INTO public.logintable VALUES (39, 38, 'lsanders', '$2a$08$m4z14fo4giHCsQ3P9IREoe2MEnSEHiRcx1hhr7pYjBphEC6In2X3e');
INSERT INTO public.logintable VALUES (40, 39, 'jsmith', '$2a$08$KiNMCOpem3U.QBVk8PmR1ep3BoZdBtCTWCZtOczr0pOl90JjBD25m');
INSERT INTO public.logintable VALUES (41, 40, 'pzukof', '$2a$08$hNbNE/7ti1o8zrrZqaQXYeG1wcm.SyLM0EjrwQcnAoEZ2pNREr2Oi');
INSERT INTO public.logintable VALUES (42, 41, 'kkim', '$2a$08$BwDBi8xXL21P1X0Q6fKxmue5ffBkegYJUZUCdFpmT6ENmOdmHC6gG');
INSERT INTO public.logintable VALUES (43, 42, 'tnorman', '$2a$08$Y796r6KeTy3pwrBbXMiMcusZuEW75kkBpNnZEm8eabqksjc6kOFnK');
INSERT INTO public.logintable VALUES (44, 43, 'cmanning', '$2a$08$zz1mrXOxHhSjtQvVd.z8ge018DXzYspW1uyt2cUH1FKnhwM9r/CoK');
INSERT INTO public.logintable VALUES (45, 44, 'lpatton', '$2a$08$mrmkME2qqY4D2yOnEj0eauOcS9P6qGOAx9HkE1AUM5LvdQH8wy81G');
INSERT INTO public.logintable VALUES (46, 45, 'ajorgenson', '$2a$08$2o5roAruPbmuGrjZnZZ7quCyExfsABuM9DsqbqhSxvmmb7mY0skRS');
INSERT INTO public.logintable VALUES (47, 46, 'fscheider', '$2a$08$ELJynyP0xeGeEBrc4KaSCOLylSkxgKf/7Hzb1CS/A5FKc4UagUWzC');
INSERT INTO public.logintable VALUES (48, 47, 'klee', '$2a$08$y82IrVnw1xdeXr./jTaNzOr9qHbe59mGPTa1SOZmmd/5Lcswlucjm');
INSERT INTO public.logintable VALUES (49, 48, 'pdenny', '$2a$08$KdNcAPACGgi/HbpAcRlp1.isER9W7D0QFx5LGCUmxBG74iWYJl/Y.');
INSERT INTO public.logintable VALUES (50, 49, 'jconner', '$2a$08$eped0YaWC57o0RlWzLn4BOynR.mvy40DIPLmRJdpFkllGa7wHdA8.');
INSERT INTO public.logintable VALUES (51, 50, 'akeanne', '$2a$08$.GxTlVVEnwK005qjqaeYX.6XzwME7es1tEwYcpIfz6FlEx61IrwD2');
INSERT INTO public.logintable VALUES (52, 51, 'jmeuller', '$2a$08$ubDR/PYCcs0VEIlBz5aAguU/JBVYGQfGjRNOgJBvEJQwODIxcO01u');
INSERT INTO public.logintable VALUES (53, 52, 'crogers', '$2a$08$1/w6ZMuDEipwWYYIQih1fOrYfES8soCl8Jvjv2N0TjBjh1I5c6.vm');
INSERT INTO public.logintable VALUES (54, 53, 'sponge', '$2a$08$lEq8S6NAqdhM.tBkQnn.ouPf2MZlb3/vtwHAnio/6p5CG7avcl/u.');
INSERT INTO public.logintable VALUES (55, 54, 'ctanner', '$2a$08$amu5G4QY1GiiHzVFaPKkxeU7pCEDW4M6T1YfLP9x2.n4mMIIXUXYu');
INSERT INTO public.logintable VALUES (6, 5, 'rvaldez', '$2a$08$AQcRJOVHdIKw4UHJQDs/t.5r2gnk.K7y5wk.m0nXPxd9PWGg15KCK');
INSERT INTO public.logintable VALUES (18, 17, 'skerry', '$2a$08$eYl7A90dEpNL/7D8ASjYT.87QI13jAlBIRBByyFvi5v5dBu.dWfea');
INSERT INTO public.logintable VALUES (56, 55, 'solson', '$2a$08$.Cg8BrrSO4J54hMefl5dQ.91/LnXtwpCD8oeEn4OMeCeDjo8Rjp/i');
INSERT INTO public.logintable VALUES (57, 56, 'jrobertson', '$2a$08$p6CX2Ie0U1PY6Wuou5JhWewDLYMiqO6z5157FRT35OalJqVumiSwu');
INSERT INTO public.logintable VALUES (58, 57, 'jjameson', '$2a$08$iecvg8sM5Kd/34F59bqpUuvNRAqCvJvkvBOeAma9RqSVrGQBj2L12');
INSERT INTO public.logintable VALUES (59, 58, 'cmaster', '$2a$08$kImGC.siFvIvsxLRUmClPOhTAFZSqgcMiAzJLe8ds9AWn7g99lfqq');
INSERT INTO public.logintable VALUES (60, 59, 'mnelson', '$2a$08$66Sbu442eKisL66KS3HB2eqY8EBwjKJ8C8B8ZXd67sM9JEUQ//q3C');
INSERT INTO public.logintable VALUES (61, 60, 'mpearson', '$2a$08$PhXED4kROL/YdzTRCJfDNOC.JuJmklh1uJYB3HDUgrWbIVgH/PODC');
INSERT INTO public.logintable VALUES (62, 61, 'jlynn', '$2a$08$hwLcEABI73TFHpAqTo0R2O9A3PR5RNSATLJTqOMhBPGkWpNn2h83i');
INSERT INTO public.logintable VALUES (63, 62, 'tjohnson', '$2a$08$KET3uhKLdbKqH9YjA6yEgukKMdkNaXYc0G0PLcD39DOYYhLMhUanK');
INSERT INTO public.logintable VALUES (64, 63, 'dthompson', '$2a$08$LjwtZ/sZ3ymHdC8gXmB3ge7oLDvIOLmUSSecvJW/9D8btoSNdbv1K');
INSERT INTO public.logintable VALUES (65, 64, 'lbrown', '$2a$08$F4fm6V7nXwuebb3s1Z.znOR6FWYP2axsYydG4zvNPa0Mdc8f8uZnG');
INSERT INTO public.logintable VALUES (66, 65, 'cnelson', '$2a$08$IrffkZ8WXpKUy1aCmgNlw.NrqLk/J.Iro.lvZrO3ny6L2u8XHoL7q');
INSERT INTO public.logintable VALUES (67, 66, 'mhandle', '$2a$08$4Rnuqdv4DIrbE15VFYZWoeaz.hT8FlyUOiNqwvbW3FeboB0BhtAme');
INSERT INTO public.logintable VALUES (68, 67, 'fcomstead', '$2a$08$uHDcgujas6aPkGVxPVq0n.SuLgm34AomeOe0sKzyCuBMslmayrfEG');
INSERT INTO public.logintable VALUES (69, 68, 'pmanson', '$2a$08$CNufmdTKYei/nElwaaPa0ejz5QbEXv..0Undpm1cRRLxFoIMncM/K');
INSERT INTO public.logintable VALUES (70, 69, 'sbaker', '$2a$08$WsjYBtGK1BGRNl85gAocTuHFaHQaMQasH24s4aAH6toYWchLKJ2mC');
INSERT INTO public.logintable VALUES (71, 70, 'ltmithin', '$2a$08$phx64eKnP0ORcp5AE.W0dOOHCIQlXksRljPnCt0u/HyVADfzWHCBS');
INSERT INTO public.logintable VALUES (72, 71, 'mpeterson', '$2a$08$Vb0LADIfrLZzmOZiKkw/9uJfUGvd.HWnrw40iQYPVaKwl.SUj.vwm');
INSERT INTO public.logintable VALUES (73, 72, 'bsalem', '$2a$08$1MllmqydpDoA2DvbuRbeo.ivdyra0dBqK7ZjktLmrBP5BbKeXkNkG');
INSERT INTO public.logintable VALUES (74, 73, 'kzorn', '$2a$08$J4oauDRo8aIAvej/gUNxs.wtLfPtNnyp28NPtZdQShlexMf5t6HKy');
INSERT INTO public.logintable VALUES (75, 74, 'hbaylor', '$2a$08$yd3roPcA2MQtIJixWvrbEOmJVmaPz8F6658ejbkI66t5FuAxxTWg6');
INSERT INTO public.logintable VALUES (76, 75, 'btaylor', '$2a$08$DxDFlDJqFIXdIZYd23aeYutlnm2MAVCZHhZkK0BPknwbmCjGjUuKq');
INSERT INTO public.logintable VALUES (77, 76, 'lmadison', '$2a$08$rvsuBryXrEmaEoVWc88DQuvs23TbAVuujqr495xDf8I4GWtTlb/Vu');
INSERT INTO public.logintable VALUES (78, 77, 'bgates', '$2a$08$wjuOC2CeJjx5bSQ5p7NarONV87rvwsIS6tZC6ORoM1w/x7fL5A7ke');
INSERT INTO public.logintable VALUES (79, 78, 'lgreen', '$2a$08$pFmiwHn2Yo69DjN7uF06uez3NiRaU.ByFUzqaoETWhgPHy/aDTimG');
INSERT INTO public.logintable VALUES (80, 79, 'pallen', '$2a$08$8iNnCfGtCx50E23feCz4guCB/bgaSpRRNQRMOTlPyvRWK1gKbEfGC');
INSERT INTO public.logintable VALUES (81, 80, 'kfortier', '$2a$08$jRdAR/u2x0.kBcuRHcj8W.urlNDLastqFNn0H1U11P4AfaFmDpWsu');
INSERT INTO public.logintable VALUES (82, 81, 'nlee', '$2a$08$auhSceHLYPyBlaU2PxFW3.mK2PdgU6F0.0bVBEZ2OiSe9V35eqzzO');
INSERT INTO public.logintable VALUES (83, 82, 'jchristensen', '$2a$08$GKSSwzEVgZ73KsWvikMLvOpVKqdCxf/JirZDVih/IK.9uWZkbiWVu');
INSERT INTO public.logintable VALUES (84, 83, 'neliot', '$2a$08$f05SYonPqmf/f6HiSk.YR.9U2flld8FXlwi6HXxD7NTmdM1Q4pVRa');
INSERT INTO public.logintable VALUES (85, 84, 'jweinberg', '$2a$08$4QXKzYMTLj3tjkIWeCmrLeyG7A5Gip2q6.syVdN/c6mvNQH5Mj5.W');
INSERT INTO public.logintable VALUES (86, 81, 'gbeneford', '$2a$08$ukI.WevPk9ItmH2./go2VeMNxmcgxCy79lJF3eBZB9ilB/6gEDgli');
INSERT INTO public.logintable VALUES (87, 86, 'lowens', '$2a$08$AKQNGRtlldznFKTFaVJ4zuuy9ylPyWOLED4N7Sq8O0IWz.v8g7KMi');
INSERT INTO public.logintable VALUES (88, 87, 'hsullivan', '$2a$08$rCbXZ1Of6JoVKP67syi9Cu9vhwCMt1bPKI7ozp6yX0g7FUTYpEP0q');
INSERT INTO public.logintable VALUES (89, 88, 'skingsley', '$2a$08$H0cIl/xMtPv7k0bn8xDbcutGnRY734DN6kHg5qbIafJkXwL.8Dc76');
INSERT INTO public.logintable VALUES (90, 89, 'wmiller', '$2a$08$zqX3smpsNqHVUjpJHvUVXeSyvedb29WCYB8HRpqxIGJsHjDzhcG6G');
INSERT INTO public.logintable VALUES (91, 90, 'lnelson', '$2a$08$uNZ/4rYCmu25SKo/rfyRZePO6IOoyHivZ/9HGy.evC4QnqN5CZdwG');
INSERT INTO public.logintable VALUES (92, 91, 'ntanner', '$2a$08$BHMgTPWXx2Lf2bQSNH1BuOdmlRz8tb1vZ/knY.eavJtiNKxn3FYuq');
INSERT INTO public.logintable VALUES (93, 92, 'ldenten', '$2a$08$Rvk69VpBIvn22uRdh3.jmO.mdI311owyP623qI3nanGFul1d.YDpq');
INSERT INTO public.logintable VALUES (94, 93, 'rclayborne', '$2a$08$PXx5SXVkX5rhmEE9KuCP5OkVR6ha3r5xvW5QtwUdk4z9oEPLihQae');
INSERT INTO public.logintable VALUES (95, 94, 'pmeyer', '$2a$08$unskIwBrFJU.9SPMNDjisO2kYurMNAkmQU116ArrL7bWLWKqeTZAm');
INSERT INTO public.logintable VALUES (96, 95, 'lmithen', '$2a$08$WnBAKgnj9QLnkmjll5SHkuhGEM3QjxhLaQj4Xhqt82jKRY42Cq63G');
INSERT INTO public.logintable VALUES (97, 96, 'ghawks', '$2a$08$mXb.uCQCJlB0oVphghKoPOILR6nfYn5XLbQV76U5bFRQJt8m0qWSm');
INSERT INTO public.logintable VALUES (98, 97, 'mbishop', '$2a$08$pXMQZGl0EmqYv58qPNlUzuCFuw2Z0gsAAgj0/7olkwQ0s8wJtPtnq');
INSERT INTO public.logintable VALUES (99, 98, 'edanielson', '$2a$08$3ybwBe1gkyqi57XTWuFns.7VJNMd6aHUzYrVwkzXDOlw6QzlZxal2');
INSERT INTO public.logintable VALUES (100, 99, 'jskeat', '$2a$08$w2/EbrPPu9rG9pw6ljaNVuLaz5lkkUZryi9ewsUbEN.PDGSyQsq0O');
INSERT INTO public.logintable VALUES (101, 100, 'mlovelace', '$2a$08$BwLgkJBo6ATauVW/Tw6Lk.5/YYJb1fpMc3RtjU4jxWelitEVmjwdS');
INSERT INTO public.logintable VALUES (102, 101, 'jmanners', '$2a$08$bFuQgQiXFHAv8nES5HvYkOdInCPprrFGCyq3ud5trq0FampLW7i4W');
INSERT INTO public.logintable VALUES (104, 103, 'ekerry', '$2a$08$ZWyRqshDbqhTP8aPiC1kN.KlgHF4qIyXBjf22hrTSBBd.VhxbKxw.');
INSERT INTO public.logintable VALUES (105, 104, 'hkendel', '$2a$08$RR8B3h1c./JEvyGrMsx/Su0OSipCjg8GFnyH5AfUahq4HU78qRcwW');
INSERT INTO public.logintable VALUES (106, 105, 'rtaylor', '$2a$08$.fncqQ9O47BrLbeaxusswOZ8BbhlS.BgrMIZFPzO6vkv8HBMGDuwG');
INSERT INTO public.logintable VALUES (107, 106, 'hgrindle', '$2a$08$naaj8pONvebsi0Cl6eIsn.Ly1IA3K/qnS9XyZS/TRUZz5OswCSDXK');
INSERT INTO public.logintable VALUES (108, 107, 'lesperanzo', '$2a$08$aviKrJf.xaae7.OfRlaUa.LOWNV6o0koiBBR/Edll/knds/WqPMD2');
INSERT INTO public.logintable VALUES (109, 108, 'lsusuki', '$2a$08$QQ4nEc0QEWmHt5BBHJDTKOJuNOGjhZUmprd1LYaOEkPvj9Z7fC/Xe');
INSERT INTO public.logintable VALUES (110, 109, 'rvalencia', '$2a$08$DO/mTr.m2e5bWIXl97XbOOPZF6dbDLBOZb5tacAZZ7OyzIn1mmqhi');
INSERT INTO public.logintable VALUES (111, 110, 'rscanlon', '$2a$08$r5hJWxWIXO4TgHXFO3UpHuWkSvZISw1P3lCe6UvMXn6qRJuC3fT4S');
INSERT INTO public.logintable VALUES (112, 111, 'lpham', '$2a$08$0ZQQxfvm0jW5z0MecDZgsuq82qKFgEETvNDfFxaRUoT.mUimF0ezq');
INSERT INTO public.logintable VALUES (103, 102, 'nstmarie', '$2a$08$YCZTHxQE5PXC99N4nJLjKeh39T53ZnM0BudNpMpmf9JlCm7SacMPa');
INSERT INTO public.logintable VALUES (3, 1, 'lkendle', '$2a$08$eDP36KhlLNZnub/VPLyPK.Wq8TzO9afit.hgWdIj98qZiAZmefUEa');
INSERT INTO public.logintable VALUES (4, 3, 'jjacobs', '$2a$08$KF0K//C460U.oX1tcw3FH..MBxAf5q/o6509nRGDnXJA0PFWbBE0q');
INSERT INTO public.logintable VALUES (30, 29, 'shahn', '$2a$08$P3d6CLjUrKivEnFB6Ql9d.M897rLLMNP5XrhpPRG3k4KgJnk0QeN6');


--
-- TOC entry 3040 (class 0 OID 25867)
-- Dependencies: 226
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person VALUES (11, 'Smith', 'Jerry', 'JSmith@gmail.com', '3605555332   ', '2020-06-17');
INSERT INTO public.person VALUES (55, 'Olson', 'Sonya', 'solson@gmail.com', '2585556122   ', '2020-12-02');
INSERT INTO public.person VALUES (4, 'Zimmerman', 'Toby', 'TZimmerman@gmail.com', '2065551212   ', '2019-02-03');
INSERT INTO public.person VALUES (58, 'Master', 'Carley', 'cmasters@msn.com', '2065553332   ', '2019-12-05');
INSERT INTO public.person VALUES (1, 'Kendle', 'Lynn', 'lynn.kendle@gmail.com', '2065551312   ', '2019-02-02');
INSERT INTO public.person VALUES (9, 'Patterson', 'Jody', 'JPatterson@gmail.com', '2065554431   ', '2020-06-10');
INSERT INTO public.person VALUES (13, 'Masters', 'Fae', 'FMasters@gmail.com', '2065552123   ', '2020-06-21');
INSERT INTO public.person VALUES (2, 'Carol', 'Linda', 'LindaCarol@gmail.com', '2065551234   ', '2021-03-25');
INSERT INTO public.person VALUES (6, 'Carmel', 'Bob', 'BCarmel@gmail.com', '2065551202   ', '2020-05-12');
INSERT INTO public.person VALUES (7, 'Lewis', 'Mary', 'MLewis@gmail.com', '3605551000   ', '2020-05-21');
INSERT INTO public.person VALUES (8, 'Tanner', 'Thomas', 'TTanner@gmail.com', '2065553423   ', '2020-06-01');
INSERT INTO public.person VALUES (10, 'Brown', 'Matt', 'MBrown@gmail.com', '2065551113   ', '2020-06-15');
INSERT INTO public.person VALUES (12, 'Peters', 'Jay', 'JPeters@gmail.com', '2065559821   ', '2020-06-17');
INSERT INTO public.person VALUES (14, 'Moon', 'Tina', 'TMoon@gmail.com', '2855553157   ', '2020-07-03');
INSERT INTO public.person VALUES (15, 'Nguyen', 'Lu', 'LNguyen@gmail.com', '2065551223   ', '2020-06-05');
INSERT INTO public.person VALUES (16, 'Chau', 'Mary', 'MChau@gmail.com', '2855550023   ', '2020-07-06');
INSERT INTO public.person VALUES (18, 'Robinson', 'Mike', 'MRobinson@gmail.com', '2065552321   ', '2020-07-13');
INSERT INTO public.person VALUES (19, 'Martin', 'Taylor', 'TMartin@gmail.com', '2065557101   ', '2020-07-15');
INSERT INTO public.person VALUES (20, 'McGraw', 'Alysson', 'AMcGraw@gmail.com', '2065551313   ', '2020-07-15');
INSERT INTO public.person VALUES (21, 'Morgan', 'Cheryl', 'CMorgan@gmail.com', '3605553423   ', '2020-08-10');
INSERT INTO public.person VALUES (22, 'Tan', 'Lee', 'LTan@gmail.com', '2065554534   ', '2020-08-22');
INSERT INTO public.person VALUES (23, 'Jameson', 'Roberto', 'RJameson@gmail.com', '2065553423   ', '2020-08-23');
INSERT INTO public.person VALUES (24, 'Banner', 'June', 'JBanner@gmail.com', '2065554441   ', '2020-08-25');
INSERT INTO public.person VALUES (25, 'Lee', 'Tracy', 'TLee@gmail.com', '2065552212   ', '2020-08-25');
INSERT INTO public.person VALUES (26, 'Fabre', 'Jill', 'JFabre@gmail.com', '2065550191   ', '2020-08-26');
INSERT INTO public.person VALUES (27, 'Gardner', 'Tom', 'TGardner@gmail.com', '3605553219   ', '2020-09-03');
INSERT INTO public.person VALUES (28, 'Yesler', 'Bill', 'BYesler@gmail.com', '2065551128   ', '2020-09-05');
INSERT INTO public.person VALUES (30, 'Lamont', 'Tess', 'TLamont@gmail.com', '2065552323   ', '2020-09-10');
INSERT INTO public.person VALUES (31, 'Johnston', 'Sara', 'SJohnston@gmail.com', '2065558601   ', '2020-09-15');
INSERT INTO public.person VALUES (32, 'Eliot', 'James', 'JEliot@gmail.com', '2585550013   ', '2020-09-17');
INSERT INTO public.person VALUES (33, 'Nguyen', 'Jane', 'JNguyen@gmail.com', '2065551230   ', '2020-09-18');
INSERT INTO public.person VALUES (34, 'Perry', 'Lee', 'LPerry@gmail.com', '2065551029   ', '2020-09-20');
INSERT INTO public.person VALUES (35, 'Norton', 'Carrie', 'CNorton@gmail.com', '2065551113   ', '2020-09-21');
INSERT INTO public.person VALUES (36, 'Farris', 'Mark', 'MFarris@gmail.com', '2065553363   ', '2020-10-03');
INSERT INTO public.person VALUES (37, 'Farmer', 'Tim', 'TFarmer@gmail.com', '2065552127   ', '2020-10-10');
INSERT INTO public.person VALUES (38, 'Sanders', 'Lea', 'LSanders@gmail.com', '2065553487   ', '2020-10-10');
INSERT INTO public.person VALUES (39, 'Smith', 'Jim', 'JohnSmith@msn.com', '2065550032   ', '2020-10-15');
INSERT INTO public.person VALUES (40, 'Zukof', 'Petra', 'PZukof@gmail.com', '2065552134   ', '2020-10-17');
INSERT INTO public.person VALUES (41, 'Kim', 'Karen', 'KKim@gmail.com', '2065553421   ', '2020-10-18');
INSERT INTO public.person VALUES (42, 'Norman', 'Tina', 'TNorman@gmail.com', '3505552321   ', '2020-10-18');
INSERT INTO public.person VALUES (43, 'Manning', 'Carol', 'CManning@gmail.com', '2065558753   ', '2020-10-22');
INSERT INTO public.person VALUES (44, 'Patton', 'Laura', 'LPatton@gmail.com', '2065554765   ', '2020-10-28');
INSERT INTO public.person VALUES (45, 'Jorgenson', 'Amy', 'AJorgenson@gmail.com', '2585553929   ', '2020-11-01');
INSERT INTO public.person VALUES (46, 'Schneider', 'Franz', 'FSchneider@gmail.com', '2065559156   ', '2020-11-03');
INSERT INTO public.person VALUES (47, 'Kim', 'Lee', 'LKim@gmail.com', '2065558176   ', '2020-11-10');
INSERT INTO public.person VALUES (48, 'Denny', 'Phil', 'PDenny@gmail.com', '2065557612   ', '2020-11-15');
INSERT INTO public.person VALUES (49, 'Conner', 'Jessie', 'JConner@gmail.com', '2065553342   ', '2020-11-17');
INSERT INTO public.person VALUES (50, 'Keanne', 'Ann', 'AKeanne@gmail.com', '2065556798   ', '2020-11-20');
INSERT INTO public.person VALUES (51, 'Meuller', 'John', 'JMeuller@gmail.com', '2065553009   ', '2020-11-20');
INSERT INTO public.person VALUES (52, 'Rogers', 'Cherise', 'CRogers@gmail.com', '3605556118   ', '2020-11-25');
INSERT INTO public.person VALUES (53, 'Ponge', 'Sue', 'SPonge@gmail.com', '2065550010   ', '2020-11-26');
INSERT INTO public.person VALUES (54, 'Tanner', 'Chelsea', 'ctanner@gmail.com', '2065559010   ', '2020-11-27');
INSERT INTO public.person VALUES (56, 'Robertson', 'Jeff', 'JeffRobertson@msn.com', '2065556798   ', '2020-12-03');
INSERT INTO public.person VALUES (57, 'Jameson', 'Jessica', 'jj@yahoo.com', '2585556338   ', '2020-12-05');
INSERT INTO public.person VALUES (59, 'Nelson', 'Martha', 'marthan@yahoo.com', '2065554548   ', '2020-12-15');
INSERT INTO public.person VALUES (60, 'Pearson', 'Monica', 'pearson@gmail.com', '3605556454   ', '2020-12-16');
INSERT INTO public.person VALUES (118, 'Xui', 'Nick', 'Xui@yahoo.com', NULL, '2021-11-12');
INSERT INTO public.person VALUES (61, 'Lynn', 'Jennifer', 'jl@aol.com', '2065557331   ', '2020-12-20');
INSERT INTO public.person VALUES (62, 'Johnson', 'Tina', 'tj@msn.com', '2065552121   ', '2020-12-20');
INSERT INTO public.person VALUES (63, 'Thompson', 'Danielle', 'dthompson@msn.com', '2065559939   ', '2020-12-21');
INSERT INTO public.person VALUES (64, 'Brown', 'Leah', 'leahbrown@comcast.com', '2555551353   ', '2021-01-04');
INSERT INTO public.person VALUES (65, 'Nelson', 'Caitlin', 'caitlinnelson@msn.com', '2065559310   ', '2021-01-06');
INSERT INTO public.person VALUES (66, 'Handle', 'Martin', 'handlethis@google.com', '2065554856   ', '2021-01-08');
INSERT INTO public.person VALUES (67, 'Comstad', 'Fred', 'comstad@gmail.com', '2065551211   ', '2021-01-12');
INSERT INTO public.person VALUES (68, 'Manson', 'Patrick', 'pm@gmail.com', '2065554433   ', '2021-01-14');
INSERT INTO public.person VALUES (69, 'Baker', 'Sally', 'sallyb@gmail.com', '3605559010   ', '2021-01-18');
INSERT INTO public.person VALUES (70, 'Mithin', 'Tammy', 'tammy@mithon.org', '2065552232   ', '2021-01-25');
INSERT INTO public.person VALUES (71, 'Peterson', 'Monica', 'mpet@msn.com', '2065552225   ', '2021-01-27');
INSERT INTO public.person VALUES (72, 'Blake', 'Salem', 'salemblake@yahoo.com', '2065552001   ', '2021-02-03');
INSERT INTO public.person VALUES (73, 'Zorn', 'Ken', 'kz@yahoo.com', '2065559923   ', '2021-02-05');
INSERT INTO public.person VALUES (74, 'Baylor', 'Henry', 'hbaylor@uwashington.edu', '2065555535   ', '2021-02-12');
INSERT INTO public.person VALUES (75, 'Taylor', 'Beth', 'btaylor@yahoo.com', '2065552231   ', '2021-02-21');
INSERT INTO public.person VALUES (76, 'Madison', 'Lawrence', 'lmadison@msn.com', '3605552123   ', '2021-03-12');
INSERT INTO public.person VALUES (77, 'Gates', 'Bill', 'ggates@microsoft.com', '2065551111   ', '2021-03-18');
INSERT INTO public.person VALUES (78, 'Green', 'Lewis', 'lg@outlook.com', '2965557735   ', '2021-03-20');
INSERT INTO public.person VALUES (80, 'Fortier', 'Karen', 'KFortier@outlook.com', '2605559090   ', '2021-03-26');
INSERT INTO public.person VALUES (81, 'Nguyen', 'Lee', 'nguyen200@msn.com', '2065553312   ', '2021-04-01');
INSERT INTO public.person VALUES (82, 'Christensen', 'Judy', 'jChristensen@seattleu.edu', '2535552177   ', '2021-04-05');
INSERT INTO public.person VALUES (83, 'Eliot', 'Neil', 'neliot@yahoo.com', '2065557809   ', '2021-04-11');
INSERT INTO public.person VALUES (84, 'Weinberg', 'Jeffery', 'jWeinberg@speakeasy.org', '3605552112   ', '2021-04-18');
INSERT INTO public.person VALUES (85, 'Beneford', 'Gail', 'beneford@gmail.com', '2065552223   ', '2021-04-24');
INSERT INTO public.person VALUES (86, 'Owens', 'Leslie', 'leslieOwen@outlook.com', '2535551002   ', '2021-05-05');
INSERT INTO public.person VALUES (87, 'Sullivan', 'Heather', 'heatherSullivan@gmail.com', '2065551772   ', '2021-05-12');
INSERT INTO public.person VALUES (88, 'Kingsley', 'Sally', 'sk@kingsley.com', '2065553344   ', '2021-05-15');
INSERT INTO public.person VALUES (89, 'Miller', 'Walter', 'waltermiller@yahoo.com', '2535554343   ', '2021-05-18');
INSERT INTO public.person VALUES (90, 'Nelson', 'Leah', 'leah@starwars.org', '2065559922   ', '2021-05-23');
INSERT INTO public.person VALUES (91, 'Tanner', 'Nathan', 'natherntanner@gmail.com', NULL, '2021-06-08');
INSERT INTO public.person VALUES (92, 'Denten', 'Laura', 'ldenten@aol.com', '2065551255   ', '2021-06-19');
INSERT INTO public.person VALUES (93, 'Clayborne', 'Robert', 'rclayborne@outlook.com', '2535550092   ', '2021-06-08');
INSERT INTO public.person VALUES (94, 'Meyer', 'Paul', 'pmeyer@hotmail.com', '2065554340   ', '2021-07-07');
INSERT INTO public.person VALUES (95, 'Mithen', 'Leslie', 'leslie24@hotmail.com', NULL, '2021-07-12');
INSERT INTO public.person VALUES (96, 'Hawks', 'Gina', 'hawks@northwest.org', '2065553332   ', '2021-07-13');
INSERT INTO public.person VALUES (97, 'Bishop', 'Martin', 'mBishop@enterprise.com', '2535555550   ', '2021-07-18');
INSERT INTO public.person VALUES (98, 'Danielson', 'Erin', 'EDanielson@hotmail.com', '2065556672   ', '2021-07-21');
INSERT INTO public.person VALUES (99, 'Skeat', 'Jonathen', 'skeat@newage.com', '2065551212   ', '2021-07-23');
INSERT INTO public.person VALUES (100, 'Lovelace', 'Monica', 'mlove@hotmail.com', '2065557678   ', '2021-07-28');
INSERT INTO public.person VALUES (101, 'Manners', 'Jill', 'jillmanners@outlook.com', '3605552341   ', '2021-08-12');
INSERT INTO public.person VALUES (102, 'St. Marie', 'Nelson', 'nelson@seattleworks.org', '2535552551   ', '2021-08-12');
INSERT INTO public.person VALUES (103, 'Kerry', 'Elizabeth', 'ekerry@gmail.com', '2065558841   ', '2021-08-12');
INSERT INTO public.person VALUES (104, 'Kendel', 'Harriet', 'hkendel@outlook.com', NULL, '2021-09-03');
INSERT INTO public.person VALUES (105, 'Taylor', 'Rachel', 'rtaylor@gmail.com', '2065553379   ', '2021-09-07');
INSERT INTO public.person VALUES (106, 'Grindle', 'Harris', 'hgrindle@outlook.com', '3605551122   ', '2021-09-13');
INSERT INTO public.person VALUES (107, 'Esperanzo', 'Letty', 'esperabzo@aol.com', '2535555533   ', '2021-09-21');
INSERT INTO public.person VALUES (108, 'Susuki', 'Lee', 'leesusuki@emeraldcity.org', NULL, '2021-09-23');
INSERT INTO public.person VALUES (109, 'Valencia', 'Roger', 'rvalencia@gmail.com', '2065553436   ', '2021-09-23');
INSERT INTO public.person VALUES (110, 'Scanlon', 'Renee', 'scanlon@outlook.com', '2065551212   ', '2021-09-27');
INSERT INTO public.person VALUES (111, 'Pham', 'Lee', 'leepham@outlook.com', '3605556768   ', '2021-09-30');
INSERT INTO public.person VALUES (112, 'Mandela', 'Terry', 'tmandela@community.org', '5355552309   ', '2021-10-13');
INSERT INTO public.person VALUES (113, 'Snow', 'Lester', 'lestersnow@hotmail.com', '2065552119   ', '2021-10-13');
INSERT INTO public.person VALUES (114, 'Miller', 'Aldus', 'aldusmiller@gmail.com', '3605551919   ', '2021-10-13');
INSERT INTO public.person VALUES (115, 'Rogers', 'Jill', 'jillRogers@msn.com', '2065558868   ', '2021-10-20');
INSERT INTO public.person VALUES (116, 'Sung', 'Mary', 'marysung@outlook.com', '2065551470   ', '2021-11-03');
INSERT INTO public.person VALUES (117, 'Jones', 'Lester', 'lj@speakeasy.org', '2065553323   ', '2021-11-07');
INSERT INTO public.person VALUES (119, 'Yun', 'Luong', 'Yun@outlook.com', '2535551770   ', '2021-11-16');
INSERT INTO public.person VALUES (120, 'Kendrick', 'Peter', 'pk403@yahoo.com', '2065554434   ', '2021-11-19');
INSERT INTO public.person VALUES (121, 'Baker', 'Tom', 'tombaker@bbc.org', '2065556654   ', '2021-11-21');
INSERT INTO public.person VALUES (122, 'Liddell', 'Scott', 'scottLiddel@oxford.uk.edu', '3605550001   ', '2021-11-23');
INSERT INTO public.person VALUES (123, 'Nguyen', 'Lee', 'leeNguyen@outlook.com', '2065559976   ', '2021-11-25');
INSERT INTO public.person VALUES (124, 'Browning', 'Sally', 'SallyBrowning@aol.com', NULL, '2021-11-28');
INSERT INTO public.person VALUES (125, 'Stevens', 'Carla', 'carlaStevens@msn.com', '2065554343   ', '2021-12-02');
INSERT INTO public.person VALUES (126, 'Steeler', 'Beth', 'bsteeler@hotmail.com', '2065555543   ', '2021-12-07');
INSERT INTO public.person VALUES (127, 'Davidson', 'Pat', 'patDavidson@speakeasy.org', '3605552222   ', '2021-12-13');
INSERT INTO public.person VALUES (128, 'Dexter', 'Johanne', 'johanne.Dexter@msn.com', '2065557747   ', '2021-12-15');
INSERT INTO public.person VALUES (129, 'Norman', 'Jennifer', 'Jennifer@msn.com', '2065554333   ', '2021-12-18');
INSERT INTO public.person VALUES (130, 'Nelson', 'Mark', 'MarkNelson@gmail.com', NULL, '2021-12-20');
INSERT INTO public.person VALUES (131, 'Mason', 'Thomas', 'thomas.mason@msn.com', '2065557892   ', '2021-12-20');
INSERT INTO public.person VALUES (132, 'Johnson', 'Felicia', 'Felicia@gmail.com', '3605551143   ', '2021-12-22');
INSERT INTO public.person VALUES (79, 'Allen', 'Nathan', 'na@outlook.com', '2535550023   ', '2021-03-20');
INSERT INTO public.person VALUES (5, 'Valdez', 'Roberto', 'RValdez@gmail.com', '2065550012   ', '2019-03-01');
INSERT INTO public.person VALUES (3, 'Jacobs', 'Jamal', 'JJamal@gmail.com', '2065551100   ', '2019-02-02');
INSERT INTO public.person VALUES (29, 'Hahn', 'Sue', 'SueHahn@gmail.com', '2065559913   ', '2019-09-10');
INSERT INTO public.person VALUES (17, 'Kerry', 'Samantha', 'SKerry@gmail.com', '2065556712   ', '2019-07-06');


--
-- TOC entry 3042 (class 0 OID 25875)
-- Dependencies: 228
-- Data for Name: personaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personaddress VALUES (10, 7, '111 34th Avenue', 'Bellevue', 'WA', '98006      ', 'Suite 405');
INSERT INTO public.personaddress VALUES (19, 14, '100 Main', 'Bellevue', 'WA', '98006      ', '764B');
INSERT INTO public.personaddress VALUES (27, 21, '214 12th', 'Bellevue', 'WA', '98006      ', '44F');
INSERT INTO public.personaddress VALUES (33, 27, '1000 West Baker', 'Bellevue', 'WA', '98006      ', '120');
INSERT INTO public.personaddress VALUES (59, 52, '1150 3rd Ave', 'Bellevue', 'WA', '98006      ', '890');
INSERT INTO public.personaddress VALUES (65, 57, '100 Market Lane', 'Bellevue', 'WA', '98006      ', NULL);
INSERT INTO public.personaddress VALUES (75, 66, '919 Jefferson Lane', 'Bellevue', 'WA', '98006      ', 'apt 113');
INSERT INTO public.personaddress VALUES (79, 70, '919 Waterview Crest', 'Bellevue', 'WA', '98006      ', NULL);
INSERT INTO public.personaddress VALUES (80, 70, '1200 8th Ave', 'Bellevue', 'WA', '98006      ', 'Suite 607');
INSERT INTO public.personaddress VALUES (23, 18, '1343 Rainier', 'Kent', 'WA', '98031      ', 'O543');
INSERT INTO public.personaddress VALUES (49, 42, '321 North ave', 'Kent', 'WA', '98031      ', '222');
INSERT INTO public.personaddress VALUES (38, 32, '45467 Mason', 'Renton', 'WA', '98055      ', '345');
INSERT INTO public.personaddress VALUES (52, 45, '121 Trainside', 'Renton', 'WA', '98055      ', '214');
INSERT INTO public.personaddress VALUES (62, 55, '95 West Hannford', 'Tukwila', 'WA', '98108      ', 'Suite 545');
INSERT INTO public.personaddress VALUES (122, 76, '303 Eastlake Way', 'Seattle ', 'WA', '98100      ', NULL);
INSERT INTO public.personaddress VALUES (142, 96, '1201 East 8th', 'Bellevue', 'WA', '98006      ', '756');
INSERT INTO public.personaddress VALUES (182, 114, '204 56th Street', 'Redmond', 'WA', '98033      ', NULL);
INSERT INTO public.personaddress VALUES (198, 130, '217 Sount Meridian', 'Puyallup', 'WA', '98371      ', '101');
INSERT INTO public.personaddress VALUES (189, 121, '900 West Fifth', 'New York', 'NY', '10005      ', NULL);
INSERT INTO public.personaddress VALUES (148, 102, '213 NorthGate Blvd', NULL, 'WA', '98100      ', NULL);
INSERT INTO public.personaddress VALUES (1, 1, '1001 South Benton Street', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (2, 1, '1012 Harvard Ave', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (3, 2, '1232 East Meridian', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (4, 1, '201 South Benson st', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (5, 2, '1200 Division st', 'Seattle', 'WA', '98122      ', '101');
INSERT INTO public.personaddress VALUES (6, 3, '34 Broadway', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (7, 4, '232 Pine', 'Seattle', 'WA', '98122      ', 'suite 203');
INSERT INTO public.personaddress VALUES (8, 5, '1400 12th Ave', 'Seattle', 'WA', '98122      ', 'Rm 192');
INSERT INTO public.personaddress VALUES (9, 6, '990 Lakeside Drive', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (11, 7, '101 4th Avenue', 'Seattle', 'WA', '98122      ', 'Suite 625');
INSERT INTO public.personaddress VALUES (12, 8, '345 24th', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (13, 9, '222 Westlake', 'Seattle', 'WA', '98122      ', '201');
INSERT INTO public.personaddress VALUES (14, 10, '212 Ballard Ave', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (15, 11, '5021 Pike', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (16, 12, 'Meridian', 'Seattle', 'WA', '98122      ', '3A');
INSERT INTO public.personaddress VALUES (17, 13, '15th Ave', 'Seattle', 'WA', '98122      ', '201');
INSERT INTO public.personaddress VALUES (18, 14, '213 Central', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (20, 15, '234 Harvard', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (21, 16, '1900 8th', 'Seattle', 'WA', '98122      ', '232');
INSERT INTO public.personaddress VALUES (22, 17, '1450 Elm', 'Seattle', 'WA', '98122      ', '34D');
INSERT INTO public.personaddress VALUES (24, 18, '1023 Fisherman Drive', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (25, 19, '235 4th Avenue', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (26, 20, '212 Bell', 'Seattle', 'WA', '98122      ', '230');
INSERT INTO public.personaddress VALUES (28, 22, '33 Michigan ', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (29, 23, '176 Brown Street', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (30, 24, '1827 Ballard', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (31, 25, '3939 45th', 'Seattle', 'WA', '98122      ', '301');
INSERT INTO public.personaddress VALUES (32, 26, '3434 50th', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (34, 28, '200 North Elm', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (35, 29, 'North 220 Lakeside', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (36, 30, '2432 21st street', 'Seattle', 'WA', '98122      ', '21A');
INSERT INTO public.personaddress VALUES (37, 31, '932 24th Avenue', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (39, 33, '223 North Lake Drive', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (40, 34, '234 Denny', 'Seattle', 'WA', '98122      ', '532');
INSERT INTO public.personaddress VALUES (41, 35, '899 Bell', 'Seattle', 'WA', '98122      ', '222');
INSERT INTO public.personaddress VALUES (42, 36, '1900 Madison', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (43, 37, '821 15th Avenue', 'Seattle', 'WA', '98122      ', '201');
INSERT INTO public.personaddress VALUES (44, 38, '334 MLKing Way', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (45, 39, '121 Weston', 'Seattle', 'WA', '98122      ', '234');
INSERT INTO public.personaddress VALUES (46, 39, '1000 Pike', 'Seattle', 'WA', '98122      ', '100B');
INSERT INTO public.personaddress VALUES (47, 40, 'West 15th', 'Seattle', 'WA', '98122      ', '333');
INSERT INTO public.personaddress VALUES (48, 41, '235 34th', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (50, 43, '834 8th ave', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (51, 44, '324 Maple Ave', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (53, 46, '1200 Alder Street', 'Seattle', 'WA', '98122      ', '102');
INSERT INTO public.personaddress VALUES (54, 47, '2020 Martin Luther King Way', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (55, 48, '983 8th Ave East', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (56, 49, 'Meridian Way', 'Seattle', 'WA', '98122      ', '431');
INSERT INTO public.personaddress VALUES (57, 50, '290 Aurora Ave', 'Seattle', 'WA', '98122      ', '101');
INSERT INTO public.personaddress VALUES (58, 51, '3900 West 35th', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (60, 53, '333 East Meridian', 'Seattle', 'WA', '98122      ', '430');
INSERT INTO public.personaddress VALUES (61, 54, '345 28th Street', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (63, 56, '850 Pike', 'Seattle', 'WA', '98122      ', '100');
INSERT INTO public.personaddress VALUES (66, 58, '765 Fremont Way', 'Seattle', 'WA', '98122      ', '211');
INSERT INTO public.personaddress VALUES (67, 59, '334 Crown Hill Drive', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (68, 60, '343 Western', 'Seattle', 'WA', '98122      ', '121');
INSERT INTO public.personaddress VALUES (69, 61, '1504 Ballard Ave', 'Seattle', 'WA', '98122      ', '453');
INSERT INTO public.personaddress VALUES (70, 62, '1701 15th Ave', 'Seattle', 'WA', '98122      ', '444');
INSERT INTO public.personaddress VALUES (71, 63, '121 25th Ave West', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (73, 64, '127 South Jackson Street', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (74, 65, '2500 Maple Drive', 'Seattle', 'WA', '98122      ', '203');
INSERT INTO public.personaddress VALUES (76, 67, '700 South Eastern Ave', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (77, 68, '304 12th Street', 'Seattle', 'WA', '98122      ', '110');
INSERT INTO public.personaddress VALUES (78, 69, '1800 Pine', 'Seattle', 'WA', '98122      ', 'Apt 304');
INSERT INTO public.personaddress VALUES (81, 71, '333 Jasmine', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (118, 72, '24th Street E', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (119, 73, '211 Pacific Ave', 'Seattle', 'WA', '98122      ', '321');
INSERT INTO public.personaddress VALUES (120, 74, '1405 Pine', 'Seattle', 'WA', '98122      ', '343');
INSERT INTO public.personaddress VALUES (121, 75, '201 North Elliot', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (123, 77, '234 Ballard Way', 'Seattle', 'WA', '98122      ', '121');
INSERT INTO public.personaddress VALUES (124, 78, '1234 North Elm Street', 'Seattle', 'WA', '98122      ', '232');
INSERT INTO public.personaddress VALUES (125, 79, '204 34th Street', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (126, 80, '212 Union Street', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (127, 81, '123 14th', 'Seattle', 'WA', '98122      ', '203');
INSERT INTO public.personaddress VALUES (128, 82, '323 North Broad Street', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (129, 83, '291 harvard', 'Seattle', 'WA', '98122      ', '321');
INSERT INTO public.personaddress VALUES (130, 84, '2323 WestLake', 'Seattle', 'WA', '98122      ', '201');
INSERT INTO public.personaddress VALUES (131, 85, '2345 Eastlake', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (132, 86, '1423 North Pike', 'Seattle', 'WA', '98122      ', '322');
INSERT INTO public.personaddress VALUES (133, 87, '203 South Denny', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (134, 88, '346 2nd Ave', 'Seattle', 'WA', '98122      ', '435');
INSERT INTO public.personaddress VALUES (135, 89, '2021 Bell', 'Seattle', 'WA', '98122      ', '765');
INSERT INTO public.personaddress VALUES (136, 90, '1201 Magnolia blvd', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (137, 91, 'Bell', 'Seattle', 'WA', '98122      ', '451');
INSERT INTO public.personaddress VALUES (138, 92, '324 82nd Ave', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (139, 93, '234 Ballard Way', 'Seattle', 'WA', '98122      ', '212');
INSERT INTO public.personaddress VALUES (140, 94, '2121 65th Street', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (141, 95, '292 Greenwood', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (143, 97, '306 Westlake', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (144, 98, '121 Harvard', 'Seattle', 'WA', '98122      ', '344');
INSERT INTO public.personaddress VALUES (145, 99, '325 24th Street', 'Seattle', 'WA', '98122      ', '101');
INSERT INTO public.personaddress VALUES (146, 100, '2003 North 34th', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (147, 101, '501 Nineth', 'Seattle', 'WA', '98122      ', '343');
INSERT INTO public.personaddress VALUES (149, 103, 'North 8th Street', 'Seattle', 'WA', '98122      ', '345');
INSERT INTO public.personaddress VALUES (150, 104, '203 East Ballard', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (151, 105, '102 34thStreet', 'Seattle', 'WA', '98122      ', '303');
INSERT INTO public.personaddress VALUES (152, 106, '404 Lester aver', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (153, 107, '102 Jackson Street', 'Seattle', 'WA', '98122      ', '342');
INSERT INTO public.personaddress VALUES (154, 108, '2003 Northwest Blvd', 'Seattle', 'WA', '98122      ', '231b');
INSERT INTO public.personaddress VALUES (155, 109, '1231 15th', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (156, 110, '1101 Pine', 'Seattle', 'WA', '98122      ', '121');
INSERT INTO public.personaddress VALUES (157, 111, '908 24th Streer', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (179, 111, '908 24th Streer', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (180, 112, '131 North 36th Ave', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (181, 113, '201 Queen Anne', 'Seattle', 'WA', '98122      ', '213');
INSERT INTO public.personaddress VALUES (183, 115, '324 WestLake Drive', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (184, 116, '1536 Madison', 'Seattle', 'WA', '98122      ', '109');
INSERT INTO public.personaddress VALUES (185, 117, '2031 15th East', 'Seattle', 'WA', '98122      ', '453');
INSERT INTO public.personaddress VALUES (186, 118, '1245 James ', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (187, 119, '432 24th Ave', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (188, 120, '203 Tardis Way', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (190, 122, '324 8th Street', 'Seattle', 'WA', '98122      ', '419');
INSERT INTO public.personaddress VALUES (191, 123, '153 North Denny', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (192, 124, '456 Eastlake', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (193, 125, '334 Ballard Ave', 'Seattle', 'WA', '98122      ', '2');
INSERT INTO public.personaddress VALUES (194, 126, '333 South Eliot Way', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (195, 127, '1232 Main', 'Seattle', 'WA', '98122      ', '101 N');
INSERT INTO public.personaddress VALUES (196, 128, '1291 Broadway', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (197, 129, '123 NorthEast Broad', 'Seattle', 'WA', '98122      ', NULL);
INSERT INTO public.personaddress VALUES (199, 131, '201 9th Avenue', 'Seattle', 'WA', '98122      ', '203');
INSERT INTO public.personaddress VALUES (200, 132, '809 12th', 'Seattle', 'WA', '98122      ', '405');
INSERT INTO public.personaddress VALUES (64, 57, '1000 Tukwila Drive', 'Tukwila', 'WA', '98108      ', 'Suite 99');


--
-- TOC entry 3044 (class 0 OID 25885)
-- Dependencies: 230
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.status VALUES (1, 'pending');
INSERT INTO public.status VALUES (2, 'granted');
INSERT INTO public.status VALUES (3, 'reduced');
INSERT INTO public.status VALUES (4, 'denied');


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 205
-- Name: businessrule_businessrulekey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.businessrule_businessrulekey_seq', 8, true);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 207
-- Name: donation_donationkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.donation_donationkey_seq', 68, true);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 209
-- Name: employee_employeekey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employeekey_seq', 7, true);


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 211
-- Name: employeeposition_employeepositionkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employeeposition_employeepositionkey_seq', 17, true);


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 213
-- Name: grantapplication_grantapplicationkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grantapplication_grantapplicationkey_seq', 54, true);


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 215
-- Name: grantreview_grantreviewkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grantreview_grantreviewkey_seq', 67, true);


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 217
-- Name: grantstatus_grantstatuskey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grantstatus_grantstatuskey_seq', 54, true);


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 219
-- Name: granttype_granttypekey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.granttype_granttypekey_seq', 9, true);


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 221
-- Name: jobposition_positionkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobposition_positionkey_seq', 9, true);


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 223
-- Name: loginhistory_loginhistorykey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loginhistory_loginhistorykey_seq', 1, true);


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 225
-- Name: logintable_loginkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logintable_loginkey_seq', 133, true);


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 227
-- Name: person_personkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_personkey_seq', 132, true);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 229
-- Name: personaddress_personaddresskey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personaddress_personaddresskey_seq', 200, true);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 231
-- Name: status_statuskey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_statuskey_seq', 4, true);


--
-- TOC entry 2849 (class 2606 OID 25905)
-- Name: businessrule businessrule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businessrule
    ADD CONSTRAINT businessrule_pkey PRIMARY KEY (businessrulekey);


--
-- TOC entry 2851 (class 2606 OID 25907)
-- Name: donation donation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donation
    ADD CONSTRAINT donation_pkey PRIMARY KEY (donationkey);


--
-- TOC entry 2853 (class 2606 OID 25909)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employeekey);


--
-- TOC entry 2855 (class 2606 OID 25911)
-- Name: employeeposition employeeposition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeeposition
    ADD CONSTRAINT employeeposition_pkey PRIMARY KEY (employeepositionkey);


--
-- TOC entry 2857 (class 2606 OID 25913)
-- Name: grantapplication grantapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grantapplication
    ADD CONSTRAINT grantapplication_pkey PRIMARY KEY (grantapplicationkey);


--
-- TOC entry 2859 (class 2606 OID 25915)
-- Name: grantreview grantreview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grantreview
    ADD CONSTRAINT grantreview_pkey PRIMARY KEY (grantreviewkey);


--
-- TOC entry 2861 (class 2606 OID 25917)
-- Name: grantstatus grantstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grantstatus
    ADD CONSTRAINT grantstatus_pkey PRIMARY KEY (grantstatuskey);


--
-- TOC entry 2863 (class 2606 OID 25919)
-- Name: granttype granttype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.granttype
    ADD CONSTRAINT granttype_pkey PRIMARY KEY (granttypekey);


--
-- TOC entry 2865 (class 2606 OID 25921)
-- Name: jobposition jobposition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobposition
    ADD CONSTRAINT jobposition_pkey PRIMARY KEY (positionkey);


--
-- TOC entry 2867 (class 2606 OID 25923)
-- Name: loginhistory loginhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loginhistory
    ADD CONSTRAINT loginhistory_pkey PRIMARY KEY (loginhistorykey);


--
-- TOC entry 2869 (class 2606 OID 25925)
-- Name: logintable logintable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logintable
    ADD CONSTRAINT logintable_pkey PRIMARY KEY (loginkey);


--
-- TOC entry 2871 (class 2606 OID 25927)
-- Name: person person_personemail_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_personemail_key UNIQUE (personemail);


--
-- TOC entry 2873 (class 2606 OID 25929)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (personkey);


--
-- TOC entry 2875 (class 2606 OID 25931)
-- Name: personaddress personaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personaddress
    ADD CONSTRAINT personaddress_pkey PRIMARY KEY (personaddresskey);


--
-- TOC entry 2877 (class 2606 OID 25933)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (statuskey);


--
-- TOC entry 2878 (class 2606 OID 25934)
-- Name: donation donation_personkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donation
    ADD CONSTRAINT donation_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);


--
-- TOC entry 2879 (class 2606 OID 25939)
-- Name: employee employee_personkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);


--
-- TOC entry 2880 (class 2606 OID 25944)
-- Name: employeeposition employeeposition_employeekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeeposition
    ADD CONSTRAINT employeeposition_employeekey_fkey FOREIGN KEY (employeekey) REFERENCES public.employee(employeekey);


--
-- TOC entry 2881 (class 2606 OID 25949)
-- Name: employeeposition employeeposition_positionkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeeposition
    ADD CONSTRAINT employeeposition_positionkey_fkey FOREIGN KEY (positionkey) REFERENCES public.jobposition(positionkey);


--
-- TOC entry 2882 (class 2606 OID 25954)
-- Name: grantapplication grantapplication_granttypekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grantapplication
    ADD CONSTRAINT grantapplication_granttypekey_fkey FOREIGN KEY (granttypekey) REFERENCES public.granttype(granttypekey);


--
-- TOC entry 2883 (class 2606 OID 25959)
-- Name: grantapplication grantapplication_personkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grantapplication
    ADD CONSTRAINT grantapplication_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);


--
-- TOC entry 2884 (class 2606 OID 25964)
-- Name: grantreview grantreview_employeekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grantreview
    ADD CONSTRAINT grantreview_employeekey_fkey FOREIGN KEY (employeekey) REFERENCES public.employee(employeekey);


--
-- TOC entry 2885 (class 2606 OID 25969)
-- Name: grantreview grantreview_grantapplicationkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grantreview
    ADD CONSTRAINT grantreview_grantapplicationkey_fkey FOREIGN KEY (grantapplicationkey) REFERENCES public.grantapplication(grantapplicationkey);


--
-- TOC entry 2886 (class 2606 OID 25974)
-- Name: grantstatus grantstatus_grantapplicationkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grantstatus
    ADD CONSTRAINT grantstatus_grantapplicationkey_fkey FOREIGN KEY (grantapplicationkey) REFERENCES public.grantapplication(grantapplicationkey);


--
-- TOC entry 2887 (class 2606 OID 25979)
-- Name: grantstatus grantstatus_statuskey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grantstatus
    ADD CONSTRAINT grantstatus_statuskey_fkey FOREIGN KEY (statuskey) REFERENCES public.status(statuskey);


--
-- TOC entry 2888 (class 2606 OID 25984)
-- Name: loginhistory loginhistory_loginkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loginhistory
    ADD CONSTRAINT loginhistory_loginkey_fkey FOREIGN KEY (loginkey) REFERENCES public.logintable(loginkey);


--
-- TOC entry 2889 (class 2606 OID 25989)
-- Name: logintable logintable_personkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logintable
    ADD CONSTRAINT logintable_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);


--
-- TOC entry 2890 (class 2606 OID 25994)
-- Name: logintable logintable_personkey_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logintable
    ADD CONSTRAINT logintable_personkey_fkey1 FOREIGN KEY (personkey) REFERENCES public.person(personkey);


--
-- TOC entry 2891 (class 2606 OID 25999)
-- Name: personaddress personaddress_personkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personaddress
    ADD CONSTRAINT personaddress_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);


-- Completed on 2020-06-20 11:26:29

--
-- PostgreSQL database dump complete
--

