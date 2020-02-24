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
create table req_depart(
	ID BIGINT not null,
	name VARCHAR(255) not null,
	postAddr VARCHAR(255) not null,
	phoneNum VARCHAR(255) not null
);
--
create table req_reqList(
	ID BIGINT not null,
	reqDate TIMESTAMP not null,
	applicantPhone VARCHAR(255) not null,
	applicantInfo VARCHAR(255) not null,
	department BIGINT not null,
	subDepartment BIGINT null,
	reqText TEXT not null,
	reqDoc VARCHAR(4000) null,
	answer TEXT null
);
--
create table req_subDepart(
	ID BIGINT not null,
	name VARCHAR(255) not null,
	department BIGINT not null
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
	iconCls VARCHAR(255) default 'fa fa-desktop' not null,
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
alter table req_depart add constraint PK_REQ_DEPART PRIMARY KEY (ID);
--
alter table req_reqList add constraint PK_REQ PRIMARY KEY (ID);
--
alter table req_subDepart add constraint PK_REQ_SUBDEPART PRIMARY KEY (ID);
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
create unique index UIDX_REQ_DEPART_NAME on req_depart(NAME);
--
create  index IDX_REQ_DEPARTMENT on req_reqList(DEPARTMENT);
--
create  index IDX_REQ_SUBDEPARTMENT on req_reqList(SUBDEPARTMENT);
--
create  index IDX_REQ_SUBDEPART_DEPARTMENT on req_subDepart(DEPARTMENT);
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
alter table req_reqList add constraint FK_REQ_DEPARTMENT_REF_REQ_DEPART foreign key (DEPARTMENT) references req_depart(ID);
--
alter table req_reqList add constraint FK_REQ_SUBDEPARTMENT_REF_REQ_SUBDEPART foreign key (SUBDEPARTMENT) references req_subDepart(ID);
--
alter table req_subDepart add constraint FK_REQ_SUBDEPART_DEPARTMENT_REF_REQ_DEPART foreign key (DEPARTMENT) references req_depart(ID);
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
create sequence S_UBM_ENUM increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_UBM_ENUM');
--
create sequence S_UBS_SETTINGS increment 1 maxvalue 999999999999999 start 1 cycle cache 1;
--
SELECT nextval('S_UBS_SETTINGS');
 
-- Annotate an objects
--#############################################################
comment on table req_depart is 'department';
--
comment on column req_depart.name is 'Department Name';
--
comment on column req_depart.postAddr is 'Department Address';
--
comment on column req_depart.phoneNum is 'Department Phone';
--
comment on table req_reqList is 'request';
--
comment on column req_reqList.reqDate is 'Request Date';
--
comment on column req_reqList.applicantPhone is 'Applicant`s phone';
--
comment on column req_reqList.applicantInfo is 'Applicant`s contact info';
--
comment on column req_reqList.department is 'Department';
--
comment on column req_reqList.subDepartment is 'SubDepartment';
--
comment on column req_reqList.reqText is 'Text of request';
--
comment on column req_reqList.reqDoc is 'doc';
--
comment on column req_reqList.answer is 'Request answer';
--
comment on table req_subDepart is 'subDepartment';
--
comment on column req_subDepart.name is 'Department Name';
--
comment on column req_subDepart.department is 'department';
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
comment on column uba_auditTrail.actionUserName is 'User';
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
comment on column ubm_navshortcut.iconCls is 'icon css class name';
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