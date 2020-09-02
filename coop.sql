/*This is the script for the Farm Fresh Co-op
database */
CREATE TABLE person
(
	personid serial primary key,
	lastname text not null,
	firstname text,
	email text not null,
	phone text,
    dateadded timestamp default current_timestamp
);

CREATE TABLE coopmember
(
	memberid serial primary key,
	personid integer references person(personid),
	lastRenewed Date not null
);

CREATE TABLE jobtype
(
	jobtypeid serial primary key,
	typename text not null,
	description text
);

CREATE TABLE employee
(
	employeeid serial primary key,
	personid integer references person(personid),
    startdate date not null
);

--linking table to resolve many-to-many
--in which each employee can hold
--many jobs
CREATE TABLE employeeJob
(
	employeeid integer references employee(employeid),
	jobtypeid integer references jobtype(jobtypeid),
	primary key(employeeid, jobtypeid)
);

CREATE TABLE supplier
(
	supplierid serial primary key,
	personid integer references person(personid),
	lastupdated date not null
);

CREATE TABLE address
(
    addressid serial primary key,
	personid integer references person(personid),
	address1 text,
	address2 text,
	city text default 'Seattle',
	state char(2) default 'WA',
	postalcode text not null
);

CREATE TABLE Inventory
(
    inventoryid serial primary key,
	supplierid integer references supplier (supplierid),
	entrydate date not null,
	description text not null,
	units text not null,
    priceperunit numeric not null,
	quantity integer not null,
	expirationdate date not null,
    wastage integer
);

CREATE TABLE purchase
(
	purchaseid serial primary key,
	purchasedate timestamp default current_timestamp,
	supplierid integer references supplier(supplierid),
	employeeid integer references employee(employeeid)
);

CREATE TABLE purchasedetail
(
	purchasedetailid serial primary key,
	purchaseid integer references purchase(purchaseid),
	itemdescription text not null,
    units text not null,
	quantity integer not null,
	purchaseprice numeric not null
);

CREATE TABLE sale
(
	saleid serial primary key,
	memberid integer references coopmember(memberid),
	employeeid integer references employee(employeeid),
	saledatetime timestamp default current_timestamp
);

CREATE TABLE saledetail
(
	saledetailid serial primary key,
	saleid integer references sale(saleid),
	inventoryid integer references inventory(inventoryid),
	quantity integer not null,
	discountpercent numeric default 0
);