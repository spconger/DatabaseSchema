--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.3

-- Started on 2020-09-18 14:34:36

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
-- TOC entry 214 (class 1259 OID 28453)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    addressid integer NOT NULL,
    personid integer,
    address1 text,
    address2 text,
    city text DEFAULT 'Seattle'::text,
    state character(2) DEFAULT 'WA'::bpchar,
    postalcode text NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 28451)
-- Name: address_addressid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_addressid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_addressid_seq OWNER TO postgres;

--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 213
-- Name: address_addressid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_addressid_seq OWNED BY public.address.addressid;


--
-- TOC entry 205 (class 1259 OID 28388)
-- Name: coopmember; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coopmember (
    memberid integer NOT NULL,
    personid integer,
    lastrenewed date NOT NULL
);


ALTER TABLE public.coopmember OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 28386)
-- Name: coopmember_memberid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coopmember_memberid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coopmember_memberid_seq OWNER TO postgres;

--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 204
-- Name: coopmember_memberid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coopmember_memberid_seq OWNED BY public.coopmember.memberid;


--
-- TOC entry 209 (class 1259 OID 28412)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employeeid integer NOT NULL,
    personid integer,
    startdate date NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 28410)
-- Name: employee_employeeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employeeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employeeid_seq OWNER TO postgres;

--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 208
-- Name: employee_employeeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employeeid_seq OWNED BY public.employee.employeeid;


--
-- TOC entry 210 (class 1259 OID 28423)
-- Name: employeejob; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employeejob (
    employeeid integer NOT NULL,
    jobtypeid integer NOT NULL
);


ALTER TABLE public.employeejob OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 28471)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    inventoryid integer NOT NULL,
    supplierid integer,
    entrydate date NOT NULL,
    description text NOT NULL,
    units text NOT NULL,
    priceperunit numeric NOT NULL,
    quantity integer NOT NULL,
    expirationdate date NOT NULL,
    wastage integer
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 28469)
-- Name: inventory_inventoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_inventoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_inventoryid_seq OWNER TO postgres;

--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 215
-- Name: inventory_inventoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_inventoryid_seq OWNED BY public.inventory.inventoryid;


--
-- TOC entry 207 (class 1259 OID 28401)
-- Name: jobtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobtype (
    jobtypeid integer NOT NULL,
    typename text NOT NULL,
    description text
);


ALTER TABLE public.jobtype OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 28399)
-- Name: jobtype_jobtypeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobtype_jobtypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobtype_jobtypeid_seq OWNER TO postgres;

--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 206
-- Name: jobtype_jobtypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobtype_jobtypeid_seq OWNED BY public.jobtype.jobtypeid;


--
-- TOC entry 203 (class 1259 OID 28376)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    personid integer NOT NULL,
    lastname text NOT NULL,
    firstname text,
    email text NOT NULL,
    phone text,
    dateadded timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 28374)
-- Name: person_personid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_personid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_personid_seq OWNER TO postgres;

--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 202
-- Name: person_personid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_personid_seq OWNED BY public.person.personid;


--
-- TOC entry 218 (class 1259 OID 28487)
-- Name: purchase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase (
    purchaseid integer NOT NULL,
    purchasedate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    supplierid integer,
    employeeid integer
);


ALTER TABLE public.purchase OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 28485)
-- Name: purchase_purchaseid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_purchaseid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_purchaseid_seq OWNER TO postgres;

--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 217
-- Name: purchase_purchaseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_purchaseid_seq OWNED BY public.purchase.purchaseid;


--
-- TOC entry 220 (class 1259 OID 28506)
-- Name: purchasedetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchasedetail (
    purchasedetailid integer NOT NULL,
    purchaseid integer,
    itemdescription text NOT NULL,
    units text NOT NULL,
    quantity integer NOT NULL,
    purchaseprice numeric NOT NULL
);


ALTER TABLE public.purchasedetail OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 28504)
-- Name: purchasedetail_purchasedetailid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchasedetail_purchasedetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchasedetail_purchasedetailid_seq OWNER TO postgres;

--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 219
-- Name: purchasedetail_purchasedetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchasedetail_purchasedetailid_seq OWNED BY public.purchasedetail.purchasedetailid;


--
-- TOC entry 222 (class 1259 OID 28522)
-- Name: sale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale (
    saleid integer NOT NULL,
    memberid integer,
    employeeid integer,
    saledatetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sale OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 28520)
-- Name: sale_saleid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_saleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_saleid_seq OWNER TO postgres;

--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 221
-- Name: sale_saleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_saleid_seq OWNED BY public.sale.saleid;


--
-- TOC entry 224 (class 1259 OID 28541)
-- Name: saledetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.saledetail (
    saledetailid integer NOT NULL,
    saleid integer,
    inventoryid integer,
    quantity integer NOT NULL,
    discountpercent numeric DEFAULT 0
);


ALTER TABLE public.saledetail OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 28539)
-- Name: saledetail_saledetailid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.saledetail_saledetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saledetail_saledetailid_seq OWNER TO postgres;

--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 223
-- Name: saledetail_saledetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.saledetail_saledetailid_seq OWNED BY public.saledetail.saledetailid;


--
-- TOC entry 212 (class 1259 OID 28440)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    supplierid integer NOT NULL,
    personid integer,
    lastupdated date NOT NULL
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 28438)
-- Name: supplier_supplierid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_supplierid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_supplierid_seq OWNER TO postgres;

--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 211
-- Name: supplier_supplierid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_supplierid_seq OWNED BY public.supplier.supplierid;


--
-- TOC entry 2763 (class 2604 OID 28456)
-- Name: address addressid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN addressid SET DEFAULT nextval('public.address_addressid_seq'::regclass);


--
-- TOC entry 2759 (class 2604 OID 28391)
-- Name: coopmember memberid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coopmember ALTER COLUMN memberid SET DEFAULT nextval('public.coopmember_memberid_seq'::regclass);


--
-- TOC entry 2761 (class 2604 OID 28415)
-- Name: employee employeeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employeeid SET DEFAULT nextval('public.employee_employeeid_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 28474)
-- Name: inventory inventoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN inventoryid SET DEFAULT nextval('public.inventory_inventoryid_seq'::regclass);


--
-- TOC entry 2760 (class 2604 OID 28404)
-- Name: jobtype jobtypeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobtype ALTER COLUMN jobtypeid SET DEFAULT nextval('public.jobtype_jobtypeid_seq'::regclass);


--
-- TOC entry 2757 (class 2604 OID 28379)
-- Name: person personid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN personid SET DEFAULT nextval('public.person_personid_seq'::regclass);


--
-- TOC entry 2767 (class 2604 OID 28490)
-- Name: purchase purchaseid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase ALTER COLUMN purchaseid SET DEFAULT nextval('public.purchase_purchaseid_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 28509)
-- Name: purchasedetail purchasedetailid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchasedetail ALTER COLUMN purchasedetailid SET DEFAULT nextval('public.purchasedetail_purchasedetailid_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 28525)
-- Name: sale saleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale ALTER COLUMN saleid SET DEFAULT nextval('public.sale_saleid_seq'::regclass);


--
-- TOC entry 2772 (class 2604 OID 28544)
-- Name: saledetail saledetailid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saledetail ALTER COLUMN saledetailid SET DEFAULT nextval('public.saledetail_saledetailid_seq'::regclass);


--
-- TOC entry 2762 (class 2604 OID 28443)
-- Name: supplier supplierid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier ALTER COLUMN supplierid SET DEFAULT nextval('public.supplier_supplierid_seq'::regclass);


--
-- TOC entry 2950 (class 0 OID 28453)
-- Dependencies: 214
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address VALUES (1, 1, NULL, '120 Broadway', 'Seattle', 'WA', '98122');
INSERT INTO public.address VALUES (2, 2, NULL, '300 S Pine', 'Seattle', 'WA', '98121');
INSERT INTO public.address VALUES (3, 3, NULL, '122 Market', 'Seattle', 'WA', '98120');
INSERT INTO public.address VALUES (4, 4, NULL, '3802 Queen annd', 'Seattle', 'WA', '98123');
INSERT INTO public.address VALUES (5, 5, NULL, '152 Elm Street', 'Seattle', 'WA', '98221');
INSERT INTO public.address VALUES (6, 6, NULL, '1303 8th Street', 'Bellevue', 'WA', '98321');
INSERT INTO public.address VALUES (7, 7, NULL, '333 Pike', 'Seattle', 'WA', '98122');
INSERT INTO public.address VALUES (8, 9, NULL, '404 Loftin Avenue', 'Seattle', 'WA', '98120');
INSERT INTO public.address VALUES (9, 10, 'South Puget Farms', '132 West Merchant', 'Olympia', 'WA', '98112');
INSERT INTO public.address VALUES (10, 10, 'South Puget Farms', '2020 Capital Blvd', 'Olympia', 'WA', '98112');


--
-- TOC entry 2941 (class 0 OID 28388)
-- Dependencies: 205
-- Data for Name: coopmember; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.coopmember VALUES (1, 1, '2019-04-25');
INSERT INTO public.coopmember VALUES (2, 2, '2019-04-25');
INSERT INTO public.coopmember VALUES (3, 3, '2019-05-01');
INSERT INTO public.coopmember VALUES (4, 4, '2019-05-06');
INSERT INTO public.coopmember VALUES (5, 5, '2020-08-15');
INSERT INTO public.coopmember VALUES (6, 6, '2020-08-16');
INSERT INTO public.coopmember VALUES (7, 7, '2020-09-01');
INSERT INTO public.coopmember VALUES (8, 8, '2020-09-10');
INSERT INTO public.coopmember VALUES (9, 9, '2020-09-11');


--
-- TOC entry 2945 (class 0 OID 28412)
-- Dependencies: 209
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee VALUES (1, 3, '2020-01-01');
INSERT INTO public.employee VALUES (2, 8, '2020-09-15');
INSERT INTO public.employee VALUES (3, 1, '2020-09-01');


--
-- TOC entry 2946 (class 0 OID 28423)
-- Dependencies: 210
-- Data for Name: employeejob; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employeejob VALUES (1, 1);
INSERT INTO public.employeejob VALUES (2, 2);
INSERT INTO public.employeejob VALUES (3, 3);


--
-- TOC entry 2952 (class 0 OID 28471)
-- Dependencies: 216
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inventory VALUES (1, 1, '2020-09-20', 'Red Delicious apples', 'lbs', 1.25, 20, '2020-11-10', NULL);
INSERT INTO public.inventory VALUES (2, 1, '2020-09-20', 'Blackberries', 'lbs', 3.25, 4, '2020-10-01', NULL);
INSERT INTO public.inventory VALUES (3, 1, '2020-09-20', 'Tomatoes', 'lbs', 1.50, 12, '2020-09-30', NULL);
INSERT INTO public.inventory VALUES (4, 2, '2020-09-21', 'Wheat Flour', '5 lb bags', 2.25, 20, '2020-12-05', NULL);
INSERT INTO public.inventory VALUES (5, 2, '2020-09-21', 'Zucchinis', 'lbs', 1.15, 15, '2020-10-21', NULL);
INSERT INTO public.inventory VALUES (6, 2, '2020-09-21', 'Sunflower seed', 'lbs', 5.00, 7, '2021-01-15', NULL);
INSERT INTO public.inventory VALUES (7, 3, '2020-09-23', 'Wheat bread', 'loaves', 4.50, 5, '2020-10-13', NULL);


--
-- TOC entry 2943 (class 0 OID 28401)
-- Dependencies: 207
-- Data for Name: jobtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.jobtype VALUES (1, 'Supervisor', 'Controls daily operations. Provided with a Salary');
INSERT INTO public.jobtype VALUES (2, 'Assistant', 'Assists supervisor. Paid hourly');
INSERT INTO public.jobtype VALUES (3, 'Volunteer', 'Volunteer, paid in 5% discount');


--
-- TOC entry 2939 (class 0 OID 28376)
-- Dependencies: 203
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person VALUES (1, 'Lowe', 'George', 'glowe@msn.com', '2065551234', '2019-04-25 00:00:00');
INSERT INTO public.person VALUES (2, 'Nelson', 'Sue', 'nelson@hotmai.com', '2065552212', '2019-04-25 00:00:00');
INSERT INTO public.person VALUES (3, 'Rogers', 'Lynn', 'lynn.rogers@gmail.com', '2065551212', '2019-05-01 00:00:00');
INSERT INTO public.person VALUES (4, 'Brown', 'Susan', 'suebrown@gmail.com', '2065552010', '2019-05-06 00:00:00');
INSERT INTO public.person VALUES (5, 'Cotton', 'Jeff', 'jeffcotton@cotton.org', '2065554320', '2020-08-15 00:00:00');
INSERT INTO public.person VALUES (6, 'Bently', 'Peter', 'bentlyp@yahoo.com', '2065551290', '2020-08-16 00:00:00');
INSERT INTO public.person VALUES (7, 'Lawrence', 'Troy', 'LawrenceOfTroy@gmail.com', '2065553354', '2020-09-01 00:00:00');
INSERT INTO public.person VALUES (8, 'Hahn', 'Sue', 'suehahn@liberty.com', '2065551200', '2020-09-10 00:00:00');
INSERT INTO public.person VALUES (9, 'Johnson', 'Sebastian', 'sb@johnson.org', '2065553212', '2020-09-11 00:00:00');
INSERT INTO public.person VALUES (10, 'Smith', 'Don', 'spg@southpugetfarms.com', '2065552500', '2020-09-10 00:00:00');


--
-- TOC entry 2954 (class 0 OID 28487)
-- Dependencies: 218
-- Data for Name: purchase; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.purchase VALUES (1, '2020-09-20 00:00:00', 1, 1);
INSERT INTO public.purchase VALUES (2, '2020-09-21 00:00:00', 2, 3);
INSERT INTO public.purchase VALUES (3, '2020-09-21 00:00:00', 3, 1);


--
-- TOC entry 2956 (class 0 OID 28506)
-- Dependencies: 220
-- Data for Name: purchasedetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.purchasedetail VALUES (1, 1, 'Red delicous apples', 'lbs', 20, 15.05);
INSERT INTO public.purchasedetail VALUES (2, 1, 'Black Berries', 'lbs', 4, 8.50);
INSERT INTO public.purchasedetail VALUES (3, 1, 'large tomatoes', 'lbs', 12, 12.00);
INSERT INTO public.purchasedetail VALUES (4, 2, 'Wheat Flour', '5 lb bags', 20, 20.00);
INSERT INTO public.purchasedetail VALUES (5, 2, 'Zuchinni', 'lbs', 15, 10.00);
INSERT INTO public.purchasedetail VALUES (6, 2, 'Sunflower seeds', 'lbs', 7, 21.30);
INSERT INTO public.purchasedetail VALUES (7, 3, 'Seed Bread', 'loaves', 5, 18.00);


--
-- TOC entry 2958 (class 0 OID 28522)
-- Dependencies: 222
-- Data for Name: sale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sale VALUES (1, 7, 2, '2020-09-22 00:00:00');
INSERT INTO public.sale VALUES (2, 1, 1, '20202-09-22 00:00:00');
INSERT INTO public.sale VALUES (3, 9, 1, '20202-09-23 00:00:00');


--
-- TOC entry 2960 (class 0 OID 28541)
-- Dependencies: 224
-- Data for Name: saledetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.saledetail VALUES (1, 1, 1, 3, 0);
INSERT INTO public.saledetail VALUES (2, 1, 2, 1, 0);
INSERT INTO public.saledetail VALUES (3, 1, 5, 2, 0);
INSERT INTO public.saledetail VALUES (4, 2, 7, 2, 0.05);
INSERT INTO public.saledetail VALUES (5, 3, 4, 1, 0);
INSERT INTO public.saledetail VALUES (6, 3, 6, 1, 0);
INSERT INTO public.saledetail VALUES (7, 3, 2, 1, 0);


--
-- TOC entry 2948 (class 0 OID 28440)
-- Dependencies: 212
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.supplier VALUES (1, 5, '2020-08-15');
INSERT INTO public.supplier VALUES (2, 10, '2019-09-10');
INSERT INTO public.supplier VALUES (3, 4, '2020-06-05');


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 213
-- Name: address_addressid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_addressid_seq', 10, true);


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 204
-- Name: coopmember_memberid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coopmember_memberid_seq', 9, true);


--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 208
-- Name: employee_employeeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employeeid_seq', 3, true);


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 215
-- Name: inventory_inventoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_inventoryid_seq', 7, true);


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 206
-- Name: jobtype_jobtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobtype_jobtypeid_seq', 3, true);


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 202
-- Name: person_personid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_personid_seq', 10, true);


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 217
-- Name: purchase_purchaseid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_purchaseid_seq', 3, true);


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 219
-- Name: purchasedetail_purchasedetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchasedetail_purchasedetailid_seq', 7, true);


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 221
-- Name: sale_saleid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_saleid_seq', 3, true);


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 223
-- Name: saledetail_saledetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.saledetail_saledetailid_seq', 7, true);


--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 211
-- Name: supplier_supplierid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_supplierid_seq', 3, true);


--
-- TOC entry 2787 (class 2606 OID 28463)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (addressid);


--
-- TOC entry 2777 (class 2606 OID 28393)
-- Name: coopmember coopmember_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coopmember
    ADD CONSTRAINT coopmember_pkey PRIMARY KEY (memberid);


--
-- TOC entry 2781 (class 2606 OID 28417)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employeeid);


--
-- TOC entry 2783 (class 2606 OID 28427)
-- Name: employeejob employeejob_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeejob
    ADD CONSTRAINT employeejob_pkey PRIMARY KEY (employeeid, jobtypeid);


--
-- TOC entry 2789 (class 2606 OID 28479)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventoryid);


--
-- TOC entry 2779 (class 2606 OID 28409)
-- Name: jobtype jobtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobtype
    ADD CONSTRAINT jobtype_pkey PRIMARY KEY (jobtypeid);


--
-- TOC entry 2775 (class 2606 OID 28385)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (personid);


--
-- TOC entry 2791 (class 2606 OID 28493)
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (purchaseid);


--
-- TOC entry 2793 (class 2606 OID 28514)
-- Name: purchasedetail purchasedetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchasedetail
    ADD CONSTRAINT purchasedetail_pkey PRIMARY KEY (purchasedetailid);


--
-- TOC entry 2795 (class 2606 OID 28528)
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (saleid);


--
-- TOC entry 2797 (class 2606 OID 28550)
-- Name: saledetail saledetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saledetail
    ADD CONSTRAINT saledetail_pkey PRIMARY KEY (saledetailid);


--
-- TOC entry 2785 (class 2606 OID 28445)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplierid);


--
-- TOC entry 2803 (class 2606 OID 28464)
-- Name: address address_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_personid_fkey FOREIGN KEY (personid) REFERENCES public.person(personid);


--
-- TOC entry 2798 (class 2606 OID 28394)
-- Name: coopmember coopmember_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coopmember
    ADD CONSTRAINT coopmember_personid_fkey FOREIGN KEY (personid) REFERENCES public.person(personid);


--
-- TOC entry 2799 (class 2606 OID 28418)
-- Name: employee employee_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_personid_fkey FOREIGN KEY (personid) REFERENCES public.person(personid);


--
-- TOC entry 2800 (class 2606 OID 28428)
-- Name: employeejob employeejob_employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeejob
    ADD CONSTRAINT employeejob_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employee(employeeid);


--
-- TOC entry 2801 (class 2606 OID 28433)
-- Name: employeejob employeejob_jobtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeejob
    ADD CONSTRAINT employeejob_jobtypeid_fkey FOREIGN KEY (jobtypeid) REFERENCES public.jobtype(jobtypeid);


--
-- TOC entry 2804 (class 2606 OID 28480)
-- Name: inventory inventory_supplierid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_supplierid_fkey FOREIGN KEY (supplierid) REFERENCES public.supplier(supplierid);


--
-- TOC entry 2806 (class 2606 OID 28499)
-- Name: purchase purchase_employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employee(employeeid);


--
-- TOC entry 2805 (class 2606 OID 28494)
-- Name: purchase purchase_supplierid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_supplierid_fkey FOREIGN KEY (supplierid) REFERENCES public.supplier(supplierid);


--
-- TOC entry 2807 (class 2606 OID 28515)
-- Name: purchasedetail purchasedetail_purchaseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchasedetail
    ADD CONSTRAINT purchasedetail_purchaseid_fkey FOREIGN KEY (purchaseid) REFERENCES public.purchase(purchaseid);


--
-- TOC entry 2809 (class 2606 OID 28534)
-- Name: sale sale_employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employee(employeeid);


--
-- TOC entry 2808 (class 2606 OID 28529)
-- Name: sale sale_memberid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_memberid_fkey FOREIGN KEY (memberid) REFERENCES public.coopmember(memberid);


--
-- TOC entry 2811 (class 2606 OID 28556)
-- Name: saledetail saledetail_inventoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saledetail
    ADD CONSTRAINT saledetail_inventoryid_fkey FOREIGN KEY (inventoryid) REFERENCES public.inventory(inventoryid);


--
-- TOC entry 2810 (class 2606 OID 28551)
-- Name: saledetail saledetail_saleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saledetail
    ADD CONSTRAINT saledetail_saleid_fkey FOREIGN KEY (saleid) REFERENCES public.sale(saleid);


--
-- TOC entry 2802 (class 2606 OID 28446)
-- Name: supplier supplier_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_personid_fkey FOREIGN KEY (personid) REFERENCES public.person(personid);


-- Completed on 2020-09-18 14:34:36

--
-- PostgreSQL database dump complete
--

