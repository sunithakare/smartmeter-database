-- custom.accounts definition

-- Drop table

-- DROP TABLE custom.accounts;

CREATE TABLE custom.accounts (
	user_id serial4 NOT NULL,
	created_on timestamp NOT NULL,
	email varchar(255) NULL,
	last_login timestamp NULL,
	"password" varchar(50) NULL,
	username varchar(50) NULL,
	created_by varchar(25) NULL,
	created_date timestamp NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	CONSTRAINT accounts1_pkey PRIMARY KEY (user_id),
	CONSTRAINT accounts_email_unq UNIQUE (email),
	CONSTRAINT accounts_username_unq UNIQUE (username)
);
CREATE UNIQUE INDEX accounts_pkey ON custom.accounts USING btree (user_id);
CREATE UNIQUE INDEX uk_email ON custom.accounts USING btree (email);
CREATE UNIQUE INDEX uk_username ON custom.accounts USING btree (username);


-- custom.adherence_security_policy definition

-- Drop table

-- DROP TABLE custom.adherence_security_policy;

CREATE TABLE custom.adherence_security_policy (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	section_title text NULL,
	policy_statement text NULL,
	adherence_status text NULL,
	supporting_document text NULL,
	statedetail_code varchar(25) NULL,
	discomdetail_code varchar(25) NULL,
	created_by varchar(150) NULL,
	created_date timestamp NULL DEFAULT now(),
	modified_by varchar(150) NULL,
	modified_date timestamp NULL,
	quarterly varchar(50) NULL,
	"year" varchar(50) NULL,
	"Section Title" varchar(52) NULL,
	CONSTRAINT adh_security_policy_pkey PRIMARY KEY (id)
);


-- custom.aims_import_ccb_data definition

-- Drop table

-- DROP TABLE custom.aims_import_ccb_data;

CREATE TABLE custom.aims_import_ccb_data (
	reference_id varchar(50) NOT NULL DEFAULT lpad(nextval('custom.aims_import_ccb_data_seq'::regclass)::character varying::text, 7, '1000'::text),
	quantity varchar(50) NULL,
	file_upload bytea NULL,
	CONSTRAINT aims_import_ccb_data_pk PRIMARY KEY (reference_id)
);


-- custom.aims_import_hes_data definition

-- Drop table

-- DROP TABLE custom.aims_import_hes_data;

CREATE TABLE custom.aims_import_hes_data (
	reference_id varchar(50) NOT NULL DEFAULT lpad(nextval('custom.aims_import_hes_data_seq'::regclass)::character varying::text, 7, '1000'::text),
	quantity varchar(50) NULL,
	file_upload bytea NULL,
	CONSTRAINT aims_import_hes_data_pk PRIMARY KEY (reference_id)
);


-- custom.aims_import_mi_data definition

-- Drop table

-- DROP TABLE custom.aims_import_mi_data;

CREATE TABLE custom.aims_import_mi_data (
	reference_id varchar(50) NOT NULL DEFAULT lpad(nextval('custom.aims_import_mi_data_seq'::regclass)::character varying::text, 7, '1000'::text),
	discom varchar(20) NULL,
	warehouse varchar(50) NULL,
	subcontractor varchar(50) NULL,
	connection_type varchar(50) NULL,
	quantity varchar(20) NULL,
	remark varchar(500) NULL,
	file_upload bytea NULL,
	CONSTRAINT aims_import_mi_data_pk PRIMARY KEY (reference_id)
);


-- custom.aims_indent_approver_page definition

-- Drop table

-- DROP TABLE custom.aims_indent_approver_page;

CREATE TABLE custom.aims_indent_approver_page (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	indent_no varchar(200) NULL DEFAULT lpad(nextval('custom.aims_indent_no_apprvr_page_seq'::regclass)::character varying::text, 7, '1000'::text),
	agency_type varchar NOT NULL,
	agency_name varchar NOT NULL,
	warehouse varchar NOT NULL,
	indent_date timestamp NOT NULL,
	auth_person varchar NOT NULL,
	contact_no numeric NOT NULL,
	item_group varchar NULL,
	item_category varchar NULL,
	item_model_name varchar NULL,
	supplier varchar NULL,
	qty numeric NULL,
	apprx_qty numeric NULL,
	"action" varchar NULL,
	remark varchar(150) NULL,
	CONSTRAINT aims_indent_approver_page_un UNIQUE (indent_no),
	CONSTRAINT indent_approver_page_pk PRIMARY KEY (id)
);


-- custom.aims_indent_delivery_challan_page definition

-- Drop table

-- DROP TABLE custom.aims_indent_delivery_challan_page;

CREATE TABLE custom.aims_indent_delivery_challan_page (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	indent_no int8 NOT NULL,
	indent_date timestamp NOT NULL,
	dc_number int8 NOT NULL,
	dc_date timestamp NOT NULL,
	warehouse varchar NOT NULL,
	requested_by varchar NULL,
	item_group varchar NOT NULL,
	item_model_name varchar NOT NULL,
	req_qty numeric NULL,
	apprx_qty numeric NULL,
	dispatched_qty numeric NULL,
	"action" varchar NULL
);


-- custom.aims_indent_request definition

-- Drop table

-- DROP TABLE custom.aims_indent_request;

CREATE TABLE custom.aims_indent_request (
	agency_type varchar(20) NOT NULL,
	agency_name varchar(50) NOT NULL,
	warehouse varchar(100) NOT NULL,
	indent_date timestamp NOT NULL,
	auth_person varchar(50) NOT NULL,
	contact_no numeric NOT NULL,
	approver varchar(20) NOT NULL,
	remark varchar(150) NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	item_group varchar NULL,
	item_category varchar NULL,
	item_model_name varchar NULL,
	supplier varchar NULL,
	qty numeric NULL,
	CONSTRAINT aims_indent_request_pk PRIMARY KEY (id)
);


-- custom.aims_indent_warehouse_details definition

-- Drop table

-- DROP TABLE custom.aims_indent_warehouse_details;

CREATE TABLE custom.aims_indent_warehouse_details (
	indent_no int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	agency_type varchar(20) NOT NULL,
	agency_name varchar(50) NOT NULL,
	warehouse varchar(100) NOT NULL,
	indent_date timestamp NOT NULL,
	auth_person varchar(50) NOT NULL,
	contact_no numeric NOT NULL,
	item_group varchar(20) NOT NULL,
	item_category varchar(20) NOT NULL,
	item_model_name varchar(20) NOT NULL,
	supplier varchar(20) NOT NULL,
	quantity int8 NOT NULL,
	approx_quantity int8 NOT NULL,
	dispatch_quantity int8 NOT NULL,
	remark varchar(150) NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_warehouse_indent_details_pk PRIMARY KEY (indent_no)
);


-- custom.aims_indentwise_outward_import definition

-- Drop table

-- DROP TABLE custom.aims_indentwise_outward_import;

CREATE TABLE custom.aims_indentwise_outward_import (
	discom varchar(50) NULL,
	warehouse_name varchar(100) NULL,
	file_upload bytea NULL
);
CREATE INDEX aims_indentwise_outward_import_discom_idx ON custom.aims_indentwise_outward_import USING btree (discom);


-- custom.aims_inward_from_supplier definition

-- Drop table

-- DROP TABLE custom.aims_inward_from_supplier;

CREATE TABLE custom.aims_inward_from_supplier (
	reference_id varchar(50) NOT NULL DEFAULT lpad(nextval('custom.aims_inward_import_id_seq'::regclass)::character varying::text, 7, '1000'::text),
	discom varchar(20) NOT NULL,
	warehouse_name varchar(100) NOT NULL,
	supplier varchar(100) NOT NULL,
	invoice_no varchar(100) NOT NULL,
	invoice_date timestamp NOT NULL,
	gin_no varchar(50) NOT NULL,
	gin_date timestamp NOT NULL,
	item_group varchar(100) NOT NULL,
	item_model_name varchar(100) NOT NULL,
	item_supplier varchar(100) NOT NULL,
	item_category varchar(100) NOT NULL,
	quantity int4 NOT NULL,
	item_status varchar(50) NOT NULL,
	transporter varchar(100) NOT NULL,
	lr_no varchar(50) NOT NULL,
	vehicle_no varchar(100) NOT NULL,
	driver_name varchar(100) NOT NULL,
	contact_no varchar(20) NOT NULL,
	remark varchar(500) NULL,
	pdi_date timestamp NOT NULL,
	lr_date information_schema."time_stamp" NOT NULL,
	stock_type varchar(20) NOT NULL,
	document_id int8 NULL,
	data_file_id int8 NULL,
	doc_upload bytea NULL,
	CONSTRAINT aims_inward_import_pk PRIMARY KEY (reference_id)
);
CREATE INDEX aims_inward_import_discom_idx ON custom.aims_inward_from_supplier USING btree (discom);


-- custom.aims_item_category definition

-- Drop table

-- DROP TABLE custom.aims_item_category;

CREATE TABLE custom.aims_item_category (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	remark varchar(150) NULL,
	status varchar(20) NOT NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(150) NULL,
	modified_by varchar(150) NULL,
	modified_date timestamp NULL,
	deactivated_date timestamp NULL,
	item_group varchar(100) NOT NULL,
	item_category varchar(100) NOT NULL,
	CONSTRAINT aims_item_category_un UNIQUE (item_category),
	CONSTRAINT aims_item_type_pk PRIMARY KEY (id)
);


-- custom.aims_item_group definition

-- Drop table

-- DROP TABLE custom.aims_item_group;

CREATE TABLE custom.aims_item_group (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	item_group varchar(1000) NOT NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(150) NULL DEFAULT 'ADMIN'::character varying,
	modified_by varchar(150) NULL,
	modified_date timestamp NULL,
	deactivated_date timestamp NULL,
	transaction_mechnsm varchar(100) NULL,
	CONSTRAINT aims_item_group_pk PRIMARY KEY (id),
	CONSTRAINT aims_item_grp_grp_trans_un UNIQUE (item_group, transaction_mechnsm)
);


-- custom.aims_item_make definition

-- Drop table

-- DROP TABLE custom.aims_item_make;

CREATE TABLE custom.aims_item_make (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	item_supplier varchar(1000) NULL,
	item_make varchar(1000) NULL,
	status bool NOT NULL DEFAULT false,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(150) NULL,
	modified_by varchar(150) NULL,
	modified_date timestamp NULL,
	deactivated_date timestamp NULL,
	CONSTRAINT aims_item_make_pk PRIMARY KEY (id)
);


-- custom.aims_item_model_name definition

-- Drop table

-- DROP TABLE custom.aims_item_model_name;

CREATE TABLE custom.aims_item_model_name (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	item_group varchar(100) NOT NULL,
	item_category varchar(100) NOT NULL,
	supplier varchar(100) NOT NULL,
	item_model_name varchar(100) NOT NULL,
	uom varchar(100) NOT NULL,
	item_hsn varchar(100) NOT NULL,
	item_description varchar(200) NOT NULL,
	remarks varchar(200) NULL,
	warranty_month int4 NOT NULL,
	status varchar(20) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(150) NULL,
	modified_by varchar(150) NULL,
	modified_date timestamp NULL,
	deactivated_date timestamp NULL,
	item_model_code varchar(200) NULL,
	CONSTRAINT aims_item_model_name_un UNIQUE (item_model_name),
	CONSTRAINT aims_item_pk PRIMARY KEY (id)
);


-- custom.aims_old_meter_inward definition

-- Drop table

-- DROP TABLE custom.aims_old_meter_inward;

CREATE TABLE custom.aims_old_meter_inward (
	reference_id varchar(50) NOT NULL DEFAULT lpad(nextval('custom.aims_old_meter_inward_seq'::regclass)::character varying::text, 7, '1000'::text),
	discom varchar(20) NULL,
	warehouse varchar(100) NULL,
	subcontractor_type varchar(100) NULL,
	subcontractor varchar(100) NULL,
	doc_no varchar(50) NULL,
	invoice_date timestamp NULL,
	gin_no varchar(50) NULL,
	grn_date timestamp NULL,
	item_status varchar(20) NULL,
	quantity varchar(20) NULL,
	transporter varchar(50) NULL,
	lr_no varchar(50) NULL,
	vehicle_no varchar(50) NULL,
	driver_name varchar(50) NULL,
	contact_no varchar(20) NULL,
	remark varchar(500) NULL,
	CONSTRAINT aims_old_meter_inward_pk PRIMARY KEY (reference_id)
);


-- custom.aims_old_meter_outward definition

-- Drop table

-- DROP TABLE custom.aims_old_meter_outward;

CREATE TABLE custom.aims_old_meter_outward (
	reference_id varchar(50) NOT NULL DEFAULT lpad(nextval('custom.aims_old_meter_outward_seq'::regclass)::character varying::text, 7, '1000'::text),
	discom varchar(20) NULL,
	warehouse varchar(100) NULL,
	doc_no varchar(50) NULL,
	doc_date timestamp NULL,
	dc_no varchar(100) NULL,
	dc_date timestamp NULL,
	item_status varchar(20) NULL,
	quantity varchar(20) NULL,
	lr_no varchar(50) NULL,
	transporter varchar(50) NULL,
	vehicle_no varchar(50) NULL,
	driver_name varchar(50) NULL,
	contact_no varchar(20) NULL,
	remark varchar(500) NULL,
	CONSTRAINT aims_old_meter_outward_pk PRIMARY KEY (reference_id)
);


-- custom.aims_outward_to_subcontractor definition

-- Drop table

-- DROP TABLE custom.aims_outward_to_subcontractor;

CREATE TABLE custom.aims_outward_to_subcontractor (
	reference_id varchar(50) NOT NULL DEFAULT lpad(nextval('custom.aims_outward_import_seq'::regclass)::character varying::text, 7, '1000'::text),
	discom varchar(50) NOT NULL,
	warehouse_name varchar(100) NOT NULL,
	subcontractor_type varchar(50) NOT NULL,
	subcontractor varchar(50) NULL,
	indent_no int4 NULL,
	indent_date timestamp NOT NULL,
	dc_no varchar(50) NULL,
	dispatch_date timestamp NOT NULL,
	item_group varchar(50) NOT NULL,
	item_model_name varchar(100) NOT NULL,
	item_supplier varchar(100) NOT NULL,
	item_category varchar(100) NOT NULL,
	item_status varchar(100) NOT NULL,
	quantity int4 NULL,
	transporter varchar(100) NOT NULL,
	lr_no varchar(100) NOT NULL,
	vehicle_no varchar(100) NOT NULL,
	driver_name varchar(100) NOT NULL,
	contact_no varchar(20) NOT NULL,
	remark varchar(500) NULL,
	lr_date timestamp NOT NULL,
	doc_upload bytea NULL,
	req_qty int4 NULL,
	appr_qty int4 NULL,
	disp_qty int4 NULL,
	CONSTRAINT aims_outward_import_pk PRIMARY KEY (reference_id)
);


-- custom.aims_return_from_subcontractor definition

-- Drop table

-- DROP TABLE custom.aims_return_from_subcontractor;

CREATE TABLE custom.aims_return_from_subcontractor (
	referene_id varchar(50) NOT NULL DEFAULT lpad(nextval('custom.aims_return_from_subcontractor_seq'::regclass)::character varying::text, 7, '1000'::text),
	discom varchar(50) NOT NULL,
	warehouse_name varchar(50) NOT NULL,
	subcontractor_type varchar(100) NULL,
	subcontractor varchar(100) NOT NULL,
	doc_no int4 NOT NULL,
	doc_date timestamp NOT NULL,
	srn_no varchar(100) NULL,
	srn_date timestamp NULL,
	item_group varchar(50) NOT NULL,
	item_model_name varchar(100) NOT NULL,
	item_supplier varchar(100) NOT NULL,
	item_category varchar(50) NOT NULL,
	item_status varchar(50) NOT NULL,
	quantity int4 NULL,
	transporter varchar(100) NULL,
	lr_no varchar(100) NULL,
	vehicle_no varchar(100) NOT NULL,
	driver_name varchar(100) NOT NULL,
	contact_no varchar(20) NOT NULL,
	remark varchar(500) NULL,
	lr_date timestamp NULL,
	doc_attach bytea NULL,
	CONSTRAINT aims_return_from_subcontractor_pk PRIMARY KEY (referene_id)
);


-- custom.aims_return_to_supplier definition

-- Drop table

-- DROP TABLE custom.aims_return_to_supplier;

CREATE TABLE custom.aims_return_to_supplier (
	reference_id varchar(50) NOT NULL DEFAULT lpad(nextval('custom.aims_return_to_supplier_id_seq'::regclass)::character varying::text, 7, '1000'::text),
	discom varchar(50) NULL,
	warehouse_name varchar(100) NULL,
	supplier varchar(100) NULL,
	dc varchar(50) NULL,
	dc_date timestamp NULL,
	dispatch_date timestamp NULL,
	item_group varchar(100) NULL,
	item_model_name varchar(100) NULL,
	item_supplier varchar(100) NULL,
	item_category varchar(100) NULL,
	quantity int4 NULL,
	item_status varchar(100) NULL,
	transporter varchar(100) NULL,
	lr_no varchar(50) NULL,
	vehicle_no varchar(50) NULL,
	driver_name varchar(100) NULL,
	contact_no varchar(20) NULL,
	remark varchar(500) NULL,
	lr_date timestamp NULL,
	file_upload bytea NULL,
	data_file_id int8 NULL,
	CONSTRAINT aims_return_to_supplier_pk PRIMARY KEY (reference_id)
);


-- custom.aims_sim_activation_deactivation definition

-- Drop table

-- DROP TABLE custom.aims_sim_activation_deactivation;

CREATE TABLE custom.aims_sim_activation_deactivation (
	reference_id varchar(50) NOT NULL DEFAULT lpad(nextval('custom.aims_sim_activation_deactivation_seq'::regclass)::character varying::text, 7, '1000'::text),
	discom varchar(20) NULL,
	warehouse_name varchar(50) NULL,
	activn_deactivatn_date timestamp NULL,
	quantity varchar(20) NULL,
	file_upload bytea NULL,
	CONSTRAINT aims_sim_activation_deactivation_pk PRIMARY KEY (reference_id)
);


-- custom.aims_subcontrctor_mapping_mstr definition

-- Drop table

-- DROP TABLE custom.aims_subcontrctor_mapping_mstr;

CREATE TABLE custom.aims_subcontrctor_mapping_mstr (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	discom varchar(50) NULL,
	warehouse varchar(100) NULL,
	subcontractor varchar(100) NULL,
	subcontractor_name varchar(100) NULL,
	subcontractor_code varchar(100) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(150) NULL,
	modified_by varchar(150) NULL,
	modified_date timestamp NULL,
	deactivated_date timestamp NULL,
	CONSTRAINT aims_subcontrctor_mapping_mstr_pk PRIMARY KEY (id)
);


-- custom.aims_supplier definition

-- Drop table

-- DROP TABLE custom.aims_supplier;

CREATE TABLE custom.aims_supplier (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	supplier varchar(100) NOT NULL,
	contact_person varchar(50) NOT NULL,
	state varchar(20) NOT NULL,
	city varchar(20) NULL,
	address varchar(200) NOT NULL,
	gstin_no varchar(50) NOT NULL,
	mobile_number numeric(10) NOT NULL,
	email varchar(50) NOT NULL,
	remark varchar(200) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(150) NULL DEFAULT 'ADMIN'::character varying,
	modified_by varchar(150) NULL,
	modified_date timestamp NULL,
	deactivated_date timestamp NULL,
	status varchar(20) NOT NULL,
	supplier_code varchar(200) NULL DEFAULT lpad(nextval('custom.aims_supplier_seq'::regclass)::character varying::text, 7, '1000'::text),
	CONSTRAINT aims_supplier_subcontrct_mstr_pk PRIMARY KEY (id),
	CONSTRAINT aims_supplier_un UNIQUE (supplier_code)
);


-- custom.aims_update_mi_data definition

-- Drop table

-- DROP TABLE custom.aims_update_mi_data;

CREATE TABLE custom.aims_update_mi_data (
	id serial4 NOT NULL,
	discom varchar(20) NULL,
	warehouse varchar(50) NULL,
	subcontractor varchar(50) NULL,
	connection_type varchar(20) NULL,
	mi_date date NULL,
	consumer_no int4 NULL,
	new_meter_no varchar(50) NULL,
	old_meter_no varchar(50) NULL,
	remark varchar(500) NULL
);


-- custom.aims_warehouse definition

-- Drop table

-- DROP TABLE custom.aims_warehouse;

CREATE TABLE custom.aims_warehouse (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	discom varchar(100) NULL,
	warehouse_name varchar(100) NOT NULL,
	city varchar(100) NULL,
	pincode numeric(10) NOT NULL,
	address varchar(200) NOT NULL,
	contact_person varchar(100) NOT NULL,
	contact_number numeric(10) NOT NULL,
	email_id varchar(50) NOT NULL,
	"space" numeric(10) NOT NULL,
	status varchar(20) NOT NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(150) NULL DEFAULT 'ADMIN'::character varying,
	modified_by varchar(150) NULL,
	modified_date timestamp NULL,
	deactivated_date timestamp NULL,
	state varchar(100) NULL,
	uom varchar(20) NULL,
	warehouse_code varchar(200) NULL DEFAULT lpad(nextval('custom.aims_warehouse_creation_seq'::regclass)::character varying::text, 7, '1000'::text),
	CONSTRAINT aims_warehouse_creation_pk PRIMARY KEY (id),
	CONSTRAINT aims_warehouse_cty_disc_wn_st_un UNIQUE (discom, city, state, warehouse_name)
);


-- custom.aims_wh_wh_inward definition

-- Drop table

-- DROP TABLE custom.aims_wh_wh_inward;

CREATE TABLE custom.aims_wh_wh_inward (
	reference_id varchar(50) NOT NULL DEFAULT lpad(nextval('custom.aims_wh_wh_inward_seq'::regclass)::character varying::text, 7, '1000'::text),
	discom_from varchar(50) NOT NULL,
	receiver varchar(100) NOT NULL,
	discom_to varchar(50) NOT NULL,
	sender varchar(100) NOT NULL,
	dc_no varchar(50) NOT NULL,
	dc_date timestamp NULL,
	inward_date timestamp NOT NULL,
	item_group varchar(100) NOT NULL,
	item_model_name varchar(100) NOT NULL,
	item_supplier varchar(100) NOT NULL,
	item_category varchar(50) NOT NULL,
	item_status varchar(50) NOT NULL,
	quantity int4 NOT NULL,
	transporter varchar(100) NOT NULL,
	lr_no varchar(50) NOT NULL,
	vehicle_no varchar(50) NOT NULL,
	driver_name varchar(50) NOT NULL,
	contact_no varchar(20) NOT NULL,
	remark varchar(500) NULL,
	gin_no varchar(20) NOT NULL,
	lr_date timestamp NULL,
	doc_upload bytea NULL,
	file_name varchar(500) NULL,
	CONSTRAINT aims_wh_wh_inward_pk PRIMARY KEY (reference_id)
);


-- custom.aims_wh_wh_outward definition

-- Drop table

-- DROP TABLE custom.aims_wh_wh_outward;

CREATE TABLE custom.aims_wh_wh_outward (
	reference_id varchar(50) NOT NULL DEFAULT lpad(nextval('custom.aims_wh_wh_outward_seq'::regclass)::character varying::text, 7, '1000'::text),
	discom_from varchar(50) NOT NULL,
	sender varchar(100) NOT NULL,
	discom_to varchar(100) NOT NULL,
	receiver varchar(100) NULL,
	doc_no varchar(100) NOT NULL,
	doc_date timestamp NOT NULL,
	dispatch_date timestamp NOT NULL,
	item_group varchar(100) NOT NULL,
	item_model_name varchar(100) NOT NULL,
	item_supplier varchar(100) NOT NULL,
	item_category varchar(100) NOT NULL,
	quantity int4 NOT NULL,
	item_status varchar(100) NOT NULL,
	transporter varchar(100) NOT NULL,
	lr_no varchar(50) NOT NULL,
	vehicle_no varchar(50) NOT NULL,
	driver_name varchar(100) NOT NULL,
	contact_no varchar(20) NOT NULL,
	remark varchar(500) NULL,
	lr_date timestamp NOT NULL,
	doc_upload bytea NULL,
	file_name varchar(500) NULL,
	CONSTRAINT aims_wh_wh_outward_pk PRIMARY KEY (reference_id)
);


-- custom.amihelpdesk_detailtable definition

-- Drop table

-- DROP TABLE custom.amihelpdesk_detailtable;

CREATE TABLE custom.amihelpdesk_detailtable (
	id varchar(20) NOT NULL,
	discom varchar(30) NULL,
	city varchar(30) NULL,
	consumer_no varchar(500) NULL,
	requestorname text NULL,
	createdtime timestamp NULL,
	category text NULL,
	impact varchar(200) NULL,
	priority varchar(200) NULL,
	status varchar(200) NULL,
	dueby timestamp NULL,
	updatedtime timestamp NULL,
	resolvedtime timestamp NULL,
	resolutiontime varchar(500) NULL,
	totalworkingtime varchar(500) NULL,
	supportlevel varchar(200) NULL,
	typesofservices varchar(300) NULL,
	attended_by varchar(300) NULL,
	rootcause varchar(500) NULL,
	action_taken varchar(500) NULL,
	preventiveaction varchar(500) NULL,
	division varchar(300) NULL,
	sub_division varchar(300) NULL,
	sub_station varchar(300) NULL,
	feeder_name varchar(300) NULL,
	consumer_name varchar(500) NULL,
	address text NULL,
	mobile_no varchar(150) NULL,
	alternate_mob_no varchar(500) NULL,
	technician varchar(400) NULL,
	"location" varchar(300) NULL,
	state varchar(20) NULL,
	statedetail_code varchar(25) NULL DEFAULT NULL::character varying,
	discomdetail_code varchar(25) NULL DEFAULT NULL::character varying,
	created_by varchar(25) NULL DEFAULT 'DataLoad'::character varying,
	created_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	modified_by varchar(25) NULL DEFAULT 'ADMIN'::character varying,
	modified_date timestamp NULL,
	is_active numeric(1) NOT NULL DEFAULT 1,
	CONSTRAINT amihelpdesk_detailtable_id_pk PRIMARY KEY (id)
);
CREATE INDEX ahd_discom_idx ON custom.amihelpdesk_detailtable USING btree (discom);
CREATE INDEX ahd_state_idx ON custom.amihelpdesk_detailtable USING btree (state);


-- custom.amihelpdesk_totalcounts definition

-- Drop table

-- DROP TABLE custom.amihelpdesk_totalcounts;

CREATE TABLE custom.amihelpdesk_totalcounts (
	discom varchar(10) NULL,
	total_tickets_booked int4 NULL,
	total_ticket_resolved_within_sla int4 NULL,
	total_ticket_resolved_beyond_sla int4 NULL,
	total_ticket_on_hold int4 NULL,
	total_ticket_pending_for_resolution int4 NULL,
	excluding_hold_tickets int4 NULL,
	including_hold_tickets int4 NULL,
	"month" varchar(10) NULL,
	"year" varchar(10) NULL,
	month_year varchar(10) NULL,
	state varchar(20) NULL,
	created_date timestamp NULL DEFAULT now(),
	modified_date timestamp NULL,
	modified_by varchar(25) NULL,
	created_by varchar(25) NULL
);
CREATE INDEX amihelpdesk_month_idx ON custom.amihelpdesk_totalcounts USING btree (month);
CREATE INDEX amihelpdesk_month_year_idx ON custom.amihelpdesk_totalcounts USING btree (month_year);
CREATE INDEX amihelpdesk_totalcounts_discom_idx ON custom.amihelpdesk_totalcounts USING btree (discom);
CREATE INDEX amihelpdesk_totalcounts_state_idx ON custom.amihelpdesk_totalcounts USING btree (state);
CREATE INDEX amihelpdesk_year_idx ON custom.amihelpdesk_totalcounts USING btree (year);


-- custom.approval_process definition

-- Drop table

-- DROP TABLE custom.approval_process;

CREATE TABLE custom.approval_process (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	process_name varchar NOT NULL,
	active bool NOT NULL DEFAULT true,
	"desc" varchar NULL,
	CONSTRAINT approval_process_pk PRIMARY KEY (id),
	CONSTRAINT approval_process_un UNIQUE (process_name)
);


-- custom.batch_job_instance definition

-- Drop table

-- DROP TABLE custom.batch_job_instance;

CREATE TABLE custom.batch_job_instance (
	job_instance_id int8 NOT NULL,
	"version" int8 NULL,
	job_name varchar(100) NOT NULL,
	job_key varchar(32) NOT NULL,
	CONSTRAINT batch_job_instance_pkey PRIMARY KEY (job_instance_id),
	CONSTRAINT job_inst_un UNIQUE (job_name, job_key)
);


-- custom.changemanagement_detailtable definition

-- Drop table

-- DROP TABLE custom.changemanagement_detailtable;

CREATE TABLE custom.changemanagement_detailtable (
	id varchar(20) NOT NULL,
	requestorname varchar(30) NULL,
	category varchar(30) NULL,
	createdtime timestamp NULL,
	changetype varchar(30) NULL,
	subject text NULL,
	description text NULL,
	reasontype varchar(30) NULL,
	urgency varchar(20) NULL,
	changeimplementer varchar(30) NULL,
	changemanager varchar(30) NULL,
	changereviewer varchar(30) NULL,
	planningstarttime timestamp NULL,
	planningendtime timestamp NULL,
	schedulestartdate timestamp NULL,
	scheduleenddate timestamp NULL,
	approved_rejectedby varchar(30) NULL,
	approvalendtime timestamp NULL,
	approved_rejectedremarks varchar(30) NULL,
	approvalstatus varchar(40) NULL,
	closedtime timestamp NULL,
	closedtimeduration varchar(50) NULL,
	risk_identification_analysis varchar(40) NULL,
	pre_implementationtestplan varchar(4000) NULL,
	validationplan varchar(4000) NULL,
	backoutplan text NULL,
	remarksforexclusion varchar(50) NULL,
	stage varchar(40) NULL,
	discom varchar(100) NULL,
	state varchar(20) NULL,
	statedetail_code varchar(25) NULL DEFAULT NULL::character varying,
	discomdetail_code varchar(25) NULL DEFAULT NULL::character varying,
	created_by varchar(25) NULL DEFAULT 'DataLoad'::character varying,
	created_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	modified_by varchar(25) NULL DEFAULT 'ADMIN'::character varying,
	modified_date timestamp NULL,
	is_active numeric(1) NOT NULL DEFAULT 1,
	CONSTRAINT changemanagement_detailtable_pk PRIMARY KEY (id)
);
CREATE INDEX chm_discom_idx ON custom.changemanagement_detailtable USING btree (discom);
CREATE INDEX chm_state_idx ON custom.changemanagement_detailtable USING btree (state);


-- custom.changemanagement_totalcount definition

-- Drop table

-- DROP TABLE custom.changemanagement_totalcount;

CREATE TABLE custom.changemanagement_totalcount (
	state varchar(100) NULL,
	discom varchar(100) NULL,
	total_ticket int4 NULL,
	within_agreedtime int4 NULL,
	beyond_agreedtime int4 NULL,
	hold_ticket int4 NULL,
	pending int4 NULL,
	excl_hold_perc numeric(5, 2) NULL,
	incl_hold_perc numeric(5, 2) NULL,
	"month" varchar(30) NULL,
	"year" varchar(10) NULL,
	month_year varchar(100) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX changemanagement_totalcount_discom_idx ON custom.changemanagement_totalcount USING btree (discom);
CREATE INDEX changemanagement_totalcount_state_idx ON custom.changemanagement_totalcount USING btree (state);
CREATE INDEX chnge_mngnmnt_month_idx ON custom.changemanagement_totalcount USING btree (month);
CREATE INDEX chnge_mngnmnt_month_year_idx ON custom.changemanagement_totalcount USING btree (month_year);
CREATE INDEX chnge_mngnmnt_year_idx ON custom.changemanagement_totalcount USING btree (year);


-- custom.ci_agency_allotment definition

-- Drop table

-- DROP TABLE custom.ci_agency_allotment;

CREATE TABLE custom.ci_agency_allotment (
	state varchar(100) NULL,
	agency_code varchar(100) NULL,
	city varchar(100) NULL,
	division varchar(100) NULL,
	allocation varchar(50) NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	allocation_data varchar(20) NULL,
	discom varchar NULL,
	allocated_by varchar(150) NULL,
	allocated_date timestamp NULL,
	de_allocated_date timestamp NULL,
	active bool NOT NULL DEFAULT true,
	division_filter varchar NULL,
	CONSTRAINT ci_agency_allotment_un UNIQUE (agency_code, division, allocation_data, active),
	CONSTRAINT ipt_ci_agency_allotment_id_pk PRIMARY KEY (id)
);


-- custom.ci_agency_creation definition

-- Drop table

-- DROP TABLE custom.ci_agency_creation;

CREATE TABLE custom.ci_agency_creation (
	agency_type varchar NULL,
	agency_name varchar(100) NULL,
	mobile varchar NULL,
	email varchar(100) NULL,
	landmark varchar(200) NULL,
	agency_manager varchar(100) NULL,
	status varchar(100) NULL DEFAULT 'InActive'::character varying,
	agency_code varchar(100) NOT NULL DEFAULT lpad(nextval('custom.agency_creation_id_seq'::regclass)::character varying::text, 7, '000'::text),
	ci_agency bool NOT NULL DEFAULT false,
	mi_agency bool NOT NULL DEFAULT false,
	o_m_agency bool NOT NULL DEFAULT false,
	enh_agency bool NOT NULL DEFAULT false,
	external_id varchar NULL,
	CONSTRAINT ci_agency_code_pk PRIMARY KEY (agency_code),
	CONSTRAINT ci_agency_creation_un UNIQUE (agency_name)
);


-- custom.ci_enh_data definition

-- Drop table

-- DROP TABLE custom.ci_enh_data;

CREATE TABLE custom.ci_enh_data (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	state varchar NOT NULL,
	state_name varchar NULL,
	discom varchar NOT NULL,
	discom_name varchar NULL,
	"zone" varchar NOT NULL,
	zone_name varchar NULL,
	city varchar NOT NULL,
	city_name varchar NULL,
	circle varchar NOT NULL,
	circle_name varchar NULL,
	division varchar NOT NULL,
	division_name varchar NULL,
	sub_division varchar NOT NULL,
	sub_division_name varchar NULL,
	sub_station varchar NOT NULL,
	sub_station_name varchar NULL,
	feeder varchar NOT NULL,
	feeder_name varchar NULL,
	dtr varchar NOT NULL,
	dtr_name varchar NULL,
	pole varchar NOT NULL,
	pole_name varchar NULL,
	feeder_location varchar NULL,
	feeder_landmark varchar NULL,
	dtr_rating varchar NULL,
	dtr_location varchar NULL,
	dtr_landmark varchar NULL,
	pole_type varchar NULL,
	pole_location varchar NULL,
	pole_landmark varchar NULL,
	sub_station_location varchar NULL,
	sub_station_landmark varchar NULL,
	CONSTRAINT ci_enh_data_pk PRIMARY KEY (id)
);


-- custom.ci_enh_sub_station definition

-- Drop table

-- DROP TABLE custom.ci_enh_sub_station;

CREATE TABLE custom.ci_enh_sub_station (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	code varchar NOT NULL,
	"location" varchar NOT NULL,
	landmark varchar NULL,
	division varchar NOT NULL,
	createdby varchar(150) NOT NULL,
	createddate timestamp NOT NULL,
	status varchar NULL,
	CONSTRAINT ci_enh_sub_station_pk PRIMARY KEY (id),
	CONSTRAINT ci_enh_sub_station_un1 UNIQUE (code, division)
);


-- custom.ci_exception definition

-- Drop table

-- DROP TABLE custom.ci_exception;

CREATE TABLE custom.ci_exception (
	consumer_no varchar NOT NULL,
	cosumer_name varchar NULL,
	oldmeterno varchar NULL,
	landmark varchar NULL,
	"location" varchar NULL,
	remarks varchar NULL,
	created_by varchar NULL,
	created_date timestamp NULL,
	agency_name varchar NULL,
	CONSTRAINT ci_exception_pk PRIMARY KEY (consumer_no)
);


-- custom.ci_field_user_allotment definition

-- Drop table

-- DROP TABLE custom.ci_field_user_allotment;

CREATE TABLE custom.ci_field_user_allotment (
	state_id varchar(100) NULL,
	discom_id varchar(100) NULL,
	allocation_datatype varchar(100) NULL,
	user_id varchar(100) NOT NULL,
	allocation varchar(50) NULL,
	city varchar(100) NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	allotted_division varchar NULL,
	allocated_by varchar(150) NULL,
	allocated_date timestamp NULL,
	de_allocated_date timestamp NULL,
	active bool NOT NULL DEFAULT true,
	agency varchar NULL,
	CONSTRAINT ci_field_id_pk PRIMARY KEY (id),
	CONSTRAINT ci_field_user_allotment_un UNIQUE (allocation_datatype, user_id, allotted_division, active)
);


-- custom.ci_master_approved_data definition

-- Drop table

-- DROP TABLE custom.ci_master_approved_data;

CREATE TABLE custom.ci_master_approved_data (
	consumer_no varchar NOT NULL,
	"name" varchar(150) NULL,
	mobile varchar(10) NULL,
	address varchar NULL,
	state varchar NULL,
	discom varchar NULL,
	city varchar NULL,
	"zone" varchar NULL,
	circle varchar NULL,
	division varchar NULL,
	sub_division varchar NULL,
	sub_station varchar NULL,
	feeder varchar NULL,
	dtr varchar NULL,
	pole varchar NULL,
	meters_on_pole int4 NULL,
	longitude_latitude varchar NULL,
	network_operator varchar NULL,
	signal_strength varchar NULL,
	connection_type varchar NULL,
	meter_no varchar NULL,
	meter_type varchar NULL,
	meter_make varchar NULL,
	meter_reading varchar NULL,
	meter_box_status varchar NULL,
	meter_seal_status varchar NULL,
	agency varchar NULL,
	verified_by varchar(100) NULL,
	verified_date timestamp NULL,
	remarks varchar NULL,
	created_by varchar(100) NULL,
	modified_by varchar(100) NULL,
	created_date timestamp NULL,
	modified_date timestamp NULL,
	discom_cable_required varchar NULL,
	survey_time timestamp NULL,
	photo_file_id int8 NULL,
	"type" varchar NULL,
	field_user_remarks varchar NULL,
	multiply_factor varchar NULL,
	alternate_mobile varchar NULL,
	meter_install_feasibility varchar NULL,
	meter_location varchar NULL,
	discom_able_to_work varchar NULL,
	CONSTRAINT ci_master_approved_data_pk PRIMARY KEY (consumer_no)
);


-- custom.ci_master_data definition

-- Drop table

-- DROP TABLE custom.ci_master_data;

CREATE TABLE custom.ci_master_data (
	state varchar(100) NULL,
	discom varchar(100) NOT NULL,
	div_code varchar(100) NULL,
	sdo_code varchar(100) NULL,
	acct_id varchar NOT NULL,
	kno varchar(100) NULL,
	mobile_no varchar(100) NULL,
	landline_no varchar(100) NULL,
	book_no varchar(100) NULL,
	scno varchar(100) NULL,
	"name" varchar(1000) NULL,
	address varchar(1000) NULL,
	supply_type varchar(100) NULL,
	"load" varchar(100) NULL,
	load_unit varchar(100) NULL,
	doc timestamp NULL,
	security_amt varchar(100) NULL,
	con_status varchar(100) NULL,
	serial_nbr varchar(100) NULL,
	multiply_factor varchar(100) NULL,
	meter_status varchar(100) NULL,
	last_bill_date timestamp NULL,
	close_reading varchar(100) NULL,
	mdi varchar(100) NULL,
	bill_basis varchar(100) NULL,
	bill_typ varchar(100) NULL,
	consumption_curr_mnth varchar(100) NULL,
	consumption_prev_mnth varchar(100) NULL,
	consumption_prev_to_prev_mnth varchar(100) NULL,
	arrear varchar(100) NULL,
	lpsc varchar(100) NULL,
	current_assessment varchar(100) NULL,
	current_cycle_lpsc varchar(100) NULL,
	total_outstanding varchar(100) NULL,
	due_date_rebate varchar(100) NULL,
	last_ok_reading varchar(100) NULL,
	last_ok_read_status timestamp NULL,
	meter_read_flty_cnt varchar(100) NULL,
	last_pay_amt varchar(100) NULL,
	last_pay_date timestamp NULL,
	substation varchar(100) NULL,
	gis_substation varchar(100) NULL,
	feeder varchar(100) NULL,
	gis_feeder varchar(100) NULL,
	dt varchar(100) NULL,
	gis_dt varchar(100) NULL,
	pole_no varchar(100) NULL,
	gis_pole_no varchar(100) NULL,
	opr_flg varchar(100) NULL,
	bill_after_date varchar(100) NULL,
	meter_read_remark varchar(100) NULL,
	installation_date timestamp NULL,
	sbm_bill_date timestamp NULL,
	sbm_machine_id varchar(100) NULL,
	bill_cyc_cd varchar(100) NULL,
	town varchar(100) NULL,
	service_cyc_cd varchar(100) NULL,
	ct_ratio varchar(100) NULL,
	pt_ratio varchar(100) NULL,
	ec varchar(100) NULL,
	fc varchar(100) NULL,
	rebates varchar(100) NULL,
	min_charges varchar(100) NULL,
	fuel_surcharge varchar(100) NULL,
	demand_amt varchar(100) NULL,
	ltmetering_charges varchar(100) NULL,
	cap_charges varchar(100) NULL,
	reg_surcharge varchar(100) NULL,
	reg_surcharge_2 varchar(100) NULL,
	electricity_duty varchar(100) NULL,
	tariff_adjustments varchar(100) NULL,
	prov_adjustments varchar(100) NULL,
	ca_abr varchar(100) NULL,
	inf_bill varchar(100) NULL,
	mr_source_cd varchar(100) NULL,
	healthy_consumer_flag varchar(100) NULL,
	meter_badge_no varchar(100) NULL,
	mtr_make varchar(100) NULL,
	connection_type varchar(100) NULL,
	looms_grtrthn_60 varchar(100) NULL,
	looms_lessthn_60 varchar(100) NULL,
	supply_voltage varchar(100) NULL,
	meter_voltage varchar(100) NULL,
	mtr_type_cd varchar(100) NULL,
	latitude varchar(100) NULL,
	longitude varchar(100) NULL,
	binder_id varchar(100) NULL,
	id int4 NULL,
	created_by varchar(100) NULL,
	modified_by varchar(100) NULL,
	created_date timestamp NULL,
	modified_date timestamp NULL,
	signal_strength varchar(50) NULL,
	network_operator varchar(50) NULL,
	city varchar(100) NULL,
	dtr_name varchar(100) NULL,
	is_active bool NULL DEFAULT true,
	file_name varchar NULL,
	CONSTRAINT ci_master_data_pk PRIMARY KEY (acct_id)
);
CREATE INDEX ci_mstr_mvvnl_discom1_idx ON custom.ci_master_data USING btree (discom);
CREATE INDEX ci_mstr_mvvnl_state1_idx ON custom.ci_master_data USING btree (state);


-- custom.ci_master_first_level_data definition

-- Drop table

-- DROP TABLE custom.ci_master_first_level_data;

CREATE TABLE custom.ci_master_first_level_data (
	consumer_no varchar NOT NULL,
	"name" varchar(150) NULL,
	mobile varchar(10) NULL,
	address varchar NULL,
	state varchar NULL,
	discom varchar NULL,
	city varchar NULL,
	"zone" varchar NULL,
	circle varchar NULL,
	division varchar NULL,
	sub_division varchar NULL,
	sub_station varchar NULL,
	feeder varchar NULL,
	dtr varchar NULL,
	pole varchar NULL,
	meters_on_pole int4 NULL,
	longitude_latitude varchar NULL,
	network_operator varchar NULL,
	signal_strength varchar NULL,
	connection_type varchar NULL,
	meter_no varchar NULL,
	meter_type varchar NULL,
	meter_make varchar NULL,
	meter_reading varchar NULL,
	meter_box_status varchar NULL,
	meter_seal_status varchar NULL,
	agency varchar NULL,
	verified_by varchar(100) NULL,
	verified_date timestamp NULL,
	remarks varchar NULL,
	created_by varchar(100) NULL,
	modified_by varchar(100) NULL,
	created_date timestamp NULL,
	modified_date timestamp NULL,
	discom_cable_required varchar NULL,
	survey_time timestamp NULL,
	photo_file_id int8 NULL,
	status varchar NULL,
	"hold" bool NOT NULL DEFAULT false,
	"type" varchar NULL,
	field_user_remarks varchar NULL,
	multiply_factor varchar NULL,
	alternate_mobile varchar NULL,
	meter_install_feasibility varchar NULL,
	meter_location varchar NULL,
	discom_able_to_work varchar NULL,
	CONSTRAINT ci_master_first_level_data_pk PRIMARY KEY (consumer_no),
	CONSTRAINT ci_master_first_level_data_un UNIQUE (consumer_no, status)
);


-- custom.ci_master_rejected_data definition

-- Drop table

-- DROP TABLE custom.ci_master_rejected_data;

CREATE TABLE custom.ci_master_rejected_data (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	consumer_no varchar NOT NULL,
	"name" varchar(150) NULL,
	mobile varchar(10) NULL,
	address varchar NULL,
	state varchar NULL,
	discom varchar NULL,
	city varchar NULL,
	"zone" varchar NULL,
	circle varchar NULL,
	division varchar NULL,
	sub_division varchar NULL,
	sub_station varchar NULL,
	feeder varchar NULL,
	dtr varchar NULL,
	pole varchar NULL,
	meters_on_pole int4 NULL,
	longitude_latitude varchar NULL,
	network_operator varchar NULL,
	signal_strength varchar NULL,
	connection_type varchar NULL,
	meter_no varchar NULL,
	meter_type varchar NULL,
	meter_make varchar NULL,
	meter_reading varchar NULL,
	meter_box_status varchar NULL,
	meter_seal_status varchar NULL,
	agency varchar NULL,
	verified_by varchar(100) NULL,
	verified_date timestamp NULL,
	remarks varchar NULL,
	created_by varchar(100) NULL,
	modified_by varchar(100) NULL,
	created_date timestamp NULL,
	modified_date timestamp NULL,
	discom_cable_required varchar NULL,
	survey_time timestamp NULL,
	photo_file_id int8 NULL,
	field_user_remarks varchar NULL,
	multiply_factor varchar NULL,
	alternate_mobile varchar NULL,
	meter_install_feasibility varchar NULL,
	meter_location varchar NULL,
	discom_able_to_work varchar NULL,
	CONSTRAINT ci_master_rejected_data_pk PRIMARY KEY (id)
);


-- custom.ci_meter_modem_mapping_history definition

-- Drop table

-- DROP TABLE custom.ci_meter_modem_mapping_history;

CREATE TABLE custom.ci_meter_modem_mapping_history (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	meter varchar NULL,
	modem varchar NULL,
	firmware varchar NULL,
	sim varchar NULL,
	ip varchar NULL,
	co_status varchar NULL,
	status varchar NULL,
	created_date timestamp NULL,
	last_modified_date timestamp NULL,
	CONSTRAINT ci_meter_modem_mapping_history_pk PRIMARY KEY (id)
);


-- custom.ci_meter_sim_mapping definition

-- Drop table

-- DROP TABLE custom.ci_meter_sim_mapping;

CREATE TABLE custom.ci_meter_sim_mapping (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	meter varchar NOT NULL,
	modem varchar NOT NULL,
	firmware varchar NULL,
	sim varchar NOT NULL,
	creation_date timestamp NULL,
	created_by varchar NULL,
	CONSTRAINT ci_meter_sim_mapping_pk PRIMARY KEY (id)
);


-- custom.ci_org_network_data definition

-- Drop table

-- DROP TABLE custom.ci_org_network_data;

CREATE TABLE custom.ci_org_network_data (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	state varchar NOT NULL,
	state_name varchar NOT NULL,
	discom varchar NOT NULL,
	discom_name varchar NOT NULL,
	"zone" varchar NOT NULL,
	zone_name varchar NOT NULL,
	city varchar NOT NULL,
	city_name varchar NOT NULL,
	circle varchar NOT NULL,
	circle_name varchar NOT NULL,
	division varchar NOT NULL,
	division_name varchar NOT NULL,
	sub_division varchar NOT NULL,
	sub_division_name varchar NOT NULL,
	sub_station varchar NULL,
	sub_station_name varchar NULL,
	allocation_level bpchar(1) NULL,
	CONSTRAINT ci_org_network_data_pk PRIMARY KEY (id),
	CONSTRAINT ci_org_network_data_un UNIQUE (state, discom, zone, city, circle, division, sub_division, sub_station)
);


-- custom.ci_sim_details definition

-- Drop table

-- DROP TABLE custom.ci_sim_details;

CREATE TABLE custom.ci_sim_details (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	sim varchar NOT NULL,
	ip varchar NOT NULL,
	activation_date timestamp NULL,
	deactivation_date timestamp NULL,
	created_date timestamp NULL,
	created_by varchar NULL,
	msisdn varchar NULL,
	imsi_value varchar NULL,
	co_status varchar NULL,
	CONSTRAINT ci_sim_details_pk PRIMARY KEY (id),
	CONSTRAINT ci_sim_details_un UNIQUE (sim)
);


-- custom.ci_supervisor_user_allotment definition

-- Drop table

-- DROP TABLE custom.ci_supervisor_user_allotment;

CREATE TABLE custom.ci_supervisor_user_allotment (
	state_id varchar(100) NULL,
	discom_id varchar(100) NULL,
	allocation_datatype varchar(100) NULL,
	user_id varchar(100) NOT NULL,
	allocation varchar(50) NULL,
	city varchar(100) NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	allotted_division varchar NULL,
	allocated_by varchar(150) NULL,
	allocated_date timestamp NULL,
	de_allocated_date timestamp NULL,
	active bool NOT NULL DEFAULT true,
	agency varchar NULL,
	agency_name varchar NULL,
	CONSTRAINT ci_supervisor_id_pk PRIMARY KEY (id),
	CONSTRAINT ci_supervisor_user_allotment_un UNIQUE (allocation_datatype, user_id, allotted_division, active)
);


-- custom.config_code_type definition

-- Drop table

-- DROP TABLE custom.config_code_type;

CREATE TABLE custom.config_code_type (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	code_type varchar NOT NULL,
	is_sub_type_req bool NOT NULL DEFAULT false,
	CONSTRAINT config_code_type_pk PRIMARY KEY (id),
	CONSTRAINT config_code_type_un UNIQUE (code_type)
);


-- custom.config_codes definition

-- Drop table

-- DROP TABLE custom.config_codes;

CREATE TABLE custom.config_codes (
	code_type text NULL,
	short_code text NULL,
	long_code text NULL,
	short_description varchar(500) NULL,
	long_description text NULL,
	code_group text NULL,
	numeric_value numeric(15, 2) NULL,
	remarks text NULL,
	valid_from timestamp NULL,
	valid_to timestamp NULL,
	is_active numeric(1) NULL,
	created_by varchar(150) NULL,
	created_date timestamp NULL DEFAULT now(),
	modified_by varchar(150) NULL,
	modified_date timestamp NULL,
	sub_type varchar NULL,
	code_id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT config_codes_chk12 CHECK ((is_active = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
	CONSTRAINT config_codes_pk PRIMARY KEY (code_id),
	CONSTRAINT config_codes_un UNIQUE (code_type, short_code, sub_type)
);
CREATE INDEX config_codes_indx1 ON custom.config_codes USING btree (code_type);
CREATE INDEX config_codes_indx12 ON custom.config_codes USING btree (code_type);
CREATE INDEX config_codes_indx2 ON custom.config_codes USING btree (short_code);
CREATE INDEX config_codes_indx22 ON custom.config_codes USING btree (short_code);
CREATE INDEX config_codes_indx3 ON custom.config_codes USING btree (long_code);
CREATE INDEX config_codes_indx31 ON custom.config_codes USING btree (long_code);
CREATE INDEX config_codes_indx4 ON custom.config_codes USING btree (short_description, long_description);
CREATE INDEX config_codes_indx41 ON custom.config_codes USING btree (short_description, long_description);


-- custom.defective_meter_replacement_totalcounts definition

-- Drop table

-- DROP TABLE custom.defective_meter_replacement_totalcounts;

CREATE TABLE custom.defective_meter_replacement_totalcounts (
	discom varchar(10) NULL,
	total_defect_meters_reported int4 NULL,
	total_meters_resolved_within_sla int4 NULL,
	total_meters_resolved_beyond_sla int4 NULL,
	total_meters_on_hold int4 NULL,
	total_meters_pending_for_replacement int4 NULL,
	excluding_hold_tickets int4 NULL,
	including_hold_tickets int4 NULL,
	"month" varchar(10) NULL,
	"year" varchar(10) NULL,
	month_year varchar(10) NULL,
	state varchar(20) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX defective_meter_replacement_totalcounts_discom_idx ON custom.defective_meter_replacement_totalcounts USING btree (discom);
CREATE INDEX defective_meter_replacement_totalcounts_state_idx ON custom.defective_meter_replacement_totalcounts USING btree (state);
CREATE INDEX dmrtc_month_idx ON custom.defective_meter_replacement_totalcounts USING btree (month);
CREATE INDEX dmrtc_month_year_idx ON custom.defective_meter_replacement_totalcounts USING btree (month_year);
CREATE INDEX dmrtc_year_idx ON custom.defective_meter_replacement_totalcounts USING btree (year);


-- custom.defectivemeterreplacement_detailtable definition

-- Drop table

-- DROP TABLE custom.defectivemeterreplacement_detailtable;

CREATE TABLE custom.defectivemeterreplacement_detailtable (
	id varchar(200) NOT NULL,
	discom varchar(300) NULL,
	city varchar(300) NULL,
	consumer_no varchar(500) NULL,
	consumer_name text NULL,
	requestorname text NULL,
	division varchar(300) NULL,
	sub_division varchar(300) NULL,
	sub_station varchar(300) NULL,
	address text NULL,
	mobile_no varchar(150) NULL,
	category text NULL,
	createdtime timestamp NULL,
	status varchar(200) NULL,
	resolvedtime timestamp NULL,
	resolutiontime varchar(500) NULL,
	totalworkingtime varchar(500) NULL,
	action_taken varchar(500) NULL,
	technician varchar(300) NULL,
	attended_by varchar(300) NULL,
	old_meter_no varchar(200) NULL,
	new_meter_number varchar(200) NULL,
	old_box_seal_number varchar(500) NULL,
	new_box_seal_number varchar(500) NULL,
	old_terminal_seal_no varchar(200) NULL,
	new_terminal_seal_no varchar(200) NULL,
	old_modem_seal_no varchar(200) NULL,
	new_modem_seal_no varchar(200) NULL,
	old_body_seal_no varchar(200) NULL,
	new_body_seal_no varchar(200) NULL,
	old_smart_meter_type varchar(200) NULL,
	new_smart_meter_type varchar(200) NULL,
	old_smart_meter_make varchar(200) NULL,
	new_smart_meter_make varchar(200) NULL,
	old_smart_meter_read_kwh varchar(200) NULL,
	new_smart_meter_read_kwh varchar(200) NULL,
	state varchar(20) NULL,
	statedetail_code varchar(25) NULL DEFAULT NULL::character varying,
	discomdetail_code varchar(25) NULL DEFAULT NULL::character varying,
	created_by varchar(25) NULL DEFAULT 'DataLoad'::character varying,
	created_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	modified_by varchar(25) NULL DEFAULT 'ADMIN'::character varying,
	modified_date timestamp NULL,
	is_active numeric(1) NOT NULL DEFAULT 1,
	"Requestor Name" varchar(60) NULL,
	"Created Time" varchar(19) NULL,
	"Resolved Time" varchar(19) NULL,
	"Resolution Time" varchar(9) NULL,
	"Total Working Time" varchar(9) NULL,
	"Old_Smart_meter_Read(KWH)" varchar(24) NULL,
	"New_Smart_Meter_Read(KWH)" varchar(17) NULL,
	CONSTRAINT defectivemeterreplacement_detailtable_pkey PRIMARY KEY (id)
);
CREATE INDEX dfmtrplc_discom_idx ON custom.defectivemeterreplacement_detailtable USING btree (discom);
CREATE INDEX dfmtrplc_state_idx ON custom.defectivemeterreplacement_detailtable USING btree (state);


-- custom.employee_roles definition

-- Drop table

-- DROP TABLE custom.employee_roles;

CREATE TABLE custom.employee_roles (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	role_name varchar NOT NULL,
	role_category varchar NOT NULL,
	role_desc varchar NULL,
	CONSTRAINT employee_roles_pk PRIMARY KEY (id),
	CONSTRAINT employee_roles_un UNIQUE (role_name, role_category)
);


-- custom.file_upload_table definition

-- Drop table

-- DROP TABLE custom.file_upload_table;

CREATE TABLE custom.file_upload_table (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	filepath varchar NULL,
	createdby varchar(150) NULL,
	createddate timestamp NULL DEFAULT now(),
	filename varchar NULL,
	CONSTRAINT file_upload_table_pk PRIMARY KEY (id)
);


-- custom.firmware_upgrade_8a definition

-- Drop table

-- DROP TABLE custom.firmware_upgrade_8a;

CREATE TABLE custom.firmware_upgrade_8a (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	firmwareupgrade_total int4 NULL,
	firmwareupgrade_3d int4 NULL,
	firmwareupgrade_total_95percntage_within_3_d numeric(5, 2) NULL,
	firmwareupgrade_5d int4 NULL,
	firmwareupgrade_total_99percntage_within_5_d numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(50) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX fmwre8a_month_idx ON custom.firmware_upgrade_8a USING btree (month);
CREATE INDEX fmwre8a_month_year_idx ON custom.firmware_upgrade_8a USING btree (month_year);
CREATE INDEX fmwre8a_year_idx ON custom.firmware_upgrade_8a USING btree (year);


-- custom.firmware_upgrade_8b definition

-- Drop table

-- DROP TABLE custom.firmware_upgrade_8b;

CREATE TABLE custom.firmware_upgrade_8b (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	firmwareupgrade_total int4 NULL,
	firmwareupgrade_10d int4 NULL,
	firmwareupgrade_total_95percntage_within_10_d numeric(5, 2) NULL,
	firmwareupgrade_15d int4 NULL,
	firmwareupgrade_total_99percntage_within_15_d numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(50) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);


-- custom.firmware_upgrade_8c definition

-- Drop table

-- DROP TABLE custom.firmware_upgrade_8c;

CREATE TABLE custom.firmware_upgrade_8c (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	firmwareupgrade_total int4 NULL,
	firmwareupgrade_30d int4 NULL,
	firmwareupgrade_total_95percntage_within_30_d numeric(5, 2) NULL,
	firmwareupgrade_90d int4 NULL,
	firmwareupgrade_total_99percntage_within_90_d numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(50) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);


-- custom.high_priority_actions definition

-- Drop table

-- DROP TABLE custom.high_priority_actions;

CREATE TABLE custom.high_priority_actions (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	getmeterreading_total int4 NULL,
	getmeterreading_1h int4 NULL,
	getmeterreading_total_90percntage_within_1_hr numeric(5, 2) NULL,
	getmeterreading_2h int4 NULL,
	getmeterreading_total_99percntage_within_2_hr numeric(5, 2) NULL,
	getmeterreading_6h int4 NULL,
	getmeterreading_total_99_99percntage_within_6_hr numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(50) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);


-- custom.implementation_audit_recom definition

-- Drop table

-- DROP TABLE custom.implementation_audit_recom;

CREATE TABLE custom.implementation_audit_recom (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	observations text NULL,
	observation_date date NULL,
	recommendation text NULL,
	status_remark text NULL,
	clousure_status text NULL,
	clousure_date date NULL,
	created_by varchar(150) NULL,
	created_date timestamp NULL DEFAULT now(),
	modified_by varchar(150) NULL,
	modified_date timestamp NULL,
	quarterly varchar NULL,
	"year" varchar(10) NULL,
	discomdetail_code varchar(255) NULL,
	statedetail_code varchar(255) NULL,
	CONSTRAINT imple_audit1_recom_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX imple_audit_recom_pkey ON custom.implementation_audit_recom USING btree (id);


-- custom.incidentmanagement_detailtable definition

-- Drop table

-- DROP TABLE custom.incidentmanagement_detailtable;

CREATE TABLE custom.incidentmanagement_detailtable (
	id varchar(50) NOT NULL,
	city varchar(30) NULL,
	division varchar(30) NULL,
	sub_division varchar(30) NULL,
	sub_station varchar(30) NULL,
	consumer_no varchar(20) NULL,
	createdtime timestamp NULL,
	category varchar(50) NULL,
	subject text NULL,
	description text NULL,
	impact varchar(20) NULL,
	priority varchar(20) NULL,
	status varchar(20) NULL,
	dueby varchar(50) NULL,
	technician varchar(30) NULL,
	updatedtime varchar(50) NULL,
	resolvedtime timestamp NULL,
	resolutiontime varchar(50) NULL,
	supportlevel varchar(20) NULL,
	closedtime varchar(20) NULL,
	closedtimeduration varchar(50) NULL,
	totalworkingtime varchar(50) NULL,
	discom varchar(50) NULL,
	state varchar(20) NULL,
	is_active numeric(1) NOT NULL DEFAULT 1,
	statedetail_code varchar(25) NULL DEFAULT NULL::character varying,
	discomdetail_code varchar(25) NULL DEFAULT NULL::character varying,
	created_by varchar(25) NULL DEFAULT 'DataLoad'::character varying,
	created_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	CONSTRAINT incidentmanagement_detailtable_pkey PRIMARY KEY (id)
);
CREATE INDEX incdntmng__discom_idx ON custom.incidentmanagement_detailtable USING btree (discom);
CREATE INDEX incdntmng_state_idx ON custom.incidentmanagement_detailtable USING btree (state);


-- custom.incidentmanagement_totalcounts definition

-- Drop table

-- DROP TABLE custom.incidentmanagement_totalcounts;

CREATE TABLE custom.incidentmanagement_totalcounts (
	discom varchar(10) NULL,
	total_tickets_booked int4 NULL,
	total_incident_ticket_resolved_within_sla int4 NULL,
	total_incident_ticket_resolved_beyond_sla int4 NULL,
	total_ticket_on_hold int4 NULL,
	total_ticket_pending_for_resolution int4 NULL,
	excluding_hold_tickets int4 NULL,
	including_hold_tickets int4 NULL,
	"month" varchar(10) NULL,
	"year" varchar(10) NULL,
	month_year varchar(10) NULL,
	state varchar(20) NULL,
	modified_date timestamp NULL,
	modified_by varchar(25) NULL,
	created_by varchar(25) NULL,
	created_date timestamp NULL DEFAULT now()
);
CREATE INDEX discom_month_year_state_idx ON custom.incidentmanagement_totalcounts USING btree (discom, month, year, month_year, state);


-- custom.low_priority_actions definition

-- Drop table

-- DROP TABLE custom.low_priority_actions;

CREATE TABLE custom.low_priority_actions (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	getconfigurationparameters_total int4 NULL,
	getconfigurationparameters_24h int4 NULL,
	getconfigurationparameters_total_95percntage_within_24_hr numeric(5, 2) NULL,
	getconfigurationparameters_72h int4 NULL,
	getconfigurationparameters_total_99percntage_within_72_hr numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(50) NULL,
	modified_date timestamp NULL,
	modified_by varchar(25) NULL,
	created_by varchar(25) NULL,
	created_date timestamp NULL DEFAULT now()
);
CREATE INDEX low_priority_actions_env_month_year_owner_idx ON custom.low_priority_actions USING btree (environment, owner, year, month, month_year);


-- custom.mdm_portal_consumer_data definition

-- Drop table

-- DROP TABLE custom.mdm_portal_consumer_data;

CREATE TABLE custom.mdm_portal_consumer_data (
	state varchar(20) NULL,
	discom varchar(20) NULL,
	criteria varchar(50) NULL,
	total_consumer_recs_updtd_mdms int4 NULL,
	total_consumer_recs_updtd_consumer_port_in_1hr int4 NULL,
	percnt_recs_updtd_consumer_port_in_1hr numeric(5, 2) NULL,
	total_consumer_recs_updtd_consumer_app_in_1hr int4 NULL,
	percnt_recs_updtd_consumer_app_in_1hr numeric(5, 2) NULL,
	total_consumer_recs_updtd_consumer_port_aftr_1hr int4 NULL,
	percnt_recs_updtd_consumer_port_aftr_1hr numeric(5, 2) NULL,
	total_consumer_recs_updtd_consumer_app_aftr_1hr int4 NULL,
	percnt_recs_updtd_consumer_app_aftr_1hr numeric(5, 2) NULL,
	total_consumer_recs_updtd_consumer_port_in_6hr int4 NULL,
	percnt_recs_updtd_consumer_port_in_6hr numeric(5, 2) NULL,
	total_consumer_recs_updtd_consumer_app_in_6hr int4 NULL,
	percnt_recs_updtd_consumer_app_in_6hr numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(20) NULL,
	month_year varchar(20) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX mdm_portal_stat_mnt_criteria_discom_year_idx ON custom.mdm_portal_consumer_data USING btree (state, discom, criteria, month, year, month_year);


-- custom.meter_to_billing definition

-- Drop table

-- DROP TABLE custom.meter_to_billing;

CREATE TABLE custom.meter_to_billing (
	state varchar(20) NULL,
	discom varchar(20) NULL,
	meters_installed_till_sla_mnth_advised_nxt_mnth int4 NULL,
	eligible_consumers_4bd_response int4 NULL,
	bd_sent_inthe_month_and_nxt_month int4 NULL,
	bd_exception int4 NULL,
	percentage numeric(5, 2) NULL,
	variance int4 NULL,
	from_month varchar(20) NULL,
	from_year varchar(20) NULL,
	month_year varchar(20) NULL,
	to_month varchar(20) NULL,
	to_year varchar(20) NULL,
	modified_date timestamp NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL
);
CREATE INDEX meter_to_billing_state_disc_month_idx ON custom.meter_to_billing USING btree (state, discom, to_month, to_year);


-- custom.offline_actions definition

-- Drop table

-- DROP TABLE custom.offline_actions;

CREATE TABLE custom.offline_actions (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	offlineaction_total int4 NULL,
	offlineaction_7s int4 NULL,
	offlineaction_total_80percntage_within_7_sec numeric(5, 2) NULL,
	offlineaction_30s int4 NULL,
	offlineaction_total_99percntage_within_30_sec numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(10) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX offline_actions_owner_stat_month_idx ON custom.offline_actions USING btree (owner, environment, month, year, month_year);


-- custom.performnce_level_4remote_connect_disconnect definition

-- Drop table

-- DROP TABLE custom.performnce_level_4remote_connect_disconnect;

CREATE TABLE custom.performnce_level_4remote_connect_disconnect (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	connectdisconnect_total int4 NULL,
	connectdisconnect_10m int4 NULL,
	connectdisconnect_total_90percntage_within_10_min numeric(5, 2) NULL,
	connectdisconnect_1h int4 NULL,
	connectdisconnect_total_99percntage_within_1_hr numeric(5, 2) NULL,
	connectdisconnect_2h int4 NULL,
	connectdisconnect_total_99_99percntage_within_2_hr numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(50) NULL,
	id serial4 NOT NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	CONSTRAINT performnce_level_4remote_connect_disconnect_pk PRIMARY KEY (id)
);
CREATE INDEX performnce_level_4remote_env_state_mnth_year_idx ON custom.performnce_level_4remote_connect_disconnect USING btree (environment, owner, year, month_year, month);


-- custom.problem_mngmnt_totalcount definition

-- Drop table

-- DROP TABLE custom.problem_mngmnt_totalcount;

CREATE TABLE custom.problem_mngmnt_totalcount (
	state varchar(100) NULL,
	discom varchar(50) NULL,
	total_ticket_b int8 NULL,
	under_sla_solved_c int8 NULL,
	beyond_sla_solved_d int8 NULL,
	under_sla_month_e int8 NULL,
	beyond_sla_month_f int8 NULL,
	onhold_g int8 NULL,
	pen_for_resolution_h int8 NULL,
	rep_vs_rca_excl_i numeric(5, 2) NULL,
	rep_vs_corre_excl_j numeric(5, 2) NULL,
	rep_vs_rca_incl_k numeric(5, 2) NULL,
	rep_vs_corre_incl_l numeric(5, 2) NULL,
	monthneed varchar(30) NULL,
	yearneed varchar(10) NULL,
	month_year varchar(100) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX pmtc_state_disc_year_mnth_idx ON custom.problem_mngmnt_totalcount USING btree (state, discom, month_year, yearneed, monthneed);


-- custom.problemmanagement_detailtable definition

-- Drop table

-- DROP TABLE custom.problemmanagement_detailtable;

CREATE TABLE custom.problemmanagement_detailtable (
	id varchar(20) NOT NULL,
	category varchar(30) NULL,
	priority varchar(20) NULL,
	impact varchar(20) NULL,
	createdtime timestamp NULL,
	reportedtime timestamp NULL,
	rootcause text NULL,
	technician text NULL,
	subject text NULL,
	description text NULL,
	knownerror varchar(20) NULL,
	corrective_actions text NULL,
	preventing_actions text NULL,
	validatesol_and_or_opt text NULL,
	status varchar(30) NULL,
	workaround text NULL,
	remarks varchar(50) NULL,
	resolvedtime timestamp NULL,
	closedtime timestamp NULL,
	no_of_tckts_created int4 NULL,
	trgt_rfo_submission_date timestamp NULL,
	actual_rfo_submission_date timestamp NULL,
	plndcorr_action_taken_date timestamp NULL,
	actualcorr_action_taken_date timestamp NULL,
	plndprev_action_taken_date timestamp NULL,
	actualpre_action_taken_date timestamp NULL,
	report_submitted_to_eesl varchar(30) NULL,
	approved_by_eesl varchar(30) NULL,
	report_submission_date timestamp NULL,
	discom varchar(20) NULL,
	state varchar(10) NULL,
	is_active numeric(1) NOT NULL DEFAULT 1,
	statedetail_code varchar(25) NULL,
	discomdetail_code varchar(25) NULL,
	created_by varchar(25) NULL,
	created_date timestamp NULL DEFAULT now(),
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	CONSTRAINT problemmanagement_detailtable_pkey PRIMARY KEY (id)
);
CREATE INDEX pmnt_discom_idx ON custom.problemmanagement_detailtable USING btree (discom);
CREATE INDEX pmnt_state_idx ON custom.problemmanagement_detailtable USING btree (state);


-- custom.realtime_alarms_alrt_notification definition

-- Drop table

-- DROP TABLE custom.realtime_alarms_alrt_notification;

CREATE TABLE custom.realtime_alarms_alrt_notification (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	occurrence_count varchar(10) NULL,
	no_of_req_process_within5mins int4 NULL,
	percent_req_process_within5mins numeric(5, 2) NULL,
	no_of_req_process_within24hrs int4 NULL,
	percent_req_process_within24hrs numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(10) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX ralartn_owner_mnth_year_idx ON custom.realtime_alarms_alrt_notification USING btree (owner, month, year, month_year);


-- custom.recurring_data_delivery_blck_load_profile definition

-- Drop table

-- DROP TABLE custom.recurring_data_delivery_blck_load_profile;

CREATE TABLE custom.recurring_data_delivery_blck_load_profile (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	data_profile varchar(100) NULL,
	no_of_req_processed int4 NULL,
	no_of_req_process_within8hrs int4 NULL,
	percent_req_process_within8hrs numeric(5, 2) NULL,
	no_of_req_process_within24hrs int4 NULL,
	percent_req_process_within24hrs numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(10) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX rddblp_owner_env_state_yr_idx ON custom.recurring_data_delivery_blck_load_profile USING btree (owner, month, year, month_year, environment);


-- custom.recurring_data_delivery_daily_load_profile definition

-- Drop table

-- DROP TABLE custom.recurring_data_delivery_daily_load_profile;

CREATE TABLE custom.recurring_data_delivery_daily_load_profile (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	data_profile varchar(100) NULL,
	no_of_req_processed int4 NULL,
	no_of_req_process_within8hrs int4 NULL,
	percent_req_process_within8hrs numeric(5, 2) NULL,
	no_of_req_process_within24hrs int4 NULL,
	percent_req_process_within24hrs numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(10) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX rdddaily_load_env_state_month_yr_idx ON custom.recurring_data_delivery_daily_load_profile USING btree (environment, owner, month, year, month_year);


-- custom.recurring_data_delivery_monthly_bill_profile definition

-- Drop table

-- DROP TABLE custom.recurring_data_delivery_monthly_bill_profile;

CREATE TABLE custom.recurring_data_delivery_monthly_bill_profile (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	data_profile varchar(100) NULL,
	no_of_req_processed int4 NULL,
	no_of_req_process_within8hrs int4 NULL,
	percent_req_process_within8hrs numeric(5, 2) NULL,
	no_of_req_process_within24hrs int4 NULL,
	percent_req_process_within24hrs numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(10) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX rddmonthlu_bill_owner_env_mnth_year_idx ON custom.recurring_data_delivery_monthly_bill_profile USING btree (owner, environment, month, year, month_year);


-- custom.release_mngmnt_totalcount definition

-- Drop table

-- DROP TABLE custom.release_mngmnt_totalcount;

CREATE TABLE custom.release_mngmnt_totalcount (
	state varchar(100) NULL,
	discom varchar(100) NULL,
	total_ticket int4 NULL,
	within_agreedtime int4 NULL,
	beyond_agreedtime int4 NULL,
	hold_ticket int4 NULL,
	pending int4 NULL,
	excl_hold_perc numeric(5, 2) NULL,
	incl_hold_perc numeric(5, 2) NULL,
	"month" varchar(30) NULL,
	"year" varchar(10) NULL,
	month_year varchar(100) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX release_mngmnt_totalcount_state_idx ON custom.release_mngmnt_totalcount USING btree (state, discom, year, month, month_year);


-- custom.releasemanagement_detailtable definition

-- Drop table

-- DROP TABLE custom.releasemanagement_detailtable;

CREATE TABLE custom.releasemanagement_detailtable (
	id varchar(20) NOT NULL,
	agency varchar(40) NULL,
	productname varchar(40) NULL,
	previousversion varchar(30) NULL,
	newversion varchar(30) NULL,
	schedulestartdate timestamp NULL,
	scheduleenddate timestamp NULL,
	closedtime timestamp NULL,
	subject varchar(100) NULL,
	functionalitytestedontestenvironment varchar(40) NULL,
	createdtime timestamp NULL,
	description text NULL,
	planningstarttime timestamp NULL,
	planningendtime timestamp NULL,
	rolloutstartdate timestamp NULL,
	rolloutenddate timestamp NULL,
	rolloutplan text NULL,
	backoutplan text NULL,
	risk varchar(30) NULL,
	stage varchar(40) NULL,
	discom varchar(20) NULL,
	state varchar(20) NULL,
	statedetail_code varchar(25) NULL DEFAULT NULL::character varying,
	discomdetail_code varchar(25) NULL DEFAULT NULL::character varying,
	created_by varchar(25) NULL DEFAULT 'DataLoad'::character varying,
	created_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	modified_by varchar(25) NULL DEFAULT 'ADMIN'::character varying,
	modified_date timestamp NULL,
	is_active numeric(1) NOT NULL DEFAULT 1,
	CONSTRAINT releasemanagement_detailtable_pkey PRIMARY KEY (id)
);
CREATE INDEX rlm_discom_idx ON custom.releasemanagement_detailtable USING btree (discom);
CREATE INDEX rlm_state_idx ON custom.releasemanagement_detailtable USING btree (state);


-- custom.remote_load_control definition

-- Drop table

-- DROP TABLE custom.remote_load_control;

CREATE TABLE custom.remote_load_control (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	no_of_records_processed int4 NULL,
	no_of_req_processed_within_5min int4 NULL,
	percent_req_processed_within_5min numeric(5, 2) NULL,
	no_of_req_processed_within_10mins int4 NULL,
	percent_req_processed_within_10mins numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(10) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX remote_load_control_env_stat_mnth_idx ON custom.remote_load_control USING btree (environment, owner, month, year, month_year);


-- custom.scheduled_task definition

-- Drop table

-- DROP TABLE custom.scheduled_task;

CREATE TABLE custom.scheduled_task (
	environment varchar(10) NULL,
	"owner" varchar(10) NULL,
	setconfigurationparameters_total int4 NULL,
	setconfigurationparameters_1h int4 NULL,
	setconfigurationparameters_total_90percntage_within_1_hr numeric(5, 2) NULL,
	setconfigurationparameters_24h int4 NULL,
	setconfigurationparameters_total_99_9percntage_within_24_hr numeric(5, 2) NULL,
	"month" varchar(20) NULL,
	"year" varchar(10) NULL,
	month_year varchar(50) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX scheduled_task_owner_mnth_year_idx ON custom.scheduled_task USING btree (owner, environment, month, year, month_year);


-- custom.sla_10_meterkey_info definition

-- Drop table

-- DROP TABLE custom.sla_10_meterkey_info;

CREATE TABLE custom.sla_10_meterkey_info (
	state varchar(10) NULL,
	discom varchar(10) NULL,
	days int4 NULL,
	total int4 NULL,
	hes_before_installation int4 NULL,
	breach int4 NULL,
	percnt_key_inf_avai_be4_installation int4 NULL,
	"month" varchar(10) NULL,
	"year" varchar(50) NULL,
	month_year varchar(50) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX sla_10_meterkey_state_mnth_yr_idx ON custom.sla_10_meterkey_info USING btree (state, discom, month, year, month_year);


-- custom.sla_10_meterkey_infor_availability definition

-- Drop table

-- DROP TABLE custom.sla_10_meterkey_infor_availability;

CREATE TABLE custom.sla_10_meterkey_infor_availability (
	discom varchar(50) NULL,
	no_of_meters_installed_days int4 NULL,
	hes_available_before_installed_hes_yes int4 NULL,
	hes_not_available_before_installed_hes_no int4 NULL,
	sla_breached int4 NULL,
	month_year varchar(10) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL
);
CREATE INDEX sla_10_meterkey_infor_availability_discom_idx ON custom.sla_10_meterkey_infor_availability USING btree (discom, month_year);


-- custom.sla_8_sim_info definition

-- Drop table

-- DROP TABLE custom.sla_8_sim_info;

CREATE TABLE custom.sla_8_sim_info (
	state varchar(10) NULL,
	discom varchar(10) NULL,
	days int4 NULL,
	total int4 NULL,
	hes_before_installation int4 NULL,
	breach int4 NULL,
	percnt_sim_inf_avai_be4_installation int4 NULL,
	"month" varchar(10) NULL,
	"year" varchar(50) NULL,
	month_year varchar(50) NULL
);
CREATE INDEX sla8_discom_idx ON custom.sla_8_sim_info USING btree (discom);
CREATE INDEX sla8_month_idx ON custom.sla_8_sim_info USING btree (month);
CREATE INDEX sla8_month_year_idx ON custom.sla_8_sim_info USING btree (month_year);
CREATE INDEX sla8_state_idx ON custom.sla_8_sim_info USING btree (state);
CREATE INDEX sla8_year_idx ON custom.sla_8_sim_info USING btree (year);


-- custom.sla_hes_dashboard definition

-- Drop table

-- DROP TABLE custom.sla_hes_dashboard;

CREATE TABLE custom.sla_hes_dashboard (
	environment varchar(10) NULL,
	"owner" varchar(100) NULL,
	"timestamp" timestamp NULL,
	"month" varchar(20) NULL,
	sla varchar(100) NULL,
	value int4 NULL
);
CREATE INDEX shd_env_idx ON custom.sla_hes_dashboard USING btree (environment);
CREATE INDEX shd_month_idx ON custom.sla_hes_dashboard USING btree (month);
CREATE INDEX shd_owner_idx ON custom.sla_hes_dashboard USING btree (owner);
CREATE INDEX shd_sla_idx ON custom.sla_hes_dashboard USING btree (sla);
CREATE INDEX sla_hes_dashboard_environment_idx ON custom.sla_hes_dashboard USING btree (environment, owner, month);


-- custom.sla_reports definition

-- Drop table

-- DROP TABLE custom.sla_reports;

CREATE TABLE custom.sla_reports (
	"module" varchar(100) NOT NULL,
	report_name text NOT NULL,
	rfp_no_type varchar(20) NULL,
	"path" varchar(500) NULL,
	timeframe varchar(100) NULL,
	created_by varchar(25) NULL,
	created_date timestamp NULL DEFAULT now(),
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	is_active bool NULL,
	report_type varchar NULL,
	CONSTRAINT sla_reports1_pk PRIMARY KEY (module, report_name),
	CONSTRAINT sla_reports_type1_check CHECK ((((report_type)::text = 'FILE'::text) OR ((report_type)::text = 'JASPER'::text)))
);
CREATE UNIQUE INDEX sla_reports_pk ON custom.sla_reports USING btree (module, report_name);


-- custom.state_details definition

-- Drop table

-- DROP TABLE custom.state_details;

CREATE TABLE custom.state_details (
	state_details_id int4 NOT NULL,
	address varchar(500) NULL,
	room_floor varchar(100) NULL,
	block_building varchar(100) NULL,
	street_po_box varchar(100) NULL,
	city varchar(150) NULL,
	state varchar(150) NULL,
	country varchar(150) NULL,
	zip_code varchar(15) NULL,
	website varchar(100) NULL,
	email varchar(100) NULL,
	phone1 varchar(15) NULL,
	phone2 varchar(15) NULL,
	mobile varchar(15) NULL,
	fax varchar(15) NULL,
	default_currency varchar(10) NULL,
	default_date_format varchar(20) NULL,
	default_time_format varchar(10) NULL,
	currency_name varchar(150) NULL,
	currency_id numeric(38) NULL,
	postbox varchar(300) NULL,
	database_name varchar(150) NULL,
	state_code varchar(25) NULL,
	state_name varchar(150) NULL,
	created_by varchar(25) NULL,
	created_date timestamp NOT NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	group_comany_name varchar(150) NULL,
	group_comapny_code varchar(25) NULL,
	is_active int4 NULL,
	CONSTRAINT state_details1_pkey PRIMARY KEY (state_details_id),
	CONSTRAINT state_details1_state_code_key UNIQUE (state_code),
	CONSTRAINT state_details1_state_name_key UNIQUE (state_name)
);
CREATE UNIQUE INDEX state_code ON custom.state_details USING btree (state_code);
CREATE UNIQUE INDEX state_details_pkey ON custom.state_details USING btree (state_details_id);
CREATE UNIQUE INDEX state_details_state_code_key ON custom.state_details USING btree (state_code);
CREATE UNIQUE INDEX state_details_state_name_key ON custom.state_details USING btree (state_name);
CREATE UNIQUE INDEX state_name ON custom.state_details USING btree (state_name);


-- custom.system_access_tbl definition

-- Drop table

-- DROP TABLE custom.system_access_tbl;

CREATE TABLE custom.system_access_tbl (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	privilege_name varchar NOT NULL,
	privilege_type varchar NOT NULL,
	isactive bool NULL DEFAULT true,
	"desc" varchar NULL,
	"module" varchar NOT NULL,
	CONSTRAINT system_access_tbl_pk PRIMARY KEY (id),
	CONSTRAINT system_access_tbl_un UNIQUE (privilege_name, privilege_type)
);


-- custom.system_role_tbl definition

-- Drop table

-- DROP TABLE custom.system_role_tbl;

CREATE TABLE custom.system_role_tbl (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	role_name varchar NOT NULL,
	role_desc varchar NOT NULL,
	role_type varchar NULL,
	CONSTRAINT system_role__tbl_pk PRIMARY KEY (id),
	CONSTRAINT system_role__tbl_un UNIQUE (role_name)
);


-- custom."user" definition

-- Drop table

-- DROP TABLE custom."user";

CREATE TABLE custom."user" (
	id int4 NOT NULL DEFAULT nextval('custom.user_users_id_seq'::regclass),
	created_by varchar(150) NULL,
	created_date timestamp NULL DEFAULT now(),
	email varchar(50) NULL,
	employee_id varchar(50) NULL,
	first_name varchar(150) NULL,
	last_name varchar(150) NULL,
	middle_name varchar(150) NULL,
	modified_by varchar(155) NULL,
	modified_date timestamp NULL,
	"password" varchar(100) NULL,
	primary_mobile_number varchar(15) NULL,
	user_group varchar(25) NULL,
	user_name varchar(150) NULL,
	org_name varchar NULL,
	active bool NULL DEFAULT true,
	web_access bool NOT NULL DEFAULT true,
	mobile_access bool NOT NULL DEFAULT false,
	CONSTRAINT uk_ob8kqyqqgmefl0aco34akdtpe1 UNIQUE (email),
	CONSTRAINT user_phone_un UNIQUE (primary_mobile_number),
	CONSTRAINT user_pkey1 PRIMARY KEY (id),
	CONSTRAINT user_user_name_un UNIQUE (user_name)
);
CREATE UNIQUE INDEX uk_ob8kqyqqgmefl0aco34akdtpe ON custom."user" USING btree (email);
CREATE UNIQUE INDEX user_pkey ON custom."user" USING btree (id);


-- custom.user_registration_master_table definition

-- Drop table

-- DROP TABLE custom.user_registration_master_table;

CREATE TABLE custom.user_registration_master_table (
	reference_id varchar(100) NOT NULL DEFAULT lpad(nextval('custom.uam_reg_form_id_seq'::regclass)::character varying::text, 7, '000'::text),
	salutation varchar(50) NULL,
	first_name varchar(100) NULL,
	last_name varchar(100) NULL,
	employee_id varchar(50) NULL,
	designation varchar(100) NULL,
	department varchar(100) NULL,
	mobile_no varchar(100) NULL,
	email varchar(50) NULL,
	discom_name varchar(10) NULL,
	city varchar(100) NULL,
	"zone" varchar(100) NULL,
	circle varchar(100) NULL,
	division varchar(100) NULL,
	subdivision varchar(100) NULL,
	lan_mac_address varchar(100) NULL,
	vpn_access_from_india varchar(100) NULL,
	country_name_outside_india varchar(100) NULL,
	approver_details_id int4 NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	user_type varchar(100) NULL,
	existing_vpn_username varchar(100) NULL,
	request_for varchar(100) NULL,
	state varchar NULL,
	status varchar NOT NULL,
	uuid uuid NOT NULL,
	user_remarks varchar NULL,
	spoc_remarks varchar NULL,
	discom varchar NULL,
	wifi_mac_address varchar(100) NULL,
	CONSTRAINT user_registration_master_ref_id_pk PRIMARY KEY (reference_id),
	CONSTRAINT user_registration_master_table_un UNIQUE (uuid)
);
CREATE INDEX user_reg_details_ref_id_cirl_division_email_idx ON custom.user_registration_master_table USING btree (reference_id, division, city, email, mobile_no, approver_details_id, subdivision, department);


-- custom.users_attendance definition

-- Drop table

-- DROP TABLE custom.users_attendance;

CREATE TABLE custom.users_attendance (
	attendance_id int8 NOT NULL,
	active int4 NULL,
	created_by varchar(255) NULL,
	created_date timestamp NULL DEFAULT now(),
	"date" timestamp NULL,
	discomdetail_code varchar(255) NULL,
	eligible_shift_days int8 NULL,
	employee_id varchar(255) NULL,
	modified_by varchar(255) NULL,
	modified_date timestamp NULL,
	present_shift_days int8 NULL,
	statedetail_code varchar(255) NULL,
	status_id int8 NULL,
	total_days int8 NULL,
	role_id int4 NULL,
	state_id int4 NULL,
	discom_id int4 NULL,
	CONSTRAINT attendance_pkey12 PRIMARY KEY (attendance_id)
);
CREATE INDEX attendance_discom_id_idx ON custom.users_attendance USING btree (discom_id);
CREATE INDEX attendance_state_id_idx ON custom.users_attendance USING btree (state_id);


-- custom.users_creation definition

-- Drop table

-- DROP TABLE custom.users_creation;

CREATE TABLE custom.users_creation (
	user_id int8 NOT NULL,
	active int4 NULL,
	created_by varchar(255) NULL,
	created_date timestamp NULL DEFAULT now(),
	discomdetail_code varchar(255) NULL,
	doj timestamp NULL,
	dor timestamp NULL,
	employee_name varchar(255) NULL,
	employee_number varchar(255) NULL,
	experience varchar(255) NULL,
	modified_by varchar(255) NULL,
	modified_date timestamp NULL,
	role_id int8 NULL,
	state_id int8 NULL,
	statedetail_code varchar(255) NULL,
	user_name varchar(255) NULL,
	CONSTRAINT users_creatio1n_pkey PRIMARY KEY (user_id)
);


-- custom.aims_city_warehouse_mapping definition

-- Drop table

-- DROP TABLE custom.aims_city_warehouse_mapping;

CREATE TABLE custom.aims_city_warehouse_mapping (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	discom varchar(100) NULL,
	city varchar(100) NULL,
	state varchar(100) NOT NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(150) NULL,
	modified_by varchar(150) NULL,
	modified_date timestamp NULL,
	deactivated_date timestamp NULL,
	warehouse_id int8 NULL,
	CONSTRAINT aims_city_warhouse_mapping_pk PRIMARY KEY (id),
	CONSTRAINT aims_city_warehouse_mapping_sl_no_fk FOREIGN KEY (warehouse_id) REFERENCES custom.aims_warehouse(id)
);


-- custom.aims_group_transaction_mechanism_mapping definition

-- Drop table

-- DROP TABLE custom.aims_group_transaction_mechanism_mapping;

CREATE TABLE custom.aims_group_transaction_mechanism_mapping (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	transaction_mechanism varchar(50) NULL,
	group_id int8 NULL,
	CONSTRAINT aims_group_transaction_mechanism_mapping_fk FOREIGN KEY (group_id) REFERENCES custom.aims_item_group(id)
);


-- custom.aims_import_ccb_data_details definition

-- Drop table

-- DROP TABLE custom.aims_import_ccb_data_details;

CREATE TABLE custom.aims_import_ccb_data_details (
	sr_no varchar(50) NULL,
	box_number varchar(50) NULL,
	internal_sr_no varchar(50) NULL,
	latest_sr_no varchar(50) NULL,
	remarks varchar(4000) NULL,
	import_ccb_data_id varchar(50) NOT NULL,
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_import_ccb_data_details_pk PRIMARY KEY (id),
	CONSTRAINT aims_import_ccb_data_details_fk FOREIGN KEY (import_ccb_data_id) REFERENCES custom.aims_import_ccb_data(reference_id)
);
CREATE INDEX aims_import_ccb_data_details_import_ccb_data_id_idx ON custom.aims_import_ccb_data_details USING btree (import_ccb_data_id);


-- custom.aims_import_hes_data_details definition

-- Drop table

-- DROP TABLE custom.aims_import_hes_data_details;

CREATE TABLE custom.aims_import_hes_data_details (
	sr_no varchar(50) NULL,
	box_number varchar(50) NULL,
	internal_sr_no varchar(50) NULL,
	latest_sr_no varchar(50) NULL,
	remarks varchar(4000) NULL,
	import_hes_data_id varchar(50) NOT NULL,
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_import_hes_data_details_fk FOREIGN KEY (import_hes_data_id) REFERENCES custom.aims_import_hes_data(reference_id)
);
CREATE INDEX aims_import_hes_data_id_idx ON custom.aims_import_hes_data_details USING btree (import_hes_data_id);


-- custom.aims_import_mi_data_details definition

-- Drop table

-- DROP TABLE custom.aims_import_mi_data_details;

CREATE TABLE custom.aims_import_mi_data_details (
	sr_no varchar(50) NULL,
	box_number varchar(50) NULL,
	internal_sr_no varchar(50) NULL,
	latest_sr_no varchar(50) NULL,
	remarks varchar(4000) NULL,
	import_mi_data_id varchar(50) NOT NULL,
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_import_mi_data_details_fk FOREIGN KEY (import_mi_data_id) REFERENCES custom.aims_import_mi_data(reference_id)
);
CREATE INDEX aims_import_mi_data_details_import_mi_data_id_idx ON custom.aims_import_mi_data_details USING btree (import_mi_data_id);


-- custom.aims_indent_approver_list_page definition

-- Drop table

-- DROP TABLE custom.aims_indent_approver_list_page;

CREATE TABLE custom.aims_indent_approver_list_page (
	warehouse varchar(100) NULL,
	indent_no int8 NULL,
	indent_date timestamp NULL,
	requested_by varchar(100) NULL,
	requested_for varchar(100) NULL,
	auth_person varchar(50) NULL,
	item_group varchar(20) NOT NULL,
	item_category varchar(20) NOT NULL,
	item_model_name varchar(20) NOT NULL,
	supplier varchar(20) NOT NULL,
	req_quantity numeric NULL,
	aaprox_quantity numeric NULL,
	dispatched_quantity numeric NULL,
	status varchar NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"action" varchar NULL,
	qty varchar NULL,
	approver_qty varchar NULL,
	CONSTRAINT aims_indent_approver_list_page_pk PRIMARY KEY (id),
	CONSTRAINT aims_indent_approver_list_page_fk FOREIGN KEY (indent_no) REFERENCES custom.aims_indent_approver_page(id)
);


-- custom.aims_indent_request_list_page definition

-- Drop table

-- DROP TABLE custom.aims_indent_request_list_page;

CREATE TABLE custom.aims_indent_request_list_page (
	indent_no int8 NULL,
	item_group varchar(100) NOT NULL,
	item_category varchar(100) NOT NULL,
	item_model_name varchar(100) NOT NULL,
	supplier varchar(100) NOT NULL,
	req_quantity int8 NULL,
	approv_quantity int8 NOT NULL,
	dispatched_quantity int8 NULL,
	status varchar(20) NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	warehouse varchar NULL,
	indent_date timestamp NULL,
	requested_by varchar NULL,
	requested_for varchar NULL,
	auth_person varchar NULL,
	CONSTRAINT aims_indent_request_list_page_pk PRIMARY KEY (id),
	CONSTRAINT aims_indent_request_list_page_fk FOREIGN KEY (indent_no) REFERENCES custom.aims_indent_request(id)
);


-- custom.aims_inward_supplier_details definition

-- Drop table

-- DROP TABLE custom.aims_inward_supplier_details;

CREATE TABLE custom.aims_inward_supplier_details (
	sr_no varchar(50) NULL,
	box_number varchar(50) NULL,
	internal_sr_no varchar(50) NULL,
	latest_sr_no varchar(50) NULL,
	remarks varchar(4000) NULL,
	inward_supplier_id varchar(50) NOT NULL,
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_inward_supplier_details_pk PRIMARY KEY (id),
	CONSTRAINT aims_inward_import_details_fk FOREIGN KEY (inward_supplier_id) REFERENCES custom.aims_inward_from_supplier(reference_id)
);
CREATE INDEX aims_inward_import_details_inward_import_id_idx ON custom.aims_inward_supplier_details USING btree (inward_supplier_id);


-- custom.aims_old_meter_inward_details definition

-- Drop table

-- DROP TABLE custom.aims_old_meter_inward_details;

CREATE TABLE custom.aims_old_meter_inward_details (
	sr_no varchar(50) NULL,
	box_number varchar(50) NULL,
	internal_sr_no varchar(50) NULL,
	latest_sr_no varchar(50) NULL,
	remarks varchar(4000) NULL,
	old_meter_inward_id varchar(50) NOT NULL,
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_old_meter_inward_details_fk FOREIGN KEY (old_meter_inward_id) REFERENCES custom.aims_old_meter_inward(reference_id)
);
CREATE INDEX aims_old_meter_inward_id_idx ON custom.aims_old_meter_inward_details USING btree (old_meter_inward_id);


-- custom.aims_old_meter_outward_details definition

-- Drop table

-- DROP TABLE custom.aims_old_meter_outward_details;

CREATE TABLE custom.aims_old_meter_outward_details (
	sr_no varchar(50) NULL,
	box_number varchar(50) NULL,
	internal_sr_no varchar(50) NULL,
	latest_sr_no varchar(50) NULL,
	remarks varchar(4000) NULL,
	old_meter_outward_id varchar(50) NOT NULL,
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_old_meter_outward_details_pk PRIMARY KEY (id),
	CONSTRAINT aims_old_meter_outward_details_fk FOREIGN KEY (old_meter_outward_id) REFERENCES custom.aims_old_meter_outward(reference_id)
);
CREATE INDEX aims_old_meter_outward_id_idx ON custom.aims_old_meter_outward_details USING btree (old_meter_outward_id);


-- custom.aims_outward_subcontractor_details definition

-- Drop table

-- DROP TABLE custom.aims_outward_subcontractor_details;

CREATE TABLE custom.aims_outward_subcontractor_details (
	sr_no varchar(50) NULL,
	box_number varchar(50) NULL,
	internal_sr_no varchar(50) NULL,
	latest_sr_no varchar(50) NULL,
	remarks varchar(4000) NULL,
	outward_subcontrct_id varchar(50) NOT NULL,
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_outward_subcontractor_details_pk PRIMARY KEY (id),
	CONSTRAINT aims_outward_import_details_fk FOREIGN KEY (outward_subcontrct_id) REFERENCES custom.aims_outward_to_subcontractor(reference_id)
);
CREATE INDEX aims_outward_import_id_idx ON custom.aims_outward_subcontractor_details USING btree (outward_subcontrct_id);


-- custom.aims_return_subcntrct_details definition

-- Drop table

-- DROP TABLE custom.aims_return_subcntrct_details;

CREATE TABLE custom.aims_return_subcntrct_details (
	sr_no varchar(50) NULL,
	box_number varchar(50) NULL,
	internal_sr_no varchar(50) NULL,
	latest_sr_no varchar(50) NULL,
	remarks varchar(4000) NULL,
	return_subcontractor_id varchar(50) NOT NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_return_subcntrct_details_pk PRIMARY KEY (id),
	CONSTRAINT aims_return_subcntrct_details_fk FOREIGN KEY (return_subcontractor_id) REFERENCES custom.aims_return_from_subcontractor(referene_id)
);
CREATE INDEX aims_return_subcontractor_id_idx ON custom.aims_return_subcntrct_details USING btree (return_subcontractor_id);


-- custom.aims_return_to_supplier_details definition

-- Drop table

-- DROP TABLE custom.aims_return_to_supplier_details;

CREATE TABLE custom.aims_return_to_supplier_details (
	sr_no varchar(50) NULL,
	box_number varchar(50) NULL,
	internal_sr_no varchar(50) NULL,
	latest_sr_no varchar(50) NULL,
	remarks varchar(4000) NULL,
	return_to_supplier_id varchar(50) NOT NULL,
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_return_to_supplier_details_pk PRIMARY KEY (id),
	CONSTRAINT aims_return_to_supplier_details_fk FOREIGN KEY (return_to_supplier_id) REFERENCES custom.aims_return_to_supplier(reference_id)
);
CREATE INDEX aims_return_to_supplier_id_idx ON custom.aims_return_to_supplier_details USING btree (return_to_supplier_id);


-- custom.aims_sim_act_deact_details definition

-- Drop table

-- DROP TABLE custom.aims_sim_act_deact_details;

CREATE TABLE custom.aims_sim_act_deact_details (
	sr_no varchar(50) NULL,
	box_number varchar(50) NULL,
	internal_sr_no varchar(50) NULL,
	latest_sr_no varchar(50) NULL,
	remarks varchar(4000) NULL,
	sim_act_deact_id varchar(50) NOT NULL,
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_sim_act_deact_details_pk PRIMARY KEY (id),
	CONSTRAINT aims_sim_act_deact_details_fk FOREIGN KEY (sim_act_deact_id) REFERENCES custom.aims_sim_activation_deactivation(reference_id)
);


-- custom.aims_supplier_group_name_mapping definition

-- Drop table

-- DROP TABLE custom.aims_supplier_group_name_mapping;

CREATE TABLE custom.aims_supplier_group_name_mapping (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	group_name varchar NULL,
	supplier_id int8 NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar NULL DEFAULT 'ADMIN'::character varying,
	modified_by varchar NULL,
	modified_date timestamp NULL,
	CONSTRAINT aims_supplier_group_name_mapping_pk PRIMARY KEY (id),
	CONSTRAINT aims_supplier_group_name_mapping_fk FOREIGN KEY (supplier_id) REFERENCES custom.aims_supplier(id)
);


-- custom.aims_user_error_msg definition

-- Drop table

-- DROP TABLE custom.aims_user_error_msg;

CREATE TABLE custom.aims_user_error_msg (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	error_code varchar(200) NULL,
	error_description varchar(200) NULL,
	item_group_id int8 NULL,
	created_by varchar NULL DEFAULT 'ADMIN'::character varying,
	created_date timestamp NULL DEFAULT now(),
	modified_by varchar NULL,
	modified_date timestamp NULL,
	CONSTRAINT aims_user_error_msg_pk PRIMARY KEY (id),
	CONSTRAINT aims_user_error_msg_fk_1 FOREIGN KEY (item_group_id) REFERENCES custom.aims_item_group(id)
);


-- custom.aims_wh_wh_inward_details definition

-- Drop table

-- DROP TABLE custom.aims_wh_wh_inward_details;

CREATE TABLE custom.aims_wh_wh_inward_details (
	sr_no varchar(50) NULL,
	box_number varchar(50) NULL,
	internal_sr_no varchar(50) NULL,
	latest_sr_no varchar(50) NULL,
	remarks varchar(4000) NULL,
	wh_wh_inward_id varchar(50) NOT NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_wh_wh_inward_details_pk PRIMARY KEY (id),
	CONSTRAINT aims_wh_wh_inward_details_fk FOREIGN KEY (wh_wh_inward_id) REFERENCES custom.aims_wh_wh_inward(reference_id)
);
CREATE INDEX aims_wh_wh_inward_id_idx ON custom.aims_wh_wh_inward_details USING btree (wh_wh_inward_id);


-- custom.aims_wh_wh_outward_details definition

-- Drop table

-- DROP TABLE custom.aims_wh_wh_outward_details;

CREATE TABLE custom.aims_wh_wh_outward_details (
	sr_no varchar(50) NULL,
	box_number varchar(50) NULL,
	internal_sr_no varchar(50) NULL,
	latest_sr_no varchar(50) NULL,
	remarks varchar(4000) NULL,
	wh_wh_outward_id varchar(50) NOT NULL,
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT aims_wh_wh_outward_details_pk PRIMARY KEY (id),
	CONSTRAINT aims_wh_wh_outward_details_fk FOREIGN KEY (wh_wh_outward_id) REFERENCES custom.aims_wh_wh_outward(reference_id)
);
CREATE INDEX aims_wh_wh_outward_id_idx ON custom.aims_wh_wh_outward_details USING btree (wh_wh_outward_id);


-- custom.approval_steps definition

-- Drop table

-- DROP TABLE custom.approval_steps;

CREATE TABLE custom.approval_steps (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	approval_process varchar NOT NULL,
	step_no int4 NOT NULL,
	record_stage varchar NOT NULL,
	step_on_reject int4 NULL,
	step_on_approved int4 NULL,
	approved_status varchar NOT NULL,
	reject_status varchar NOT NULL,
	"desc" varchar NULL,
	approver_identity varchar NULL,
	CONSTRAINT approval_steps_pk PRIMARY KEY (id),
	CONSTRAINT approval_steps_un UNIQUE (approval_process, step_no),
	CONSTRAINT approval_steps_fk FOREIGN KEY (approval_process) REFERENCES custom.approval_process(process_name) ON DELETE CASCADE ON UPDATE CASCADE
);


-- custom.approver_details definition

-- Drop table

-- DROP TABLE custom.approver_details;

CREATE TABLE custom.approver_details (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	user_name varchar(150) NOT NULL,
	approver_identity varchar NOT NULL,
	approval_for varchar NULL,
	approver_filter varchar NULL,
	user_type varchar NULL,
	CONSTRAINT approver_details_pk PRIMARY KEY (id),
	CONSTRAINT approver_details_un UNIQUE (user_name, approver_identity, approval_for, approver_filter, user_type),
	CONSTRAINT approver_details_fk FOREIGN KEY (user_name) REFERENCES custom."user"(user_name)
);


-- custom.batch_job_execution definition

-- Drop table

-- DROP TABLE custom.batch_job_execution;

CREATE TABLE custom.batch_job_execution (
	job_execution_id int8 NOT NULL,
	"version" int8 NULL,
	job_instance_id int8 NOT NULL,
	create_time timestamp NOT NULL,
	start_time timestamp NULL,
	end_time timestamp NULL,
	status varchar(10) NULL,
	exit_code varchar(2500) NULL,
	exit_message varchar(2500) NULL,
	last_updated timestamp NULL,
	job_configuration_location varchar(2500) NULL DEFAULT NULL::character varying,
	CONSTRAINT batch_job_execution_pkey PRIMARY KEY (job_execution_id),
	CONSTRAINT job_inst_exec_fk FOREIGN KEY (job_instance_id) REFERENCES custom.batch_job_instance(job_instance_id)
);


-- custom.batch_job_execution_context definition

-- Drop table

-- DROP TABLE custom.batch_job_execution_context;

CREATE TABLE custom.batch_job_execution_context (
	job_execution_id int8 NOT NULL,
	short_context varchar(2500) NOT NULL,
	serialized_context text NULL,
	CONSTRAINT batch_job_execution_context_pkey PRIMARY KEY (job_execution_id),
	CONSTRAINT job_exec_ctx_fk FOREIGN KEY (job_execution_id) REFERENCES custom.batch_job_execution(job_execution_id)
);


-- custom.batch_job_execution_params definition

-- Drop table

-- DROP TABLE custom.batch_job_execution_params;

CREATE TABLE custom.batch_job_execution_params (
	job_execution_id int8 NOT NULL,
	type_cd varchar(6) NOT NULL,
	key_name varchar(100) NOT NULL,
	string_val varchar(250) NULL,
	date_val timestamp NULL,
	long_val int8 NULL,
	double_val float8 NULL,
	identifying bpchar(1) NOT NULL,
	CONSTRAINT job_exec_params_fk FOREIGN KEY (job_execution_id) REFERENCES custom.batch_job_execution(job_execution_id)
);


-- custom.batch_step_execution definition

-- Drop table

-- DROP TABLE custom.batch_step_execution;

CREATE TABLE custom.batch_step_execution (
	step_execution_id int8 NOT NULL,
	"version" int8 NOT NULL,
	step_name varchar(100) NOT NULL,
	job_execution_id int8 NOT NULL,
	start_time timestamp NOT NULL,
	end_time timestamp NULL,
	status varchar(10) NULL,
	commit_count int8 NULL,
	read_count int8 NULL,
	filter_count int8 NULL,
	write_count int8 NULL,
	read_skip_count int8 NULL,
	write_skip_count int8 NULL,
	process_skip_count int8 NULL,
	rollback_count int8 NULL,
	exit_code varchar(2500) NULL,
	exit_message varchar(2500) NULL,
	last_updated timestamp NULL,
	CONSTRAINT batch_step_execution_pkey PRIMARY KEY (step_execution_id),
	CONSTRAINT job_exec_step_fk FOREIGN KEY (job_execution_id) REFERENCES custom.batch_job_execution(job_execution_id)
);


-- custom.batch_step_execution_context definition

-- Drop table

-- DROP TABLE custom.batch_step_execution_context;

CREATE TABLE custom.batch_step_execution_context (
	step_execution_id int8 NOT NULL,
	short_context varchar(2500) NOT NULL,
	serialized_context text NULL,
	CONSTRAINT batch_step_execution_context_pkey PRIMARY KEY (step_execution_id),
	CONSTRAINT step_exec_ctx_fk FOREIGN KEY (step_execution_id) REFERENCES custom.batch_step_execution(step_execution_id)
);


-- custom.ci_enh_feeder definition

-- Drop table

-- DROP TABLE custom.ci_enh_feeder;

CREATE TABLE custom.ci_enh_feeder (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	code varchar NOT NULL,
	"location" varchar NOT NULL,
	landmark varchar NULL,
	sub_station varchar NOT NULL,
	createdby varchar(150) NOT NULL,
	createddate timestamp NOT NULL,
	division varchar NOT NULL,
	status varchar NULL,
	CONSTRAINT ci_enh_feeder_pk PRIMARY KEY (id),
	CONSTRAINT ci_enh_feeder_un UNIQUE (code, division),
	CONSTRAINT ci_enh_feeder_fk FOREIGN KEY (sub_station,division) REFERENCES custom.ci_enh_sub_station(code,division) ON DELETE CASCADE ON UPDATE CASCADE
);


-- custom.ci_field_user_creation definition

-- Drop table

-- DROP TABLE custom.ci_field_user_creation;

CREATE TABLE custom.ci_field_user_creation (
	agency_code varchar(100) NULL,
	city varchar(100) NULL,
	agency_name varchar NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	user_id varchar NOT NULL,
	id_proof varchar(500) NULL,
	file_id varchar NULL,
	created_by varchar(150) NULL,
	created_date timestamp NULL,
	modified_by varchar(155) NULL,
	modified_date timestamp NULL,
	CONSTRAINT ci_field_user_creation_pk PRIMARY KEY (id),
	CONSTRAINT ci_field_user_creation_un UNIQUE (user_id),
	CONSTRAINT ci_field_user_creation_fk FOREIGN KEY (user_id) REFERENCES custom."user"(user_name)
);


-- custom.ci_supervisor_user_creation definition

-- Drop table

-- DROP TABLE custom.ci_supervisor_user_creation;

CREATE TABLE custom.ci_supervisor_user_creation (
	agency_code varchar(100) NULL,
	city varchar(100) NULL,
	agency_name varchar NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	user_id varchar NOT NULL,
	id_proof varchar(500) NULL,
	file_id varchar NULL,
	created_by varchar(150) NULL,
	created_date timestamp NULL,
	modified_by varchar(155) NULL,
	modified_date timestamp NULL,
	CONSTRAINT ci_supervisor_user_creation_pk PRIMARY KEY (id),
	CONSTRAINT ci_supervisor_user_creation_un UNIQUE (user_id),
	CONSTRAINT ci_supervisor_user_creation_fk FOREIGN KEY (user_id) REFERENCES custom."user"(user_name)
);


-- custom.discom_details definition

-- Drop table

-- DROP TABLE custom.discom_details;

CREATE TABLE custom.discom_details (
	discom_details_id int4 NOT NULL,
	discom_code varchar(25) NULL,
	discom_name varchar(150) NULL,
	discom_location varchar(100) NULL,
	discom_authority varchar(100) NULL,
	address varchar(500) NULL,
	room_floor varchar(100) NULL,
	block_building varchar(100) NULL,
	street_po_box varchar(100) NULL,
	city varchar(150) NULL,
	state varchar(150) NULL,
	country varchar(150) NULL,
	zip_code int4 NULL,
	website varchar(100) NULL,
	email varchar(100) NULL,
	phone1 varchar(15) NULL,
	phone2 varchar(15) NULL,
	mobile varchar(15) NULL,
	fax varchar(15) NULL,
	state_code varchar(25) NULL,
	state_name varchar(150) NULL,
	created_by varchar(25) NULL,
	created_date timestamp NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	company_detail_id int8 NULL,
	amount int8 NULL,
	berth_wise varchar(6) NULL,
	billing_end_time varchar(6) NULL,
	billing_start_time varchar(6) NULL,
	currency_id int8 NULL,
	currency_name varchar(150) NULL,
	default_currency varchar(25) NULL,
	default_date_format varchar(20) NULL,
	default_time_format varchar(10) NULL,
	do_control varchar(255) NULL,
	downward_rounding_off int8 NULL,
	draft_aft float8 NULL,
	entry_certificate_start_num int8 NULL,
	extrnl_rail_siding_oprtn varchar(6) NULL,
	income_tax_pan varchar(25) NULL,
	latitude varchar(15) NULL,
	loa float8 NULL,
	longitute varchar(15) NULL,
	percents int8 NULL,
	prices int8 NULL,
	quantities int8 NULL,
	rates int8 NULL,
	rounding_off varchar(15) NULL,
	service_tax_reg_code varchar(25) NULL,
	time_port varchar(30) NULL,
	upward_rounding_off int8 NULL,
	vcn_initial_number int8 NULL,
	vcn_mandatory varchar(6) NULL,
	year_built int4 NULL,
	is_active int4 NULL DEFAULT 1,
	state_details_id int4 NULL,
	statedetailsid int8 NULL,
	division varchar(200) NULL,
	subdivision varchar(200) NULL,
	CONSTRAINT discom_details1_pkey PRIMARY KEY (discom_details_id),
	CONSTRAINT discom_details_discom_code1_uk UNIQUE (discom_code),
	CONSTRAINT discom_details_discom_name1_uk UNIQUE (discom_name),
	CONSTRAINT ipt_discom_details_state1_fk FOREIGN KEY (state_details_id) REFERENCES custom.state_details(state_details_id)
);
CREATE UNIQUE INDEX discom_details_pkey ON custom.discom_details USING btree (discom_details_id);


-- custom.employee_attendance definition

-- Drop table

-- DROP TABLE custom.employee_attendance;

CREATE TABLE custom.employee_attendance (
	attendance_id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	employee_id varchar(100) NULL,
	"date" timestamp NULL,
	status varchar(5) NULL,
	total_days int4 NULL,
	eligible_shift_days int4 NULL,
	present_shift_days int4 NULL,
	state_code varchar(25) NULL,
	discomdetail_code varchar(25) NULL,
	created_by varchar(25) NULL,
	created_date timestamp NULL DEFAULT now(),
	role_id int4 NULL,
	status_id int4 NULL,
	CONSTRAINT attendance1_pkey PRIMARY KEY (attendance_id),
	CONSTRAINT employee_attendance_un UNIQUE (employee_id, date),
	CONSTRAINT emp_attend_roleid_fk FOREIGN KEY (role_id) REFERENCES custom.employee_roles(id)
);


-- custom.employee_creation definition

-- Drop table

-- DROP TABLE custom.employee_creation;

CREATE TABLE custom.employee_creation (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	employee_name varchar(150) NULL,
	employee_id varchar(100) NULL,
	doj timestamp NULL,
	dor timestamp NULL,
	state varchar(100) NULL,
	active bool NULL,
	created_by varchar(25) NULL,
	created_date timestamp NULL DEFAULT now(),
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	role_name varchar(255) NULL,
	role_category varchar NULL,
	CONSTRAINT employee_creation_un UNIQUE (employee_id),
	CONSTRAINT users_creation1_pkey PRIMARY KEY (id),
	CONSTRAINT employee_creation_fk FOREIGN KEY (role_name,role_category) REFERENCES custom.employee_roles(role_name,role_category)
);
CREATE UNIQUE INDEX users_creation_pkey ON custom.employee_creation USING btree (id);


-- custom.employee_qualifications definition

-- Drop table

-- DROP TABLE custom.employee_qualifications;

CREATE TABLE custom.employee_qualifications (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	emp_id varchar NULL,
	"name" varchar(100) NULL,
	"type" varchar(50) NULL,
	file_doc_id int8 NULL,
	CONSTRAINT report_user_qualifications_pk PRIMARY KEY (id),
	CONSTRAINT employee_qualifications_fk FOREIGN KEY (emp_id) REFERENCES custom.employee_creation(employee_id)
);


-- custom.inventory_management_monthly definition

-- Drop table

-- DROP TABLE custom.inventory_management_monthly;

CREATE TABLE custom.inventory_management_monthly (
	inv_mngmt_id int4 NOT NULL,
	warehouse varchar(500) NULL,
	opening_stock_fresh int8 NULL,
	opening_stock_repaired int8 NULL,
	opening_stock_faulty int8 NULL,
	inward int8 NULL,
	outward int8 NULL,
	wh_in int8 NULL,
	wh_out int8 NULL,
	fresh_return int8 NULL,
	faulty_inward int8 NULL,
	faulty_outward int8 NULL,
	repaired_in int8 NULL,
	repaired_out int8 NULL,
	faulty_stock int8 NULL,
	repaired__stock int8 NULL,
	fresh_stock int8 NULL,
	total int8 NULL,
	statedetail_code varchar(25) NULL,
	discomdetail_code varchar(25) NULL,
	active numeric(1) NULL,
	created_by varchar(25) NULL,
	created_date timestamp NULL DEFAULT now(),
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	"month" varchar(30) NULL,
	"year" int4 NULL,
	state_id int4 NULL,
	discom_id int4 NULL,
	CONSTRAINT inventory_management1_pkey PRIMARY KEY (inv_mngmt_id),
	CONSTRAINT fk_inv_discom1_id FOREIGN KEY (discom_id) REFERENCES custom.discom_details(discom_details_id)
);
CREATE UNIQUE INDEX inventory_management_1_pkey ON custom.inventory_management_monthly USING btree (inv_mngmt_id);
CREATE INDEX invmanage_discom_idx ON custom.inventory_management_monthly USING btree (discom_id);
CREATE INDEX invmanage_month_idx ON custom.inventory_management_monthly USING btree (month);
CREATE INDEX invmanage_state_idx ON custom.inventory_management_monthly USING btree (state_id);
CREATE INDEX invmanage_year_idx ON custom.inventory_management_monthly USING btree (year);


-- custom.inventory_management_yearly definition

-- Drop table

-- DROP TABLE custom.inventory_management_yearly;

CREATE TABLE custom.inventory_management_yearly (
	inv_mngmt_id int4 NOT NULL,
	warehouse varchar(500) NULL,
	opening_stock_fresh int8 NULL,
	opening_stock_repaired int8 NULL,
	opening_stock_faulty int8 NULL,
	inward int8 NULL,
	outward int8 NULL,
	wh_in int8 NULL,
	wh_out int8 NULL,
	fresh_return int8 NULL,
	faulty_inward int8 NULL,
	faulty_outward int8 NULL,
	repaired_in int8 NULL,
	repaired_out int8 NULL,
	faulty_stock int8 NULL,
	repaired__stock int8 NULL,
	fresh_stock int8 NULL,
	total int8 NULL,
	statedetail_code varchar(25) NULL,
	discomdetail_code varchar(25) NULL,
	active numeric(1) NULL,
	created_by varchar(25) NULL,
	created_date timestamp NULL DEFAULT now(),
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	"year" int4 NULL,
	discom_id int4 NULL,
	state_id int4 NULL,
	CONSTRAINT inventory_management_12_pkey PRIMARY KEY (inv_mngmt_id),
	CONSTRAINT fk_inv_discom_12_id FOREIGN KEY (discom_id) REFERENCES custom.discom_details(discom_details_id)
);
CREATE INDEX inv_mng2_state_disom_month_year_idx ON custom.inventory_management_yearly USING btree (state_id, discom_id, year, statedetail_code, discomdetail_code);
CREATE UNIQUE INDEX inventory_management_2_pkey ON custom.inventory_management_yearly USING btree (inv_mngmt_id);


-- custom.system_role_access_mapping_tbl definition

-- Drop table

-- DROP TABLE custom.system_role_access_mapping_tbl;

CREATE TABLE custom.system_role_access_mapping_tbl (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	role_name varchar NOT NULL,
	privilege_name varchar NOT NULL,
	privilege_type varchar NOT NULL,
	CONSTRAINT system_role_privilege_mapping_tbl_pk PRIMARY KEY (id),
	CONSTRAINT system_role_privilege_mapping_tbl_un UNIQUE (role_name, privilege_name, privilege_type),
	CONSTRAINT system_role_privilege_mapping_tbl_fk FOREIGN KEY (role_name) REFERENCES custom.system_role_tbl(role_name) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT system_role_privilege_mapping_tbl_fk_1 FOREIGN KEY (privilege_name,privilege_type) REFERENCES custom.system_access_tbl(privilege_name,privilege_type) ON DELETE CASCADE ON UPDATE CASCADE
);


-- custom.user_discom definition

-- Drop table

-- DROP TABLE custom.user_discom;

CREATE TABLE custom.user_discom (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	user_name varchar NOT NULL,
	discom_name varchar NOT NULL,
	isdefault bool NULL DEFAULT false,
	start_date timestamp NULL,
	end_date timestamp NULL,
	CONSTRAINT user_discom_pk PRIMARY KEY (id),
	CONSTRAINT user_discom_fk FOREIGN KEY (user_name) REFERENCES custom."user"(user_name),
	CONSTRAINT user_discom_fk_1 FOREIGN KEY (discom_name) REFERENCES custom.discom_details(discom_code)
);


-- custom.user_registration_approver_remarks definition

-- Drop table

-- DROP TABLE custom.user_registration_approver_remarks;

CREATE TABLE custom.user_registration_approver_remarks (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	reference_id varchar(100) NOT NULL,
	approver_level int4 NOT NULL,
	remarks varchar NULL,
	created_by varchar NOT NULL,
	created_date timestamp NULL DEFAULT now(),
	CONSTRAINT user_registration_approver_remarks_pk PRIMARY KEY (id),
	CONSTRAINT user_registration_approver_remarks_un UNIQUE (reference_id, approver_level),
	CONSTRAINT user_registration_approver_remarks_fk FOREIGN KEY (reference_id) REFERENCES custom.user_registration_master_table(reference_id)
);


-- custom.user_registration_details_table definition

-- Drop table

-- DROP TABLE custom.user_registration_details_table;

CREATE TABLE custom.user_registration_details_table (
	reference_id varchar(100) NOT NULL,
	application_name varchar(100) NULL,
	access_validity_from timestamp NULL,
	access_validity_to timestamp NULL,
	last_approval_status varchar(100) NULL,
	access_type varchar(50) NULL,
	"function" varchar(50) NULL,
	"date" date NULL,
	lnt_approve_remarks varchar(1000) NULL,
	eesl_intellsmart_appr_remarks varchar NULL,
	remarks varchar(1000) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	required bool NOT NULL,
	CONSTRAINT user_registration_details_table_pk PRIMARY KEY (id),
	CONSTRAINT user_referenceid_fk FOREIGN KEY (reference_id) REFERENCES custom.user_registration_master_table(reference_id)
);


-- custom.user_registration_resource_table definition

-- Drop table

-- DROP TABLE custom.user_registration_resource_table;

CREATE TABLE custom.user_registration_resource_table (
	reference_id varchar(100) NOT NULL,
	username varchar(100) NULL,
	app_urls text NULL,
	ou_name varchar(100) NULL,
	security_groups varchar(100) NULL,
	system_destination_ip_subnets varchar(100) NULL,
	service_ssh_https varchar(100) NULL,
	custom_ports varchar(100) NULL,
	details_services_ports_urls_remarks varchar(1000) NULL,
	created_date timestamp NULL DEFAULT now(),
	created_by varchar(25) NULL,
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT user_registration_resource_table_pk PRIMARY KEY (id),
	CONSTRAINT user_reg_reference_id_fk FOREIGN KEY (reference_id) REFERENCES custom.user_registration_master_table(reference_id)
);


-- custom.user_registration_spoc_remarks definition

-- Drop table

-- DROP TABLE custom.user_registration_spoc_remarks;

CREATE TABLE custom.user_registration_spoc_remarks (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	reference_id varchar(100) NULL,
	remarks varchar NULL,
	"date" timestamp NULL,
	created_by varchar NULL,
	created_date timestamp NULL,
	CONSTRAINT user_registration_spoc_remarks_pk PRIMARY KEY (id),
	CONSTRAINT user_registration_spoc_remarks_fk FOREIGN KEY (reference_id) REFERENCES custom.user_registration_master_table(reference_id)
);


-- custom.user_role_mapping definition

-- Drop table

-- DROP TABLE custom.user_role_mapping;

CREATE TABLE custom.user_role_mapping (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	user_name varchar NOT NULL,
	role_name varchar NOT NULL,
	CONSTRAINT user_role_mapping_pk PRIMARY KEY (id),
	CONSTRAINT user_role_mapping_un UNIQUE (user_name, role_name),
	CONSTRAINT user_role_mapping_fk FOREIGN KEY (user_name) REFERENCES custom."user"(user_name) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT user_role_mapping_fk_1 FOREIGN KEY (role_name) REFERENCES custom.system_role_tbl(role_name)
);


-- custom.ci_enh_dtr definition

-- Drop table

-- DROP TABLE custom.ci_enh_dtr;

CREATE TABLE custom.ci_enh_dtr (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	code varchar NOT NULL,
	dtr_rating varchar NULL,
	"location" varchar NOT NULL,
	landmark varchar NULL,
	feeder varchar NOT NULL,
	createdby varchar(150) NOT NULL,
	createddate timestamp NOT NULL,
	division varchar NOT NULL,
	status varchar NOT NULL,
	CONSTRAINT ci_enh_dtr_pk PRIMARY KEY (id),
	CONSTRAINT ci_enh_dtr_un UNIQUE (code, division),
	CONSTRAINT ci_enh_dtr_fk FOREIGN KEY (feeder,division) REFERENCES custom.ci_enh_feeder(code,division) ON DELETE CASCADE ON UPDATE CASCADE
);


-- custom.ci_enh_pole definition

-- Drop table

-- DROP TABLE custom.ci_enh_pole;

CREATE TABLE custom.ci_enh_pole (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	code varchar NOT NULL,
	pole_type varchar NULL,
	"location" varchar NOT NULL,
	landmark varchar NULL,
	dtr varchar NULL,
	feeder varchar NULL,
	createdby varchar(150) NOT NULL,
	createddate timestamp NOT NULL,
	division varchar NOT NULL,
	status varchar NOT NULL,
	CONSTRAINT ci_enh_pole_pk PRIMARY KEY (id),
	CONSTRAINT ci_enh_pole_un UNIQUE (division, code),
	CONSTRAINT ci_enh_pole_fk FOREIGN KEY (feeder,division) REFERENCES custom.ci_enh_feeder(code,division),
	CONSTRAINT ci_enh_pole_fk1 FOREIGN KEY (dtr,division) REFERENCES custom.ci_enh_dtr(code,division) ON DELETE CASCADE ON UPDATE CASCADE
);


-- custom.deployment definition

-- Drop table

-- DROP TABLE custom.deployment;

CREATE TABLE custom.deployment (
	id int4 NOT NULL,
	city varchar(100) NULL,
	"month" varchar(50) NULL,
	"year" int4 NULL,
	targetted int8 NULL,
	actual_installed int8 NULL,
	"constraints" text NULL,
	progress_loss int8 NULL,
	revised_target int8 NULL,
	actual_target_percentage numeric NULL,
	revised_target_percentage varchar(100) NULL,
	statedetail_code varchar(25) NULL,
	discomdetail_code varchar(25) NULL,
	active numeric(1) NULL,
	created_by varchar(25) NULL,
	created_date timestamp NULL DEFAULT now(),
	modified_by varchar(25) NULL,
	modified_date timestamp NULL,
	discom_id int4 NULL,
	state_id int4 NULL,
	report_dated date NULL,
	CONSTRAINT deployment_1pkey PRIMARY KEY (id),
	CONSTRAINT deploy_discom1_fk FOREIGN KEY (discom_id) REFERENCES custom.discom_details(discom_details_id)
);
CREATE INDEX deployment_discom_id_idx ON custom.deployment USING btree (discom_id);
CREATE INDEX deployment_state_id_idx ON custom.deployment USING btree (state_id);