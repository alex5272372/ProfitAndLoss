--##############     start script for connection "main" #######
/*
 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 
 Attantion! Achtung! Vnimanie! 


Altering type for uba_audit.actionTime from TIMESTAMP WITH TIME ZONE to TIMESTAMP may be wrong
Altering type for uba_user.lastPasswordChangeDate from TIMESTAMP WITH TIME ZONE to TIMESTAMP may be wrong

 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 
*/

 
-- Create tables
--#############################################################
create table cdn_address(
	ID BIGINT not null,
	addressType VARCHAR(32) not null,
	value VARCHAR(255) not null,
	subjectID BIGINT not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_adminunit(
	ID BIGINT not null,
	parentAdminUnitID BIGINT null,
	code VARCHAR(16) not null,
	name VARCHAR(128) not null,
	fullName VARCHAR(255) null,
	adminUnitType VARCHAR(32) not null,
	caption VARCHAR(1024) null,
	mi_unityEntity VARCHAR(64) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_bank(
	ID BIGINT not null,
	MFO VARCHAR(16) not null,
	code VARCHAR(16) null,
	name VARCHAR(128) not null,
	fullName VARCHAR(128) not null,
	phones VARCHAR(255) null,
	address VARCHAR(255) null,
	countryID BIGINT null,
	cityID BIGINT null,
	description VARCHAR(512) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_building(
	ID BIGINT not null,
	streetID BIGINT not null,
	postIndexID BIGINT not null,
	code VARCHAR(20) not null,
	description VARCHAR(255) null,
	buildingType VARCHAR(32) default 'HOUSE' not null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_city(
	ID BIGINT not null,
	parentAdminUnitID BIGINT not null,
	code VARCHAR(16) not null,
	name VARCHAR(128) not null,
	caption VARCHAR(255) null,
	description VARCHAR(255) null,
	postalCode VARCHAR(64) null,
	phoneCode VARCHAR(64) null,
	cityTypeID BIGINT null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_citytype(
	ID BIGINT not null,
	code VARCHAR(16) not null,
	name VARCHAR(128) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_classifier(
	ID BIGINT not null,
	code VARCHAR(255) not null,
	name VARCHAR(255) not null,
	description VARCHAR(255) null,
	orderByAttr VARCHAR(32) default 'code' null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_classifieritem(
	ID BIGINT not null,
	code VARCHAR(255) not null,
	name VARCHAR(255) not null,
	classifierID BIGINT not null,
	parentID BIGINT null,
	hierarchyLevel INTEGER null,
	mi_treePath VARCHAR(450) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_contact(
	ID BIGINT not null,
	contactTypeID BIGINT not null,
	value VARCHAR(255) not null,
	subjectID BIGINT not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_contacttype(
	ID BIGINT not null,
	code VARCHAR(16) not null,
	name VARCHAR(128) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_corrindex(
	ID BIGINT not null,
	code VARCHAR(16) not null,
	name VARCHAR(128) not null,
	fullName VARCHAR(255) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_country(
	ID BIGINT not null,
	code VARCHAR(16) not null,
	name VARCHAR(128) not null,
	fullName VARCHAR(255) not null,
	intCode INTEGER not null,
	symbol2 VARCHAR(2) not null,
	symbol3 VARCHAR(3) not null,
	description VARCHAR(255) null,
	phoneCode VARCHAR(64) null,
	currencyID BIGINT null,
	capitalID BIGINT null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_currency(
	ID BIGINT not null,
	intCode INTEGER not null,
	code3 VARCHAR(3) not null,
	name VARCHAR(65) not null,
	curMult INTEGER default 100 not null,
	description VARCHAR(128) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_department(
	ID BIGINT not null,
	code VARCHAR(16) null,
	name VARCHAR(128) not null,
	fullName VARCHAR(255) null,
	description VARCHAR(255) null,
	nameGen VARCHAR(128) null,
	nameDat VARCHAR(128) null,
	fullNameGen VARCHAR(255) null,
	fullNameDat VARCHAR(255) null,
	depTypeID BIGINT null,
	organizationID BIGINT null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_deptype(
	ID BIGINT not null,
	code VARCHAR(32) not null,
	name VARCHAR(100) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_employee(
	ID BIGINT not null,
	lastName VARCHAR(128) not null,
	firstName VARCHAR(128) not null,
	middleName VARCHAR(128) null,
	description VARCHAR(255) null,
	sexType VARCHAR(32) default '?' not null,
	uniqNum VARCHAR(255) null,
	suffix VARCHAR(30) null,
	shortFIO VARCHAR(100) not null,
	fullFIO VARCHAR(100) not null,
	apply VARCHAR(100) null,
	lastNameGen VARCHAR(128) null,
	lastNameDat VARCHAR(128) null,
	firstNameGen VARCHAR(128) null,
	firstNameDat VARCHAR(128) null,
	middleNameGen VARCHAR(128) null,
	middleNameDat VARCHAR(128) null,
	shortFIOGen VARCHAR(256) null,
	shortFIODat VARCHAR(256) null,
	fullFIOGen VARCHAR(512) null,
	fullFIODat VARCHAR(512) null,
	applyGen VARCHAR(100) null,
	applyDat VARCHAR(100) null,
	departmentID BIGINT null,
	organizationID BIGINT not null,
	addrText TEXT null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_language(
	ID BIGINT not null,
	code VARCHAR(255) not null,
	languageName VARCHAR(255) not null,
	nativeName VARCHAR(255) not null,
	isRTL SMALLINT default 0 not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_nationality(
	ID BIGINT not null,
	code VARCHAR(16) not null,
	name VARCHAR(128) not null,
	nameM VARCHAR(128) null,
	nameF VARCHAR(128) null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_orgaccount(
	ID BIGINT not null,
	organizationID BIGINT not null,
	currencyID BIGINT null,
	bankID BIGINT null,
	code VARCHAR(29) not null,
	acctype VARCHAR(32) default 'CORR' not null,
	description VARCHAR(512) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_organization(
	ID BIGINT not null,
	code VARCHAR(16) null,
	OKPOCode VARCHAR(16) null,
	taxCode VARCHAR(32) null,
	vatCode VARCHAR(32) null,
	name VARCHAR(128) not null,
	fullName VARCHAR(255) not null,
	nameGen VARCHAR(128) null,
	nameDat VARCHAR(128) null,
	fullNameGen VARCHAR(255) null,
	fullNameDat VARCHAR(255) null,
	description VARCHAR(255) null,
	orgBusinessTypeID BIGINT null,
	orgOwnershipTypeID BIGINT null,
	corrIndexID BIGINT null,
	addrText TEXT null,
	caption VARCHAR(255) null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_orgbusinesstype(
	ID BIGINT not null,
	code VARCHAR(32) not null,
	shortName VARCHAR(32) null,
	name VARCHAR(100) not null,
	fullName VARCHAR(255) null,
	isGovAuthority SMALLINT default 0 not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_orgownershiptype(
	ID BIGINT not null,
	code VARCHAR(32) not null,
	shortName VARCHAR(32) null,
	name VARCHAR(100) not null,
	fullName VARCHAR(255) null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_person(
	ID BIGINT not null,
	lastName VARCHAR(128) not null,
	firstName VARCHAR(128) not null,
	middleName VARCHAR(128) null,
	identCard VARCHAR(255) null,
	workPlacePos VARCHAR(255) null,
	birthDate TIMESTAMP null,
	description VARCHAR(255) null,
	sexType VARCHAR(32) default '?' not null,
	suffix VARCHAR(30) null,
	shortFIO VARCHAR(256) null,
	fullFIO VARCHAR(512) not null,
	apply VARCHAR(100) null,
	photo VARCHAR(4000) null,
	lastNameGen VARCHAR(128) null,
	lastNameDat VARCHAR(128) null,
	firstNameGen VARCHAR(128) null,
	firstNameDat VARCHAR(128) null,
	middleNameGen VARCHAR(128) null,
	middleNameDat VARCHAR(128) null,
	shortFIOGen VARCHAR(256) null,
	shortFIODat VARCHAR(256) null,
	fullFIOGen VARCHAR(512) null,
	fullFIODat VARCHAR(512) null,
	applyGen VARCHAR(100) null,
	applyDat VARCHAR(100) null,
	regionID BIGINT null,
	socialstatusID BIGINT null,
	categoryID BIGINT null,
	nationality BIGINT null,
	resident SMALLINT default 0 not null,
	classID BIGINT null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_personcategory(
	ID BIGINT not null,
	code VARCHAR(32) not null,
	name VARCHAR(100) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_personclass(
	ID BIGINT not null,
	code VARCHAR(32) not null,
	name VARCHAR(100) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_personsocialstatus(
	ID BIGINT not null,
	code VARCHAR(32) not null,
	name VARCHAR(100) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_postindex(
	ID BIGINT not null,
	code VARCHAR(6) not null,
	streetID BIGINT not null,
	description VARCHAR(255) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_profession(
	ID BIGINT not null,
	code VARCHAR(16) default '----' not null,
	name VARCHAR(128) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_region(
	ID BIGINT not null,
	parentAdminUnitID BIGINT not null,
	code VARCHAR(16) not null,
	regionTypeID BIGINT null,
	name VARCHAR(128) not null,
	caption VARCHAR(255) null,
	fullName VARCHAR(255) not null,
	description VARCHAR(255) null,
	phoneCode VARCHAR(64) null,
	centerID BIGINT null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_regiontype(
	ID BIGINT not null,
	code VARCHAR(16) not null,
	name VARCHAR(128) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_staffunittype(
	ID BIGINT not null,
	code VARCHAR(16) not null,
	name VARCHAR(128) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table cdn_street(
	ID BIGINT not null,
	name VARCHAR(128) not null,
	fullName VARCHAR(128) not null,
	code VARCHAR(6) null,
	streetType VARCHAR(32) null,
	cityID BIGINT null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table de_attribute(
	ID BIGINT not null,
	name VARCHAR(100) not null,
	parentEntity BIGINT not null
);
--
create table de_entity(
	ID BIGINT not null,
	name VARCHAR(100) not null,
	parentModel BIGINT not null
);
--
create table de_model(
	ID BIGINT not null,
	name VARCHAR(100) not null
);
--
create table de_ruleAttribute(
	ID BIGINT not null,
	name VARCHAR(100) not null,
	parentRuleEntity BIGINT not null,
	attributeSource BIGINT not null,
	attributeDestination BIGINT not null
);
--
create table de_ruleEntity(
	ID BIGINT not null,
	name VARCHAR(100) not null,
	parentRuleModel BIGINT not null,
	entitySource BIGINT not null,
	entityDestination BIGINT not null
);
--
create table de_ruleModel(
	ID BIGINT not null,
	name VARCHAR(100) not null,
	modelSource BIGINT not null,
	modelDestination BIGINT not null
);
--
create table org_department(
	ID BIGINT not null,
	parentID BIGINT null,
	code VARCHAR(16) default '----' not null,
	name VARCHAR(256) not null,
	fullName VARCHAR(500) not null,
	description VARCHAR(290) null,
	nameGen VARCHAR(256) null,
	nameDat VARCHAR(256) null,
	fullNameGen VARCHAR(500) null,
	fullNameDat VARCHAR(500) null,
	depTypeID BIGINT null,
	isClerical SMALLINT default 0 not null,
	caption VARCHAR(512) not null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table org_diagram(
	ID BIGINT not null,
	orgunitID BIGINT null,
	caption VARCHAR(256) null,
	isdefault SMALLINT default 0 not null,
	document VARCHAR(4000) null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table org_employee(
	ID BIGINT not null,
	code VARCHAR(20) not null,
	userID BIGINT null,
	lastName VARCHAR(128) not null,
	firstName VARCHAR(128) not null,
	middleName VARCHAR(128) null,
	birthDate TIMESTAMP null,
	description VARCHAR(255) null,
	sexType VARCHAR(32) not null,
	suffix VARCHAR(30) null,
	shortFIO VARCHAR(256) null,
	fullFIO VARCHAR(512) not null,
	apply VARCHAR(100) null,
	lastNameGen VARCHAR(128) null,
	lastNameDat VARCHAR(128) null,
	lastNameObj VARCHAR(128) null,
	firstNameGen VARCHAR(128) null,
	firstNameDat VARCHAR(128) null,
	firstNameObj VARCHAR(128) null,
	middleNameGen VARCHAR(128) null,
	middleNameDat VARCHAR(128) null,
	middleNameObj VARCHAR(128) null,
	shortFIOGen VARCHAR(256) null,
	shortFIODat VARCHAR(256) null,
	shortFIOObj VARCHAR(256) null,
	fullFIOGen VARCHAR(512) null,
	fullFIODat VARCHAR(512) null,
	fullFIOObj VARCHAR(512) null,
	applyGen VARCHAR(100) null,
	applyDat VARCHAR(100) null,
	applyObj VARCHAR(100) null,
	facsimile VARCHAR(4000) null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table org_employeeonstaff(
	ID BIGINT not null,
	tabNo VARCHAR(20) default '----' not null,
	employeeID BIGINT not null,
	staffUnitID BIGINT not null,
	employeeOnStaffType VARCHAR(32) default 'PERMANENT' not null,
	description VARCHAR(255) null,
	caption VARCHAR(1024) null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table org_employeeonstaff_pending(
	ID BIGINT not null,
	emponstaffID BIGINT not null,
	startDate TIMESTAMP not null,
	endDate TIMESTAMP null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null
);
--
create table org_execgroup(
	ID BIGINT not null,
	parentID BIGINT not null,
	code VARCHAR(16) not null,
	name VARCHAR(254) not null,
	nameGen VARCHAR(254) null,
	nameDat VARCHAR(254) null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table org_execgroupmember(
	ID BIGINT not null,
	execGroupID BIGINT not null,
	orgUnitID BIGINT not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null
);
--
create table org_orgaccount(
	ID BIGINT not null,
	organizationID BIGINT not null,
	currencyID BIGINT not null,
	bankID BIGINT not null,
	code VARCHAR(29) not null,
	acctype VARCHAR(32) not null,
	description VARCHAR(512) null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table org_organization(
	ID BIGINT not null,
	parentID BIGINT null,
	code VARCHAR(16) not null,
	OKPOCode VARCHAR(16) null,
	taxCode VARCHAR(32) null,
	vatCode VARCHAR(32) null,
	name VARCHAR(256) not null,
	fullName VARCHAR(500) not null,
	nameGen VARCHAR(256) null,
	nameDat VARCHAR(256) null,
	fullNameGen VARCHAR(500) null,
	fullNameDat VARCHAR(500) null,
	description VARCHAR(290) null,
	orgBusinessTypeID BIGINT null,
	orgOwnershipTypeID BIGINT null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table org_profession(
	ID BIGINT not null,
	code VARCHAR(16) default '----' not null,
	name VARCHAR(128) not null,
	fullName VARCHAR(300) not null,
	nameGen VARCHAR(128) null,
	nameDat VARCHAR(128) null,
	fullNameGen VARCHAR(300) null,
	fullNameDat VARCHAR(300) null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table org_staffunit(
	ID BIGINT not null,
	parentID BIGINT not null,
	code VARCHAR(16) default '----' not null,
	name VARCHAR(128) not null,
	fullName VARCHAR(300) not null,
	description VARCHAR(255) null,
	nameGen VARCHAR(128) null,
	nameDat VARCHAR(128) null,
	fullNameGen VARCHAR(300) null,
	fullNameDat VARCHAR(300) null,
	caption VARCHAR(1024) not null,
	professionExtID BIGINT null,
	professionID BIGINT not null,
	staffUnitTypeID BIGINT not null,
	subordinationLevel INTEGER null,
	isBoss SMALLINT default 0 not null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table org_unit(
	ID BIGINT not null,
	parentID BIGINT null,
	code VARCHAR(16) not null,
	caption VARCHAR(1024) not null,
	unitType VARCHAR(32) not null,
	mi_treePath VARCHAR(450) not null,
	mi_data_id BIGINT not null,
	mi_dateFrom TIMESTAMP not null,
	mi_dateTo TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null,
	mi_unityEntity VARCHAR(64) not null
);
--
create table pl_product(
	ID BIGINT not null,
	name VARCHAR(100) not null
);
--
create table ub_blobHistory(
	ID BIGINT not null,
	instance BIGINT not null,
	attribute VARCHAR(20) null,
	revision INTEGER default 1 not null,
	permanent SMALLINT default 0 not null,
	blobInfo VARCHAR(2000) not null
);
--
create table uba_advSecurity(
	ID BIGINT not null,
	userID BIGINT not null,
	editCause VARCHAR(2000) not null,
	allowedIP VARCHAR(256) null,
	refreshIP SMALLINT default 0 not null,
	fp VARCHAR(256) null,
	refreshFp SMALLINT default 0 not null,
	keyMediaName VARCHAR(32) null,
	refreshKeyMedia SMALLINT default 0 not null,
	additional VARCHAR(2000) null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null
);
--
create table uba_auditTrail(
	ID BIGINT not null,
	entity VARCHAR(32) not null,
	entityinfo_id BIGINT not null,
	actionType VARCHAR(32) not null,
	actionUser BIGINT not null,
	actionUserName VARCHAR(128) null,
	actionTime TIMESTAMP not null,
	remoteIP VARCHAR(40) null,
	parentEntity VARCHAR(32) null,
	parentEntityInfo_id BIGINT null,
	request_id BIGINT null,
	fromValue TEXT null,
	toValue TEXT null
);
--
create table uba_group(
	ID BIGINT not null,
	code VARCHAR(50) not null,
	name VARCHAR(128) not null,
	description VARCHAR(256) null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null
);
--
create table uba_grouprole(
	ID BIGINT not null,
	groupID BIGINT not null,
	roleID BIGINT not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null
);
--
create table uba_otp(
	ID BIGINT not null,
	otp VARCHAR(40) not null,
	userID BIGINT not null,
	uData VARCHAR(2000) null,
	expiredDate TIMESTAMP not null,
	otpKind VARCHAR(32) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null
);
--
create table uba_prevPasswordsHash(
	ID BIGINT not null,
	userID BIGINT not null,
	uPasswordHashHexa VARCHAR(64) null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null
);
--
create table uba_usercertificate(
	ID BIGINT not null,
	userID BIGINT not null,
	issuer_serial VARCHAR(512) not null,
	issuer_cn VARCHAR(512) null,
	serial VARCHAR(100) not null,
	certificate BYTEA not null,
	description VARCHAR(512) null,
	disabled SMALLINT default 0 not null,
	revoked SMALLINT default 0 not null,
	revocationDate TIMESTAMP null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null
);
--
create table uba_usergroup(
	ID BIGINT not null,
	userID BIGINT not null,
	groupID BIGINT not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null
);
--
create table ubm_desktop(
	ID BIGINT not null,
	caption VARCHAR(255) not null,
	code VARCHAR(50) not null,
	description VARCHAR(255) null,
	iconCls VARCHAR(255) default 'u-icon-desktop' not null,
	url VARCHAR(255) null,
	isDefault SMALLINT default 0 not null,
	displayOrder INTEGER default 1000 not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table ubm_desktop_adm(
	ID BIGINT not null,
	instanceID BIGINT not null,
	admSubjID BIGINT not null
);
--
create table ubm_enum(
	ID BIGINT not null,
	eGroup VARCHAR(32) not null,
	code VARCHAR(32) not null,
	shortName VARCHAR(128) null,
	name VARCHAR(255) not null,
	sortOrder INTEGER default 100 not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table ubm_navshortcut(
	ID BIGINT not null,
	desktopID BIGINT not null,
	parentID BIGINT null,
	code VARCHAR(50) not null,
	isFolder SMALLINT default 0 not null,
	caption VARCHAR(255) not null,
	cmdCode TEXT null,
	inWindow SMALLINT default 0 not null,
	isCollapsed SMALLINT default 0 not null,
	displayOrder INTEGER default 1000 not null,
	iconCls VARCHAR(50) null,
	description VARCHAR(256) null,
	keywords VARCHAR(512) null,
	mi_treePath VARCHAR(450) not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table ubm_navshortcut_adm(
	ID BIGINT not null,
	instanceID BIGINT not null,
	admSubjID BIGINT not null
);
--
create table ubm_query(
	ID BIGINT not null,
	code VARCHAR(50) not null,
	name VARCHAR(256) not null,
	ubql JSONB not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table ubs_filter(
	ID BIGINT not null,
	code VARCHAR(100) not null,
	name VARCHAR(250) not null,
	filter TEXT not null,
	isGlobal SMALLINT not null,
	owner BIGINT not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null
);
--
create table ubs_message(
	ID BIGINT not null,
	messageBody TEXT null,
	complete SMALLINT default 0 not null,
	messageType VARCHAR(32) not null,
	startDate TIMESTAMP not null,
	expireDate TIMESTAMP not null,
	mi_owner BIGINT not null,
	mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_createUser BIGINT not null,
	mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null,
	mi_modifyUser BIGINT not null,
	mi_deleteDate TIMESTAMP default '9999-12-31 00:00:00'::timestamp without time zone not null,
	mi_deleteUser BIGINT null
);
--
create table ubs_message_recipient(
	ID BIGINT not null,
	messageID BIGINT not null,
	userID BIGINT not null,
	acceptDate TIMESTAMP null
);
--
create table ubs_numcounter(
	ID BIGINT not null,
	regKey VARCHAR(255) not null,
	counter BIGINT not null,
	fakeLock INTEGER null
);
--
create table ubs_numcounterreserv(
	ID BIGINT not null,
	regKey VARCHAR(255) not null,
	counter BIGINT not null,
	reservedDate VARCHAR(255) null,
	note VARCHAR(255) null
);
--
create table ubs_softLock(
	ID BIGINT not null,
	entity VARCHAR(32) not null,
	lockID BIGINT not null,
	lockUser BIGINT not null,
	lockType VARCHAR(32) not null,
	lockTime TIMESTAMP not null
);
 
-- Add columns
--#############################################################
alter table uba_audit add targetGroup VARCHAR(128) null;
--
alter table uba_els add mi_owner BIGINT null;
--
alter table uba_els add mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null;
--
alter table uba_els add mi_createUser BIGINT null;
--
alter table uba_els add mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null;
--
alter table uba_els add mi_modifyUser BIGINT null;
--
alter table uba_role add mi_owner BIGINT null;
--
alter table uba_role add mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null;
--
alter table uba_role add mi_createUser BIGINT null;
--
alter table uba_role add mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null;
--
alter table uba_role add mi_modifyUser BIGINT null;
--
alter table uba_user add firstName VARCHAR(64) null;
--
alter table uba_user add lastName VARCHAR(64) null;
--
alter table uba_user add fullName VARCHAR(128) null;
--
alter table uba_user add gender VARCHAR(32) null;
--
alter table uba_user add email VARCHAR(64) null;
--
alter table uba_user add phone VARCHAR(32) null;
--
alter table uba_user add avatar VARCHAR(4000) null;
--
alter table uba_user add mi_owner BIGINT null;
--
alter table uba_user add mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null;
--
alter table uba_user add mi_createUser BIGINT null;
--
alter table uba_user add mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null;
--
alter table uba_user add mi_modifyUser BIGINT null;
--
alter table uba_userrole add mi_owner BIGINT null;
--
alter table uba_userrole add mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null;
--
alter table uba_userrole add mi_createUser BIGINT null;
--
alter table uba_userrole add mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null;
--
alter table uba_userrole add mi_modifyUser BIGINT null;
--
alter table ubs_settings add mi_owner BIGINT null;
--
alter table ubs_settings add mi_createDate TIMESTAMP default timezone('utc'::text, now()) not null;
--
alter table ubs_settings add mi_createUser BIGINT null;
--
alter table ubs_settings add mi_modifyDate TIMESTAMP default timezone('utc'::text, now()) not null;
--
alter table ubs_settings add mi_modifyUser BIGINT null;
 
-- Alter columns
--#############################################################
alter table uba_audit alter column actionTime type TIMESTAMP;
--
alter table uba_audit alter column fromValue type TEXT;
--
alter table uba_audit alter column toValue type TEXT;
--
alter table uba_subject alter column name type VARCHAR(256);
--
alter table uba_user alter column trustedIP type VARCHAR(2000);
--
alter table uba_user alter column lastPasswordChangeDate type TIMESTAMP;
 
-- ! update values for known or estimated changes
--#############################################################
update uba_els set mi_owner = (select min(id) from uba_user) where mi_owner is null;
--
update uba_els set mi_createUser = (select min(id) from uba_user) where mi_createUser is null;
--
update uba_els set mi_modifyUser = (select min(id) from uba_user) where mi_modifyUser is null;
--
update uba_role set mi_owner = (select min(id) from uba_user) where mi_owner is null;
--
update uba_role set mi_createUser = (select min(id) from uba_user) where mi_createUser is null;
--
update uba_role set mi_modifyUser = (select min(id) from uba_user) where mi_modifyUser is null;
--
update uba_user set mi_owner = ID where mi_owner is null;
--
update uba_user set mi_createUser = ID where mi_createUser is null;
--
update uba_user set mi_modifyUser = ID where mi_modifyUser is null;
--
update uba_userrole set mi_owner = (select min(id) from uba_user) where mi_owner is null;
--
update uba_userrole set mi_createUser = (select min(id) from uba_user) where mi_createUser is null;
--
update uba_userrole set mi_modifyUser = (select min(id) from uba_user) where mi_modifyUser is null;
--
update ubs_settings set mi_owner = (select min(id) from uba_user) where mi_owner is null;
--
update ubs_settings set mi_createUser = (select min(id) from uba_user) where mi_createUser is null;
--
update ubs_settings set mi_modifyUser = (select min(id) from uba_user) where mi_modifyUser is null;
 
-- Set new default
--#############################################################
alter table uba_user alter column lastPasswordChangeDate set default timezone('utc'::text, now());
 
-- Alter columns set not null where was null allowed
--#############################################################
alter table uba_els alter column mi_owner set not null;
--
alter table uba_els alter column mi_createUser set not null;
--
alter table uba_els alter column mi_modifyUser set not null;
--
alter table uba_role alter column mi_owner set not null;
--
alter table uba_role alter column mi_createUser set not null;
--
alter table uba_role alter column mi_modifyUser set not null;
--
alter table uba_user alter column mi_owner set not null;
--
alter table uba_user alter column mi_createUser set not null;
--
alter table uba_user alter column mi_modifyUser set not null;
--
alter table uba_userrole alter column mi_owner set not null;
--
alter table uba_userrole alter column mi_createUser set not null;
--
alter table uba_userrole alter column mi_modifyUser set not null;
--
alter table ubs_settings alter column mi_owner set not null;
--
alter table ubs_settings alter column mi_createUser set not null;
--
alter table ubs_settings alter column mi_modifyUser set not null;
 
-- Create primary keys
--#############################################################
alter table cdn_address add constraint PK_ADDR PRIMARY KEY (ID);
--
alter table cdn_adminunit add constraint PK_ADMUNT PRIMARY KEY (ID);
--
alter table cdn_bank add constraint PK_BANK PRIMARY KEY (ID);
--
alter table cdn_building add constraint PK_BUILDING PRIMARY KEY (ID);
--
alter table cdn_city add constraint PK_CITY PRIMARY KEY (ID);
--
alter table cdn_citytype add constraint PK_CITYT PRIMARY KEY (ID);
--
alter table cdn_classifier add constraint PK_CDNCLS PRIMARY KEY (ID);
--
alter table cdn_classifieritem add constraint PK_CDNCLSI PRIMARY KEY (ID);
--
alter table cdn_contact add constraint PK_CONT PRIMARY KEY (ID);
--
alter table cdn_contacttype add constraint PK_CONTTY PRIMARY KEY (ID);
--
alter table cdn_corrindex add constraint PK_CORIDX PRIMARY KEY (ID);
--
alter table cdn_country add constraint PK_CNTR PRIMARY KEY (ID);
--
alter table cdn_currency add constraint PK_CURR PRIMARY KEY (ID);
--
alter table cdn_department add constraint PK_DEP PRIMARY KEY (ID);
--
alter table cdn_deptype add constraint PK_DEPT PRIMARY KEY (ID);
--
alter table cdn_employee add constraint PK_EMP PRIMARY KEY (ID);
--
alter table cdn_language add constraint PK_CDNLNG PRIMARY KEY (ID);
--
alter table cdn_nationality add constraint PK_CDN_NATIONALITY PRIMARY KEY (ID);
--
alter table cdn_orgaccount add constraint PK_ORGACC PRIMARY KEY (ID);
--
alter table cdn_organization add constraint PK_ORG PRIMARY KEY (ID);
--
alter table cdn_orgbusinesstype add constraint PK_ORGBT PRIMARY KEY (ID);
--
alter table cdn_orgownershiptype add constraint PK_ORGOT PRIMARY KEY (ID);
--
alter table cdn_person add constraint PK_CPERS PRIMARY KEY (ID);
--
alter table cdn_personcategory add constraint PK_CATEGORY PRIMARY KEY (ID);
--
alter table cdn_personclass add constraint PK_CDN_PERSONCLASS PRIMARY KEY (ID);
--
alter table cdn_personsocialstatus add constraint PK_PSOCST PRIMARY KEY (ID);
--
alter table cdn_postindex add constraint PK_POSTIDX PRIMARY KEY (ID);
--
alter table cdn_profession add constraint PK_CDNPROF PRIMARY KEY (ID);
--
alter table cdn_region add constraint PK_REGN PRIMARY KEY (ID);
--
alter table cdn_regiontype add constraint PK_REGNT PRIMARY KEY (ID);
--
alter table cdn_staffunittype add constraint PK_STUNT PRIMARY KEY (ID);
--
alter table cdn_street add constraint PK_STREET PRIMARY KEY (ID);
--
alter table de_attribute add constraint PK_DE_ATTRIBUTE PRIMARY KEY (ID);
--
alter table de_entity add constraint PK_DE_ENTITY PRIMARY KEY (ID);
--
alter table de_model add constraint PK_DE_MODEL PRIMARY KEY (ID);
--
alter table de_ruleAttribute add constraint PK_DE_RULEATTRIBUTE PRIMARY KEY (ID);
--
alter table de_ruleEntity add constraint PK_DE_RULEENTITY PRIMARY KEY (ID);
--
alter table de_ruleModel add constraint PK_DE_RULEMODEL PRIMARY KEY (ID);
--
alter table org_department add constraint PK_ODEP PRIMARY KEY (ID);
--
alter table org_diagram add constraint PK_ODIAGRAM PRIMARY KEY (ID);
--
alter table org_employee add constraint PK_OEMP PRIMARY KEY (ID);
--
alter table org_employeeonstaff add constraint PK_EMPONS PRIMARY KEY (ID);
--
alter table org_employeeonstaff_pending add constraint PK_EMPONPEND PRIMARY KEY (ID);
--
alter table org_execgroup add constraint PK_ORGEXGR PRIMARY KEY (ID);
--
alter table org_execgroupmember add constraint PK_ORGEXGRM PRIMARY KEY (ID);
--
alter table org_orgaccount add constraint PK_UORGACC PRIMARY KEY (ID);
--
alter table org_organization add constraint PK_OORG PRIMARY KEY (ID);
--
alter table org_profession add constraint PK_PROF PRIMARY KEY (ID);
--
alter table org_staffunit add constraint PK_STUNIT PRIMARY KEY (ID);
--
alter table org_unit add constraint PK_OUNIT PRIMARY KEY (ID);
--
alter table pl_product add constraint PK_PL_PRODUCT PRIMARY KEY (ID);
--
alter table ub_blobHistory add constraint PK_UB_BLOBHISTORY PRIMARY KEY (ID);
--
alter table uba_advSecurity add constraint PK_UBA_ADVSECURITY PRIMARY KEY (ID);
--
alter table uba_auditTrail add constraint PK_AUDTR PRIMARY KEY (ID);
--
alter table uba_group add constraint PK_GR PRIMARY KEY (ID);
--
alter table uba_grouprole add constraint PK_UBA_GROUPROLE PRIMARY KEY (ID);
--
alter table uba_otp add constraint PK_OTP PRIMARY KEY (ID);
--
alter table uba_prevPasswordsHash add constraint PK_PREVP PRIMARY KEY (ID);
--
alter table uba_usercertificate add constraint PK_USRCER PRIMARY KEY (ID);
--
alter table uba_usergroup add constraint PK_USRGROUP PRIMARY KEY (ID);
--
alter table ubm_desktop add constraint PK_DESK PRIMARY KEY (ID);
--
alter table ubm_desktop_adm add constraint PK_ADMDESK PRIMARY KEY (ID);
--
alter table ubm_enum add constraint PK_ENU PRIMARY KEY (ID);
--
alter table ubm_navshortcut add constraint PK_NAVSH PRIMARY KEY (ID);
--
alter table ubm_navshortcut_adm add constraint PK_ADMNAV PRIMARY KEY (ID);
--
alter table ubm_query add constraint PK_UBMQR PRIMARY KEY (ID);
--
alter table ubs_filter add constraint PK_SFILTER PRIMARY KEY (ID);
--
alter table ubs_message add constraint PK_MSG PRIMARY KEY (ID);
--
alter table ubs_message_recipient add constraint PK_MSG_RC PRIMARY KEY (ID);
--
alter table ubs_numcounter add constraint PK_NUCO PRIMARY KEY (ID);
--
alter table ubs_numcounterreserv add constraint PK_NCRE PRIMARY KEY (ID);
--
alter table ubs_softLock add constraint PK_SLOCK PRIMARY KEY (ID);
 
-- Create indexes
--#############################################################
create  index IDX_ADDR_MI_OWNER on cdn_address(MI_OWNER);
--
create  index IDX_ADDR_MI_CREATEUSER on cdn_address(MI_CREATEUSER);
--
create  index IDX_ADDR_MI_MODIFYUSER on cdn_address(MI_MODIFYUSER);
--
create  index IDX_ADDR_MI_DELETEUSER on cdn_address(MI_DELETEUSER);
--
create  index idx_address_subjectID on cdn_address(SUBJECTID);
--
create  index IDX_ADMUNT_PARENTADMINUNITID on cdn_adminunit(PARENTADMINUNITID);
--
create unique index UIDX_ADMUNT_CODE on cdn_adminunit(CODE,MI_DELETEDATE);
--
create  index IDX_ADMUNT_MI_OWNER on cdn_adminunit(MI_OWNER);
--
create  index IDX_ADMUNT_MI_CREATEUSER on cdn_adminunit(MI_CREATEUSER);
--
create  index IDX_ADMUNT_MI_MODIFYUSER on cdn_adminunit(MI_MODIFYUSER);
--
create  index IDX_ADMUNT_MI_DELETEUSER on cdn_adminunit(MI_DELETEUSER);
--
create unique index UIDX_BANK_MFO on cdn_bank(MFO,MI_DELETEDATE);
--
create  index IDX_BANK_COUNTRYID on cdn_bank(COUNTRYID);
--
create  index IDX_BANK_CITYID on cdn_bank(CITYID);
--
create  index IDX_BANK_MI_OWNER on cdn_bank(MI_OWNER);
--
create  index IDX_BANK_MI_CREATEUSER on cdn_bank(MI_CREATEUSER);
--
create  index IDX_BANK_MI_MODIFYUSER on cdn_bank(MI_MODIFYUSER);
--
create  index IDX_BANK_MI_DELETEUSER on cdn_bank(MI_DELETEUSER);
--
create  index IDX_BUILDING_STREETID on cdn_building(STREETID);
--
create  index IDX_BUILDING_POSTINDEXID on cdn_building(POSTINDEXID);
--
create  index IDX_BUILDING_MI_DATA_ID on cdn_building(MI_DATA_ID);
--
create  index IDX_BUILDING_MI_OWNER on cdn_building(MI_OWNER);
--
create  index IDX_BUILDING_MI_CREATEUSER on cdn_building(MI_CREATEUSER);
--
create  index IDX_BUILDING_MI_MODIFYUSER on cdn_building(MI_MODIFYUSER);
--
create  index IDX_BUILDING_MI_DELETEUSER on cdn_building(MI_DELETEUSER);
--
create  index IDX_BUILDING_DTODD on cdn_building(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_BUILDING_HIST on cdn_building(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create  index IDX_CITY_PARENTADMINUNITID on cdn_city(PARENTADMINUNITID);
--
create unique index UIDX_CITY_CODE on cdn_city(CODE,MI_DELETEDATE);
--
create  index IDX_CITY_CITYTYPEID on cdn_city(CITYTYPEID);
--
create  index IDX_CITY_MI_OWNER on cdn_city(MI_OWNER);
--
create  index IDX_CITY_MI_CREATEUSER on cdn_city(MI_CREATEUSER);
--
create  index IDX_CITY_MI_MODIFYUSER on cdn_city(MI_MODIFYUSER);
--
create  index IDX_CITY_MI_DELETEUSER on cdn_city(MI_DELETEUSER);
--
create unique index UIDX_CITYT_CODE on cdn_citytype(CODE,MI_DELETEDATE);
--
create  index IDX_CITYT_MI_OWNER on cdn_citytype(MI_OWNER);
--
create  index IDX_CITYT_MI_CREATEUSER on cdn_citytype(MI_CREATEUSER);
--
create  index IDX_CITYT_MI_MODIFYUSER on cdn_citytype(MI_MODIFYUSER);
--
create  index IDX_CITYT_MI_DELETEUSER on cdn_citytype(MI_DELETEUSER);
--
create unique index UIDX_CDNCLS_CODE on cdn_classifier(CODE,MI_DELETEDATE);
--
create  index IDX_CDNCLS_MI_OWNER on cdn_classifier(MI_OWNER);
--
create  index IDX_CDNCLS_MI_CREATEUSER on cdn_classifier(MI_CREATEUSER);
--
create  index IDX_CDNCLS_MI_MODIFYUSER on cdn_classifier(MI_MODIFYUSER);
--
create  index IDX_CDNCLS_MI_DELETEUSER on cdn_classifier(MI_DELETEUSER);
--
create  index IDX_CDNCLSI_CLASSIFIERID on cdn_classifieritem(CLASSIFIERID);
--
create  index IDX_CDNCLSI_PARENTID on cdn_classifieritem(PARENTID);
--
create  index IDX_CDNCLSI_MI_OWNER on cdn_classifieritem(MI_OWNER);
--
create  index IDX_CDNCLSI_MI_CREATEUSER on cdn_classifieritem(MI_CREATEUSER);
--
create  index IDX_CDNCLSI_MI_MODIFYUSER on cdn_classifieritem(MI_MODIFYUSER);
--
create  index IDX_CDNCLSI_MI_DELETEUSER on cdn_classifieritem(MI_DELETEUSER);
--
create  index IDX_CDNCLSI_TREEPATH on cdn_classifieritem(MI_TREEPATH);
--
create unique index idx_cdnclsi_uniq on cdn_classifieritem(CLASSIFIERID,CODE);
--
create  index IDX_CONT_CONTACTTYPEID on cdn_contact(CONTACTTYPEID);
--
create  index IDX_CONT_MI_OWNER on cdn_contact(MI_OWNER);
--
create  index IDX_CONT_MI_CREATEUSER on cdn_contact(MI_CREATEUSER);
--
create  index IDX_CONT_MI_MODIFYUSER on cdn_contact(MI_MODIFYUSER);
--
create  index IDX_CONT_MI_DELETEUSER on cdn_contact(MI_DELETEUSER);
--
create  index idx_contact_subjectID on cdn_contact(SUBJECTID);
--
create unique index UIDX_CONTTY_CODE on cdn_contacttype(CODE,MI_DELETEDATE);
--
create  index IDX_CONTTY_MI_OWNER on cdn_contacttype(MI_OWNER);
--
create  index IDX_CONTTY_MI_CREATEUSER on cdn_contacttype(MI_CREATEUSER);
--
create  index IDX_CONTTY_MI_MODIFYUSER on cdn_contacttype(MI_MODIFYUSER);
--
create  index IDX_CONTTY_MI_DELETEUSER on cdn_contacttype(MI_DELETEUSER);
--
create unique index UIDX_CORIDX_CODE on cdn_corrindex(CODE,MI_DELETEDATE);
--
create  index IDX_CORIDX_MI_OWNER on cdn_corrindex(MI_OWNER);
--
create  index IDX_CORIDX_MI_CREATEUSER on cdn_corrindex(MI_CREATEUSER);
--
create  index IDX_CORIDX_MI_MODIFYUSER on cdn_corrindex(MI_MODIFYUSER);
--
create  index IDX_CORIDX_MI_DELETEUSER on cdn_corrindex(MI_DELETEUSER);
--
create unique index UIDX_CNTR_CODE on cdn_country(CODE,MI_DELETEDATE);
--
create unique index UIDX_CNTR_INTCODE on cdn_country(INTCODE,MI_DELETEDATE);
--
create unique index UIDX_CNTR_SYMBOL2 on cdn_country(SYMBOL2,MI_DELETEDATE);
--
create unique index UIDX_CNTR_SYMBOL3 on cdn_country(SYMBOL3,MI_DELETEDATE);
--
create  index IDX_CNTR_CURRENCYID on cdn_country(CURRENCYID);
--
create  index IDX_CNTR_CAPITALID on cdn_country(CAPITALID);
--
create  index IDX_CNTR_MI_OWNER on cdn_country(MI_OWNER);
--
create  index IDX_CNTR_MI_CREATEUSER on cdn_country(MI_CREATEUSER);
--
create  index IDX_CNTR_MI_MODIFYUSER on cdn_country(MI_MODIFYUSER);
--
create  index IDX_CNTR_MI_DELETEUSER on cdn_country(MI_DELETEUSER);
--
create  index IDX_CURR_MI_OWNER on cdn_currency(MI_OWNER);
--
create  index IDX_CURR_MI_CREATEUSER on cdn_currency(MI_CREATEUSER);
--
create  index IDX_CURR_MI_MODIFYUSER on cdn_currency(MI_MODIFYUSER);
--
create  index IDX_CURR_MI_DELETEUSER on cdn_currency(MI_DELETEUSER);
--
create  index IDX_DEP_DEPTYPEID on cdn_department(DEPTYPEID);
--
create  index IDX_DEP_ORGANIZATIONID on cdn_department(ORGANIZATIONID);
--
create  index IDX_DEP_MI_DATA_ID on cdn_department(MI_DATA_ID);
--
create  index IDX_DEP_MI_OWNER on cdn_department(MI_OWNER);
--
create  index IDX_DEP_MI_CREATEUSER on cdn_department(MI_CREATEUSER);
--
create  index IDX_DEP_MI_MODIFYUSER on cdn_department(MI_MODIFYUSER);
--
create  index IDX_DEP_MI_DELETEUSER on cdn_department(MI_DELETEUSER);
--
create  index IDX_DEP_DTODD on cdn_department(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_DEP_HIST on cdn_department(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create unique index UIDX_DEPT_CODE on cdn_deptype(CODE,MI_DELETEDATE);
--
create  index IDX_DEPT_MI_OWNER on cdn_deptype(MI_OWNER);
--
create  index IDX_DEPT_MI_CREATEUSER on cdn_deptype(MI_CREATEUSER);
--
create  index IDX_DEPT_MI_MODIFYUSER on cdn_deptype(MI_MODIFYUSER);
--
create  index IDX_DEPT_MI_DELETEUSER on cdn_deptype(MI_DELETEUSER);
--
create  index IDX_EMP_DEPARTMENTID on cdn_employee(DEPARTMENTID);
--
create  index IDX_EMP_ORGANIZATIONID on cdn_employee(ORGANIZATIONID);
--
create  index IDX_EMP_MI_DATA_ID on cdn_employee(MI_DATA_ID);
--
create  index IDX_EMP_MI_OWNER on cdn_employee(MI_OWNER);
--
create  index IDX_EMP_MI_CREATEUSER on cdn_employee(MI_CREATEUSER);
--
create  index IDX_EMP_MI_MODIFYUSER on cdn_employee(MI_MODIFYUSER);
--
create  index IDX_EMP_MI_DELETEUSER on cdn_employee(MI_DELETEUSER);
--
create  index IDX_EMP_DTODD on cdn_employee(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_EMP_HIST on cdn_employee(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create  index IDX_CDNLNG_MI_OWNER on cdn_language(MI_OWNER);
--
create  index IDX_CDNLNG_MI_CREATEUSER on cdn_language(MI_CREATEUSER);
--
create  index IDX_CDNLNG_MI_MODIFYUSER on cdn_language(MI_MODIFYUSER);
--
create  index IDX_CDNLNG_MI_DELETEUSER on cdn_language(MI_DELETEUSER);
--
create unique index UIDX_CDN_NATIONALITY_CODE on cdn_nationality(CODE,MI_DELETEDATE);
--
create  index IDX_CDN_NATIONALITY_MI_OWNER on cdn_nationality(MI_OWNER);
--
create  index IDX_CDN_NATIONALITY_MI_CREATEUSER on cdn_nationality(MI_CREATEUSER);
--
create  index IDX_CDN_NATIONALITY_MI_MODIFYUSER on cdn_nationality(MI_MODIFYUSER);
--
create  index IDX_CDN_NATIONALITY_MI_DELETEUSER on cdn_nationality(MI_DELETEUSER);
--
create  index IDX_ORGACC_ORGANIZATIONID on cdn_orgaccount(ORGANIZATIONID);
--
create  index IDX_ORGACC_CURRENCYID on cdn_orgaccount(CURRENCYID);
--
create  index IDX_ORGACC_BANKID on cdn_orgaccount(BANKID);
--
create  index IDX_ORGACC_MI_OWNER on cdn_orgaccount(MI_OWNER);
--
create  index IDX_ORGACC_MI_CREATEUSER on cdn_orgaccount(MI_CREATEUSER);
--
create  index IDX_ORGACC_MI_MODIFYUSER on cdn_orgaccount(MI_MODIFYUSER);
--
create  index IDX_ORGACC_MI_DELETEUSER on cdn_orgaccount(MI_DELETEUSER);
--
create unique index UIDX_ORGACC_ACCCODE on cdn_orgaccount(CODE,CURRENCYID,BANKID,MI_DELETEDATE);
--
create unique index UIDX_ORG_OKPOCODE on cdn_organization(OKPOCODE,MI_DATETO,MI_DELETEDATE);
--
create  index IDX_ORG_ORGBUSINESSTYPEID on cdn_organization(ORGBUSINESSTYPEID);
--
create  index IDX_ORG_ORGOWNERSHIPTYPEID on cdn_organization(ORGOWNERSHIPTYPEID);
--
create  index IDX_ORG_CORRINDEXID on cdn_organization(CORRINDEXID);
--
create  index IDX_ORG_MI_DATA_ID on cdn_organization(MI_DATA_ID);
--
create  index IDX_ORG_MI_OWNER on cdn_organization(MI_OWNER);
--
create  index IDX_ORG_MI_CREATEUSER on cdn_organization(MI_CREATEUSER);
--
create  index IDX_ORG_MI_MODIFYUSER on cdn_organization(MI_MODIFYUSER);
--
create  index IDX_ORG_MI_DELETEUSER on cdn_organization(MI_DELETEUSER);
--
create  index IDX_ORG_DTODD on cdn_organization(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_ORG_HIST on cdn_organization(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create unique index UIDX_ORGBT_CODE on cdn_orgbusinesstype(CODE,MI_DELETEDATE);
--
create  index IDX_ORGBT_MI_OWNER on cdn_orgbusinesstype(MI_OWNER);
--
create  index IDX_ORGBT_MI_CREATEUSER on cdn_orgbusinesstype(MI_CREATEUSER);
--
create  index IDX_ORGBT_MI_MODIFYUSER on cdn_orgbusinesstype(MI_MODIFYUSER);
--
create  index IDX_ORGBT_MI_DELETEUSER on cdn_orgbusinesstype(MI_DELETEUSER);
--
create unique index UIDX_ORGOT_CODE on cdn_orgownershiptype(CODE,MI_DELETEDATE);
--
create  index IDX_ORGOT_MI_OWNER on cdn_orgownershiptype(MI_OWNER);
--
create  index IDX_ORGOT_MI_CREATEUSER on cdn_orgownershiptype(MI_CREATEUSER);
--
create  index IDX_ORGOT_MI_MODIFYUSER on cdn_orgownershiptype(MI_MODIFYUSER);
--
create  index IDX_ORGOT_MI_DELETEUSER on cdn_orgownershiptype(MI_DELETEUSER);
--
create  index IDX_CPERS_REGIONID on cdn_person(REGIONID);
--
create  index IDX_CPERS_SOCIALSTATUSID on cdn_person(SOCIALSTATUSID);
--
create  index IDX_CPERS_CATEGORYID on cdn_person(CATEGORYID);
--
create  index IDX_CPERS_NATIONALITY on cdn_person(NATIONALITY);
--
create  index IDX_CPERS_CLASSID on cdn_person(CLASSID);
--
create  index IDX_CPERS_MI_DATA_ID on cdn_person(MI_DATA_ID);
--
create  index IDX_CPERS_MI_OWNER on cdn_person(MI_OWNER);
--
create  index IDX_CPERS_MI_CREATEUSER on cdn_person(MI_CREATEUSER);
--
create  index IDX_CPERS_MI_MODIFYUSER on cdn_person(MI_MODIFYUSER);
--
create  index IDX_CPERS_MI_DELETEUSER on cdn_person(MI_DELETEUSER);
--
create  index IDX_CPERS_DTODD on cdn_person(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_CPERS_HIST on cdn_person(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create unique index UIDX_CATEGORY_CODE on cdn_personcategory(CODE,MI_DELETEDATE);
--
create  index IDX_CATEGORY_MI_OWNER on cdn_personcategory(MI_OWNER);
--
create  index IDX_CATEGORY_MI_CREATEUSER on cdn_personcategory(MI_CREATEUSER);
--
create  index IDX_CATEGORY_MI_MODIFYUSER on cdn_personcategory(MI_MODIFYUSER);
--
create  index IDX_CATEGORY_MI_DELETEUSER on cdn_personcategory(MI_DELETEUSER);
--
create unique index UIDX_CDN_PERSONCLASS_CODE on cdn_personclass(CODE,MI_DELETEDATE);
--
create  index IDX_CDN_PERSONCLASS_MI_OWNER on cdn_personclass(MI_OWNER);
--
create  index IDX_CDN_PERSONCLASS_MI_CREATEUSER on cdn_personclass(MI_CREATEUSER);
--
create  index IDX_CDN_PERSONCLASS_MI_MODIFYUSER on cdn_personclass(MI_MODIFYUSER);
--
create  index IDX_CDN_PERSONCLASS_MI_DELETEUSER on cdn_personclass(MI_DELETEUSER);
--
create unique index UIDX_PSOCST_CODE on cdn_personsocialstatus(CODE,MI_DELETEDATE);
--
create  index IDX_PSOCST_MI_OWNER on cdn_personsocialstatus(MI_OWNER);
--
create  index IDX_PSOCST_MI_CREATEUSER on cdn_personsocialstatus(MI_CREATEUSER);
--
create  index IDX_PSOCST_MI_MODIFYUSER on cdn_personsocialstatus(MI_MODIFYUSER);
--
create  index IDX_PSOCST_MI_DELETEUSER on cdn_personsocialstatus(MI_DELETEUSER);
--
create  index IDX_POSTIDX_STREETID on cdn_postindex(STREETID);
--
create  index IDX_POSTIDX_MI_OWNER on cdn_postindex(MI_OWNER);
--
create  index IDX_POSTIDX_MI_CREATEUSER on cdn_postindex(MI_CREATEUSER);
--
create  index IDX_POSTIDX_MI_MODIFYUSER on cdn_postindex(MI_MODIFYUSER);
--
create  index IDX_POSTIDX_MI_DELETEUSER on cdn_postindex(MI_DELETEUSER);
--
create unique index UIDX_CDNPROF_CODE on cdn_profession(CODE,MI_DELETEDATE);
--
create  index IDX_CDNPROF_MI_OWNER on cdn_profession(MI_OWNER);
--
create  index IDX_CDNPROF_MI_CREATEUSER on cdn_profession(MI_CREATEUSER);
--
create  index IDX_CDNPROF_MI_MODIFYUSER on cdn_profession(MI_MODIFYUSER);
--
create  index IDX_CDNPROF_MI_DELETEUSER on cdn_profession(MI_DELETEUSER);
--
create  index IDX_REGN_PARENTADMINUNITID on cdn_region(PARENTADMINUNITID);
--
create unique index UIDX_REGN_CODE on cdn_region(CODE,MI_DATETO,MI_DELETEDATE);
--
create  index IDX_REGN_REGIONTYPEID on cdn_region(REGIONTYPEID);
--
create  index IDX_REGN_CENTERID on cdn_region(CENTERID);
--
create  index IDX_REGN_MI_DATA_ID on cdn_region(MI_DATA_ID);
--
create  index IDX_REGN_MI_OWNER on cdn_region(MI_OWNER);
--
create  index IDX_REGN_MI_CREATEUSER on cdn_region(MI_CREATEUSER);
--
create  index IDX_REGN_MI_MODIFYUSER on cdn_region(MI_MODIFYUSER);
--
create  index IDX_REGN_MI_DELETEUSER on cdn_region(MI_DELETEUSER);
--
create  index IDX_REGN_DTODD on cdn_region(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_REGN_HIST on cdn_region(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create  index IDX_REGNT_MI_OWNER on cdn_regiontype(MI_OWNER);
--
create  index IDX_REGNT_MI_CREATEUSER on cdn_regiontype(MI_CREATEUSER);
--
create  index IDX_REGNT_MI_MODIFYUSER on cdn_regiontype(MI_MODIFYUSER);
--
create  index IDX_REGNT_MI_DELETEUSER on cdn_regiontype(MI_DELETEUSER);
--
create  index IDX_STUNT_MI_OWNER on cdn_staffunittype(MI_OWNER);
--
create  index IDX_STUNT_MI_CREATEUSER on cdn_staffunittype(MI_CREATEUSER);
--
create  index IDX_STUNT_MI_MODIFYUSER on cdn_staffunittype(MI_MODIFYUSER);
--
create  index IDX_STUNT_MI_DELETEUSER on cdn_staffunittype(MI_DELETEUSER);
--
create  index IDX_STREET_CITYID on cdn_street(CITYID);
--
create  index IDX_STREET_MI_DATA_ID on cdn_street(MI_DATA_ID);
--
create  index IDX_STREET_MI_OWNER on cdn_street(MI_OWNER);
--
create  index IDX_STREET_MI_CREATEUSER on cdn_street(MI_CREATEUSER);
--
create  index IDX_STREET_MI_MODIFYUSER on cdn_street(MI_MODIFYUSER);
--
create  index IDX_STREET_MI_DELETEUSER on cdn_street(MI_DELETEUSER);
--
create  index IDX_STREET_DTODD on cdn_street(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_STREET_HIST on cdn_street(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create  index IDX_DE_ATTRIBUTE_PARENTENTITY on de_attribute(PARENTENTITY);
--
create  index IDX_DE_ENTITY_PARENTMODEL on de_entity(PARENTMODEL);
--
create  index IDX_DE_RULEATTRIBUTE_PARENTRULEENTITY on de_ruleAttribute(PARENTRULEENTITY);
--
create  index IDX_DE_RULEATTRIBUTE_ATTRIBUTESOURCE on de_ruleAttribute(ATTRIBUTESOURCE);
--
create  index IDX_DE_RULEATTRIBUTE_ATTRIBUTEDESTINATION on de_ruleAttribute(ATTRIBUTEDESTINATION);
--
create  index IDX_DE_RULEENTITY_PARENTRULEMODEL on de_ruleEntity(PARENTRULEMODEL);
--
create  index IDX_DE_RULEENTITY_ENTITYSOURCE on de_ruleEntity(ENTITYSOURCE);
--
create  index IDX_DE_RULEENTITY_ENTITYDESTINATION on de_ruleEntity(ENTITYDESTINATION);
--
create  index IDX_DE_RULEMODEL_MODELSOURCE on de_ruleModel(MODELSOURCE);
--
create  index IDX_DE_RULEMODEL_MODELDESTINATION on de_ruleModel(MODELDESTINATION);
--
create  index IDX_ODEP_PARENTID on org_department(PARENTID);
--
create  index IDX_ODEP_DEPTYPEID on org_department(DEPTYPEID);
--
create  index IDX_ODEP_MI_DATA_ID on org_department(MI_DATA_ID);
--
create  index IDX_ODEP_MI_OWNER on org_department(MI_OWNER);
--
create  index IDX_ODEP_MI_CREATEUSER on org_department(MI_CREATEUSER);
--
create  index IDX_ODEP_MI_MODIFYUSER on org_department(MI_MODIFYUSER);
--
create  index IDX_ODEP_MI_DELETEUSER on org_department(MI_DELETEUSER);
--
create  index IDX_ODEP_DTODD on org_department(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_ODEP_HIST on org_department(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create  index IDX_ODIAGRAM_ORGUNITID on org_diagram(ORGUNITID);
--
create  index IDX_ODIAGRAM_MI_OWNER on org_diagram(MI_OWNER);
--
create  index IDX_ODIAGRAM_MI_CREATEUSER on org_diagram(MI_CREATEUSER);
--
create  index IDX_ODIAGRAM_MI_MODIFYUSER on org_diagram(MI_MODIFYUSER);
--
create  index IDX_ODIAGRAM_MI_DELETEUSER on org_diagram(MI_DELETEUSER);
--
create unique index UIDX_OEMP_CODE on org_employee(CODE,MI_DATETO,MI_DELETEDATE);
--
create  index IDX_OEMP_USERID on org_employee(USERID);
--
create  index IDX_OEMP_MI_DATA_ID on org_employee(MI_DATA_ID);
--
create  index IDX_OEMP_MI_OWNER on org_employee(MI_OWNER);
--
create  index IDX_OEMP_MI_CREATEUSER on org_employee(MI_CREATEUSER);
--
create  index IDX_OEMP_MI_MODIFYUSER on org_employee(MI_MODIFYUSER);
--
create  index IDX_OEMP_MI_DELETEUSER on org_employee(MI_DELETEUSER);
--
create  index IDX_OEMP_DTODD on org_employee(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_OEMP_HIST on org_employee(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create  index IDX_EMPONS_EMPLOYEEID on org_employeeonstaff(EMPLOYEEID);
--
create  index IDX_EMPONS_STAFFUNITID on org_employeeonstaff(STAFFUNITID);
--
create  index IDX_EMPONS_MI_DATA_ID on org_employeeonstaff(MI_DATA_ID);
--
create  index IDX_EMPONS_MI_OWNER on org_employeeonstaff(MI_OWNER);
--
create  index IDX_EMPONS_MI_CREATEUSER on org_employeeonstaff(MI_CREATEUSER);
--
create  index IDX_EMPONS_MI_MODIFYUSER on org_employeeonstaff(MI_MODIFYUSER);
--
create  index IDX_EMPONS_MI_DELETEUSER on org_employeeonstaff(MI_DELETEUSER);
--
create  index IDX_EMPONS_DTODD on org_employeeonstaff(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_EMPONS_HIST on org_employeeonstaff(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create  index IDX_EMPONPEND_EMPONSTAFFID on org_employeeonstaff_pending(EMPONSTAFFID);
--
create  index IDX_EMPONPEND_MI_OWNER on org_employeeonstaff_pending(MI_OWNER);
--
create  index IDX_EMPONPEND_MI_CREATEUSER on org_employeeonstaff_pending(MI_CREATEUSER);
--
create  index IDX_EMPONPEND_MI_MODIFYUSER on org_employeeonstaff_pending(MI_MODIFYUSER);
--
create  index IDX_ORGEXGR_PARENTID on org_execgroup(PARENTID);
--
create  index IDX_ORGEXGR_MI_DATA_ID on org_execgroup(MI_DATA_ID);
--
create  index IDX_ORGEXGR_MI_OWNER on org_execgroup(MI_OWNER);
--
create  index IDX_ORGEXGR_MI_CREATEUSER on org_execgroup(MI_CREATEUSER);
--
create  index IDX_ORGEXGR_MI_MODIFYUSER on org_execgroup(MI_MODIFYUSER);
--
create  index IDX_ORGEXGR_MI_DELETEUSER on org_execgroup(MI_DELETEUSER);
--
create  index IDX_ORGEXGR_DTODD on org_execgroup(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_ORGEXGR_HIST on org_execgroup(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create  index IDX_ORGEXGRM_EXECGROUPID on org_execgroupmember(EXECGROUPID);
--
create  index IDX_ORGEXGRM_ORGUNITID on org_execgroupmember(ORGUNITID);
--
create  index IDX_ORGEXGRM_MI_OWNER on org_execgroupmember(MI_OWNER);
--
create  index IDX_ORGEXGRM_MI_CREATEUSER on org_execgroupmember(MI_CREATEUSER);
--
create  index IDX_ORGEXGRM_MI_MODIFYUSER on org_execgroupmember(MI_MODIFYUSER);
--
create unique index IDX_ORGEXECGRPM_GRID_UID on org_execgroupmember(EXECGROUPID,ORGUNITID);
--
create  index IDX_UORGACC_ORGANIZATIONID on org_orgaccount(ORGANIZATIONID);
--
create  index IDX_UORGACC_CURRENCYID on org_orgaccount(CURRENCYID);
--
create  index IDX_UORGACC_BANKID on org_orgaccount(BANKID);
--
create  index IDX_UORGACC_MI_OWNER on org_orgaccount(MI_OWNER);
--
create  index IDX_UORGACC_MI_CREATEUSER on org_orgaccount(MI_CREATEUSER);
--
create  index IDX_UORGACC_MI_MODIFYUSER on org_orgaccount(MI_MODIFYUSER);
--
create  index IDX_UORGACC_MI_DELETEUSER on org_orgaccount(MI_DELETEUSER);
--
create  index IDX_OORG_PARENTID on org_organization(PARENTID);
--
create unique index UIDX_OORG_CODE on org_organization(CODE,MI_DATETO,MI_DELETEDATE);
--
create  index IDX_OORG_ORGBUSINESSTYPEID on org_organization(ORGBUSINESSTYPEID);
--
create  index IDX_OORG_ORGOWNERSHIPTYPEID on org_organization(ORGOWNERSHIPTYPEID);
--
create  index IDX_OORG_MI_DATA_ID on org_organization(MI_DATA_ID);
--
create  index IDX_OORG_MI_OWNER on org_organization(MI_OWNER);
--
create  index IDX_OORG_MI_CREATEUSER on org_organization(MI_CREATEUSER);
--
create  index IDX_OORG_MI_MODIFYUSER on org_organization(MI_MODIFYUSER);
--
create  index IDX_OORG_MI_DELETEUSER on org_organization(MI_DELETEUSER);
--
create  index IDX_OORG_DTODD on org_organization(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_OORG_HIST on org_organization(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create unique index UIDX_PROF_CODE on org_profession(CODE,MI_DELETEDATE);
--
create  index IDX_PROF_MI_OWNER on org_profession(MI_OWNER);
--
create  index IDX_PROF_MI_CREATEUSER on org_profession(MI_CREATEUSER);
--
create  index IDX_PROF_MI_MODIFYUSER on org_profession(MI_MODIFYUSER);
--
create  index IDX_PROF_MI_DELETEUSER on org_profession(MI_DELETEUSER);
--
create  index IDX_STUNIT_PARENTID on org_staffunit(PARENTID);
--
create unique index UIDX_STUNIT_CODE on org_staffunit(CODE,MI_DATETO,MI_DELETEDATE);
--
create  index IDX_STUNIT_PROFESSIONEXTID on org_staffunit(PROFESSIONEXTID);
--
create  index IDX_STUNIT_PROFESSIONID on org_staffunit(PROFESSIONID);
--
create  index IDX_STUNIT_STAFFUNITTYPEID on org_staffunit(STAFFUNITTYPEID);
--
create  index IDX_STUNIT_MI_DATA_ID on org_staffunit(MI_DATA_ID);
--
create  index IDX_STUNIT_MI_OWNER on org_staffunit(MI_OWNER);
--
create  index IDX_STUNIT_MI_CREATEUSER on org_staffunit(MI_CREATEUSER);
--
create  index IDX_STUNIT_MI_MODIFYUSER on org_staffunit(MI_MODIFYUSER);
--
create  index IDX_STUNIT_MI_DELETEUSER on org_staffunit(MI_DELETEUSER);
--
create  index IDX_STUNIT_DTODD on org_staffunit(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_STUNIT_HIST on org_staffunit(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create  index IDX_OUNIT_PARENTID on org_unit(PARENTID);
--
create  index IDX_OUNIT_MI_DATA_ID on org_unit(MI_DATA_ID);
--
create  index IDX_OUNIT_MI_OWNER on org_unit(MI_OWNER);
--
create  index IDX_OUNIT_MI_CREATEUSER on org_unit(MI_CREATEUSER);
--
create  index IDX_OUNIT_MI_MODIFYUSER on org_unit(MI_MODIFYUSER);
--
create  index IDX_OUNIT_MI_DELETEUSER on org_unit(MI_DELETEUSER);
--
create  index IDX_OUNIT_TREEPATH on org_unit(MI_TREEPATH);
--
create  index IDX_OUNIT_DTODD on org_unit(MI_DATETO,MI_DELETEDATE);
--
create unique index UIDX_OUNIT_HIST on org_unit(MI_DATEFROM,MI_DATA_ID,MI_DELETEDATE);
--
create unique index UIDX_BHIST_IAR on ub_blobHistory(INSTANCE,ATTRIBUTE,REVISION);
--
create unique index UIDX_UBA_ADVSECURITY_USERID on uba_advSecurity(USERID);
--
create  index IDX_UBA_ADVSECURITY_MI_OWNER on uba_advSecurity(MI_OWNER);
--
create  index IDX_UBA_ADVSECURITY_MI_CREATEUSER on uba_advSecurity(MI_CREATEUSER);
--
create  index IDX_UBA_ADVSECURITY_MI_MODIFYUSER on uba_advSecurity(MI_MODIFYUSER);
--
create unique index UK_UBA_ALS_EASR on uba_als(ENTITY,ATTRIBUTE,STATE,ROLENAME);
--
create  index idx_saud_targetUser on uba_audit(TARGETUSER);
--
create  index idx_audtr_entity on uba_auditTrail(ENTITYINFO_ID);
--
create  index idx_audtr_parententinfoid on uba_auditTrail(PARENTENTITYINFO_ID);
--
create  index IDX_ELS_RULEROLE on uba_els(RULEROLE);
--
create  index IDX_ELS_MI_OWNER on uba_els(MI_OWNER);
--
create  index IDX_ELS_MI_CREATEUSER on uba_els(MI_CREATEUSER);
--
create  index IDX_ELS_MI_MODIFYUSER on uba_els(MI_MODIFYUSER);
--
create unique index UIDX_GR_CODE on uba_group(CODE);
--
create unique index UIDX_GR_NAME on uba_group(NAME);
--
create  index IDX_GR_MI_OWNER on uba_group(MI_OWNER);
--
create  index IDX_GR_MI_CREATEUSER on uba_group(MI_CREATEUSER);
--
create  index IDX_GR_MI_MODIFYUSER on uba_group(MI_MODIFYUSER);
--
create  index IDX_UBA_GROUPROLE_GROUPID on uba_grouprole(GROUPID);
--
create  index IDX_UBA_GROUPROLE_ROLEID on uba_grouprole(ROLEID);
--
create  index IDX_UBA_GROUPROLE_MI_OWNER on uba_grouprole(MI_OWNER);
--
create  index IDX_UBA_GROUPROLE_MI_CREATEUSER on uba_grouprole(MI_CREATEUSER);
--
create  index IDX_UBA_GROUPROLE_MI_MODIFYUSER on uba_grouprole(MI_MODIFYUSER);
--
create unique index UK_GRPROLE_USER_ROLE on uba_grouprole(GROUPID,ROLEID);
--
create  index IDX_OTP_USERID on uba_otp(USERID);
--
create  index IDX_OTP_MI_OWNER on uba_otp(MI_OWNER);
--
create  index IDX_OTP_MI_CREATEUSER on uba_otp(MI_CREATEUSER);
--
create  index IDX_OTP_MI_MODIFYUSER on uba_otp(MI_MODIFYUSER);
--
create unique index uidx_otp on uba_otp(OTP);
--
create  index IDX_PREVP_USERID on uba_prevPasswordsHash(USERID);
--
create  index IDX_PREVP_MI_OWNER on uba_prevPasswordsHash(MI_OWNER);
--
create  index IDX_PREVP_MI_CREATEUSER on uba_prevPasswordsHash(MI_CREATEUSER);
--
create  index IDX_PREVP_MI_MODIFYUSER on uba_prevPasswordsHash(MI_MODIFYUSER);
--
create unique index UIDX_ROLE_NAME on uba_role(NAME);
--
create  index IDX_ROLE_MI_OWNER on uba_role(MI_OWNER);
--
create  index IDX_ROLE_MI_CREATEUSER on uba_role(MI_CREATEUSER);
--
create  index IDX_ROLE_MI_MODIFYUSER on uba_role(MI_MODIFYUSER);
--
create  index IDX_SUBJ_NAME on uba_subject(NAME);
--
create unique index UIDX_USR_NAME on uba_user(NAME);
--
create  index IDX_USR_MI_OWNER on uba_user(MI_OWNER);
--
create  index IDX_USR_MI_CREATEUSER on uba_user(MI_CREATEUSER);
--
create  index IDX_USR_MI_MODIFYUSER on uba_user(MI_MODIFYUSER);
--
create  index IDX_USRCER_USERID on uba_usercertificate(USERID);
--
create unique index UIDX_USRCER_SERIAL on uba_usercertificate(SERIAL);
--
create  index IDX_USRCER_MI_OWNER on uba_usercertificate(MI_OWNER);
--
create  index IDX_USRCER_MI_CREATEUSER on uba_usercertificate(MI_CREATEUSER);
--
create  index IDX_USRCER_MI_MODIFYUSER on uba_usercertificate(MI_MODIFYUSER);
--
create unique index uidx_usercert on uba_usercertificate(SERIAL,ISSUER_SERIAL,USERID);
--
create  index IDX_USRGROUP_USERID on uba_usergroup(USERID);
--
create  index IDX_USRGROUP_GROUPID on uba_usergroup(GROUPID);
--
create  index IDX_USRGROUP_MI_OWNER on uba_usergroup(MI_OWNER);
--
create  index IDX_USRGROUP_MI_CREATEUSER on uba_usergroup(MI_CREATEUSER);
--
create  index IDX_USRGROUP_MI_MODIFYUSER on uba_usergroup(MI_MODIFYUSER);
--
create unique index UK_USRGROUP_USER_GROUP on uba_usergroup(USERID,GROUPID);
--
create  index IDX_USROLE_USERID on uba_userrole(USERID);
--
create  index IDX_USROLE_ROLEID on uba_userrole(ROLEID);
--
create  index IDX_USROLE_MI_OWNER on uba_userrole(MI_OWNER);
--
create  index IDX_USROLE_MI_CREATEUSER on uba_userrole(MI_CREATEUSER);
--
create  index IDX_USROLE_MI_MODIFYUSER on uba_userrole(MI_MODIFYUSER);
--
create unique index UK_USRROLE_USER_ROLE on uba_userrole(USERID,ROLEID);
--
create unique index UIDX_DESK_CODE on ubm_desktop(CODE,MI_DELETEDATE);
--
create  index IDX_DESK_MI_OWNER on ubm_desktop(MI_OWNER);
--
create  index IDX_DESK_MI_CREATEUSER on ubm_desktop(MI_CREATEUSER);
--
create  index IDX_DESK_MI_MODIFYUSER on ubm_desktop(MI_MODIFYUSER);
--
create  index IDX_DESK_MI_DELETEUSER on ubm_desktop(MI_DELETEUSER);
--
create  index IDX_ADMDESK_INSTANCEID on ubm_desktop_adm(INSTANCEID);
--
create  index IDX_ADMDESK_ADMSUBJID on ubm_desktop_adm(ADMSUBJID);
--
create unique index UK_ADMDESC_INST_ADMSUBJ on ubm_desktop_adm(INSTANCEID,ADMSUBJID);
--
create  index IDX_ENU_MI_OWNER on ubm_enum(MI_OWNER);
--
create  index IDX_ENU_MI_CREATEUSER on ubm_enum(MI_CREATEUSER);
--
create  index IDX_ENU_MI_MODIFYUSER on ubm_enum(MI_MODIFYUSER);
--
create  index IDX_ENU_MI_DELETEUSER on ubm_enum(MI_DELETEUSER);
--
create unique index UK_UBM_ENUM_GROUPCODE on ubm_enum(EGROUP,CODE,MI_DELETEDATE);
--
create  index IDX_NAVSH_DESKTOPID on ubm_navshortcut(DESKTOPID);
--
create  index IDX_NAVSH_PARENTID on ubm_navshortcut(PARENTID);
--
create unique index UIDX_NAVSH_CODE on ubm_navshortcut(CODE,MI_DELETEDATE);
--
create  index IDX_NAVSH_MI_OWNER on ubm_navshortcut(MI_OWNER);
--
create  index IDX_NAVSH_MI_CREATEUSER on ubm_navshortcut(MI_CREATEUSER);
--
create  index IDX_NAVSH_MI_MODIFYUSER on ubm_navshortcut(MI_MODIFYUSER);
--
create  index IDX_NAVSH_MI_DELETEUSER on ubm_navshortcut(MI_DELETEUSER);
--
create  index IDX_NAVSH_TREEPATH on ubm_navshortcut(MI_TREEPATH);
--
create  index IDX_ADMNAV_INSTANCEID on ubm_navshortcut_adm(INSTANCEID);
--
create  index IDX_ADMNAV_ADMSUBJID on ubm_navshortcut_adm(ADMSUBJID);
--
create unique index UK_ADMNAV_INST_ADMSUBJ on ubm_navshortcut_adm(INSTANCEID,ADMSUBJID);
--
create unique index UIDX_UBMQR_CODE on ubm_query(CODE,MI_DELETEDATE);
--
create  index IDX_UBMQR_MI_OWNER on ubm_query(MI_OWNER);
--
create  index IDX_UBMQR_MI_CREATEUSER on ubm_query(MI_CREATEUSER);
--
create  index IDX_UBMQR_MI_MODIFYUSER on ubm_query(MI_MODIFYUSER);
--
create  index IDX_UBMQR_MI_DELETEUSER on ubm_query(MI_DELETEUSER);
--
create  index IDX_SFILTER_OWNER on ubs_filter(OWNER);
--
create  index IDX_SFILTER_MI_OWNER on ubs_filter(MI_OWNER);
--
create  index IDX_SFILTER_MI_CREATEUSER on ubs_filter(MI_CREATEUSER);
--
create  index IDX_SFILTER_MI_MODIFYUSER on ubs_filter(MI_MODIFYUSER);
--
create unique index uix_ubs_filter on ubs_filter(CODE,OWNER,NAME);
--
create  index ix_ubs_filter_code on ubs_filter(CODE);
--
create  index IDX_MSG_MI_OWNER on ubs_message(MI_OWNER);
--
create  index IDX_MSG_MI_CREATEUSER on ubs_message(MI_CREATEUSER);
--
create  index IDX_MSG_MI_MODIFYUSER on ubs_message(MI_MODIFYUSER);
--
create  index IDX_MSG_MI_DELETEUSER on ubs_message(MI_DELETEUSER);
--
create  index idx_ubsmsg_period on ubs_message(STARTDATE,EXPIREDATE);
--
create  index IDX_MSG_RC_MESSAGEID on ubs_message_recipient(MESSAGEID);
--
create  index IDX_MSG_RC_USERID on ubs_message_recipient(USERID);
--
create  index uidx_ubsmsg_rc on ubs_message_recipient(MESSAGEID,USERID);
--
create unique index UIDX_NUCO_REGKEY on ubs_numcounter(REGKEY);
--
create unique index UK_UBS_NUMCOUNT_RKC on ubs_numcounterreserv(REGKEY,COUNTER);
--
create unique index UIDX_STNGS_SETTINGKEY on ubs_settings(SETTINGKEY);
--
create  index IDX_STNGS_MI_OWNER on ubs_settings(MI_OWNER);
--
create  index IDX_STNGS_MI_CREATEUSER on ubs_settings(MI_CREATEUSER);
--
create  index IDX_STNGS_MI_MODIFYUSER on ubs_settings(MI_MODIFYUSER);
--
create  index IDX_SLOCK_LOCKUSER on ubs_softLock(LOCKUSER);
--
create unique index UIDX_SOFTLOCK_LOENT on ubs_softLock(LOCKID,ENTITY);
 
-- Create check constraint
--#############################################################
alter table cdn_building add constraint CHK_BUILDING_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table cdn_department add constraint CHK_DEP_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table cdn_employee add constraint CHK_EMP_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table cdn_language add constraint CHK_CDNLNG_isRTL_BOOL check (isRTL in (0,1));
--
alter table cdn_organization add constraint CHK_ORG_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table cdn_orgbusinesstype add constraint CHK_ORGBT_isGovAuthority_BOOL check (isGovAuthority in (0,1));
--
alter table cdn_person add constraint CHK_CPERS_resident_BOOL check (resident in (0,1));
--
alter table cdn_person add constraint CHK_CPERS_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table cdn_region add constraint CHK_REGN_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table cdn_street add constraint CHK_STREET_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table org_department add constraint CHK_ODEP_isClerical_BOOL check (isClerical in (0,1));
--
alter table org_department add constraint CHK_ODEP_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table org_diagram add constraint CHK_ODIAGRAM_isdefault_BOOL check (isdefault in (0,1));
--
alter table org_employee add constraint CHK_OEMP_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table org_employeeonstaff add constraint CHK_EMPONS_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table org_execgroup add constraint CHK_ORGEXGR_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table org_organization add constraint CHK_OORG_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table org_staffunit add constraint CHK_STUNIT_isBoss_BOOL check (isBoss in (0,1));
--
alter table org_staffunit add constraint CHK_STUNIT_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table org_unit add constraint CHK_OUNIT_HIST check (mi_dateFrom <= mi_dateTo);
--
alter table ub_blobHistory add constraint CHK_UB_BLOBHISTORY_permanent_BOOL check (permanent in (0,1));
--
alter table uba_advSecurity add constraint CHK_UBA_ADVSECURITY_refreshIP_BOOL check (refreshIP in (0,1));
--
alter table uba_advSecurity add constraint CHK_UBA_ADVSECURITY_refreshFp_BOOL check (refreshFp in (0,1));
--
alter table uba_advSecurity add constraint CHK_UBA_ADVSECURITY_refreshKeyMedia_BOOL check (refreshKeyMedia in (0,1));
--
alter table uba_els add constraint CHK_ELS_disabled_BOOL check (disabled in (0,1));
--
alter table uba_user add constraint CHK_USR_disabled_BOOL check (disabled in (0,1));
--
alter table uba_user add constraint CHK_USR_isPending_BOOL check (isPending in (0,1));
--
alter table uba_usercertificate add constraint CHK_USRCER_disabled_BOOL check (disabled in (0,1));
--
alter table uba_usercertificate add constraint CHK_USRCER_revoked_BOOL check (revoked in (0,1));
--
alter table ubm_desktop add constraint CHK_DESK_isDefault_BOOL check (isDefault in (0,1));
--
alter table ubm_navshortcut add constraint CHK_NAVSH_isFolder_BOOL check (isFolder in (0,1));
--
alter table ubm_navshortcut add constraint CHK_NAVSH_inWindow_BOOL check (inWindow in (0,1));
--
alter table ubm_navshortcut add constraint CHK_NAVSH_isCollapsed_BOOL check (isCollapsed in (0,1));
--
alter table ubs_filter add constraint CHK_SFILTER_isGlobal_BOOL check (isGlobal in (0,1));
--
alter table ubs_message add constraint CHK_MSG_complete_BOOL check (complete in (0,1));
 
-- Create foreign keys
--#############################################################
alter table cdn_address add constraint FK_ADDR_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_address add constraint FK_ADDR_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_address add constraint FK_ADDR_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_address add constraint FK_ADDR_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_adminunit add constraint FK_ADMUNT_PARENTADMINUNITID_REF_ADMUNT foreign key (PARENTADMINUNITID) references cdn_adminunit(ID);
--
alter table cdn_adminunit add constraint FK_ADMUNT_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_adminunit add constraint FK_ADMUNT_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_adminunit add constraint FK_ADMUNT_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_adminunit add constraint FK_ADMUNT_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_bank add constraint FK_BANK_COUNTRYID_REF_CNTR foreign key (COUNTRYID) references cdn_country(ID);
--
alter table cdn_bank add constraint FK_BANK_CITYID_REF_CITY foreign key (CITYID) references cdn_city(ID);
--
alter table cdn_bank add constraint FK_BANK_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_bank add constraint FK_BANK_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_bank add constraint FK_BANK_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_bank add constraint FK_BANK_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_building add constraint FK_BUILDING_STREETID_REF_STREET foreign key (STREETID) references cdn_street(ID);
--
alter table cdn_building add constraint FK_BUILDING_POSTINDEXID_REF_POSTIDX foreign key (POSTINDEXID) references cdn_postindex(ID);
--
alter table cdn_building add constraint FK_BUILDING_MI_DATA_ID_REF_BUILDING foreign key (MI_DATA_ID) references cdn_building(ID);
--
alter table cdn_building add constraint FK_BUILDING_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_building add constraint FK_BUILDING_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_building add constraint FK_BUILDING_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_building add constraint FK_BUILDING_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_city add constraint FK_CITY_PARENTADMINUNITID_REF_ADMUNT foreign key (PARENTADMINUNITID) references cdn_adminunit(ID);
--
alter table cdn_city add constraint FK_CITY_CITYTYPEID_REF_CITYT foreign key (CITYTYPEID) references cdn_citytype(ID);
--
alter table cdn_city add constraint FK_CITY_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_city add constraint FK_CITY_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_city add constraint FK_CITY_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_city add constraint FK_CITY_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_city add constraint FK_CITY_ID_REF_ADMUNT foreign key (ID) references cdn_adminunit(ID);
--
alter table cdn_citytype add constraint FK_CITYT_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_citytype add constraint FK_CITYT_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_citytype add constraint FK_CITYT_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_citytype add constraint FK_CITYT_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_classifier add constraint FK_CDNCLS_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_classifier add constraint FK_CDNCLS_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_classifier add constraint FK_CDNCLS_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_classifier add constraint FK_CDNCLS_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_classifieritem add constraint FK_CDNCLSI_CLASSIFIERID_REF_CDNCLS foreign key (CLASSIFIERID) references cdn_classifier(ID);
--
alter table cdn_classifieritem add constraint FK_CDNCLSI_PARENTID_REF_CDNCLSI foreign key (PARENTID) references cdn_classifieritem(ID);
--
alter table cdn_classifieritem add constraint FK_CDNCLSI_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_classifieritem add constraint FK_CDNCLSI_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_classifieritem add constraint FK_CDNCLSI_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_classifieritem add constraint FK_CDNCLSI_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_contact add constraint FK_CONT_CONTACTTYPEID_REF_CONTTY foreign key (CONTACTTYPEID) references cdn_contacttype(ID);
--
alter table cdn_contact add constraint FK_CONT_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_contact add constraint FK_CONT_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_contact add constraint FK_CONT_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_contact add constraint FK_CONT_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_contacttype add constraint FK_CONTTY_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_contacttype add constraint FK_CONTTY_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_contacttype add constraint FK_CONTTY_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_contacttype add constraint FK_CONTTY_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_corrindex add constraint FK_CORIDX_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_corrindex add constraint FK_CORIDX_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_corrindex add constraint FK_CORIDX_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_corrindex add constraint FK_CORIDX_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_country add constraint FK_CNTR_CURRENCYID_REF_CURR foreign key (CURRENCYID) references cdn_currency(ID);
--
alter table cdn_country add constraint FK_CNTR_CAPITALID_REF_CITY foreign key (CAPITALID) references cdn_city(ID);
--
alter table cdn_country add constraint FK_CNTR_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_country add constraint FK_CNTR_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_country add constraint FK_CNTR_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_country add constraint FK_CNTR_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_country add constraint FK_CNTR_ID_REF_ADMUNT foreign key (ID) references cdn_adminunit(ID);
--
alter table cdn_currency add constraint FK_CURR_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_currency add constraint FK_CURR_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_currency add constraint FK_CURR_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_currency add constraint FK_CURR_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_department add constraint FK_DEP_DEPTYPEID_REF_DEPT foreign key (DEPTYPEID) references cdn_deptype(ID);
--
alter table cdn_department add constraint FK_DEP_ORGANIZATIONID_REF_ORG foreign key (ORGANIZATIONID) references cdn_organization(ID);
--
alter table cdn_department add constraint FK_DEP_MI_DATA_ID_REF_DEP foreign key (MI_DATA_ID) references cdn_department(ID);
--
alter table cdn_department add constraint FK_DEP_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_department add constraint FK_DEP_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_department add constraint FK_DEP_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_department add constraint FK_DEP_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_deptype add constraint FK_DEPT_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_deptype add constraint FK_DEPT_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_deptype add constraint FK_DEPT_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_deptype add constraint FK_DEPT_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_employee add constraint FK_EMP_DEPARTMENTID_REF_DEP foreign key (DEPARTMENTID) references cdn_department(ID);
--
alter table cdn_employee add constraint FK_EMP_ORGANIZATIONID_REF_ORG foreign key (ORGANIZATIONID) references cdn_organization(ID);
--
alter table cdn_employee add constraint FK_EMP_MI_DATA_ID_REF_EMP foreign key (MI_DATA_ID) references cdn_employee(ID);
--
alter table cdn_employee add constraint FK_EMP_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_employee add constraint FK_EMP_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_employee add constraint FK_EMP_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_employee add constraint FK_EMP_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_language add constraint FK_CDNLNG_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_language add constraint FK_CDNLNG_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_language add constraint FK_CDNLNG_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_language add constraint FK_CDNLNG_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_nationality add constraint FK_CDN_NATIONALITY_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_nationality add constraint FK_CDN_NATIONALITY_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_nationality add constraint FK_CDN_NATIONALITY_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_nationality add constraint FK_CDN_NATIONALITY_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_orgaccount add constraint FK_ORGACC_ORGANIZATIONID_REF_ORG foreign key (ORGANIZATIONID) references cdn_organization(ID);
--
alter table cdn_orgaccount add constraint FK_ORGACC_CURRENCYID_REF_CURR foreign key (CURRENCYID) references cdn_currency(ID);
--
alter table cdn_orgaccount add constraint FK_ORGACC_BANKID_REF_BANK foreign key (BANKID) references cdn_bank(ID);
--
alter table cdn_orgaccount add constraint FK_ORGACC_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_orgaccount add constraint FK_ORGACC_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_orgaccount add constraint FK_ORGACC_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_orgaccount add constraint FK_ORGACC_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_organization add constraint FK_ORG_ORGBUSINESSTYPEID_REF_ORGBT foreign key (ORGBUSINESSTYPEID) references cdn_orgbusinesstype(ID);
--
alter table cdn_organization add constraint FK_ORG_ORGOWNERSHIPTYPEID_REF_ORGOT foreign key (ORGOWNERSHIPTYPEID) references cdn_orgownershiptype(ID);
--
alter table cdn_organization add constraint FK_ORG_CORRINDEXID_REF_CORIDX foreign key (CORRINDEXID) references cdn_corrindex(ID);
--
alter table cdn_organization add constraint FK_ORG_MI_DATA_ID_REF_ORG foreign key (MI_DATA_ID) references cdn_organization(ID);
--
alter table cdn_organization add constraint FK_ORG_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_organization add constraint FK_ORG_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_organization add constraint FK_ORG_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_organization add constraint FK_ORG_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_orgbusinesstype add constraint FK_ORGBT_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_orgbusinesstype add constraint FK_ORGBT_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_orgbusinesstype add constraint FK_ORGBT_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_orgbusinesstype add constraint FK_ORGBT_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_orgownershiptype add constraint FK_ORGOT_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_orgownershiptype add constraint FK_ORGOT_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_orgownershiptype add constraint FK_ORGOT_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_orgownershiptype add constraint FK_ORGOT_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_person add constraint FK_CPERS_REGIONID_REF_REGN foreign key (REGIONID) references cdn_region(ID);
--
alter table cdn_person add constraint FK_CPERS_SOCIALSTATUSID_REF_PSOCST foreign key (SOCIALSTATUSID) references cdn_personsocialstatus(ID);
--
alter table cdn_person add constraint FK_CPERS_CATEGORYID_REF_CATEGORY foreign key (CATEGORYID) references cdn_personcategory(ID);
--
alter table cdn_person add constraint FK_CPERS_NATIONALITY_REF_CDN_NATIONALITY foreign key (NATIONALITY) references cdn_nationality(ID);
--
alter table cdn_person add constraint FK_CPERS_CLASSID_REF_CDN_PERSONCLASS foreign key (CLASSID) references cdn_personclass(ID);
--
alter table cdn_person add constraint FK_CPERS_MI_DATA_ID_REF_CPERS foreign key (MI_DATA_ID) references cdn_person(ID);
--
alter table cdn_person add constraint FK_CPERS_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_person add constraint FK_CPERS_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_person add constraint FK_CPERS_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_person add constraint FK_CPERS_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_personcategory add constraint FK_CATEGORY_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_personcategory add constraint FK_CATEGORY_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_personcategory add constraint FK_CATEGORY_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_personcategory add constraint FK_CATEGORY_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_personclass add constraint FK_CDN_PERSONCLASS_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_personclass add constraint FK_CDN_PERSONCLASS_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_personclass add constraint FK_CDN_PERSONCLASS_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_personclass add constraint FK_CDN_PERSONCLASS_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_personsocialstatus add constraint FK_PSOCST_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_personsocialstatus add constraint FK_PSOCST_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_personsocialstatus add constraint FK_PSOCST_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_personsocialstatus add constraint FK_PSOCST_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_postindex add constraint FK_POSTIDX_STREETID_REF_STREET foreign key (STREETID) references cdn_street(ID);
--
alter table cdn_postindex add constraint FK_POSTIDX_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_postindex add constraint FK_POSTIDX_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_postindex add constraint FK_POSTIDX_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_postindex add constraint FK_POSTIDX_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_profession add constraint FK_CDNPROF_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_profession add constraint FK_CDNPROF_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_profession add constraint FK_CDNPROF_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_profession add constraint FK_CDNPROF_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_region add constraint FK_REGN_PARENTADMINUNITID_REF_ADMUNT foreign key (PARENTADMINUNITID) references cdn_adminunit(ID);
--
alter table cdn_region add constraint FK_REGN_REGIONTYPEID_REF_REGNT foreign key (REGIONTYPEID) references cdn_regiontype(ID);
--
alter table cdn_region add constraint FK_REGN_CENTERID_REF_CITY foreign key (CENTERID) references cdn_city(ID);
--
alter table cdn_region add constraint FK_REGN_MI_DATA_ID_REF_REGN foreign key (MI_DATA_ID) references cdn_region(ID);
--
alter table cdn_region add constraint FK_REGN_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_region add constraint FK_REGN_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_region add constraint FK_REGN_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_region add constraint FK_REGN_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_region add constraint FK_REGN_ID_REF_ADMUNT foreign key (ID) references cdn_adminunit(ID);
--
alter table cdn_regiontype add constraint FK_REGNT_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_regiontype add constraint FK_REGNT_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_regiontype add constraint FK_REGNT_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_regiontype add constraint FK_REGNT_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_staffunittype add constraint FK_STUNT_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_staffunittype add constraint FK_STUNT_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_staffunittype add constraint FK_STUNT_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_staffunittype add constraint FK_STUNT_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table cdn_street add constraint FK_STREET_CITYID_REF_CITY foreign key (CITYID) references cdn_city(ID);
--
alter table cdn_street add constraint FK_STREET_MI_DATA_ID_REF_STREET foreign key (MI_DATA_ID) references cdn_street(ID);
--
alter table cdn_street add constraint FK_STREET_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table cdn_street add constraint FK_STREET_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table cdn_street add constraint FK_STREET_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table cdn_street add constraint FK_STREET_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table de_attribute add constraint FK_DE_ATTRIBUTE_PARENTENTITY_REF_DE_ENTITY foreign key (PARENTENTITY) references de_entity(ID);
--
alter table de_entity add constraint FK_DE_ENTITY_PARENTMODEL_REF_DE_MODEL foreign key (PARENTMODEL) references de_model(ID);
--
alter table de_ruleAttribute add constraint FK_DE_RULEATTRIBUTE_PARENTRULEENTITY_REF_DE_RULEENTITY foreign key (PARENTRULEENTITY) references de_ruleEntity(ID);
--
alter table de_ruleAttribute add constraint FK_DE_RULEATTRIBUTE_ATTRIBUTESOURCE_REF_DE_ATTRIBUTE foreign key (ATTRIBUTESOURCE) references de_attribute(ID);
--
alter table de_ruleAttribute add constraint FK_DE_RULEATTRIBUTE_ATTRIBUTEDESTINATION_REF_DE_ATTRIBUTE foreign key (ATTRIBUTEDESTINATION) references de_attribute(ID);
--
alter table de_ruleEntity add constraint FK_DE_RULEENTITY_PARENTRULEMODEL_REF_DE_RULEMODEL foreign key (PARENTRULEMODEL) references de_ruleModel(ID);
--
alter table de_ruleEntity add constraint FK_DE_RULEENTITY_ENTITYSOURCE_REF_DE_ENTITY foreign key (ENTITYSOURCE) references de_entity(ID);
--
alter table de_ruleEntity add constraint FK_DE_RULEENTITY_ENTITYDESTINATION_REF_DE_ENTITY foreign key (ENTITYDESTINATION) references de_entity(ID);
--
alter table de_ruleModel add constraint FK_DE_RULEMODEL_MODELSOURCE_REF_DE_MODEL foreign key (MODELSOURCE) references de_model(ID);
--
alter table de_ruleModel add constraint FK_DE_RULEMODEL_MODELDESTINATION_REF_DE_MODEL foreign key (MODELDESTINATION) references de_model(ID);
--
alter table org_department add constraint FK_ODEP_PARENTID_REF_OUNIT foreign key (PARENTID) references org_unit(ID);
--
alter table org_department add constraint FK_ODEP_DEPTYPEID_REF_DEPT foreign key (DEPTYPEID) references cdn_deptype(ID);
--
alter table org_department add constraint FK_ODEP_MI_DATA_ID_REF_ODEP foreign key (MI_DATA_ID) references org_department(ID);
--
alter table org_department add constraint FK_ODEP_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table org_department add constraint FK_ODEP_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table org_department add constraint FK_ODEP_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table org_department add constraint FK_ODEP_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table org_department add constraint FK_ODEP_ID_REF_OUNIT foreign key (ID) references org_unit(ID);
--
alter table org_diagram add constraint FK_ODIAGRAM_ORGUNITID_REF_OUNIT foreign key (ORGUNITID) references org_unit(ID);
--
alter table org_diagram add constraint FK_ODIAGRAM_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table org_diagram add constraint FK_ODIAGRAM_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table org_diagram add constraint FK_ODIAGRAM_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table org_diagram add constraint FK_ODIAGRAM_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table org_employee add constraint FK_OEMP_USERID_REF_USR foreign key (USERID) references uba_user(ID);
--
alter table org_employee add constraint FK_OEMP_MI_DATA_ID_REF_OEMP foreign key (MI_DATA_ID) references org_employee(ID);
--
alter table org_employee add constraint FK_OEMP_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table org_employee add constraint FK_OEMP_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table org_employee add constraint FK_OEMP_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table org_employee add constraint FK_OEMP_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table org_employeeonstaff add constraint FK_EMPONS_EMPLOYEEID_REF_OEMP foreign key (EMPLOYEEID) references org_employee(ID);
--
alter table org_employeeonstaff add constraint FK_EMPONS_STAFFUNITID_REF_STUNIT foreign key (STAFFUNITID) references org_staffunit(ID);
--
alter table org_employeeonstaff add constraint FK_EMPONS_MI_DATA_ID_REF_EMPONS foreign key (MI_DATA_ID) references org_employeeonstaff(ID);
--
alter table org_employeeonstaff add constraint FK_EMPONS_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table org_employeeonstaff add constraint FK_EMPONS_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table org_employeeonstaff add constraint FK_EMPONS_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table org_employeeonstaff add constraint FK_EMPONS_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table org_employeeonstaff_pending add constraint FK_EMPONPEND_EMPONSTAFFID_REF_EMPONS foreign key (EMPONSTAFFID) references org_employeeonstaff(ID);
--
alter table org_employeeonstaff_pending add constraint FK_EMPONPEND_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table org_employeeonstaff_pending add constraint FK_EMPONPEND_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table org_employeeonstaff_pending add constraint FK_EMPONPEND_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table org_execgroup add constraint FK_ORGEXGR_PARENTID_REF_OORG foreign key (PARENTID) references org_organization(ID);
--
alter table org_execgroup add constraint FK_ORGEXGR_MI_DATA_ID_REF_ORGEXGR foreign key (MI_DATA_ID) references org_execgroup(ID);
--
alter table org_execgroup add constraint FK_ORGEXGR_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table org_execgroup add constraint FK_ORGEXGR_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table org_execgroup add constraint FK_ORGEXGR_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table org_execgroup add constraint FK_ORGEXGR_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table org_execgroup add constraint FK_ORGEXGR_ID_REF_OUNIT foreign key (ID) references org_unit(ID);
--
alter table org_execgroupmember add constraint FK_ORGEXGRM_EXECGROUPID_REF_ORGEXGR foreign key (EXECGROUPID) references org_execgroup(ID);
--
alter table org_execgroupmember add constraint FK_ORGEXGRM_ORGUNITID_REF_STUNIT foreign key (ORGUNITID) references org_staffunit(ID);
--
alter table org_execgroupmember add constraint FK_ORGEXGRM_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table org_execgroupmember add constraint FK_ORGEXGRM_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table org_execgroupmember add constraint FK_ORGEXGRM_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table org_orgaccount add constraint FK_UORGACC_ORGANIZATIONID_REF_OORG foreign key (ORGANIZATIONID) references org_organization(ID);
--
alter table org_orgaccount add constraint FK_UORGACC_CURRENCYID_REF_CURR foreign key (CURRENCYID) references cdn_currency(ID);
--
alter table org_orgaccount add constraint FK_UORGACC_BANKID_REF_BANK foreign key (BANKID) references cdn_bank(ID);
--
alter table org_orgaccount add constraint FK_UORGACC_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table org_orgaccount add constraint FK_UORGACC_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table org_orgaccount add constraint FK_UORGACC_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table org_orgaccount add constraint FK_UORGACC_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table org_organization add constraint FK_OORG_PARENTID_REF_OUNIT foreign key (PARENTID) references org_unit(ID);
--
alter table org_organization add constraint FK_OORG_ORGBUSINESSTYPEID_REF_ORGBT foreign key (ORGBUSINESSTYPEID) references cdn_orgbusinesstype(ID);
--
alter table org_organization add constraint FK_OORG_ORGOWNERSHIPTYPEID_REF_ORGOT foreign key (ORGOWNERSHIPTYPEID) references cdn_orgownershiptype(ID);
--
alter table org_organization add constraint FK_OORG_MI_DATA_ID_REF_OORG foreign key (MI_DATA_ID) references org_organization(ID);
--
alter table org_organization add constraint FK_OORG_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table org_organization add constraint FK_OORG_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table org_organization add constraint FK_OORG_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table org_organization add constraint FK_OORG_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table org_organization add constraint FK_OORG_ID_REF_OUNIT foreign key (ID) references org_unit(ID);
--
alter table org_profession add constraint FK_PROF_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table org_profession add constraint FK_PROF_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table org_profession add constraint FK_PROF_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table org_profession add constraint FK_PROF_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table org_staffunit add constraint FK_STUNIT_PARENTID_REF_OUNIT foreign key (PARENTID) references org_unit(ID);
--
alter table org_staffunit add constraint FK_STUNIT_PROFESSIONEXTID_REF_CDNPROF foreign key (PROFESSIONEXTID) references cdn_profession(ID);
--
alter table org_staffunit add constraint FK_STUNIT_PROFESSIONID_REF_PROF foreign key (PROFESSIONID) references org_profession(ID);
--
alter table org_staffunit add constraint FK_STUNIT_STAFFUNITTYPEID_REF_STUNT foreign key (STAFFUNITTYPEID) references cdn_staffunittype(ID);
--
alter table org_staffunit add constraint FK_STUNIT_MI_DATA_ID_REF_STUNIT foreign key (MI_DATA_ID) references org_staffunit(ID);
--
alter table org_staffunit add constraint FK_STUNIT_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table org_staffunit add constraint FK_STUNIT_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table org_staffunit add constraint FK_STUNIT_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table org_staffunit add constraint FK_STUNIT_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table org_staffunit add constraint FK_STUNIT_ID_REF_OUNIT foreign key (ID) references org_unit(ID);
--
alter table org_unit add constraint FK_OUNIT_PARENTID_REF_OUNIT foreign key (PARENTID) references org_unit(ID);
--
alter table org_unit add constraint FK_OUNIT_MI_DATA_ID_REF_OUNIT foreign key (MI_DATA_ID) references org_unit(ID);
--
alter table org_unit add constraint FK_OUNIT_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table org_unit add constraint FK_OUNIT_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table org_unit add constraint FK_OUNIT_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table org_unit add constraint FK_OUNIT_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table uba_advSecurity add constraint FK_UBA_ADVSECURITY_USERID_REF_USR foreign key (USERID) references uba_user(ID);
--
alter table uba_advSecurity add constraint FK_UBA_ADVSECURITY_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table uba_advSecurity add constraint FK_UBA_ADVSECURITY_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table uba_advSecurity add constraint FK_UBA_ADVSECURITY_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table uba_els add constraint FK_ELS_RULEROLE_REF_ROLE foreign key (RULEROLE) references uba_role(ID);
--
alter table uba_els add constraint FK_ELS_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table uba_els add constraint FK_ELS_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table uba_els add constraint FK_ELS_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table uba_group add constraint FK_GR_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table uba_group add constraint FK_GR_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table uba_group add constraint FK_GR_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table uba_group add constraint FK_GR_ID_REF_SUBJ foreign key (ID) references uba_subject(ID);
--
alter table uba_grouprole add constraint FK_UBA_GROUPROLE_GROUPID_REF_GR foreign key (GROUPID) references uba_group(ID);
--
alter table uba_grouprole add constraint FK_UBA_GROUPROLE_ROLEID_REF_ROLE foreign key (ROLEID) references uba_role(ID);
--
alter table uba_grouprole add constraint FK_UBA_GROUPROLE_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table uba_grouprole add constraint FK_UBA_GROUPROLE_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table uba_grouprole add constraint FK_UBA_GROUPROLE_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table uba_otp add constraint FK_OTP_USERID_REF_USR foreign key (USERID) references uba_user(ID);
--
alter table uba_otp add constraint FK_OTP_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table uba_otp add constraint FK_OTP_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table uba_otp add constraint FK_OTP_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table uba_prevPasswordsHash add constraint FK_PREVP_USERID_REF_USR foreign key (USERID) references uba_user(ID);
--
alter table uba_prevPasswordsHash add constraint FK_PREVP_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table uba_prevPasswordsHash add constraint FK_PREVP_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table uba_prevPasswordsHash add constraint FK_PREVP_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table uba_role add constraint FK_ROLE_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table uba_role add constraint FK_ROLE_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table uba_role add constraint FK_ROLE_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table uba_role add constraint FK_ROLE_ID_REF_SUBJ foreign key (ID) references uba_subject(ID);
--
alter table uba_user add constraint FK_USR_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table uba_user add constraint FK_USR_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table uba_user add constraint FK_USR_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table uba_user add constraint FK_USR_ID_REF_SUBJ foreign key (ID) references uba_subject(ID);
--
alter table uba_usercertificate add constraint FK_USRCER_USERID_REF_USR foreign key (USERID) references uba_user(ID);
--
alter table uba_usercertificate add constraint FK_USRCER_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table uba_usercertificate add constraint FK_USRCER_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table uba_usercertificate add constraint FK_USRCER_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table uba_usergroup add constraint FK_USRGROUP_USERID_REF_USR foreign key (USERID) references uba_user(ID);
--
alter table uba_usergroup add constraint FK_USRGROUP_GROUPID_REF_GR foreign key (GROUPID) references uba_group(ID);
--
alter table uba_usergroup add constraint FK_USRGROUP_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table uba_usergroup add constraint FK_USRGROUP_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table uba_usergroup add constraint FK_USRGROUP_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table uba_userrole add constraint FK_USROLE_USERID_REF_USR foreign key (USERID) references uba_user(ID);
--
alter table uba_userrole add constraint FK_USROLE_ROLEID_REF_ROLE foreign key (ROLEID) references uba_role(ID);
--
alter table uba_userrole add constraint FK_USROLE_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table uba_userrole add constraint FK_USROLE_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table uba_userrole add constraint FK_USROLE_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table ubm_desktop add constraint FK_DESK_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table ubm_desktop add constraint FK_DESK_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table ubm_desktop add constraint FK_DESK_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table ubm_desktop add constraint FK_DESK_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table ubm_desktop_adm add constraint FK_ADMDESK_INSTANCEID_REF_DESK foreign key (INSTANCEID) references ubm_desktop(ID);
--
alter table ubm_desktop_adm add constraint FK_ADMDESK_ADMSUBJID_REF_SUBJ foreign key (ADMSUBJID) references uba_subject(ID);
--
alter table ubm_enum add constraint FK_ENU_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table ubm_enum add constraint FK_ENU_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table ubm_enum add constraint FK_ENU_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table ubm_enum add constraint FK_ENU_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table ubm_navshortcut add constraint FK_NAVSH_DESKTOPID_REF_DESK foreign key (DESKTOPID) references ubm_desktop(ID);
--
alter table ubm_navshortcut add constraint FK_NAVSH_PARENTID_REF_NAVSH foreign key (PARENTID) references ubm_navshortcut(ID);
--
alter table ubm_navshortcut add constraint FK_NAVSH_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table ubm_navshortcut add constraint FK_NAVSH_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table ubm_navshortcut add constraint FK_NAVSH_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table ubm_navshortcut add constraint FK_NAVSH_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table ubm_navshortcut_adm add constraint FK_ADMNAV_INSTANCEID_REF_NAVSH foreign key (INSTANCEID) references ubm_navshortcut(ID);
--
alter table ubm_navshortcut_adm add constraint FK_ADMNAV_ADMSUBJID_REF_SUBJ foreign key (ADMSUBJID) references uba_subject(ID);
--
alter table ubm_query add constraint FK_UBMQR_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table ubm_query add constraint FK_UBMQR_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table ubm_query add constraint FK_UBMQR_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table ubm_query add constraint FK_UBMQR_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table ubs_filter add constraint FK_SFILTER_OWNER_REF_USR foreign key (OWNER) references uba_user(ID);
--
alter table ubs_filter add constraint FK_SFILTER_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table ubs_filter add constraint FK_SFILTER_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table ubs_filter add constraint FK_SFILTER_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table ubs_message add constraint FK_MSG_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table ubs_message add constraint FK_MSG_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table ubs_message add constraint FK_MSG_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table ubs_message add constraint FK_MSG_MI_DELETEUSER_REF_USR foreign key (MI_DELETEUSER) references uba_user(ID);
--
alter table ubs_message_recipient add constraint FK_MSG_RC_MESSAGEID_REF_MSG foreign key (MESSAGEID) references ubs_message(ID);
--
alter table ubs_message_recipient add constraint FK_MSG_RC_USERID_REF_USR foreign key (USERID) references uba_user(ID);
--
alter table ubs_settings add constraint FK_STNGS_MI_OWNER_REF_USR foreign key (MI_OWNER) references uba_user(ID);
--
alter table ubs_settings add constraint FK_STNGS_MI_CREATEUSER_REF_USR foreign key (MI_CREATEUSER) references uba_user(ID);
--
alter table ubs_settings add constraint FK_STNGS_MI_MODIFYUSER_REF_USR foreign key (MI_MODIFYUSER) references uba_user(ID);
--
alter table ubs_softLock add constraint FK_SLOCK_LOCKUSER_REF_USR foreign key (LOCKUSER) references uba_user(ID);
 
-- Create sequence
--#############################################################
create sequence S_CDN_ADDRESS increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_ADDRESS');
--
create sequence S_CDN_ADMINUNIT increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_ADMINUNIT');
--
create sequence S_CDN_BANK increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_BANK');
--
create sequence S_CDN_BUILDING increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_BUILDING');
--
create sequence S_CDN_CITY increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_CITY');
--
create sequence S_CDN_CITYTYPE increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_CITYTYPE');
--
create sequence S_CDN_CONTACTTYPE increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_CONTACTTYPE');
--
create sequence S_CDN_CORRINDEX increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_CORRINDEX');
--
create sequence S_CDN_COUNTRY increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_COUNTRY');
--
create sequence S_CDN_CURRENCY increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_CURRENCY');
--
create sequence S_CDN_DEPTYPE increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_DEPTYPE');
--
create sequence S_CDN_LANGUAGE increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_LANGUAGE');
--
create sequence S_CDN_NATIONALITY increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_NATIONALITY');
--
create sequence S_CDN_ORGBUSINESSTYPE increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_ORGBUSINESSTYPE');
--
create sequence S_CDN_ORGOWNERSHIPTYPE increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_ORGOWNERSHIPTYPE');
--
create sequence S_CDN_PERSONCATEGORY increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_PERSONCATEGORY');
--
create sequence S_CDN_PERSONCLASS increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_PERSONCLASS');
--
create sequence S_CDN_PERSONSOCIALSTATUS increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_PERSONSOCIALSTATUS');
--
create sequence S_CDN_POSTINDEX increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_POSTINDEX');
--
create sequence S_CDN_PROFESSION increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_PROFESSION');
--
create sequence S_CDN_REGION increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_REGION');
--
create sequence S_CDN_REGIONTYPE increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_REGIONTYPE');
--
create sequence S_CDN_STAFFUNITTYPE increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_STAFFUNITTYPE');
--
create sequence S_CDN_STREET increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_CDN_STREET');
--
create sequence S_ORG_DIAGRAM increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_ORG_DIAGRAM');
--
create sequence S_ORG_EMPLOYEEONSTAFF_PENDING increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_ORG_EMPLOYEEONSTAFF_PENDING');
--
create sequence S_ORG_ORGACCOUNT increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_ORG_ORGACCOUNT');
--
create sequence S_ORG_PROFESSION increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_ORG_PROFESSION');
--
create sequence S_UBM_ENUM increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_UBM_ENUM');
--
create sequence S_UBS_SETTINGS increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_UBS_SETTINGS');
 
-- Annotate an objects
--#############################################################
comment on table cdn_address is 'Addresses directory';
--
comment on column cdn_address.addressType is 'Address type';
--
comment on column cdn_address.value is 'Address';
--
comment on column cdn_address.subjectID is 'Subject';
--
comment on column cdn_address.mi_owner is 'Row owner';
--
comment on column cdn_address.mi_createDate is 'Creation date';
--
comment on column cdn_address.mi_createUser is 'User who create row';
--
comment on column cdn_address.mi_modifyDate is 'Modification date';
--
comment on column cdn_address.mi_modifyUser is 'User who modify row';
--
comment on column cdn_address.mi_deleteDate is 'Deletion date';
--
comment on column cdn_address.mi_deleteUser is 'User who delete row';
--
comment on table cdn_adminunit is 'Admin unit (country, region, city)';
--
comment on column cdn_adminunit.parentAdminUnitID is 'Parent';
--
comment on column cdn_adminunit.code is 'Internal code';
--
comment on column cdn_adminunit.name is 'Name';
--
comment on column cdn_adminunit.fullName is 'Full name';
--
comment on column cdn_adminunit.adminUnitType is 'Admin unit type';
--
comment on column cdn_adminunit.caption is 'Caption';
--
comment on column cdn_adminunit.mi_owner is 'Row owner';
--
comment on column cdn_adminunit.mi_createDate is 'Creation date';
--
comment on column cdn_adminunit.mi_createUser is 'User who create row';
--
comment on column cdn_adminunit.mi_modifyDate is 'Modification date';
--
comment on column cdn_adminunit.mi_modifyUser is 'User who modify row';
--
comment on column cdn_adminunit.mi_deleteDate is 'Deletion date';
--
comment on column cdn_adminunit.mi_deleteUser is 'User who delete row';
--
comment on table cdn_bank is 'Bank branches directory';
--
comment on column cdn_bank.MFO is 'Bank branch code';
--
comment on column cdn_bank.code is 'Bank organization code';
--
comment on column cdn_bank.name is 'Name without quotes and ownership. For searching data.';
--
comment on column cdn_bank.fullName is 'Full official bank name . For displaying in reports.';
--
comment on column cdn_bank.phones is 'Phones';
--
comment on column cdn_bank.address is 'Address';
--
comment on column cdn_bank.countryID is 'Registration country';
--
comment on column cdn_bank.cityID is 'City';
--
comment on column cdn_bank.description is 'Description';
--
comment on column cdn_bank.mi_owner is 'Row owner';
--
comment on column cdn_bank.mi_createDate is 'Creation date';
--
comment on column cdn_bank.mi_createUser is 'User who create row';
--
comment on column cdn_bank.mi_modifyDate is 'Modification date';
--
comment on column cdn_bank.mi_modifyUser is 'User who modify row';
--
comment on column cdn_bank.mi_deleteDate is 'Deletion date';
--
comment on column cdn_bank.mi_deleteUser is 'User who delete row';
--
comment on table cdn_building is 'List of buildings';
--
comment on column cdn_building.streetID is 'Street';
--
comment on column cdn_building.postIndexID is 'Zip';
--
comment on column cdn_building.code is 'Code';
--
comment on column cdn_building.description is 'Description';
--
comment on column cdn_building.buildingType is 'Type';
--
comment on column cdn_building.mi_owner is 'Row owner';
--
comment on column cdn_building.mi_createDate is 'Creation date';
--
comment on column cdn_building.mi_createUser is 'User who create row';
--
comment on column cdn_building.mi_modifyDate is 'Modification date';
--
comment on column cdn_building.mi_modifyUser is 'User who modify row';
--
comment on column cdn_building.mi_deleteDate is 'Deletion date';
--
comment on column cdn_building.mi_deleteUser is 'User who delete row';
--
comment on table cdn_city is 'Cities directory';
--
comment on column cdn_city.parentAdminUnitID is 'Parent';
--
comment on column cdn_city.code is 'City code';
--
comment on column cdn_city.name is 'City name';
--
comment on column cdn_city.caption is 'Caption';
--
comment on column cdn_city.description is 'City description';
--
comment on column cdn_city.postalCode is 'City postal code';
--
comment on column cdn_city.phoneCode is 'City phone code';
--
comment on column cdn_city.cityTypeID is 'City type';
--
comment on column cdn_city.mi_owner is 'Row owner';
--
comment on column cdn_city.mi_createDate is 'Creation date';
--
comment on column cdn_city.mi_createUser is 'User who create row';
--
comment on column cdn_city.mi_modifyDate is 'Modification date';
--
comment on column cdn_city.mi_modifyUser is 'User who modify row';
--
comment on column cdn_city.mi_deleteDate is 'Deletion date';
--
comment on column cdn_city.mi_deleteUser is 'User who delete row';
--
comment on table cdn_citytype is 'City types directory';
--
comment on column cdn_citytype.code is 'Internal code of city type';
--
comment on column cdn_citytype.name is 'City type name';
--
comment on column cdn_citytype.mi_owner is 'Row owner';
--
comment on column cdn_citytype.mi_createDate is 'Creation date';
--
comment on column cdn_citytype.mi_createUser is 'User who create row';
--
comment on column cdn_citytype.mi_modifyDate is 'Modification date';
--
comment on column cdn_citytype.mi_modifyUser is 'User who modify row';
--
comment on column cdn_citytype.mi_deleteDate is 'Deletion date';
--
comment on column cdn_citytype.mi_deleteUser is 'User who delete row';
--
comment on table cdn_classifier is 'Сlassifiers';
--
comment on column cdn_classifier.code is 'Code';
--
comment on column cdn_classifier.name is 'Name';
--
comment on column cdn_classifier.description is 'Description';
--
comment on column cdn_classifier.orderByAttr is 'Classifier item sort order';
--
comment on column cdn_classifier.mi_owner is 'Row owner';
--
comment on column cdn_classifier.mi_createDate is 'Creation date';
--
comment on column cdn_classifier.mi_createUser is 'User who create row';
--
comment on column cdn_classifier.mi_modifyDate is 'Modification date';
--
comment on column cdn_classifier.mi_modifyUser is 'User who modify row';
--
comment on column cdn_classifier.mi_deleteDate is 'Deletion date';
--
comment on column cdn_classifier.mi_deleteUser is 'User who delete row';
--
comment on table cdn_classifieritem is 'Сlassifier Item';
--
comment on column cdn_classifieritem.code is 'System code';
--
comment on column cdn_classifieritem.name is 'Name';
--
comment on column cdn_classifieritem.classifierID is 'Classifier';
--
comment on column cdn_classifieritem.parentID is 'Parent';
--
comment on column cdn_classifieritem.hierarchyLevel is 'Level';
--
comment on column cdn_classifieritem.mi_owner is 'Row owner';
--
comment on column cdn_classifieritem.mi_createDate is 'Creation date';
--
comment on column cdn_classifieritem.mi_createUser is 'User who create row';
--
comment on column cdn_classifieritem.mi_modifyDate is 'Modification date';
--
comment on column cdn_classifieritem.mi_modifyUser is 'User who modify row';
--
comment on column cdn_classifieritem.mi_deleteDate is 'Deletion date';
--
comment on column cdn_classifieritem.mi_deleteUser is 'User who delete row';
--
comment on table cdn_contact is 'Contacts directory';
--
comment on column cdn_contact.contactTypeID is 'Contact type';
--
comment on column cdn_contact.value is 'Contact';
--
comment on column cdn_contact.subjectID is 'Subject';
--
comment on column cdn_contact.mi_owner is 'Row owner';
--
comment on column cdn_contact.mi_createDate is 'Creation date';
--
comment on column cdn_contact.mi_createUser is 'User who create row';
--
comment on column cdn_contact.mi_modifyDate is 'Modification date';
--
comment on column cdn_contact.mi_modifyUser is 'User who modify row';
--
comment on column cdn_contact.mi_deleteDate is 'Deletion date';
--
comment on column cdn_contact.mi_deleteUser is 'User who delete row';
--
comment on table cdn_contacttype is 'Contact types directory';
--
comment on column cdn_contacttype.code is 'Code';
--
comment on column cdn_contacttype.name is 'Contact type name';
--
comment on column cdn_contacttype.mi_owner is 'Row owner';
--
comment on column cdn_contacttype.mi_createDate is 'Creation date';
--
comment on column cdn_contacttype.mi_createUser is 'User who create row';
--
comment on column cdn_contacttype.mi_modifyDate is 'Modification date';
--
comment on column cdn_contacttype.mi_modifyUser is 'User who modify row';
--
comment on column cdn_contacttype.mi_deleteDate is 'Deletion date';
--
comment on column cdn_contacttype.mi_deleteUser is 'User who delete row';
--
comment on table cdn_corrindex is 'Correspondent indexes directory';
--
comment on column cdn_corrindex.code is 'Code of correspondent index';
--
comment on column cdn_corrindex.name is 'Name of correspondent index';
--
comment on column cdn_corrindex.fullName is 'Full name of correspondent index';
--
comment on column cdn_corrindex.mi_owner is 'Row owner';
--
comment on column cdn_corrindex.mi_createDate is 'Creation date';
--
comment on column cdn_corrindex.mi_createUser is 'User who create row';
--
comment on column cdn_corrindex.mi_modifyDate is 'Modification date';
--
comment on column cdn_corrindex.mi_modifyUser is 'User who modify row';
--
comment on column cdn_corrindex.mi_deleteDate is 'Deletion date';
--
comment on column cdn_corrindex.mi_deleteUser is 'User who delete row';
--
comment on table cdn_country is 'Countries directory';
--
comment on column cdn_country.code is 'Internal code';
--
comment on column cdn_country.name is 'Name of the country';
--
comment on column cdn_country.fullName is 'Full official name of the country';
--
comment on column cdn_country.intCode is 'Digital code of the country';
--
comment on column cdn_country.symbol2 is '2-character code of the country by ISO classification';
--
comment on column cdn_country.symbol3 is '3-character code of the country by IOC classification';
--
comment on column cdn_country.description is 'Country description';
--
comment on column cdn_country.phoneCode is 'Country phone code';
--
comment on column cdn_country.currencyID is 'Main currency of the country';
--
comment on column cdn_country.capitalID is 'Capital of the country';
--
comment on column cdn_country.mi_owner is 'Row owner';
--
comment on column cdn_country.mi_createDate is 'Creation date';
--
comment on column cdn_country.mi_createUser is 'User who create row';
--
comment on column cdn_country.mi_modifyDate is 'Modification date';
--
comment on column cdn_country.mi_modifyUser is 'User who modify row';
--
comment on column cdn_country.mi_deleteDate is 'Deletion date';
--
comment on column cdn_country.mi_deleteUser is 'User who delete row';
--
comment on table cdn_currency is 'Currencies dictionary';
--
comment on column cdn_currency.intCode is 'Digital code of currency';
--
comment on column cdn_currency.code3 is '3-character code of currency';
--
comment on column cdn_currency.name is 'Name of currency';
--
comment on column cdn_currency.curMult is 'Default multiplicity';
--
comment on column cdn_currency.description is 'Description';
--
comment on column cdn_currency.mi_owner is 'Row owner';
--
comment on column cdn_currency.mi_createDate is 'Creation date';
--
comment on column cdn_currency.mi_createUser is 'User who create row';
--
comment on column cdn_currency.mi_modifyDate is 'Modification date';
--
comment on column cdn_currency.mi_modifyUser is 'User who modify row';
--
comment on column cdn_currency.mi_deleteDate is 'Deletion date';
--
comment on column cdn_currency.mi_deleteUser is 'User who delete row';
--
comment on table cdn_department is 'External departments dictionary';
--
comment on column cdn_department.code is 'Code of the department';
--
comment on column cdn_department.name is 'Name of the department';
--
comment on column cdn_department.fullName is 'Full official name of the department';
--
comment on column cdn_department.description is 'Description of the department';
--
comment on column cdn_department.nameGen is 'Department name in genitive case';
--
comment on column cdn_department.nameDat is 'Department name in dative case';
--
comment on column cdn_department.fullNameGen is 'Department full official name in genitive case';
--
comment on column cdn_department.fullNameDat is 'Department full official name in dative case';
--
comment on column cdn_department.depTypeID is 'Type of the department';
--
comment on column cdn_department.organizationID is 'Parent external organization';
--
comment on column cdn_department.mi_owner is 'Row owner';
--
comment on column cdn_department.mi_createDate is 'Creation date';
--
comment on column cdn_department.mi_createUser is 'User who create row';
--
comment on column cdn_department.mi_modifyDate is 'Modification date';
--
comment on column cdn_department.mi_modifyUser is 'User who modify row';
--
comment on column cdn_department.mi_deleteDate is 'Deletion date';
--
comment on column cdn_department.mi_deleteUser is 'User who delete row';
--
comment on table cdn_deptype is 'Department types dictionary';
--
comment on column cdn_deptype.code is 'Code of the department type';
--
comment on column cdn_deptype.name is 'Name of the department type';
--
comment on column cdn_deptype.mi_owner is 'Row owner';
--
comment on column cdn_deptype.mi_createDate is 'Creation date';
--
comment on column cdn_deptype.mi_createUser is 'User who create row';
--
comment on column cdn_deptype.mi_modifyDate is 'Modification date';
--
comment on column cdn_deptype.mi_modifyUser is 'User who modify row';
--
comment on column cdn_deptype.mi_deleteDate is 'Deletion date';
--
comment on column cdn_deptype.mi_deleteUser is 'User who delete row';
--
comment on table cdn_employee is 'List of employees of external organizations';
--
comment on column cdn_employee.lastName is 'Employee last name';
--
comment on column cdn_employee.firstName is 'Employee first name';
--
comment on column cdn_employee.middleName is 'Employee middle name';
--
comment on column cdn_employee.description is 'Employee description';
--
comment on column cdn_employee.sexType is 'Employee''s gender';
--
comment on column cdn_employee.uniqNum is 'Employee number';
--
comment on column cdn_employee.suffix is 'Suffix';
--
comment on column cdn_employee.shortFIO is 'Example: A.O. Ivanov';
--
comment on column cdn_employee.fullFIO is 'Example: Anton Olegovich Ivanov';
--
comment on column cdn_employee.apply is 'Describes how to treat to this person';
--
comment on column cdn_employee.lastNameGen is 'Employee last name in genitive case';
--
comment on column cdn_employee.lastNameDat is 'Employee last name in dative case';
--
comment on column cdn_employee.firstNameGen is 'Employee first name in genitive case';
--
comment on column cdn_employee.firstNameDat is 'Employee first name in dative case';
--
comment on column cdn_employee.middleNameGen is 'Employee middle name in genitive case';
--
comment on column cdn_employee.middleNameDat is 'Employee middle name in dative case';
--
comment on column cdn_employee.shortFIOGen is 'Employee short name in genitive case';
--
comment on column cdn_employee.shortFIODat is 'Employee short name in dative case';
--
comment on column cdn_employee.fullFIOGen is 'Employee full name in genitive case';
--
comment on column cdn_employee.fullFIODat is 'Employee full name in dative case';
--
comment on column cdn_employee.applyGen is 'Describes how to treat to this person in genitive case';
--
comment on column cdn_employee.applyDat is 'Describes how to treat to this person in dative case';
--
comment on column cdn_employee.departmentID is 'Department of external organization, which employee belongs';
--
comment on column cdn_employee.organizationID is 'External organization, which employee belongs';
--
comment on column cdn_employee.addrText is 'Formulation of the recipient, that will appear in the formation of outgoing document';
--
comment on column cdn_employee.mi_owner is 'Row owner';
--
comment on column cdn_employee.mi_createDate is 'Creation date';
--
comment on column cdn_employee.mi_createUser is 'User who create row';
--
comment on column cdn_employee.mi_modifyDate is 'Modification date';
--
comment on column cdn_employee.mi_modifyUser is 'User who modify row';
--
comment on column cdn_employee.mi_deleteDate is 'Deletion date';
--
comment on column cdn_employee.mi_deleteUser is 'User who delete row';
--
comment on table cdn_language is 'Languages directory according to ISO-639-1';
--
comment on column cdn_language.code is 'ISO 639-1 code';
--
comment on column cdn_language.languageName is 'Language name';
--
comment on column cdn_language.nativeName is 'Native name (Endonym)';
--
comment on column cdn_language.isRTL is 'Is right-to-left';
--
comment on column cdn_language.mi_owner is 'Row owner';
--
comment on column cdn_language.mi_createDate is 'Creation date';
--
comment on column cdn_language.mi_createUser is 'User who create row';
--
comment on column cdn_language.mi_modifyDate is 'Modification date';
--
comment on column cdn_language.mi_modifyUser is 'User who modify row';
--
comment on column cdn_language.mi_deleteDate is 'Deletion date';
--
comment on column cdn_language.mi_deleteUser is 'User who delete row';
--
comment on table cdn_nationality is 'Nationality';
--
comment on column cdn_nationality.code is 'Nationality code';
--
comment on column cdn_nationality.name is 'Name of nationality';
--
comment on column cdn_nationality.nameM is 'Nationality name for male';
--
comment on column cdn_nationality.nameF is 'Nationality name for male';
--
comment on column cdn_nationality.mi_owner is 'Row owner';
--
comment on column cdn_nationality.mi_createDate is 'Creation date';
--
comment on column cdn_nationality.mi_createUser is 'User who create row';
--
comment on column cdn_nationality.mi_modifyDate is 'Modification date';
--
comment on column cdn_nationality.mi_modifyUser is 'User who modify row';
--
comment on column cdn_nationality.mi_deleteDate is 'Deletion date';
--
comment on column cdn_nationality.mi_deleteUser is 'User who delete row';
--
comment on table cdn_orgaccount is 'Organization''s settlement accounts';
--
comment on column cdn_orgaccount.organizationID is 'Organization';
--
comment on column cdn_orgaccount.currencyID is 'Currency of the account';
--
comment on column cdn_orgaccount.bankID is 'Bank of the account';
--
comment on column cdn_orgaccount.code is 'Code of the account';
--
comment on column cdn_orgaccount.acctype is 'Type of the account';
--
comment on column cdn_orgaccount.description is 'Description';
--
comment on column cdn_orgaccount.mi_owner is 'Row owner';
--
comment on column cdn_orgaccount.mi_createDate is 'Creation date';
--
comment on column cdn_orgaccount.mi_createUser is 'User who create row';
--
comment on column cdn_orgaccount.mi_modifyDate is 'Modification date';
--
comment on column cdn_orgaccount.mi_modifyUser is 'User who modify row';
--
comment on column cdn_orgaccount.mi_deleteDate is 'Deletion date';
--
comment on column cdn_orgaccount.mi_deleteUser is 'User who delete row';
--
comment on table cdn_organization is 'List of external organizations';
--
comment on column cdn_organization.code is 'Organization internal code';
--
comment on column cdn_organization.OKPOCode is 'Common classifier of enterprises and organizations (CCEO)';
--
comment on column cdn_organization.taxCode is 'Tax number';
--
comment on column cdn_organization.vatCode is 'VAT (value-added tax) registration certificate number';
--
comment on column cdn_organization.name is 'Name of organization without the quotes and abbreviations';
--
comment on column cdn_organization.fullName is 'Full name of organization, as it''s specified in the certificate of registration';
--
comment on column cdn_organization.nameGen is 'Organization name in genitive case';
--
comment on column cdn_organization.nameDat is 'Organization name in dative case';
--
comment on column cdn_organization.fullNameGen is 'Full name of organization, as it''s specified in the certificate of registration, in genitive case';
--
comment on column cdn_organization.fullNameDat is 'Full name of organization, as it''s specified in the certificate of registration, in dative case';
--
comment on column cdn_organization.description is 'Organization description';
--
comment on column cdn_organization.orgBusinessTypeID is 'Organization type';
--
comment on column cdn_organization.orgOwnershipTypeID is 'Ownership type';
--
comment on column cdn_organization.corrIndexID is 'Index of correspondent';
--
comment on column cdn_organization.addrText is 'Formulation of the recipient, that will appear in the formation of PDF outgoing document';
--
comment on column cdn_organization.caption is 'Caption';
--
comment on column cdn_organization.mi_owner is 'Row owner';
--
comment on column cdn_organization.mi_createDate is 'Creation date';
--
comment on column cdn_organization.mi_createUser is 'User who create row';
--
comment on column cdn_organization.mi_modifyDate is 'Modification date';
--
comment on column cdn_organization.mi_modifyUser is 'User who modify row';
--
comment on column cdn_organization.mi_deleteDate is 'Deletion date';
--
comment on column cdn_organization.mi_deleteUser is 'User who delete row';
--
comment on table cdn_orgbusinesstype is 'Organization types dictionary (LTD etc.)';
--
comment on column cdn_orgbusinesstype.code is 'Code of the organization type';
--
comment on column cdn_orgbusinesstype.shortName is 'Acronim of the organization type';
--
comment on column cdn_orgbusinesstype.name is 'Name of the organization type';
--
comment on column cdn_orgbusinesstype.fullName is 'Description of the organization type';
--
comment on column cdn_orgbusinesstype.isGovAuthority is 'Sign, that the organization of this type is a government authority';
--
comment on column cdn_orgbusinesstype.mi_owner is 'Row owner';
--
comment on column cdn_orgbusinesstype.mi_createDate is 'Creation date';
--
comment on column cdn_orgbusinesstype.mi_createUser is 'User who create row';
--
comment on column cdn_orgbusinesstype.mi_modifyDate is 'Modification date';
--
comment on column cdn_orgbusinesstype.mi_modifyUser is 'User who modify row';
--
comment on column cdn_orgbusinesstype.mi_deleteDate is 'Deletion date';
--
comment on column cdn_orgbusinesstype.mi_deleteUser is 'User who delete row';
--
comment on table cdn_orgownershiptype is 'Types of ownership';
--
comment on column cdn_orgownershiptype.code is 'Code of the ownership type';
--
comment on column cdn_orgownershiptype.shortName is 'Acronim of the ownership type';
--
comment on column cdn_orgownershiptype.name is 'Name of the ownership type';
--
comment on column cdn_orgownershiptype.fullName is 'Full name of the ownership type';
--
comment on column cdn_orgownershiptype.mi_owner is 'Row owner';
--
comment on column cdn_orgownershiptype.mi_createDate is 'Creation date';
--
comment on column cdn_orgownershiptype.mi_createUser is 'User who create row';
--
comment on column cdn_orgownershiptype.mi_modifyDate is 'Modification date';
--
comment on column cdn_orgownershiptype.mi_modifyUser is 'User who modify row';
--
comment on column cdn_orgownershiptype.mi_deleteDate is 'Deletion date';
--
comment on column cdn_orgownershiptype.mi_deleteUser is 'User who delete row';
--
comment on table cdn_person is 'Physical persons dictionary';
--
comment on column cdn_person.lastName is 'Last name of the person';
--
comment on column cdn_person.firstName is 'First name of the person';
--
comment on column cdn_person.middleName is 'Middle name of the person';
--
comment on column cdn_person.identCard is 'Person''s identity card';
--
comment on column cdn_person.workPlacePos is 'Place of work, position';
--
comment on column cdn_person.birthDate is 'Birthday of the person';
--
comment on column cdn_person.description is 'Description of the person';
--
comment on column cdn_person.sexType is 'Person''s gender';
--
comment on column cdn_person.suffix is 'Suffix of the person';
--
comment on column cdn_person.shortFIO is 'Example: Antonov I.P.';
--
comment on column cdn_person.fullFIO is 'Example: Antonov Ivan Petrovich';
--
comment on column cdn_person.apply is 'Apply to the person';
--
comment on column cdn_person.photo is 'Person''s photo';
--
comment on column cdn_person.lastNameGen is 'Person''s last name in genitive case';
--
comment on column cdn_person.lastNameDat is 'Person''s last name in dative case';
--
comment on column cdn_person.firstNameGen is 'Person''s first name in genitive case';
--
comment on column cdn_person.firstNameDat is 'Person''s first name in dative case';
--
comment on column cdn_person.middleNameGen is 'Person''s middle name in genitive case';
--
comment on column cdn_person.middleNameDat is 'Person''s middle name in dative case';
--
comment on column cdn_person.shortFIOGen is 'Person''s short name in genitive case';
--
comment on column cdn_person.shortFIODat is 'Person''s short name in dative case';
--
comment on column cdn_person.fullFIOGen is 'Person''s full name in genitive case';
--
comment on column cdn_person.fullFIODat is 'Person''s full name in dative case';
--
comment on column cdn_person.applyGen is 'Apply to the person in genitive case';
--
comment on column cdn_person.applyDat is 'Apply to the person in dative case';
--
comment on column cdn_person.regionID is 'Person''s region';
--
comment on column cdn_person.socialstatusID is 'Social status position';
--
comment on column cdn_person.categoryID is 'Category position';
--
comment on column cdn_person.nationality is 'Nationality';
--
comment on column cdn_person.resident is 'Is person a resident of our country';
--
comment on column cdn_person.classID is 'Person classification';
--
comment on column cdn_person.mi_owner is 'Row owner';
--
comment on column cdn_person.mi_createDate is 'Creation date';
--
comment on column cdn_person.mi_createUser is 'User who create row';
--
comment on column cdn_person.mi_modifyDate is 'Modification date';
--
comment on column cdn_person.mi_modifyUser is 'User who modify row';
--
comment on column cdn_person.mi_deleteDate is 'Deletion date';
--
comment on column cdn_person.mi_deleteUser is 'User who delete row';
--
comment on table cdn_personcategory is 'Category of persons';
--
comment on column cdn_personcategory.code is 'Code';
--
comment on column cdn_personcategory.name is 'Name of category';
--
comment on column cdn_personcategory.mi_owner is 'Row owner';
--
comment on column cdn_personcategory.mi_createDate is 'Creation date';
--
comment on column cdn_personcategory.mi_createUser is 'User who create row';
--
comment on column cdn_personcategory.mi_modifyDate is 'Modification date';
--
comment on column cdn_personcategory.mi_modifyUser is 'User who modify row';
--
comment on column cdn_personcategory.mi_deleteDate is 'Deletion date';
--
comment on column cdn_personcategory.mi_deleteUser is 'User who delete row';
--
comment on table cdn_personclass is 'Person classification';
--
comment on column cdn_personclass.code is 'Code';
--
comment on column cdn_personclass.name is 'Name of category';
--
comment on column cdn_personclass.mi_owner is 'Row owner';
--
comment on column cdn_personclass.mi_createDate is 'Creation date';
--
comment on column cdn_personclass.mi_createUser is 'User who create row';
--
comment on column cdn_personclass.mi_modifyDate is 'Modification date';
--
comment on column cdn_personclass.mi_modifyUser is 'User who modify row';
--
comment on column cdn_personclass.mi_deleteDate is 'Deletion date';
--
comment on column cdn_personclass.mi_deleteUser is 'User who delete row';
--
comment on table cdn_personsocialstatus is 'Dictionary of social status';
--
comment on column cdn_personsocialstatus.code is 'Code';
--
comment on column cdn_personsocialstatus.name is 'Name of social status';
--
comment on column cdn_personsocialstatus.mi_owner is 'Row owner';
--
comment on column cdn_personsocialstatus.mi_createDate is 'Creation date';
--
comment on column cdn_personsocialstatus.mi_createUser is 'User who create row';
--
comment on column cdn_personsocialstatus.mi_modifyDate is 'Modification date';
--
comment on column cdn_personsocialstatus.mi_modifyUser is 'User who modify row';
--
comment on column cdn_personsocialstatus.mi_deleteDate is 'Deletion date';
--
comment on column cdn_personsocialstatus.mi_deleteUser is 'User who delete row';
--
comment on table cdn_postindex is 'ZIP codes';
--
comment on column cdn_postindex.code is 'Index';
--
comment on column cdn_postindex.streetID is 'Street';
--
comment on column cdn_postindex.description is 'Description';
--
comment on column cdn_postindex.mi_owner is 'Row owner';
--
comment on column cdn_postindex.mi_createDate is 'Creation date';
--
comment on column cdn_postindex.mi_createUser is 'User who create row';
--
comment on column cdn_postindex.mi_modifyDate is 'Modification date';
--
comment on column cdn_postindex.mi_modifyUser is 'User who modify row';
--
comment on column cdn_postindex.mi_deleteDate is 'Deletion date';
--
comment on column cdn_postindex.mi_deleteUser is 'User who delete row';
--
comment on table cdn_profession is 'Dictionary of standard professions';
--
comment on column cdn_profession.code is 'Code';
--
comment on column cdn_profession.name is 'Name of profession';
--
comment on column cdn_profession.mi_owner is 'Row owner';
--
comment on column cdn_profession.mi_createDate is 'Creation date';
--
comment on column cdn_profession.mi_createUser is 'User who create row';
--
comment on column cdn_profession.mi_modifyDate is 'Modification date';
--
comment on column cdn_profession.mi_modifyUser is 'User who modify row';
--
comment on column cdn_profession.mi_deleteDate is 'Deletion date';
--
comment on column cdn_profession.mi_deleteUser is 'User who delete row';
--
comment on table cdn_region is 'Regions dictionary';
--
comment on column cdn_region.parentAdminUnitID is 'Parent';
--
comment on column cdn_region.code is 'Internal code';
--
comment on column cdn_region.regionTypeID is 'Type of region';
--
comment on column cdn_region.name is 'Name of region';
--
comment on column cdn_region.caption is 'Caption';
--
comment on column cdn_region.fullName is 'Full name of region';
--
comment on column cdn_region.description is 'Description of region';
--
comment on column cdn_region.phoneCode is 'Phone code of region';
--
comment on column cdn_region.centerID is 'Center of region';
--
comment on column cdn_region.mi_owner is 'Row owner';
--
comment on column cdn_region.mi_createDate is 'Creation date';
--
comment on column cdn_region.mi_createUser is 'User who create row';
--
comment on column cdn_region.mi_modifyDate is 'Modification date';
--
comment on column cdn_region.mi_modifyUser is 'User who modify row';
--
comment on column cdn_region.mi_deleteDate is 'Deletion date';
--
comment on column cdn_region.mi_deleteUser is 'User who delete row';
--
comment on table cdn_regiontype is 'Region types dictionary';
--
comment on column cdn_regiontype.code is 'Code';
--
comment on column cdn_regiontype.name is 'Name of region type';
--
comment on column cdn_regiontype.mi_owner is 'Row owner';
--
comment on column cdn_regiontype.mi_createDate is 'Creation date';
--
comment on column cdn_regiontype.mi_createUser is 'User who create row';
--
comment on column cdn_regiontype.mi_modifyDate is 'Modification date';
--
comment on column cdn_regiontype.mi_modifyUser is 'User who modify row';
--
comment on column cdn_regiontype.mi_deleteDate is 'Deletion date';
--
comment on column cdn_regiontype.mi_deleteUser is 'User who delete row';
--
comment on table cdn_staffunittype is 'Staffunit types dictionary';
--
comment on column cdn_staffunittype.code is 'Code of the staffunit type';
--
comment on column cdn_staffunittype.name is 'Name of the staffunit type';
--
comment on column cdn_staffunittype.mi_owner is 'Row owner';
--
comment on column cdn_staffunittype.mi_createDate is 'Creation date';
--
comment on column cdn_staffunittype.mi_createUser is 'User who create row';
--
comment on column cdn_staffunittype.mi_modifyDate is 'Modification date';
--
comment on column cdn_staffunittype.mi_modifyUser is 'User who modify row';
--
comment on column cdn_staffunittype.mi_deleteDate is 'Deletion date';
--
comment on column cdn_staffunittype.mi_deleteUser is 'User who delete row';
--
comment on table cdn_street is 'List of streets';
--
comment on column cdn_street.name is 'Street name';
--
comment on column cdn_street.fullName is 'Street full name';
--
comment on column cdn_street.code is 'Code';
--
comment on column cdn_street.streetType is 'Type';
--
comment on column cdn_street.cityID is 'City';
--
comment on column cdn_street.mi_owner is 'Row owner';
--
comment on column cdn_street.mi_createDate is 'Creation date';
--
comment on column cdn_street.mi_createUser is 'User who create row';
--
comment on column cdn_street.mi_modifyDate is 'Modification date';
--
comment on column cdn_street.mi_modifyUser is 'User who modify row';
--
comment on column cdn_street.mi_deleteDate is 'Deletion date';
--
comment on column cdn_street.mi_deleteUser is 'User who delete row';
--
comment on table de_attribute is 'Attribute';
--
comment on column de_attribute.name is 'Name';
--
comment on column de_attribute.parentEntity is 'Parent entity';
--
comment on table de_entity is 'Entity';
--
comment on column de_entity.name is 'Name';
--
comment on column de_entity.parentModel is 'Parent model';
--
comment on table de_model is 'Model';
--
comment on column de_model.name is 'Name';
--
comment on table de_ruleAttribute is 'Rule for attribute';
--
comment on column de_ruleAttribute.name is 'Name';
--
comment on column de_ruleAttribute.parentRuleEntity is 'Parent rule entity';
--
comment on column de_ruleAttribute.attributeSource is 'Attribute source';
--
comment on column de_ruleAttribute.attributeDestination is 'Attribute destination';
--
comment on table de_ruleEntity is 'Rule for entity';
--
comment on column de_ruleEntity.name is 'Name';
--
comment on column de_ruleEntity.parentRuleModel is 'Parent rule model';
--
comment on column de_ruleEntity.entitySource is 'Entity source';
--
comment on column de_ruleEntity.entityDestination is 'Entity destination';
--
comment on table de_ruleModel is 'Rule for model';
--
comment on column de_ruleModel.name is 'Name';
--
comment on column de_ruleModel.modelSource is 'Model source';
--
comment on column de_ruleModel.modelDestination is 'Model destination';
--
comment on table org_department is 'Internal departments';
--
comment on column org_department.parentID is 'Parent';
--
comment on column org_department.code is 'Internal code';
--
comment on column org_department.name is 'Name of department without the quotes and abbreviations';
--
comment on column org_department.fullName is 'Department full name';
--
comment on column org_department.description is 'Department description';
--
comment on column org_department.nameGen is 'Department name without the quotes and abbreviations in genitive case';
--
comment on column org_department.nameDat is 'Department name without the quotes and abbreviations in dative case';
--
comment on column org_department.fullNameGen is 'Department full name in genitive case';
--
comment on column org_department.fullNameDat is 'Department full name in dative case';
--
comment on column org_department.depTypeID is 'Department type';
--
comment on column org_department.isClerical is 'Clerical unit mark';
--
comment on column org_department.caption is 'Caption';
--
comment on column org_department.mi_owner is 'Row owner';
--
comment on column org_department.mi_createDate is 'Creation date';
--
comment on column org_department.mi_createUser is 'User who create row';
--
comment on column org_department.mi_modifyDate is 'Modification date';
--
comment on column org_department.mi_modifyUser is 'User who modify row';
--
comment on column org_department.mi_deleteDate is 'Deletion date';
--
comment on column org_department.mi_deleteUser is 'User who delete row';
--
comment on table org_diagram is 'Diagrams';
--
comment on column org_diagram.orgunitID is 'Root';
--
comment on column org_diagram.caption is 'Name';
--
comment on column org_diagram.isdefault is 'Default';
--
comment on column org_diagram.document is 'Organization chart';
--
comment on column org_diagram.mi_owner is 'Row owner';
--
comment on column org_diagram.mi_createDate is 'Creation date';
--
comment on column org_diagram.mi_createUser is 'User who create row';
--
comment on column org_diagram.mi_modifyDate is 'Modification date';
--
comment on column org_diagram.mi_modifyUser is 'User who modify row';
--
comment on column org_diagram.mi_deleteDate is 'Deletion date';
--
comment on column org_diagram.mi_deleteUser is 'User who delete row';
--
comment on table org_employee is 'List of employees of internal organizations';
--
comment on column org_employee.code is 'Employees internal code';
--
comment on column org_employee.userID is 'User login';
--
comment on column org_employee.lastName is 'Employee last name';
--
comment on column org_employee.firstName is 'Employee first name';
--
comment on column org_employee.middleName is 'Employee middle name';
--
comment on column org_employee.birthDate is 'Date of birth';
--
comment on column org_employee.description is 'Comment on employee';
--
comment on column org_employee.sexType is 'Employee''s gender';
--
comment on column org_employee.suffix is 'Suffix';
--
comment on column org_employee.shortFIO is 'Example: Smith J.K.';
--
comment on column org_employee.fullFIO is 'Example: Smith Jay Key';
--
comment on column org_employee.apply is 'Describes how to treat to this person';
--
comment on column org_employee.lastNameGen is 'Employee last name in genitive case';
--
comment on column org_employee.lastNameDat is 'Employee last name in dative case';
--
comment on column org_employee.lastNameObj is 'Employee last name in objective case';
--
comment on column org_employee.firstNameGen is 'Employee first name in genitive case';
--
comment on column org_employee.firstNameDat is 'Employee first name in dative case';
--
comment on column org_employee.firstNameObj is 'Employee first name in objective case';
--
comment on column org_employee.middleNameGen is 'Employee middle name in genitive case';
--
comment on column org_employee.middleNameDat is 'Employee middle name in dative case';
--
comment on column org_employee.middleNameObj is 'Employee middle name in objective case';
--
comment on column org_employee.shortFIOGen is 'Employee short name in genitive case';
--
comment on column org_employee.shortFIODat is 'Employee short name in dative case';
--
comment on column org_employee.shortFIOObj is 'Employee short name in objective case';
--
comment on column org_employee.fullFIOGen is 'Employee full name in genitive case';
--
comment on column org_employee.fullFIODat is 'Employee full name in dative case';
--
comment on column org_employee.fullFIOObj is 'Employee full name in objective case';
--
comment on column org_employee.applyGen is 'Describes how to treat to this person in genitive case';
--
comment on column org_employee.applyDat is 'Describes how to treat to this person in dative case';
--
comment on column org_employee.applyObj is 'Describes how to treat to this person in objective case';
--
comment on column org_employee.facsimile is 'Employee signature image';
--
comment on column org_employee.mi_owner is 'Row owner';
--
comment on column org_employee.mi_createDate is 'Creation date';
--
comment on column org_employee.mi_createUser is 'User who create row';
--
comment on column org_employee.mi_modifyDate is 'Modification date';
--
comment on column org_employee.mi_modifyUser is 'User who modify row';
--
comment on column org_employee.mi_deleteDate is 'Deletion date';
--
comment on column org_employee.mi_deleteUser is 'User who delete row';
--
comment on table org_employeeonstaff is 'List of internal organization assignments';
--
comment on column org_employeeonstaff.tabNo is 'Employee number';
--
comment on column org_employeeonstaff.employeeID is 'Employee';
--
comment on column org_employeeonstaff.staffUnitID is 'Internal organization staff unit';
--
comment on column org_employeeonstaff.employeeOnStaffType is 'Assignment type';
--
comment on column org_employeeonstaff.description is 'Assignment description';
--
comment on column org_employeeonstaff.caption is 'Caption';
--
comment on column org_employeeonstaff.mi_owner is 'Row owner';
--
comment on column org_employeeonstaff.mi_createDate is 'Creation date';
--
comment on column org_employeeonstaff.mi_createUser is 'User who create row';
--
comment on column org_employeeonstaff.mi_modifyDate is 'Modification date';
--
comment on column org_employeeonstaff.mi_modifyUser is 'User who modify row';
--
comment on column org_employeeonstaff.mi_deleteDate is 'Deletion date';
--
comment on column org_employeeonstaff.mi_deleteUser is 'User who delete row';
--
comment on table org_employeeonstaff_pending is 'Assignment with pending date';
--
comment on column org_employeeonstaff_pending.emponstaffID is 'Assignment';
--
comment on column org_employeeonstaff_pending.startDate is 'Assignment start date';
--
comment on column org_employeeonstaff_pending.endDate is 'Assignment end date';
--
comment on column org_employeeonstaff_pending.mi_owner is 'Row owner';
--
comment on column org_employeeonstaff_pending.mi_createDate is 'Creation date';
--
comment on column org_employeeonstaff_pending.mi_createUser is 'User who create row';
--
comment on column org_employeeonstaff_pending.mi_modifyDate is 'Modification date';
--
comment on column org_employeeonstaff_pending.mi_modifyUser is 'User who modify row';
--
comment on table org_execgroup is 'List of typical executors groups for tasks executors';
--
comment on column org_execgroup.parentID is 'Parent unit of group';
--
comment on column org_execgroup.code is 'Code of the group';
--
comment on column org_execgroup.name is 'Name of the group';
--
comment on column org_execgroup.nameGen is 'Department name in genitive case';
--
comment on column org_execgroup.nameDat is 'Department name in dative case';
--
comment on column org_execgroup.mi_owner is 'Row owner';
--
comment on column org_execgroup.mi_createDate is 'Creation date';
--
comment on column org_execgroup.mi_createUser is 'User who create row';
--
comment on column org_execgroup.mi_modifyDate is 'Modification date';
--
comment on column org_execgroup.mi_modifyUser is 'User who modify row';
--
comment on column org_execgroup.mi_deleteDate is 'Deletion date';
--
comment on column org_execgroup.mi_deleteUser is 'User who delete row';
--
comment on table org_execgroupmember is 'Executors who attached to group and used for executors autofilling in resolutions on group addition';
--
comment on column org_execgroupmember.execGroupID is 'Executors group';
--
comment on column org_execgroupmember.orgUnitID is 'Executor';
--
comment on column org_execgroupmember.mi_owner is 'Row owner';
--
comment on column org_execgroupmember.mi_createDate is 'Creation date';
--
comment on column org_execgroupmember.mi_createUser is 'User who create row';
--
comment on column org_execgroupmember.mi_modifyDate is 'Modification date';
--
comment on column org_execgroupmember.mi_modifyUser is 'User who modify row';
--
comment on table org_orgaccount is 'Settlement accounts for internal organizations';
--
comment on column org_orgaccount.organizationID is 'Organization';
--
comment on column org_orgaccount.currencyID is 'Currency of the account';
--
comment on column org_orgaccount.bankID is 'Bank of the account';
--
comment on column org_orgaccount.code is 'Code of the account (account number)';
--
comment on column org_orgaccount.acctype is 'Type of the account';
--
comment on column org_orgaccount.description is 'Description';
--
comment on column org_orgaccount.mi_owner is 'Row owner';
--
comment on column org_orgaccount.mi_createDate is 'Creation date';
--
comment on column org_orgaccount.mi_createUser is 'User who create row';
--
comment on column org_orgaccount.mi_modifyDate is 'Modification date';
--
comment on column org_orgaccount.mi_modifyUser is 'User who modify row';
--
comment on column org_orgaccount.mi_deleteDate is 'Deletion date';
--
comment on column org_orgaccount.mi_deleteUser is 'User who delete row';
--
comment on table org_organization is ' List of internal organizations';
--
comment on column org_organization.parentID is 'Parent';
--
comment on column org_organization.code is 'Organization internal code';
--
comment on column org_organization.OKPOCode is 'Common classifier of enterprises and organizations (CCEO)';
--
comment on column org_organization.taxCode is 'Tax number';
--
comment on column org_organization.vatCode is 'VAT (value-added tax) registration certificate number';
--
comment on column org_organization.name is 'Name of organization without the quotes and abbreviations';
--
comment on column org_organization.fullName is 'Full name of organization, as it''s specified in the certificate of registration';
--
comment on column org_organization.nameGen is 'Organization name in genitive case';
--
comment on column org_organization.nameDat is 'Organization name in dative case';
--
comment on column org_organization.fullNameGen is 'Full name of organization, as it''s specified in the certificate of registration, in genitive case';
--
comment on column org_organization.fullNameDat is 'Full name of organization, as it''s specified in the certificate of registration, in dative case';
--
comment on column org_organization.description is 'Organization description';
--
comment on column org_organization.orgBusinessTypeID is 'Organization type';
--
comment on column org_organization.orgOwnershipTypeID is 'Ownership type';
--
comment on column org_organization.mi_owner is 'Row owner';
--
comment on column org_organization.mi_createDate is 'Creation date';
--
comment on column org_organization.mi_createUser is 'User who create row';
--
comment on column org_organization.mi_modifyDate is 'Modification date';
--
comment on column org_organization.mi_modifyUser is 'User who modify row';
--
comment on column org_organization.mi_deleteDate is 'Deletion date';
--
comment on column org_organization.mi_deleteUser is 'User who delete row';
--
comment on table org_profession is 'List of positions';
--
comment on column org_profession.code is 'Code of position';
--
comment on column org_profession.name is 'Position name';
--
comment on column org_profession.fullName is 'Position full name';
--
comment on column org_profession.nameGen is 'Position name in genitive case';
--
comment on column org_profession.nameDat is 'Position name in dative case';
--
comment on column org_profession.fullNameGen is 'Position full name in genitive case';
--
comment on column org_profession.fullNameDat is 'Position full name in dative case';
--
comment on column org_profession.mi_owner is 'Row owner';
--
comment on column org_profession.mi_createDate is 'Creation date';
--
comment on column org_profession.mi_createUser is 'User who create row';
--
comment on column org_profession.mi_modifyDate is 'Modification date';
--
comment on column org_profession.mi_modifyUser is 'User who modify row';
--
comment on column org_profession.mi_deleteDate is 'Deletion date';
--
comment on column org_profession.mi_deleteUser is 'User who delete row';
--
comment on table org_staffunit is 'List of staff units';
--
comment on column org_staffunit.parentID is 'Parent';
--
comment on column org_staffunit.code is 'Staff unit internal code';
--
comment on column org_staffunit.name is 'Name of staff unit without the quotes and abbreviations';
--
comment on column org_staffunit.fullName is 'Staff unit full name';
--
comment on column org_staffunit.description is 'Staff unit description';
--
comment on column org_staffunit.nameGen is 'Name of staff unit without the quotes and abbreviations in genitive case';
--
comment on column org_staffunit.nameDat is 'Name of staff unit without the quotes and abbreviations in dative case';
--
comment on column org_staffunit.fullNameGen is 'Staff unit full name in genitive case';
--
comment on column org_staffunit.fullNameDat is 'Full name in dative case';
--
comment on column org_staffunit.caption is 'Caption';
--
comment on column org_staffunit.professionExtID is 'Profession';
--
comment on column org_staffunit.professionID is 'Position';
--
comment on column org_staffunit.staffUnitTypeID is 'Staff unit type';
--
comment on column org_staffunit.subordinationLevel is 'If level is lower - then staff unit is more important';
--
comment on column org_staffunit.isBoss is 'Boss';
--
comment on column org_staffunit.mi_owner is 'Row owner';
--
comment on column org_staffunit.mi_createDate is 'Creation date';
--
comment on column org_staffunit.mi_createUser is 'User who create row';
--
comment on column org_staffunit.mi_modifyDate is 'Modification date';
--
comment on column org_staffunit.mi_modifyUser is 'User who modify row';
--
comment on column org_staffunit.mi_deleteDate is 'Deletion date';
--
comment on column org_staffunit.mi_deleteUser is 'User who delete row';
--
comment on table org_unit is 'List of organization units';
--
comment on column org_unit.parentID is 'Parent';
--
comment on column org_unit.code is 'Organization unit internal code';
--
comment on column org_unit.caption is 'Caption';
--
comment on column org_unit.unitType is 'Organization unit type';
--
comment on column org_unit.mi_owner is 'Row owner';
--
comment on column org_unit.mi_createDate is 'Creation date';
--
comment on column org_unit.mi_createUser is 'User who create row';
--
comment on column org_unit.mi_modifyDate is 'Modification date';
--
comment on column org_unit.mi_modifyUser is 'User who modify row';
--
comment on column org_unit.mi_deleteDate is 'Deletion date';
--
comment on column org_unit.mi_deleteUser is 'User who delete row';
--
comment on table pl_product is 'Номенклатура';
--
comment on column pl_product.name is 'Назва';
--
comment on table ub_blobHistory is 'File BLOB history';
--
comment on column ub_blobHistory.instance is 'InstanceID';
--
comment on column ub_blobHistory.attribute is 'Attribute';
--
comment on column ub_blobHistory.revision is 'Revision';
--
comment on column ub_blobHistory.permanent is 'isPermanent';
--
comment on column ub_blobHistory.blobInfo is 'blobInfo';
--
comment on table uba_advSecurity is 'Advanced security settings';
--
comment on column uba_advSecurity.userID is 'User';
--
comment on column uba_advSecurity.editCause is 'Cause of change';
--
comment on column uba_advSecurity.allowedIP is 'Allowed IP address';
--
comment on column uba_advSecurity.refreshIP is 'Refresh allowed IP';
--
comment on column uba_advSecurity.fp is 'Fingerprint';
--
comment on column uba_advSecurity.refreshFp is 'Refresh fingerprint';
--
comment on column uba_advSecurity.keyMediaName is 'Key media name';
--
comment on column uba_advSecurity.refreshKeyMedia is 'Refresh key media name';
--
comment on column uba_advSecurity.additional is 'JSON with advanced settings';
--
comment on column uba_advSecurity.mi_owner is 'Row owner';
--
comment on column uba_advSecurity.mi_createDate is 'Creation date';
--
comment on column uba_advSecurity.mi_createUser is 'User who create row';
--
comment on column uba_advSecurity.mi_modifyDate is 'Modification date';
--
comment on column uba_advSecurity.mi_modifyUser is 'User who modify row';
--
comment on table uba_als is 'Attribute level security';
--
comment on column uba_als.entity is 'Entity';
--
comment on column uba_als.attribute is 'Attribute';
--
comment on column uba_als.state is 'State code';
--
comment on column uba_als.roleName is 'Role name';
--
comment on column uba_als.actions is 'Allow actions';
--
comment on table uba_audit is 'Security changes audit';
--
comment on column uba_audit.entity is 'Entity';
--
comment on column uba_audit.entityinfo_id is 'Instance ID';
--
comment on column uba_audit.actionType is 'Action';
--
comment on column uba_audit.actionUser is 'User';
--
comment on column uba_audit.actionTime is 'Action time';
--
comment on column uba_audit.remoteIP is 'Caller remote IP address';
--
comment on column uba_audit.targetUser is 'The user name for which the data has changed';
--
comment on column uba_audit.targetRole is 'The role name for which the data has changed';
--
comment on column uba_audit.fromValue is 'Old values';
--
comment on column uba_audit.toValue is 'New values';
--
comment on column uba_audit.targetGroup is 'The group name for which the data has changed';
--
comment on table uba_auditTrail is 'Data changes audit';
--
comment on column uba_auditTrail.entity is 'Entity';
--
comment on column uba_auditTrail.entityinfo_id is 'Instance ID';
--
comment on column uba_auditTrail.actionType is 'Action';
--
comment on column uba_auditTrail.actionUser is 'User';
--
comment on column uba_auditTrail.actionUserName is 'Login';
--
comment on column uba_auditTrail.actionTime is 'Action time';
--
comment on column uba_auditTrail.remoteIP is 'Remote IP';
--
comment on column uba_auditTrail.parentEntity is 'Parent entity name';
--
comment on column uba_auditTrail.parentEntityInfo_id is 'Parent instance ID';
--
comment on column uba_auditTrail.request_id is 'Request ID';
--
comment on column uba_auditTrail.fromValue is 'Old values';
--
comment on column uba_auditTrail.toValue is 'New values';
--
comment on table uba_els is 'Describe, which role have access permissions to Entities methods';
--
comment on column uba_els.code is 'Code for ELS rule';
--
comment on column uba_els.description is 'Rule description';
--
comment on column uba_els.disabled is 'Rule is disabled';
--
comment on column uba_els.entityMask is 'Entity mask';
--
comment on column uba_els.methodMask is 'Method mask';
--
comment on column uba_els.ruleType is 'Rule type';
--
comment on column uba_els.ruleRole is 'Role for which the rule applies';
--
comment on column uba_els.mi_owner is 'Row owner';
--
comment on column uba_els.mi_createDate is 'Creation date';
--
comment on column uba_els.mi_createUser is 'User who create row';
--
comment on column uba_els.mi_modifyDate is 'Modification date';
--
comment on column uba_els.mi_modifyUser is 'User who modify row';
--
comment on table uba_group is 'User groups';
--
comment on column uba_group.code is 'Group code';
--
comment on column uba_group.name is 'Name';
--
comment on column uba_group.description is 'Description';
--
comment on column uba_group.mi_owner is 'Row owner';
--
comment on column uba_group.mi_createDate is 'Creation date';
--
comment on column uba_group.mi_createUser is 'User who create row';
--
comment on column uba_group.mi_modifyDate is 'Modification date';
--
comment on column uba_group.mi_modifyUser is 'User who modify row';
--
comment on table uba_grouprole is 'Roles assigned to groups';
--
comment on column uba_grouprole.groupID is 'Group';
--
comment on column uba_grouprole.roleID is 'Role';
--
comment on column uba_grouprole.mi_owner is 'Row owner';
--
comment on column uba_grouprole.mi_createDate is 'Creation date';
--
comment on column uba_grouprole.mi_createUser is 'User who create row';
--
comment on column uba_grouprole.mi_modifyDate is 'Modification date';
--
comment on column uba_grouprole.mi_modifyUser is 'User who modify row';
--
comment on table uba_otp is 'One time passwords';
--
comment on column uba_otp.otp is 'Generated one time password';
--
comment on column uba_otp.userID is 'User for which password was generated';
--
comment on column uba_otp.uData is 'Additional  data';
--
comment on column uba_otp.expiredDate is 'Expired date';
--
comment on column uba_otp.otpKind is 'Kind of otp(Email, SMS etc)';
--
comment on column uba_otp.mi_owner is 'Row owner';
--
comment on column uba_otp.mi_createDate is 'Creation date';
--
comment on column uba_otp.mi_createUser is 'User who create row';
--
comment on column uba_otp.mi_modifyDate is 'Modification date';
--
comment on column uba_otp.mi_modifyUser is 'User who modify row';
--
comment on table uba_prevPasswordsHash is 'Previous passwords hashes';
--
comment on column uba_prevPasswordsHash.userID is 'User';
--
comment on column uba_prevPasswordsHash.uPasswordHashHexa is 'Password hash';
--
comment on column uba_prevPasswordsHash.mi_owner is 'Row owner';
--
comment on column uba_prevPasswordsHash.mi_createDate is 'Creation date';
--
comment on column uba_prevPasswordsHash.mi_createUser is 'User who create row';
--
comment on column uba_prevPasswordsHash.mi_modifyDate is 'Modification date';
--
comment on column uba_prevPasswordsHash.mi_modifyUser is 'User who modify row';
--
comment on table uba_role is 'Administering subsystem roles';
--
comment on column uba_role.name is 'Role';
--
comment on column uba_role.description is 'Description';
--
comment on column uba_role.sessionTimeout is 'Time after which the session is deleted by timeout (in minutes)';
--
comment on column uba_role.allowedAppMethods is 'Which application level methods are allowed';
--
comment on column uba_role.mi_owner is 'Row owner';
--
comment on column uba_role.mi_createDate is 'Creation date';
--
comment on column uba_role.mi_createUser is 'User who create row';
--
comment on column uba_role.mi_modifyDate is 'Modification date';
--
comment on column uba_role.mi_modifyUser is 'User who modify row';
--
comment on table uba_subject is 'Administration subjects';
--
comment on column uba_subject.code is 'Code';
--
comment on column uba_subject.name is 'Login';
--
comment on column uba_subject.sType is 'Subject type';
--
comment on table uba_user is 'Users';
--
comment on column uba_user.name is 'User login in lower case';
--
comment on column uba_user.description is 'Additional description of user account';
--
comment on column uba_user.uPasswordHashHexa is 'Password hash';
--
comment on column uba_user.disabled is 'Disabled';
--
comment on column uba_user.isPending is 'The user is waiting for confirmation of registration';
--
comment on column uba_user.trustedIP is 'trusted IPs';
--
comment on column uba_user.uData is 'Additional  data';
--
comment on column uba_user.lastPasswordChangeDate is 'Last password change date';
--
comment on column uba_user.firstName is 'First Name';
--
comment on column uba_user.lastName is 'Last Name';
--
comment on column uba_user.fullName is 'Full Name';
--
comment on column uba_user.gender is 'User gender';
--
comment on column uba_user.email is 'User email (could be used for notifications)';
--
comment on column uba_user.phone is 'User phone (could be used for sms)';
--
comment on column uba_user.avatar is 'User avatar image (recommended 128x128)';
--
comment on column uba_user.mi_owner is 'Row owner';
--
comment on column uba_user.mi_createDate is 'Creation date';
--
comment on column uba_user.mi_createUser is 'User who create row';
--
comment on column uba_user.mi_modifyDate is 'Modification date';
--
comment on column uba_user.mi_modifyUser is 'User who modify row';
--
comment on table uba_usercertificate is 'User certificates';
--
comment on column uba_usercertificate.userID is 'User';
--
comment on column uba_usercertificate.issuer_serial is 'Issuer tag of certificate';
--
comment on column uba_usercertificate.issuer_cn is 'Issuer caption';
--
comment on column uba_usercertificate.serial is 'Certificate serial number';
--
comment on column uba_usercertificate.certificate is 'Certificate binary data';
--
comment on column uba_usercertificate.description is 'Description';
--
comment on column uba_usercertificate.disabled is 'disabled';
--
comment on column uba_usercertificate.revoked is 'Revoked';
--
comment on column uba_usercertificate.revocationDate is 'Revocation date';
--
comment on column uba_usercertificate.mi_owner is 'Row owner';
--
comment on column uba_usercertificate.mi_createDate is 'Creation date';
--
comment on column uba_usercertificate.mi_createUser is 'User who create row';
--
comment on column uba_usercertificate.mi_modifyDate is 'Modification date';
--
comment on column uba_usercertificate.mi_modifyUser is 'User who modify row';
--
comment on table uba_usergroup is 'User memberships in groups';
--
comment on column uba_usergroup.userID is 'User';
--
comment on column uba_usergroup.groupID is 'Group';
--
comment on column uba_usergroup.mi_owner is 'Row owner';
--
comment on column uba_usergroup.mi_createDate is 'Creation date';
--
comment on column uba_usergroup.mi_createUser is 'User who create row';
--
comment on column uba_usergroup.mi_modifyDate is 'Modification date';
--
comment on column uba_usergroup.mi_modifyUser is 'User who modify row';
--
comment on table uba_userrole is 'Roles assigned to user';
--
comment on column uba_userrole.userID is 'User';
--
comment on column uba_userrole.roleID is 'Role';
--
comment on column uba_userrole.mi_owner is 'Row owner';
--
comment on column uba_userrole.mi_createDate is 'Creation date';
--
comment on column uba_userrole.mi_createUser is 'User who create row';
--
comment on column uba_userrole.mi_modifyDate is 'Modification date';
--
comment on column uba_userrole.mi_modifyUser is 'User who modify row';
--
comment on table ubm_desktop is 'Application desktops';
--
comment on column ubm_desktop.caption is 'Desktop name';
--
comment on column ubm_desktop.code is 'Code';
--
comment on column ubm_desktop.description is 'Desktop description';
--
comment on column ubm_desktop.iconCls is 'Desktop icon';
--
comment on column ubm_desktop.url is 'Static server page URL which is displayed in screen centre of selected desktop';
--
comment on column ubm_desktop.isDefault is 'By default?';
--
comment on column ubm_desktop.displayOrder is 'Display order';
--
comment on column ubm_desktop.mi_owner is 'Row owner';
--
comment on column ubm_desktop.mi_createDate is 'Creation date';
--
comment on column ubm_desktop.mi_createUser is 'User who create row';
--
comment on column ubm_desktop.mi_modifyDate is 'Modification date';
--
comment on column ubm_desktop.mi_modifyUser is 'User who modify row';
--
comment on column ubm_desktop.mi_deleteDate is 'Deletion date';
--
comment on column ubm_desktop.mi_deleteUser is 'User who delete row';
--
comment on table ubm_desktop_adm is 'Administering of desktops';
--
comment on column ubm_desktop_adm.instanceID is 'Desktop';
--
comment on column ubm_desktop_adm.admSubjID is 'Admin subject';
--
comment on table ubm_enum is 'Enumerated values';
--
comment on column ubm_enum.eGroup is 'Group';
--
comment on column ubm_enum.code is 'Value code';
--
comment on column ubm_enum.shortName is 'Short name';
--
comment on column ubm_enum.name is 'Value name';
--
comment on column ubm_enum.sortOrder is 'Order #';
--
comment on column ubm_enum.mi_owner is 'Row owner';
--
comment on column ubm_enum.mi_createDate is 'Creation date';
--
comment on column ubm_enum.mi_createUser is 'User who create row';
--
comment on column ubm_enum.mi_modifyDate is 'Modification date';
--
comment on column ubm_enum.mi_modifyUser is 'User who modify row';
--
comment on column ubm_enum.mi_deleteDate is 'Deletion date';
--
comment on column ubm_enum.mi_deleteUser is 'User who delete row';
--
comment on table ubm_navshortcut is 'Metadata for build navbars';
--
comment on column ubm_navshortcut.desktopID is 'Desktop';
--
comment on column ubm_navshortcut.parentID is 'Shortcut folder';
--
comment on column ubm_navshortcut.code is 'Code';
--
comment on column ubm_navshortcut.isFolder is 'Is folder?';
--
comment on column ubm_navshortcut.caption is 'Shortcut caption';
--
comment on column ubm_navshortcut.cmdCode is 'Command code';
--
comment on column ubm_navshortcut.inWindow is 'Display in new window';
--
comment on column ubm_navshortcut.isCollapsed is 'Show collapsed at the first start';
--
comment on column ubm_navshortcut.displayOrder is 'Display order (in current node)';
--
comment on column ubm_navshortcut.iconCls is 'Icon (CSS class)';
--
comment on column ubm_navshortcut.description is 'Shortcut description';
--
comment on column ubm_navshortcut.keywords is 'Search keywords';
--
comment on column ubm_navshortcut.mi_owner is 'Row owner';
--
comment on column ubm_navshortcut.mi_createDate is 'Creation date';
--
comment on column ubm_navshortcut.mi_createUser is 'User who create row';
--
comment on column ubm_navshortcut.mi_modifyDate is 'Modification date';
--
comment on column ubm_navshortcut.mi_modifyUser is 'User who modify row';
--
comment on column ubm_navshortcut.mi_deleteDate is 'Deletion date';
--
comment on column ubm_navshortcut.mi_deleteUser is 'User who delete row';
--
comment on table ubm_navshortcut_adm is 'Description';
--
comment on column ubm_navshortcut_adm.instanceID is 'Shortcut';
--
comment on column ubm_navshortcut_adm.admSubjID is 'Subject of administration';
--
comment on table ubm_query is 'Data Queries';
--
comment on column ubm_query.code is 'Code';
--
comment on column ubm_query.name is 'Name';
--
comment on column ubm_query.ubql is 'UBQL (JSON)';
--
comment on column ubm_query.mi_owner is 'Row owner';
--
comment on column ubm_query.mi_createDate is 'Creation date';
--
comment on column ubm_query.mi_createUser is 'User who create row';
--
comment on column ubm_query.mi_modifyDate is 'Modification date';
--
comment on column ubm_query.mi_modifyUser is 'User who modify row';
--
comment on column ubm_query.mi_deleteDate is 'Deletion date';
--
comment on column ubm_query.mi_deleteUser is 'User who delete row';
--
comment on table ubs_filter is 'Stored UI filters';
--
comment on column ubs_filter.code is 'Code of filter group';
--
comment on column ubs_filter.name is 'Filter name';
--
comment on column ubs_filter.filter is 'filter';
--
comment on column ubs_filter.isGlobal is 'Is this filter accessible for all users';
--
comment on column ubs_filter.owner is 'Filter owner';
--
comment on column ubs_filter.mi_owner is 'Row owner';
--
comment on column ubs_filter.mi_createDate is 'Creation date';
--
comment on column ubs_filter.mi_createUser is 'User who create row';
--
comment on column ubs_filter.mi_modifyDate is 'Modification date';
--
comment on column ubs_filter.mi_modifyUser is 'User who modify row';
--
comment on table ubs_message is 'System messages';
--
comment on column ubs_message.messageBody is 'Message';
--
comment on column ubs_message.complete is 'Submitted';
--
comment on column ubs_message.messageType is 'Type';
--
comment on column ubs_message.startDate is 'Valid from';
--
comment on column ubs_message.expireDate is 'Valid to';
--
comment on column ubs_message.mi_owner is 'Row owner';
--
comment on column ubs_message.mi_createDate is 'Creation date';
--
comment on column ubs_message.mi_createUser is 'User who create row';
--
comment on column ubs_message.mi_modifyDate is 'Modification date';
--
comment on column ubs_message.mi_modifyUser is 'User who modify row';
--
comment on column ubs_message.mi_deleteDate is 'Deletion date';
--
comment on column ubs_message.mi_deleteUser is 'User who delete row';
--
comment on table ubs_message_recipient is 'System messages recipients';
--
comment on column ubs_message_recipient.messageID is 'Message';
--
comment on column ubs_message_recipient.userID is 'User';
--
comment on column ubs_message_recipient.acceptDate is 'Accept date';
--
comment on table ubs_numcounter is 'Registration key counter';
--
comment on column ubs_numcounter.regKey is 'Registration key';
--
comment on column ubs_numcounter.counter is 'Counter';
--
comment on column ubs_numcounter.fakeLock is 'Used internally';
--
comment on table ubs_numcounterreserv is 'Reserved counters for registration keys';
--
comment on column ubs_numcounterreserv.regKey is 'Registration key';
--
comment on column ubs_numcounterreserv.counter is 'Counter';
--
comment on column ubs_numcounterreserv.reservedDate is 'Reserved date for document';
--
comment on column ubs_numcounterreserv.note is 'Description of reserved number (Department name, etc)';
--
comment on table ubs_settings is 'Entity with information about system settings';
--
comment on column ubs_settings.settingKey is 'Setting key';
--
comment on column ubs_settings.name is 'Setting name';
--
comment on column ubs_settings.description is 'Description';
--
comment on column ubs_settings.type is 'Value type';
--
comment on column ubs_settings.settingValue is 'Value';
--
comment on column ubs_settings.defaultValue is 'Default value';
--
comment on column ubs_settings.mi_owner is 'Row owner';
--
comment on column ubs_settings.mi_createDate is 'Creation date';
--
comment on column ubs_settings.mi_createUser is 'User who create row';
--
comment on column ubs_settings.mi_modifyDate is 'Modification date';
--
comment on column ubs_settings.mi_modifyUser is 'User who modify row';
--
comment on table ubs_softLock is 'Pessimistic locks';
--
comment on column ubs_softLock.entity is 'Entity';
--
comment on column ubs_softLock.lockID is 'Instance ID';
--
comment on column ubs_softLock.lockUser is 'User, who locking record';
--
comment on column ubs_softLock.lockType is 'Lock type';
--
comment on column ubs_softLock.lockTime is 'Lock time';