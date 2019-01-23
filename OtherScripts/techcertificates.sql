--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-1.pgdg18.10+1)
-- Dumped by pg_dump version 11.1 (Ubuntu 11.1-1.pgdg18.10+1)

-- Started on 2019-01-22 20:32:57 PST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16661)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 279 (class 1255 OID 16698)
-- Name: assign_grade(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.assign_grade(skey integer) RETURNS numeric
    LANGUAGE sql
    AS $$

Update Roster
set finalgrade=Random()*(5-1)+1
where studentkey=skey
returning finalgrade

$$;


ALTER FUNCTION public.assign_grade(skey integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16699)
-- Name: businessrule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.businessrule (
    businessrulekey integer NOT NULL,
    businessruletext text
);


ALTER TABLE public.businessrule OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16705)
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
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 198
-- Name: businessrule_businessrulekey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.businessrule_businessrulekey_seq OWNED BY public.businessrule.businessrulekey;


--
-- TOC entry 199 (class 1259 OID 16707)
-- Name: certadmin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certadmin (
    certadminkey integer NOT NULL,
    personkey integer,
    statuskey integer
);


ALTER TABLE public.certadmin OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16710)
-- Name: certadmin_certadminkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.certadmin_certadminkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certadmin_certadminkey_seq OWNER TO postgres;

--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 200
-- Name: certadmin_certadminkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.certadmin_certadminkey_seq OWNED BY public.certadmin.certadminkey;


--
-- TOC entry 201 (class 1259 OID 16712)
-- Name: certificate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificate (
    certificatekey integer NOT NULL,
    certificatename text NOT NULL,
    certificatedescription text
);


ALTER TABLE public.certificate OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16718)
-- Name: certificate_certificatekey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.certificate_certificatekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificate_certificatekey_seq OWNER TO postgres;

--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 202
-- Name: certificate_certificatekey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.certificate_certificatekey_seq OWNED BY public.certificate.certificatekey;


--
-- TOC entry 203 (class 1259 OID 16720)
-- Name: certificatecourse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificatecourse (
    certificatekey integer NOT NULL,
    coursekey integer NOT NULL,
    minimumgrade numeric NOT NULL
);


ALTER TABLE public.certificatecourse OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16726)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    coursekey integer NOT NULL,
    coursename text NOT NULL,
    credits integer NOT NULL,
    coursedescription text
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16732)
-- Name: course_coursekey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_coursekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_coursekey_seq OWNER TO postgres;

--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 205
-- Name: course_coursekey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_coursekey_seq OWNED BY public.course.coursekey;


--
-- TOC entry 206 (class 1259 OID 16734)
-- Name: coursesection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coursesection (
    sectionkey integer NOT NULL,
    coursekey integer,
    instructorkey integer,
    sectionyear integer NOT NULL,
    pricehistorykey integer,
    quarterkey integer
);


ALTER TABLE public.coursesection OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16737)
-- Name: coursesection_sectionkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coursesection_sectionkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coursesection_sectionkey_seq OWNER TO postgres;

--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 207
-- Name: coursesection_sectionkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coursesection_sectionkey_seq OWNED BY public.coursesection.sectionkey;


--
-- TOC entry 208 (class 1259 OID 16739)
-- Name: instructionalarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructionalarea (
    instructionalareakey integer NOT NULL,
    areaname text NOT NULL,
    description text
);


ALTER TABLE public.instructionalarea OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16745)
-- Name: instructionalarea_instructionalareakey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructionalarea_instructionalareakey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructionalarea_instructionalareakey_seq OWNER TO postgres;

--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 209
-- Name: instructionalarea_instructionalareakey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructionalarea_instructionalareakey_seq OWNED BY public.instructionalarea.instructionalareakey;


--
-- TOC entry 210 (class 1259 OID 16747)
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    instructorkey integer NOT NULL,
    personkey integer,
    hiredate date NOT NULL,
    statuskey integer
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16750)
-- Name: instructor_instructorkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_instructorkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructor_instructorkey_seq OWNER TO postgres;

--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 211
-- Name: instructor_instructorkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_instructorkey_seq OWNED BY public.instructor.instructorkey;


--
-- TOC entry 212 (class 1259 OID 16752)
-- Name: instructorarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructorarea (
    instructionalareakey integer NOT NULL,
    instructorkey integer NOT NULL
);


ALTER TABLE public.instructorarea OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16755)
-- Name: loginhistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loginhistory (
    loginhistorykey integer NOT NULL,
    logintablekey integer,
    logindate date DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.loginhistory OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16759)
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
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 214
-- Name: loginhistory_loginhistorykey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loginhistory_loginhistorykey_seq OWNED BY public.loginhistory.loginhistorykey;


--
-- TOC entry 215 (class 1259 OID 16761)
-- Name: logintable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logintable (
    logintablekey integer NOT NULL,
    username text,
    personkey integer,
    userpassword text,
    datelastchanged date
);


ALTER TABLE public.logintable OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16767)
-- Name: logintable_logintablekey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logintable_logintablekey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logintable_logintablekey_seq OWNER TO postgres;

--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 216
-- Name: logintable_logintablekey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logintable_logintablekey_seq OWNED BY public.logintable.logintablekey;


--
-- TOC entry 217 (class 1259 OID 16769)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    personkey integer NOT NULL,
    lastname text NOT NULL,
    firstname text,
    email text NOT NULL,
    address text,
    city text,
    state character(2),
    postalcode text,
    phone character(14),
    dateadded date
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16775)
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
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 218
-- Name: person_personkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_personkey_seq OWNED BY public.person.personkey;


--
-- TOC entry 219 (class 1259 OID 16777)
-- Name: pricehistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pricehistory (
    pricehistorykey integer NOT NULL,
    pricebegindate date NOT NULL,
    pricepercredit numeric(10,2) NOT NULL,
    pricediscount numeric(3,2)
);


ALTER TABLE public.pricehistory OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16780)
-- Name: pricehistory_pricehistorykey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pricehistory_pricehistorykey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pricehistory_pricehistorykey_seq OWNER TO postgres;

--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 220
-- Name: pricehistory_pricehistorykey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pricehistory_pricehistorykey_seq OWNED BY public.pricehistory.pricehistorykey;


--
-- TOC entry 221 (class 1259 OID 16782)
-- Name: quarter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quarter (
    quarterkey integer NOT NULL,
    quartername text
);


ALTER TABLE public.quarter OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16788)
-- Name: quarter_quarterkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quarter_quarterkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quarter_quarterkey_seq OWNER TO postgres;

--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 222
-- Name: quarter_quarterkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quarter_quarterkey_seq OWNED BY public.quarter.quarterkey;


--
-- TOC entry 223 (class 1259 OID 16790)
-- Name: roster; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roster (
    rosterkey integer NOT NULL,
    sectionkey integer,
    studentkey integer,
    finalgrade numeric
);


ALTER TABLE public.roster OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16796)
-- Name: roster_rosterkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roster_rosterkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roster_rosterkey_seq OWNER TO postgres;

--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 224
-- Name: roster_rosterkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roster_rosterkey_seq OWNED BY public.roster.rosterkey;


--
-- TOC entry 225 (class 1259 OID 16798)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    statuskey integer NOT NULL,
    statusname text NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16804)
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
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 226
-- Name: status_statuskey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_statuskey_seq OWNED BY public.status.statuskey;


--
-- TOC entry 227 (class 1259 OID 16806)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    studentkey integer NOT NULL,
    personkey integer,
    studentstartdate date NOT NULL,
    statuskey integer
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16809)
-- Name: student_studentkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_studentkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_studentkey_seq OWNER TO postgres;

--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 228
-- Name: student_studentkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_studentkey_seq OWNED BY public.student.studentkey;


--
-- TOC entry 229 (class 1259 OID 16811)
-- Name: substitution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.substitution (
    substitutionkey integer NOT NULL,
    certificatekey integer,
    coursekey integer,
    substitutekey integer,
    studentkey integer,
    certadminkey integer
);


ALTER TABLE public.substitution OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16814)
-- Name: substitution_substitutionkey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.substitution_substitutionkey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.substitution_substitutionkey_seq OWNER TO postgres;

--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 230
-- Name: substitution_substitutionkey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.substitution_substitutionkey_seq OWNED BY public.substitution.substitutionkey;


--
-- TOC entry 2930 (class 2604 OID 16816)
-- Name: businessrule businessrulekey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businessrule ALTER COLUMN businessrulekey SET DEFAULT nextval('public.businessrule_businessrulekey_seq'::regclass);


--
-- TOC entry 2931 (class 2604 OID 16817)
-- Name: certadmin certadminkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certadmin ALTER COLUMN certadminkey SET DEFAULT nextval('public.certadmin_certadminkey_seq'::regclass);


--
-- TOC entry 2932 (class 2604 OID 16818)
-- Name: certificate certificatekey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificate ALTER COLUMN certificatekey SET DEFAULT nextval('public.certificate_certificatekey_seq'::regclass);


--
-- TOC entry 2933 (class 2604 OID 16819)
-- Name: course coursekey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN coursekey SET DEFAULT nextval('public.course_coursekey_seq'::regclass);


--
-- TOC entry 2934 (class 2604 OID 16820)
-- Name: coursesection sectionkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coursesection ALTER COLUMN sectionkey SET DEFAULT nextval('public.coursesection_sectionkey_seq'::regclass);


--
-- TOC entry 2935 (class 2604 OID 16821)
-- Name: instructionalarea instructionalareakey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructionalarea ALTER COLUMN instructionalareakey SET DEFAULT nextval('public.instructionalarea_instructionalareakey_seq'::regclass);


--
-- TOC entry 2936 (class 2604 OID 16822)
-- Name: instructor instructorkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor ALTER COLUMN instructorkey SET DEFAULT nextval('public.instructor_instructorkey_seq'::regclass);


--
-- TOC entry 2938 (class 2604 OID 16823)
-- Name: loginhistory loginhistorykey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loginhistory ALTER COLUMN loginhistorykey SET DEFAULT nextval('public.loginhistory_loginhistorykey_seq'::regclass);


--
-- TOC entry 2939 (class 2604 OID 16824)
-- Name: logintable logintablekey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logintable ALTER COLUMN logintablekey SET DEFAULT nextval('public.logintable_logintablekey_seq'::regclass);


--
-- TOC entry 2940 (class 2604 OID 16825)
-- Name: person personkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN personkey SET DEFAULT nextval('public.person_personkey_seq'::regclass);


--
-- TOC entry 2941 (class 2604 OID 16826)
-- Name: pricehistory pricehistorykey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricehistory ALTER COLUMN pricehistorykey SET DEFAULT nextval('public.pricehistory_pricehistorykey_seq'::regclass);


--
-- TOC entry 2942 (class 2604 OID 16827)
-- Name: quarter quarterkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quarter ALTER COLUMN quarterkey SET DEFAULT nextval('public.quarter_quarterkey_seq'::regclass);


--
-- TOC entry 2943 (class 2604 OID 16828)
-- Name: roster rosterkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roster ALTER COLUMN rosterkey SET DEFAULT nextval('public.roster_rosterkey_seq'::regclass);


--
-- TOC entry 2944 (class 2604 OID 16829)
-- Name: status statuskey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN statuskey SET DEFAULT nextval('public.status_statuskey_seq'::regclass);


--
-- TOC entry 2945 (class 2604 OID 16830)
-- Name: student studentkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN studentkey SET DEFAULT nextval('public.student_studentkey_seq'::regclass);


--
-- TOC entry 2946 (class 2604 OID 16831)
-- Name: substitution substitutionkey; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.substitution ALTER COLUMN substitutionkey SET DEFAULT nextval('public.substitution_substitutionkey_seq'::regclass);


--
-- TOC entry 3129 (class 0 OID 16699)
-- Dependencies: 197
-- Data for Name: businessrule; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.businessrule VALUES (12, 'Students must take the core courses before they can work on other certificates');
INSERT INTO public.businessrule VALUES (13, 'Students must maintain a 2.0 or better average to recieve a certificate');
INSERT INTO public.businessrule VALUES (14, 'Students pay per credit, but if they take 15 or more the discount applies');
INSERT INTO public.businessrule VALUES (15, 'Any course substitutions must be approved by a certadmin');
INSERT INTO public.businessrule VALUES (16, 'Instructors recieve 60% of the money taken in for a course');


--
-- TOC entry 3131 (class 0 OID 16707)
-- Dependencies: 199
-- Data for Name: certadmin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.certadmin VALUES (1, 1, 1);
INSERT INTO public.certadmin VALUES (2, 2, 1);
INSERT INTO public.certadmin VALUES (3, 3, 2);
INSERT INTO public.certadmin VALUES (4, 4, 1);


--
-- TOC entry 3133 (class 0 OID 16712)
-- Dependencies: 201
-- Data for Name: certificate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.certificate VALUES (1, 'Java Programming', 'From the basics to mastery');
INSERT INTO public.certificate VALUES (2, 'Python Programming', 'Power python including data and science libraries');
INSERT INTO public.certificate VALUES (3, 'Web Design', 'HTML5, CSS and design principles');
INSERT INTO public.certificate VALUES (4, 'Javascript', 'Complete Client and server side Javascript');
INSERT INTO public.certificate VALUES (5, 'Database Development', 'Relational and NoSQL design and development');
INSERT INTO public.certificate VALUES (6, 'App Development', 'Phone app development in Android and IOS');
INSERT INTO public.certificate VALUES (7, 'IT Core', 'Basics to build on');


--
-- TOC entry 3135 (class 0 OID 16720)
-- Dependencies: 203
-- Data for Name: certificatecourse; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.certificatecourse VALUES (7, 1, 2.0);
INSERT INTO public.certificatecourse VALUES (7, 2, 2.0);
INSERT INTO public.certificatecourse VALUES (7, 3, 2.0);
INSERT INTO public.certificatecourse VALUES (7, 4, 2.0);
INSERT INTO public.certificatecourse VALUES (1, 5, 2.0);
INSERT INTO public.certificatecourse VALUES (1, 6, 2.0);
INSERT INTO public.certificatecourse VALUES (1, 7, 2.0);
INSERT INTO public.certificatecourse VALUES (1, 8, 2.0);
INSERT INTO public.certificatecourse VALUES (2, 9, 2.0);
INSERT INTO public.certificatecourse VALUES (2, 10, 2.0);
INSERT INTO public.certificatecourse VALUES (2, 11, 2.0);
INSERT INTO public.certificatecourse VALUES (2, 12, 2.0);
INSERT INTO public.certificatecourse VALUES (3, 13, 2.0);
INSERT INTO public.certificatecourse VALUES (3, 14, 2.0);
INSERT INTO public.certificatecourse VALUES (3, 15, 2.0);
INSERT INTO public.certificatecourse VALUES (4, 16, 2.0);
INSERT INTO public.certificatecourse VALUES (4, 17, 2.0);
INSERT INTO public.certificatecourse VALUES (4, 18, 2.0);
INSERT INTO public.certificatecourse VALUES (5, 19, 3.0);
INSERT INTO public.certificatecourse VALUES (5, 20, 2.0);
INSERT INTO public.certificatecourse VALUES (5, 21, 2.0);
INSERT INTO public.certificatecourse VALUES (5, 22, 2.0);
INSERT INTO public.certificatecourse VALUES (6, 23, 3.0);
INSERT INTO public.certificatecourse VALUES (6, 24, 2.0);
INSERT INTO public.certificatecourse VALUES (6, 25, 3.0);
INSERT INTO public.certificatecourse VALUES (6, 26, 2.0);
INSERT INTO public.certificatecourse VALUES (6, 27, 3.0);


--
-- TOC entry 3136 (class 0 OID 16726)
-- Dependencies: 204
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.course VALUES (1, 'Beginning Programming', 5, 'Introduction to basic programming logic and sructures');
INSERT INTO public.course VALUES (2, 'First Relational Database', 5, 'Introduction Relational database structure and design');
INSERT INTO public.course VALUES (3, 'Web Pages 101', 3, 'Introduction to HTML and CSS');
INSERT INTO public.course VALUES (4, 'Operating Systems and Basic Connectivity', 5, 'Introduction to Operating Sytems and basic Network concepts');
INSERT INTO public.course VALUES (5, 'Introduction to Java', 5, 'Basics of Java programming logic and sructures');
INSERT INTO public.course VALUES (6, 'Object Oriented Programming with Java', 5, 'Object oriented programming concepts and practice');
INSERT INTO public.course VALUES (7, 'Data Structures with Java', 5, 'Data sructures');
INSERT INTO public.course VALUES (8, 'Java Services', 5, 'Service oriented architechture with Java');
INSERT INTO public.course VALUES (9, 'Introduction to Python', 5, 'Basics of Python programming logic and sructures');
INSERT INTO public.course VALUES (10, 'Python Projects', 5, 'Programming projects with Python, emphasis on using libraries');
INSERT INTO public.course VALUES (11, 'Django', 5, 'Python web development');
INSERT INTO public.course VALUES (12, 'Python Data Analytics', 5, 'Using Python Data Analysis libraries and connectivity to databases');
INSERT INTO public.course VALUES (13, 'Web Design Principles', 3, 'HTML, advanced CSS and basic User design');
INSERT INTO public.course VALUES (14, 'Graphics for Web Design', 3, 'Creating, manipulating and displaying graphics on web pages');
INSERT INTO public.course VALUES (15, 'Web Projects', 5, 'Designing web pages for real clients');
INSERT INTO public.course VALUES (16, 'Introduction to Javascipt', 3, 'Basics of JavaScript client programming logic and sructures');
INSERT INTO public.course VALUES (17, 'Advanced JavaScript', 3, 'JSON, Selected JavaScript frameworks');
INSERT INTO public.course VALUES (18, 'Server Side JavaScript', 5, 'Server side JavaScript using frameworks such as NodeJS');
INSERT INTO public.course VALUES (19, 'SQL', 5, 'SQL for creating and manipulating database data and objects');
INSERT INTO public.course VALUES (20, 'NoSQL', 5, 'Basics developing and querying NoSQL Databases');
INSERT INTO public.course VALUES (21, 'ETL and Reporing', 5, 'Exporting, Transforming and Loading data for analysis. Reporting and visualization of data');
INSERT INTO public.course VALUES (22, 'Database Administration', 5, 'Adminstrating both Relational and NoSQL database locally and on cloud');
INSERT INTO public.course VALUES (23, 'App Development in Android', 5, 'Basics of Android programming logic and sructures');
INSERT INTO public.course VALUES (24, 'Advanced Android', 5, 'Advanced Android programming including sqlLite');
INSERT INTO public.course VALUES (25, 'Introduction to IOS App Develpment', 5, 'Basics of IOS programming logic and sructures');
INSERT INTO public.course VALUES (26, 'Advanced IOS App Development', 5, 'Advanced IOS logic and sructures');
INSERT INTO public.course VALUES (27, 'App Development Capstone', 5, 'Design and create and App');
INSERT INTO public.course VALUES (28, 'Statistics for Data Analysis', 5, 'Statistics with a focus on data science and analyrics');


--
-- TOC entry 3138 (class 0 OID 16734)
-- Dependencies: 206
-- Data for Name: coursesection; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.coursesection VALUES (1, 1, 1, 2017, 1, 1);
INSERT INTO public.coursesection VALUES (2, 2, 4, 2017, 1, 1);
INSERT INTO public.coursesection VALUES (3, 3, 3, 2017, 1, 1);
INSERT INTO public.coursesection VALUES (4, 4, 8, 2017, 1, 1);
INSERT INTO public.coursesection VALUES (5, 1, 1, 2018, 2, 2);
INSERT INTO public.coursesection VALUES (6, 2, 4, 2018, 2, 2);
INSERT INTO public.coursesection VALUES (7, 3, 3, 2018, 2, 2);
INSERT INTO public.coursesection VALUES (8, 4, 8, 2018, 2, 2);
INSERT INTO public.coursesection VALUES (9, 5, 1, 2018, 2, 2);
INSERT INTO public.coursesection VALUES (10, 9, 8, 2018, 2, 2);
INSERT INTO public.coursesection VALUES (11, 13, 3, 2018, 2, 2);
INSERT INTO public.coursesection VALUES (12, 16, 5, 2018, 2, 2);
INSERT INTO public.coursesection VALUES (13, 19, 4, 2018, 2, 2);
INSERT INTO public.coursesection VALUES (14, 1, 1, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (15, 2, 4, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (16, 3, 3, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (17, 4, 8, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (18, 5, 1, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (19, 6, 8, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (20, 13, 3, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (21, 16, 4, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (24, 10, 9, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (25, 14, 7, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (26, 17, 8, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (27, 20, 10, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (28, 19, 1, 2018, 2, 3);
INSERT INTO public.coursesection VALUES (29, 1, 1, 2018, 2, 4);
INSERT INTO public.coursesection VALUES (30, 2, 4, 2018, 2, 4);
INSERT INTO public.coursesection VALUES (31, 3, 5, 2018, 2, 4);
INSERT INTO public.coursesection VALUES (32, 4, 9, 2018, 2, 4);
INSERT INTO public.coursesection VALUES (33, 5, 1, 2018, 2, 4);
INSERT INTO public.coursesection VALUES (34, 9, 9, 2018, 2, 4);
INSERT INTO public.coursesection VALUES (35, 13, 3, 2018, 2, 4);
INSERT INTO public.coursesection VALUES (36, 18, 8, 2018, 2, 4);
INSERT INTO public.coursesection VALUES (37, 21, 4, 2018, 2, 4);
INSERT INTO public.coursesection VALUES (38, 22, 4, 2018, 2, 4);
INSERT INTO public.coursesection VALUES (39, 1, 1, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (40, 2, 4, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (41, 3, 3, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (42, 4, 8, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (43, 5, 1, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (44, 9, 8, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (45, 13, 3, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (46, 19, 4, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (47, 6, 8, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (48, 14, 7, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (49, 18, 10, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (50, 19, 4, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (51, 23, 2, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (52, 25, 5, 2018, 2, 1);
INSERT INTO public.coursesection VALUES (71, 1, 1, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (72, 2, 4, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (73, 3, 3, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (74, 4, 8, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (75, 5, 1, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (76, 6, 8, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (77, 9, 8, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (78, 13, 3, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (79, 14, 7, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (80, 18, 10, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (81, 19, 4, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (82, 23, 2, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (83, 25, 5, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (84, 10, 1, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (85, 16, 3, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (86, 20, 4, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (87, 24, 2, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (88, 26, 2, 2019, 3, 2);
INSERT INTO public.coursesection VALUES (89, 1, 1, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (90, 2, 4, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (91, 3, 3, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (92, 4, 1, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (93, 5, 8, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (94, 6, 8, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (95, 7, 9, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (96, 8, 9, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (97, 9, 1, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (98, 10, 1, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (99, 11, 9, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (100, 12, 9, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (101, 13, 3, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (102, 14, 5, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (103, 15, 5, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (104, 16, 8, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (105, 17, 8, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (106, 18, 8, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (107, 19, 4, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (108, 20, 4, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (109, 21, 4, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (110, 22, 4, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (111, 23, 6, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (112, 24, 6, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (113, 25, 8, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (114, 26, 6, 2019, 3, 3);
INSERT INTO public.coursesection VALUES (115, 27, 6, 2019, 3, 3);


--
-- TOC entry 3140 (class 0 OID 16739)
-- Dependencies: 208
-- Data for Name: instructionalarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instructionalarea VALUES (1, 'Programming', NULL);
INSERT INTO public.instructionalarea VALUES (3, 'Mobile apps', NULL);
INSERT INTO public.instructionalarea VALUES (4, 'Javascript developer', NULL);
INSERT INTO public.instructionalarea VALUES (5, 'Web Devloper', 'backend programing, database connections, etc.');
INSERT INTO public.instructionalarea VALUES (6, 'Database Developer', NULL);
INSERT INTO public.instructionalarea VALUES (2, 'Web Design', 'JTML CSS graphics and user design');


--
-- TOC entry 3142 (class 0 OID 16747)
-- Dependencies: 210
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instructor VALUES (1, 5, '2017-01-20', 1);
INSERT INTO public.instructor VALUES (2, 6, '2017-01-20', 1);
INSERT INTO public.instructor VALUES (3, 7, '2017-01-25', 1);
INSERT INTO public.instructor VALUES (4, 8, '2017-02-05', 1);
INSERT INTO public.instructor VALUES (5, 9, '2017-02-08', 1);
INSERT INTO public.instructor VALUES (6, 10, '2017-02-15', 2);
INSERT INTO public.instructor VALUES (7, 11, '2017-02-17', 1);
INSERT INTO public.instructor VALUES (8, 12, '2017-02-21', 1);
INSERT INTO public.instructor VALUES (9, 401, '2018-02-20', 1);
INSERT INTO public.instructor VALUES (10, 402, '2018-02-20', 1);
INSERT INTO public.instructor VALUES (11, 403, '2019-01-22', 1);


--
-- TOC entry 3144 (class 0 OID 16752)
-- Dependencies: 212
-- Data for Name: instructorarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instructorarea VALUES (1, 1);
INSERT INTO public.instructorarea VALUES (3, 1);
INSERT INTO public.instructorarea VALUES (2, 2);
INSERT INTO public.instructorarea VALUES (2, 3);
INSERT INTO public.instructorarea VALUES (4, 3);
INSERT INTO public.instructorarea VALUES (5, 3);
INSERT INTO public.instructorarea VALUES (1, 4);
INSERT INTO public.instructorarea VALUES (6, 4);
INSERT INTO public.instructorarea VALUES (4, 5);
INSERT INTO public.instructorarea VALUES (3, 6);
INSERT INTO public.instructorarea VALUES (2, 7);
INSERT INTO public.instructorarea VALUES (1, 8);
INSERT INTO public.instructorarea VALUES (3, 8);
INSERT INTO public.instructorarea VALUES (4, 8);
INSERT INTO public.instructorarea VALUES (1, 9);
INSERT INTO public.instructorarea VALUES (6, 10);


--
-- TOC entry 3145 (class 0 OID 16755)
-- Dependencies: 213
-- Data for Name: loginhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3147 (class 0 OID 16761)
-- Dependencies: 215
-- Data for Name: logintable; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logintable VALUES (1, 'TCurry', 201, '$2a$08$tJGFY7hPd228eTE8OGQnveIvthBPDMnkeIfx3e4yGw224HwdfVXJG', '2017-09-14');
INSERT INTO public.logintable VALUES (2, 'DLivingston', 202, '$2a$08$brZo.Jh.neAH3W8/GYFXRemRrN85d1Touf4qO0YynOTyu3v5GqS5C', '2017-08-19');
INSERT INTO public.logintable VALUES (3, 'HTyler', 203, '$2a$08$ZZQ6.pbI1wdPfDNSlAfPieA6Auzir.V9jBf4McqJNdT0XeTJXkewK', '2018-04-17');
INSERT INTO public.logintable VALUES (4, 'VPayne', 204, '$2a$08$kd46Iz.xjEODfnbkfvXS7.UolSu8OmC3EjPcPhZm45gzAqItTkgeG', '2017-07-10');
INSERT INTO public.logintable VALUES (5, 'VJustice', 205, '$2a$08$HU65oVt7PjoESXApyZC7k.7tJCr9Gih5J.xzXs7/dwQ9FEhqE9D.e', '2017-08-15');
INSERT INTO public.logintable VALUES (6, 'JSullivan', 206, '$2a$08$lfV0Z5NLeT7x1MjJ.Jv5webuWnPRN8tbpYFeAktZTIGtWg89qXaom', '2018-08-10');
INSERT INTO public.logintable VALUES (7, 'FRiddle', 207, '$2a$08$883koegtbocBWRLcQHlyQ.wVS32h3joYuD5oin7d1NMdGVmjM25Ma', '2018-11-24');
INSERT INTO public.logintable VALUES (8, 'HBeck', 208, '$2a$08$L9YBoATsnWuZZi4sdz7o6Od0MwiaSNDyR20YjxmeJ8IaU8Ei3Aj.q', '2017-12-08');
INSERT INTO public.logintable VALUES (9, 'LHenry', 209, '$2a$08$tw.9BY8fQ9aUx4VN5YZjXOTxHorFjqRMYJeTgasT0D7jbovmw/ZWC', '2018-11-10');
INSERT INTO public.logintable VALUES (10, 'KRoberson', 210, '$2a$08$R4pDIvJn05QOZn8CSPUf.uwnuAU4RHAKXazSUT3Po24D9X2o3YpWO', '2018-11-06');
INSERT INTO public.logintable VALUES (11, 'GClark', 211, '$2a$08$7lePVjYYQhTqLXsLbQuRGeclD2nkT3wU1usPrNqSDrIzYeRiXN3yS', '2018-09-27');
INSERT INTO public.logintable VALUES (12, 'ABryant', 212, '$2a$08$saDVWXfD6pOCWvWQLt8/1eYNG9ReuugrZDQQ0w02rZRpj4fUVj0pe', '2018-07-01');
INSERT INTO public.logintable VALUES (13, 'SStafford', 213, '$2a$08$E/j8fC/bVrVlI.JAblgneOOC6DaH48kEZabpnjB44kHCgyKMriIDO', '2018-10-30');
INSERT INTO public.logintable VALUES (14, 'BPratt', 214, '$2a$08$23HWWdmY8M6O5pa.5vdGR.AxNX2UaWdv9LpiJiaArf51nUZF80d/2', '2017-06-25');
INSERT INTO public.logintable VALUES (15, 'KHuff', 215, '$2a$08$dnKKp0ZmkL3V9laf7W7wO.JztCDqZTaTVdgTdVdVUvo906X076F9.', '2018-06-18');
INSERT INTO public.logintable VALUES (16, 'MMorgan', 216, '$2a$08$5zGuzW5RhMr3aynICIZSIea1OdOjM3nOQ8yIQoPiB/ao9vDZj4xvu', '2018-12-22');
INSERT INTO public.logintable VALUES (17, 'HMcclain', 217, '$2a$08$QLX59.fNbWrDxMf8Sr5lau7qFr1zkpze2pxswGtSWmnteb4g6a/rO', '2018-01-08');
INSERT INTO public.logintable VALUES (18, 'VBlackburn', 218, '$2a$08$8HKcLx.OsGkBdPQ.y0LS5e4OPwXTJNA4ud4CYSqfYdaP.3GUVZzOO', '2019-04-20');
INSERT INTO public.logintable VALUES (19, 'LSmith', 219, '$2a$08$4myAgb/kL9iOlnBYwkE1U.lW0Hq3NdeLWLFe9l4Ul2fDCQszgENQe', '2018-11-04');
INSERT INTO public.logintable VALUES (20, 'HCross', 220, '$2a$08$RX4tEpElHrTdZL1YKNh2COycDRpgCMGrv5cVQBgn2FIdO8q61oD76', '2018-02-07');
INSERT INTO public.logintable VALUES (21, 'JIrwin', 221, '$2a$08$7uSjs.4TzfDWf6jQLEtQ6OpSKHQKgEGDzdHhMta5W41XTvxcnKVhq', '2017-07-22');
INSERT INTO public.logintable VALUES (22, 'MKnapp', 222, '$2a$08$s1t0Zff5liGFyxhi9BHVEexq2ZZQB4HWXLEFW5B09PMjPfqaugsei', '2019-01-19');
INSERT INTO public.logintable VALUES (23, 'BBanks', 223, '$2a$08$G7rY/fmTKAB2Y.QBJONY1.POLOQpe3H7lgkp5hqPMhWIGxQNsJ0RG', '2017-11-25');
INSERT INTO public.logintable VALUES (24, 'XLove', 224, '$2a$08$1kEZm6Xte4Fd8sX1Go8jt.g7Fi7R4k7sDdFzmxDH7GRtLd977LfYC', '2018-10-25');
INSERT INTO public.logintable VALUES (25, 'PBullock', 225, '$2a$08$B1nrZAxAImHqu2huiBxmCuXfOkdf1hakKsvLHgIoLitDjCwzBKOla', '2019-05-27');
INSERT INTO public.logintable VALUES (26, 'SBright', 226, '$2a$08$j0mKewolmluqNc2T/vV3yOliPwF3sxwC8rjJLp8DJX2WXRGPcdqwu', '2019-01-24');
INSERT INTO public.logintable VALUES (27, 'DCrane', 227, '$2a$08$XmXujKFl03qvoScezNCp6.sqKQgdTJrkcxhxDO665Tl9fGhEWJIYi', '2018-02-07');
INSERT INTO public.logintable VALUES (28, 'DLevine', 228, '$2a$08$KZdhb38L0A5edXWiwIGSpe82sUplvpr37GuXcjHqzIwR8UWQRmb2C', '2017-10-11');
INSERT INTO public.logintable VALUES (29, 'VWatts', 229, '$2a$08$uzI9.mEjBXhKpUJd8NTVPueY/MUnoY54iu1YBnCMfQXv3Vdx0N52.', '2018-11-18');
INSERT INTO public.logintable VALUES (30, 'MChristian', 230, '$2a$08$pAON8hYAdtPRnyGftlH2RuSbhHfMfovxtblhrfzd5GMeqh2l7fTfK', '2017-10-21');
INSERT INTO public.logintable VALUES (31, 'CCurtis', 231, '$2a$08$Qb8KtWiBmd08K/RMUi3IouXbHoAtZS.x7DpftppJhvrBCMN3XY3di', '2019-01-29');
INSERT INTO public.logintable VALUES (32, 'VAlvarado', 232, '$2a$08$upqgGHV1kWrC/dIn7.YkF.Br8mH3RQ/B1/y4WCkxnlLpe7Ab4ZGAi', '2017-11-03');
INSERT INTO public.logintable VALUES (33, 'SCollier', 233, '$2a$08$wCr010PVtq.4tmSIu4JUcu8N0UcUoJUF5DewVHaUWFG955l4mvc1.', '2017-09-14');
INSERT INTO public.logintable VALUES (34, 'SCraft', 234, '$2a$08$49a74ZSyvNDGMe2oYAtTb..ZyrHb297cSAnEoZLplT48ONomC3.0a', '2018-02-03');
INSERT INTO public.logintable VALUES (35, 'UFranco', 235, '$2a$08$4GVzf/iGgEIW53w4HViAeOdQfpb/d/UK6zzt0WL3GCC9Wk/66m.KW', '2017-07-11');
INSERT INTO public.logintable VALUES (36, 'ESloan', 236, '$2a$08$cNVG936EsicLgQpxp7VHOuONAVnKYUG2gisH16JjmY/GaXyHC7hqW', '2018-01-03');
INSERT INTO public.logintable VALUES (37, 'CCook', 237, '$2a$08$asbZNds2obGtqBgC3jG.7.4f2Q9EUwnvQK2w2fLCq8MkApXZPlfxi', '2018-10-27');
INSERT INTO public.logintable VALUES (38, 'JConrad', 238, '$2a$08$BkprBnbLrW2WHMiPtT1fkebhx2.0tkDsqtQQwW66ZJVWjg2rS40Dm', '2017-09-03');
INSERT INTO public.logintable VALUES (39, 'XWatts', 239, '$2a$08$Dhae0VbaNkRJhAJ/9OM3z.iDDV8D2To5XS7JpVfF.Og0LYElHDjHa', '2018-06-01');
INSERT INTO public.logintable VALUES (40, 'TBrock', 240, '$2a$08$hGlic00pP5Qd3rH6Ghsm7.M9.ES59Y0FMa80E26EhDLB.eBPF6Txy', '2018-03-14');
INSERT INTO public.logintable VALUES (41, 'KMayer', 241, '$2a$08$QcHB7CeQwl/YQJqtFKfHq.cvV3QgY2HU3ih3/WIpDs5vTKPTm0m3G', '2018-09-29');
INSERT INTO public.logintable VALUES (42, 'DBecker', 242, '$2a$08$X/1t08M6WWByXpKkhBLVHOIK1Km4Zy73bFYxI.fTzVQAGyfnx8H1y', '2018-08-29');
INSERT INTO public.logintable VALUES (43, 'PRichards', 243, '$2a$08$RTuyLtVVIgbuFDfSFNqil.tSTP6BqoynY6oAtNB9SADgrBKufGN9i', '2019-01-02');
INSERT INTO public.logintable VALUES (44, 'SOlsen', 244, '$2a$08$us5AZA7BV.8nHdN5QoQnyOkV96bbrnFzZcho4aS6nZbp2P.wRV1CC', '2019-02-15');
INSERT INTO public.logintable VALUES (45, 'HMason', 245, '$2a$08$0GscBRx2VaQfPDzB9FzKqOXxA3VAWX3jv0klkj6kZK0V.QcmDMQXO', '2018-08-19');
INSERT INTO public.logintable VALUES (46, 'MSolomon', 246, '$2a$08$7MfGjJDA9xWDocAwhyOb3.7q01PKRgC7ltVcxpXyaQCqxDsC4ATDG', '2018-12-03');
INSERT INTO public.logintable VALUES (47, 'EWhite', 247, '$2a$08$llWAG6D8ISDnjRRTdJwD8ueSxM7aoqRr9LyhZRB3UE7RPjdy3ViOu', '2018-11-20');
INSERT INTO public.logintable VALUES (48, 'BCash', 248, '$2a$08$AfMltPzGrnjwI38p3jaH0uQq6Jje07JnIDfVxJi8q0XpdHlbddiaG', '2018-06-17');
INSERT INTO public.logintable VALUES (49, 'JJustice', 249, '$2a$08$cMQ4CY0cSvc7NQf57XxK2OyKTArUwjBNoqFblie76TOQLlGFr4xyK', '2017-11-01');
INSERT INTO public.logintable VALUES (50, 'ECarney', 250, '$2a$08$r8wHlBKhUOKsvK1QyVOEZezRMu6gE3CpqnEcEjdcmnz1H..v0bKR6', '2019-03-17');
INSERT INTO public.logintable VALUES (51, 'IHeath', 251, '$2a$08$pFOm3wdG8iyr5AaTTQRfXObV.FsxjdKqjjqJsPMMCIw23O3xbcOG.', '2018-05-22');
INSERT INTO public.logintable VALUES (52, 'QBest', 252, '$2a$08$DTtgpQ/RA3zPREEnPz6Dvemaodcy7QcQN.f/H4uY9T0u35Eoz0sQG', '2019-06-08');
INSERT INTO public.logintable VALUES (53, 'XHouston', 253, '$2a$08$rF4OkKUyok6vCyJGrI9U3uMNJb434fx3w82G3ftXFBYCDzRhs0lEC', '2018-12-31');
INSERT INTO public.logintable VALUES (54, 'GAlvarez', 254, '$2a$08$TB/xhA5ZfkPNdchKwVDKsOZMYHH5zsKjlehs77O2pe9zdwWNaB7Aq', '2017-08-27');
INSERT INTO public.logintable VALUES (55, 'LGuerrero', 255, '$2a$08$s40W13osR8xXcE4IAMaYuO/pvfmYOM53.RkRXgNBG8m0pJzkzAshi', '2018-02-10');
INSERT INTO public.logintable VALUES (56, 'ZAllison', 256, '$2a$08$bYe6gNPF9i3uoq7WUo2zcuaCz41rJuuDkj6qlVaxPqGrg98zhV4yi', '2018-06-04');
INSERT INTO public.logintable VALUES (57, 'BMason', 257, '$2a$08$uqu87sAx4lUicAHEW1DAeujdEc9WDw8n5Be/CE4FHAemAw/DDIJAK', '2018-06-22');
INSERT INTO public.logintable VALUES (58, 'GGlenn', 258, '$2a$08$niuDkkqhUD3hB8IUXHbF2e1VXwqwidZ/xDASSCgCDZPYgvqR4g7ea', '2019-01-03');
INSERT INTO public.logintable VALUES (59, 'LCarrillo', 259, '$2a$08$pHSXRgqtRNBImuM7/E/YFOyGTS2H6XszZXJrtWLVNURNBHOG7cV.i', '2018-02-11');
INSERT INTO public.logintable VALUES (60, 'LLee', 260, '$2a$08$QTqBLEWU1c8ru4SLijAhKeLQwh5rqCHJuVb.8/jw.1SgCcxfLIBRK', '2017-08-04');
INSERT INTO public.logintable VALUES (61, 'CAnderson', 261, '$2a$08$aUddQxf.GtnQ2VJaBrVkiem5pX6iEzONQDp206brp7kzMPY98UtB.', '2018-07-16');
INSERT INTO public.logintable VALUES (62, 'MRoberson', 262, '$2a$08$9chardZG7040r8HSA3JfPu2BVzWhCyO8gRvbZnOpOYVp4vyNqfRWe', '2018-03-09');
INSERT INTO public.logintable VALUES (63, 'SSantana', 263, '$2a$08$ENv/c/lmtyKql0g995ivvukQ.7k4Je8lfsdgPyTIRCHml4DeqgpTS', '2019-02-10');
INSERT INTO public.logintable VALUES (64, 'EKoch', 264, '$2a$08$FF2JCc9kOGVDC5rWoaLzGO9qVsCmUs/6h9zyD0xDtFIiGHD9Hjxj.', '2018-11-25');
INSERT INTO public.logintable VALUES (65, 'ABruce', 265, '$2a$08$J3ZU88yPXKq0fQCnCEmAqegNBajAc/aL0EixurG2sP/QpfY7RQrMe', '2018-09-15');
INSERT INTO public.logintable VALUES (66, 'ISimmons', 266, '$2a$08$IyTrRsPZVylykmNqcTA4Qe6YIPxx.awyqu05YwAGJuhW4hg3WPeWO', '2019-03-22');
INSERT INTO public.logintable VALUES (67, 'LVelazquez', 267, '$2a$08$Zv3q30hHwXaeqY3OpIX4TuE/i1ZqTlrQ1F0BgkzMjoGgcQkJGo9t.', '2018-09-27');
INSERT INTO public.logintable VALUES (68, 'PFrank', 268, '$2a$08$PkxYrgcAoxqNIKkxXRnP2ePhEnMxRuBqQghi/ATe8m3/bIj0clM7W', '2018-10-12');
INSERT INTO public.logintable VALUES (69, 'BMacias', 269, '$2a$08$8GuGyqV7Pqs6R6bAgX2t.OdzEOQcgXfZM7bp.tbsCBErX5lYCVFF2', '2017-10-15');
INSERT INTO public.logintable VALUES (70, 'HPorter', 270, '$2a$08$r72fwlYbjtcbHtOi4aCZYuCmR9us7O1BojgfwebNdhspm/JPxYVnm', '2018-01-14');
INSERT INTO public.logintable VALUES (71, 'JCastro', 271, '$2a$08$hxkkfVb5FfOJuEtFBlkSl.MT0S8z9eRVsxWIxLHTzxkeBrKiJunbW', '2018-11-11');
INSERT INTO public.logintable VALUES (72, 'NWilliam', 272, '$2a$08$.NCsVdLupm6cLlTvhhHi/.LH2bpFS7guuGkR.FxDBYlspHTPObb1m', '2017-06-25');
INSERT INTO public.logintable VALUES (73, 'GWilliamson', 273, '$2a$08$JZwy3SFdf8M5G48YFJsPLO0/bxhg4dJTIzxDq.8rZwr6b0lUb/Er2', '2018-03-30');
INSERT INTO public.logintable VALUES (74, 'NHolland', 274, '$2a$08$esiWZnXKBbl.rQSeA/uYSu9IGb/YkQuM.vIxOCUf27Gqt60OL349a', '2017-06-18');
INSERT INTO public.logintable VALUES (75, 'APierce', 275, '$2a$08$x/1NZTQDF6/PHyjE36rBtuI/A2UGA4PpqOqVY0dIMpNuNqQ.oYOyq', '2018-03-02');
INSERT INTO public.logintable VALUES (76, 'CMcdaniel', 276, '$2a$08$XESQfHva63Fqselea6oblOH42KBsKC2CqxKuS1Kx5zlVM5kt7TU8a', '2018-05-31');
INSERT INTO public.logintable VALUES (77, 'AZamora', 277, '$2a$08$stYf321fdXZ0OpVTK470NurcYF7yj0KkfE6iAfcqXIQqr4vQHCRBG', '2018-10-30');
INSERT INTO public.logintable VALUES (78, 'CBritt', 278, '$2a$08$lAyS4WrrGNYcOjldLDKWQevb6RoREccQmLC3rSIeJ6ai7aQARMYBS', '2018-10-11');
INSERT INTO public.logintable VALUES (79, 'OChaney', 279, '$2a$08$iUF8wpzlIP/PIjDTvYv2Kufv7bp8JTLM8H558qjhm0DD4TyMMvSly', '2017-12-19');
INSERT INTO public.logintable VALUES (80, 'WPeck', 280, '$2a$08$SxBklKdyMgmCYqbn.BTNZOXMWZz/F3ZTZ8P0p0P.2F/EWqEJulIIG', '2019-05-06');
INSERT INTO public.logintable VALUES (81, 'LKaufman', 281, '$2a$08$h4Mt0HiST/qYS36.GutOm.Cn.aM1MrbHzBGTollmSjZqB9sK1Ekea', '2017-09-30');
INSERT INTO public.logintable VALUES (82, 'DNguyen', 282, '$2a$08$R0go1ifHwDWBHKrExyvvFOI6hVLtOvljbPm6R/Sva/Kd5jUBMZQcW', '2018-10-07');
INSERT INTO public.logintable VALUES (83, 'SDonaldson', 283, '$2a$08$DruSOoz1wIxA7cZ8uW3RLO/M22CqC0bORctd8VfX460UElENN7wYa', '2017-10-02');
INSERT INTO public.logintable VALUES (84, 'OGreer', 284, '$2a$08$lCGM8bKynHTIbEkcnYtYNOeo8Ips1SlPVIl.bO5axDhTNopd111s6', '2019-02-27');
INSERT INTO public.logintable VALUES (85, 'CRowe', 285, '$2a$08$no9WzUz.gHkxDZlKC3ZCUOrbPkak18tPiXjM9.4Bce3rk/5BG5O5K', '2017-11-23');
INSERT INTO public.logintable VALUES (86, 'YWhite', 286, '$2a$08$6mFaCdCmI2CSP5OkuuDMne0XoSxS/WwxTe8yyFWCUz4/G3i0wEzi6', '2018-03-20');
INSERT INTO public.logintable VALUES (87, 'RNavarro', 287, '$2a$08$lwUYzy0NoUv6u1xdNgCPpOIPCOLjM85hpSexT1Z3qjH0.WN4Tx82W', '2019-02-09');
INSERT INTO public.logintable VALUES (88, 'DMcconnell', 288, '$2a$08$NKQzUOimMYJkoBjoJvIbZe4yCOCZttnI29yERzYBx2DPUMYNGp5d.', '2018-07-25');
INSERT INTO public.logintable VALUES (89, 'LAnderson', 289, '$2a$08$fX7E5W8VmQ3onb//PHtI4uWWT36mUFsRiQcxt1FHLpz.8feLlbtYe', '2018-03-29');
INSERT INTO public.logintable VALUES (90, 'SHowell', 290, '$2a$08$GZJlIhLRBcnxiaCzpRM90e5GpS8LPAxYoN/1JRMcHJ7YyzwBsdWPq', '2019-01-11');
INSERT INTO public.logintable VALUES (91, 'JDixon', 291, '$2a$08$ya43stKjXEBITXW/XHdWR.U9OzRIcbo8zOf6dInqs31AhMtwW4ANC', '2017-10-02');
INSERT INTO public.logintable VALUES (92, 'ZTyler', 292, '$2a$08$y/ow67L4qwQ60ApD9CIib.r1hoapEwmxVZ1ziZwo.HzLHtrwTLAIu', '2018-03-20');
INSERT INTO public.logintable VALUES (93, 'AKnowles', 293, '$2a$08$EhqJ5Uq2yAcvvOCKBh5hWOQgUhFteiagrUcOu3iAaSUrV1R96k8PW', '2018-05-24');
INSERT INTO public.logintable VALUES (94, 'EFranklin', 294, '$2a$08$V0b6xdvLHa8kWjhuf7c2meq3ZCPu/fBY7MTByPQggyDBhFYoYfy2C', '2019-03-30');
INSERT INTO public.logintable VALUES (95, 'WTanner', 295, '$2a$08$w0e996.Jxuyiuf8O2S08sOOWSMZuBChC1UIXqHJZ4Yt02eGEK7Ewy', '2018-07-15');
INSERT INTO public.logintable VALUES (96, 'AMartin', 296, '$2a$08$DUNmQcd7Km53cUUpvGedM.STJzSuTHnTgBZOQLETPIpchcyMXPvga', '2018-09-29');
INSERT INTO public.logintable VALUES (97, 'MMclean', 297, '$2a$08$pL.S1sQ5Ph6liwBHFGUgx.3v3InK8fVAxIk.f78g2v6xcgFONn5Aa', '2017-08-11');
INSERT INTO public.logintable VALUES (98, 'FAllen', 298, '$2a$08$zM5llR3ZtazKoP5waz4mZOfaeypUxIcBEVqq6G/oD9Qz72K.04nAi', '2018-07-28');
INSERT INTO public.logintable VALUES (99, 'AMurphy', 299, '$2a$08$mMFnWIz813JSwwgIcALIFuxNVB59DL6/UyZBZS5JuOoojaYbYVadu', '2017-12-08');
INSERT INTO public.logintable VALUES (100, 'DDiaz', 300, '$2a$08$Fqlc.fHQLg78H/opEi4Spu5ub1ywBuzaG9OnavvKRRQb//SOpf.vO', '2017-11-06');
INSERT INTO public.logintable VALUES (101, 'SFields', 301, '$2a$08$YcN9cDrfDJHwfX03vtIKF..uDJlWHiWMld0WCFUItYXITyIAmie5i', '2019-04-21');
INSERT INTO public.logintable VALUES (102, 'LHolt', 302, '$2a$08$A2WFjHVV0Pp3n2VxLLBtd.Fu1rkqSlvsn.RiDVjlU19UPlf48jtyq', '2019-03-13');
INSERT INTO public.logintable VALUES (103, 'BTyson', 303, '$2a$08$o1.kiCLcePYqI2oW9C9Yt.zxv1Sg9OqgNqXFzIjcHaEzJOY9LJS3K', '2018-08-14');
INSERT INTO public.logintable VALUES (104, 'XManning', 304, '$2a$08$MgN7.GvtWFQ46CDjfyUU1OAZnk5qfE1Iks5NZOAmeRxav9BP6KWea', '2017-10-13');
INSERT INTO public.logintable VALUES (105, 'YMorton', 305, '$2a$08$OFmu9hPCjxih2SWbp1JNRuBU3ivVnKEnggbCEVeHP1LbWjwpSv29i', '2018-05-25');
INSERT INTO public.logintable VALUES (106, 'HCarey', 306, '$2a$08$Tnlcbxu4eXAfBF3z4SRC4OxxUlCygjpOwEZREIahxQJI3/lZyiYO.', '2019-03-26');
INSERT INTO public.logintable VALUES (107, 'MHendricks', 307, '$2a$08$9yVMWTIDRZi6aBKKxHJ8GuBQ6.NbkngXfotVGKXN.5qRYWa/YMmHm', '2018-03-10');
INSERT INTO public.logintable VALUES (108, 'ACalderon', 308, '$2a$08$Kf/QmguCjKZL/c6pCxuR6O/eTq1uuJDDvE/XFnneWArE7l17VPZ22', '2017-06-17');
INSERT INTO public.logintable VALUES (109, 'YKnox', 309, '$2a$08$7UbqrkDXJbwKfrrig7d17.efcJso5faNN/mK4AvQ0wBAn7OXVKhK2', '2018-11-20');
INSERT INTO public.logintable VALUES (110, 'JKennedy', 310, '$2a$08$kNh/bUBwg/tV648lkOXAT.ygLcQUNc.NEnV4X7B24VqGd1SO2eJ/2', '2018-04-26');
INSERT INTO public.logintable VALUES (111, 'EHebert', 311, '$2a$08$SUAEZcSZkiPjW4ryx.I63.493NIk009LATKHPvnL/yjBux3OM1BMS', '2019-06-08');
INSERT INTO public.logintable VALUES (112, 'AKnox', 312, '$2a$08$d3aTGAfdoMgafRYjFXD20e7TnSJetG9Hykh5Tv92/dM74ReIVPM1G', '2018-04-08');
INSERT INTO public.logintable VALUES (113, 'KTaylor', 313, '$2a$08$QeK3.9tYQ3I34S8LZR9Rh.BUBGU2hAQDOJrx2wuOyHWZbxEwaiY0i', '2019-04-04');
INSERT INTO public.logintable VALUES (114, 'PRatliff', 314, '$2a$08$LJfOOQS7RFpIiSjWFGsFfulJtGp5ovRaXEQUd/HD9Ke/Pq5u8Hj9e', '2018-03-25');
INSERT INTO public.logintable VALUES (115, 'UOneill', 315, '$2a$08$UHadzI6KdFJ1b5.SF/3Q9OGKoYHISG7sSQuOR5bEBgXQCXh.9N5U.', '2017-10-26');
INSERT INTO public.logintable VALUES (116, 'LSummers', 316, '$2a$08$oM.xKzrGj3bTSr34/zv6mezKwL6bcXreNhp0o.Zmh6.5gKY4WTlTa', '2019-05-30');
INSERT INTO public.logintable VALUES (117, 'IBolton', 317, '$2a$08$qrA4a2S17K9fHmO7Mb2eTuKrrwCWN.z047wYHv9P.KqSyAArr.cCe', '2017-11-16');
INSERT INTO public.logintable VALUES (118, 'XStanton', 318, '$2a$08$27IF3zylEf0fRw1fHGTxPuylVZq8nUYvPxIXI2wTDUxozx8N7k/8K', '2018-02-12');
INSERT INTO public.logintable VALUES (119, 'LClemons', 319, '$2a$08$3CZVJ4cj/TUKWnsAxnFJ3OAI.FGGpcFMKN/iltUbOUJF1FHb2xA7e', '2018-03-07');
INSERT INTO public.logintable VALUES (120, 'CRose', 320, '$2a$08$K0XgGFdQ4iAzDye2.3AB2eXkjRJ3850gmlZ.Egj7jCzxndv9b00Li', '2018-01-29');
INSERT INTO public.logintable VALUES (121, 'NBlack', 321, '$2a$08$xYNLsNHXMbkRiuZ1bOdxt.xxzN2e/UAg7rGdqbpJCGtLsmGklK8Za', '2019-06-08');
INSERT INTO public.logintable VALUES (122, 'MMullen', 322, '$2a$08$XR/3V9LTI8s8pHPepf3f.epZdcwk.1mD6TR47EGK/88WCrO7Wpp8q', '2017-09-11');
INSERT INTO public.logintable VALUES (123, 'LHaynes', 323, '$2a$08$mYuRNbQ57B2C0Q/s84/OGO2Jbq/agXbyafKppvMly2X5KZZnsQte.', '2018-07-28');
INSERT INTO public.logintable VALUES (124, 'DStrickland', 324, '$2a$08$NVeHgg2J7UyUMM.ZJ.q3cOU1O.u6l/iAej9vu6Vp2OkPnUV/Jf9qe', '2018-04-01');
INSERT INTO public.logintable VALUES (125, 'DWarren', 325, '$2a$08$hCo7u/r.NPvH4Q/SA7UOK.n1PM31WG3Wma0kBp.ZT08RaYYgxFM/q', '2019-03-13');
INSERT INTO public.logintable VALUES (126, 'EKnowles', 326, '$2a$08$k.dWNcm2YCwfC3HUpkdK/.7f70VNVKGNi4Y0UJqOgCZSBv9iU..wG', '2017-11-03');
INSERT INTO public.logintable VALUES (127, 'BCain', 327, '$2a$08$nqBh5yUimRZ4V6ZUv51pK.eEj5q/n3AT6zo21ed6qJtb6aKWKk5l2', '2019-04-12');
INSERT INTO public.logintable VALUES (128, 'NCobb', 328, '$2a$08$NBkIAQMQIdCns2FdEZEuL.jrRh48O8rdYJB8AJnH/ec3OkXABVkZG', '2018-04-07');
INSERT INTO public.logintable VALUES (129, 'ARichardson', 329, '$2a$08$rEiBxTcjFXz/IbbpjGAgXOAye/VdU7N/tebPMMjnLngIAHxLS343O', '2018-12-21');
INSERT INTO public.logintable VALUES (130, 'KNash', 330, '$2a$08$KzjzYr7k42WBR8d3sa0r0uC9O1UH1lVHho94TltjyFPcY1Lp2tW6u', '2018-03-16');
INSERT INTO public.logintable VALUES (131, 'PWyatt', 331, '$2a$08$r1FqnXns6GKW.cMKlyKIb.MrZuO2gVJ3KPrPejBVHFDlDanxpPJIK', '2017-10-06');
INSERT INTO public.logintable VALUES (132, 'EHudson', 332, '$2a$08$TMUp/9lZtvrlL3trgjmAIejPqqPM3F/x7J2CuLPbq93/nIE7se3FS', '2017-12-26');
INSERT INTO public.logintable VALUES (133, 'TWaters', 333, '$2a$08$ZMiZYSbkQ7bBnZs6TZQoVeOvOFUp5M1OZmNy0FVpdEmc3xcmyDvdy', '2019-02-06');
INSERT INTO public.logintable VALUES (134, 'GChandler', 334, '$2a$08$y/7jTxrhAHDtPOB/fIILB.PzOvq/8v6go.RXHXXeVr1h1dY6dex72', '2018-12-30');
INSERT INTO public.logintable VALUES (135, 'TRosales', 335, '$2a$08$QW6a8uw.7RkK7rKI3.CQn.OLOnq2myr2KWXz7Vqw9eXHdyo2ae47W', '2018-01-12');
INSERT INTO public.logintable VALUES (136, 'CPetty', 336, '$2a$08$Gg6CRJ9fk/gdnqgVs2/3zuL1M78dR9Ift0JKO8MME15oCpqRSTrwq', '2017-08-08');
INSERT INTO public.logintable VALUES (137, 'UCraft', 337, '$2a$08$krsPHdpBvD3hu6q7nBE.POR1aqCc2ZcChtOp1YwrJCax.3OxcDj2y', '2018-11-23');
INSERT INTO public.logintable VALUES (138, 'JFlowers', 338, '$2a$08$U.U87sn/Ikm/hLiyeA/MouGUD4zRQy0QqZyBFA8bQAYhTM0snTmE6', '2019-03-12');
INSERT INTO public.logintable VALUES (139, 'JMcconnell', 339, '$2a$08$5SqY.D0/128foeJbXlbGPuEdyIGmYdgiXjzoj17SeRAv7PjCMIEP6', '2018-10-19');
INSERT INTO public.logintable VALUES (140, 'ASlater', 340, '$2a$08$e23ZPcUAY5j.KBvcj1DvhOk.cGC8IiIurF9lzV2xYDesuPFqjQZH.', '2018-02-15');
INSERT INTO public.logintable VALUES (141, 'AWatts', 341, '$2a$08$U3HX3xY7l7tyNaj0l7.Ik.iuHVOeqoQcX2HpkwqyvJOyd6hLhtZzm', '2018-07-25');
INSERT INTO public.logintable VALUES (142, 'ABaldwin', 342, '$2a$08$rWm/s7uFfzQdaT.ukl0fw.e3uS9o47ULurFZ0F5nxlW1SV9.eswJy', '2017-10-08');
INSERT INTO public.logintable VALUES (143, 'AReid', 343, '$2a$08$2Xvp/liyxSDQ0Zkh.EQ7w.jOrdTmBby7dTMxgjNXMZRm82I.wEi9y', '2019-03-07');
INSERT INTO public.logintable VALUES (144, 'HFry', 344, '$2a$08$MNLbKAM.lAJAjXdB1/1ag.YNX8cCLorhK53bwlWSPIraEh43VNSei', '2017-07-12');
INSERT INTO public.logintable VALUES (145, 'KGarza', 345, '$2a$08$TVcq8JaOci.UGciTamLJkeWRGsW2ety5xQlv70dn5siDYM5SFP//S', '2017-08-10');
INSERT INTO public.logintable VALUES (146, 'MNielsen', 346, '$2a$08$HZ4DV3Hpvy5N/UdeDhwuuu9nLjMXACe70oj/Bt7rFeC/S/LzXJ572', '2017-09-04');
INSERT INTO public.logintable VALUES (147, 'MBryan', 347, '$2a$08$zzDy2tGIwuZj7lmHHwqB3Ol39Qf/ulT1oabLAObKCG.xgMAQXfxpC', '2018-07-04');
INSERT INTO public.logintable VALUES (148, 'FLarsen', 348, '$2a$08$6WrRLYxBcct9grQOD2l29u3RY8jJ2TA.P63o5NcLARlh5giGHKoH2', '2018-09-18');
INSERT INTO public.logintable VALUES (149, 'HMoore', 349, '$2a$08$SnGVknUz/C8L91CrgdgaPuPBaTMRbij0w4RKdh1cO5XmRFupfAZ8G', '2018-08-04');
INSERT INTO public.logintable VALUES (150, 'HAndrews', 350, '$2a$08$XD8J0Zo4CtGaAwF3FDuj9.3Yo.Zw6rhT05RKE5h8k/kAB2vsoiS0y', '2018-08-13');
INSERT INTO public.logintable VALUES (151, 'VMckee', 351, '$2a$08$V8swvjplivsgKN9C29Telucpl6x5t2zCiPGXPST3LvG8tgtg0keaG', '2017-08-04');
INSERT INTO public.logintable VALUES (152, 'OLeblanc', 352, '$2a$08$GB6Gnj5GGvob7w6bsP4MROpTTcrttRhf.7kHCIYGxLOc80Sd.KMJ6', '2017-07-22');
INSERT INTO public.logintable VALUES (153, 'PGolden', 353, '$2a$08$R/Hx2OqwE3yAyUjepQ9EneRO03KS.fcYJmaO4yq04Lj25LF8qML9y', '2018-12-14');
INSERT INTO public.logintable VALUES (154, 'HLyons', 354, '$2a$08$DhgC2GJ87rNPr8twuIkLmefZETvvS04jyN92obo6wDSIOd4EG.39i', '2017-07-01');
INSERT INTO public.logintable VALUES (155, 'MSolomon', 355, '$2a$08$dgJTHkm5EsB/Qk1PiDhS5OpW8dix0T9K.suBfskl57JAi6yVzmqrq', '2018-01-05');
INSERT INTO public.logintable VALUES (156, 'CPuckett', 356, '$2a$08$msAlpIWMPV8IdSilDHDdXewJOClinYOFLSkcyCgjkRPMkcALct4lC', '2018-02-15');
INSERT INTO public.logintable VALUES (157, 'OBullock', 357, '$2a$08$8dGefaHz6PgOJI3Ma9dgIO0nYTlrTfTRcUvPN0oE00wHLRQd93Ehu', '2019-05-15');
INSERT INTO public.logintable VALUES (158, 'VDejesus', 358, '$2a$08$1OuVKBtMZSohXsWSzaQRVuX9CoU46qNeOz9LoYLpx0aHVeouJeiUC', '2018-10-22');
INSERT INTO public.logintable VALUES (159, 'IDaugherty', 359, '$2a$08$Y2aGS2OjsTN8q3Efsdqt9eDy/dWK9RQ850y0lNp/t9n1/vAKyz5QC', '2018-04-08');
INSERT INTO public.logintable VALUES (160, 'HHowell', 360, '$2a$08$c3Om98lNGlk2Gl3LxZBe3u9UGU6grpbZeEAkH7kb3KybXUwJ1BUd6', '2019-05-21');
INSERT INTO public.logintable VALUES (161, 'ULester', 361, '$2a$08$H7o6f/Gx/FMXf1d0ZubtxutEFzULL70rd24lQqsWFxIIIPtAQw4zi', '2017-12-11');
INSERT INTO public.logintable VALUES (162, 'ABrennan', 362, '$2a$08$d72bfJTEK4YBo9R7Y/Ye3em72PJhswJD5/L/K5UHwvYIF9wAIQxx.', '2018-10-25');
INSERT INTO public.logintable VALUES (163, 'ZBeasley', 363, '$2a$08$PwtJuD5FeD7gpaGhc/FW.uGhihAB/ZLIwnh8fvE4yIDgwDZdtrVuC', '2018-01-17');
INSERT INTO public.logintable VALUES (164, 'CDrake', 364, '$2a$08$Inh6LWnR7FMycDu2dXsXpe2EOSXBtS7uD7G7kS4O7YLCLdDRn4fFK', '2018-10-09');
INSERT INTO public.logintable VALUES (165, 'WStafford', 365, '$2a$08$eyQlYYFOqRbXR1hzNW5jDezxdqAEDP.nz8Hd7PUzF0dzch70oLoNK', '2019-05-12');
INSERT INTO public.logintable VALUES (166, 'LRyan', 366, '$2a$08$zF2aEKu45gq2QVCNxR.u5.U9vDRtWlo4GVm5dY6FZk5BNiSkZM2WC', '2019-03-05');
INSERT INTO public.logintable VALUES (167, 'SDickson', 367, '$2a$08$ZGdVvi5eSI9y60eMPpl1pOKkeoQ3nHRJALPb6B//tPFzDUe98Ci/K', '2017-09-04');
INSERT INTO public.logintable VALUES (168, 'KGoodman', 368, '$2a$08$Lc9FmCXOwJkfki8A8lswRuRXE9Aw939piHushuMToqrKoKdf/.vEi', '2018-11-19');
INSERT INTO public.logintable VALUES (169, 'KBall', 369, '$2a$08$BrMCJUxKKjEY.MAWtMbSReHsyw3OGfcKvv/TW8xhx/m4PI6Xz2Iw.', '2018-05-05');
INSERT INTO public.logintable VALUES (170, 'NTucker', 370, '$2a$08$SFviOHiHm4ektKKhPx92vuswLOscGOBMKXxvsaKLA2uMFRin0cqgi', '2017-10-06');
INSERT INTO public.logintable VALUES (171, 'AVega', 371, '$2a$08$bzEr3Pj0uslS6EWw0mCphOnUTFGS6FzT75HUZcYe7ng65P62Uo35m', '2017-07-27');
INSERT INTO public.logintable VALUES (172, 'ERowland', 372, '$2a$08$HFlxGAKZ32ZWSZOPiQn.a.0dMWgFw2U3G42LpJ8n8kRT7KlI/W5lW', '2019-04-21');
INSERT INTO public.logintable VALUES (173, 'MKemp', 373, '$2a$08$.hyDXfPH4Ep9F.5JT5.W0uuitcOV3Swkwt9uH1HVTNlQ0yqM5FwhO', '2018-09-18');
INSERT INTO public.logintable VALUES (174, 'ALindsey', 374, '$2a$08$u.51UwIAVK8BuhdaxqsUW.mulQCqAOwNO0T4eYvzW3a2Nd9sxFGu2', '2018-12-02');
INSERT INTO public.logintable VALUES (175, 'HVazquez', 375, '$2a$08$rs/RMbP/x1fKrQme.Nmvne6hdzHt7NkXVIzxJPS8/e.D7ysqSpEWG', '2018-08-28');
INSERT INTO public.logintable VALUES (176, 'KPetersen', 376, '$2a$08$shCeCCWm5OANuRqCUvgCxuW9krulm1OEDMIZsO2nIOKHJ8d6bzEQ2', '2018-05-10');
INSERT INTO public.logintable VALUES (177, 'TPaul', 377, '$2a$08$QK5bhHNd9YpAyoHz49PodefphvlzcChmzt0qYfv5dkMRwTed/vVeG', '2018-12-06');
INSERT INTO public.logintable VALUES (178, 'HHeath', 378, '$2a$08$jNACpgN8OagaEzDdCeEy2.CQajUlgCcuiDkSkpU1YoZlve4CRLhr6', '2018-11-27');
INSERT INTO public.logintable VALUES (179, 'AHull', 379, '$2a$08$A57rztkTWPae2X.dkkPvXO9RcvVT8RUa4FUfIUciMKYKs79ZTyHpe', '2018-07-24');
INSERT INTO public.logintable VALUES (180, 'SWallace', 380, '$2a$08$K7uFVht9utsvTgl.TBRZjOjqk/ZCgA.fe6EzXnXdJ24L7U5h5Hq.G', '2017-10-26');
INSERT INTO public.logintable VALUES (181, 'MWatson', 381, '$2a$08$0EILIt0C65eyAvoOhTeIsuZsmxmR3d4fzypj5JEbwhrR75o9u/8YW', '2018-09-16');
INSERT INTO public.logintable VALUES (182, 'BKeith', 382, '$2a$08$j1UvPuiPuxY/JLPgf0FQJuIR101Qn90CwCOGMrIGtHRjRcrlIcdh2', '2018-10-01');
INSERT INTO public.logintable VALUES (183, 'CPowers', 383, '$2a$08$iy/1RgZLuPfkvj1xoGeXi.8WLn0VP7dbqrP1gtF1VfK17DtzOHmka', '2017-08-22');
INSERT INTO public.logintable VALUES (184, 'TWiggins', 384, '$2a$08$ac/qrAa1fkd1DMW0/tMrNe4Po.QCswJWDIvgMVKfqYy//Cvgx6JBe', '2019-02-27');
INSERT INTO public.logintable VALUES (185, 'CStevenson', 385, '$2a$08$h6D9/Rc3j2N7IgfEQzPVJ.zLLvciuJe2Mhe.ahxAPcO97ATC0YRHi', '2018-12-31');
INSERT INTO public.logintable VALUES (186, 'CWilliamson', 386, '$2a$08$2pt5Or6DGHcyPFtm.WI00uyC30WK/g7Lss6/da6kFgasINwxHX3M6', '2017-07-02');
INSERT INTO public.logintable VALUES (187, 'CMorton', 387, '$2a$08$JKr3vincNrv3P6zWy1czHeKbyl6CfWiNib7LosjXpXY2BxF8jnega', '2017-09-12');
INSERT INTO public.logintable VALUES (188, 'ARay', 388, '$2a$08$QSempvPWEwG5jmtD9NIxx.4QGFcWt7RBq4TtFLTP7wGpPQfk28/Du', '2017-09-11');
INSERT INTO public.logintable VALUES (189, 'WCasey', 389, '$2a$08$u9m94pmHuRvy8ucmIjS4w.QLS4ucSNviz2XjF9JCh4l6K1rvwMTm.', '2018-06-29');
INSERT INTO public.logintable VALUES (190, 'LWhite', 390, '$2a$08$IBVXsQq4jlcKJK7Jqje.4OCGF4Dq4mEBnYL24V.fCv3dt7i6WZkCO', '2018-04-08');
INSERT INTO public.logintable VALUES (191, 'RObrien', 391, '$2a$08$w4MGUvb0/Y1peSUkw7fvL.k13Dk6NhM7PeeiTli2tFS41MeqjsfeO', '2018-02-21');
INSERT INTO public.logintable VALUES (192, 'REspinoza', 392, '$2a$08$iYl/ZMoDAI80Fbt9zr7HGOoyH0Rh9Qu9ABluUtt3K6r4oU8mPEBOq', '2018-12-31');
INSERT INTO public.logintable VALUES (193, 'CNoble', 393, '$2a$08$F4tKO4jmzpQJMq3KufU7lulEswbSmVccyZ1GHqWQkY.z6yhqRygm2', '2017-12-01');
INSERT INTO public.logintable VALUES (194, 'TBanks', 394, '$2a$08$Pp0tGqUKR2MDRsBTFyiw5ul1ye5vKzx2B85kzdPE4VymlI3deWoJi', '2018-10-20');
INSERT INTO public.logintable VALUES (195, 'MGonzalez', 395, '$2a$08$R64azMZ5WnokoSOIQXoFGerU/gDbjwWPDKmkSVbOL6uqjyAM0.Esa', '2018-02-02');
INSERT INTO public.logintable VALUES (196, 'WPadilla', 396, '$2a$08$7zoXuKvmCI87I/ji6KfTKOEARpc33YFzGXqmzsWJJV1ovWUe.HcOG', '2017-07-07');
INSERT INTO public.logintable VALUES (197, 'UBender', 397, '$2a$08$/xqFkLPb3EH7VvLcT0HVz.goM6T4cStBPXAl8hFEjR3rIHzklENby', '2018-10-20');
INSERT INTO public.logintable VALUES (198, 'CDunlap', 398, '$2a$08$gAGDvz.sFaO7S6db.8F9AedIq9wMN7tF7zbjOhOcdNT4tEe7LX/TG', '2017-08-16');
INSERT INTO public.logintable VALUES (199, 'BHowe', 399, '$2a$08$4X/.76ZR0o2ssDtJXrGzPOZE6JeNE5pYdmbyL1Kz50kEk0zXYKOYW', '2017-06-30');
INSERT INTO public.logintable VALUES (200, 'FSkinner', 400, '$2a$08$9c/4FfBiVUiXwqCtZoCsZuUp7gyIWQOvi5V848pmGzA8inDImD8n.', '2017-07-07');
INSERT INTO public.logintable VALUES (201, 'SJefferson', 1, '$2a$08$ICLCJx.H9V34M4nXBOrXiOlHe2bFZFsQx6YyTd94Obd6PqB7T5UDO', '2017-01-15');
INSERT INTO public.logintable VALUES (202, 'MLarson', 2, '$2a$08$PgpmPxu4zopIHhG/7J0PoOIRWefYA0iqX.3UI1XqDdLyuyW5oxjDy', '2017-01-15');
INSERT INTO public.logintable VALUES (203, 'LCarney', 3, '$2a$08$jD0stngSC99YIRR26GntXOQQS0gd.MLOAVvgvfbezCPVbehAfxj4e', '2017-01-15');
INSERT INTO public.logintable VALUES (204, 'LMasters', 4, '$2a$08$UBrkj/7PZGbPFJaYqT5Yc.AVFPQFxQ996mG7IiuFyG8HJdTikii8y', '2017-01-15');
INSERT INTO public.logintable VALUES (205, 'MBrown', 5, '$2a$08$dyx/J.MUvJ9dSdlfM6cKiejaa4765XHNB6PmngpTbC/O7ITZkEtwK', '2017-01-20');
INSERT INTO public.logintable VALUES (206, 'DCernoff', 6, '$2a$08$8jFPGOBo477UlMkkEdlnvOh7OYqofDuwV.i.PvPTcQ7L7EoIekySW', '2017-01-20');
INSERT INTO public.logintable VALUES (207, 'AMoon', 7, '$2a$08$diA.QDNnxjihtN.VkRijPO485UFU73FkIKN.EGSJ7U92DKiBW3dn6', '2017-01-25');
INSERT INTO public.logintable VALUES (208, 'TSmith', 8, '$2a$08$4uE1wVFNzqMwD48cNrrTd.Um0O0q8/woJXEMuwpmUVo5n6TbTGzMy', '2017-02-05');
INSERT INTO public.logintable VALUES (209, 'BKell', 9, '$2a$08$h.Chy8QzmcIGYFfaaA6l0uoWj7HF2ZRHTDUrokMu.1FnC1JjzNN1u', '2017-02-08');
INSERT INTO public.logintable VALUES (210, 'CRoberts', 10, '$2a$08$yRPFMmQe7UGed9WZwOSZAeVPfM5WHdty92J.5GRUWT60/p3zDxF0.', '2017-02-15');
INSERT INTO public.logintable VALUES (211, 'MNelson', 11, '$2a$08$.Tk0FWkt0reMYDiT9Wd6reVo35ulPMr9fymd83iAZLLKTcy1TP0PC', '2017-02-17');
INSERT INTO public.logintable VALUES (212, 'SHon', 12, '$2a$08$LHHKuNC.1IFf8D6KO6SD7ONLyu/GpYtyzzyuPAZGRKMy9QEs.9Jm.', '2017-02-21');
INSERT INTO public.logintable VALUES (213, 'MJones', 401, '$2a$08$RO5LqJd1/csADGDzIqnzXupUKbbdtERCrsMQ4PsJ1IPiEZi.L2fVO', '2018-01-20');
INSERT INTO public.logintable VALUES (214, 'CSanders', 402, '$2a$08$EtTsNW54l4/F/Sc3QuMGDulLRmyr3IQcOJoz2yUMs4J1AUH73BkAy', '2018-01-20');


--
-- TOC entry 3149 (class 0 OID 16769)
-- Dependencies: 217
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person VALUES (201, 'Curry', 'Thaddeus', 'nec.luctus.felis@lobortisquama.co.uk', '7186 Aliquet Street', 'Columbia', 'MO', '87750', '(482) 461-4908', '2017-09-14');
INSERT INTO public.person VALUES (202, 'Livingston', 'Debra', 'mauris@augueeutellus.edu', '469-2541 Semper, Rd.', 'Joliet', 'IL', '79613', '(235) 499-5733', '2017-08-19');
INSERT INTO public.person VALUES (203, 'Tyler', 'Heidi', 'gravida.Aliquam@loremacrisus.net', 'Ap #200-3584 Amet Street', 'Overland Park', 'KS', '41926', '(778) 851-8853', '2018-04-17');
INSERT INTO public.person VALUES (204, 'Payne', 'Veronica', 'nisl.sem.consequat@Aliquamtincidunt.co.uk', 'P.O. Box 728, 7878 Cum Avenue', 'Stamford', 'CT', '85676', '(335) 280-1472', '2017-07-10');
INSERT INTO public.person VALUES (205, 'Justice', 'Vivien', 'erat.volutpat@odioAliquam.org', 'P.O. Box 279, 5442 Mauris St.', 'Owensboro', 'KY', '98838', '(308) 644-3540', '2017-08-15');
INSERT INTO public.person VALUES (206, 'Sullivan', 'Jennifer', 'eu.enim.Etiam@auctorvitae.edu', '420-2067 Urna. Rd.', 'Auburn', 'ME', '12116', '(353) 448-8971', '2018-08-10');
INSERT INTO public.person VALUES (207, 'Riddle', 'Fuller', 'Aenean@famesacturpis.co.uk', '4972 Vestibulum, Av.', 'Green Bay', 'WI', '39813', '(275) 135-5620', '2018-11-24');
INSERT INTO public.person VALUES (208, 'Beck', 'Harper', 'hendrerit@sapien.com', 'P.O. Box 749, 4797 Interdum. Av.', 'Sioux City', 'IA', '89411', '(651) 563-2145', '2017-12-08');
INSERT INTO public.person VALUES (209, 'Henry', 'Laith', 'elementum@felis.com', '838-6731 Proin Rd.', 'New Haven', 'CT', '55575', '(380) 826-1434', '2018-11-10');
INSERT INTO public.person VALUES (210, 'Roberson', 'Kane', 'tristique.senectus.et@Integer.com', 'P.O. Box 980, 4507 Lobortis Rd.', 'Tallahassee', 'FL', '19676', '(894) 713-4106', '2018-11-06');
INSERT INTO public.person VALUES (211, 'Clark', 'Geraldine', 'tempor@molestie.com', '4359 Malesuada Av.', 'Newark', 'DE', '18343', '(237) 184-0486', '2018-09-27');
INSERT INTO public.person VALUES (212, 'Bryant', 'Anthony', 'facilisis@nisidictumaugue.co.uk', 'P.O. Box 165, 6185 Proin Rd.', 'Kaneohe', 'HI', '50705', '(581) 620-9594', '2018-07-01');
INSERT INTO public.person VALUES (213, 'Stafford', 'Samson', 'conubia.nostra@Nullamvitae.net', '6771 Purus, Av.', 'Billings', 'MT', '26095', '(430) 793-5124', '2018-10-30');
INSERT INTO public.person VALUES (214, 'Pratt', 'Brenna', 'orci.luctus.et@sedconsequatauctor.co.uk', 'P.O. Box 340, 2345 Orci, Street', 'Bridgeport', 'CT', '14720', '(379) 839-4430', '2017-06-25');
INSERT INTO public.person VALUES (215, 'Huff', 'Kirestin', 'id.ante.dictum@netusetmalesuada.co.uk', 'P.O. Box 918, 2070 Maecenas Av.', 'Butte', 'MT', '89463', '(564) 345-5631', '2018-06-18');
INSERT INTO public.person VALUES (216, 'Morgan', 'Maite', 'magna.a@loremut.com', 'Ap #922-4188 Ut Rd.', 'Lincoln', 'NE', '67070', '(656) 240-6504', '2018-12-22');
INSERT INTO public.person VALUES (217, 'Mcclain', 'Hadley', 'Quisque@nisiaodio.net', 'Ap #812-4012 Sed Road', 'Clarksville', 'TN', '93234', '(941) 336-0869', '2018-01-08');
INSERT INTO public.person VALUES (218, 'Blackburn', 'Vera', 'diam.Duis.mi@nullavulputate.ca', '4253 Eget Rd.', 'Lincoln', 'NE', '12442', '(280) 476-9824', '2019-04-20');
INSERT INTO public.person VALUES (219, 'Smith', 'Luke', 'aliquet.odio.Etiam@sapienCrasdolor.com', '1693 Tincidunt. Road', 'Olathe', 'KS', '96892', '(226) 286-2606', '2018-11-04');
INSERT INTO public.person VALUES (220, 'Cross', 'Hollee', 'nec.mauris@ornare.ca', 'Ap #137-2013 Molestie Av.', 'Mesa', 'AZ', '86442', '(972) 134-0583', '2018-02-07');
INSERT INTO public.person VALUES (221, 'Irwin', 'Jane', 'erat.eget.ipsum@Suspendisseseddolor.org', '743-4122 Eu St.', 'Tampa', 'FL', '94931', '(438) 635-0071', '2017-07-22');
INSERT INTO public.person VALUES (222, 'Knapp', 'Margaret', 'hymenaeos@egestas.ca', 'Ap #881-5482 Condimentum Road', 'Kansas City', 'KS', '81681', '(774) 157-2935', '2019-01-19');
INSERT INTO public.person VALUES (223, 'Banks', 'Brynne', 'nonummy.Fusce@nisi.com', '2312 Felis Street', 'Saint Paul', 'MN', '77970', '(372) 294-6964', '2017-11-25');
INSERT INTO public.person VALUES (224, 'Love', 'Xantha', 'condimentum@rhoncusidmollis.co.uk', '5393 Cursus, Ave', 'Jonesboro', 'AR', '71472', '(199) 585-5153', '2018-10-25');
INSERT INTO public.person VALUES (225, 'Bullock', 'Porter', 'mollis.Duis@mauris.co.uk', '190-1915 Dapibus Avenue', 'Wilmington', 'DE', '77356', '(376) 327-5210', '2019-05-27');
INSERT INTO public.person VALUES (226, 'Bright', 'Shelly', 'dui.Cum@disparturient.com', 'Ap #201-1520 Non Street', 'Jonesboro', 'AR', '71000', '(615) 113-9490', '2019-01-24');
INSERT INTO public.person VALUES (227, 'Crane', 'Donna', 'egestas.a.dui@mollisneccursus.org', '231-4018 Sed Avenue', 'Shreveport', 'LA', '14344', '(445) 965-0172', '2018-02-07');
INSERT INTO public.person VALUES (228, 'Levine', 'Dante', 'ac.libero.nec@libero.net', '844 Scelerisque St.', 'South Bend', 'IN', '72105', '(253) 188-2571', '2017-10-11');
INSERT INTO public.person VALUES (229, 'Watts', 'Valentine', 'et@lorem.net', 'P.O. Box 454, 8604 Velit Rd.', 'Henderson', 'NV', '41898', '(914) 710-2890', '2018-11-18');
INSERT INTO public.person VALUES (230, 'Christian', 'Mari', 'morbi.tristique@duiquis.net', 'Ap #746-6499 Morbi Road', 'Little Rock', 'AR', '71520', '(361) 990-3102', '2017-10-21');
INSERT INTO public.person VALUES (231, 'Curtis', 'Charde', 'Nulla.interdum@Morbi.org', '8816 Lorem Rd.', 'Independence', 'MO', '50463', '(618) 170-9458', '2019-01-29');
INSERT INTO public.person VALUES (232, 'Alvarado', 'Vielka', 'lectus.rutrum.urna@interdum.com', '168-5707 Dolor. Ave', 'West Valley City', 'UT', '99379', '(646) 385-6730', '2017-11-03');
INSERT INTO public.person VALUES (233, 'Collier', 'Steven', 'Sed.nulla@Donecfeugiat.org', '866 Aliquet. St.', 'Lincoln', 'NE', '98289', '(178) 575-2951', '2017-09-14');
INSERT INTO public.person VALUES (234, 'Craft', 'Scott', 'facilisis@eget.org', '814 Nunc Street', 'Las Vegas', 'NV', '25025', '(703) 275-1784', '2018-02-03');
INSERT INTO public.person VALUES (235, 'Franco', 'Unity', 'ligula.Nullam@vel.com', '569-7792 Quam Rd.', 'Rochester', 'MN', '11558', '(406) 283-7429', '2017-07-11');
INSERT INTO public.person VALUES (236, 'Sloan', 'Erasmus', 'eu.ligula.Aenean@vel.ca', 'Ap #209-258 Ipsum. Rd.', 'Huntsville', 'AL', '35682', '(462) 992-4201', '2018-01-03');
INSERT INTO public.person VALUES (237, 'Cook', 'Constance', 'libero@dignissim.co.uk', '114-543 Vulputate, Avenue', 'Owensboro', 'KY', '28531', '(463) 858-1858', '2018-10-27');
INSERT INTO public.person VALUES (238, 'Conrad', 'Julian', 'libero@vehiculaet.co.uk', 'P.O. Box 462, 1738 Ultricies Rd.', 'Lafayette', 'LA', '91491', '(648) 262-5058', '2017-09-03');
INSERT INTO public.person VALUES (239, 'Watts', 'Xyla', 'convallis.convallis@diam.com', 'Ap #804-7317 Enim, St.', 'Baton Rouge', 'LA', '96790', '(294) 122-4073', '2018-06-01');
INSERT INTO public.person VALUES (240, 'Brock', 'TaShya', 'nisl@cursusInteger.org', '424-9661 Magna St.', 'Norman', 'OK', '80964', '(667) 698-2815', '2018-03-14');
INSERT INTO public.person VALUES (241, 'Mayer', 'Keely', 'mauris.sit@Integersemelit.edu', '474 Integer Street', 'Eugene', 'OR', '65107', '(498) 912-0754', '2018-09-29');
INSERT INTO public.person VALUES (242, 'Becker', 'David', 'magna.sed@Aliquam.edu', '9647 Donec Avenue', 'Lansing', 'MI', '12738', '(191) 881-8186', '2018-08-29');
INSERT INTO public.person VALUES (243, 'Richards', 'Preston', 'luctus@Duis.co.uk', '6735 In Av.', 'Pittsburgh', 'PA', '18783', '(199) 239-1018', '2019-01-02');
INSERT INTO public.person VALUES (244, 'Olsen', 'Sylvia', 'Integer.in.magna@Sedid.co.uk', 'P.O. Box 785, 8456 Nam Rd.', 'Columbia', 'MO', '62262', '(714) 800-3552', '2019-02-15');
INSERT INTO public.person VALUES (245, 'Mason', 'Hyatt', 'ultrices.mauris@justonec.net', '693-8469 Metus Rd.', 'Augusta', 'GA', '30615', '(441) 305-9404', '2018-08-19');
INSERT INTO public.person VALUES (246, 'Solomon', 'Macy', 'varius.et@pedemalesuada.net', '1476 Nam Road', 'Springfield', 'MO', '40414', '(589) 598-0781', '2018-12-03');
INSERT INTO public.person VALUES (247, 'White', 'Elvis', 'eget.metus@purusgravidasagittis.edu', '7368 Vel St.', 'Portland', 'ME', '87020', '(519) 905-6180', '2018-11-20');
INSERT INTO public.person VALUES (248, 'Cash', 'Berk', 'amet@aodio.ca', '6160 Vitae St.', 'Columbus', 'OH', '92775', '(638) 356-6238', '2018-06-17');
INSERT INTO public.person VALUES (249, 'Justice', 'Jessica', 'magnis.dis@dictumeleifend.ca', 'Ap #639-6646 Semper Ave', 'North Las Vegas', 'NV', '51803', '(322) 516-3779', '2017-11-01');
INSERT INTO public.person VALUES (250, 'Carney', 'Ebony', 'commodo@accumsaninterdumlibero.net', '957-3277 Vel Street', 'Cleveland', 'OH', '46120', '(919) 484-3195', '2019-03-17');
INSERT INTO public.person VALUES (251, 'Heath', 'Isabelle', 'senectus.et.netus@enimMaurisquis.net', 'Ap #793-6314 Leo, St.', 'South Burlington', 'VT', '75512', '(997) 436-7051', '2018-05-22');
INSERT INTO public.person VALUES (252, 'Best', 'Quintessa', 'tortor@sit.ca', 'Ap #792-495 Metus Ave', 'Norman', 'OK', '18666', '(664) 934-5686', '2019-06-08');
INSERT INTO public.person VALUES (253, 'Houston', 'Xenos', 'commodo.hendrerit@Sedmalesuada.net', 'P.O. Box 975, 406 Varius. Ave', 'Portland', 'OR', '24169', '(738) 824-0174', '2018-12-31');
INSERT INTO public.person VALUES (254, 'Alvarez', 'Gray', 'eu.sem.Pellentesque@diamluctus.org', 'Ap #417-2732 Nonummy. Avenue', 'Evansville', 'IN', '16051', '(602) 723-0616', '2017-08-27');
INSERT INTO public.person VALUES (255, 'Guerrero', 'Lucius', 'gravida.sagittis.Duis@odio.edu', '739 Habitant Ave', 'Missoula', 'MT', '63429', '(506) 920-0032', '2018-02-10');
INSERT INTO public.person VALUES (256, 'Allison', 'Zephr', 'Sed.molestie@fringillapurus.co.uk', '167-2291 Tellus Ave', 'Pocatello', 'ID', '66457', '(863) 224-5794', '2018-06-04');
INSERT INTO public.person VALUES (257, 'Mason', 'Beverly', 'nec.ante@neceleifendnon.net', 'P.O. Box 363, 685 Purus Road', 'Hartford', 'CT', '55515', '(675) 692-9799', '2018-06-22');
INSERT INTO public.person VALUES (258, 'Glenn', 'Germaine', 'in.dolor@euplacerateget.ca', 'Ap #637-2969 Nisi St.', 'Memphis', 'TN', '58157', '(704) 541-8161', '2019-01-03');
INSERT INTO public.person VALUES (259, 'Carrillo', 'Lenore', 'Aliquam.rutrum@nuncrisus.com', '631-2164 Nullam Av.', 'Bellevue', 'NE', '20187', '(579) 944-8770', '2018-02-11');
INSERT INTO public.person VALUES (260, 'Lee', 'Lee', 'rutrum@egestas.ca', '6365 Dolor. Road', 'Broken Arrow', 'OK', '54086', '(475) 974-6007', '2017-08-04');
INSERT INTO public.person VALUES (261, 'Anderson', 'Cedric', 'Curabitur.vel@Cras.co.uk', 'Ap #297-8990 Aliquam Rd.', 'Sioux City', 'IA', '92980', '(984) 429-4477', '2018-07-16');
INSERT INTO public.person VALUES (262, 'Roberson', 'Marcia', 'et@tellus.org', '181-9502 Enim St.', 'Huntsville', 'AL', '36174', '(828) 548-1650', '2018-03-09');
INSERT INTO public.person VALUES (263, 'Santana', 'Steel', 'urna@mattis.net', '698-6438 Aliquam Rd.', 'San Antonio', 'TX', '67804', '(198) 275-3254', '2019-02-10');
INSERT INTO public.person VALUES (264, 'Koch', 'Emerson', 'sit.amet@consectetuermauris.co.uk', '5537 Auctor St.', 'Montgomery', 'AL', '36134', '(660) 431-4614', '2018-11-25');
INSERT INTO public.person VALUES (265, 'Bruce', 'Alexander', 'nunc.Quisque@Nam.net', 'Ap #520-3813 Lectus St.', 'Tulsa', 'OK', '22769', '(949) 449-8061', '2018-09-15');
INSERT INTO public.person VALUES (266, 'Simmons', 'Ila', 'leo.elementum@Mauris.org', '633-9020 Nec St.', 'Honolulu', 'HI', '99773', '(844) 328-9569', '2019-03-22');
INSERT INTO public.person VALUES (267, 'Velazquez', 'Lance', 'Nullam.vitae.diam@In.edu', 'P.O. Box 766, 6502 Posuere Rd.', 'Richmond', 'VA', '23795', '(737) 280-4702', '2018-09-27');
INSERT INTO public.person VALUES (268, 'Frank', 'Plato', 'sagittis@doloregestas.ca', 'P.O. Box 698, 1819 Aliquet Street', 'Chattanooga', 'TN', '61725', '(951) 716-5600', '2018-10-12');
INSERT INTO public.person VALUES (269, 'Macias', 'Brynn', 'magna@eleifend.edu', 'P.O. Box 614, 3155 Nunc Road', 'New Orleans', 'LA', '20593', '(495) 743-2696', '2017-10-15');
INSERT INTO public.person VALUES (270, 'Porter', 'Herman', 'risus@lacuspede.ca', '9005 Blandit Road', 'Metairie', 'LA', '50434', '(937) 183-6126', '2018-01-14');
INSERT INTO public.person VALUES (271, 'Castro', 'Jenette', 'auctor.velit.Aliquam@idenimCurabitur.org', '2811 Iaculis Street', 'Minneapolis', 'MN', '89709', '(745) 830-6706', '2018-11-11');
INSERT INTO public.person VALUES (272, 'William', 'Nicholas', 'nisl@risusquisdiam.co.uk', '4458 Tempor St.', 'Salem', 'OR', '98464', '(793) 287-3892', '2017-06-25');
INSERT INTO public.person VALUES (273, 'Williamson', 'Grace', 'Curabitur.massa.Vestibulum@parturientmontes.org', '9741 Hendrerit Avenue', 'Fort Wayne', 'IN', '91109', '(224) 757-3551', '2018-03-30');
INSERT INTO public.person VALUES (274, 'Holland', 'Nash', 'egestas.nunc@pede.com', 'P.O. Box 285, 2128 Ullamcorper, Road', 'Reno', 'NV', '38061', '(466) 560-4803', '2017-06-18');
INSERT INTO public.person VALUES (275, 'Pierce', 'Arsenio', 'ligula.elit@purusaccumsan.com', '903 Magna Street', 'Bangor', 'ME', '32186', '(319) 560-0221', '2018-03-02');
INSERT INTO public.person VALUES (276, 'Mcdaniel', 'Connor', 'tempor@tempor.com', 'Ap #212-5254 Nostra, Avenue', 'Anchorage', 'AK', '99771', '(527) 886-1529', '2018-05-31');
INSERT INTO public.person VALUES (277, 'Zamora', 'Aline', 'quis.arcu@lectusconvallisest.ca', 'P.O. Box 816, 2943 Non Ave', 'Toledo', 'OH', '93965', '(606) 913-0098', '2018-10-30');
INSERT INTO public.person VALUES (278, 'Britt', 'Clark', 'arcu.et.pede@porttitorinterdum.ca', '7974 Penatibus Rd.', 'Baton Rouge', 'LA', '43551', '(108) 512-3491', '2018-10-11');
INSERT INTO public.person VALUES (279, 'Chaney', 'Odette', 'Pellentesque.tincidunt@Mauriseuturpis.ca', '811-9498 Arcu. Ave', 'Gulfport', 'MS', '83625', '(165) 243-6217', '2017-12-19');
INSERT INTO public.person VALUES (280, 'Peck', 'Wesley', 'malesuada.Integer.id@Nullam.edu', 'P.O. Box 744, 1113 Rutrum, Street', 'Casper', 'WY', '82786', '(985) 281-6071', '2019-05-06');
INSERT INTO public.person VALUES (281, 'Kaufman', 'Lester', 'est.mauris@egestas.ca', '7193 A, Avenue', 'Springdale', 'AR', '72310', '(950) 528-8343', '2017-09-30');
INSERT INTO public.person VALUES (282, 'Nguyen', 'Donovan', 'ipsum@quis.edu', 'Ap #968-9376 Nibh. Avenue', 'Butte', 'MT', '52279', '(120) 268-8190', '2018-10-07');
INSERT INTO public.person VALUES (283, 'Donaldson', 'Sade', 'Donec.at.arcu@tortornibh.org', 'Ap #728-7189 Lorem, Road', 'Little Rock', 'AR', '71936', '(247) 759-4923', '2017-10-02');
INSERT INTO public.person VALUES (284, 'Greer', 'Oleg', 'auctor.velit@pedeac.net', 'Ap #963-1486 A Ave', 'Salt Lake City', 'UT', '58847', '(578) 772-4358', '2019-02-27');
INSERT INTO public.person VALUES (285, 'Rowe', 'Chancellor', 'adipiscing@velitAliquamnisl.com', '6279 Lorem Road', 'Lincoln', 'NE', '65684', '(883) 315-9038', '2017-11-23');
INSERT INTO public.person VALUES (286, 'White', 'Yuri', 'at.augue.id@cursus.net', 'P.O. Box 807, 8452 Tortor. Avenue', 'Lakewood', 'CO', '37624', '(534) 942-7976', '2018-03-20');
INSERT INTO public.person VALUES (287, 'Navarro', 'Risa', 'nec.eleifend.non@eu.ca', '416-4257 Malesuada Street', 'Madison', 'WI', '88305', '(147) 741-9611', '2019-02-09');
INSERT INTO public.person VALUES (288, 'Mcconnell', 'Declan', 'nascetur.ridiculus@atnisiCum.edu', 'P.O. Box 155, 3562 Laoreet Av.', 'Bear', 'DE', '65094', '(234) 222-4512', '2018-07-25');
INSERT INTO public.person VALUES (289, 'Anderson', 'Lev', 'quam.vel.sapien@purus.co.uk', 'Ap #533-4466 Proin Av.', 'Gaithersburg', 'MD', '69074', '(549) 940-7378', '2018-03-29');
INSERT INTO public.person VALUES (290, 'Howell', 'Sylvester', 'ante.lectus.convallis@eratSed.org', 'Ap #825-7237 Nullam St.', 'Portland', 'OR', '84017', '(807) 137-2513', '2019-01-11');
INSERT INTO public.person VALUES (291, 'Dixon', 'Jackson', 'odio.Etiam@sollicitudinadipiscing.co.uk', '5956 In Av.', 'Springfield', 'MO', '12988', '(842) 728-1537', '2017-10-02');
INSERT INTO public.person VALUES (292, 'Tyler', 'Zelenia', 'consequat.dolor@augue.co.uk', '796-4222 Est. St.', 'Cheyenne', 'WY', '78164', '(111) 678-1837', '2018-03-20');
INSERT INTO public.person VALUES (293, 'Knowles', 'Akeem', 'magna.Sed.eu@Nullamfeugiat.edu', 'Ap #782-7248 Vivamus Av.', 'Kenosha', 'WI', '33875', '(960) 724-5265', '2018-05-24');
INSERT INTO public.person VALUES (294, 'Franklin', 'Evangeline', 'eget@eratSed.ca', '5352 Velit. Av.', 'Grand Island', 'NE', '21958', '(412) 983-7414', '2019-03-30');
INSERT INTO public.person VALUES (295, 'Tanner', 'Whitney', 'purus@Aliquamfringillacursus.net', '8039 Id, Avenue', 'Bloomington', 'MN', '38558', '(403) 585-7467', '2018-07-15');
INSERT INTO public.person VALUES (296, 'Martin', 'Adrian', 'elementum@nascetur.net', 'P.O. Box 803, 9557 Vestibulum, Avenue', 'Biloxi', 'MS', '21609', '(811) 836-7895', '2018-09-29');
INSERT INTO public.person VALUES (297, 'Mclean', 'Madaline', 'Phasellus@egestas.edu', 'P.O. Box 349, 6402 Malesuada St.', 'Minneapolis', 'MN', '80985', '(639) 798-7210', '2017-08-11');
INSERT INTO public.person VALUES (298, 'Allen', 'Fleur', 'cubilia.Curae@necquamCurabitur.ca', '3574 A, St.', 'Columbia', 'MD', '66604', '(124) 446-5885', '2018-07-28');
INSERT INTO public.person VALUES (299, 'Murphy', 'Abraham', 'turpis.Nulla.aliquet@Aenean.edu', 'Ap #390-3386 Auctor, Rd.', 'Juneau', 'AK', '99585', '(364) 464-9127', '2017-12-08');
INSERT INTO public.person VALUES (300, 'Diaz', 'Drake', 'parturient@euaugueporttitor.ca', 'Ap #857-532 Dolor St.', 'Norfolk', 'VA', '84983', '(666) 484-3843', '2017-11-06');
INSERT INTO public.person VALUES (301, 'Fields', 'Sage', 'Sed@elementumsem.edu', '489-5358 Parturient St.', 'Houston', 'TX', '70577', '(988) 420-5814', '2019-04-21');
INSERT INTO public.person VALUES (302, 'Holt', 'Lane', 'in.molestie.tortor@euturpisNulla.org', 'Ap #861-9412 Fermentum Road', 'Montgomery', 'AL', '35857', '(434) 124-3143', '2019-03-13');
INSERT INTO public.person VALUES (303, 'Tyson', 'Bell', 'dolor.sit@ametnulla.ca', 'Ap #326-384 Morbi Ave', 'Jefferson City', 'MO', '12661', '(869) 892-0115', '2018-08-14');
INSERT INTO public.person VALUES (304, 'Manning', 'Xandra', 'molestie.dapibus@aliquameuaccumsan.com', '6568 Euismod Rd.', 'Idaho Falls', 'ID', '13401', '(624) 812-2853', '2017-10-13');
INSERT INTO public.person VALUES (305, 'Morton', 'Yasir', 'eros.Proin@venenatis.ca', '539-7135 Aliquam Av.', 'Jonesboro', 'AR', '72062', '(116) 711-2052', '2018-05-25');
INSERT INTO public.person VALUES (306, 'Carey', 'Harper', 'accumsan.laoreet.ipsum@nulla.com', '493-9850 Eu, Av.', 'Oklahoma City', 'OK', '92670', '(454) 552-2316', '2019-03-26');
INSERT INTO public.person VALUES (307, 'Hendricks', 'Morgan', 'Nunc.sollicitudin.commodo@ipsumnonarcu.ca', '9278 Eget Rd.', 'West Jordan', 'UT', '72646', '(865) 599-9585', '2018-03-10');
INSERT INTO public.person VALUES (308, 'Calderon', 'Austin', 'ipsum@Namligulaelit.co.uk', '272-8018 Magna Ave', 'Phoenix', 'AZ', '86395', '(592) 805-0577', '2017-06-17');
INSERT INTO public.person VALUES (309, 'Knox', 'Yen', 'Suspendisse.sagittis.Nullam@nulla.co.uk', 'P.O. Box 845, 9073 Nisi. Street', 'Kailua', 'HI', '34601', '(193) 571-6071', '2018-11-20');
INSERT INTO public.person VALUES (310, 'Kennedy', 'Jade', 'posuere@dignissimtempor.org', 'Ap #643-8118 Curabitur Av.', 'Bangor', 'ME', '43528', '(120) 152-6248', '2018-04-26');
INSERT INTO public.person VALUES (311, 'Hebert', 'Erica', 'libero@orci.ca', '884-7799 Accumsan Rd.', 'Kaneohe', 'HI', '48125', '(869) 918-7727', '2019-06-08');
INSERT INTO public.person VALUES (312, 'Knox', 'Akeem', 'nibh.Aliquam.ornare@massaQuisque.ca', '299-4104 Interdum Rd.', 'Juneau', 'AK', '99763', '(848) 553-1759', '2018-04-08');
INSERT INTO public.person VALUES (313, 'Taylor', 'Kimberley', 'sed.leo.Cras@Nunclaoreet.edu', '543-3559 Pharetra Rd.', 'Tuscaloosa', 'AL', '36363', '(292) 380-1064', '2019-04-04');
INSERT INTO public.person VALUES (314, 'Ratliff', 'Philip', 'tincidunt@velconvallisin.net', '500-937 Velit Street', 'Aurora', 'CO', '61938', '(220) 509-6373', '2018-03-25');
INSERT INTO public.person VALUES (315, 'Oneill', 'Ursula', 'eu.dui.Cum@aliquetnecimperdiet.org', '722-6118 Dolor Street', 'Springdale', 'AR', '71376', '(864) 145-8157', '2017-10-26');
INSERT INTO public.person VALUES (316, 'Summers', 'Lester', 'Phasellus.at.augue@vulputate.edu', '279-7616 Ultrices. Avenue', 'Grand Island', 'NE', '87436', '(837) 667-2623', '2019-05-30');
INSERT INTO public.person VALUES (317, 'Bolton', 'Isaiah', 'orci.luctus@liberonecligula.net', '8826 Maecenas St.', 'Erie', 'PA', '54576', '(630) 259-5121', '2017-11-16');
INSERT INTO public.person VALUES (318, 'Stanton', 'Xantha', 'purus.in@etrisus.co.uk', 'P.O. Box 223, 1495 Aliquam Rd.', 'Madison', 'WI', '95022', '(167) 605-2643', '2018-02-12');
INSERT INTO public.person VALUES (319, 'Clemons', 'Larissa', 'interdum.Curabitur@lobortistellusjusto.ca', '918-1014 Nunc Av.', 'Naperville', 'IL', '76619', '(448) 791-8257', '2018-03-07');
INSERT INTO public.person VALUES (320, 'Rose', 'Camille', 'justo.sit.amet@Nuncmauriselit.co.uk', '837-9297 Tempor, St.', 'Duluth', 'MN', '19738', '(328) 577-4302', '2018-01-29');
INSERT INTO public.person VALUES (321, 'Black', 'Nevada', 'lacus.pede.sagittis@blanditNam.ca', '9768 Neque Avenue', 'Newport News', 'VA', '16187', '(323) 321-4696', '2019-06-08');
INSERT INTO public.person VALUES (322, 'Mullen', 'Madeline', 'ornare@atnisiCum.co.uk', '5115 Urna Road', 'Portland', 'OR', '46308', '(566) 958-4669', '2017-09-11');
INSERT INTO public.person VALUES (323, 'Haynes', 'Lucius', 'ipsum.dolor.sit@dignissimmagna.edu', 'P.O. Box 931, 5516 Felis Avenue', 'Gulfport', 'MS', '88191', '(934) 272-1866', '2018-07-28');
INSERT INTO public.person VALUES (324, 'Strickland', 'Darius', 'nibh@malesuadamalesuada.edu', '9677 Dictum St.', 'Madison', 'WI', '93628', '(298) 527-8767', '2018-04-01');
INSERT INTO public.person VALUES (325, 'Warren', 'Dorian', 'Morbi@inmagna.net', '3250 Rhoncus. Rd.', 'Detroit', 'MI', '24385', '(377) 771-8410', '2019-03-13');
INSERT INTO public.person VALUES (326, 'Knowles', 'Elvis', 'at@elitsed.com', 'Ap #464-2199 Molestie Road', 'Chattanooga', 'TN', '43975', '(979) 407-5309', '2017-11-03');
INSERT INTO public.person VALUES (327, 'Cain', 'Byron', 'et.ultrices.posuere@eudui.edu', '115-3628 Id, Av.', 'Tucson', 'AZ', '86027', '(449) 792-6778', '2019-04-12');
INSERT INTO public.person VALUES (328, 'Cobb', 'Nita', 'nisi@portaelita.com', '519-1466 Vestibulum. Street', 'San Francisco', 'CA', '91830', '(800) 973-2712', '2018-04-07');
INSERT INTO public.person VALUES (329, 'Richardson', 'Aristotle', 'posuere@interdumNunc.net', '153-1884 Ipsum. Avenue', 'Evansville', 'IN', '20510', '(519) 931-2225', '2018-12-21');
INSERT INTO public.person VALUES (330, 'Nash', 'Kane', 'orci.Phasellus@eratvolutpat.net', 'Ap #321-6581 Ullamcorper Rd.', 'Bellevue', 'WA', '55178', '(374) 891-8916', '2018-03-16');
INSERT INTO public.person VALUES (331, 'Wyatt', 'Pearl', 'In.mi@ornare.org', '2784 Cursus St.', 'Anchorage', 'AK', '99715', '(386) 175-3132', '2017-10-06');
INSERT INTO public.person VALUES (332, 'Hudson', 'Edward', 'facilisis.facilisis.magna@semper.edu', 'Ap #875-4509 Vulputate, Rd.', 'San Jose', 'CA', '96597', '(641) 388-8563', '2017-12-26');
INSERT INTO public.person VALUES (333, 'Waters', 'Thane', 'egestas.lacinia.Sed@purusDuis.com', '808-1689 Sodales Road', 'Kapolei', 'HI', '24500', '(402) 247-1645', '2019-02-06');
INSERT INTO public.person VALUES (334, 'Chandler', 'Gloria', 'vestibulum@elit.edu', '201-5439 Erat, Rd.', 'Salem', 'OR', '71849', '(223) 553-0616', '2018-12-30');
INSERT INTO public.person VALUES (335, 'Rosales', 'Thomas', 'dolor@porttitor.edu', '636-7875 Sed Rd.', 'Gulfport', 'MS', '31984', '(468) 103-2547', '2018-01-12');
INSERT INTO public.person VALUES (336, 'Petty', 'Clarke', 'dapibus@milorem.co.uk', 'Ap #329-5624 Mollis. St.', 'Augusta', 'ME', '41991', '(751) 626-1239', '2017-08-08');
INSERT INTO public.person VALUES (337, 'Craft', 'Uma', 'posuere.enim@semperNamtempor.co.uk', '781-4912 Sit St.', 'Annapolis', 'MD', '21285', '(975) 609-9737', '2018-11-23');
INSERT INTO public.person VALUES (338, 'Flowers', 'Jada', 'penatibus.et@rhoncus.org', '927-840 Luctus Rd.', 'Lincoln', 'NE', '69693', '(295) 722-3281', '2019-03-12');
INSERT INTO public.person VALUES (339, 'Mcconnell', 'Joel', 'Nullam.scelerisque@faucibusorciluctus.com', 'P.O. Box 683, 8970 Ridiculus Rd.', 'Columbia', 'MD', '34772', '(611) 227-5424', '2018-10-19');
INSERT INTO public.person VALUES (340, 'Slater', 'Alfreda', 'condimentum@morbi.ca', 'P.O. Box 412, 5178 Luctus Street', 'Boise', 'ID', '54730', '(863) 355-5243', '2018-02-15');
INSERT INTO public.person VALUES (341, 'Watts', 'Athena', 'euismod.enim@duiin.org', '6737 Nisi St.', 'Biloxi', 'MS', '25049', '(908) 268-2650', '2018-07-25');
INSERT INTO public.person VALUES (342, 'Baldwin', 'Akeem', 'faucibus@nonsollicitudin.edu', 'P.O. Box 287, 4650 Arcu Rd.', 'Naperville', 'IL', '25861', '(779) 317-6638', '2017-10-08');
INSERT INTO public.person VALUES (343, 'Reid', 'Asher', 'bibendum.Donec.felis@dui.ca', '988-8427 Ac Road', 'Gresham', 'OR', '29861', '(822) 318-2382', '2019-03-07');
INSERT INTO public.person VALUES (344, 'Fry', 'Howard', 'Sed.molestie@luctusCurabituregestas.com', 'P.O. Box 144, 6576 Nullam St.', 'Miami', 'FL', '53219', '(762) 742-7989', '2017-07-12');
INSERT INTO public.person VALUES (345, 'Garza', 'Kerry', 'mattis@Inornare.ca', 'Ap #418-1334 Sit Rd.', 'Columbia', 'MO', '98154', '(284) 163-6296', '2017-08-10');
INSERT INTO public.person VALUES (346, 'Nielsen', 'Merrill', 'Aliquam.vulputate@nibhenim.ca', '8455 Nunc Street', 'Wilmington', 'DE', '81314', '(734) 942-3926', '2017-09-04');
INSERT INTO public.person VALUES (347, 'Bryan', 'Mechelle', 'semper.rutrum.Fusce@Phasellusfermentum.co.uk', 'P.O. Box 870, 4470 Tellus. Ave', 'Huntsville', 'AL', '36061', '(638) 392-2840', '2018-07-04');
INSERT INTO public.person VALUES (348, 'Larsen', 'Faith', 'elementum@acnullaIn.edu', '8692 Lacinia Rd.', 'Sioux City', 'IA', '79692', '(167) 819-0969', '2018-09-18');
INSERT INTO public.person VALUES (349, 'Moore', 'Hoyt', 'Ut.sagittis@Fusce.edu', 'P.O. Box 411, 7570 Ante Ave', 'Chandler', 'AZ', '85728', '(927) 834-8343', '2018-08-04');
INSERT INTO public.person VALUES (350, 'Andrews', 'Hunter', 'Phasellus@justo.com', '9220 Est, Rd.', 'Frankfort', 'KY', '28429', '(100) 285-1519', '2018-08-13');
INSERT INTO public.person VALUES (351, 'Mckee', 'Vivien', 'egestas.blandit@Donecporttitor.co.uk', '8769 Id Rd.', 'Kapolei', 'HI', '98581', '(530) 199-6713', '2017-08-04');
INSERT INTO public.person VALUES (352, 'Leblanc', 'Odessa', 'a.aliquet@Morbi.com', '972-6860 Nam Rd.', 'Minneapolis', 'MN', '73088', '(550) 860-6052', '2017-07-22');
INSERT INTO public.person VALUES (353, 'Golden', 'Prescott', 'penatibus@mattisornarelectus.com', '743-7737 Malesuada St.', 'Aurora', 'IL', '24109', '(616) 640-0168', '2018-12-14');
INSERT INTO public.person VALUES (354, 'Lyons', 'Hedda', 'tristique@magnaa.edu', 'P.O. Box 797, 6192 Natoque St.', 'Lincoln', 'NE', '14036', '(954) 543-3310', '2017-07-01');
INSERT INTO public.person VALUES (355, 'Solomon', 'Mufutau', 'congue.a.aliquet@nonhendrerit.net', '123 Dis Ave', 'Jonesboro', 'AR', '71253', '(651) 218-7234', '2018-01-05');
INSERT INTO public.person VALUES (356, 'Puckett', 'Callie', 'at.augue.id@metusAeneansed.edu', '2462 Fermentum Avenue', 'Casper', 'WY', '20396', '(236) 137-4116', '2018-02-15');
INSERT INTO public.person VALUES (357, 'Bullock', 'Oscar', 'nunc@pharetrafelis.co.uk', '8974 Orci Av.', 'Olathe', 'KS', '91301', '(717) 429-4665', '2019-05-15');
INSERT INTO public.person VALUES (358, 'Dejesus', 'Vincent', 'sodales.elit@Phasellus.ca', 'P.O. Box 838, 9522 Pretium Avenue', 'Cincinnati', 'OH', '78995', '(441) 814-9330', '2018-10-22');
INSERT INTO public.person VALUES (359, 'Daugherty', 'Ima', 'aliquet@posuerecubiliaCurae.ca', 'P.O. Box 276, 2851 Conubia St.', 'Hilo', 'HI', '21654', '(165) 761-6974', '2018-04-08');
INSERT INTO public.person VALUES (360, 'Howell', 'Herman', 'nibh@velitdui.edu', '3848 Non, Av.', 'College', 'AK', '99863', '(905) 189-8251', '2019-05-21');
INSERT INTO public.person VALUES (361, 'Lester', 'Uma', 'vitae.odio.sagittis@turpis.ca', '8997 Sit St.', 'Topeka', 'KS', '85253', '(843) 885-6485', '2017-12-11');
INSERT INTO public.person VALUES (362, 'Brennan', 'Aimee', 'tellus.Phasellus.elit@cursus.org', 'Ap #634-8207 Morbi Road', 'Rutland', 'VT', '60571', '(634) 966-2419', '2018-10-25');
INSERT INTO public.person VALUES (363, 'Beasley', 'Zahir', 'neque.sed.dictum@tinciduntduiaugue.com', '1249 Parturient Avenue', 'Athens', 'GA', '33242', '(156) 245-5394', '2018-01-17');
INSERT INTO public.person VALUES (364, 'Drake', 'Chaney', 'cursus.a.enim@sedorcilobortis.com', '2563 Et, Av.', 'Vancouver', 'WA', '95572', '(765) 692-1008', '2018-10-09');
INSERT INTO public.person VALUES (365, 'Stafford', 'Wanda', 'nulla@arcueu.net', '8797 Luctus Rd.', 'Biloxi', 'MS', '22993', '(323) 656-1001', '2019-05-12');
INSERT INTO public.person VALUES (366, 'Ryan', 'Libby', 'ante.bibendum@tinciduntorci.edu', 'P.O. Box 504, 4894 Fermentum Road', 'Las Vegas', 'NV', '22564', '(477) 456-4333', '2019-03-05');
INSERT INTO public.person VALUES (367, 'Dickson', 'Samantha', 'netus@Morbi.edu', 'Ap #179-5842 Enim Av.', 'South Burlington', 'VT', '28900', '(136) 337-3262', '2017-09-04');
INSERT INTO public.person VALUES (368, 'Goodman', 'Keefe', 'in.tempus@urnaUt.org', 'Ap #960-5231 Fermentum Ave', 'Clarksville', 'TN', '40880', '(274) 808-0763', '2018-11-19');
INSERT INTO public.person VALUES (369, 'Ball', 'Keefe', 'scelerisque.lorem@pede.net', 'P.O. Box 893, 5024 Maecenas Ave', 'Chesapeake', 'VA', '20148', '(452) 268-7203', '2018-05-05');
INSERT INTO public.person VALUES (370, 'Tucker', 'Naomi', 'Cras.eget@utodio.org', '852 Quisque Street', 'Tallahassee', 'FL', '58558', '(323) 389-9814', '2017-10-06');
INSERT INTO public.person VALUES (371, 'Vega', 'Aphrodite', 'sodales.at@Praesenteudui.ca', 'Ap #239-1677 Urna. Avenue', 'Grand Island', 'NE', '35508', '(326) 614-0746', '2017-07-27');
INSERT INTO public.person VALUES (372, 'Rowland', 'Ella', 'Donec.egestas.Aliquam@sociisnatoquepenatibus.net', 'P.O. Box 194, 6002 Vivamus St.', 'Duluth', 'MN', '30562', '(346) 658-7165', '2019-04-21');
INSERT INTO public.person VALUES (373, 'Kemp', 'Margaret', 'dictum.eleifend@euodioPhasellus.co.uk', '1050 Consectetuer Rd.', 'Hillsboro', 'OR', '54017', '(910) 107-1053', '2018-09-18');
INSERT INTO public.person VALUES (374, 'Lindsey', 'Alden', 'dui.quis.accumsan@Vestibulumante.edu', '5561 Ut Avenue', 'Joliet', 'IL', '72289', '(318) 100-4627', '2018-12-02');
INSERT INTO public.person VALUES (375, 'Vazquez', 'Hadassah', 'ultricies.dignissim@quam.edu', '5606 Quisque St.', 'Ketchikan', 'AK', '99702', '(677) 131-2733', '2018-08-28');
INSERT INTO public.person VALUES (376, 'Petersen', 'Kirk', 'sem.eget@Nullafacilisis.org', 'P.O. Box 181, 5742 Feugiat Street', 'Tacoma', 'WA', '35596', '(689) 245-4284', '2018-05-10');
INSERT INTO public.person VALUES (377, 'Paul', 'Tyrone', 'ante.blandit.viverra@risus.org', 'Ap #434-3040 Lacinia. Street', 'Des Moines', 'IA', '33244', '(651) 871-1097', '2018-12-06');
INSERT INTO public.person VALUES (378, 'Heath', 'Herrod', 'fames.ac.turpis@risusaultricies.net', '1255 In St.', 'South Burlington', 'VT', '38048', '(974) 930-5561', '2018-11-27');
INSERT INTO public.person VALUES (379, 'Hull', 'Aristotle', 'eros@eleifendnon.net', '747-7683 Donec Rd.', 'Shreveport', 'LA', '21696', '(390) 504-4973', '2018-07-24');
INSERT INTO public.person VALUES (380, 'Wallace', 'Shelley', 'nunc@malesuada.edu', '725-3108 Sed Av.', 'Lakewood', 'CO', '26375', '(389) 132-2730', '2017-10-26');
INSERT INTO public.person VALUES (381, 'Watson', 'Martha', 'luctus.aliquet.odio@duiCraspellentesque.com', 'Ap #730-2274 Lobortis, St.', 'Broken Arrow', 'OK', '51844', '(453) 536-3586', '2018-09-16');
INSERT INTO public.person VALUES (382, 'Keith', 'Basil', 'eu.placerat.eget@luctuslobortisClass.edu', 'Ap #276-3028 Primis Street', 'Pike Creek', 'DE', '21018', '(340) 899-7390', '2018-10-01');
INSERT INTO public.person VALUES (383, 'Powers', 'Camille', 'nunc@Integer.org', 'P.O. Box 388, 2549 Malesuada Av.', 'Huntsville', 'AL', '35783', '(888) 553-3541', '2017-08-22');
INSERT INTO public.person VALUES (384, 'Wiggins', 'Troy', 'congue.a@quama.ca', 'Ap #369-9324 Diam St.', 'San Francisco', 'CA', '95350', '(537) 535-3909', '2019-02-27');
INSERT INTO public.person VALUES (385, 'Stevenson', 'Carly', 'In.scelerisque.scelerisque@musAeneaneget.org', '665-9449 Facilisi. Rd.', 'Warren', 'MI', '57110', '(921) 395-8482', '2018-12-31');
INSERT INTO public.person VALUES (386, 'Williamson', 'Clayton', 'velit@ultricesposuerecubilia.org', 'P.O. Box 861, 4729 Vel, Rd.', 'Louisville', 'KY', '75413', '(446) 995-7025', '2017-07-02');
INSERT INTO public.person VALUES (387, 'Morton', 'Clio', 'nec.diam.Duis@Namnulla.com', 'P.O. Box 978, 7873 Nullam St.', 'Naperville', 'IL', '72770', '(204) 259-4821', '2017-09-12');
INSERT INTO public.person VALUES (388, 'Ray', 'Axel', 'dolor.dapibus@tinciduntnuncac.edu', 'Ap #479-7996 Ac, Rd.', 'Metairie', 'LA', '90430', '(685) 112-6883', '2017-09-11');
INSERT INTO public.person VALUES (389, 'Casey', 'Wilma', 'at.iaculis@eget.org', 'P.O. Box 641, 7554 Mauris. Street', 'Anchorage', 'AK', '99904', '(254) 399-4273', '2018-06-29');
INSERT INTO public.person VALUES (390, 'White', 'Latifah', 'eget@sollicitudin.co.uk', '407-7034 Donec Ave', 'Los Angeles', 'CA', '92349', '(634) 529-3896', '2018-04-08');
INSERT INTO public.person VALUES (391, 'Obrien', 'Reuben', 'risus.Quisque.libero@a.net', '360-9346 Lacus. Rd.', 'Davenport', 'IA', '68003', '(701) 761-1992', '2018-02-21');
INSERT INTO public.person VALUES (392, 'Espinoza', 'Rebekah', 'Donec.fringilla@turpisegestas.com', '7456 Non, Ave', 'Paradise', 'NV', '76623', '(146) 848-7904', '2018-12-31');
INSERT INTO public.person VALUES (393, 'Noble', 'Cooper', 'dolor.dapibus@sedestNunc.org', 'P.O. Box 734, 6071 Mauris Av.', 'Kearney', 'NE', '83955', '(922) 505-8857', '2017-12-01');
INSERT INTO public.person VALUES (394, 'Banks', 'Thane', 'rhoncus@musAenean.ca', '447 In St.', 'Carson City', 'NV', '99660', '(628) 691-0897', '2018-10-20');
INSERT INTO public.person VALUES (395, 'Gonzalez', 'Mia', 'ut.eros@Donecluctusaliquet.org', '9903 Cras Street', 'Saint Louis', 'MO', '72507', '(717) 419-5540', '2018-02-02');
INSERT INTO public.person VALUES (396, 'Padilla', 'Wendy', 'Etiam.laoreet.libero@semvitae.org', '451-3658 Nulla Avenue', 'Naperville', 'IL', '80177', '(864) 638-4324', '2017-07-07');
INSERT INTO public.person VALUES (397, 'Bender', 'Uta', 'vehicula.et.rutrum@Mauris.com', '4878 Ac, Rd.', 'Cleveland', 'OH', '98952', '(121) 426-5976', '2018-10-20');
INSERT INTO public.person VALUES (398, 'Dunlap', 'Calvin', 'quam.elementum@nibh.ca', 'P.O. Box 985, 7003 Nulla St.', 'Worcester', 'MA', '32393', '(574) 515-4181', '2017-08-16');
INSERT INTO public.person VALUES (399, 'Howe', 'Bevis', 'in@nequeSedeget.com', '230-7037 Quam Rd.', 'Springfield', 'MO', '72550', '(717) 248-9992', '2017-06-30');
INSERT INTO public.person VALUES (400, 'Skinner', 'Freya', 'dolor.Donec.fringilla@sed.ca', '8167 Nibh. Ave', 'Gary', 'IN', '20800', '(179) 155-6617', '2017-07-07');
INSERT INTO public.person VALUES (1, 'Jefferson', 'Sandra', 'sandra.jefferson@getCerts.com', '1802 Broadway Apt 204', 'Seattle', 'WA', '98100', '(206)555-1243 ', '2017-01-15');
INSERT INTO public.person VALUES (2, 'Larson', 'Michael', 'michael.larson@getCerts.com', '121 12th ', 'Seattle', 'WA', '98100', '(206)555-1543 ', '2017-01-15');
INSERT INTO public.person VALUES (3, 'Carney', 'Lynn', 'lynn.carney@getCerts.com', '2020 8th Ave', 'Seattle', 'WA', '98100', '(206)555-9012 ', '2017-01-15');
INSERT INTO public.person VALUES (4, 'Masters', 'Lisa', 'lisa.masters@getCerts.com', '985 Michagen Street', 'Seattle', 'WA', '98100', '(206)555-6798 ', '2017-01-15');
INSERT INTO public.person VALUES (5, 'Brown', 'Marianna', 'marianna.brown@getCerts.com', '923 Madison ', 'Seattle', 'WA', '98100', '(206)555-4321 ', '2017-01-20');
INSERT INTO public.person VALUES (6, 'Cernoff', 'David', 'david.cernoff@getCerts.com', 'apt 12 2018 North 24th', 'Seattle', 'WA', '98100', '(206)555-3232 ', '2017-01-20');
INSERT INTO public.person VALUES (7, 'Moon', 'Amy', 'amy.moon@getCerts.com', 'apt 321 South Jackson street', 'Seattle', 'WA', '98100', '(206)555-3123 ', '2017-01-25');
INSERT INTO public.person VALUES (8, 'Smith', 'Tanya', 'ltanya.smith@getCerts.com', '802 Bell', 'Seattle', 'WA', '98100', '(206)555-9829 ', '2017-02-05');
INSERT INTO public.person VALUES (9, 'Kell', 'Bradly', 'bradley.kell@getCerts.com', '101 South Main', 'Seattle', 'WA', '98100', '(206)555-2929 ', '2017-02-08');
INSERT INTO public.person VALUES (10, 'Roberts', 'Carol', 'carol.roberts@getCerts.com', 'Apt 454 1201 Ballard Ave', 'Seattle', 'WA', '98100', '(206)555-5012 ', '2017-02-15');
INSERT INTO public.person VALUES (11, 'Nelson', 'Mark', 'mark.nelson@getCerts.com', '2101 34th Ave', 'Seattle', 'WA', '98100', '(206)555-3328 ', '2017-02-17');
INSERT INTO public.person VALUES (12, 'Hon', 'Sara', 'sara.hon@getCerts.com', '2321 South Admiral Street', 'Seattle', 'WA', '98100', '(206)555-6073 ', '2017-02-21');
INSERT INTO public.person VALUES (401, 'Jones', 'Mandy', 'mandy.jones.brown@getCerts.com', '1010 Elm ', 'Seattle', 'WA', '98100', '(206)555-1256 ', '2018-01-20');
INSERT INTO public.person VALUES (402, 'Sanders', 'Charles', 'charles.sanders.brown@getCerts.com', '3321 Seaside ', 'Seattle', 'WA', '98100', '(206)555-9854 ', '2018-01-20');
INSERT INTO public.person VALUES (403, 'Jonson', 'Martha', 'mjohnson@hotmail.com', '1230 Main Avenue', 'Seattle', 'WA', '98001', '2065554674    ', '2019-01-22');


--
-- TOC entry 3151 (class 0 OID 16777)
-- Dependencies: 219
-- Data for Name: pricehistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pricehistory VALUES (1, '2017-01-01', 200.00, 0.03);
INSERT INTO public.pricehistory VALUES (2, '2018-01-01', 235.00, 0.05);
INSERT INTO public.pricehistory VALUES (3, '2019-01-01', 250.00, 0.05);


--
-- TOC entry 3153 (class 0 OID 16782)
-- Dependencies: 221
-- Data for Name: quarter; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.quarter VALUES (1, 'Fall');
INSERT INTO public.quarter VALUES (2, 'Winter');
INSERT INTO public.quarter VALUES (3, 'Spring');
INSERT INTO public.quarter VALUES (4, 'Summer');


--
-- TOC entry 3155 (class 0 OID 16790)
-- Dependencies: 223
-- Data for Name: roster; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roster VALUES (1097, 71, 9, 1.44);
INSERT INTO public.roster VALUES (1098, 71, 10, 3.97);
INSERT INTO public.roster VALUES (1100, 71, 16, 3.77);
INSERT INTO public.roster VALUES (1104, 71, 37, 1.35);
INSERT INTO public.roster VALUES (1105, 71, 43, 1.41);
INSERT INTO public.roster VALUES (1106, 71, 46, 2.27);
INSERT INTO public.roster VALUES (1114, 71, 78, 3.66);
INSERT INTO public.roster VALUES (1115, 71, 82, 2.42);
INSERT INTO public.roster VALUES (1116, 71, 90, 1.16);
INSERT INTO public.roster VALUES (1119, 71, 134, 2.52);
INSERT INTO public.roster VALUES (1124, 71, 162, 2.50);
INSERT INTO public.roster VALUES (1126, 71, 168, 1.21);
INSERT INTO public.roster VALUES (1128, 71, 177, 1.08);
INSERT INTO public.roster VALUES (1130, 71, 182, 1.81);
INSERT INTO public.roster VALUES (1132, 71, 192, 2.33);
INSERT INTO public.roster VALUES (1135, 72, 7, 1.18);
INSERT INTO public.roster VALUES (1136, 72, 9, 3.65);
INSERT INTO public.roster VALUES (1140, 72, 19, 3.22);
INSERT INTO public.roster VALUES (1141, 72, 24, 2.65);
INSERT INTO public.roster VALUES (1143, 72, 37, 3.52);
INSERT INTO public.roster VALUES (1151, 72, 71, 2.37);
INSERT INTO public.roster VALUES (1152, 72, 77, 3.27);
INSERT INTO public.roster VALUES (1153, 72, 78, 3.01);
INSERT INTO public.roster VALUES (1154, 72, 82, 3.82);
INSERT INTO public.roster VALUES (1155, 72, 90, 1.84);
INSERT INTO public.roster VALUES (1156, 72, 109, 3.94);
INSERT INTO public.roster VALUES (1157, 72, 129, 1.34);
INSERT INTO public.roster VALUES (1158, 72, 134, 3.11);
INSERT INTO public.roster VALUES (1159, 72, 137, 3.55);
INSERT INTO public.roster VALUES (1160, 72, 139, 2.30);
INSERT INTO public.roster VALUES (1162, 72, 158, 2.38);
INSERT INTO public.roster VALUES (1163, 72, 162, 1.38);
INSERT INTO public.roster VALUES (1167, 72, 177, 1.16);
INSERT INTO public.roster VALUES (1169, 72, 182, 3.79);
INSERT INTO public.roster VALUES (1171, 72, 192, 3.22);
INSERT INTO public.roster VALUES (1173, 72, 197, 3.28);
INSERT INTO public.roster VALUES (847, 39, 6, 1.30);
INSERT INTO public.roster VALUES (850, 39, 41, 2.50);
INSERT INTO public.roster VALUES (851, 39, 42, 2.60);
INSERT INTO public.roster VALUES (854, 39, 65, 3.60);
INSERT INTO public.roster VALUES (855, 39, 67, 2.90);
INSERT INTO public.roster VALUES (856, 39, 88, 2.30);
INSERT INTO public.roster VALUES (857, 39, 95, 3.90);
INSERT INTO public.roster VALUES (864, 39, 148, 3.20);
INSERT INTO public.roster VALUES (866, 39, 150, 2.70);
INSERT INTO public.roster VALUES (871, 40, 6, 2.10);
INSERT INTO public.roster VALUES (873, 40, 12, 3.60);
INSERT INTO public.roster VALUES (874, 40, 41, 3.70);
INSERT INTO public.roster VALUES (876, 40, 45, 1.90);
INSERT INTO public.roster VALUES (877, 40, 61, 3.20);
INSERT INTO public.roster VALUES (878, 40, 65, 1.30);
INSERT INTO public.roster VALUES (880, 40, 88, 3.10);
INSERT INTO public.roster VALUES (881, 40, 95, 3.40);
INSERT INTO public.roster VALUES (882, 40, 96, 3.90);
INSERT INTO public.roster VALUES (883, 40, 98, 3.10);
INSERT INTO public.roster VALUES (887, 40, 147, 2.00);
INSERT INTO public.roster VALUES (889, 40, 149, 1.30);
INSERT INTO public.roster VALUES (892, 40, 175, 3.20);
INSERT INTO public.roster VALUES (894, 40, 181, 3.20);
INSERT INTO public.roster VALUES (896, 41, 11, 2.60);
INSERT INTO public.roster VALUES (897, 41, 12, 2.10);
INSERT INTO public.roster VALUES (1628, 97, 162, NULL);
INSERT INTO public.roster VALUES (1629, 97, 192, NULL);
INSERT INTO public.roster VALUES (1630, 97, 7, NULL);
INSERT INTO public.roster VALUES (1631, 97, 13, NULL);
INSERT INTO public.roster VALUES (1632, 97, 19, NULL);
INSERT INTO public.roster VALUES (1633, 97, 24, NULL);
INSERT INTO public.roster VALUES (1634, 97, 29, NULL);
INSERT INTO public.roster VALUES (1635, 97, 47, NULL);
INSERT INTO public.roster VALUES (1636, 97, 53, NULL);
INSERT INTO public.roster VALUES (1637, 97, 58, NULL);
INSERT INTO public.roster VALUES (1638, 97, 64, NULL);
INSERT INTO public.roster VALUES (1639, 97, 68, NULL);
INSERT INTO public.roster VALUES (1640, 97, 71, NULL);
INSERT INTO public.roster VALUES (1641, 97, 77, NULL);
INSERT INTO public.roster VALUES (1642, 97, 109, NULL);
INSERT INTO public.roster VALUES (1643, 97, 129, NULL);
INSERT INTO public.roster VALUES (1644, 97, 137, NULL);
INSERT INTO public.roster VALUES (1645, 97, 139, NULL);
INSERT INTO public.roster VALUES (1646, 97, 153, NULL);
INSERT INTO public.roster VALUES (1647, 97, 158, NULL);
INSERT INTO public.roster VALUES (1648, 97, 164, NULL);
INSERT INTO public.roster VALUES (1649, 97, 174, NULL);
INSERT INTO public.roster VALUES (1650, 97, 178, NULL);
INSERT INTO public.roster VALUES (1651, 97, 185, NULL);
INSERT INTO public.roster VALUES (1652, 97, 194, NULL);
INSERT INTO public.roster VALUES (1653, 97, 197, NULL);
INSERT INTO public.roster VALUES (1654, 98, 41, NULL);
INSERT INTO public.roster VALUES (1655, 98, 42, NULL);
INSERT INTO public.roster VALUES (1656, 98, 12, NULL);
INSERT INTO public.roster VALUES (1657, 98, 103, NULL);
INSERT INTO public.roster VALUES (1658, 98, 149, NULL);
INSERT INTO public.roster VALUES (1659, 98, 175, NULL);
INSERT INTO public.roster VALUES (1660, 98, 179, NULL);
INSERT INTO public.roster VALUES (1661, 98, 65, NULL);
INSERT INTO public.roster VALUES (1662, 98, 67, NULL);
INSERT INTO public.roster VALUES (1663, 98, 88, NULL);
INSERT INTO public.roster VALUES (1664, 98, 148, NULL);
INSERT INTO public.roster VALUES (1665, 98, 150, NULL);
INSERT INTO public.roster VALUES (1666, 98, 61, NULL);
INSERT INTO public.roster VALUES (1667, 98, 96, NULL);
INSERT INTO public.roster VALUES (1668, 98, 123, NULL);
INSERT INTO public.roster VALUES (1669, 98, 141, NULL);
INSERT INTO public.roster VALUES (1670, 98, 147, NULL);
INSERT INTO public.roster VALUES (1671, 98, 181, NULL);
INSERT INTO public.roster VALUES (1672, 99, 41, NULL);
INSERT INTO public.roster VALUES (899, 41, 42, 3.00);
INSERT INTO public.roster VALUES (900, 41, 45, 2.80);
INSERT INTO public.roster VALUES (902, 41, 65, 3.40);
INSERT INTO public.roster VALUES (904, 41, 88, 1.80);
INSERT INTO public.roster VALUES (905, 41, 95, 1.80);
INSERT INTO public.roster VALUES (908, 41, 103, 1.00);
INSERT INTO public.roster VALUES (909, 41, 123, 2.70);
INSERT INTO public.roster VALUES (910, 41, 141, 2.90);
INSERT INTO public.roster VALUES (912, 41, 148, 1.30);
INSERT INTO public.roster VALUES (914, 41, 150, 3.00);
INSERT INTO public.roster VALUES (915, 41, 173, 1.10);
INSERT INTO public.roster VALUES (917, 41, 179, 3.10);
INSERT INTO public.roster VALUES (918, 41, 181, 3.90);
INSERT INTO public.roster VALUES (920, 42, 11, 2.20);
INSERT INTO public.roster VALUES (922, 42, 41, 1.70);
INSERT INTO public.roster VALUES (923, 42, 42, 3.80);
INSERT INTO public.roster VALUES (926, 42, 65, 2.80);
INSERT INTO public.roster VALUES (927, 42, 67, 1.50);
INSERT INTO public.roster VALUES (928, 42, 88, 2.90);
INSERT INTO public.roster VALUES (929, 42, 95, 3.70);
INSERT INTO public.roster VALUES (931, 42, 98, 3.90);
INSERT INTO public.roster VALUES (932, 42, 103, 2.70);
INSERT INTO public.roster VALUES (934, 42, 141, 3.20);
INSERT INTO public.roster VALUES (936, 42, 148, 3.10);
INSERT INTO public.roster VALUES (937, 42, 149, 1.10);
INSERT INTO public.roster VALUES (938, 42, 150, 2.90);
INSERT INTO public.roster VALUES (940, 42, 175, 2.20);
INSERT INTO public.roster VALUES (941, 42, 179, 2.30);
INSERT INTO public.roster VALUES (1175, 73, 9, 3.92);
INSERT INTO public.roster VALUES (1177, 73, 13, 1.81);
INSERT INTO public.roster VALUES (1178, 73, 16, 1.34);
INSERT INTO public.roster VALUES (1179, 73, 19, 2.23);
INSERT INTO public.roster VALUES (1180, 73, 24, 1.83);
INSERT INTO public.roster VALUES (1181, 73, 29, 3.20);
INSERT INTO public.roster VALUES (1182, 73, 37, 1.15);
INSERT INTO public.roster VALUES (1183, 73, 43, 3.52);
INSERT INTO public.roster VALUES (1185, 73, 47, 2.84);
INSERT INTO public.roster VALUES (1189, 73, 68, 1.57);
INSERT INTO public.roster VALUES (1191, 73, 77, 3.22);
INSERT INTO public.roster VALUES (1192, 73, 78, 2.18);
INSERT INTO public.roster VALUES (1194, 73, 90, 3.37);
INSERT INTO public.roster VALUES (1195, 73, 109, 3.65);
INSERT INTO public.roster VALUES (1196, 73, 129, 2.93);
INSERT INTO public.roster VALUES (1198, 73, 137, 1.37);
INSERT INTO public.roster VALUES (1200, 73, 153, 1.55);
INSERT INTO public.roster VALUES (1201, 73, 158, 3.92);
INSERT INTO public.roster VALUES (1203, 73, 164, 3.02);
INSERT INTO public.roster VALUES (1204, 73, 168, 2.83);
INSERT INTO public.roster VALUES (1206, 73, 177, 3.94);
INSERT INTO public.roster VALUES (1207, 73, 178, 2.22);
INSERT INTO public.roster VALUES (1208, 73, 182, 1.96);
INSERT INTO public.roster VALUES (1209, 73, 185, 1.72);
INSERT INTO public.roster VALUES (1210, 73, 192, 1.14);
INSERT INTO public.roster VALUES (1212, 73, 197, 3.22);
INSERT INTO public.roster VALUES (1213, 74, 7, 2.36);
INSERT INTO public.roster VALUES (1214, 74, 9, 2.78);
INSERT INTO public.roster VALUES (1216, 74, 13, 2.54);
INSERT INTO public.roster VALUES (957, 44, 39, 1.70);
INSERT INTO public.roster VALUES (958, 44, 48, 2.30);
INSERT INTO public.roster VALUES (1219, 74, 24, 1.99);
INSERT INTO public.roster VALUES (959, 44, 76, 3.20);
INSERT INTO public.roster VALUES (962, 44, 51, 1.60);
INSERT INTO public.roster VALUES (1221, 74, 37, 3.20);
INSERT INTO public.roster VALUES (1222, 74, 43, 2.63);
INSERT INTO public.roster VALUES (1223, 74, 46, 3.79);
INSERT INTO public.roster VALUES (1224, 74, 47, 3.63);
INSERT INTO public.roster VALUES (1227, 74, 64, 1.45);
INSERT INTO public.roster VALUES (963, 44, 56, 2.20);
INSERT INTO public.roster VALUES (964, 44, 57, 3.90);
INSERT INTO public.roster VALUES (965, 44, 93, 2.90);
INSERT INTO public.roster VALUES (966, 44, 176, 2.00);
INSERT INTO public.roster VALUES (967, 45, 48, 2.30);
INSERT INTO public.roster VALUES (968, 45, 57, 3.00);
INSERT INTO public.roster VALUES (969, 45, 76, 1.20);
INSERT INTO public.roster VALUES (970, 45, 93, 1.50);
INSERT INTO public.roster VALUES (971, 45, 169, 2.80);
INSERT INTO public.roster VALUES (973, 45, 3, 2.60);
INSERT INTO public.roster VALUES (975, 45, 51, 2.40);
INSERT INTO public.roster VALUES (977, 45, 110, 1.20);
INSERT INTO public.roster VALUES (979, 46, 3, 2.60);
INSERT INTO public.roster VALUES (981, 46, 176, 3.50);
INSERT INTO public.roster VALUES (984, 46, 51, 3.10);
INSERT INTO public.roster VALUES (985, 46, 93, 3.10);
INSERT INTO public.roster VALUES (987, 46, 169, 2.20);
INSERT INTO public.roster VALUES (988, 46, 189, 1.90);
INSERT INTO public.roster VALUES (724, 33, 17, 3.30);
INSERT INTO public.roster VALUES (725, 33, 20, 1.60);
INSERT INTO public.roster VALUES (726, 33, 40, 3.90);
INSERT INTO public.roster VALUES (729, 33, 73, 2.50);
INSERT INTO public.roster VALUES (732, 33, 92, 3.90);
INSERT INTO public.roster VALUES (735, 33, 124, 1.70);
INSERT INTO public.roster VALUES (736, 33, 130, 2.90);
INSERT INTO public.roster VALUES (1228, 74, 68, 1.05);
INSERT INTO public.roster VALUES (1229, 74, 71, 1.44);
INSERT INTO public.roster VALUES (1230, 74, 77, 2.06);
INSERT INTO public.roster VALUES (1231, 74, 78, 3.42);
INSERT INTO public.roster VALUES (1235, 74, 129, 2.82);
INSERT INTO public.roster VALUES (1236, 74, 134, 2.19);
INSERT INTO public.roster VALUES (1239, 74, 153, 1.87);
INSERT INTO public.roster VALUES (1240, 74, 158, 3.66);
INSERT INTO public.roster VALUES (1245, 74, 177, 3.00);
INSERT INTO public.roster VALUES (1246, 74, 178, 2.67);
INSERT INTO public.roster VALUES (1247, 74, 182, 2.94);
INSERT INTO public.roster VALUES (1248, 74, 185, 2.86);
INSERT INTO public.roster VALUES (1249, 74, 192, 3.56);
INSERT INTO public.roster VALUES (1184, 73, 46, 4.00);
INSERT INTO public.roster VALUES (1186, 73, 53, 4.00);
INSERT INTO public.roster VALUES (1187, 73, 58, 4.00);
INSERT INTO public.roster VALUES (1188, 73, 64, 4.00);
INSERT INTO public.roster VALUES (1190, 73, 71, 4.00);
INSERT INTO public.roster VALUES (1193, 73, 82, 4.00);
INSERT INTO public.roster VALUES (1197, 73, 134, 4.00);
INSERT INTO public.roster VALUES (1199, 73, 139, 4.00);
INSERT INTO public.roster VALUES (1202, 73, 162, 4.00);
INSERT INTO public.roster VALUES (1205, 73, 174, 4.00);
INSERT INTO public.roster VALUES (1211, 73, 194, 4.00);
INSERT INTO public.roster VALUES (1215, 74, 10, 4.00);
INSERT INTO public.roster VALUES (1217, 74, 16, 4.00);
INSERT INTO public.roster VALUES (1218, 74, 19, 4.00);
INSERT INTO public.roster VALUES (1220, 74, 29, 4.00);
INSERT INTO public.roster VALUES (1225, 74, 53, 4.00);
INSERT INTO public.roster VALUES (1226, 74, 58, 4.00);
INSERT INTO public.roster VALUES (960, 44, 105, 4.00);
INSERT INTO public.roster VALUES (737, 33, 155, 2.30);
INSERT INTO public.roster VALUES (738, 33, 159, 3.10);
INSERT INTO public.roster VALUES (739, 33, 36, 1.30);
INSERT INTO public.roster VALUES (740, 33, 59, 1.00);
INSERT INTO public.roster VALUES (742, 33, 86, 3.70);
INSERT INTO public.roster VALUES (743, 33, 89, 2.60);
INSERT INTO public.roster VALUES (746, 33, 140, 1.40);
INSERT INTO public.roster VALUES (747, 34, 17, 2.60);
INSERT INTO public.roster VALUES (748, 34, 20, 1.40);
INSERT INTO public.roster VALUES (749, 34, 40, 2.30);
INSERT INTO public.roster VALUES (1254, 75, 65, 1.25);
INSERT INTO public.roster VALUES (1255, 75, 67, 1.80);
INSERT INTO public.roster VALUES (1256, 75, 88, 2.68);
INSERT INTO public.roster VALUES (1257, 75, 95, 1.13);
INSERT INTO public.roster VALUES (1258, 75, 148, 3.10);
INSERT INTO public.roster VALUES (1259, 75, 150, 1.39);
INSERT INTO public.roster VALUES (1260, 75, 11, 3.78);
INSERT INTO public.roster VALUES (1262, 75, 45, 2.45);
INSERT INTO public.roster VALUES (1263, 75, 61, 3.91);
INSERT INTO public.roster VALUES (1264, 75, 96, 3.75);
INSERT INTO public.roster VALUES (1266, 75, 103, 1.76);
INSERT INTO public.roster VALUES (1267, 75, 123, 2.45);
INSERT INTO public.roster VALUES (1268, 75, 141, 1.67);
INSERT INTO public.roster VALUES (1269, 75, 147, 2.30);
INSERT INTO public.roster VALUES (1270, 75, 149, 2.07);
INSERT INTO public.roster VALUES (1271, 75, 173, 1.01);
INSERT INTO public.roster VALUES (1272, 75, 175, 3.35);
INSERT INTO public.roster VALUES (1273, 75, 179, 2.55);
INSERT INTO public.roster VALUES (1274, 75, 181, 2.79);
INSERT INTO public.roster VALUES (1275, 77, 41, 3.96);
INSERT INTO public.roster VALUES (1276, 77, 42, 2.54);
INSERT INTO public.roster VALUES (1280, 77, 95, 1.90);
INSERT INTO public.roster VALUES (1283, 77, 11, 1.16);
INSERT INTO public.roster VALUES (1284, 77, 12, 2.58);
INSERT INTO public.roster VALUES (1285, 77, 45, 1.74);
INSERT INTO public.roster VALUES (991, 47, 73, 1.50);
INSERT INTO public.roster VALUES (993, 47, 130, 3.00);
INSERT INTO public.roster VALUES (994, 47, 155, 1.50);
INSERT INTO public.roster VALUES (996, 47, 86, 3.50);
INSERT INTO public.roster VALUES (1288, 77, 98, 1.95);
INSERT INTO public.roster VALUES (1289, 77, 103, 3.70);
INSERT INTO public.roster VALUES (1293, 77, 149, 3.93);
INSERT INTO public.roster VALUES (1294, 77, 173, 1.02);
INSERT INTO public.roster VALUES (1295, 77, 175, 2.22);
INSERT INTO public.roster VALUES (1296, 77, 179, 3.08);
INSERT INTO public.roster VALUES (1298, 78, 11, 3.46);
INSERT INTO public.roster VALUES (1299, 78, 12, 2.10);
INSERT INTO public.roster VALUES (1301, 78, 45, 2.60);
INSERT INTO public.roster VALUES (1304, 78, 141, 2.12);
INSERT INTO public.roster VALUES (1305, 78, 150, 3.83);
INSERT INTO public.roster VALUES (1306, 78, 179, 3.42);
INSERT INTO public.roster VALUES (1307, 78, 181, 2.67);
INSERT INTO public.roster VALUES (1308, 78, 6, 1.12);
INSERT INTO public.roster VALUES (1310, 78, 61, 2.98);
INSERT INTO public.roster VALUES (1311, 78, 67, 1.59);
INSERT INTO public.roster VALUES (1312, 78, 96, 2.32);
INSERT INTO public.roster VALUES (1316, 78, 175, 3.18);
INSERT INTO public.roster VALUES (1317, 79, 11, 2.62);
INSERT INTO public.roster VALUES (1319, 79, 65, 2.52);
INSERT INTO public.roster VALUES (1321, 79, 95, 2.70);
INSERT INTO public.roster VALUES (1322, 79, 98, 1.71);
INSERT INTO public.roster VALUES (1325, 79, 148, 1.89);
INSERT INTO public.roster VALUES (1327, 79, 175, 2.97);
INSERT INTO public.roster VALUES (1331, 79, 45, 1.61);
INSERT INTO public.roster VALUES (1333, 79, 96, 3.25);
INSERT INTO public.roster VALUES (1335, 79, 147, 3.29);
INSERT INTO public.roster VALUES (1337, 80, 11, 2.92);
INSERT INTO public.roster VALUES (1338, 80, 42, 3.97);
INSERT INTO public.roster VALUES (1341, 80, 95, 1.57);
INSERT INTO public.roster VALUES (1342, 80, 98, 1.23);
INSERT INTO public.roster VALUES (1344, 80, 141, 2.95);
INSERT INTO public.roster VALUES (1345, 80, 148, 3.28);
INSERT INTO public.roster VALUES (1346, 80, 150, 1.78);
INSERT INTO public.roster VALUES (1347, 80, 175, 1.73);
INSERT INTO public.roster VALUES (1349, 80, 6, 3.66);
INSERT INTO public.roster VALUES (1352, 80, 61, 2.57);
INSERT INTO public.roster VALUES (1353, 80, 96, 1.05);
INSERT INTO public.roster VALUES (1881, 107, 168, NULL);
INSERT INTO public.roster VALUES (1354, 80, 123, 3.21);
INSERT INTO public.roster VALUES (1882, 107, 174, NULL);
INSERT INTO public.roster VALUES (1355, 80, 147, 1.32);
INSERT INTO public.roster VALUES (1883, 107, 178, NULL);
INSERT INTO public.roster VALUES (1884, 107, 185, NULL);
INSERT INTO public.roster VALUES (1885, 107, 194, NULL);
INSERT INTO public.roster VALUES (1886, 108, 9, NULL);
INSERT INTO public.roster VALUES (1887, 108, 19, NULL);
INSERT INTO public.roster VALUES (1888, 108, 24, NULL);
INSERT INTO public.roster VALUES (1889, 108, 37, NULL);
INSERT INTO public.roster VALUES (1890, 108, 71, NULL);
INSERT INTO public.roster VALUES (1891, 108, 77, NULL);
INSERT INTO public.roster VALUES (1892, 108, 78, NULL);
INSERT INTO public.roster VALUES (1893, 108, 82, NULL);
INSERT INTO public.roster VALUES (1894, 108, 109, NULL);
INSERT INTO public.roster VALUES (1895, 108, 134, NULL);
INSERT INTO public.roster VALUES (1896, 108, 137, NULL);
INSERT INTO public.roster VALUES (1897, 108, 139, NULL);
INSERT INTO public.roster VALUES (1898, 108, 158, NULL);
INSERT INTO public.roster VALUES (1899, 108, 182, NULL);
INSERT INTO public.roster VALUES (1900, 108, 192, NULL);
INSERT INTO public.roster VALUES (1901, 108, 197, NULL);
INSERT INTO public.roster VALUES (1902, 108, 10, NULL);
INSERT INTO public.roster VALUES (1903, 108, 13, NULL);
INSERT INTO public.roster VALUES (1904, 108, 16, NULL);
INSERT INTO public.roster VALUES (1905, 108, 29, NULL);
INSERT INTO public.roster VALUES (1906, 108, 43, NULL);
INSERT INTO public.roster VALUES (1907, 108, 46, NULL);
INSERT INTO public.roster VALUES (1908, 108, 47, NULL);
INSERT INTO public.roster VALUES (1909, 108, 53, NULL);
INSERT INTO public.roster VALUES (1910, 108, 58, NULL);
INSERT INTO public.roster VALUES (1911, 108, 64, NULL);
INSERT INTO public.roster VALUES (1912, 108, 68, NULL);
INSERT INTO public.roster VALUES (1913, 108, 153, NULL);
INSERT INTO public.roster VALUES (1914, 108, 164, NULL);
INSERT INTO public.roster VALUES (1915, 108, 168, NULL);
INSERT INTO public.roster VALUES (1916, 108, 174, NULL);
INSERT INTO public.roster VALUES (1917, 108, 178, NULL);
INSERT INTO public.roster VALUES (1918, 108, 185, NULL);
INSERT INTO public.roster VALUES (1919, 108, 194, NULL);
INSERT INTO public.roster VALUES (1356, 80, 173, 3.07);
INSERT INTO public.roster VALUES (1358, 81, 12, 2.81);
INSERT INTO public.roster VALUES (1359, 81, 41, 3.66);
INSERT INTO public.roster VALUES (1361, 81, 88, 2.35);
INSERT INTO public.roster VALUES (1543, 91, 125, NULL);
INSERT INTO public.roster VALUES (1544, 91, 127, NULL);
INSERT INTO public.roster VALUES (1545, 91, 133, NULL);
INSERT INTO public.roster VALUES (1546, 91, 138, NULL);
INSERT INTO public.roster VALUES (1547, 91, 143, NULL);
INSERT INTO public.roster VALUES (1548, 91, 166, NULL);
INSERT INTO public.roster VALUES (1549, 91, 172, NULL);
INSERT INTO public.roster VALUES (1550, 91, 184, NULL);
INSERT INTO public.roster VALUES (1551, 92, 18, NULL);
INSERT INTO public.roster VALUES (1552, 92, 22, NULL);
INSERT INTO public.roster VALUES (1553, 92, 26, NULL);
INSERT INTO public.roster VALUES (1554, 92, 31, NULL);
INSERT INTO public.roster VALUES (1555, 92, 44, NULL);
INSERT INTO public.roster VALUES (1556, 92, 50, NULL);
INSERT INTO public.roster VALUES (1557, 92, 63, NULL);
INSERT INTO public.roster VALUES (1558, 92, 66, NULL);
INSERT INTO public.roster VALUES (1559, 92, 84, NULL);
INSERT INTO public.roster VALUES (1560, 92, 87, NULL);
INSERT INTO public.roster VALUES (1561, 92, 94, NULL);
INSERT INTO public.roster VALUES (1562, 92, 101, NULL);
INSERT INTO public.roster VALUES (1563, 92, 102, NULL);
INSERT INTO public.roster VALUES (1564, 92, 106, NULL);
INSERT INTO public.roster VALUES (1565, 92, 113, NULL);
INSERT INTO public.roster VALUES (1566, 92, 125, NULL);
INSERT INTO public.roster VALUES (1567, 92, 127, NULL);
INSERT INTO public.roster VALUES (1568, 92, 133, NULL);
INSERT INTO public.roster VALUES (1569, 92, 138, NULL);
INSERT INTO public.roster VALUES (1570, 92, 143, NULL);
INSERT INTO public.roster VALUES (1571, 92, 166, NULL);
INSERT INTO public.roster VALUES (1572, 92, 172, NULL);
INSERT INTO public.roster VALUES (1573, 92, 184, NULL);
INSERT INTO public.roster VALUES (1574, 93, 10, NULL);
INSERT INTO public.roster VALUES (1575, 93, 16, NULL);
INSERT INTO public.roster VALUES (1576, 93, 46, NULL);
INSERT INTO public.roster VALUES (1577, 93, 78, NULL);
INSERT INTO public.roster VALUES (1578, 93, 82, NULL);
INSERT INTO public.roster VALUES (1579, 93, 134, NULL);
INSERT INTO public.roster VALUES (1580, 93, 162, NULL);
INSERT INTO public.roster VALUES (1581, 93, 192, NULL);
INSERT INTO public.roster VALUES (1582, 93, 7, NULL);
INSERT INTO public.roster VALUES (1583, 93, 13, NULL);
INSERT INTO public.roster VALUES (1584, 93, 19, NULL);
INSERT INTO public.roster VALUES (1585, 93, 24, NULL);
INSERT INTO public.roster VALUES (1586, 93, 29, NULL);
INSERT INTO public.roster VALUES (1587, 93, 47, NULL);
INSERT INTO public.roster VALUES (1588, 93, 53, NULL);
INSERT INTO public.roster VALUES (1589, 93, 58, NULL);
INSERT INTO public.roster VALUES (1590, 93, 64, NULL);
INSERT INTO public.roster VALUES (1591, 93, 68, NULL);
INSERT INTO public.roster VALUES (1592, 93, 71, NULL);
INSERT INTO public.roster VALUES (1593, 93, 77, NULL);
INSERT INTO public.roster VALUES (1594, 93, 109, NULL);
INSERT INTO public.roster VALUES (1595, 93, 129, NULL);
INSERT INTO public.roster VALUES (1596, 93, 137, NULL);
INSERT INTO public.roster VALUES (1597, 93, 139, NULL);
INSERT INTO public.roster VALUES (1598, 93, 153, NULL);
INSERT INTO public.roster VALUES (1599, 93, 158, NULL);
INSERT INTO public.roster VALUES (1600, 93, 164, NULL);
INSERT INTO public.roster VALUES (1601, 93, 174, NULL);
INSERT INTO public.roster VALUES (1602, 93, 178, NULL);
INSERT INTO public.roster VALUES (1603, 93, 185, NULL);
INSERT INTO public.roster VALUES (1604, 93, 194, NULL);
INSERT INTO public.roster VALUES (1605, 93, 197, NULL);
INSERT INTO public.roster VALUES (1606, 94, 88, NULL);
INSERT INTO public.roster VALUES (1607, 94, 148, NULL);
INSERT INTO public.roster VALUES (1608, 94, 11, NULL);
INSERT INTO public.roster VALUES (1609, 94, 45, NULL);
INSERT INTO public.roster VALUES (1610, 94, 61, NULL);
INSERT INTO public.roster VALUES (1252, 75, 41, 4.00);
INSERT INTO public.roster VALUES (1611, 94, 96, NULL);
INSERT INTO public.roster VALUES (1612, 94, 123, NULL);
INSERT INTO public.roster VALUES (1613, 94, 147, NULL);
INSERT INTO public.roster VALUES (1614, 94, 149, NULL);
INSERT INTO public.roster VALUES (1615, 94, 175, NULL);
INSERT INTO public.roster VALUES (1616, 94, 179, NULL);
INSERT INTO public.roster VALUES (1617, 94, 181, NULL);
INSERT INTO public.roster VALUES (1618, 94, 41, NULL);
INSERT INTO public.roster VALUES (1619, 94, 42, NULL);
INSERT INTO public.roster VALUES (1620, 94, 12, NULL);
INSERT INTO public.roster VALUES (1621, 94, 98, NULL);
INSERT INTO public.roster VALUES (1622, 97, 10, NULL);
INSERT INTO public.roster VALUES (1623, 97, 16, NULL);
INSERT INTO public.roster VALUES (1624, 97, 46, NULL);
INSERT INTO public.roster VALUES (1625, 97, 78, NULL);
INSERT INTO public.roster VALUES (1626, 97, 82, NULL);
INSERT INTO public.roster VALUES (1627, 97, 134, NULL);
INSERT INTO public.roster VALUES (1673, 99, 42, NULL);
INSERT INTO public.roster VALUES (1674, 99, 12, NULL);
INSERT INTO public.roster VALUES (1675, 99, 103, NULL);
INSERT INTO public.roster VALUES (1676, 99, 149, NULL);
INSERT INTO public.roster VALUES (1677, 99, 175, NULL);
INSERT INTO public.roster VALUES (1678, 99, 179, NULL);
INSERT INTO public.roster VALUES (1679, 99, 65, NULL);
INSERT INTO public.roster VALUES (1680, 99, 67, NULL);
INSERT INTO public.roster VALUES (1681, 99, 88, NULL);
INSERT INTO public.roster VALUES (1682, 99, 148, NULL);
INSERT INTO public.roster VALUES (1683, 99, 150, NULL);
INSERT INTO public.roster VALUES (1684, 99, 61, NULL);
INSERT INTO public.roster VALUES (1685, 99, 96, NULL);
INSERT INTO public.roster VALUES (1686, 99, 123, NULL);
INSERT INTO public.roster VALUES (1687, 99, 141, NULL);
INSERT INTO public.roster VALUES (1688, 99, 147, NULL);
INSERT INTO public.roster VALUES (1689, 99, 181, NULL);
INSERT INTO public.roster VALUES (1690, 100, 41, NULL);
INSERT INTO public.roster VALUES (1691, 100, 42, NULL);
INSERT INTO public.roster VALUES (1692, 100, 12, NULL);
INSERT INTO public.roster VALUES (1693, 100, 103, NULL);
INSERT INTO public.roster VALUES (1694, 100, 149, NULL);
INSERT INTO public.roster VALUES (1695, 100, 175, NULL);
INSERT INTO public.roster VALUES (1696, 100, 179, NULL);
INSERT INTO public.roster VALUES (1697, 100, 65, NULL);
INSERT INTO public.roster VALUES (1698, 100, 67, NULL);
INSERT INTO public.roster VALUES (1699, 100, 88, NULL);
INSERT INTO public.roster VALUES (1700, 100, 148, NULL);
INSERT INTO public.roster VALUES (1701, 100, 150, NULL);
INSERT INTO public.roster VALUES (1702, 100, 61, NULL);
INSERT INTO public.roster VALUES (1703, 100, 96, NULL);
INSERT INTO public.roster VALUES (1704, 100, 123, NULL);
INSERT INTO public.roster VALUES (1705, 100, 141, NULL);
INSERT INTO public.roster VALUES (1706, 100, 147, NULL);
INSERT INTO public.roster VALUES (1707, 100, 181, NULL);
INSERT INTO public.roster VALUES (1708, 101, 9, NULL);
INSERT INTO public.roster VALUES (1709, 101, 19, NULL);
INSERT INTO public.roster VALUES (1710, 101, 29, NULL);
INSERT INTO public.roster VALUES (1711, 101, 43, NULL);
INSERT INTO public.roster VALUES (1712, 101, 47, NULL);
INSERT INTO public.roster VALUES (1713, 101, 77, NULL);
INSERT INTO public.roster VALUES (1714, 101, 78, NULL);
INSERT INTO public.roster VALUES (1715, 101, 90, NULL);
INSERT INTO public.roster VALUES (1716, 101, 109, NULL);
INSERT INTO public.roster VALUES (1717, 101, 129, NULL);
INSERT INTO public.roster VALUES (1718, 101, 158, NULL);
INSERT INTO public.roster VALUES (1719, 101, 164, NULL);
INSERT INTO public.roster VALUES (1720, 101, 168, NULL);
INSERT INTO public.roster VALUES (1721, 101, 177, NULL);
INSERT INTO public.roster VALUES (1722, 101, 178, NULL);
INSERT INTO public.roster VALUES (1723, 101, 197, NULL);
INSERT INTO public.roster VALUES (1724, 101, 46, NULL);
INSERT INTO public.roster VALUES (1725, 101, 53, NULL);
INSERT INTO public.roster VALUES (1726, 101, 58, NULL);
INSERT INTO public.roster VALUES (1727, 101, 64, NULL);
INSERT INTO public.roster VALUES (1728, 101, 71, NULL);
INSERT INTO public.roster VALUES (1729, 101, 82, NULL);
INSERT INTO public.roster VALUES (1730, 101, 134, NULL);
INSERT INTO public.roster VALUES (1731, 101, 139, NULL);
INSERT INTO public.roster VALUES (1362, 81, 95, 1.84);
INSERT INTO public.roster VALUES (1363, 81, 96, 1.88);
INSERT INTO public.roster VALUES (997, 47, 89, 2.20);
INSERT INTO public.roster VALUES (998, 47, 62, 3.70);
INSERT INTO public.roster VALUES (999, 47, 70, 1.10);
INSERT INTO public.roster VALUES (1004, 47, 75, 1.60);
INSERT INTO public.roster VALUES (1005, 47, 128, 2.20);
INSERT INTO public.roster VALUES (1006, 47, 135, 1.40);
INSERT INTO public.roster VALUES (1007, 48, 6, 2.30);
INSERT INTO public.roster VALUES (1009, 48, 12, 2.60);
INSERT INTO public.roster VALUES (1013, 48, 61, 2.80);
INSERT INTO public.roster VALUES (1014, 48, 65, 3.10);
INSERT INTO public.roster VALUES (1015, 48, 67, 3.30);
INSERT INTO public.roster VALUES (1016, 48, 96, 1.30);
INSERT INTO public.roster VALUES (1018, 48, 123, 3.10);
INSERT INTO public.roster VALUES (1019, 48, 141, 1.20);
INSERT INTO public.roster VALUES (1022, 48, 150, 2.10);
INSERT INTO public.roster VALUES (1025, 48, 181, 2.40);
INSERT INTO public.roster VALUES (1026, 49, 6, 1.20);
INSERT INTO public.roster VALUES (1027, 49, 11, 3.30);
INSERT INTO public.roster VALUES (1364, 81, 98, 2.31);
INSERT INTO public.roster VALUES (1365, 81, 141, 3.22);
INSERT INTO public.roster VALUES (1366, 81, 147, 2.78);
INSERT INTO public.roster VALUES (1367, 81, 175, 3.86);
INSERT INTO public.roster VALUES (1368, 81, 181, 1.04);
INSERT INTO public.roster VALUES (1370, 81, 42, 2.44);
INSERT INTO public.roster VALUES (1732, 101, 162, NULL);
INSERT INTO public.roster VALUES (1733, 101, 174, NULL);
INSERT INTO public.roster VALUES (1734, 101, 194, NULL);
INSERT INTO public.roster VALUES (1735, 101, 7, NULL);
INSERT INTO public.roster VALUES (1736, 101, 10, NULL);
INSERT INTO public.roster VALUES (1737, 102, 9, NULL);
INSERT INTO public.roster VALUES (1738, 102, 19, NULL);
INSERT INTO public.roster VALUES (1739, 102, 29, NULL);
INSERT INTO public.roster VALUES (1740, 102, 43, NULL);
INSERT INTO public.roster VALUES (1741, 102, 47, NULL);
INSERT INTO public.roster VALUES (1742, 102, 77, NULL);
INSERT INTO public.roster VALUES (1743, 102, 78, NULL);
INSERT INTO public.roster VALUES (1744, 102, 90, NULL);
INSERT INTO public.roster VALUES (1745, 102, 109, NULL);
INSERT INTO public.roster VALUES (1746, 102, 129, NULL);
INSERT INTO public.roster VALUES (1747, 102, 158, NULL);
INSERT INTO public.roster VALUES (1748, 102, 164, NULL);
INSERT INTO public.roster VALUES (1749, 102, 168, NULL);
INSERT INTO public.roster VALUES (1750, 102, 177, NULL);
INSERT INTO public.roster VALUES (1751, 102, 178, NULL);
INSERT INTO public.roster VALUES (1752, 102, 197, NULL);
INSERT INTO public.roster VALUES (1753, 102, 46, NULL);
INSERT INTO public.roster VALUES (1754, 102, 53, NULL);
INSERT INTO public.roster VALUES (1373, 81, 123, 3.90);
INSERT INTO public.roster VALUES (1378, 82, 130, 1.85);
INSERT INTO public.roster VALUES (1380, 82, 89, 2.04);
INSERT INTO public.roster VALUES (1382, 82, 128, 3.76);
INSERT INTO public.roster VALUES (1383, 82, 17, 1.73);
INSERT INTO public.roster VALUES (1384, 82, 40, 2.59);
INSERT INTO public.roster VALUES (1385, 82, 92, 2.40);
INSERT INTO public.roster VALUES (1387, 82, 163, 1.44);
INSERT INTO public.roster VALUES (1388, 82, 195, 3.99);
INSERT INTO public.roster VALUES (1390, 82, 120, 2.91);
INSERT INTO public.roster VALUES (1393, 83, 89, 2.17);
INSERT INTO public.roster VALUES (1396, 83, 17, 2.73);
INSERT INTO public.roster VALUES (1397, 83, 40, 3.42);
INSERT INTO public.roster VALUES (1400, 83, 163, 1.78);
INSERT INTO public.roster VALUES (1402, 83, 114, 2.80);
INSERT INTO public.roster VALUES (1403, 83, 120, 3.77);
INSERT INTO public.roster VALUES (1404, 84, 41, 3.40);
INSERT INTO public.roster VALUES (1405, 84, 42, 1.48);
INSERT INTO public.roster VALUES (1407, 84, 67, 2.50);
INSERT INTO public.roster VALUES (1408, 84, 88, 1.56);
INSERT INTO public.roster VALUES (1409, 84, 95, 2.09);
INSERT INTO public.roster VALUES (1410, 84, 148, 1.84);
INSERT INTO public.roster VALUES (1411, 84, 150, 1.45);
INSERT INTO public.roster VALUES (1412, 84, 11, 1.13);
INSERT INTO public.roster VALUES (1417, 84, 98, 3.87);
INSERT INTO public.roster VALUES (1421, 84, 147, 1.07);
INSERT INTO public.roster VALUES (1422, 84, 149, 2.97);
INSERT INTO public.roster VALUES (1423, 84, 173, 3.16);
INSERT INTO public.roster VALUES (1426, 84, 181, 1.19);
INSERT INTO public.roster VALUES (1369, 81, 11, 4.00);
INSERT INTO public.roster VALUES (1371, 81, 67, 4.00);
INSERT INTO public.roster VALUES (1372, 81, 103, 4.00);
INSERT INTO public.roster VALUES (1374, 81, 148, 4.00);
INSERT INTO public.roster VALUES (1375, 81, 150, 4.00);
INSERT INTO public.roster VALUES (1376, 81, 173, 4.00);
INSERT INTO public.roster VALUES (1377, 81, 179, 4.00);
INSERT INTO public.roster VALUES (1379, 82, 86, 4.00);
INSERT INTO public.roster VALUES (1381, 82, 62, 4.00);
INSERT INTO public.roster VALUES (1386, 82, 159, 4.00);
INSERT INTO public.roster VALUES (1389, 82, 114, 4.00);
INSERT INTO public.roster VALUES (1391, 83, 130, 4.00);
INSERT INTO public.roster VALUES (1392, 83, 86, 4.00);
INSERT INTO public.roster VALUES (1394, 83, 62, 4.00);
INSERT INTO public.roster VALUES (1395, 83, 128, 4.00);
INSERT INTO public.roster VALUES (1398, 83, 92, 4.00);
INSERT INTO public.roster VALUES (1399, 83, 159, 4.00);
INSERT INTO public.roster VALUES (1755, 102, 58, NULL);
INSERT INTO public.roster VALUES (1401, 83, 195, 4.00);
INSERT INTO public.roster VALUES (1406, 84, 65, 4.00);
INSERT INTO public.roster VALUES (1756, 102, 64, NULL);
INSERT INTO public.roster VALUES (1757, 102, 71, NULL);
INSERT INTO public.roster VALUES (1758, 102, 82, NULL);
INSERT INTO public.roster VALUES (1759, 102, 134, NULL);
INSERT INTO public.roster VALUES (1760, 102, 139, NULL);
INSERT INTO public.roster VALUES (1413, 84, 12, 4.00);
INSERT INTO public.roster VALUES (1414, 84, 45, 4.00);
INSERT INTO public.roster VALUES (1415, 84, 61, 4.00);
INSERT INTO public.roster VALUES (1416, 84, 96, 4.00);
INSERT INTO public.roster VALUES (1418, 84, 103, 4.00);
INSERT INTO public.roster VALUES (1419, 84, 123, 4.00);
INSERT INTO public.roster VALUES (1420, 84, 141, 4.00);
INSERT INTO public.roster VALUES (1761, 102, 162, NULL);
INSERT INTO public.roster VALUES (1762, 102, 174, NULL);
INSERT INTO public.roster VALUES (1763, 102, 194, NULL);
INSERT INTO public.roster VALUES (1764, 102, 7, NULL);
INSERT INTO public.roster VALUES (1765, 102, 10, NULL);
INSERT INTO public.roster VALUES (1766, 103, 9, NULL);
INSERT INTO public.roster VALUES (1767, 103, 19, NULL);
INSERT INTO public.roster VALUES (1768, 103, 29, NULL);
INSERT INTO public.roster VALUES (1769, 103, 43, NULL);
INSERT INTO public.roster VALUES (1770, 103, 47, NULL);
INSERT INTO public.roster VALUES (1771, 103, 77, NULL);
INSERT INTO public.roster VALUES (1772, 103, 78, NULL);
INSERT INTO public.roster VALUES (1773, 103, 90, NULL);
INSERT INTO public.roster VALUES (1774, 103, 109, NULL);
INSERT INTO public.roster VALUES (1775, 103, 129, NULL);
INSERT INTO public.roster VALUES (1776, 103, 158, NULL);
INSERT INTO public.roster VALUES (1777, 103, 164, NULL);
INSERT INTO public.roster VALUES (1778, 103, 168, NULL);
INSERT INTO public.roster VALUES (1779, 103, 177, NULL);
INSERT INTO public.roster VALUES (1780, 103, 178, NULL);
INSERT INTO public.roster VALUES (1781, 103, 197, NULL);
INSERT INTO public.roster VALUES (1782, 103, 46, NULL);
INSERT INTO public.roster VALUES (1424, 84, 175, 4.00);
INSERT INTO public.roster VALUES (1425, 84, 179, 4.00);
INSERT INTO public.roster VALUES (766, 34, 89, 4.00);
INSERT INTO public.roster VALUES (769, 34, 140, 4.00);
INSERT INTO public.roster VALUES (1429, 85, 61, 2.78);
INSERT INTO public.roster VALUES (1783, 103, 53, NULL);
INSERT INTO public.roster VALUES (1431, 85, 67, 3.07);
INSERT INTO public.roster VALUES (1432, 85, 123, 3.65);
INSERT INTO public.roster VALUES (1433, 85, 150, 2.31);
INSERT INTO public.roster VALUES (1435, 85, 11, 3.97);
INSERT INTO public.roster VALUES (1436, 85, 41, 1.43);
INSERT INTO public.roster VALUES (1437, 85, 42, 1.17);
INSERT INTO public.roster VALUES (1438, 85, 45, 3.55);
INSERT INTO public.roster VALUES (1439, 85, 98, 1.07);
INSERT INTO public.roster VALUES (1442, 85, 175, 3.93);
INSERT INTO public.roster VALUES (1444, 86, 3, 1.26);
INSERT INTO public.roster VALUES (1445, 86, 39, 1.79);
INSERT INTO public.roster VALUES (1784, 103, 58, NULL);
INSERT INTO public.roster VALUES (1785, 103, 64, NULL);
INSERT INTO public.roster VALUES (1786, 103, 71, NULL);
INSERT INTO public.roster VALUES (1446, 86, 48, 2.00);
INSERT INTO public.roster VALUES (1447, 86, 189, 2.70);
INSERT INTO public.roster VALUES (1450, 86, 93, 1.58);
INSERT INTO public.roster VALUES (1451, 86, 105, 3.40);
INSERT INTO public.roster VALUES (1453, 87, 97, 1.30);
INSERT INTO public.roster VALUES (1455, 87, 40, 2.26);
INSERT INTO public.roster VALUES (1456, 87, 73, 1.78);
INSERT INTO public.roster VALUES (1459, 87, 195, 2.35);
INSERT INTO public.roster VALUES (1461, 87, 144, 2.14);
INSERT INTO public.roster VALUES (1462, 87, 186, 2.88);
INSERT INTO public.roster VALUES (1463, 87, 130, 3.49);
INSERT INTO public.roster VALUES (1464, 87, 155, 3.91);
INSERT INTO public.roster VALUES (1469, 88, 130, 2.22);
INSERT INTO public.roster VALUES (1471, 88, 89, 2.97);
INSERT INTO public.roster VALUES (1472, 88, 62, 2.63);
INSERT INTO public.roster VALUES (1474, 88, 17, 1.20);
INSERT INTO public.roster VALUES (1475, 88, 40, 2.53);
INSERT INTO public.roster VALUES (1787, 103, 82, NULL);
INSERT INTO public.roster VALUES (1788, 103, 134, NULL);
INSERT INTO public.roster VALUES (1789, 103, 139, NULL);
INSERT INTO public.roster VALUES (1790, 103, 162, NULL);
INSERT INTO public.roster VALUES (1791, 103, 174, NULL);
INSERT INTO public.roster VALUES (1792, 103, 194, NULL);
INSERT INTO public.roster VALUES (1793, 103, 7, NULL);
INSERT INTO public.roster VALUES (1794, 103, 10, NULL);
INSERT INTO public.roster VALUES (1795, 104, 9, NULL);
INSERT INTO public.roster VALUES (1796, 104, 19, NULL);
INSERT INTO public.roster VALUES (1797, 104, 29, NULL);
INSERT INTO public.roster VALUES (1798, 104, 43, NULL);
INSERT INTO public.roster VALUES (1799, 104, 47, NULL);
INSERT INTO public.roster VALUES (1800, 104, 77, NULL);
INSERT INTO public.roster VALUES (1801, 104, 78, NULL);
INSERT INTO public.roster VALUES (1802, 104, 90, NULL);
INSERT INTO public.roster VALUES (1803, 104, 109, NULL);
INSERT INTO public.roster VALUES (1804, 104, 129, NULL);
INSERT INTO public.roster VALUES (1805, 104, 158, NULL);
INSERT INTO public.roster VALUES (1806, 104, 164, NULL);
INSERT INTO public.roster VALUES (1807, 104, 168, NULL);
INSERT INTO public.roster VALUES (1808, 104, 177, NULL);
INSERT INTO public.roster VALUES (1809, 104, 178, NULL);
INSERT INTO public.roster VALUES (1810, 104, 197, NULL);
INSERT INTO public.roster VALUES (1811, 104, 46, NULL);
INSERT INTO public.roster VALUES (1812, 104, 53, NULL);
INSERT INTO public.roster VALUES (1813, 104, 58, NULL);
INSERT INTO public.roster VALUES (1814, 104, 64, NULL);
INSERT INTO public.roster VALUES (1815, 104, 71, NULL);
INSERT INTO public.roster VALUES (1816, 104, 82, NULL);
INSERT INTO public.roster VALUES (1817, 104, 134, NULL);
INSERT INTO public.roster VALUES (1818, 104, 139, NULL);
INSERT INTO public.roster VALUES (1819, 104, 162, NULL);
INSERT INTO public.roster VALUES (1820, 104, 174, NULL);
INSERT INTO public.roster VALUES (1821, 104, 194, NULL);
INSERT INTO public.roster VALUES (1822, 104, 7, NULL);
INSERT INTO public.roster VALUES (1823, 104, 10, NULL);
INSERT INTO public.roster VALUES (1824, 105, 61, NULL);
INSERT INTO public.roster VALUES (1825, 105, 67, NULL);
INSERT INTO public.roster VALUES (1826, 105, 123, NULL);
INSERT INTO public.roster VALUES (1827, 105, 150, NULL);
INSERT INTO public.roster VALUES (1828, 105, 11, NULL);
INSERT INTO public.roster VALUES (1478, 88, 163, 1.92);
INSERT INTO public.roster VALUES (1480, 88, 114, 1.39);
INSERT INTO public.roster VALUES (1096, 71, 7, 4.00);
INSERT INTO public.roster VALUES (1099, 71, 13, 4.00);
INSERT INTO public.roster VALUES (1101, 71, 19, 4.00);
INSERT INTO public.roster VALUES (1102, 71, 24, 4.00);
INSERT INTO public.roster VALUES (1103, 71, 29, 4.00);
INSERT INTO public.roster VALUES (1107, 71, 47, 4.00);
INSERT INTO public.roster VALUES (1108, 71, 53, 4.00);
INSERT INTO public.roster VALUES (1109, 71, 58, 4.00);
INSERT INTO public.roster VALUES (1110, 71, 64, 4.00);
INSERT INTO public.roster VALUES (1111, 71, 68, 4.00);
INSERT INTO public.roster VALUES (1112, 71, 71, 4.00);
INSERT INTO public.roster VALUES (1113, 71, 77, 4.00);
INSERT INTO public.roster VALUES (1117, 71, 109, 4.00);
INSERT INTO public.roster VALUES (1829, 105, 45, NULL);
INSERT INTO public.roster VALUES (1830, 105, 175, NULL);
INSERT INTO public.roster VALUES (1831, 105, 6, NULL);
INSERT INTO public.roster VALUES (1832, 105, 12, NULL);
INSERT INTO public.roster VALUES (1833, 105, 65, NULL);
INSERT INTO public.roster VALUES (1834, 105, 181, NULL);
INSERT INTO public.roster VALUES (1835, 105, 147, NULL);
INSERT INTO public.roster VALUES (1836, 105, 149, NULL);
INSERT INTO public.roster VALUES (1837, 105, 179, NULL);
INSERT INTO public.roster VALUES (1838, 106, 61, NULL);
INSERT INTO public.roster VALUES (1839, 106, 67, NULL);
INSERT INTO public.roster VALUES (1840, 106, 123, NULL);
INSERT INTO public.roster VALUES (1841, 106, 150, NULL);
INSERT INTO public.roster VALUES (1842, 106, 11, NULL);
INSERT INTO public.roster VALUES (1843, 106, 45, NULL);
INSERT INTO public.roster VALUES (1844, 106, 175, NULL);
INSERT INTO public.roster VALUES (1845, 106, 6, NULL);
INSERT INTO public.roster VALUES (1846, 106, 12, NULL);
INSERT INTO public.roster VALUES (1847, 106, 65, NULL);
INSERT INTO public.roster VALUES (1848, 106, 181, NULL);
INSERT INTO public.roster VALUES (1849, 106, 147, NULL);
INSERT INTO public.roster VALUES (1850, 106, 149, NULL);
INSERT INTO public.roster VALUES (1851, 106, 179, NULL);
INSERT INTO public.roster VALUES (1852, 107, 9, NULL);
INSERT INTO public.roster VALUES (1853, 107, 19, NULL);
INSERT INTO public.roster VALUES (1854, 107, 24, NULL);
INSERT INTO public.roster VALUES (1855, 107, 37, NULL);
INSERT INTO public.roster VALUES (1856, 107, 71, NULL);
INSERT INTO public.roster VALUES (1857, 107, 77, NULL);
INSERT INTO public.roster VALUES (1858, 107, 78, NULL);
INSERT INTO public.roster VALUES (1859, 107, 82, NULL);
INSERT INTO public.roster VALUES (1860, 107, 109, NULL);
INSERT INTO public.roster VALUES (1861, 107, 134, NULL);
INSERT INTO public.roster VALUES (1862, 107, 137, NULL);
INSERT INTO public.roster VALUES (1863, 107, 139, NULL);
INSERT INTO public.roster VALUES (1864, 107, 158, NULL);
INSERT INTO public.roster VALUES (1865, 107, 182, NULL);
INSERT INTO public.roster VALUES (1118, 71, 129, 4.00);
INSERT INTO public.roster VALUES (1120, 71, 137, 4.00);
INSERT INTO public.roster VALUES (1121, 71, 139, 4.00);
INSERT INTO public.roster VALUES (1122, 71, 153, 4.00);
INSERT INTO public.roster VALUES (1123, 71, 158, 4.00);
INSERT INTO public.roster VALUES (1125, 71, 164, 4.00);
INSERT INTO public.roster VALUES (1127, 71, 174, 4.00);
INSERT INTO public.roster VALUES (1129, 71, 178, 4.00);
INSERT INTO public.roster VALUES (1131, 71, 185, 4.00);
INSERT INTO public.roster VALUES (1133, 71, 194, 4.00);
INSERT INTO public.roster VALUES (1134, 71, 197, 4.00);
INSERT INTO public.roster VALUES (1137, 72, 10, 4.00);
INSERT INTO public.roster VALUES (1138, 72, 13, 4.00);
INSERT INTO public.roster VALUES (1139, 72, 16, 4.00);
INSERT INTO public.roster VALUES (1142, 72, 29, 4.00);
INSERT INTO public.roster VALUES (1144, 72, 43, 4.00);
INSERT INTO public.roster VALUES (1145, 72, 46, 4.00);
INSERT INTO public.roster VALUES (1146, 72, 47, 4.00);
INSERT INTO public.roster VALUES (1866, 107, 192, NULL);
INSERT INTO public.roster VALUES (1867, 107, 197, NULL);
INSERT INTO public.roster VALUES (1868, 107, 10, NULL);
INSERT INTO public.roster VALUES (1869, 107, 13, NULL);
INSERT INTO public.roster VALUES (1870, 107, 16, NULL);
INSERT INTO public.roster VALUES (1871, 107, 29, NULL);
INSERT INTO public.roster VALUES (1872, 107, 43, NULL);
INSERT INTO public.roster VALUES (1873, 107, 46, NULL);
INSERT INTO public.roster VALUES (1874, 107, 47, NULL);
INSERT INTO public.roster VALUES (1875, 107, 53, NULL);
INSERT INTO public.roster VALUES (1876, 107, 58, NULL);
INSERT INTO public.roster VALUES (1877, 107, 64, NULL);
INSERT INTO public.roster VALUES (1878, 107, 68, NULL);
INSERT INTO public.roster VALUES (1879, 107, 153, NULL);
INSERT INTO public.roster VALUES (1880, 107, 164, NULL);
INSERT INTO public.roster VALUES (1920, 112, 89, NULL);
INSERT INTO public.roster VALUES (1147, 72, 53, 4.00);
INSERT INTO public.roster VALUES (1148, 72, 58, 4.00);
INSERT INTO public.roster VALUES (1149, 72, 64, 4.00);
INSERT INTO public.roster VALUES (1150, 72, 68, 4.00);
INSERT INTO public.roster VALUES (1161, 72, 153, 4.00);
INSERT INTO public.roster VALUES (1164, 72, 164, 4.00);
INSERT INTO public.roster VALUES (1165, 72, 168, 4.00);
INSERT INTO public.roster VALUES (1921, 112, 128, NULL);
INSERT INTO public.roster VALUES (1922, 112, 40, NULL);
INSERT INTO public.roster VALUES (1923, 112, 92, NULL);
INSERT INTO public.roster VALUES (1924, 112, 195, NULL);
INSERT INTO public.roster VALUES (1925, 112, 120, NULL);
INSERT INTO public.roster VALUES (1926, 112, 86, NULL);
INSERT INTO public.roster VALUES (1927, 112, 62, NULL);
INSERT INTO public.roster VALUES (1928, 112, 159, NULL);
INSERT INTO public.roster VALUES (1929, 112, 114, NULL);
INSERT INTO public.roster VALUES (1930, 114, 89, NULL);
INSERT INTO public.roster VALUES (1931, 114, 17, NULL);
INSERT INTO public.roster VALUES (1932, 114, 40, NULL);
INSERT INTO public.roster VALUES (1933, 114, 114, NULL);
INSERT INTO public.roster VALUES (1934, 114, 120, NULL);
INSERT INTO public.roster VALUES (1935, 114, 130, NULL);
INSERT INTO public.roster VALUES (1936, 114, 86, NULL);
INSERT INTO public.roster VALUES (1937, 114, 62, NULL);
INSERT INTO public.roster VALUES (1938, 114, 128, NULL);
INSERT INTO public.roster VALUES (1939, 114, 92, NULL);
INSERT INTO public.roster VALUES (1940, 114, 159, NULL);
INSERT INTO public.roster VALUES (1941, 114, 195, NULL);
INSERT INTO public.roster VALUES (1942, 115, 130, NULL);
INSERT INTO public.roster VALUES (1943, 115, 89, NULL);
INSERT INTO public.roster VALUES (1944, 115, 62, NULL);
INSERT INTO public.roster VALUES (1945, 115, 40, NULL);
INSERT INTO public.roster VALUES (1946, 115, 86, NULL);
INSERT INTO public.roster VALUES (1947, 115, 128, NULL);
INSERT INTO public.roster VALUES (1948, 115, 92, NULL);
INSERT INTO public.roster VALUES (1949, 115, 159, NULL);
INSERT INTO public.roster VALUES (1950, 115, 195, NULL);
INSERT INTO public.roster VALUES (1951, 115, 120, NULL);
INSERT INTO public.roster VALUES (1952, 109, 12, NULL);
INSERT INTO public.roster VALUES (1953, 109, 41, NULL);
INSERT INTO public.roster VALUES (1954, 109, 88, NULL);
INSERT INTO public.roster VALUES (1955, 109, 95, NULL);
INSERT INTO public.roster VALUES (1166, 72, 174, 4.00);
INSERT INTO public.roster VALUES (1168, 72, 178, 4.00);
INSERT INTO public.roster VALUES (1170, 72, 185, 4.00);
INSERT INTO public.roster VALUES (1172, 72, 194, 4.00);
INSERT INTO public.roster VALUES (1174, 73, 7, 4.00);
INSERT INTO public.roster VALUES (886, 40, 141, 4.00);
INSERT INTO public.roster VALUES (1176, 73, 10, 4.00);
INSERT INTO public.roster VALUES (961, 44, 169, 4.00);
INSERT INTO public.roster VALUES (972, 45, 189, 4.00);
INSERT INTO public.roster VALUES (974, 45, 39, 4.00);
INSERT INTO public.roster VALUES (976, 45, 105, 4.00);
INSERT INTO public.roster VALUES (978, 45, 176, 4.00);
INSERT INTO public.roster VALUES (980, 46, 76, 4.00);
INSERT INTO public.roster VALUES (982, 46, 39, 4.00);
INSERT INTO public.roster VALUES (983, 46, 48, 4.00);
INSERT INTO public.roster VALUES (986, 46, 105, 4.00);
INSERT INTO public.roster VALUES (1232, 74, 82, 4.00);
INSERT INTO public.roster VALUES (1233, 74, 90, 4.00);
INSERT INTO public.roster VALUES (1234, 74, 109, 4.00);
INSERT INTO public.roster VALUES (1237, 74, 137, 4.00);
INSERT INTO public.roster VALUES (1238, 74, 139, 4.00);
INSERT INTO public.roster VALUES (1241, 74, 162, 4.00);
INSERT INTO public.roster VALUES (1242, 74, 164, 4.00);
INSERT INTO public.roster VALUES (1243, 74, 168, 4.00);
INSERT INTO public.roster VALUES (1244, 74, 174, 4.00);
INSERT INTO public.roster VALUES (1250, 74, 194, 4.00);
INSERT INTO public.roster VALUES (1251, 74, 197, 4.00);
INSERT INTO public.roster VALUES (409, 18, 167, 1.40);
INSERT INTO public.roster VALUES (461, 20, 167, 1.90);
INSERT INTO public.roster VALUES (561, 27, 167, 1.40);
INSERT INTO public.roster VALUES (128, 5, 167, 3.30);
INSERT INTO public.roster VALUES (194, 7, 167, 1.20);
INSERT INTO public.roster VALUES (161, 6, 167, 2.00);
INSERT INTO public.roster VALUES (440, 19, 180, 3.10);
INSERT INTO public.roster VALUES (562, 27, 180, 2.70);
INSERT INTO public.roster VALUES (130, 5, 180, 3.70);
INSERT INTO public.roster VALUES (163, 6, 180, 3.70);
INSERT INTO public.roster VALUES (1253, 75, 42, 4.00);
INSERT INTO public.roster VALUES (1261, 75, 12, 4.00);
INSERT INTO public.roster VALUES (1265, 75, 98, 4.00);
INSERT INTO public.roster VALUES (1277, 77, 65, 4.00);
INSERT INTO public.roster VALUES (1278, 77, 67, 4.00);
INSERT INTO public.roster VALUES (1279, 77, 88, 4.00);
INSERT INTO public.roster VALUES (1281, 77, 148, 4.00);
INSERT INTO public.roster VALUES (1282, 77, 150, 4.00);
INSERT INTO public.roster VALUES (1286, 77, 61, 4.00);
INSERT INTO public.roster VALUES (1287, 77, 96, 4.00);
INSERT INTO public.roster VALUES (1290, 77, 123, 4.00);
INSERT INTO public.roster VALUES (1291, 77, 141, 4.00);
INSERT INTO public.roster VALUES (1292, 77, 147, 4.00);
INSERT INTO public.roster VALUES (1297, 77, 181, 4.00);
INSERT INTO public.roster VALUES (1300, 78, 42, 4.00);
INSERT INTO public.roster VALUES (1302, 78, 65, 4.00);
INSERT INTO public.roster VALUES (1303, 78, 123, 4.00);
INSERT INTO public.roster VALUES (1309, 78, 41, 4.00);
INSERT INTO public.roster VALUES (1313, 78, 98, 4.00);
INSERT INTO public.roster VALUES (1314, 78, 147, 4.00);
INSERT INTO public.roster VALUES (1315, 78, 149, 4.00);
INSERT INTO public.roster VALUES (1318, 79, 42, 4.00);
INSERT INTO public.roster VALUES (1320, 79, 88, 4.00);
INSERT INTO public.roster VALUES (1323, 79, 103, 4.00);
INSERT INTO public.roster VALUES (1324, 79, 141, 4.00);
INSERT INTO public.roster VALUES (1326, 79, 150, 4.00);
INSERT INTO public.roster VALUES (1328, 79, 179, 4.00);
INSERT INTO public.roster VALUES (1329, 79, 6, 4.00);
INSERT INTO public.roster VALUES (1330, 79, 12, 4.00);
INSERT INTO public.roster VALUES (1332, 79, 61, 4.00);
INSERT INTO public.roster VALUES (1334, 79, 123, 4.00);
INSERT INTO public.roster VALUES (1336, 79, 173, 4.00);
INSERT INTO public.roster VALUES (1339, 80, 65, 4.00);
INSERT INTO public.roster VALUES (1340, 80, 88, 4.00);
INSERT INTO public.roster VALUES (1343, 80, 103, 4.00);
INSERT INTO public.roster VALUES (1348, 80, 179, 4.00);
INSERT INTO public.roster VALUES (1350, 80, 12, 4.00);
INSERT INTO public.roster VALUES (1351, 80, 45, 4.00);
INSERT INTO public.roster VALUES (1357, 81, 6, 4.00);
INSERT INTO public.roster VALUES (1360, 81, 61, 4.00);
INSERT INTO public.roster VALUES (1427, 85, 6, 4.00);
INSERT INTO public.roster VALUES (1428, 85, 12, 4.00);
INSERT INTO public.roster VALUES (1430, 85, 65, 4.00);
INSERT INTO public.roster VALUES (1434, 85, 181, 4.00);
INSERT INTO public.roster VALUES (1440, 85, 147, 4.00);
INSERT INTO public.roster VALUES (1441, 85, 149, 4.00);
INSERT INTO public.roster VALUES (1443, 85, 179, 4.00);
INSERT INTO public.roster VALUES (1448, 86, 176, 4.00);
INSERT INTO public.roster VALUES (1449, 86, 51, 4.00);
INSERT INTO public.roster VALUES (1956, 109, 96, NULL);
INSERT INTO public.roster VALUES (1957, 109, 98, NULL);
INSERT INTO public.roster VALUES (1958, 109, 141, NULL);
INSERT INTO public.roster VALUES (1959, 109, 147, NULL);
INSERT INTO public.roster VALUES (1452, 86, 169, 4.00);
INSERT INTO public.roster VALUES (1960, 109, 175, NULL);
INSERT INTO public.roster VALUES (1961, 109, 181, NULL);
INSERT INTO public.roster VALUES (1962, 109, 42, NULL);
INSERT INTO public.roster VALUES (1963, 109, 123, NULL);
INSERT INTO public.roster VALUES (1964, 109, 11, NULL);
INSERT INTO public.roster VALUES (1965, 109, 67, NULL);
INSERT INTO public.roster VALUES (1966, 109, 103, NULL);
INSERT INTO public.roster VALUES (1967, 109, 148, NULL);
INSERT INTO public.roster VALUES (1968, 109, 150, NULL);
INSERT INTO public.roster VALUES (1969, 109, 173, NULL);
INSERT INTO public.roster VALUES (1970, 109, 179, NULL);
INSERT INTO public.roster VALUES (1971, 109, 48, NULL);
INSERT INTO public.roster VALUES (1972, 109, 189, NULL);
INSERT INTO public.roster VALUES (1973, 109, 105, NULL);
INSERT INTO public.roster VALUES (1974, 109, 6, NULL);
INSERT INTO public.roster VALUES (1975, 109, 61, NULL);
INSERT INTO public.roster VALUES (1976, 109, 176, NULL);
INSERT INTO public.roster VALUES (1977, 109, 51, NULL);
INSERT INTO public.roster VALUES (1978, 109, 169, NULL);
INSERT INTO public.roster VALUES (1979, 110, 12, NULL);
INSERT INTO public.roster VALUES (1980, 110, 41, NULL);
INSERT INTO public.roster VALUES (1981, 110, 88, NULL);
INSERT INTO public.roster VALUES (1982, 110, 95, NULL);
INSERT INTO public.roster VALUES (1983, 110, 96, NULL);
INSERT INTO public.roster VALUES (1984, 110, 98, NULL);
INSERT INTO public.roster VALUES (1985, 110, 141, NULL);
INSERT INTO public.roster VALUES (1986, 110, 147, NULL);
INSERT INTO public.roster VALUES (1987, 110, 175, NULL);
INSERT INTO public.roster VALUES (1988, 110, 181, NULL);
INSERT INTO public.roster VALUES (1989, 110, 42, NULL);
INSERT INTO public.roster VALUES (1990, 110, 123, NULL);
INSERT INTO public.roster VALUES (1991, 110, 11, NULL);
INSERT INTO public.roster VALUES (1992, 110, 67, NULL);
INSERT INTO public.roster VALUES (1993, 110, 103, NULL);
INSERT INTO public.roster VALUES (1994, 110, 148, NULL);
INSERT INTO public.roster VALUES (1995, 110, 150, NULL);
INSERT INTO public.roster VALUES (1996, 110, 173, NULL);
INSERT INTO public.roster VALUES (1997, 110, 179, NULL);
INSERT INTO public.roster VALUES (1998, 110, 48, NULL);
INSERT INTO public.roster VALUES (1999, 110, 189, NULL);
INSERT INTO public.roster VALUES (2000, 110, 105, NULL);
INSERT INTO public.roster VALUES (2001, 110, 6, NULL);
INSERT INTO public.roster VALUES (2002, 110, 61, NULL);
INSERT INTO public.roster VALUES (2003, 110, 176, NULL);
INSERT INTO public.roster VALUES (2004, 110, 51, NULL);
INSERT INTO public.roster VALUES (2005, 110, 169, NULL);
INSERT INTO public.roster VALUES (1482, 89, 18, NULL);
INSERT INTO public.roster VALUES (1483, 89, 22, NULL);
INSERT INTO public.roster VALUES (1484, 89, 26, NULL);
INSERT INTO public.roster VALUES (1485, 89, 31, NULL);
INSERT INTO public.roster VALUES (1486, 89, 44, NULL);
INSERT INTO public.roster VALUES (1487, 89, 50, NULL);
INSERT INTO public.roster VALUES (1488, 89, 63, NULL);
INSERT INTO public.roster VALUES (1489, 89, 66, NULL);
INSERT INTO public.roster VALUES (1490, 89, 84, NULL);
INSERT INTO public.roster VALUES (1491, 89, 87, NULL);
INSERT INTO public.roster VALUES (1492, 89, 94, NULL);
INSERT INTO public.roster VALUES (1493, 89, 101, NULL);
INSERT INTO public.roster VALUES (1494, 89, 102, NULL);
INSERT INTO public.roster VALUES (1495, 89, 106, NULL);
INSERT INTO public.roster VALUES (1496, 89, 113, NULL);
INSERT INTO public.roster VALUES (1497, 89, 125, NULL);
INSERT INTO public.roster VALUES (1498, 89, 127, NULL);
INSERT INTO public.roster VALUES (1499, 89, 133, NULL);
INSERT INTO public.roster VALUES (1500, 89, 138, NULL);
INSERT INTO public.roster VALUES (1501, 89, 143, NULL);
INSERT INTO public.roster VALUES (1502, 89, 166, NULL);
INSERT INTO public.roster VALUES (1503, 89, 172, NULL);
INSERT INTO public.roster VALUES (1504, 89, 184, NULL);
INSERT INTO public.roster VALUES (1505, 90, 18, NULL);
INSERT INTO public.roster VALUES (1506, 90, 22, NULL);
INSERT INTO public.roster VALUES (1507, 90, 26, NULL);
INSERT INTO public.roster VALUES (1508, 90, 31, NULL);
INSERT INTO public.roster VALUES (1509, 90, 44, NULL);
INSERT INTO public.roster VALUES (1510, 90, 50, NULL);
INSERT INTO public.roster VALUES (1511, 90, 63, NULL);
INSERT INTO public.roster VALUES (1512, 90, 66, NULL);
INSERT INTO public.roster VALUES (1513, 90, 84, NULL);
INSERT INTO public.roster VALUES (1514, 90, 87, NULL);
INSERT INTO public.roster VALUES (1515, 90, 94, NULL);
INSERT INTO public.roster VALUES (1516, 90, 101, NULL);
INSERT INTO public.roster VALUES (1517, 90, 102, NULL);
INSERT INTO public.roster VALUES (1518, 90, 106, NULL);
INSERT INTO public.roster VALUES (1519, 90, 113, NULL);
INSERT INTO public.roster VALUES (1520, 90, 125, NULL);
INSERT INTO public.roster VALUES (1521, 90, 127, NULL);
INSERT INTO public.roster VALUES (1522, 90, 133, NULL);
INSERT INTO public.roster VALUES (1523, 90, 138, NULL);
INSERT INTO public.roster VALUES (1524, 90, 143, NULL);
INSERT INTO public.roster VALUES (1525, 90, 166, NULL);
INSERT INTO public.roster VALUES (1526, 90, 172, NULL);
INSERT INTO public.roster VALUES (1527, 90, 184, NULL);
INSERT INTO public.roster VALUES (1528, 91, 18, NULL);
INSERT INTO public.roster VALUES (1529, 91, 22, NULL);
INSERT INTO public.roster VALUES (1530, 91, 26, NULL);
INSERT INTO public.roster VALUES (1531, 91, 31, NULL);
INSERT INTO public.roster VALUES (1532, 91, 44, NULL);
INSERT INTO public.roster VALUES (1533, 91, 50, NULL);
INSERT INTO public.roster VALUES (1534, 91, 63, NULL);
INSERT INTO public.roster VALUES (1535, 91, 66, NULL);
INSERT INTO public.roster VALUES (1536, 91, 84, NULL);
INSERT INTO public.roster VALUES (1537, 91, 87, NULL);
INSERT INTO public.roster VALUES (1538, 91, 94, NULL);
INSERT INTO public.roster VALUES (1539, 91, 101, NULL);
INSERT INTO public.roster VALUES (1540, 91, 102, NULL);
INSERT INTO public.roster VALUES (1541, 91, 106, NULL);
INSERT INTO public.roster VALUES (1542, 91, 113, NULL);
INSERT INTO public.roster VALUES (1454, 87, 17, 4.00);
INSERT INTO public.roster VALUES (1457, 87, 159, 4.00);
INSERT INTO public.roster VALUES (1458, 87, 163, 4.00);
INSERT INTO public.roster VALUES (1460, 87, 120, 4.00);
INSERT INTO public.roster VALUES (1465, 87, 89, 4.00);
INSERT INTO public.roster VALUES (1466, 87, 70, 4.00);
INSERT INTO public.roster VALUES (1467, 87, 114, 4.00);
INSERT INTO public.roster VALUES (1468, 87, 128, 4.00);
INSERT INTO public.roster VALUES (1470, 88, 86, 4.00);
INSERT INTO public.roster VALUES (1473, 88, 128, 4.00);
INSERT INTO public.roster VALUES (1476, 88, 92, 4.00);
INSERT INTO public.roster VALUES (1477, 88, 159, 4.00);
INSERT INTO public.roster VALUES (1479, 88, 195, 4.00);
INSERT INTO public.roster VALUES (1481, 88, 120, 4.00);
INSERT INTO public.roster VALUES (187, 7, 122, 4.00);
INSERT INTO public.roster VALUES (401, 18, 122, 4.00);
INSERT INTO public.roster VALUES (430, 19, 122, 4.00);
INSERT INTO public.roster VALUES (447, 20, 122, 4.00);
INSERT INTO public.roster VALUES (547, 27, 126, 4.00);
INSERT INTO public.roster VALUES (426, 19, 131, 4.00);
INSERT INTO public.roster VALUES (450, 20, 23, 4.00);
INSERT INTO public.roster VALUES (171, 7, 30, 4.00);
INSERT INTO public.roster VALUES (392, 18, 33, 4.00);
INSERT INTO public.roster VALUES (452, 20, 33, 4.00);
INSERT INTO public.roster VALUES (173, 7, 33, 4.00);
INSERT INTO public.roster VALUES (141, 6, 38, 4.00);
INSERT INTO public.roster VALUES (174, 7, 38, 4.00);
INSERT INTO public.roster VALUES (209, 8, 69, 4.00);
INSERT INTO public.roster VALUES (393, 18, 69, 4.00);
INSERT INTO public.roster VALUES (771, 35, 20, 4.00);
INSERT INTO public.roster VALUES (696, 28, 100, 4.00);
INSERT INTO public.roster VALUES (699, 28, 132, 4.00);
INSERT INTO public.roster VALUES (700, 28, 117, 4.00);
INSERT INTO public.roster VALUES (942, 42, 181, 1.40);
INSERT INTO public.roster VALUES (943, 43, 3, 1.30);
INSERT INTO public.roster VALUES (944, 43, 15, 2.80);
INSERT INTO public.roster VALUES (946, 43, 48, 2.50);
INSERT INTO public.roster VALUES (947, 43, 76, 3.70);
INSERT INTO public.roster VALUES (948, 43, 105, 1.60);
INSERT INTO public.roster VALUES (949, 43, 169, 3.30);
INSERT INTO public.roster VALUES (951, 43, 56, 2.40);
INSERT INTO public.roster VALUES (954, 43, 176, 3.20);
INSERT INTO public.roster VALUES (955, 44, 3, 2.60);
INSERT INTO public.roster VALUES (654, 32, 3, 3.50);
INSERT INTO public.roster VALUES (656, 32, 39, 2.70);
INSERT INTO public.roster VALUES (657, 32, 48, 0.00);
INSERT INTO public.roster VALUES (658, 32, 51, 3.50);
INSERT INTO public.roster VALUES (660, 32, 57, 1.30);
INSERT INTO public.roster VALUES (661, 32, 76, 2.60);
INSERT INTO public.roster VALUES (662, 32, 93, 1.80);
INSERT INTO public.roster VALUES (663, 32, 105, 2.50);
INSERT INTO public.roster VALUES (665, 32, 169, 2.10);
INSERT INTO public.roster VALUES (666, 32, 176, 1.40);
INSERT INTO public.roster VALUES (697, 28, 91, 3.40);
INSERT INTO public.roster VALUES (698, 28, 32, 3.30);
INSERT INTO public.roster VALUES (702, 28, 49, 3.70);
INSERT INTO public.roster VALUES (703, 28, 79, 2.70);
INSERT INTO public.roster VALUES (704, 28, 85, 2.40);
INSERT INTO public.roster VALUES (705, 28, 122, 2.00);
INSERT INTO public.roster VALUES (706, 28, 1, 3.40);
INSERT INTO public.roster VALUES (707, 28, 146, 3.60);
INSERT INTO public.roster VALUES (708, 28, 161, 2.00);
INSERT INTO public.roster VALUES (709, 28, 131, 1.90);
INSERT INTO public.roster VALUES (710, 28, 33, 2.70);
INSERT INTO public.roster VALUES (711, 28, 69, 2.90);
INSERT INTO public.roster VALUES (712, 28, 99, 1.40);
INSERT INTO public.roster VALUES (750, 34, 62, 2.80);
INSERT INTO public.roster VALUES (755, 34, 92, 2.00);
INSERT INTO public.roster VALUES (756, 34, 114, 1.60);
INSERT INTO public.roster VALUES (757, 34, 120, 2.10);
INSERT INTO public.roster VALUES (760, 34, 155, 1.30);
INSERT INTO public.roster VALUES (761, 34, 159, 3.10);
INSERT INTO public.roster VALUES (762, 34, 36, 2.60);
INSERT INTO public.roster VALUES (763, 34, 59, 1.20);
INSERT INTO public.roster VALUES (764, 34, 75, 2.40);
INSERT INTO public.roster VALUES (765, 34, 86, 1.80);
INSERT INTO public.roster VALUES (767, 34, 128, 1.30);
INSERT INTO public.roster VALUES (768, 34, 135, 2.80);
INSERT INTO public.roster VALUES (770, 35, 17, 1.50);
INSERT INTO public.roster VALUES (773, 35, 34, 2.30);
INSERT INTO public.roster VALUES (779, 35, 190, 3.10);
INSERT INTO public.roster VALUES (780, 35, 195, 1.80);
INSERT INTO public.roster VALUES (784, 35, 112, 3.70);
INSERT INTO public.roster VALUES (785, 35, 118, 3.20);
INSERT INTO public.roster VALUES (790, 35, 92, 3.60);
INSERT INTO public.roster VALUES (795, 36, 144, 3.60);
INSERT INTO public.roster VALUES (796, 36, 186, 2.80);
INSERT INTO public.roster VALUES (797, 36, 60, 2.20);
INSERT INTO public.roster VALUES (798, 36, 154, 2.10);
INSERT INTO public.roster VALUES (799, 37, 100, 1.70);
INSERT INTO public.roster VALUES (802, 37, 132, 1.70);
INSERT INTO public.roster VALUES (803, 37, 117, 3.10);
INSERT INTO public.roster VALUES (805, 37, 49, 3.70);
INSERT INTO public.roster VALUES (806, 37, 79, 3.10);
INSERT INTO public.roster VALUES (808, 37, 122, 3.50);
INSERT INTO public.roster VALUES (810, 37, 146, 3.80);
INSERT INTO public.roster VALUES (813, 37, 38, 2.70);
INSERT INTO public.roster VALUES (814, 37, 167, 3.90);
INSERT INTO public.roster VALUES (815, 37, 180, 3.40);
INSERT INTO public.roster VALUES (816, 37, 188, 1.10);
INSERT INTO public.roster VALUES (817, 37, 142, 2.90);
INSERT INTO public.roster VALUES (818, 37, 170, 2.20);
INSERT INTO public.roster VALUES (819, 37, 187, 1.70);
INSERT INTO public.roster VALUES (989, 47, 17, 4.00);
INSERT INTO public.roster VALUES (655, 32, 15, 4.00);
INSERT INTO public.roster VALUES (659, 32, 56, 4.00);
INSERT INTO public.roster VALUES (664, 32, 110, 4.00);
INSERT INTO public.roster VALUES (667, 32, 189, 4.00);
INSERT INTO public.roster VALUES (820, 37, 193, 1.70);
INSERT INTO public.roster VALUES (1028, 49, 12, 1.50);
INSERT INTO public.roster VALUES (1029, 49, 41, 3.10);
INSERT INTO public.roster VALUES (1032, 49, 61, 2.00);
INSERT INTO public.roster VALUES (1033, 49, 65, 2.20);
INSERT INTO public.roster VALUES (713, 28, 81, 1.90);
INSERT INTO public.roster VALUES (714, 28, 38, 3.10);
INSERT INTO public.roster VALUES (715, 28, 167, 3.00);
INSERT INTO public.roster VALUES (717, 28, 188, 3.70);
INSERT INTO public.roster VALUES (719, 28, 170, 3.20);
INSERT INTO public.roster VALUES (721, 28, 193, 3.50);
INSERT INTO public.roster VALUES (722, 28, 8, 2.70);
INSERT INTO public.roster VALUES (612, 29, 3, 3.30);
INSERT INTO public.roster VALUES (613, 29, 15, 3.00);
INSERT INTO public.roster VALUES (614, 29, 39, 2.50);
INSERT INTO public.roster VALUES (615, 29, 48, 2.60);
INSERT INTO public.roster VALUES (619, 29, 76, 3.60);
INSERT INTO public.roster VALUES (621, 29, 105, 2.60);
INSERT INTO public.roster VALUES (622, 29, 110, 1.90);
INSERT INTO public.roster VALUES (623, 29, 169, 3.90);
INSERT INTO public.roster VALUES (625, 29, 189, 1.20);
INSERT INTO public.roster VALUES (626, 30, 3, 2.30);
INSERT INTO public.roster VALUES (627, 30, 15, 1.70);
INSERT INTO public.roster VALUES (631, 30, 56, 1.40);
INSERT INTO public.roster VALUES (632, 30, 57, 1.80);
INSERT INTO public.roster VALUES (633, 30, 76, 2.30);
INSERT INTO public.roster VALUES (636, 30, 110, 1.40);
INSERT INTO public.roster VALUES (638, 30, 176, 2.10);
INSERT INTO public.roster VALUES (641, 31, 15, 1.70);
INSERT INTO public.roster VALUES (643, 31, 48, 3.90);
INSERT INTO public.roster VALUES (645, 31, 56, 1.90);
INSERT INTO public.roster VALUES (646, 31, 57, 2.10);
INSERT INTO public.roster VALUES (647, 31, 76, 3.70);
INSERT INTO public.roster VALUES (648, 31, 93, 2.00);
INSERT INTO public.roster VALUES (651, 31, 169, 2.70);
INSERT INTO public.roster VALUES (653, 31, 189, 2.70);
INSERT INTO public.roster VALUES (821, 37, 8, 2.60);
INSERT INTO public.roster VALUES (822, 37, 28, 3.70);
INSERT INTO public.roster VALUES (233, 9, 21, 1.80);
INSERT INTO public.roster VALUES (823, 38, 100, 2.50);
INSERT INTO public.roster VALUES (824, 38, 91, 1.00);
INSERT INTO public.roster VALUES (826, 38, 132, 3.10);
INSERT INTO public.roster VALUES (828, 38, 115, 1.00);
INSERT INTO public.roster VALUES (829, 38, 49, 1.70);
INSERT INTO public.roster VALUES (251, 10, 21, 1.40);
INSERT INTO public.roster VALUES (830, 38, 79, 2.90);
INSERT INTO public.roster VALUES (831, 38, 85, 2.40);
INSERT INTO public.roster VALUES (833, 38, 1, 1.20);
INSERT INTO public.roster VALUES (834, 38, 146, 1.50);
INSERT INTO public.roster VALUES (835, 38, 33, 1.20);
INSERT INTO public.roster VALUES (836, 38, 69, 1.40);
INSERT INTO public.roster VALUES (837, 38, 38, 3.90);
INSERT INTO public.roster VALUES (839, 38, 180, 3.50);
INSERT INTO public.roster VALUES (257, 10, 171, 1.10);
INSERT INTO public.roster VALUES (252, 10, 35, 1.30);
INSERT INTO public.roster VALUES (268, 11, 35, 1.10);
INSERT INTO public.roster VALUES (843, 38, 187, 1.20);
INSERT INTO public.roster VALUES (845, 38, 8, 3.90);
INSERT INTO public.roster VALUES (846, 38, 28, 3.80);
INSERT INTO public.roster VALUES (5, 1, 21, 2.30);
INSERT INTO public.roster VALUES (30, 2, 21, 1.90);
INSERT INTO public.roster VALUES (55, 3, 21, 2.70);
INSERT INTO public.roster VALUES (80, 4, 21, 2.20);
INSERT INTO public.roster VALUES (31, 2, 35, 1.80);
INSERT INTO public.roster VALUES (56, 3, 35, 1.10);
INSERT INTO public.roster VALUES (12, 1, 108, 1.10);
INSERT INTO public.roster VALUES (37, 2, 108, 1.80);
INSERT INTO public.roster VALUES (62, 3, 108, 1.70);
INSERT INTO public.roster VALUES (87, 4, 108, 2.40);
INSERT INTO public.roster VALUES (19, 1, 171, 2.90);
INSERT INTO public.roster VALUES (44, 2, 171, 1.60);
INSERT INTO public.roster VALUES (94, 4, 171, 2.90);
INSERT INTO public.roster VALUES (352, 15, 155, 2.40);
INSERT INTO public.roster VALUES (385, 16, 155, 1.90);
INSERT INTO public.roster VALUES (494, 17, 155, 2.30);
INSERT INTO public.roster VALUES (320, 14, 156, 1.60);
INSERT INTO public.roster VALUES (495, 17, 156, 3.90);
INSERT INTO public.roster VALUES (321, 14, 159, 2.30);
INSERT INTO public.roster VALUES (1034, 49, 67, 3.30);
INSERT INTO public.roster VALUES (1036, 49, 98, 3.40);
INSERT INTO public.roster VALUES (1037, 49, 123, 2.20);
INSERT INTO public.roster VALUES (1038, 49, 141, 2.60);
INSERT INTO public.roster VALUES (448, 20, 126, 3.90);
INSERT INTO public.roster VALUES (570, 21, 126, 2.50);
INSERT INTO public.roster VALUES (156, 6, 131, 2.90);
INSERT INTO public.roster VALUES (189, 7, 131, 1.40);
INSERT INTO public.roster VALUES (404, 18, 131, 2.40);
INSERT INTO public.roster VALUES (449, 20, 131, 3.30);
INSERT INTO public.roster VALUES (548, 27, 131, 2.90);
INSERT INTO public.roster VALUES (571, 21, 131, 1.70);
INSERT INTO public.roster VALUES (123, 5, 131, 3.80);
INSERT INTO public.roster VALUES (222, 8, 131, 2.70);
INSERT INTO public.roster VALUES (406, 18, 23, 3.00);
INSERT INTO public.roster VALUES (432, 19, 23, 3.70);
INSERT INTO public.roster VALUES (554, 27, 23, 3.70);
INSERT INTO public.roster VALUES (572, 21, 23, 2.40);
INSERT INTO public.roster VALUES (169, 7, 23, 2.60);
INSERT INTO public.roster VALUES (103, 5, 23, 3.30);
INSERT INTO public.roster VALUES (136, 6, 23, 1.80);
INSERT INTO public.roster VALUES (202, 8, 23, 2.20);
INSERT INTO public.roster VALUES (204, 8, 30, 3.90);
INSERT INTO public.roster VALUES (434, 19, 30, 3.30);
INSERT INTO public.roster VALUES (451, 20, 30, 2.20);
INSERT INTO public.roster VALUES (556, 27, 30, 2.20);
INSERT INTO public.roster VALUES (573, 21, 30, 2.70);
INSERT INTO public.roster VALUES (105, 5, 30, 3.60);
INSERT INTO public.roster VALUES (138, 6, 30, 1.10);
INSERT INTO public.roster VALUES (107, 5, 33, 2.50);
INSERT INTO public.roster VALUES (140, 6, 33, 3.90);
INSERT INTO public.roster VALUES (416, 19, 33, 3.90);
INSERT INTO public.roster VALUES (538, 27, 33, 1.10);
INSERT INTO public.roster VALUES (574, 21, 33, 2.10);
INSERT INTO public.roster VALUES (206, 8, 33, 3.50);
INSERT INTO public.roster VALUES (108, 5, 38, 2.80);
INSERT INTO public.roster VALUES (207, 8, 38, 2.80);
INSERT INTO public.roster VALUES (453, 20, 38, 1.00);
INSERT INTO public.roster VALUES (575, 21, 38, 3.90);
INSERT INTO public.roster VALUES (110, 5, 69, 3.50);
INSERT INTO public.roster VALUES (143, 6, 69, 3.10);
INSERT INTO public.roster VALUES (454, 20, 69, 3.20);
INSERT INTO public.roster VALUES (540, 27, 69, 2.10);
INSERT INTO public.roster VALUES (116, 5, 99, 2.30);
INSERT INTO public.roster VALUES (149, 6, 99, 3.60);
INSERT INTO public.roster VALUES (215, 8, 99, 1.40);
INSERT INTO public.roster VALUES (413, 18, 188, 2.50);
INSERT INTO public.roster VALUES (441, 19, 188, 2.90);
INSERT INTO public.roster VALUES (563, 27, 188, 1.10);
INSERT INTO public.roster VALUES (585, 21, 188, 2.00);
INSERT INTO public.roster VALUES (198, 7, 188, 1.50);
INSERT INTO public.roster VALUES (231, 8, 188, 1.60);
INSERT INTO public.roster VALUES (165, 6, 188, 3.70);
INSERT INTO public.roster VALUES (408, 18, 142, 2.10);
INSERT INTO public.roster VALUES (464, 20, 142, 3.90);
INSERT INTO public.roster VALUES (125, 5, 142, 3.30);
INSERT INTO public.roster VALUES (158, 6, 142, 3.00);
INSERT INTO public.roster VALUES (224, 8, 142, 1.40);
INSERT INTO public.roster VALUES (191, 7, 142, 2.80);
INSERT INTO public.roster VALUES (410, 18, 170, 1.10);
INSERT INTO public.roster VALUES (587, 21, 170, 3.30);
INSERT INTO public.roster VALUES (129, 5, 170, 3.40);
INSERT INTO public.roster VALUES (162, 6, 170, 3.40);
INSERT INTO public.roster VALUES (228, 8, 170, 3.20);
INSERT INTO public.roster VALUES (195, 7, 170, 1.70);
INSERT INTO public.roster VALUES (412, 18, 187, 3.80);
INSERT INTO public.roster VALUES (438, 19, 187, 1.50);
INSERT INTO public.roster VALUES (466, 20, 187, 3.00);
INSERT INTO public.roster VALUES (560, 27, 187, 2.20);
INSERT INTO public.roster VALUES (588, 21, 187, 1.10);
INSERT INTO public.roster VALUES (131, 5, 187, 3.90);
INSERT INTO public.roster VALUES (164, 6, 187, 3.90);
INSERT INTO public.roster VALUES (230, 8, 187, 2.40);
INSERT INTO public.roster VALUES (197, 7, 187, 1.30);
INSERT INTO public.roster VALUES (414, 18, 193, 2.20);
INSERT INTO public.roster VALUES (467, 20, 193, 1.80);
INSERT INTO public.roster VALUES (133, 5, 193, 1.70);
INSERT INTO public.roster VALUES (166, 6, 193, 3.10);
INSERT INTO public.roster VALUES (199, 7, 193, 1.20);
INSERT INTO public.roster VALUES (234, 9, 60, 1.40);
INSERT INTO public.roster VALUES (505, 25, 60, 1.40);
INSERT INTO public.roster VALUES (8, 1, 60, 1.80);
INSERT INTO public.roster VALUES (83, 4, 60, 3.80);
INSERT INTO public.roster VALUES (1040, 49, 149, 1.30);
INSERT INTO public.roster VALUES (1042, 49, 175, 3.60);
INSERT INTO public.roster VALUES (1043, 49, 179, 1.40);
INSERT INTO public.roster VALUES (1044, 49, 181, 2.30);
INSERT INTO public.roster VALUES (1045, 50, 3, 2.20);
INSERT INTO public.roster VALUES (1046, 50, 76, 1.60);
INSERT INTO public.roster VALUES (1048, 50, 39, 2.70);
INSERT INTO public.roster VALUES (1049, 50, 48, 3.70);
INSERT INTO public.roster VALUES (1054, 50, 189, 3.70);
INSERT INTO public.roster VALUES (1057, 51, 60, 1.50);
INSERT INTO public.roster VALUES (1058, 51, 154, 1.30);
INSERT INTO public.roster VALUES (1059, 51, 97, 2.20);
INSERT INTO public.roster VALUES (1060, 51, 17, 3.20);
INSERT INTO public.roster VALUES (1061, 51, 40, 2.90);
INSERT INTO public.roster VALUES (1062, 51, 73, 3.10);
INSERT INTO public.roster VALUES (1063, 51, 92, 1.20);
INSERT INTO public.roster VALUES (1066, 51, 159, 3.30);
INSERT INTO public.roster VALUES (1067, 51, 86, 1.80);
INSERT INTO public.roster VALUES (1069, 51, 62, 1.40);
INSERT INTO public.roster VALUES (1071, 51, 163, 3.50);
INSERT INTO public.roster VALUES (1072, 51, 195, 3.30);
INSERT INTO public.roster VALUES (1074, 51, 120, 2.20);
INSERT INTO public.roster VALUES (1075, 51, 75, 1.10);
INSERT INTO public.roster VALUES (1077, 51, 135, 1.40);
INSERT INTO public.roster VALUES (1079, 52, 40, 3.40);
INSERT INTO public.roster VALUES (1080, 52, 73, 3.60);
INSERT INTO public.roster VALUES (1083, 52, 155, 1.60);
INSERT INTO public.roster VALUES (1085, 52, 86, 2.20);
INSERT INTO public.roster VALUES (1087, 52, 62, 1.90);
INSERT INTO public.roster VALUES (1088, 52, 70, 2.50);
INSERT INTO public.roster VALUES (1089, 52, 163, 2.70);
INSERT INTO public.roster VALUES (1090, 52, 195, 1.90);
INSERT INTO public.roster VALUES (1091, 52, 114, 1.60);
INSERT INTO public.roster VALUES (1094, 52, 128, 1.50);
INSERT INTO public.roster VALUES (1095, 52, 135, 3.60);
INSERT INTO public.roster VALUES (117, 5, 100, 3.30);
INSERT INTO public.roster VALUES (150, 6, 100, 2.70);
INSERT INTO public.roster VALUES (397, 18, 100, 3.70);
INSERT INTO public.roster VALUES (216, 8, 100, 2.80);
INSERT INTO public.roster VALUES (701, 28, 115, 4.00);
INSERT INTO public.roster VALUES (716, 28, 180, 4.00);
INSERT INTO public.roster VALUES (718, 28, 142, 4.00);
INSERT INTO public.roster VALUES (720, 28, 187, 4.00);
INSERT INTO public.roster VALUES (723, 28, 28, 4.00);
INSERT INTO public.roster VALUES (616, 29, 51, 4.00);
INSERT INTO public.roster VALUES (617, 29, 56, 4.00);
INSERT INTO public.roster VALUES (618, 29, 57, 4.00);
INSERT INTO public.roster VALUES (620, 29, 93, 4.00);
INSERT INTO public.roster VALUES (624, 29, 176, 4.00);
INSERT INTO public.roster VALUES (628, 30, 39, 4.00);
INSERT INTO public.roster VALUES (629, 30, 48, 4.00);
INSERT INTO public.roster VALUES (630, 30, 51, 4.00);
INSERT INTO public.roster VALUES (634, 30, 93, 4.00);
INSERT INTO public.roster VALUES (635, 30, 105, 4.00);
INSERT INTO public.roster VALUES (637, 30, 169, 4.00);
INSERT INTO public.roster VALUES (639, 30, 189, 4.00);
INSERT INTO public.roster VALUES (640, 31, 3, 4.00);
INSERT INTO public.roster VALUES (642, 31, 39, 4.00);
INSERT INTO public.roster VALUES (644, 31, 51, 4.00);
INSERT INTO public.roster VALUES (649, 31, 105, 4.00);
INSERT INTO public.roster VALUES (650, 31, 110, 4.00);
INSERT INTO public.roster VALUES (652, 31, 176, 4.00);
INSERT INTO public.roster VALUES (727, 33, 62, 4.00);
INSERT INTO public.roster VALUES (728, 33, 70, 4.00);
INSERT INTO public.roster VALUES (730, 33, 163, 4.00);
INSERT INTO public.roster VALUES (731, 33, 195, 4.00);
INSERT INTO public.roster VALUES (733, 33, 114, 4.00);
INSERT INTO public.roster VALUES (734, 33, 120, 4.00);
INSERT INTO public.roster VALUES (741, 33, 75, 4.00);
INSERT INTO public.roster VALUES (744, 33, 128, 4.00);
INSERT INTO public.roster VALUES (745, 33, 135, 4.00);
INSERT INTO public.roster VALUES (751, 34, 70, 4.00);
INSERT INTO public.roster VALUES (752, 34, 73, 4.00);
INSERT INTO public.roster VALUES (753, 34, 163, 4.00);
INSERT INTO public.roster VALUES (754, 34, 195, 4.00);
INSERT INTO public.roster VALUES (758, 34, 124, 4.00);
INSERT INTO public.roster VALUES (759, 34, 130, 4.00);
INSERT INTO public.roster VALUES (772, 35, 27, 4.00);
INSERT INTO public.roster VALUES (774, 35, 36, 4.00);
INSERT INTO public.roster VALUES (775, 35, 40, 4.00);
INSERT INTO public.roster VALUES (776, 35, 59, 4.00);
INSERT INTO public.roster VALUES (777, 35, 62, 4.00);
INSERT INTO public.roster VALUES (778, 35, 159, 4.00);
INSERT INTO public.roster VALUES (781, 35, 163, 4.00);
INSERT INTO public.roster VALUES (782, 35, 86, 4.00);
INSERT INTO public.roster VALUES (783, 35, 89, 4.00);
INSERT INTO public.roster VALUES (786, 35, 119, 4.00);
INSERT INTO public.roster VALUES (787, 35, 124, 4.00);
INSERT INTO public.roster VALUES (788, 35, 140, 4.00);
INSERT INTO public.roster VALUES (789, 35, 75, 4.00);
INSERT INTO public.roster VALUES (791, 35, 107, 4.00);
INSERT INTO public.roster VALUES (792, 35, 128, 4.00);
INSERT INTO public.roster VALUES (793, 35, 156, 4.00);
INSERT INTO public.roster VALUES (794, 36, 97, 4.00);
INSERT INTO public.roster VALUES (800, 37, 91, 4.00);
INSERT INTO public.roster VALUES (801, 37, 32, 4.00);
INSERT INTO public.roster VALUES (804, 37, 115, 4.00);
INSERT INTO public.roster VALUES (807, 37, 85, 4.00);
INSERT INTO public.roster VALUES (809, 37, 1, 4.00);
INSERT INTO public.roster VALUES (811, 37, 33, 4.00);
INSERT INTO public.roster VALUES (812, 37, 69, 4.00);
INSERT INTO public.roster VALUES (6, 1, 35, 4.00);
INSERT INTO public.roster VALUES (81, 4, 35, 4.00);
INSERT INTO public.roster VALUES (825, 38, 32, 4.00);
INSERT INTO public.roster VALUES (827, 38, 117, 4.00);
INSERT INTO public.roster VALUES (832, 38, 122, 4.00);
INSERT INTO public.roster VALUES (838, 38, 167, 4.00);
INSERT INTO public.roster VALUES (840, 38, 188, 4.00);
INSERT INTO public.roster VALUES (841, 38, 142, 4.00);
INSERT INTO public.roster VALUES (842, 38, 170, 4.00);
INSERT INTO public.roster VALUES (844, 38, 193, 4.00);
INSERT INTO public.roster VALUES (69, 3, 171, 4.00);
INSERT INTO public.roster VALUES (326, 15, 17, 4.00);
INSERT INTO public.roster VALUES (328, 15, 27, 4.00);
INSERT INTO public.roster VALUES (471, 17, 34, 4.00);
INSERT INTO public.roster VALUES (297, 14, 36, 4.00);
INSERT INTO public.roster VALUES (475, 17, 59, 4.00);
INSERT INTO public.roster VALUES (300, 14, 59, 4.00);
INSERT INTO public.roster VALUES (476, 17, 62, 4.00);
INSERT INTO public.roster VALUES (477, 17, 70, 4.00);
INSERT INTO public.roster VALUES (478, 17, 73, 4.00);
INSERT INTO public.roster VALUES (304, 14, 75, 4.00);
INSERT INTO public.roster VALUES (370, 16, 75, 4.00);
INSERT INTO public.roster VALUES (480, 17, 86, 4.00);
INSERT INTO public.roster VALUES (305, 14, 86, 4.00);
INSERT INTO public.roster VALUES (306, 14, 89, 4.00);
INSERT INTO public.roster VALUES (340, 15, 92, 4.00);
INSERT INTO public.roster VALUES (373, 16, 92, 4.00);
INSERT INTO public.roster VALUES (374, 16, 107, 4.00);
INSERT INTO public.roster VALUES (342, 15, 112, 4.00);
INSERT INTO public.roster VALUES (484, 17, 112, 4.00);
INSERT INTO public.roster VALUES (485, 17, 114, 4.00);
INSERT INTO public.roster VALUES (486, 17, 118, 4.00);
INSERT INTO public.roster VALUES (488, 17, 120, 4.00);
INSERT INTO public.roster VALUES (315, 14, 128, 4.00);
INSERT INTO public.roster VALUES (381, 16, 128, 4.00);
INSERT INTO public.roster VALUES (259, 10, 196, 4.00);
INSERT INTO public.roster VALUES (276, 11, 196, 4.00);
INSERT INTO public.roster VALUES (47, 2, 196, 4.00);
INSERT INTO public.roster VALUES (237, 9, 5, 4.00);
INSERT INTO public.roster VALUES (28, 2, 5, 4.00);
INSERT INTO public.roster VALUES (239, 9, 72, 4.00);
INSERT INTO public.roster VALUES (34, 2, 72, 4.00);
INSERT INTO public.roster VALUES (84, 4, 72, 4.00);
INSERT INTO public.roster VALUES (4, 1, 14, 4.00);
INSERT INTO public.roster VALUES (109, 5, 49, 4.00);
INSERT INTO public.roster VALUES (175, 7, 49, 4.00);
INSERT INTO public.roster VALUES (1035, 49, 96, 4.00);
INSERT INTO public.roster VALUES (177, 7, 79, 4.00);
INSERT INTO public.roster VALUES (419, 19, 79, 4.00);
INSERT INTO public.roster VALUES (145, 6, 81, 4.00);
INSERT INTO public.roster VALUES (178, 7, 81, 4.00);
INSERT INTO public.roster VALUES (394, 18, 81, 4.00);
INSERT INTO public.roster VALUES (444, 20, 81, 4.00);
INSERT INTO public.roster VALUES (114, 5, 85, 4.00);
INSERT INTO public.roster VALUES (567, 21, 85, 4.00);
INSERT INTO public.roster VALUES (118, 5, 104, 4.00);
INSERT INTO public.roster VALUES (184, 7, 104, 4.00);
INSERT INTO public.roster VALUES (398, 18, 104, 4.00);
INSERT INTO public.roster VALUES (446, 20, 104, 4.00);
INSERT INTO public.roster VALUES (589, 21, 193, 4.00);
INSERT INTO public.roster VALUES (232, 8, 193, 4.00);
INSERT INTO public.roster VALUES (270, 11, 60, 4.00);
INSERT INTO public.roster VALUES (281, 12, 60, 4.00);
INSERT INTO public.roster VALUES (33, 2, 60, 4.00);
INSERT INTO public.roster VALUES (32, 2, 54, 4.00);
INSERT INTO public.roster VALUES (82, 4, 54, 4.00);
INSERT INTO public.roster VALUES (277, 11, 97, 4.00);
INSERT INTO public.roster VALUES (283, 12, 97, 4.00);
INSERT INTO public.roster VALUES (86, 4, 97, 4.00);
INSERT INTO public.roster VALUES (519, 24, 97, 4.00);
INSERT INTO public.roster VALUES (24, 1, 199, 4.00);
INSERT INTO public.roster VALUES (14, 1, 144, 4.00);
INSERT INTO public.roster VALUES (64, 3, 144, 4.00);
INSERT INTO public.roster VALUES (284, 12, 144, 4.00);
INSERT INTO public.roster VALUES (39, 2, 144, 4.00);
INSERT INTO public.roster VALUES (523, 24, 186, 4.00);
INSERT INTO public.roster VALUES (46, 2, 186, 4.00);
INSERT INTO public.roster VALUES (71, 3, 186, 4.00);
INSERT INTO public.roster VALUES (272, 11, 74, 4.00);
INSERT INTO public.roster VALUES (289, 12, 74, 4.00);
INSERT INTO public.roster VALUES (511, 25, 154, 4.00);
INSERT INTO public.roster VALUES (597, 26, 154, 4.00);
INSERT INTO public.roster VALUES (93, 4, 154, 4.00);
INSERT INTO public.roster VALUES (68, 3, 154, 4.00);
INSERT INTO public.roster VALUES (848, 39, 11, 4.00);
INSERT INTO public.roster VALUES (849, 39, 12, 4.00);
INSERT INTO public.roster VALUES (852, 39, 45, 4.00);
INSERT INTO public.roster VALUES (853, 39, 61, 4.00);
INSERT INTO public.roster VALUES (858, 39, 96, 4.00);
INSERT INTO public.roster VALUES (859, 39, 98, 4.00);
INSERT INTO public.roster VALUES (860, 39, 103, 4.00);
INSERT INTO public.roster VALUES (861, 39, 123, 4.00);
INSERT INTO public.roster VALUES (862, 39, 141, 4.00);
INSERT INTO public.roster VALUES (863, 39, 147, 4.00);
INSERT INTO public.roster VALUES (865, 39, 149, 4.00);
INSERT INTO public.roster VALUES (867, 39, 173, 4.00);
INSERT INTO public.roster VALUES (868, 39, 175, 4.00);
INSERT INTO public.roster VALUES (869, 39, 179, 4.00);
INSERT INTO public.roster VALUES (870, 39, 181, 4.00);
INSERT INTO public.roster VALUES (872, 40, 11, 4.00);
INSERT INTO public.roster VALUES (875, 40, 42, 4.00);
INSERT INTO public.roster VALUES (879, 40, 67, 4.00);
INSERT INTO public.roster VALUES (884, 40, 103, 4.00);
INSERT INTO public.roster VALUES (885, 40, 123, 4.00);
INSERT INTO public.roster VALUES (888, 40, 148, 4.00);
INSERT INTO public.roster VALUES (890, 40, 150, 4.00);
INSERT INTO public.roster VALUES (891, 40, 173, 4.00);
INSERT INTO public.roster VALUES (893, 40, 179, 4.00);
INSERT INTO public.roster VALUES (895, 41, 6, 4.00);
INSERT INTO public.roster VALUES (898, 41, 41, 4.00);
INSERT INTO public.roster VALUES (901, 41, 61, 4.00);
INSERT INTO public.roster VALUES (903, 41, 67, 4.00);
INSERT INTO public.roster VALUES (906, 41, 96, 4.00);
INSERT INTO public.roster VALUES (907, 41, 98, 4.00);
INSERT INTO public.roster VALUES (911, 41, 147, 4.00);
INSERT INTO public.roster VALUES (913, 41, 149, 4.00);
INSERT INTO public.roster VALUES (916, 41, 175, 4.00);
INSERT INTO public.roster VALUES (919, 42, 6, 4.00);
INSERT INTO public.roster VALUES (921, 42, 12, 4.00);
INSERT INTO public.roster VALUES (924, 42, 45, 4.00);
INSERT INTO public.roster VALUES (925, 42, 61, 4.00);
INSERT INTO public.roster VALUES (930, 42, 96, 4.00);
INSERT INTO public.roster VALUES (933, 42, 123, 4.00);
INSERT INTO public.roster VALUES (935, 42, 147, 4.00);
INSERT INTO public.roster VALUES (939, 42, 173, 4.00);
INSERT INTO public.roster VALUES (945, 43, 39, 4.00);
INSERT INTO public.roster VALUES (950, 43, 51, 4.00);
INSERT INTO public.roster VALUES (952, 43, 57, 4.00);
INSERT INTO public.roster VALUES (953, 43, 93, 4.00);
INSERT INTO public.roster VALUES (956, 44, 15, 4.00);
INSERT INTO public.roster VALUES (990, 47, 40, 4.00);
INSERT INTO public.roster VALUES (992, 47, 92, 4.00);
INSERT INTO public.roster VALUES (995, 47, 159, 4.00);
INSERT INTO public.roster VALUES (1000, 47, 163, 4.00);
INSERT INTO public.roster VALUES (1001, 47, 195, 4.00);
INSERT INTO public.roster VALUES (1002, 47, 114, 4.00);
INSERT INTO public.roster VALUES (1003, 47, 120, 4.00);
INSERT INTO public.roster VALUES (1008, 48, 11, 4.00);
INSERT INTO public.roster VALUES (1010, 48, 41, 4.00);
INSERT INTO public.roster VALUES (1011, 48, 42, 4.00);
INSERT INTO public.roster VALUES (1012, 48, 45, 4.00);
INSERT INTO public.roster VALUES (1017, 48, 98, 4.00);
INSERT INTO public.roster VALUES (1020, 48, 147, 4.00);
INSERT INTO public.roster VALUES (1021, 48, 149, 4.00);
INSERT INTO public.roster VALUES (1023, 48, 175, 4.00);
INSERT INTO public.roster VALUES (1024, 48, 179, 4.00);
INSERT INTO public.roster VALUES (1030, 49, 42, 4.00);
INSERT INTO public.roster VALUES (1031, 49, 45, 4.00);
INSERT INTO public.roster VALUES (1039, 49, 147, 4.00);
INSERT INTO public.roster VALUES (1041, 49, 150, 4.00);
INSERT INTO public.roster VALUES (1047, 50, 176, 4.00);
INSERT INTO public.roster VALUES (1050, 50, 51, 4.00);
INSERT INTO public.roster VALUES (1051, 50, 93, 4.00);
INSERT INTO public.roster VALUES (1052, 50, 105, 4.00);
INSERT INTO public.roster VALUES (1053, 50, 169, 4.00);
INSERT INTO public.roster VALUES (1055, 51, 144, 4.00);
INSERT INTO public.roster VALUES (1056, 51, 186, 4.00);
INSERT INTO public.roster VALUES (1064, 51, 130, 4.00);
INSERT INTO public.roster VALUES (1065, 51, 155, 4.00);
INSERT INTO public.roster VALUES (1068, 51, 89, 4.00);
INSERT INTO public.roster VALUES (1070, 51, 70, 4.00);
INSERT INTO public.roster VALUES (1073, 51, 114, 4.00);
INSERT INTO public.roster VALUES (1076, 51, 128, 4.00);
INSERT INTO public.roster VALUES (1078, 52, 17, 4.00);
INSERT INTO public.roster VALUES (1081, 52, 92, 4.00);
INSERT INTO public.roster VALUES (1082, 52, 130, 4.00);
INSERT INTO public.roster VALUES (1084, 52, 159, 4.00);
INSERT INTO public.roster VALUES (1086, 52, 89, 4.00);
INSERT INTO public.roster VALUES (1092, 52, 120, 4.00);
INSERT INTO public.roster VALUES (1093, 52, 75, 4.00);
INSERT INTO public.roster VALUES (183, 7, 100, 4.00);
INSERT INTO public.roster VALUES (301, 14, 62, 4.00);
INSERT INTO public.roster VALUES (293, 14, 17, 2.50);
INSERT INTO public.roster VALUES (359, 16, 17, 2.50);
INSERT INTO public.roster VALUES (468, 17, 17, 3.40);
INSERT INTO public.roster VALUES (294, 14, 20, 2.70);
INSERT INTO public.roster VALUES (327, 15, 20, 1.40);
INSERT INTO public.roster VALUES (360, 16, 20, 3.80);
INSERT INTO public.roster VALUES (469, 17, 20, 2.00);
INSERT INTO public.roster VALUES (470, 17, 27, 2.60);
INSERT INTO public.roster VALUES (295, 14, 27, 1.40);
INSERT INTO public.roster VALUES (361, 16, 27, 2.10);
INSERT INTO public.roster VALUES (296, 14, 34, 1.20);
INSERT INTO public.roster VALUES (329, 15, 34, 3.70);
INSERT INTO public.roster VALUES (362, 16, 34, 3.40);
INSERT INTO public.roster VALUES (472, 17, 36, 3.30);
INSERT INTO public.roster VALUES (330, 15, 36, 3.50);
INSERT INTO public.roster VALUES (363, 16, 36, 3.50);
INSERT INTO public.roster VALUES (473, 17, 40, 1.10);
INSERT INTO public.roster VALUES (298, 14, 40, 2.60);
INSERT INTO public.roster VALUES (331, 15, 40, 1.40);
INSERT INTO public.roster VALUES (364, 16, 40, 2.50);
INSERT INTO public.roster VALUES (474, 17, 55, 1.10);
INSERT INTO public.roster VALUES (299, 14, 55, 1.70);
INSERT INTO public.roster VALUES (332, 15, 55, 1.10);
INSERT INTO public.roster VALUES (365, 16, 55, 1.60);
INSERT INTO public.roster VALUES (333, 15, 59, 3.00);
INSERT INTO public.roster VALUES (366, 16, 59, 2.60);
INSERT INTO public.roster VALUES (334, 15, 62, 1.30);
INSERT INTO public.roster VALUES (367, 16, 62, 2.60);
INSERT INTO public.roster VALUES (302, 14, 70, 2.40);
INSERT INTO public.roster VALUES (335, 15, 70, 2.20);
INSERT INTO public.roster VALUES (368, 16, 70, 1.00);
INSERT INTO public.roster VALUES (303, 14, 73, 3.20);
INSERT INTO public.roster VALUES (70, 3, 183, 4.00);
INSERT INTO public.roster VALUES (388, 16, 163, 4.00);
INSERT INTO public.roster VALUES (356, 15, 190, 4.00);
INSERT INTO public.roster VALUES (498, 17, 190, 4.00);
INSERT INTO public.roster VALUES (325, 14, 195, 4.00);
INSERT INTO public.roster VALUES (500, 17, 195, 4.00);
INSERT INTO public.roster VALUES (20, 1, 183, 4.00);
INSERT INTO public.roster VALUES (45, 2, 183, 4.00);
INSERT INTO public.roster VALUES (354, 15, 159, 3.00);
INSERT INTO public.roster VALUES (387, 16, 159, 3.50);
INSERT INTO public.roster VALUES (496, 17, 159, 3.90);
INSERT INTO public.roster VALUES (322, 14, 163, 3.10);
INSERT INTO public.roster VALUES (355, 15, 163, 2.70);
INSERT INTO public.roster VALUES (497, 17, 163, 3.90);
INSERT INTO public.roster VALUES (323, 14, 190, 1.20);
INSERT INTO public.roster VALUES (389, 16, 190, 2.00);
INSERT INTO public.roster VALUES (324, 14, 191, 1.90);
INSERT INTO public.roster VALUES (357, 15, 191, 1.80);
INSERT INTO public.roster VALUES (390, 16, 191, 1.60);
INSERT INTO public.roster VALUES (499, 17, 191, 2.00);
INSERT INTO public.roster VALUES (358, 15, 195, 2.30);
INSERT INTO public.roster VALUES (391, 16, 195, 2.90);
INSERT INTO public.roster VALUES (264, 10, 183, 2.30);
INSERT INTO public.roster VALUES (274, 11, 183, 1.70);
INSERT INTO public.roster VALUES (95, 4, 183, 2.80);
INSERT INTO public.roster VALUES (504, 25, 183, 3.40);
INSERT INTO public.roster VALUES (235, 9, 2, 1.10);
INSERT INTO public.roster VALUES (265, 11, 2, 2.90);
INSERT INTO public.roster VALUES (246, 10, 2, 3.40);
INSERT INTO public.roster VALUES (501, 25, 2, 2.10);
INSERT INTO public.roster VALUES (26, 2, 2, 2.50);
INSERT INTO public.roster VALUES (51, 3, 2, 2.70);
INSERT INTO public.roster VALUES (520, 24, 200, 4.00);
INSERT INTO public.roster VALUES (280, 11, 200, 4.00);
INSERT INTO public.roster VALUES (1, 1, 2, 4.00);
INSERT INTO public.roster VALUES (236, 9, 4, 4.00);
INSERT INTO public.roster VALUES (514, 24, 4, 4.00);
INSERT INTO public.roster VALUES (288, 12, 200, 4.00);
INSERT INTO public.roster VALUES (75, 3, 200, 4.00);
INSERT INTO public.roster VALUES (290, 12, 136, 4.00);
INSERT INTO public.roster VALUES (88, 4, 136, 4.00);
INSERT INTO public.roster VALUES (76, 4, 2, 1.70);
INSERT INTO public.roster VALUES (513, 24, 2, 2.50);
INSERT INTO public.roster VALUES (267, 11, 4, 3.50);
INSERT INTO public.roster VALUES (249, 10, 4, 3.30);
INSERT INTO public.roster VALUES (502, 25, 4, 3.20);
INSERT INTO public.roster VALUES (2, 1, 4, 1.80);
INSERT INTO public.roster VALUES (27, 2, 4, 2.20);
INSERT INTO public.roster VALUES (52, 3, 4, 1.10);
INSERT INTO public.roster VALUES (77, 4, 4, 2.70);
INSERT INTO public.roster VALUES (510, 25, 200, 1.70);
INSERT INTO public.roster VALUES (261, 10, 200, 3.50);
INSERT INTO public.roster VALUES (25, 1, 200, 1.00);
INSERT INTO public.roster VALUES (50, 2, 200, 3.80);
INSERT INTO public.roster VALUES (100, 4, 200, 2.20);
INSERT INTO public.roster VALUES (521, 24, 136, 2.20);
INSERT INTO public.roster VALUES (244, 9, 136, 3.20);
INSERT INTO public.roster VALUES (262, 10, 136, 2.90);
INSERT INTO public.roster VALUES (278, 11, 136, 2.50);
INSERT INTO public.roster VALUES (13, 1, 136, 3.50);
INSERT INTO public.roster VALUES (38, 2, 136, 3.80);
INSERT INTO public.roster VALUES (63, 3, 136, 3.00);
INSERT INTO public.roster VALUES (255, 10, 145, 1.40);
INSERT INTO public.roster VALUES (273, 11, 145, 2.00);
INSERT INTO public.roster VALUES (65, 3, 145, 3.10);
INSERT INTO public.roster VALUES (15, 1, 145, 3.30);
INSERT INTO public.roster VALUES (90, 4, 145, 3.60);
INSERT INTO public.roster VALUES (241, 9, 145, 3.20);
INSERT INTO public.roster VALUES (40, 2, 145, 3.50);
INSERT INTO public.roster VALUES (524, 13, 145, 2.70);
INSERT INTO public.roster VALUES (245, 9, 196, 3.90);
INSERT INTO public.roster VALUES (97, 4, 196, 2.40);
INSERT INTO public.roster VALUES (72, 3, 196, 1.40);
INSERT INTO public.roster VALUES (22, 1, 196, 1.50);
INSERT INTO public.roster VALUES (516, 24, 196, 3.10);
INSERT INTO public.roster VALUES (525, 13, 196, 1.80);
INSERT INTO public.roster VALUES (247, 10, 5, 3.30);
INSERT INTO public.roster VALUES (266, 11, 5, 2.10);
INSERT INTO public.roster VALUES (503, 25, 5, 1.20);
INSERT INTO public.roster VALUES (78, 4, 5, 3.80);
INSERT INTO public.roster VALUES (53, 3, 5, 3.20);
INSERT INTO public.roster VALUES (3, 1, 5, 3.10);
INSERT INTO public.roster VALUES (526, 13, 5, 2.30);
INSERT INTO public.roster VALUES (248, 10, 72, 2.80);
INSERT INTO public.roster VALUES (271, 11, 72, 2.30);
INSERT INTO public.roster VALUES (9, 1, 72, 3.10);
INSERT INTO public.roster VALUES (59, 3, 72, 2.50);
INSERT INTO public.roster VALUES (515, 24, 72, 2.70);
INSERT INTO public.roster VALUES (527, 13, 72, 3.50);
INSERT INTO public.roster VALUES (250, 10, 14, 3.70);
INSERT INTO public.roster VALUES (66, 3, 151, 4.00);
INSERT INTO public.roster VALUES (537, 13, 152, 4.00);
INSERT INTO public.roster VALUES (17, 1, 152, 4.00);
INSERT INTO public.roster VALUES (260, 10, 198, 4.00);
INSERT INTO public.roster VALUES (243, 9, 198, 4.00);
INSERT INTO public.roster VALUES (23, 1, 198, 4.00);
INSERT INTO public.roster VALUES (48, 2, 198, 4.00);
INSERT INTO public.roster VALUES (285, 12, 151, 4.00);
INSERT INTO public.roster VALUES (522, 24, 152, 4.00);
INSERT INTO public.roster VALUES (291, 12, 152, 4.00);
INSERT INTO public.roster VALUES (42, 2, 152, 4.00);
INSERT INTO public.roster VALUES (212, 8, 83, 4.00);
INSERT INTO public.roster VALUES (214, 8, 91, 4.00);
INSERT INTO public.roster VALUES (421, 19, 91, 4.00);
INSERT INTO public.roster VALUES (29, 2, 14, 1.70);
INSERT INTO public.roster VALUES (54, 3, 14, 1.80);
INSERT INTO public.roster VALUES (79, 4, 14, 2.00);
INSERT INTO public.roster VALUES (528, 13, 14, 3.90);
INSERT INTO public.roster VALUES (512, 24, 198, 3.20);
INSERT INTO public.roster VALUES (531, 13, 198, 1.70);
INSERT INTO public.roster VALUES (73, 3, 198, 1.20);
INSERT INTO public.roster VALUES (98, 4, 198, 1.10);
INSERT INTO public.roster VALUES (532, 13, 151, 2.50);
INSERT INTO public.roster VALUES (16, 1, 151, 3.30);
INSERT INTO public.roster VALUES (41, 2, 151, 1.80);
INSERT INTO public.roster VALUES (91, 4, 151, 1.50);
INSERT INTO public.roster VALUES (242, 9, 152, 1.20);
INSERT INTO public.roster VALUES (256, 10, 152, 2.10);
INSERT INTO public.roster VALUES (67, 3, 152, 3.30);
INSERT INTO public.roster VALUES (92, 4, 152, 2.00);
INSERT INTO public.roster VALUES (113, 5, 83, 2.30);
INSERT INTO public.roster VALUES (146, 6, 83, 1.30);
INSERT INTO public.roster VALUES (179, 7, 83, 2.80);
INSERT INTO public.roster VALUES (395, 18, 83, 3.10);
INSERT INTO public.roster VALUES (420, 19, 83, 3.90);
INSERT INTO public.roster VALUES (542, 27, 83, 1.10);
INSERT INTO public.roster VALUES (115, 5, 91, 2.90);
INSERT INTO public.roster VALUES (148, 6, 91, 2.90);
INSERT INTO public.roster VALUES (181, 7, 91, 3.50);
INSERT INTO public.roster VALUES (543, 27, 91, 3.80);
INSERT INTO public.roster VALUES (153, 6, 117, 4.00);
INSERT INTO public.roster VALUES (219, 8, 117, 4.00);
INSERT INTO public.roster VALUES (546, 27, 117, 4.00);
INSERT INTO public.roster VALUES (551, 27, 115, 4.00);
INSERT INTO public.roster VALUES (152, 6, 115, 4.00);
INSERT INTO public.roster VALUES (435, 19, 132, 4.00);
INSERT INTO public.roster VALUES (120, 5, 117, 1.70);
INSERT INTO public.roster VALUES (186, 7, 117, 3.60);
INSERT INTO public.roster VALUES (400, 18, 117, 1.10);
INSERT INTO public.roster VALUES (424, 19, 117, 1.30);
INSERT INTO public.roster VALUES (106, 5, 32, 1.40);
INSERT INTO public.roster VALUES (172, 7, 32, 2.30);
INSERT INTO public.roster VALUES (205, 8, 32, 3.90);
INSERT INTO public.roster VALUES (428, 19, 32, 2.20);
INSERT INTO public.roster VALUES (550, 27, 32, 2.40);
INSERT INTO public.roster VALUES (139, 6, 32, 2.60);
INSERT INTO public.roster VALUES (119, 5, 115, 3.30);
INSERT INTO public.roster VALUES (185, 7, 115, 1.70);
INSERT INTO public.roster VALUES (218, 8, 115, 2.40);
INSERT INTO public.roster VALUES (399, 18, 115, 3.20);
INSERT INTO public.roster VALUES (429, 19, 115, 2.70);
INSERT INTO public.roster VALUES (124, 5, 132, 1.70);
INSERT INTO public.roster VALUES (403, 18, 132, 2.70);
INSERT INTO public.roster VALUES (557, 27, 132, 2.30);
INSERT INTO public.roster VALUES (157, 6, 132, 2.70);
INSERT INTO public.roster VALUES (190, 7, 132, 1.30);
INSERT INTO public.roster VALUES (223, 8, 132, 3.10);
INSERT INTO public.roster VALUES (443, 20, 79, 4.00);
INSERT INTO public.roster VALUES (220, 8, 122, 4.00);
INSERT INTO public.roster VALUES (142, 6, 49, 3.30);
INSERT INTO public.roster VALUES (208, 8, 49, 1.10);
INSERT INTO public.roster VALUES (417, 19, 49, 1.50);
INSERT INTO public.roster VALUES (442, 20, 49, 3.10);
INSERT INTO public.roster VALUES (539, 27, 49, 2.00);
INSERT INTO public.roster VALUES (564, 21, 49, 2.20);
INSERT INTO public.roster VALUES (111, 5, 79, 3.70);
INSERT INTO public.roster VALUES (144, 6, 79, 2.30);
INSERT INTO public.roster VALUES (541, 27, 79, 2.60);
INSERT INTO public.roster VALUES (565, 21, 79, 1.30);
INSERT INTO public.roster VALUES (210, 8, 79, 2.30);
INSERT INTO public.roster VALUES (112, 5, 81, 2.10);
INSERT INTO public.roster VALUES (211, 8, 81, 2.00);
INSERT INTO public.roster VALUES (566, 21, 81, 3.30);
INSERT INTO public.roster VALUES (147, 6, 85, 3.00);
INSERT INTO public.roster VALUES (180, 7, 85, 3.00);
INSERT INTO public.roster VALUES (213, 8, 85, 1.30);
INSERT INTO public.roster VALUES (445, 20, 85, 3.90);
INSERT INTO public.roster VALUES (151, 6, 104, 1.20);
INSERT INTO public.roster VALUES (217, 8, 104, 1.40);
INSERT INTO public.roster VALUES (423, 19, 104, 1.30);
INSERT INTO public.roster VALUES (545, 27, 104, 3.60);
INSERT INTO public.roster VALUES (568, 21, 104, 1.60);
INSERT INTO public.roster VALUES (121, 5, 122, 2.10);
INSERT INTO public.roster VALUES (552, 27, 122, 1.20);
INSERT INTO public.roster VALUES (569, 21, 122, 1.10);
INSERT INTO public.roster VALUES (154, 6, 122, 2.10);
INSERT INTO public.roster VALUES (122, 5, 126, 1.60);
INSERT INTO public.roster VALUES (155, 6, 126, 1.70);
INSERT INTO public.roster VALUES (188, 7, 126, 2.50);
INSERT INTO public.roster VALUES (221, 8, 126, 2.70);
INSERT INTO public.roster VALUES (402, 18, 126, 2.50);
INSERT INTO public.roster VALUES (425, 19, 126, 2.40);
INSERT INTO public.roster VALUES (579, 21, 8, 4.00);
INSERT INTO public.roster VALUES (168, 7, 8, 4.00);
INSERT INTO public.roster VALUES (422, 19, 99, 3.80);
INSERT INTO public.roster VALUES (455, 20, 99, 2.30);
INSERT INTO public.roster VALUES (544, 27, 99, 3.80);
INSERT INTO public.roster VALUES (577, 21, 99, 2.10);
INSERT INTO public.roster VALUES (182, 7, 99, 3.10);
INSERT INTO public.roster VALUES (427, 19, 1, 2.30);
INSERT INTO public.roster VALUES (456, 20, 1, 3.90);
INSERT INTO public.roster VALUES (549, 27, 1, 1.20);
INSERT INTO public.roster VALUES (578, 21, 1, 3.10);
INSERT INTO public.roster VALUES (134, 6, 1, 3.50);
INSERT INTO public.roster VALUES (167, 7, 1, 1.90);
INSERT INTO public.roster VALUES (405, 18, 8, 1.90);
INSERT INTO public.roster VALUES (553, 27, 8, 3.00);
INSERT INTO public.roster VALUES (102, 5, 8, 3.40);
INSERT INTO public.roster VALUES (201, 8, 8, 1.20);
INSERT INTO public.roster VALUES (407, 18, 28, 3.80);
INSERT INTO public.roster VALUES (433, 19, 28, 3.10);
INSERT INTO public.roster VALUES (458, 20, 28, 3.00);
INSERT INTO public.roster VALUES (555, 27, 28, 3.00);
INSERT INTO public.roster VALUES (580, 21, 28, 3.30);
INSERT INTO public.roster VALUES (415, 18, 146, 2.30);
INSERT INTO public.roster VALUES (436, 19, 146, 3.30);
INSERT INTO public.roster VALUES (459, 20, 146, 2.70);
INSERT INTO public.roster VALUES (558, 27, 146, 1.10);
INSERT INTO public.roster VALUES (581, 21, 146, 2.40);
INSERT INTO public.roster VALUES (159, 6, 146, 2.70);
INSERT INTO public.roster VALUES (192, 7, 146, 1.40);
INSERT INTO public.roster VALUES (225, 8, 146, 3.70);
INSERT INTO public.roster VALUES (126, 5, 146, 1.30);
INSERT INTO public.roster VALUES (437, 19, 161, 3.00);
INSERT INTO public.roster VALUES (460, 20, 161, 1.10);
INSERT INTO public.roster VALUES (559, 27, 161, 2.00);
INSERT INTO public.roster VALUES (582, 21, 161, 1.60);
INSERT INTO public.roster VALUES (160, 6, 161, 3.40);
INSERT INTO public.roster VALUES (193, 7, 161, 3.40);
INSERT INTO public.roster VALUES (336, 15, 73, 3.90);
INSERT INTO public.roster VALUES (369, 16, 73, 1.70);
INSERT INTO public.roster VALUES (479, 17, 75, 2.70);
INSERT INTO public.roster VALUES (337, 15, 75, 1.60);
INSERT INTO public.roster VALUES (338, 15, 86, 2.20);
INSERT INTO public.roster VALUES (371, 16, 86, 3.10);
INSERT INTO public.roster VALUES (339, 15, 89, 3.60);
INSERT INTO public.roster VALUES (372, 16, 89, 2.90);
INSERT INTO public.roster VALUES (481, 17, 89, 3.20);
INSERT INTO public.roster VALUES (307, 14, 92, 2.90);
INSERT INTO public.roster VALUES (482, 17, 92, 3.30);
INSERT INTO public.roster VALUES (308, 14, 107, 1.70);
INSERT INTO public.roster VALUES (341, 15, 107, 3.00);
INSERT INTO public.roster VALUES (483, 17, 107, 2.10);
INSERT INTO public.roster VALUES (309, 14, 112, 1.50);
INSERT INTO public.roster VALUES (375, 16, 112, 3.30);
INSERT INTO public.roster VALUES (310, 14, 114, 3.60);
INSERT INTO public.roster VALUES (343, 15, 114, 1.50);
INSERT INTO public.roster VALUES (376, 16, 114, 1.30);
INSERT INTO public.roster VALUES (311, 14, 118, 1.70);
INSERT INTO public.roster VALUES (344, 15, 118, 2.90);
INSERT INTO public.roster VALUES (377, 16, 118, 2.50);
INSERT INTO public.roster VALUES (312, 14, 119, 1.90);
INSERT INTO public.roster VALUES (345, 15, 119, 2.30);
INSERT INTO public.roster VALUES (378, 16, 119, 3.10);
INSERT INTO public.roster VALUES (487, 17, 119, 1.70);
INSERT INTO public.roster VALUES (313, 14, 120, 2.40);
INSERT INTO public.roster VALUES (346, 15, 120, 1.90);
INSERT INTO public.roster VALUES (379, 16, 120, 1.90);
INSERT INTO public.roster VALUES (314, 14, 124, 2.80);
INSERT INTO public.roster VALUES (347, 15, 124, 3.90);
INSERT INTO public.roster VALUES (380, 16, 124, 3.00);
INSERT INTO public.roster VALUES (489, 17, 124, 2.30);
INSERT INTO public.roster VALUES (348, 15, 128, 2.80);
INSERT INTO public.roster VALUES (316, 14, 130, 2.10);
INSERT INTO public.roster VALUES (382, 16, 130, 1.70);
INSERT INTO public.roster VALUES (491, 17, 130, 2.10);
INSERT INTO public.roster VALUES (350, 15, 135, 3.80);
INSERT INTO public.roster VALUES (383, 16, 135, 1.40);
INSERT INTO public.roster VALUES (492, 17, 135, 1.60);
INSERT INTO public.roster VALUES (351, 15, 140, 3.60);
INSERT INTO public.roster VALUES (384, 16, 140, 3.30);
INSERT INTO public.roster VALUES (493, 17, 140, 2.20);
INSERT INTO public.roster VALUES (319, 14, 155, 3.00);
INSERT INTO public.roster VALUES (592, 26, 97, 2.30);
INSERT INTO public.roster VALUES (533, 13, 199, 2.50);
INSERT INTO public.roster VALUES (593, 26, 199, 1.00);
INSERT INTO public.roster VALUES (287, 12, 199, 2.30);
INSERT INTO public.roster VALUES (49, 2, 199, 2.20);
INSERT INTO public.roster VALUES (74, 3, 199, 1.20);
INSERT INTO public.roster VALUES (99, 4, 199, 2.60);
INSERT INTO public.roster VALUES (263, 10, 144, 1.30);
INSERT INTO public.roster VALUES (240, 9, 144, 3.00);
INSERT INTO public.roster VALUES (518, 24, 144, 2.10);
INSERT INTO public.roster VALUES (535, 13, 144, 1.40);
INSERT INTO public.roster VALUES (594, 26, 144, 3.10);
INSERT INTO public.roster VALUES (89, 4, 144, 1.20);
INSERT INTO public.roster VALUES (508, 25, 186, 1.50);
INSERT INTO public.roster VALUES (595, 26, 186, 2.10);
INSERT INTO public.roster VALUES (275, 11, 186, 1.60);
INSERT INTO public.roster VALUES (21, 1, 186, 3.80);
INSERT INTO public.roster VALUES (58, 3, 60, 2.70);
INSERT INTO public.roster VALUES (529, 13, 60, 3.80);
INSERT INTO public.roster VALUES (590, 26, 60, 2.90);
INSERT INTO public.roster VALUES (238, 9, 54, 3.50);
INSERT INTO public.roster VALUES (253, 10, 54, 2.60);
INSERT INTO public.roster VALUES (269, 11, 54, 1.80);
INSERT INTO public.roster VALUES (506, 25, 54, 1.20);
INSERT INTO public.roster VALUES (282, 12, 54, 1.80);
INSERT INTO public.roster VALUES (7, 1, 54, 1.50);
INSERT INTO public.roster VALUES (57, 3, 54, 3.00);
INSERT INTO public.roster VALUES (517, 24, 54, 3.30);
INSERT INTO public.roster VALUES (530, 13, 54, 2.30);
INSERT INTO public.roster VALUES (591, 26, 54, 1.10);
INSERT INTO public.roster VALUES (507, 25, 97, 1.60);
INSERT INTO public.roster VALUES (254, 10, 97, 3.10);
INSERT INTO public.roster VALUES (11, 1, 97, 2.50);
INSERT INTO public.roster VALUES (36, 2, 97, 1.30);
INSERT INTO public.roster VALUES (61, 3, 97, 2.10);
INSERT INTO public.roster VALUES (258, 10, 186, 3.70);
INSERT INTO public.roster VALUES (286, 12, 186, 3.00);
INSERT INTO public.roster VALUES (96, 4, 186, 2.30);
INSERT INTO public.roster VALUES (509, 25, 74, 1.40);
INSERT INTO public.roster VALUES (536, 13, 74, 3.90);
INSERT INTO public.roster VALUES (596, 26, 74, 1.10);
INSERT INTO public.roster VALUES (60, 3, 74, 1.80);
INSERT INTO public.roster VALUES (490, 17, 128, 4.00);
INSERT INTO public.roster VALUES (349, 15, 130, 4.00);
INSERT INTO public.roster VALUES (317, 14, 135, 4.00);
INSERT INTO public.roster VALUES (318, 14, 140, 4.00);
INSERT INTO public.roster VALUES (353, 15, 156, 4.00);
INSERT INTO public.roster VALUES (386, 16, 156, 4.00);
INSERT INTO public.roster VALUES (418, 19, 69, 4.00);
INSERT INTO public.roster VALUES (576, 21, 69, 4.00);
INSERT INTO public.roster VALUES (176, 7, 69, 4.00);
INSERT INTO public.roster VALUES (396, 18, 99, 4.00);
INSERT INTO public.roster VALUES (101, 5, 1, 4.00);
INSERT INTO public.roster VALUES (200, 8, 1, 4.00);
INSERT INTO public.roster VALUES (431, 19, 8, 4.00);
INSERT INTO public.roster VALUES (457, 20, 8, 4.00);
INSERT INTO public.roster VALUES (135, 6, 8, 4.00);
INSERT INTO public.roster VALUES (203, 8, 28, 4.00);
INSERT INTO public.roster VALUES (104, 5, 28, 4.00);
INSERT INTO public.roster VALUES (137, 6, 28, 4.00);
INSERT INTO public.roster VALUES (170, 7, 28, 4.00);
INSERT INTO public.roster VALUES (127, 5, 161, 4.00);
INSERT INTO public.roster VALUES (226, 8, 161, 4.00);
INSERT INTO public.roster VALUES (439, 19, 167, 4.00);
INSERT INTO public.roster VALUES (583, 21, 167, 4.00);
INSERT INTO public.roster VALUES (227, 8, 167, 4.00);
INSERT INTO public.roster VALUES (411, 18, 180, 4.00);
INSERT INTO public.roster VALUES (462, 20, 180, 4.00);
INSERT INTO public.roster VALUES (584, 21, 180, 4.00);
INSERT INTO public.roster VALUES (196, 7, 180, 4.00);
INSERT INTO public.roster VALUES (229, 8, 180, 4.00);
INSERT INTO public.roster VALUES (463, 20, 188, 4.00);
INSERT INTO public.roster VALUES (132, 5, 188, 4.00);
INSERT INTO public.roster VALUES (586, 21, 142, 4.00);
INSERT INTO public.roster VALUES (465, 20, 170, 4.00);
INSERT INTO public.roster VALUES (85, 4, 74, 2.40);
INSERT INTO public.roster VALUES (10, 1, 74, 3.20);
INSERT INTO public.roster VALUES (35, 2, 74, 3.00);
INSERT INTO public.roster VALUES (534, 13, 154, 1.50);
INSERT INTO public.roster VALUES (18, 1, 154, 2.30);
INSERT INTO public.roster VALUES (43, 2, 154, 3.20);
INSERT INTO public.roster VALUES (279, 11, 154, 1.40);
INSERT INTO public.roster VALUES (292, 12, 154, 3.30);


--
-- TOC entry 3157 (class 0 OID 16798)
-- Dependencies: 225
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.status VALUES (1, 'current');
INSERT INTO public.status VALUES (2, 'hiatus');
INSERT INTO public.status VALUES (3, 'completed');
INSERT INTO public.status VALUES (4, 'unknown');


--
-- TOC entry 3159 (class 0 OID 16806)
-- Dependencies: 227
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.student VALUES (1, 201, '2017-09-14', 1);
INSERT INTO public.student VALUES (2, 202, '2017-08-19', 1);
INSERT INTO public.student VALUES (3, 203, '2018-04-17', 1);
INSERT INTO public.student VALUES (4, 204, '2017-07-10', 1);
INSERT INTO public.student VALUES (5, 205, '2017-08-15', 1);
INSERT INTO public.student VALUES (6, 206, '2018-08-10', 1);
INSERT INTO public.student VALUES (7, 207, '2018-11-24', 1);
INSERT INTO public.student VALUES (8, 208, '2017-12-08', 1);
INSERT INTO public.student VALUES (9, 209, '2018-11-10', 1);
INSERT INTO public.student VALUES (10, 210, '2018-11-06', 1);
INSERT INTO public.student VALUES (11, 211, '2018-09-27', 1);
INSERT INTO public.student VALUES (12, 212, '2018-07-01', 1);
INSERT INTO public.student VALUES (13, 213, '2018-10-30', 1);
INSERT INTO public.student VALUES (14, 214, '2017-06-25', 1);
INSERT INTO public.student VALUES (15, 215, '2018-06-18', 1);
INSERT INTO public.student VALUES (16, 216, '2018-12-22', 1);
INSERT INTO public.student VALUES (17, 217, '2018-01-08', 1);
INSERT INTO public.student VALUES (18, 218, '2019-04-20', 1);
INSERT INTO public.student VALUES (19, 219, '2018-11-04', 1);
INSERT INTO public.student VALUES (20, 220, '2018-02-07', 1);
INSERT INTO public.student VALUES (21, 221, '2017-07-22', 1);
INSERT INTO public.student VALUES (22, 222, '2019-01-19', 1);
INSERT INTO public.student VALUES (23, 223, '2017-11-25', 1);
INSERT INTO public.student VALUES (24, 224, '2018-10-25', 1);
INSERT INTO public.student VALUES (25, 225, '2019-05-27', 1);
INSERT INTO public.student VALUES (26, 226, '2019-01-24', 1);
INSERT INTO public.student VALUES (27, 227, '2018-02-07', 1);
INSERT INTO public.student VALUES (28, 228, '2017-10-11', 1);
INSERT INTO public.student VALUES (29, 229, '2018-11-18', 1);
INSERT INTO public.student VALUES (30, 230, '2017-10-21', 1);
INSERT INTO public.student VALUES (31, 231, '2019-01-29', 1);
INSERT INTO public.student VALUES (32, 232, '2017-11-03', 1);
INSERT INTO public.student VALUES (33, 233, '2017-09-14', 1);
INSERT INTO public.student VALUES (34, 234, '2018-02-03', 1);
INSERT INTO public.student VALUES (36, 236, '2018-01-03', 1);
INSERT INTO public.student VALUES (37, 237, '2018-10-27', 1);
INSERT INTO public.student VALUES (38, 238, '2017-09-03', 1);
INSERT INTO public.student VALUES (39, 239, '2018-06-01', 1);
INSERT INTO public.student VALUES (40, 240, '2018-03-14', 1);
INSERT INTO public.student VALUES (41, 241, '2018-09-29', 1);
INSERT INTO public.student VALUES (42, 242, '2018-08-29', 1);
INSERT INTO public.student VALUES (43, 243, '2019-01-02', 1);
INSERT INTO public.student VALUES (44, 244, '2019-02-15', 1);
INSERT INTO public.student VALUES (45, 245, '2018-08-19', 1);
INSERT INTO public.student VALUES (46, 246, '2018-12-03', 1);
INSERT INTO public.student VALUES (47, 247, '2018-11-20', 1);
INSERT INTO public.student VALUES (48, 248, '2018-06-17', 1);
INSERT INTO public.student VALUES (49, 249, '2017-11-01', 1);
INSERT INTO public.student VALUES (50, 250, '2019-03-17', 1);
INSERT INTO public.student VALUES (51, 251, '2018-05-22', 1);
INSERT INTO public.student VALUES (52, 252, '2019-06-08', 1);
INSERT INTO public.student VALUES (53, 253, '2018-12-31', 1);
INSERT INTO public.student VALUES (54, 254, '2017-08-27', 1);
INSERT INTO public.student VALUES (55, 255, '2018-02-10', 1);
INSERT INTO public.student VALUES (56, 256, '2018-06-04', 1);
INSERT INTO public.student VALUES (57, 257, '2018-06-22', 1);
INSERT INTO public.student VALUES (58, 258, '2019-01-03', 1);
INSERT INTO public.student VALUES (59, 259, '2018-02-11', 1);
INSERT INTO public.student VALUES (60, 260, '2017-08-04', 1);
INSERT INTO public.student VALUES (61, 261, '2018-07-16', 1);
INSERT INTO public.student VALUES (62, 262, '2018-03-09', 1);
INSERT INTO public.student VALUES (63, 263, '2019-02-10', 1);
INSERT INTO public.student VALUES (64, 264, '2018-11-25', 1);
INSERT INTO public.student VALUES (65, 265, '2018-09-15', 1);
INSERT INTO public.student VALUES (66, 266, '2019-03-22', 1);
INSERT INTO public.student VALUES (67, 267, '2018-09-27', 1);
INSERT INTO public.student VALUES (68, 268, '2018-10-12', 1);
INSERT INTO public.student VALUES (69, 269, '2017-10-15', 1);
INSERT INTO public.student VALUES (70, 270, '2018-01-14', 1);
INSERT INTO public.student VALUES (71, 271, '2018-11-11', 1);
INSERT INTO public.student VALUES (72, 272, '2017-06-25', 1);
INSERT INTO public.student VALUES (73, 273, '2018-03-30', 1);
INSERT INTO public.student VALUES (75, 275, '2018-03-02', 1);
INSERT INTO public.student VALUES (76, 276, '2018-05-31', 1);
INSERT INTO public.student VALUES (77, 277, '2018-10-30', 1);
INSERT INTO public.student VALUES (78, 278, '2018-10-11', 1);
INSERT INTO public.student VALUES (79, 279, '2017-12-19', 1);
INSERT INTO public.student VALUES (80, 280, '2019-05-06', 1);
INSERT INTO public.student VALUES (81, 281, '2017-09-30', 1);
INSERT INTO public.student VALUES (82, 282, '2018-10-07', 1);
INSERT INTO public.student VALUES (83, 283, '2017-10-02', 1);
INSERT INTO public.student VALUES (84, 284, '2019-02-27', 1);
INSERT INTO public.student VALUES (85, 285, '2017-11-23', 1);
INSERT INTO public.student VALUES (86, 286, '2018-03-20', 1);
INSERT INTO public.student VALUES (87, 287, '2019-02-09', 1);
INSERT INTO public.student VALUES (88, 288, '2018-07-25', 1);
INSERT INTO public.student VALUES (89, 289, '2018-03-29', 1);
INSERT INTO public.student VALUES (90, 290, '2019-01-11', 1);
INSERT INTO public.student VALUES (91, 291, '2017-10-02', 1);
INSERT INTO public.student VALUES (92, 292, '2018-03-20', 1);
INSERT INTO public.student VALUES (93, 293, '2018-05-24', 1);
INSERT INTO public.student VALUES (94, 294, '2019-03-30', 1);
INSERT INTO public.student VALUES (95, 295, '2018-07-15', 1);
INSERT INTO public.student VALUES (96, 296, '2018-09-29', 1);
INSERT INTO public.student VALUES (97, 297, '2017-08-11', 1);
INSERT INTO public.student VALUES (98, 298, '2018-07-28', 1);
INSERT INTO public.student VALUES (99, 299, '2017-12-08', 1);
INSERT INTO public.student VALUES (100, 300, '2017-11-06', 1);
INSERT INTO public.student VALUES (101, 301, '2019-04-21', 1);
INSERT INTO public.student VALUES (102, 302, '2019-03-13', 1);
INSERT INTO public.student VALUES (103, 303, '2018-08-14', 1);
INSERT INTO public.student VALUES (104, 304, '2017-10-13', 1);
INSERT INTO public.student VALUES (105, 305, '2018-05-25', 1);
INSERT INTO public.student VALUES (106, 306, '2019-03-26', 1);
INSERT INTO public.student VALUES (107, 307, '2018-03-10', 1);
INSERT INTO public.student VALUES (109, 309, '2018-11-20', 1);
INSERT INTO public.student VALUES (110, 310, '2018-04-26', 1);
INSERT INTO public.student VALUES (111, 311, '2019-06-08', 1);
INSERT INTO public.student VALUES (112, 312, '2018-04-08', 1);
INSERT INTO public.student VALUES (113, 313, '2019-04-04', 1);
INSERT INTO public.student VALUES (114, 314, '2018-03-25', 1);
INSERT INTO public.student VALUES (115, 315, '2017-10-26', 1);
INSERT INTO public.student VALUES (116, 316, '2019-05-30', 1);
INSERT INTO public.student VALUES (117, 317, '2017-11-16', 1);
INSERT INTO public.student VALUES (118, 318, '2018-02-12', 1);
INSERT INTO public.student VALUES (119, 319, '2018-03-07', 1);
INSERT INTO public.student VALUES (120, 320, '2018-01-29', 1);
INSERT INTO public.student VALUES (121, 321, '2019-06-08', 1);
INSERT INTO public.student VALUES (122, 322, '2017-09-11', 1);
INSERT INTO public.student VALUES (123, 323, '2018-07-28', 1);
INSERT INTO public.student VALUES (124, 324, '2018-04-01', 1);
INSERT INTO public.student VALUES (125, 325, '2019-03-13', 1);
INSERT INTO public.student VALUES (126, 326, '2017-11-03', 1);
INSERT INTO public.student VALUES (127, 327, '2019-04-12', 1);
INSERT INTO public.student VALUES (128, 328, '2018-04-07', 1);
INSERT INTO public.student VALUES (129, 329, '2018-12-21', 1);
INSERT INTO public.student VALUES (130, 330, '2018-03-16', 1);
INSERT INTO public.student VALUES (131, 331, '2017-10-06', 1);
INSERT INTO public.student VALUES (132, 332, '2017-12-26', 1);
INSERT INTO public.student VALUES (133, 333, '2019-02-06', 1);
INSERT INTO public.student VALUES (134, 334, '2018-12-30', 1);
INSERT INTO public.student VALUES (135, 335, '2018-01-12', 1);
INSERT INTO public.student VALUES (136, 336, '2017-08-08', 1);
INSERT INTO public.student VALUES (137, 337, '2018-11-23', 1);
INSERT INTO public.student VALUES (138, 338, '2019-03-12', 1);
INSERT INTO public.student VALUES (139, 339, '2018-10-19', 1);
INSERT INTO public.student VALUES (140, 340, '2018-02-15', 1);
INSERT INTO public.student VALUES (141, 341, '2018-07-25', 1);
INSERT INTO public.student VALUES (142, 342, '2017-10-08', 1);
INSERT INTO public.student VALUES (143, 343, '2019-03-07', 1);
INSERT INTO public.student VALUES (144, 344, '2017-07-12', 1);
INSERT INTO public.student VALUES (145, 345, '2017-08-10', 1);
INSERT INTO public.student VALUES (146, 346, '2017-09-04', 1);
INSERT INTO public.student VALUES (147, 347, '2018-07-04', 1);
INSERT INTO public.student VALUES (148, 348, '2018-09-18', 1);
INSERT INTO public.student VALUES (149, 349, '2018-08-04', 1);
INSERT INTO public.student VALUES (150, 350, '2018-08-13', 1);
INSERT INTO public.student VALUES (151, 351, '2017-08-04', 1);
INSERT INTO public.student VALUES (152, 352, '2017-07-22', 1);
INSERT INTO public.student VALUES (153, 353, '2018-12-14', 1);
INSERT INTO public.student VALUES (154, 354, '2017-07-01', 1);
INSERT INTO public.student VALUES (155, 355, '2018-01-05', 1);
INSERT INTO public.student VALUES (156, 356, '2018-02-15', 1);
INSERT INTO public.student VALUES (157, 357, '2019-05-15', 1);
INSERT INTO public.student VALUES (158, 358, '2018-10-22', 1);
INSERT INTO public.student VALUES (159, 359, '2018-04-08', 1);
INSERT INTO public.student VALUES (160, 360, '2019-05-21', 1);
INSERT INTO public.student VALUES (161, 361, '2017-12-11', 1);
INSERT INTO public.student VALUES (162, 362, '2018-10-25', 1);
INSERT INTO public.student VALUES (163, 363, '2018-01-17', 1);
INSERT INTO public.student VALUES (164, 364, '2018-10-09', 1);
INSERT INTO public.student VALUES (165, 365, '2019-05-12', 1);
INSERT INTO public.student VALUES (166, 366, '2019-03-05', 1);
INSERT INTO public.student VALUES (167, 367, '2017-09-04', 1);
INSERT INTO public.student VALUES (168, 368, '2018-11-19', 1);
INSERT INTO public.student VALUES (169, 369, '2018-05-05', 1);
INSERT INTO public.student VALUES (170, 370, '2017-10-06', 1);
INSERT INTO public.student VALUES (172, 372, '2019-04-21', 1);
INSERT INTO public.student VALUES (173, 373, '2018-09-18', 1);
INSERT INTO public.student VALUES (174, 374, '2018-12-02', 1);
INSERT INTO public.student VALUES (175, 375, '2018-08-28', 1);
INSERT INTO public.student VALUES (176, 376, '2018-05-10', 1);
INSERT INTO public.student VALUES (177, 377, '2018-12-06', 1);
INSERT INTO public.student VALUES (178, 378, '2018-11-27', 1);
INSERT INTO public.student VALUES (179, 379, '2018-07-24', 1);
INSERT INTO public.student VALUES (180, 380, '2017-10-26', 1);
INSERT INTO public.student VALUES (181, 381, '2018-09-16', 1);
INSERT INTO public.student VALUES (182, 382, '2018-10-01', 1);
INSERT INTO public.student VALUES (184, 384, '2019-02-27', 1);
INSERT INTO public.student VALUES (185, 385, '2018-12-31', 1);
INSERT INTO public.student VALUES (187, 387, '2017-09-12', 1);
INSERT INTO public.student VALUES (188, 388, '2017-09-11', 1);
INSERT INTO public.student VALUES (189, 389, '2018-06-29', 1);
INSERT INTO public.student VALUES (190, 390, '2018-04-08', 1);
INSERT INTO public.student VALUES (191, 391, '2018-02-21', 1);
INSERT INTO public.student VALUES (192, 392, '2018-12-31', 1);
INSERT INTO public.student VALUES (193, 393, '2017-12-01', 1);
INSERT INTO public.student VALUES (194, 394, '2018-10-20', 1);
INSERT INTO public.student VALUES (195, 395, '2018-02-02', 1);
INSERT INTO public.student VALUES (196, 396, '2017-07-07', 1);
INSERT INTO public.student VALUES (197, 397, '2018-10-20', 1);
INSERT INTO public.student VALUES (200, 400, '2017-07-07', 1);
INSERT INTO public.student VALUES (35, 235, '2017-07-11', 4);
INSERT INTO public.student VALUES (74, 274, '2017-06-18', 4);
INSERT INTO public.student VALUES (108, 308, '2017-06-17', 4);
INSERT INTO public.student VALUES (171, 371, '2017-07-27', 4);
INSERT INTO public.student VALUES (183, 383, '2017-08-22', 4);
INSERT INTO public.student VALUES (186, 386, '2017-07-02', 4);
INSERT INTO public.student VALUES (198, 398, '2017-08-16', 4);
INSERT INTO public.student VALUES (199, 399, '2017-06-30', 4);


--
-- TOC entry 3161 (class 0 OID 16811)
-- Dependencies: 229
-- Data for Name: substitution; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 198
-- Name: businessrule_businessrulekey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.businessrule_businessrulekey_seq', 16, true);


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 200
-- Name: certadmin_certadminkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.certadmin_certadminkey_seq', 4, true);


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 202
-- Name: certificate_certificatekey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.certificate_certificatekey_seq', 19, true);


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 205
-- Name: course_coursekey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_coursekey_seq', 28, true);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 207
-- Name: coursesection_sectionkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coursesection_sectionkey_seq', 115, true);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 209
-- Name: instructionalarea_instructionalareakey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructionalarea_instructionalareakey_seq', 6, true);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 211
-- Name: instructor_instructorkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_instructorkey_seq', 11, true);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 214
-- Name: loginhistory_loginhistorykey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loginhistory_loginhistorykey_seq', 1, false);


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 216
-- Name: logintable_logintablekey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logintable_logintablekey_seq', 214, true);


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 218
-- Name: person_personkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_personkey_seq', 404, true);


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 220
-- Name: pricehistory_pricehistorykey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pricehistory_pricehistorykey_seq', 3, true);


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 222
-- Name: quarter_quarterkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quarter_quarterkey_seq', 4, true);


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 224
-- Name: roster_rosterkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roster_rosterkey_seq', 2005, true);


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 226
-- Name: status_statuskey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_statuskey_seq', 4, true);


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 228
-- Name: student_studentkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_studentkey_seq', 200, true);


--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 230
-- Name: substitution_substitutionkey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.substitution_substitutionkey_seq', 1, false);


--
-- TOC entry 2948 (class 2606 OID 16833)
-- Name: businessrule businessrule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businessrule
    ADD CONSTRAINT businessrule_pkey PRIMARY KEY (businessrulekey);


--
-- TOC entry 2950 (class 2606 OID 16835)
-- Name: certadmin certadmin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certadmin
    ADD CONSTRAINT certadmin_pkey PRIMARY KEY (certadminkey);


--
-- TOC entry 2952 (class 2606 OID 16837)
-- Name: certificate certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificate
    ADD CONSTRAINT certificate_pkey PRIMARY KEY (certificatekey);


--
-- TOC entry 2956 (class 2606 OID 16839)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (coursekey);


--
-- TOC entry 2958 (class 2606 OID 16841)
-- Name: coursesection coursesection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coursesection
    ADD CONSTRAINT coursesection_pkey PRIMARY KEY (sectionkey);


--
-- TOC entry 2960 (class 2606 OID 16843)
-- Name: instructionalarea instructionalarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructionalarea
    ADD CONSTRAINT instructionalarea_pkey PRIMARY KEY (instructionalareakey);


--
-- TOC entry 2962 (class 2606 OID 16845)
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (instructorkey);


--
-- TOC entry 2966 (class 2606 OID 16847)
-- Name: loginhistory loginhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loginhistory
    ADD CONSTRAINT loginhistory_pkey PRIMARY KEY (loginhistorykey);


--
-- TOC entry 2968 (class 2606 OID 16849)
-- Name: logintable logintable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logintable
    ADD CONSTRAINT logintable_pkey PRIMARY KEY (logintablekey);


--
-- TOC entry 2970 (class 2606 OID 16851)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (personkey);


--
-- TOC entry 2954 (class 2606 OID 16853)
-- Name: certificatecourse pk_certificatecourse; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificatecourse
    ADD CONSTRAINT pk_certificatecourse PRIMARY KEY (certificatekey, coursekey);


--
-- TOC entry 2964 (class 2606 OID 16855)
-- Name: instructorarea pk_instructorarea; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructorarea
    ADD CONSTRAINT pk_instructorarea PRIMARY KEY (instructionalareakey, instructorkey);


--
-- TOC entry 2974 (class 2606 OID 16857)
-- Name: pricehistory pricehistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricehistory
    ADD CONSTRAINT pricehistory_pkey PRIMARY KEY (pricehistorykey);


--
-- TOC entry 2976 (class 2606 OID 16859)
-- Name: quarter quarter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quarter
    ADD CONSTRAINT quarter_pkey PRIMARY KEY (quarterkey);


--
-- TOC entry 2978 (class 2606 OID 16861)
-- Name: roster roster_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roster
    ADD CONSTRAINT roster_pkey PRIMARY KEY (rosterkey);


--
-- TOC entry 2980 (class 2606 OID 16863)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (statuskey);


--
-- TOC entry 2982 (class 2606 OID 16865)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (studentkey);


--
-- TOC entry 2984 (class 2606 OID 16867)
-- Name: substitution substitution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.substitution
    ADD CONSTRAINT substitution_pkey PRIMARY KEY (substitutionkey);


--
-- TOC entry 2972 (class 2606 OID 16869)
-- Name: person unique_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- TOC entry 2985 (class 2606 OID 16870)
-- Name: certadmin certadmin_personkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certadmin
    ADD CONSTRAINT certadmin_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);


--
-- TOC entry 2986 (class 2606 OID 16875)
-- Name: certadmin certadmin_statuskey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certadmin
    ADD CONSTRAINT certadmin_statuskey_fkey FOREIGN KEY (statuskey) REFERENCES public.status(statuskey);


--
-- TOC entry 2987 (class 2606 OID 16880)
-- Name: certificatecourse certificatecourse_certificatekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificatecourse
    ADD CONSTRAINT certificatecourse_certificatekey_fkey FOREIGN KEY (certificatekey) REFERENCES public.certificate(certificatekey);


--
-- TOC entry 2988 (class 2606 OID 16885)
-- Name: certificatecourse certificatecourse_coursekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificatecourse
    ADD CONSTRAINT certificatecourse_coursekey_fkey FOREIGN KEY (coursekey) REFERENCES public.course(coursekey);


--
-- TOC entry 2989 (class 2606 OID 16890)
-- Name: coursesection coursesection_coursekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coursesection
    ADD CONSTRAINT coursesection_coursekey_fkey FOREIGN KEY (coursekey) REFERENCES public.course(coursekey);


--
-- TOC entry 2990 (class 2606 OID 16895)
-- Name: coursesection coursesection_instructorkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coursesection
    ADD CONSTRAINT coursesection_instructorkey_fkey FOREIGN KEY (instructorkey) REFERENCES public.instructor(instructorkey);


--
-- TOC entry 2991 (class 2606 OID 16900)
-- Name: coursesection fk_price; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coursesection
    ADD CONSTRAINT fk_price FOREIGN KEY (pricehistorykey) REFERENCES public.pricehistory(pricehistorykey);


--
-- TOC entry 2992 (class 2606 OID 16905)
-- Name: coursesection fk_quarter; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coursesection
    ADD CONSTRAINT fk_quarter FOREIGN KEY (quarterkey) REFERENCES public.quarter(quarterkey);


--
-- TOC entry 2993 (class 2606 OID 16910)
-- Name: instructor instructor_personkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);


--
-- TOC entry 2994 (class 2606 OID 16915)
-- Name: instructor instructor_statuskey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_statuskey_fkey FOREIGN KEY (statuskey) REFERENCES public.status(statuskey);


--
-- TOC entry 2995 (class 2606 OID 16920)
-- Name: instructorarea instructorarea_instructionalareakey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructorarea
    ADD CONSTRAINT instructorarea_instructionalareakey_fkey FOREIGN KEY (instructionalareakey) REFERENCES public.instructionalarea(instructionalareakey);


--
-- TOC entry 2996 (class 2606 OID 16925)
-- Name: instructorarea instructorarea_instructorkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructorarea
    ADD CONSTRAINT instructorarea_instructorkey_fkey FOREIGN KEY (instructorkey) REFERENCES public.instructor(instructorkey);


--
-- TOC entry 2997 (class 2606 OID 16930)
-- Name: loginhistory loginhistory_logintablekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loginhistory
    ADD CONSTRAINT loginhistory_logintablekey_fkey FOREIGN KEY (logintablekey) REFERENCES public.logintable(logintablekey);


--
-- TOC entry 2998 (class 2606 OID 16935)
-- Name: logintable logintable_personkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logintable
    ADD CONSTRAINT logintable_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);


--
-- TOC entry 2999 (class 2606 OID 16940)
-- Name: roster roster_sectionkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roster
    ADD CONSTRAINT roster_sectionkey_fkey FOREIGN KEY (sectionkey) REFERENCES public.coursesection(sectionkey);


--
-- TOC entry 3000 (class 2606 OID 16945)
-- Name: roster roster_studentkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roster
    ADD CONSTRAINT roster_studentkey_fkey FOREIGN KEY (studentkey) REFERENCES public.student(studentkey);


--
-- TOC entry 3001 (class 2606 OID 16950)
-- Name: student student_personkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_personkey_fkey FOREIGN KEY (personkey) REFERENCES public.person(personkey);


--
-- TOC entry 3002 (class 2606 OID 16955)
-- Name: student student_statuskey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_statuskey_fkey FOREIGN KEY (statuskey) REFERENCES public.status(statuskey);


--
-- TOC entry 3003 (class 2606 OID 16960)
-- Name: substitution substitution_certadminkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.substitution
    ADD CONSTRAINT substitution_certadminkey_fkey FOREIGN KEY (certadminkey) REFERENCES public.certadmin(certadminkey);


--
-- TOC entry 3004 (class 2606 OID 16965)
-- Name: substitution substitution_certificatekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.substitution
    ADD CONSTRAINT substitution_certificatekey_fkey FOREIGN KEY (certificatekey) REFERENCES public.certificate(certificatekey);


--
-- TOC entry 3005 (class 2606 OID 16970)
-- Name: substitution substitution_coursekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.substitution
    ADD CONSTRAINT substitution_coursekey_fkey FOREIGN KEY (coursekey) REFERENCES public.course(coursekey);


--
-- TOC entry 3006 (class 2606 OID 16975)
-- Name: substitution substitution_studentkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.substitution
    ADD CONSTRAINT substitution_studentkey_fkey FOREIGN KEY (studentkey) REFERENCES public.student(studentkey);


--
-- TOC entry 3007 (class 2606 OID 16980)
-- Name: substitution substitution_substitutekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.substitution
    ADD CONSTRAINT substitution_substitutekey_fkey FOREIGN KEY (substitutekey) REFERENCES public.course(coursekey);


-- Completed on 2019-01-22 20:32:58 PST

--
-- PostgreSQL database dump complete
--

