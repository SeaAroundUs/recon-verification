/*
 Navicat PostgreSQL Data Transfer

 Source Server         : recon-verification
 Source Server Version : 90401
 Source Host           : localhost
 Source Database       : recon
 Source Schema         : public

 Target Server Version : 90401
 File Encoding         : utf-8

 Date: 04/24/2015 14:41:53 PM
*/

-- ----------------------------
--  Sequence structure for auth_group_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."auth_group_id_seq";
CREATE SEQUENCE "public"."auth_group_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."auth_group_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for auth_group_permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."auth_group_permissions_id_seq";
CREATE SEQUENCE "public"."auth_group_permissions_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."auth_group_permissions_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for auth_permission_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."auth_permission_id_seq";
CREATE SEQUENCE "public"."auth_permission_id_seq" INCREMENT 1 START 54 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."auth_permission_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for auth_user_groups_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."auth_user_groups_id_seq";
CREATE SEQUENCE "public"."auth_user_groups_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."auth_user_groups_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for auth_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."auth_user_id_seq";
CREATE SEQUENCE "public"."auth_user_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."auth_user_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for auth_user_user_permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."auth_user_user_permissions_id_seq";
CREATE SEQUENCE "public"."auth_user_user_permissions_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."auth_user_user_permissions_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for catch_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."catch_type_id_seq";
CREATE SEQUENCE "public"."catch_type_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."catch_type_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for country_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."country_id_seq";
CREATE SEQUENCE "public"."country_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."country_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for data_ingest_fileupload_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."data_ingest_fileupload_id_seq";
CREATE SEQUENCE "public"."data_ingest_fileupload_id_seq" INCREMENT 1 START 91 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."data_ingest_fileupload_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for data_ingest_rawcatch_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."data_ingest_rawcatch_id_seq";
CREATE SEQUENCE "public"."data_ingest_rawcatch_id_seq" INCREMENT 1 START 4870 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."data_ingest_rawcatch_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for django_admin_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."django_admin_log_id_seq";
CREATE SEQUENCE "public"."django_admin_log_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."django_admin_log_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for django_content_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."django_content_type_id_seq";
CREATE SEQUENCE "public"."django_content_type_id_seq" INCREMENT 1 START 18 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."django_content_type_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for django_migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."django_migrations_id_seq";
CREATE SEQUENCE "public"."django_migrations_id_seq" INCREMENT 1 START 45 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."django_migrations_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for eez_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."eez_id_seq";
CREATE SEQUENCE "public"."eez_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."eez_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for fishing_sector_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."fishing_sector_id_seq";
CREATE SEQUENCE "public"."fishing_sector_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."fishing_sector_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for reconstructed_catch_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."reconstructed_catch_id_seq";
CREATE SEQUENCE "public"."reconstructed_catch_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."reconstructed_catch_id_seq" OWNER TO "recon";

-- ----------------------------
--  Sequence structure for reference_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."reference_id_seq";
CREATE SEQUENCE "public"."reference_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."reference_id_seq" OWNER TO "recon";

-- ----------------------------
--  Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."django_admin_log";
CREATE TABLE "public"."django_admin_log" (
	"id" int4 NOT NULL DEFAULT nextval('django_admin_log_id_seq'::regclass),
	"action_time" timestamp(6) WITH TIME ZONE NOT NULL,
	"object_id" text COLLATE "default",
	"object_repr" varchar(200) NOT NULL COLLATE "default",
	"action_flag" int2 NOT NULL,
	"change_message" text NOT NULL COLLATE "default",
	"content_type_id" int4,
	"user_id" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."django_admin_log" OWNER TO "recon";

-- ----------------------------
--  Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."django_migrations";
CREATE TABLE "public"."django_migrations" (
	"id" int4 NOT NULL DEFAULT nextval('django_migrations_id_seq'::regclass),
	"app" varchar(255) NOT NULL COLLATE "default",
	"name" varchar(255) NOT NULL COLLATE "default",
	"applied" timestamp(6) WITH TIME ZONE NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."django_migrations" OWNER TO "recon";

-- ----------------------------
--  Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO "public"."django_migrations" VALUES ('32', 'contenttypes', '0001_initial', '2015-04-03 09:28:53.624916-07');
INSERT INTO "public"."django_migrations" VALUES ('33', 'auth', '0001_initial', '2015-04-03 09:28:53.702916-07');
INSERT INTO "public"."django_migrations" VALUES ('34', 'admin', '0001_initial', '2015-04-03 09:28:53.780917-07');
INSERT INTO "public"."django_migrations" VALUES ('35', 'data_ingest', '0001_initial', '2015-04-03 09:28:54.155319-07');
INSERT INTO "public"."django_migrations" VALUES ('36', 'catch', '0001_initial', '2015-04-03 09:28:55.481328-07');
INSERT INTO "public"."django_migrations" VALUES ('37', 'sessions', '0001_initial', '2015-04-03 09:28:55.543728-07');
INSERT INTO "public"."django_migrations" VALUES ('38', 'catch', '0002_auto_20150403_0935', '2015-04-03 09:36:01.760236-07');
INSERT INTO "public"."django_migrations" VALUES ('39', 'contenttypes', '0002_remove_content_type_name', '2015-04-24 13:49:35.486082-07');
INSERT INTO "public"."django_migrations" VALUES ('40', 'auth', '0002_alter_permission_name_max_length', '2015-04-24 13:49:35.503479-07');
INSERT INTO "public"."django_migrations" VALUES ('41', 'auth', '0003_alter_user_email_max_length', '2015-04-24 13:49:35.518493-07');
INSERT INTO "public"."django_migrations" VALUES ('42', 'auth', '0004_alter_user_username_opts', '2015-04-24 13:49:35.535701-07');
INSERT INTO "public"."django_migrations" VALUES ('43', 'auth', '0005_alter_user_last_login_null', '2015-04-24 13:49:35.552272-07');
INSERT INTO "public"."django_migrations" VALUES ('44', 'auth', '0006_require_contenttypes_0002', '2015-04-24 13:49:35.554031-07');
INSERT INTO "public"."django_migrations" VALUES ('45', 'catch', '0003_auto_20150424_2050', '2015-04-24 13:50:28.864432-07');
COMMIT;

-- ----------------------------
--  Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS "public"."django_session";
CREATE TABLE "public"."django_session" (
	"session_key" varchar(40) NOT NULL COLLATE "default",
	"session_data" text NOT NULL COLLATE "default",
	"expire_date" timestamp(6) WITH TIME ZONE NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."django_session" OWNER TO "recon";

-- ----------------------------
--  Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO "public"."django_session" VALUES ('p4gl24wjxfg6r7upp36f2g41hktk9mrq', 'NGJlOGQ2Y2NkY2JhYzRmNTNiYmVmZTVkNmRmYmM2ZDUzOTI3Y2ZkZjp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6IjNjNmYwYTcyYTYyMzkxZmYxZDA5ZmFmMzg2OTc3ZGY0MTIzZTY2ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2015-01-28 08:55:17.795887-08');
INSERT INTO "public"."django_session" VALUES ('24bsxbmt53k936bsnoxbkplf15x8i8wx', 'NGJkMzU1ZGVkMDZiOWE1MjNkZDIxNWE3OWQ2NGRmNGU3NmFkZjM5Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9oYXNoIjoiM2M2ZjBhNzJhNjIzOTFmZjFkMDlmYWYzODY5NzdkZjQxMjNlNjZlOCJ9', '2015-01-29 12:52:18.468843-08');
INSERT INTO "public"."django_session" VALUES ('jsxwsc64teumi9ymjnouqavhhlxbotkj', 'NmE5ZmRiMzU3NmQzZjRmNjhmMmNlY2I3MzI0YjRiNmU0YmJmMTQ3Yzp7fQ==', '2015-02-14 19:18:29.025971-08');
INSERT INTO "public"."django_session" VALUES ('p2bkn14zkh8h6eg5bbgpng28yk8lmni0', 'NmE5ZmRiMzU3NmQzZjRmNjhmMmNlY2I3MzI0YjRiNmU0YmJmMTQ3Yzp7fQ==', '2015-02-14 19:18:35.945971-08');
INSERT INTO "public"."django_session" VALUES ('1p5wex44mdktbfgflwwqktugp6ax3dd9', 'NGJlOGQ2Y2NkY2JhYzRmNTNiYmVmZTVkNmRmYmM2ZDUzOTI3Y2ZkZjp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6IjNjNmYwYTcyYTYyMzkxZmYxZDA5ZmFmMzg2OTc3ZGY0MTIzZTY2ZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2015-02-16 10:10:50.987267-08');
INSERT INTO "public"."django_session" VALUES ('h0bjapyh2hjjr8kb62btvnzce7z60gto', 'MzNkMWIyMjg5Y2FiNmExOTM2MmUwMjg5YTgyYzliM2FkMTQ0YTk2ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTVlOWIwYTNjNzc2N2IyYTdhMDNkODUzMGQyYTJkMGQ1MzZhZjY5OCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2015-04-17 08:29:41.321607-07');
INSERT INTO "public"."django_session" VALUES ('anqt452wemb59l1fu2nvys66ualn82w8', 'ZjRjYmI2OTI0NWNiODZiODQ1ODgxZWQxN2QwNTllMDEwNDAzOWJkOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk1ZTliMGEzYzc3NjdiMmE3YTAzZDg1MzBkMmEyZDBkNTM2YWY2OTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2015-05-07 09:31:32.389548-07');
COMMIT;

-- ----------------------------
--  Table structure for eez
-- ----------------------------
DROP TABLE IF EXISTS "public"."eez";
CREATE TABLE "public"."eez" (
	"id" int4 NOT NULL DEFAULT nextval('eez_id_seq'::regclass),
	"name" varchar(200) NOT NULL COLLATE "default",
	"country_id" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."eez" OWNER TO "recon";

-- ----------------------------
--  Records of eez
-- ----------------------------
BEGIN;
INSERT INTO "public"."eez" VALUES ('711', 'Prince Edward Isl. (South Africa)', '190');
INSERT INTO "public"."eez" VALUES ('780', 'Trinidad & Tobago', '208');
INSERT INTO "public"."eez" VALUES ('784', 'United Arab Emirates', '216');
INSERT INTO "public"."eez" VALUES ('895', 'St Paul & Amsterdam Isl. (France)', '69');
INSERT INTO "public"."eez" VALUES ('768', 'Togo', '204');
INSERT INTO "public"."eez" VALUES ('258', 'French Polynesia', '69');
INSERT INTO "public"."eez" VALUES ('736', 'Sudan', '195');
INSERT INTO "public"."eez" VALUES ('410', 'Korea (South)', '116');
INSERT INTO "public"."eez" VALUES ('384', 'Côte d''Ivoire', '47');
INSERT INTO "public"."eez" VALUES ('393', 'Japan (outer islands)', '106');
INSERT INTO "public"."eez" VALUES ('650', 'Russia (Siberia)', '174');
INSERT INTO "public"."eez" VALUES ('292', 'Gibraltar (UK)', '217');
INSERT INTO "public"."eez" VALUES ('70', 'Bosnia & Herzegovina', '23');
INSERT INTO "public"."eez" VALUES ('796', 'Turks & Caicos Isl. (UK)', '217');
INSERT INTO "public"."eez" VALUES ('440', 'Lithuania', '122');
INSERT INTO "public"."eez" VALUES ('278', 'Germany (Baltic Sea)', '77');
INSERT INTO "public"."eez" VALUES ('760', 'Syria', '199');
INSERT INTO "public"."eez" VALUES ('764', 'Thailand', '202');
INSERT INTO "public"."eez" VALUES ('851', 'United States, East Coast', '221');
INSERT INTO "public"."eez" VALUES ('344', 'Hong Kong', '37');
INSERT INTO "public"."eez" VALUES ('84', 'Belize', '20');
INSERT INTO "public"."eez" VALUES ('197', 'Cyprus (North)', '51');
INSERT INTO "public"."eez" VALUES ('154', 'Desventuradas Isl. (Chile)', '36');
INSERT INTO "public"."eez" VALUES ('288', 'Ghana', '78');
INSERT INTO "public"."eez" VALUES ('740', 'Suriname', '196');
INSERT INTO "public"."eez" VALUES ('274', 'Gaza Strip', '75');
INSERT INTO "public"."eez" VALUES ('644', 'Russian Fed (Asia)', '174');
INSERT INTO "public"."eez" VALUES ('710', 'South Africa', '190');
INSERT INTO "public"."eez" VALUES ('583', 'Micronesia', '136');
INSERT INTO "public"."eez" VALUES ('616', 'Poland', '167');
INSERT INTO "public"."eez" VALUES ('654', 'Saint Helena (UK)', '217');
INSERT INTO "public"."eez" VALUES ('683', 'Saudi Arabia (Red Sea)', '182');
INSERT INTO "public"."eez" VALUES ('428', 'Latvia', '118');
INSERT INTO "public"."eez" VALUES ('191', 'Croatia', '48');
INSERT INTO "public"."eez" VALUES ('724', 'Spain', '192');
INSERT INTO "public"."eez" VALUES ('92', 'British Virgin Isl. (UK)', '217');
INSERT INTO "public"."eez" VALUES ('270', 'Gambia', '74');
INSERT INTO "public"."eez" VALUES ('368', 'Iraq', '99');
INSERT INTO "public"."eez" VALUES ('152', 'Chile', '36');
INSERT INTO "public"."eez" VALUES ('826', 'United Kingdom', '217');
INSERT INTO "public"."eez" VALUES ('450', 'Madagascar', '125');
INSERT INTO "public"."eez" VALUES ('847', 'United States, East Coast and Gulf of Mexico', '221');
INSERT INTO "public"."eez" VALUES ('678', 'Sao Tome & Principe', '181');
INSERT INTO "public"."eez" VALUES ('144', 'Sri Lanka', '193');
INSERT INTO "public"."eez" VALUES ('772', 'Tokelau (New Zealand)', '151');
INSERT INTO "public"."eez" VALUES ('684', 'Saudi Arabia (Persian Gulf)', '182');
INSERT INTO "public"."eez" VALUES ('266', 'Gabon', '72');
INSERT INTO "public"."eez" VALUES ('77', 'Trindade & Martim Vaz Isl. (Brazil)', '25');
INSERT INTO "public"."eez" VALUES ('219', 'Galapagos Isl. (Ecuador)', '58');
INSERT INTO "public"."eez" VALUES ('180', 'Congo (ex-Zaire)', '43');
INSERT INTO "public"."eez" VALUES ('574', 'Norfolk Isl. (Australia)', '12');
INSERT INTO "public"."eez" VALUES ('226', 'Equatorial Guinea', '61');
INSERT INTO "public"."eez" VALUES ('705', 'Slovenia', '187');
INSERT INTO "public"."eez" VALUES ('192', 'Cuba', '50');
INSERT INTO "public"."eez" VALUES ('132', 'Cape Verde', '33');
INSERT INTO "public"."eez" VALUES ('37', 'Macquarie Isl. (Australia)', '12');
INSERT INTO "public"."eez" VALUES ('48', 'Bahrain', '15');
INSERT INTO "public"."eez" VALUES ('90', 'Solomon Isl.', '188');
INSERT INTO "public"."eez" VALUES ('16', 'American Samoa', '221');
INSERT INTO "public"."eez" VALUES ('362', 'Indonesia (Western)', '97');
INSERT INTO "public"."eez" VALUES ('706', 'Somalia', '189');
INSERT INTO "public"."eez" VALUES ('32', 'Argentina', '9');
INSERT INTO "public"."eez" VALUES ('100', 'Bulgaria', '28');
INSERT INTO "public"."eez" VALUES ('12', 'Algeria', '3');
INSERT INTO "public"."eez" VALUES ('296', 'Kiribati', '114');
INSERT INTO "public"."eez" VALUES ('570', 'Niue (New Zealand)', '151');
INSERT INTO "public"."eez" VALUES ('798', 'Tuvalu', '214');
INSERT INTO "public"."eez" VALUES ('96', 'Brunei Darussalam', '27');
INSERT INTO "public"."eez" VALUES ('558', 'Nicaragua', '152');
INSERT INTO "public"."eez" VALUES ('694', 'Sierra Leone', '185');
INSERT INTO "public"."eez" VALUES ('396', 'Johnston Atoll (USA)', '221');
INSERT INTO "public"."eez" VALUES ('845', 'Jarvis Isl. (USA)', '221');
INSERT INTO "public"."eez" VALUES ('533', 'Leeward Netherlands Antilles', '148');
INSERT INTO "public"."eez" VALUES ('434', 'Libya', '121');
INSERT INTO "public"."eez" VALUES ('732', 'Western Sahara (Morocco)', '141');
INSERT INTO "public"."eez" VALUES ('843', 'Navassa Isl. (Haiti)', '221');
INSERT INTO "public"."eez" VALUES ('776', 'Tonga', '206');
INSERT INTO "public"."eez" VALUES ('422', 'Lebanon', '119');
INSERT INTO "public"."eez" VALUES ('902', 'Sardinia (Italy)', '103');
INSERT INTO "public"."eez" VALUES ('852', 'United States, Gulf of Mexico', '221');
INSERT INTO "public"."eez" VALUES ('50', 'Bangladesh', '17');
INSERT INTO "public"."eez" VALUES ('516', 'Namibia', '145');
INSERT INTO "public"."eez" VALUES ('566', 'Nigeria', '153');
INSERT INTO "public"."eez" VALUES ('364', 'Iran', '98');
INSERT INTO "public"."eez" VALUES ('608', 'Philippines', '165');
INSERT INTO "public"."eez" VALUES ('86', 'Chagos Archipel., Brit. Ind. Oc. Terr. (UK)', '217');
INSERT INTO "public"."eez" VALUES ('400', 'Jordan', '109');
INSERT INTO "public"."eez" VALUES ('504', 'Morocco', '141');
INSERT INTO "public"."eez" VALUES ('372', 'Ireland', '100');
INSERT INTO "public"."eez" VALUES ('844', 'Palmyra Atoll & Kingman Reef (USA)', '221');
INSERT INTO "public"."eez" VALUES ('153', 'Easter Isl. (Chile)', '36');
INSERT INTO "public"."eez" VALUES ('124', 'Canada', '31');
INSERT INTO "public"."eez" VALUES ('670', 'Saint Vincent & the Grenadines', '179');
INSERT INTO "public"."eez" VALUES ('74', 'Bouvet Isl. (Norway)', '157');
INSERT INTO "public"."eez" VALUES ('352', 'Iceland', '95');
INSERT INTO "public"."eez" VALUES ('332', 'Haiti', '89');
INSERT INTO "public"."eez" VALUES ('876', 'Wallis & Futuna Isl. (France)', '69');
INSERT INTO "public"."eez" VALUES ('316', 'Guam (USA)', '221');
INSERT INTO "public"."eez" VALUES ('900', 'Crete (Greece)', '80');
INSERT INTO "public"."eez" VALUES ('104', 'Myanmar', '144');
INSERT INTO "public"."eez" VALUES ('540', 'New Caledonia (France)', '69');
INSERT INTO "public"."eez" VALUES ('896', 'Crozet Isl. (France)', '69');
INSERT INTO "public"."eez" VALUES ('304', 'Greenland', '52');
INSERT INTO "public"."eez" VALUES ('899', 'Corsica (France)', '69');
INSERT INTO "public"."eez" VALUES ('788', 'Tunisia', '211');
INSERT INTO "public"."eez" VALUES ('480', 'Mauritius', '133');
INSERT INTO "public"."eez" VALUES ('492', 'Monaco', '138');
INSERT INTO "public"."eez" VALUES ('76', 'Brazil', '25');
INSERT INTO "public"."eez" VALUES ('548', 'Vanuatu', '222');
INSERT INTO "public"."eez" VALUES ('8', 'Albania', '2');
INSERT INTO "public"."eez" VALUES ('155', 'J. Fernandez, Felix and Ambrosio Isl. (Chile)', '36');
INSERT INTO "public"."eez" VALUES ('414', 'Kuwait', '117');
INSERT INTO "public"."eez" VALUES ('162', 'Christmas Isl. (Australia)', '12');
INSERT INTO "public"."eez" VALUES ('898', 'Clipperton Isl.  (France)', '69');
INSERT INTO "public"."eez" VALUES ('645', 'Russia (Barents Sea)', '174');
INSERT INTO "public"."eez" VALUES ('204', 'Benin', '21');
INSERT INTO "public"."eez" VALUES ('252', 'Tromelin Isl. (France)', '69');
INSERT INTO "public"."eez" VALUES ('276', 'Germany', '77');
INSERT INTO "public"."eez" VALUES ('324', 'Guinea', '86');
INSERT INTO "public"."eez" VALUES ('312', 'Guadeloupe  (France)', '69');
INSERT INTO "public"."eez" VALUES ('463', 'Malaysia (Sarawak)', '127');
INSERT INTO "public"."eez" VALUES ('36', 'Australia', '12');
INSERT INTO "public"."eez" VALUES ('334', 'Heard & McDonald Isl. (Australia)', '12');
INSERT INTO "public"."eez" VALUES ('850', 'US Virgin Isl.', '221');
INSERT INTO "public"."eez" VALUES ('166', 'Cocos (Keeling) Isl. (Australia)', '12');
INSERT INTO "public"."eez" VALUES ('178', 'Congo, R. of', '44');
INSERT INTO "public"."eez" VALUES ('250', 'France', '69');
INSERT INTO "public"."eez" VALUES ('520', 'Nauru', '146');
INSERT INTO "public"."eez" VALUES ('376', 'Israel', '102');
INSERT INTO "public"."eez" VALUES ('744', 'Svalbard Isl. (Norway)', '157');
INSERT INTO "public"."eez" VALUES ('856', 'Tristan da Cunha Isl. (UK)', '217');
INSERT INTO "public"."eez" VALUES ('188', 'Costa Rica', '46');
INSERT INTO "public"."eez" VALUES ('277', 'Germany (North Sea)', '77');
INSERT INTO "public"."eez" VALUES ('116', 'Cambodia', '29');
INSERT INTO "public"."eez" VALUES ('174', 'Comoros Isl.', '42');
INSERT INTO "public"."eez" VALUES ('239', 'South Georgia & Sandwich Isl. (UK)', '217');
INSERT INTO "public"."eez" VALUES ('488', 'Hawaii Northwest Islands (USA)', '221');
INSERT INTO "public"."eez" VALUES ('686', 'Senegal', '183');
INSERT INTO "public"."eez" VALUES ('170', 'Colombia', '41');
INSERT INTO "public"."eez" VALUES ('666', 'Saint Pierre & Miquelon (France)', '69');
INSERT INTO "public"."eez" VALUES ('28', 'Antigua & Barbuda', '8');
INSERT INTO "public"."eez" VALUES ('242', 'Fiji', '67');
INSERT INTO "public"."eez" VALUES ('56', 'Belgium', '19');
INSERT INTO "public"."eez" VALUES ('218', 'Ecuador', '58');
INSERT INTO "public"."eez" VALUES ('300', 'Greece', '80');
INSERT INTO "public"."eez" VALUES ('690', 'Seychelles', '184');
INSERT INTO "public"."eez" VALUES ('794', 'Turkey (Black Sea)', '212');
INSERT INTO "public"."eez" VALUES ('620', 'Portugal', '168');
INSERT INTO "public"."eez" VALUES ('897', 'Kerguelen Isl. (France)', '69');
INSERT INTO "public"."eez" VALUES ('157', 'Taiwan', '200');
INSERT INTO "public"."eez" VALUES ('184', 'Cook Islands', '151');
INSERT INTO "public"."eez" VALUES ('208', 'Denmark', '52');
INSERT INTO "public"."eez" VALUES ('512', 'Oman', '158');
INSERT INTO "public"."eez" VALUES ('320', 'Guatemala', '85');
INSERT INTO "public"."eez" VALUES ('586', 'Pakistan', '159');
INSERT INTO "public"."eez" VALUES ('626', 'Timor Leste', '203');
INSERT INTO "public"."eez" VALUES ('634', 'Qatar', '171');
INSERT INTO "public"."eez" VALUES ('308', 'Grenada', '82');
INSERT INTO "public"."eez" VALUES ('622', 'Azores Isl. (Portugal)', '168');
INSERT INTO "public"."eez" VALUES ('662', 'Saint Lucia', '177');
INSERT INTO "public"."eez" VALUES ('858', 'Uruguay', '218');
INSERT INTO "public"."eez" VALUES ('44', 'Bahamas', '14');
INSERT INTO "public"."eez" VALUES ('905', 'St Martin (France)', '240');
INSERT INTO "public"."eez" VALUES ('647', 'Russia (Black Sea)', '174');
INSERT INTO "public"."eez" VALUES ('380', 'Italy', '103');
INSERT INTO "public"."eez" VALUES ('459', 'Malaysia (Peninsula West)', '127');
INSERT INTO "public"."eez" VALUES ('591', 'Panama', '162');
INSERT INTO "public"."eez" VALUES ('508', 'Mozambique', '142');
INSERT INTO "public"."eez" VALUES ('882', 'Samoa', '180');
INSERT INTO "public"."eez" VALUES ('196', 'Cyprus', '51');
INSERT INTO "public"."eez" VALUES ('212', 'Dominica', '55');
INSERT INTO "public"."eez" VALUES ('246', 'Finland', '68');
INSERT INTO "public"."eez" VALUES ('891', 'Montenegro', '139');
INSERT INTO "public"."eez" VALUES ('834', 'Tanzania', '201');
INSERT INTO "public"."eez" VALUES ('500', 'Montserrat (UK)', '217');
INSERT INTO "public"."eez" VALUES ('38', 'Lord Howe Isl. (Australia)', '12');
INSERT INTO "public"."eez" VALUES ('702', 'Singapore', '186');
INSERT INTO "public"."eez" VALUES ('356', 'India (mainland)', '96');
INSERT INTO "public"."eez" VALUES ('120', 'Cameroon', '30');
INSERT INTO "public"."eez" VALUES ('360', 'Indonesia', '97');
INSERT INTO "public"."eez" VALUES ('390', 'Japan (main islands)', '106');
INSERT INTO "public"."eez" VALUES ('175', 'Mayotte (France)', '69');
INSERT INTO "public"."eez" VALUES ('340', 'Honduras', '93');
INSERT INTO "public"."eez" VALUES ('887', 'Yemen', '229');
INSERT INTO "public"."eez" VALUES ('604', 'Peru', '164');
INSERT INTO "public"."eez" VALUES ('642', 'Romania', '173');
INSERT INTO "public"."eez" VALUES ('430', 'Liberia', '120');
INSERT INTO "public"."eez" VALUES ('621', 'Madeira Isl. (Portugal)', '168');
INSERT INTO "public"."eez" VALUES ('872', 'Wake Isl. (USA)', '221');
INSERT INTO "public"."eez" VALUES ('251', 'Mozambique Channel Isl. (France)', '69');
INSERT INTO "public"."eez" VALUES ('904', 'St Barthelemy (France)', '239');
INSERT INTO "public"."eez" VALUES ('233', 'Estonia', '63');
INSERT INTO "public"."eez" VALUES ('723', 'Canary Isl. (Spain)', '192');
INSERT INTO "public"."eez" VALUES ('238', 'Falkland Isl. (UK)', '217');
INSERT INTO "public"."eez" VALUES ('328', 'Guyana', '88');
INSERT INTO "public"."eez" VALUES ('660', 'Anguilla (UK)', '217');
INSERT INTO "public"."eez" VALUES ('579', 'Jan Mayen Isl. (Norway)', '157');
INSERT INTO "public"."eez" VALUES ('254', 'French Guiana', '69');
INSERT INTO "public"."eez" VALUES ('659', 'Saint Kitts & Nevis', '176');
INSERT INTO "public"."eez" VALUES ('862', 'Venezuela', '223');
INSERT INTO "public"."eez" VALUES ('793', 'Turkey (Mediterranean Sea)', '212');
INSERT INTO "public"."eez" VALUES ('841', 'Alaska (USA)', '221');
INSERT INTO "public"."eez" VALUES ('60', 'Bermuda (UK)', '217');
INSERT INTO "public"."eez" VALUES ('818', 'Egypt', '59');
INSERT INTO "public"."eez" VALUES ('156', 'China', '37');
INSERT INTO "public"."eez" VALUES ('555', 'Kermadec Isl. (New Zealand)', '151');
INSERT INTO "public"."eez" VALUES ('842', 'Hawaii Main Islands (USA)', '221');
INSERT INTO "public"."eez" VALUES ('136', 'Cayman Isl. (UK)', '217');
INSERT INTO "public"."eez" VALUES ('651', 'Russia (Baltic Sea, St. Petersburg)', '174');
INSERT INTO "public"."eez" VALUES ('804', 'Ukraine', '215');
INSERT INTO "public"."eez" VALUES ('638', 'Réunion (France)', '69');
INSERT INTO "public"."eez" VALUES ('361', 'Indonesia (Eastern)', '97');
INSERT INTO "public"."eez" VALUES ('532', 'Windward Netherlands Antilles', '148');
INSERT INTO "public"."eez" VALUES ('648', 'Russia (Baltic Sea, Kaliningrad)', '174');
INSERT INTO "public"."eez" VALUES ('357', 'Andaman & Nicobar Isl. (India)', '96');
INSERT INTO "public"."eez" VALUES ('222', 'El Salvador', '60');
INSERT INTO "public"."eez" VALUES ('752', 'Sweden', '198');
INSERT INTO "public"."eez" VALUES ('901', 'Sicily (Italy)', '103');
INSERT INTO "public"."eez" VALUES ('580', 'Northern Marianas (USA)', '221');
INSERT INTO "public"."eez" VALUES ('848', 'United States, West Coast', '221');
INSERT INTO "public"."eez" VALUES ('460', 'Malaysia (Peninsula East)', '127');
INSERT INTO "public"."eez" VALUES ('855', 'Ascension Isl. (UK)', '217');
INSERT INTO "public"."eez" VALUES ('846', 'Howland & Baker Isl. (USA)', '221');
INSERT INTO "public"."eez" VALUES ('554', 'New Zealand', '151');
INSERT INTO "public"."eez" VALUES ('214', 'Dominican Republic', '56');
INSERT INTO "public"."eez" VALUES ('404', 'Kenya', '111');
INSERT INTO "public"."eez" VALUES ('624', 'Guinea-Bissau', '87');
INSERT INTO "public"."eez" VALUES ('470', 'Malta', '129');
INSERT INTO "public"."eez" VALUES ('446', 'Macau (China)', '37');
INSERT INTO "public"."eez" VALUES ('649', 'Russia (Pacific)', '174');
INSERT INTO "public"."eez" VALUES ('198', 'Cyprus (South)', '51');
INSERT INTO "public"."eez" VALUES ('903', 'Balearic Island (Spain)', '192');
INSERT INTO "public"."eez" VALUES ('484', 'Mexico', '135');
INSERT INTO "public"."eez" VALUES ('598', 'Papua New Guinea', '163');
INSERT INTO "public"."eez" VALUES ('111', 'Eritrea', '62');
INSERT INTO "public"."eez" VALUES ('528', 'Netherlands', '148');
INSERT INTO "public"."eez" VALUES ('578', 'Norway', '157');
INSERT INTO "public"."eez" VALUES ('392', 'Japan (main islands)', '106');
INSERT INTO "public"."eez" VALUES ('52', 'Barbados', '18');
INSERT INTO "public"."eez" VALUES ('584', 'Marshall Isl.', '130');
INSERT INTO "public"."eez" VALUES ('585', 'Palau', '160');
INSERT INTO "public"."eez" VALUES ('268', 'Georgia', '76');
INSERT INTO "public"."eez" VALUES ('262', 'Djibouti', '54');
INSERT INTO "public"."eez" VALUES ('630', 'Puerto Rico (USA)', '221');
INSERT INTO "public"."eez" VALUES ('461', 'Malaysia (Sabah)', '127');
INSERT INTO "public"."eez" VALUES ('478', 'Mauritania', '132');
INSERT INTO "public"."eez" VALUES ('24', 'Angola', '6');
INSERT INTO "public"."eez" VALUES ('388', 'Jamaica', '104');
INSERT INTO "public"."eez" VALUES ('462', 'Maldives', '128');
INSERT INTO "public"."eez" VALUES ('474', 'Martinique (France)', '69');
INSERT INTO "public"."eez" VALUES ('612', 'Pitcairn (UK)', '217');
INSERT INTO "public"."eez" VALUES ('234', 'Faeroe Isl. (Denmark)', '52');
INSERT INTO "public"."eez" VALUES ('830', 'Channel Isl. (UK)', '217');
INSERT INTO "public"."eez" VALUES ('704', 'Viet Nam', '224');
INSERT INTO "public"."eez" VALUES ('408', 'Korea (North)', '115');
INSERT INTO "public"."eez" VALUES ('840', 'USA (contiguous states)', '221');
COMMIT;

-- ----------------------------
--  Table structure for fishing_sector
-- ----------------------------
DROP TABLE IF EXISTS "public"."fishing_sector";
CREATE TABLE "public"."fishing_sector" (
	"id" int4 NOT NULL DEFAULT nextval('fishing_sector_id_seq'::regclass),
	"name" varchar(200) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."fishing_sector" OWNER TO "recon";

-- ----------------------------
--  Records of fishing_sector
-- ----------------------------
BEGIN;
INSERT INTO "public"."fishing_sector" VALUES ('1', 'Industrial');
INSERT INTO "public"."fishing_sector" VALUES ('2', 'Subsistence');
INSERT INTO "public"."fishing_sector" VALUES ('3', 'Artisanal');
INSERT INTO "public"."fishing_sector" VALUES ('4', 'Recreational');
COMMIT;

-- ----------------------------
--  Table structure for data_ingest_rawcatch
-- ----------------------------
DROP TABLE IF EXISTS "public"."data_ingest_rawcatch";
CREATE TABLE "public"."data_ingest_rawcatch" (
	"id" int4 NOT NULL DEFAULT nextval('data_ingest_rawcatch_id_seq'::regclass),
	"fishing_entity" varchar(200) NOT NULL COLLATE "default",
	"fishing_entity_id" int4 NOT NULL,
	"original_country_fishing" varchar(200) NOT NULL COLLATE "default",
	"eez_area" varchar(200) NOT NULL COLLATE "default",
	"eez_id" int4 NOT NULL,
	"eez_sub_area" varchar(200) COLLATE "default",
	"fao_area" varchar(20) COLLATE "default",
	"sub_regional_area" varchar(200) COLLATE "default",
	"province_state" varchar(200) COLLATE "default",
	"ices_division" varchar(20) COLLATE "default",
	"ices_subdivision" varchar(20) COLLATE "default",
	"nafo_division" varchar(20) COLLATE "default",
	"ccamlr_area" varchar(20) COLLATE "default",
	"layer" int4 NOT NULL,
	"year" int4 NOT NULL,
	"amount" numeric(20,12) NOT NULL,
	"adjustment_factor" varchar(200) COLLATE "default",
	"gear_type" varchar(200) COLLATE "default",
	"gear_type_id" int4 NOT NULL,
	"taxon_name" varchar(200) NOT NULL COLLATE "default",
	"taxon_key" int4 NOT NULL,
	"original_fao_name" varchar(200) COLLATE "default",
	"sector" varchar(200) NOT NULL COLLATE "default",
	"original_sector" varchar(200) COLLATE "default",
	"sector_id" int4 NOT NULL,
	"catch_type" varchar(200) NOT NULL COLLATE "default",
	"catch_type_id" int4 NOT NULL,
	"input_type" varchar(200) COLLATE "default",
	"reference_id" int4,
	"forward_carry_rule" varchar(400) COLLATE "default",
	"notes" varchar(2000) COLLATE "default",
	"source_file_id" int4 NOT NULL,
	"user_id" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."data_ingest_rawcatch" OWNER TO "recon";

-- ----------------------------
--  Table structure for reference
-- ----------------------------
DROP TABLE IF EXISTS "public"."reference";
CREATE TABLE "public"."reference" (
	"id" int4 NOT NULL DEFAULT nextval('reference_id_seq'::regclass),
	"name" varchar(200) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."reference" OWNER TO "recon";

-- ----------------------------
--  Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."django_content_type";
CREATE TABLE "public"."django_content_type" (
	"id" int4 NOT NULL DEFAULT nextval('django_content_type_id_seq'::regclass),
	"app_label" varchar(100) NOT NULL COLLATE "default",
	"model" varchar(100) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."django_content_type" OWNER TO "recon";

-- ----------------------------
--  Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO "public"."django_content_type" VALUES ('1', 'admin', 'logentry');
INSERT INTO "public"."django_content_type" VALUES ('2', 'auth', 'permission');
INSERT INTO "public"."django_content_type" VALUES ('3', 'auth', 'group');
INSERT INTO "public"."django_content_type" VALUES ('4', 'auth', 'user');
INSERT INTO "public"."django_content_type" VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO "public"."django_content_type" VALUES ('6', 'sessions', 'session');
INSERT INTO "public"."django_content_type" VALUES ('7', 'catch', 'country');
INSERT INTO "public"."django_content_type" VALUES ('8', 'catch', 'eez');
INSERT INTO "public"."django_content_type" VALUES ('9', 'catch', 'taxon');
INSERT INTO "public"."django_content_type" VALUES ('10', 'catch', 'sector');
INSERT INTO "public"."django_content_type" VALUES ('11', 'catch', 'catchtype');
INSERT INTO "public"."django_content_type" VALUES ('12', 'catch', 'catch');
INSERT INTO "public"."django_content_type" VALUES ('13', 'ingest', 'fileupload');
INSERT INTO "public"."django_content_type" VALUES ('14', 'ingest', 'rawcatch');
INSERT INTO "public"."django_content_type" VALUES ('15', 'catch', 'reference');
INSERT INTO "public"."django_content_type" VALUES ('16', 'data_ingest', 'fileupload');
INSERT INTO "public"."django_content_type" VALUES ('17', 'data_ingest', 'rawcatch');
COMMIT;

-- ----------------------------
--  Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."auth_user";
CREATE TABLE "public"."auth_user" (
	"id" int4 NOT NULL DEFAULT nextval('auth_user_id_seq'::regclass),
	"password" varchar(128) NOT NULL COLLATE "default",
	"last_login" timestamp(6) WITH TIME ZONE,
	"is_superuser" bool NOT NULL,
	"username" varchar(30) NOT NULL COLLATE "default",
	"first_name" varchar(30) NOT NULL COLLATE "default",
	"last_name" varchar(30) NOT NULL COLLATE "default",
	"email" varchar(254) NOT NULL COLLATE "default",
	"is_staff" bool NOT NULL,
	"is_active" bool NOT NULL,
	"date_joined" timestamp(6) WITH TIME ZONE NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."auth_user" OWNER TO "recon";

-- ----------------------------
--  Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO "public"."auth_user" VALUES ('1', 'pbkdf2_sha256$15000$3GJ5OgOMTvmx$6NneQ5DP0iFya8iRNO+AHb3nfLOAx+zR+ImZDu+Y4cw=', '2015-04-23 09:31:32.385776-07', 't', 'recon', '', '', 'recon@sau.org', 't', 't', '2015-01-14 08:55:11.067017-08');
COMMIT;

-- ----------------------------
--  Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."auth_group_permissions";
CREATE TABLE "public"."auth_group_permissions" (
	"id" int4 NOT NULL DEFAULT nextval('auth_group_permissions_id_seq'::regclass),
	"group_id" int4 NOT NULL,
	"permission_id" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."auth_group_permissions" OWNER TO "recon";

-- ----------------------------
--  Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."auth_group";
CREATE TABLE "public"."auth_group" (
	"id" int4 NOT NULL DEFAULT nextval('auth_group_id_seq'::regclass),
	"name" varchar(80) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."auth_group" OWNER TO "recon";

-- ----------------------------
--  Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS "public"."auth_user_groups";
CREATE TABLE "public"."auth_user_groups" (
	"id" int4 NOT NULL DEFAULT nextval('auth_user_groups_id_seq'::regclass),
	"user_id" int4 NOT NULL,
	"group_id" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."auth_user_groups" OWNER TO "recon";

-- ----------------------------
--  Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."auth_permission";
CREATE TABLE "public"."auth_permission" (
	"id" int4 NOT NULL DEFAULT nextval('auth_permission_id_seq'::regclass),
	"name" varchar(255) NOT NULL COLLATE "default",
	"content_type_id" int4 NOT NULL,
	"codename" varchar(100) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."auth_permission" OWNER TO "recon";

-- ----------------------------
--  Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO "public"."auth_permission" VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO "public"."auth_permission" VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO "public"."auth_permission" VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO "public"."auth_permission" VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO "public"."auth_permission" VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO "public"."auth_permission" VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO "public"."auth_permission" VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO "public"."auth_permission" VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO "public"."auth_permission" VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO "public"."auth_permission" VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO "public"."auth_permission" VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO "public"."auth_permission" VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO "public"."auth_permission" VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO "public"."auth_permission" VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO "public"."auth_permission" VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO "public"."auth_permission" VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO "public"."auth_permission" VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO "public"."auth_permission" VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO "public"."auth_permission" VALUES ('19', 'Can add country', '7', 'add_country');
INSERT INTO "public"."auth_permission" VALUES ('20', 'Can change country', '7', 'change_country');
INSERT INTO "public"."auth_permission" VALUES ('21', 'Can delete country', '7', 'delete_country');
INSERT INTO "public"."auth_permission" VALUES ('22', 'Can add eez', '8', 'add_eez');
INSERT INTO "public"."auth_permission" VALUES ('23', 'Can change eez', '8', 'change_eez');
INSERT INTO "public"."auth_permission" VALUES ('24', 'Can delete eez', '8', 'delete_eez');
INSERT INTO "public"."auth_permission" VALUES ('25', 'Can add taxon', '9', 'add_taxon');
INSERT INTO "public"."auth_permission" VALUES ('26', 'Can change taxon', '9', 'change_taxon');
INSERT INTO "public"."auth_permission" VALUES ('27', 'Can delete taxon', '9', 'delete_taxon');
INSERT INTO "public"."auth_permission" VALUES ('28', 'Can add sector', '10', 'add_sector');
INSERT INTO "public"."auth_permission" VALUES ('29', 'Can change sector', '10', 'change_sector');
INSERT INTO "public"."auth_permission" VALUES ('30', 'Can delete sector', '10', 'delete_sector');
INSERT INTO "public"."auth_permission" VALUES ('31', 'Can add catch type', '11', 'add_catchtype');
INSERT INTO "public"."auth_permission" VALUES ('32', 'Can change catch type', '11', 'change_catchtype');
INSERT INTO "public"."auth_permission" VALUES ('33', 'Can delete catch type', '11', 'delete_catchtype');
INSERT INTO "public"."auth_permission" VALUES ('34', 'Can add catch', '12', 'add_catch');
INSERT INTO "public"."auth_permission" VALUES ('35', 'Can change catch', '12', 'change_catch');
INSERT INTO "public"."auth_permission" VALUES ('36', 'Can delete catch', '12', 'delete_catch');
INSERT INTO "public"."auth_permission" VALUES ('37', 'Can add file upload', '13', 'add_fileupload');
INSERT INTO "public"."auth_permission" VALUES ('38', 'Can change file upload', '13', 'change_fileupload');
INSERT INTO "public"."auth_permission" VALUES ('39', 'Can delete file upload', '13', 'delete_fileupload');
INSERT INTO "public"."auth_permission" VALUES ('40', 'Can add raw catch', '14', 'add_rawcatch');
INSERT INTO "public"."auth_permission" VALUES ('41', 'Can change raw catch', '14', 'change_rawcatch');
INSERT INTO "public"."auth_permission" VALUES ('42', 'Can delete raw catch', '14', 'delete_rawcatch');
INSERT INTO "public"."auth_permission" VALUES ('43', 'Can add reference', '15', 'add_reference');
INSERT INTO "public"."auth_permission" VALUES ('44', 'Can change reference', '15', 'change_reference');
INSERT INTO "public"."auth_permission" VALUES ('45', 'Can delete reference', '15', 'delete_reference');
INSERT INTO "public"."auth_permission" VALUES ('46', 'Can add file upload', '16', 'add_fileupload');
INSERT INTO "public"."auth_permission" VALUES ('47', 'Can change file upload', '16', 'change_fileupload');
INSERT INTO "public"."auth_permission" VALUES ('48', 'Can delete file upload', '16', 'delete_fileupload');
INSERT INTO "public"."auth_permission" VALUES ('49', 'Can add raw catch', '17', 'add_rawcatch');
INSERT INTO "public"."auth_permission" VALUES ('50', 'Can change raw catch', '17', 'change_rawcatch');
INSERT INTO "public"."auth_permission" VALUES ('51', 'Can delete raw catch', '17', 'delete_rawcatch');
COMMIT;

-- ----------------------------
--  Table structure for catch_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."catch_type";
CREATE TABLE "public"."catch_type" (
	"id" int4 NOT NULL DEFAULT nextval('catch_type_id_seq'::regclass),
	"type" varchar(200) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."catch_type" OWNER TO "recon";

-- ----------------------------
--  Records of catch_type
-- ----------------------------
BEGIN;
INSERT INTO "public"."catch_type" VALUES ('1', 'reported landings');
INSERT INTO "public"."catch_type" VALUES ('2', 'discards');
INSERT INTO "public"."catch_type" VALUES ('3', 'unreported landings');
COMMIT;

-- ----------------------------
--  Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."auth_user_user_permissions";
CREATE TABLE "public"."auth_user_user_permissions" (
	"id" int4 NOT NULL DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass),
	"user_id" int4 NOT NULL,
	"permission_id" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."auth_user_user_permissions" OWNER TO "recon";

-- ----------------------------
--  Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS "public"."country";
CREATE TABLE "public"."country" (
	"id" int4 NOT NULL DEFAULT nextval('country_id_seq'::regclass),
	"name" varchar(200) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."country" OWNER TO "recon";

-- ----------------------------
--  Records of country
-- ----------------------------
BEGIN;
INSERT INTO "public"."country" VALUES ('43', 'Congo (ex-Zaire)');
INSERT INTO "public"."country" VALUES ('164', 'Peru');
INSERT INTO "public"."country" VALUES ('165', 'Philippines');
INSERT INTO "public"."country" VALUES ('96', 'India');
INSERT INTO "public"."country" VALUES ('74', 'Gambia');
INSERT INTO "public"."country" VALUES ('171', 'Qatar');
INSERT INTO "public"."country" VALUES ('42', 'Comoros');
INSERT INTO "public"."country" VALUES ('122', 'Lithuania');
INSERT INTO "public"."country" VALUES ('139', 'Montenegro');
INSERT INTO "public"."country" VALUES ('31', 'Canada');
INSERT INTO "public"."country" VALUES ('162', 'Panama');
INSERT INTO "public"."country" VALUES ('97', 'Indonesia');
INSERT INTO "public"."country" VALUES ('60', 'El Salvador');
INSERT INTO "public"."country" VALUES ('158', 'Oman');
INSERT INTO "public"."country" VALUES ('19', 'Belgium');
INSERT INTO "public"."country" VALUES ('106', 'Japan');
INSERT INTO "public"."country" VALUES ('198', 'Sweden');
INSERT INTO "public"."country" VALUES ('222', 'Vanuatu');
INSERT INTO "public"."country" VALUES ('204', 'Togo');
INSERT INTO "public"."country" VALUES ('44', 'Congo, R. of');
INSERT INTO "public"."country" VALUES ('12', 'Australia');
INSERT INTO "public"."country" VALUES ('3', 'Algeria');
INSERT INTO "public"."country" VALUES ('95', 'Iceland');
INSERT INTO "public"."country" VALUES ('15', 'Bahrain');
INSERT INTO "public"."country" VALUES ('121', 'Libya');
INSERT INTO "public"."country" VALUES ('186', 'Singapore');
INSERT INTO "public"."country" VALUES ('160', 'Palau');
INSERT INTO "public"."country" VALUES ('201', 'Tanzania');
INSERT INTO "public"."country" VALUES ('23', 'Bosnia & Herzegovina');
INSERT INTO "public"."country" VALUES ('136', 'Micronesia');
INSERT INTO "public"."country" VALUES ('144', 'Myanmar');
INSERT INTO "public"."country" VALUES ('179', 'Saint Vincent & the Grenadines');
INSERT INTO "public"."country" VALUES ('217', 'United Kingdom');
INSERT INTO "public"."country" VALUES ('218', 'Uruguay');
INSERT INTO "public"."country" VALUES ('208', 'Trinidad & Tobago');
INSERT INTO "public"."country" VALUES ('224', 'Viet Nam');
INSERT INTO "public"."country" VALUES ('80', 'Greece');
INSERT INTO "public"."country" VALUES ('58', 'Ecuador');
INSERT INTO "public"."country" VALUES ('85', 'Guatemala');
INSERT INTO "public"."country" VALUES ('145', 'Namibia');
INSERT INTO "public"."country" VALUES ('185', 'Sierra Leone');
INSERT INTO "public"."country" VALUES ('176', 'Saint Kitts & Nevis');
INSERT INTO "public"."country" VALUES ('54', 'Djibouti');
INSERT INTO "public"."country" VALUES ('163', 'Papua New Guinea');
INSERT INTO "public"."country" VALUES ('68', 'Finland');
INSERT INTO "public"."country" VALUES ('125', 'Madagascar');
INSERT INTO "public"."country" VALUES ('103', 'Italy');
INSERT INTO "public"."country" VALUES ('167', 'Poland');
INSERT INTO "public"."country" VALUES ('128', 'Maldives');
INSERT INTO "public"."country" VALUES ('89', 'Haiti');
INSERT INTO "public"."country" VALUES ('189', 'Somalia');
INSERT INTO "public"."country" VALUES ('8', 'Antigua & Barbuda');
INSERT INTO "public"."country" VALUES ('76', 'Georgia');
INSERT INTO "public"."country" VALUES ('78', 'Ghana');
INSERT INTO "public"."country" VALUES ('174', 'Russian Federation');
INSERT INTO "public"."country" VALUES ('221', 'USA');
INSERT INTO "public"."country" VALUES ('193', 'Sri Lanka');
INSERT INTO "public"."country" VALUES ('196', 'Suriname');
INSERT INTO "public"."country" VALUES ('229', 'Yemen');
INSERT INTO "public"."country" VALUES ('61', 'Equatorial Guinea');
INSERT INTO "public"."country" VALUES ('67', 'Fiji');
INSERT INTO "public"."country" VALUES ('30', 'Cameroon');
INSERT INTO "public"."country" VALUES ('157', 'Norway');
INSERT INTO "public"."country" VALUES ('52', 'Denmark');
INSERT INTO "public"."country" VALUES ('138', 'Monaco');
INSERT INTO "public"."country" VALUES ('25', 'Brazil');
INSERT INTO "public"."country" VALUES ('86', 'Guinea');
INSERT INTO "public"."country" VALUES ('206', 'Tonga');
INSERT INTO "public"."country" VALUES ('47', 'Côte d''Ivoire');
INSERT INTO "public"."country" VALUES ('55', 'Dominica');
INSERT INTO "public"."country" VALUES ('203', 'Timor Leste');
INSERT INTO "public"."country" VALUES ('118', 'Latvia');
INSERT INTO "public"."country" VALUES ('120', 'Liberia');
INSERT INTO "public"."country" VALUES ('104', 'Jamaica');
INSERT INTO "public"."country" VALUES ('183', 'Senegal');
INSERT INTO "public"."country" VALUES ('212', 'Turkey');
INSERT INTO "public"."country" VALUES ('56', 'Dominican Republic');
INSERT INTO "public"."country" VALUES ('177', 'Saint Lucia');
INSERT INTO "public"."country" VALUES ('50', 'Cuba');
INSERT INTO "public"."country" VALUES ('98', 'Iran');
INSERT INTO "public"."country" VALUES ('168', 'Portugal');
INSERT INTO "public"."country" VALUES ('214', 'Tuvalu');
INSERT INTO "public"."country" VALUES ('148', 'Netherlands');
INSERT INTO "public"."country" VALUES ('152', 'Nicaragua');
INSERT INTO "public"."country" VALUES ('233', 'South Cyprus');
INSERT INTO "public"."country" VALUES ('87', 'Guinea-Bissau');
INSERT INTO "public"."country" VALUES ('102', 'Israel');
INSERT INTO "public"."country" VALUES ('142', 'Mozambique');
INSERT INTO "public"."country" VALUES ('2', 'Albania');
INSERT INTO "public"."country" VALUES ('88', 'Guyana');
INSERT INTO "public"."country" VALUES ('188', 'Solomon Isl.');
INSERT INTO "public"."country" VALUES ('6', 'Angola');
INSERT INTO "public"."country" VALUES ('130', 'Marshall Isl.');
INSERT INTO "public"."country" VALUES ('109', 'Jordan');
INSERT INTO "public"."country" VALUES ('200', 'Taiwan');
INSERT INTO "public"."country" VALUES ('114', 'Kiribati');
INSERT INTO "public"."country" VALUES ('159', 'Pakistan');
INSERT INTO "public"."country" VALUES ('21', 'Benin');
INSERT INTO "public"."country" VALUES ('37', 'China');
INSERT INTO "public"."country" VALUES ('29', 'Cambodia');
INSERT INTO "public"."country" VALUES ('41', 'Colombia');
INSERT INTO "public"."country" VALUES ('77', 'Germany');
INSERT INTO "public"."country" VALUES ('173', 'Romania');
INSERT INTO "public"."country" VALUES ('117', 'Kuwait');
INSERT INTO "public"."country" VALUES ('182', 'Saudi Arabia');
INSERT INTO "public"."country" VALUES ('51', 'Cyprus');
INSERT INTO "public"."country" VALUES ('181', 'Sao Tome & Principe');
INSERT INTO "public"."country" VALUES ('63', 'Estonia');
INSERT INTO "public"."country" VALUES ('93', 'Honduras');
INSERT INTO "public"."country" VALUES ('100', 'Ireland');
INSERT INTO "public"."country" VALUES ('223', 'Venezuela');
INSERT INTO "public"."country" VALUES ('127', 'Malaysia');
INSERT INTO "public"."country" VALUES ('180', 'Samoa');
INSERT INTO "public"."country" VALUES ('82', 'Grenada');
INSERT INTO "public"."country" VALUES ('239', 'St Barthelemy (France)');
INSERT INTO "public"."country" VALUES ('36', 'Chile');
INSERT INTO "public"."country" VALUES ('195', 'Sudan');
INSERT INTO "public"."country" VALUES ('190', 'South Africa');
INSERT INTO "public"."country" VALUES ('69', 'France');
INSERT INTO "public"."country" VALUES ('18', 'Barbados');
INSERT INTO "public"."country" VALUES ('64', 'Ethiopia');
INSERT INTO "public"."country" VALUES ('115', 'Korea (North)');
INSERT INTO "public"."country" VALUES ('184', 'Seychelles');
INSERT INTO "public"."country" VALUES ('27', 'Brunei Darussalam');
INSERT INTO "public"."country" VALUES ('153', 'Nigeria');
INSERT INTO "public"."country" VALUES ('192', 'Spain');
INSERT INTO "public"."country" VALUES ('240', 'St Martin');
INSERT INTO "public"."country" VALUES ('211', 'Tunisia');
INSERT INTO "public"."country" VALUES ('14', 'Bahamas');
INSERT INTO "public"."country" VALUES ('17', 'Bangladesh');
INSERT INTO "public"."country" VALUES ('215', 'Ukraine');
INSERT INTO "public"."country" VALUES ('231', 'Montenegro');
INSERT INTO "public"."country" VALUES ('9', 'Argentina');
INSERT INTO "public"."country" VALUES ('99', 'Iraq');
INSERT INTO "public"."country" VALUES ('199', 'Syrian Arab Republic');
INSERT INTO "public"."country" VALUES ('116', 'Korea (South)');
INSERT INTO "public"."country" VALUES ('216', 'United Arab Emirates');
INSERT INTO "public"."country" VALUES ('111', 'Kenya');
INSERT INTO "public"."country" VALUES ('187', 'Slovenia');
INSERT INTO "public"."country" VALUES ('135', 'Mexico');
INSERT INTO "public"."country" VALUES ('72', 'Gabon');
INSERT INTO "public"."country" VALUES ('119', 'Lebanon');
INSERT INTO "public"."country" VALUES ('48', 'Croatia');
INSERT INTO "public"."country" VALUES ('20', 'Belize');
INSERT INTO "public"."country" VALUES ('232', 'North Cyprus');
INSERT INTO "public"."country" VALUES ('202', 'Thailand');
INSERT INTO "public"."country" VALUES ('151', 'New Zealand');
INSERT INTO "public"."country" VALUES ('129', 'Malta');
INSERT INTO "public"."country" VALUES ('146', 'Nauru');
INSERT INTO "public"."country" VALUES ('59', 'Egypt');
INSERT INTO "public"."country" VALUES ('132', 'Mauritania');
INSERT INTO "public"."country" VALUES ('141', 'Morocco');
INSERT INTO "public"."country" VALUES ('46', 'Costa Rica');
INSERT INTO "public"."country" VALUES ('62', 'Eritrea');
INSERT INTO "public"."country" VALUES ('133', 'Mauritius');
INSERT INTO "public"."country" VALUES ('75', 'Gaza Strip');
INSERT INTO "public"."country" VALUES ('33', 'Cape Verde');
INSERT INTO "public"."country" VALUES ('28', 'Bulgaria');
COMMIT;

-- ----------------------------
--  Table structure for data_ingest_fileupload
-- ----------------------------
DROP TABLE IF EXISTS "public"."data_ingest_fileupload";
CREATE TABLE "public"."data_ingest_fileupload" (
	"id" int4 NOT NULL DEFAULT nextval('data_ingest_fileupload_id_seq'::regclass),
	"file" varchar(100) NOT NULL COLLATE "default",
	"create_datetime" timestamp(6) WITH TIME ZONE NOT NULL,
	"user_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."data_ingest_fileupload" OWNER TO "recon";

-- ----------------------------
--  Table structure for taxon
-- ----------------------------
DROP TABLE IF EXISTS "public"."taxon";
CREATE TABLE "public"."taxon" (
	"taxon_key" int4 NOT NULL,
	"name" varchar(255) NOT NULL COLLATE "default",
	"scientific_name" varchar(255) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."taxon" OWNER TO "recon";

-- ----------------------------
--  Records of taxon
-- ----------------------------
BEGIN;
INSERT INTO "public"."taxon" VALUES ('100000', 'Marine animals', 'Marine animals');
INSERT INTO "public"."taxon" VALUES ('100011', 'Carps and barbels other cyprinids', 'Carps or barbels and other cyprinids');
INSERT INTO "public"."taxon" VALUES ('100021', 'Sturgeons and paddlefishes', 'Sturgeons and paddlefishes');
INSERT INTO "public"."taxon" VALUES ('100025', 'Diadromous fishes', 'Miscellaneous diadromous fishes');
INSERT INTO "public"."taxon" VALUES ('100031', 'Flounders  halibuts and soles', 'Flounders or halibuts and soles');
INSERT INTO "public"."taxon" VALUES ('100035', 'Herrings  sardines and  anchovies', 'Clupeoids');
INSERT INTO "public"."taxon" VALUES ('100036', 'Tunas  bonitos and billfishes', 'Scombroids');
INSERT INTO "public"."taxon" VALUES ('100038', 'Sharks  rays and  skates  etc', 'Sharks or rays and chimaeras');
INSERT INTO "public"."taxon" VALUES ('100039', 'Marine fishes', 'Marine fishes not identified');
INSERT INTO "public"."taxon" VALUES ('100043', 'Lobsters and spiny-rock lobsters', 'Homaridae and Palinuridae');
INSERT INTO "public"."taxon" VALUES ('100044', 'Craylets and squat lobsters', 'King crabs and squat-lobsters');
INSERT INTO "public"."taxon" VALUES ('100045', 'Shrimps and prawns', 'Shrimps andprawns');
INSERT INTO "public"."taxon" VALUES ('100047', 'Marine crustaceans', 'Miscellaneous marine crustaceans');
INSERT INTO "public"."taxon" VALUES ('100053', 'Oysters', 'Oysters');
INSERT INTO "public"."taxon" VALUES ('100054', 'Mussels', 'Mussels');
INSERT INTO "public"."taxon" VALUES ('100056', 'Clams  cockles and arkshells', 'Clams or cockles and arkshells');
INSERT INTO "public"."taxon" VALUES ('100058', 'Marine molluscs', 'Miscellaneous marine molluscs');
INSERT INTO "public"."taxon" VALUES ('100077', 'Aquatic invertebrates', 'Miscellaneous aquatic invertebrates');
INSERT INTO "public"."taxon" VALUES ('100081', 'Pearls and mother-of-pearl  shells', 'Pearls or mother-of-pearl and shells');
INSERT INTO "public"."taxon" VALUES ('100139', 'Finfishes', 'Marine fishes not identified');
INSERT INTO "public"."taxon" VALUES ('100176', 'Starfishes', 'Starfish and other echinoderms');
INSERT INTO "public"."taxon" VALUES ('100195', 'Ex Mollusca', 'Marine shells nei');
INSERT INTO "public"."taxon" VALUES ('100196', 'Cnidarians and coelenterates', 'Cnidaria');
INSERT INTO "public"."taxon" VALUES ('100239', 'Groundfishes', 'Marine fishes not identified');
INSERT INTO "public"."taxon" VALUES ('100276', 'Sea urchins', 'Sea-urchins and other echinoderms');
INSERT INTO "public"."taxon" VALUES ('100338', 'Cartilaginous fishes', 'Sharks rays and chimaeras');
INSERT INTO "public"."taxon" VALUES ('100339', 'Pelagic fishes', 'Marine fishes not identified');
INSERT INTO "public"."taxon" VALUES ('100345', 'Natantian decapods', 'Shrimps and prawns');
INSERT INTO "public"."taxon" VALUES ('100538', 'Various sharks', 'Sharks rays and chimaeras');
INSERT INTO "public"."taxon" VALUES ('200003', 'Chimaeras and ratfish and rabbitfish', 'Holocephali');
INSERT INTO "public"."taxon" VALUES ('200004', 'Sharks and rays', 'Elasmobranchii');
INSERT INTO "public"."taxon" VALUES ('200007', 'Sharks', 'Selachimorpha');
INSERT INTO "public"."taxon" VALUES ('290002', 'Cephalopods', 'Cephalopoda');
INSERT INTO "public"."taxon" VALUES ('290004', 'Clams', 'Bivalvia');
INSERT INTO "public"."taxon" VALUES ('290005', 'Sea squirts', 'Ascidiacea');
INSERT INTO "public"."taxon" VALUES ('290006', 'Gastropods', 'Gastropoda');
INSERT INTO "public"."taxon" VALUES ('290010', 'Sea stars', 'Asteroidea');
INSERT INTO "public"."taxon" VALUES ('290011', 'Sea urchins', 'Echinoidea');
INSERT INTO "public"."taxon" VALUES ('290012', 'Sea cucumbers', 'Holothuroidea');
INSERT INTO "public"."taxon" VALUES ('290013', 'Jellyfish', 'Scyphozoa');
INSERT INTO "public"."taxon" VALUES ('290022', 'Crustaceans', 'Crustacea');
INSERT INTO "public"."taxon" VALUES ('300003', 'Chimaeras', 'Chimaeriformes');
INSERT INTO "public"."taxon" VALUES ('300007', 'Mackerel sharks', 'Lamniformes');
INSERT INTO "public"."taxon" VALUES ('300008', 'Ground sharks', 'Carcharhiniformes');
INSERT INTO "public"."taxon" VALUES ('300009', 'Bramble and sleeper and dogfish sharks', 'Squaliformes');
INSERT INTO "public"."taxon" VALUES ('300014', 'Skates and rays', 'Rajiformes');
INSERT INTO "public"."taxon" VALUES ('300026', 'Eels and morays', 'Anguilliformes');
INSERT INTO "public"."taxon" VALUES ('300028', 'Herrings', 'Clupeiformes');
INSERT INTO "public"."taxon" VALUES ('300032', 'Catfish', 'Siluriformes');
INSERT INTO "public"."taxon" VALUES ('300044', 'Cods', 'Gadiformes');
INSERT INTO "public"."taxon" VALUES ('300059', 'Scorpionfishes and flatheads', 'Scorpaeniformes');
INSERT INTO "public"."taxon" VALUES ('300060', 'Perch-likes', 'Perciformes');
INSERT INTO "public"."taxon" VALUES ('300061', 'Flatfishes', 'Pleuronectiformes');
INSERT INTO "public"."taxon" VALUES ('300063', 'Skates and rays', 'Batoidea');
INSERT INTO "public"."taxon" VALUES ('390002', 'Squids', 'Teuthida');
INSERT INTO "public"."taxon" VALUES ('390006', 'Cuttlefishes', 'Sepiida');
INSERT INTO "public"."taxon" VALUES ('390007', 'Octopuses', 'Octopoda');
INSERT INTO "public"."taxon" VALUES ('390011', 'Abalones and winkles', 'Archaeogastropoda');
INSERT INTO "public"."taxon" VALUES ('390013', 'Crabs lobsters and shrimps', 'Decapoda');
INSERT INTO "public"."taxon" VALUES ('390017', 'Mantis shrimps', 'Stomatopoda');
INSERT INTO "public"."taxon" VALUES ('390044', 'Merostomata', 'Merostomata');
INSERT INTO "public"."taxon" VALUES ('400001', 'Lampreys', 'Petromyzontidae');
INSERT INTO "public"."taxon" VALUES ('400002', 'Hagfishes', 'Myxinidae');
INSERT INTO "public"."taxon" VALUES ('400009', 'Mackerel sharks and white sharks', 'Lamnidae');
INSERT INTO "public"."taxon" VALUES ('400010', 'Cat sharks', 'Scyliorhinidae');
INSERT INTO "public"."taxon" VALUES ('400011', 'Requiem sharks', 'Carcharhinidae');
INSERT INTO "public"."taxon" VALUES ('400012', 'Hammerhead  and bonnethead  and scoophead shark', 'Sphyrnidae');
INSERT INTO "public"."taxon" VALUES ('400013', 'Dogfish sharks', 'Squalidae');
INSERT INTO "public"."taxon" VALUES ('400015', 'Angel sharks', 'Squatinidae');
INSERT INTO "public"."taxon" VALUES ('400016', 'Sawfishes', 'Pristidae');
INSERT INTO "public"."taxon" VALUES ('400017', 'Guitarfishes', 'Rhinobatidae');
INSERT INTO "public"."taxon" VALUES ('400018', 'Electric rays', 'Torpedinidae');
INSERT INTO "public"."taxon" VALUES ('400019', 'Skates', 'Rajidae');
INSERT INTO "public"."taxon" VALUES ('400020', 'Stingrays', 'Dasyatidae');
INSERT INTO "public"."taxon" VALUES ('400022', 'Eagle and manta rays', 'Myliobatidae');
INSERT INTO "public"."taxon" VALUES ('400024', 'Plownose chimaeras', 'Callorhinchidae');
INSERT INTO "public"."taxon" VALUES ('400032', 'Sturgeons', 'Acipenseridae');
INSERT INTO "public"."taxon" VALUES ('400043', 'Herrings and shads and sardines and menhadens', 'Clupeidae');
INSERT INTO "public"."taxon" VALUES ('400048', 'Bonefishes', 'Albulidae');
INSERT INTO "public"."taxon" VALUES ('400056', 'Moray eels', 'Muraenidae');
INSERT INTO "public"."taxon" VALUES ('400062', 'Conger and garden eels', 'Congridae');
INSERT INTO "public"."taxon" VALUES ('400066', 'Snake eels', 'Ophichthidae');
INSERT INTO "public"."taxon" VALUES ('400076', 'Salmonids', 'Salmonidae');
INSERT INTO "public"."taxon" VALUES ('400080', 'Smelts', 'Osmeridae');
INSERT INTO "public"."taxon" VALUES ('400082', 'Icefishes or noodlefishes', 'Salangidae');
INSERT INTO "public"."taxon" VALUES ('400084', 'Deep-sea smelts', 'Bathylagidae');
INSERT INTO "public"."taxon" VALUES ('400145', 'Sea catfishes', 'Ariidae');
INSERT INTO "public"."taxon" VALUES ('400149', 'Eeltail catfishes', 'Plotosidae');
INSERT INTO "public"."taxon" VALUES ('400160', 'Lizardfishes', 'Synodontidae');
INSERT INTO "public"."taxon" VALUES ('400163', 'Greeneyes', 'Chlorophthalmidae');
INSERT INTO "public"."taxon" VALUES ('400167', 'Lanternfishes', 'Myctophidae');
INSERT INTO "public"."taxon" VALUES ('400176', 'Trout-perches', 'Percopsidae');
INSERT INTO "public"."taxon" VALUES ('400180', 'Codlings', 'Moridae');
INSERT INTO "public"."taxon" VALUES ('400183', 'Cods and haddocks', 'Gadidae');
INSERT INTO "public"."taxon" VALUES ('400185', 'Grenadiers or rattails', 'Macrouridae');
INSERT INTO "public"."taxon" VALUES ('400186', 'Cusk-eels', 'Ophidiidae');
INSERT INTO "public"."taxon" VALUES ('400189', 'Toadfishes', 'Batrachoididae');
INSERT INTO "public"."taxon" VALUES ('400190', 'Goosefishes', 'Lophiidae');
INSERT INTO "public"."taxon" VALUES ('400206', 'Flyingfishes', 'Exocoetidae');
INSERT INTO "public"."taxon" VALUES ('400207', 'Needlefishes', 'Belonidae');
INSERT INTO "public"."taxon" VALUES ('400208', 'Sauries', 'Scomberesocidae');
INSERT INTO "public"."taxon" VALUES ('400218', 'Silversides', 'Atherinidae');
INSERT INTO "public"."taxon" VALUES ('400236', 'Slimeheads', 'Trachichthyidae');
INSERT INTO "public"."taxon" VALUES ('400240', 'Alfonsinos', 'Berycidae');
INSERT INTO "public"."taxon" VALUES ('400243', 'Squirrelfishes and soldierfishes', 'Holocentridae');
INSERT INTO "public"."taxon" VALUES ('400249', 'Dories', 'Zeidae');
INSERT INTO "public"."taxon" VALUES ('400250', 'Oreos', 'Oreosomatidae');
INSERT INTO "public"."taxon" VALUES ('400252', 'Boarfishes', 'Caproidae');
INSERT INTO "public"."taxon" VALUES ('400253', 'Trumpetfishes', 'Aulostomidae');
INSERT INTO "public"."taxon" VALUES ('400254', 'Cornetfishes', 'Fistulariidae');
INSERT INTO "public"."taxon" VALUES ('400264', 'Scorpionfishes or rockfishes', 'Scorpaenidae');
INSERT INTO "public"."taxon" VALUES ('400266', 'Searobins', 'Triglidae');
INSERT INTO "public"."taxon" VALUES ('400271', 'Greenlings', 'Hexagrammidae');
INSERT INTO "public"."taxon" VALUES ('400273', 'Flatheads', 'Platycephalidae');
INSERT INTO "public"."taxon" VALUES ('400277', 'Sculpins', 'Cottidae');
INSERT INTO "public"."taxon" VALUES ('400287', 'Snooks', 'Centropomidae');
INSERT INTO "public"."taxon" VALUES ('400289', 'Sea basses or groupers and fairy basslets', 'Serranidae');
INSERT INTO "public"."taxon" VALUES ('400299', 'Grunters or tigerperches', 'Terapontidae');
INSERT INTO "public"."taxon" VALUES ('400301', 'Aholeholes', 'Kuhliidae');
INSERT INTO "public"."taxon" VALUES ('400303', 'Bigeyes or catalufas', 'Priacanthidae');
INSERT INTO "public"."taxon" VALUES ('400304', 'Cardinalfishes', 'Apogonidae');
INSERT INTO "public"."taxon" VALUES ('400306', 'Perches', 'Percidae');
INSERT INTO "public"."taxon" VALUES ('400307', 'Smelt-whitings', 'Sillaginidae');
INSERT INTO "public"."taxon" VALUES ('400308', 'Tilefishes', 'Malacanthidae');
INSERT INTO "public"."taxon" VALUES ('400312', 'Cobia', 'Rachycentridae');
INSERT INTO "public"."taxon" VALUES ('400313', 'Remoras', 'Echeneidae');
INSERT INTO "public"."taxon" VALUES ('400314', 'Jacks and pompanos', 'Carangidae');
INSERT INTO "public"."taxon" VALUES ('400317', 'Moonfish', 'Menidae');
INSERT INTO "public"."taxon" VALUES ('400318', 'Slimys  slipmouths  or ponyfishes', 'Leiognathidae');
INSERT INTO "public"."taxon" VALUES ('400319', 'Pomfrets', 'Bramidae');
INSERT INTO "public"."taxon" VALUES ('400323', 'Snappers', 'Lutjanidae');
INSERT INTO "public"."taxon" VALUES ('400324', 'Threadfin breams and Whiptail breams', 'Nemipteridae');
INSERT INTO "public"."taxon" VALUES ('400326', 'Mojarras', 'Gerreidae');
INSERT INTO "public"."taxon" VALUES ('400327', 'Grunts', 'Haemulidae');
INSERT INTO "public"."taxon" VALUES ('400328', 'Emperors or scavengers', 'Lethrinidae');
INSERT INTO "public"."taxon" VALUES ('400330', 'Porgies', 'Sparidae');
INSERT INTO "public"."taxon" VALUES ('400331', 'Drums or croakers', 'Sciaenidae');
INSERT INTO "public"."taxon" VALUES ('400332', 'Goatfishes', 'Mullidae');
INSERT INTO "public"."taxon" VALUES ('400334', 'Sweepers', 'Pempheridae');
INSERT INTO "public"."taxon" VALUES ('400339', 'Sea chubs', 'Kyphosidae');
INSERT INTO "public"."taxon" VALUES ('400340', 'Spadefishes and batfishes and scats', 'Ephippidae');
INSERT INTO "public"."taxon" VALUES ('400343', 'Butterflyfishes', 'Chaetodontidae');
INSERT INTO "public"."taxon" VALUES ('400350', 'Damselfishes', 'Pomacentridae');
INSERT INTO "public"."taxon" VALUES ('400352', 'Hawkfishes', 'Cirrhitidae');
INSERT INTO "public"."taxon" VALUES ('400356', 'Trumpeters', 'Latridae');
INSERT INTO "public"."taxon" VALUES ('400359', 'Mullets', 'Mugilidae');
INSERT INTO "public"."taxon" VALUES ('400360', 'Barracudas', 'Sphyraenidae');
INSERT INTO "public"."taxon" VALUES ('400361', 'Threadfins', 'Polynemidae');
INSERT INTO "public"."taxon" VALUES ('400362', 'Wrasses', 'Labridae');
INSERT INTO "public"."taxon" VALUES ('400364', 'Parrotfishes', 'Scaridae');
INSERT INTO "public"."taxon" VALUES ('400371', 'Sandperches', 'Pinguipedidae');
INSERT INTO "public"."taxon" VALUES ('400377', 'Weeverfishes', 'Trachinidae');
INSERT INTO "public"."taxon" VALUES ('400382', 'Cod icefishes', 'Nototheniidae');
INSERT INTO "public"."taxon" VALUES ('400383', 'Antarctic dragonfishes', 'Bathydraconidae');
INSERT INTO "public"."taxon" VALUES ('400384', 'Crocodile icefishes', 'Channichthyidae');
INSERT INTO "public"."taxon" VALUES ('400392', 'Combtooth blennies', 'Blenniidae');
INSERT INTO "public"."taxon" VALUES ('400396', 'Wolffishes', 'Anarhichadidae');
INSERT INTO "public"."taxon" VALUES ('400402', 'Sand lances', 'Ammodytidae');
INSERT INTO "public"."taxon" VALUES ('400405', 'Gobies', 'Gobiidae');
INSERT INTO "public"."taxon" VALUES ('400412', 'Surgeonfishes and tangs and unicornfishes', 'Acanthuridae');
INSERT INTO "public"."taxon" VALUES ('400413', 'Rabbitfishes', 'Siganidae');
INSERT INTO "public"."taxon" VALUES ('400414', 'Snake mackerels', 'Gempylidae');
INSERT INTO "public"."taxon" VALUES ('400415', 'Cutlassfishes', 'Trichiuridae');
INSERT INTO "public"."taxon" VALUES ('400416', 'Mackerels  tunas and bonitos', 'Scombridae');
INSERT INTO "public"."taxon" VALUES ('400417', 'Swordfish', 'Xiphiidae');
INSERT INTO "public"."taxon" VALUES ('400419', 'Billfishes', 'Istiophoridae');
INSERT INTO "public"."taxon" VALUES ('400421', 'Medusafishes', 'Centrolophidae');
INSERT INTO "public"."taxon" VALUES ('400425', 'Butterfishes', 'Stromateidae');
INSERT INTO "public"."taxon" VALUES ('400437', 'Psettodids', 'Psettodidae');
INSERT INTO "public"."taxon" VALUES ('400439', 'Lefteye flounders', 'Bothidae');
INSERT INTO "public"."taxon" VALUES ('400440', 'Righteye flounders', 'Pleuronectidae');
INSERT INTO "public"."taxon" VALUES ('400441', 'Soles', 'Soleidae');
INSERT INTO "public"."taxon" VALUES ('400442', 'Tonguefishes', 'Cynoglossidae');
INSERT INTO "public"."taxon" VALUES ('400444', 'Triplespines', 'Triacanthidae');
INSERT INTO "public"."taxon" VALUES ('400445', 'Triggerfishes', 'Balistidae');
INSERT INTO "public"."taxon" VALUES ('400446', 'Boxfishes (cowfish and trunkfish)', 'Ostraciidae');
INSERT INTO "public"."taxon" VALUES ('400448', 'Puffers', 'Tetraodontidae');
INSERT INTO "public"."taxon" VALUES ('400449', 'Porcupinefishes (burrfishes)', 'Diodontidae');
INSERT INTO "public"."taxon" VALUES ('400454', 'Anchovies', 'Engraulidae');
INSERT INTO "public"."taxon" VALUES ('400459', 'Fusiliers', 'Caesionidae');
INSERT INTO "public"."taxon" VALUES ('400460', 'Angelfishes', 'Pomacanthidae');
INSERT INTO "public"."taxon" VALUES ('400475', 'Halfbeaks', 'Hemiramphidae');
INSERT INTO "public"."taxon" VALUES ('400479', 'Bonnetmouths', 'Inermiidae');
INSERT INTO "public"."taxon" VALUES ('400488', 'Houndsharks', 'Triakidae');
INSERT INTO "public"."taxon" VALUES ('400500', 'Round rays', 'Urolophidae');
INSERT INTO "public"."taxon" VALUES ('400504', 'Pike congers', 'Muraenesocidae');
INSERT INTO "public"."taxon" VALUES ('400509', 'Asiatic glassfishes', 'Ambassidae');
INSERT INTO "public"."taxon" VALUES ('400514', 'Large-tooth flounders', 'Paralichthyidae');
INSERT INTO "public"."taxon" VALUES ('400515', 'Turbots', 'Scophthalmidae');
INSERT INTO "public"."taxon" VALUES ('400517', 'Filefishes', 'Monacanthidae');
INSERT INTO "public"."taxon" VALUES ('400573', 'Rockfishes and rockcods and thornyheads', 'Sebastidae');
INSERT INTO "public"."taxon" VALUES ('400578', 'Stonefishes', 'Synanceiidae');
INSERT INTO "public"."taxon" VALUES ('400581', 'Armored searobins or armored gurnards', 'Peristediidae');
INSERT INTO "public"."taxon" VALUES ('400585', 'Sea ravens or sailfin sculpins', 'Hemitripteridae');
INSERT INTO "public"."taxon" VALUES ('400591', 'Barbled plunderfishes', 'Artedidraconidae');
INSERT INTO "public"."taxon" VALUES ('400595', 'Snipefishes', 'Macroramphosidae');
INSERT INTO "public"."taxon" VALUES ('400627', 'Asian seaperches', 'Lateolabracidae');
INSERT INTO "public"."taxon" VALUES ('400631', 'Lates perches', 'Latidae');
INSERT INTO "public"."taxon" VALUES ('400669', 'American round stingrays', 'Urotrygonidae');
INSERT INTO "public"."taxon" VALUES ('490004', 'Arrow squids', 'Ommastrephidae');
INSERT INTO "public"."taxon" VALUES ('490010', 'Common squids', 'Loliginidae');
INSERT INTO "public"."taxon" VALUES ('490011', 'Cuttlefishes', 'Sepiidae');
INSERT INTO "public"."taxon" VALUES ('490012', 'Octopuses', 'Octopodidae');
INSERT INTO "public"."taxon" VALUES ('490020', 'Abalones', 'Haliotidae');
INSERT INTO "public"."taxon" VALUES ('490021', 'Buccinidae', 'Buccinidae');
INSERT INTO "public"."taxon" VALUES ('490023', 'Littorinidae', 'Littorinidae');
INSERT INTO "public"."taxon" VALUES ('490030', 'Palaemonid shrimps', 'Palaemonidae');
INSERT INTO "public"."taxon" VALUES ('490031', 'Swimming crabs', 'Portunidae');
INSERT INTO "public"."taxon" VALUES ('490036', 'King crabs', 'Lithodidae');
INSERT INTO "public"."taxon" VALUES ('490037', 'Xanthidae', 'Xanthidae');
INSERT INTO "public"."taxon" VALUES ('490039', 'Spiny lobsters', 'Palinuridae');
INSERT INTO "public"."taxon" VALUES ('490040', 'Slipper lobsters', 'Scyllaridae');
INSERT INTO "public"."taxon" VALUES ('490041', 'Sergestid shrimp', 'Sergestidae');
INSERT INTO "public"."taxon" VALUES ('490042', 'Aristeid shrimps', 'Aristeidae');
INSERT INTO "public"."taxon" VALUES ('490043', 'Penaeid shrimps', 'Penaeidae');
INSERT INTO "public"."taxon" VALUES ('490044', 'Crongonid shrimp', 'Crangonidae');
INSERT INTO "public"."taxon" VALUES ('490046', 'Norther shrimps', 'Pandalidae');
INSERT INTO "public"."taxon" VALUES ('490052', 'Mantis shrimps', 'Squillidae');
INSERT INTO "public"."taxon" VALUES ('490054', 'Sea mussels', 'Mytilidae');
INSERT INTO "public"."taxon" VALUES ('490055', 'Scallops', 'Pectinidae');
INSERT INTO "public"."taxon" VALUES ('490058', 'Cockles', 'Cardiidae');
INSERT INTO "public"."taxon" VALUES ('490060', 'Venus clams', 'Veneridae');
INSERT INTO "public"."taxon" VALUES ('490061', 'Razor clams and knife clams', 'Solenidae');
INSERT INTO "public"."taxon" VALUES ('490062', 'Tridacnidae', 'Tridacnidae');
INSERT INTO "public"."taxon" VALUES ('490063', 'Mactra surf clams', 'Mactridae');
INSERT INTO "public"."taxon" VALUES ('490071', 'Jellyfishes', 'Rhizostomatidae');
INSERT INTO "public"."taxon" VALUES ('490097', 'Marine crabs', 'Brachyura');
INSERT INTO "public"."taxon" VALUES ('490124', 'Squat lobsters', 'Galatheidae');
INSERT INTO "public"."taxon" VALUES ('490125', 'Tellinidae', 'Tellinidae');
INSERT INTO "public"."taxon" VALUES ('490132', 'sea cucumbers', 'Holothuriidae');
INSERT INTO "public"."taxon" VALUES ('490133', 'HELMET SHELLS', 'Cassidae');
INSERT INTO "public"."taxon" VALUES ('490134', 'CONE SHELLS', 'Conidae');
INSERT INTO "public"."taxon" VALUES ('490135', 'Cowrys', 'Cypraeidae');
INSERT INTO "public"."taxon" VALUES ('490137', 'Hermit crabs', 'Diogenidae');
INSERT INTO "public"."taxon" VALUES ('490138', 'Urchin', 'Diadematidae');
INSERT INTO "public"."taxon" VALUES ('490142', 'NERITES', 'Neritidae');
INSERT INTO "public"."taxon" VALUES ('490143', 'TRUE OYSTERS', 'Ostreidae');
INSERT INTO "public"."taxon" VALUES ('490146', 'Augur shell', 'Terebridae');
INSERT INTO "public"."taxon" VALUES ('490148', 'Flower sea urchin', 'Toxopneustidae');
INSERT INTO "public"."taxon" VALUES ('490152', 'CHITONS', 'Chitonidae');
INSERT INTO "public"."taxon" VALUES ('490159', 'Carditid clams', 'Carditidae');
INSERT INTO "public"."taxon" VALUES ('500036', 'Pseudohemiodon', 'Pseudohemiodon');
INSERT INTO "public"."taxon" VALUES ('500048', 'American flounders', 'Paralichthys');
INSERT INTO "public"."taxon" VALUES ('500099', 'Brotulas', 'Brotula');
INSERT INTO "public"."taxon" VALUES ('500107', 'Dogfishes', 'Squalus');
INSERT INTO "public"."taxon" VALUES ('500108', 'Skates', 'Raja');
INSERT INTO "public"."taxon" VALUES ('500112', 'Monkfishes', 'Lophius');
INSERT INTO "public"."taxon" VALUES ('500114', 'Hairtails', 'Trichiurus');
INSERT INTO "public"."taxon" VALUES ('500116', 'Coryphaena', 'Coryphaena');
INSERT INTO "public"."taxon" VALUES ('500122', 'Weevers', 'Trachinus');
INSERT INTO "public"."taxon" VALUES ('500124', 'Sandlances', 'Ammodytes');
INSERT INTO "public"."taxon" VALUES ('500125', 'Stargazers', 'Uranoscopus');
INSERT INTO "public"."taxon" VALUES ('500134', 'Scorpionfish', 'Scorpaena');
INSERT INTO "public"."taxon" VALUES ('500136', 'Salmon and trout', 'Salmo');
INSERT INTO "public"."taxon" VALUES ('500142', 'Mackerels', 'Scomber');
INSERT INTO "public"."taxon" VALUES ('500143', 'Western goatfishes', 'Mullus');
INSERT INTO "public"."taxon" VALUES ('500144', 'Gurnards', 'Trigla');
INSERT INTO "public"."taxon" VALUES ('500147', 'Argentines', 'Argentina');
INSERT INTO "public"."taxon" VALUES ('500152', 'Grey mullets', 'Mugil');
INSERT INTO "public"."taxon" VALUES ('500153', 'Threadfins', 'Polynemus');
INSERT INTO "public"."taxon" VALUES ('500154', 'Diodon', 'Diodon');
INSERT INTO "public"."taxon" VALUES ('500158', 'Coryphaenoides', 'Coryphaenoides');
INSERT INTO "public"."taxon" VALUES ('500211', 'Deaf fishes', 'Trachipterus');
INSERT INTO "public"."taxon" VALUES ('500240', 'Rabbitfishes', 'Siganus');
INSERT INTO "public"."taxon" VALUES ('500242', 'Scarus', 'Scarus');
INSERT INTO "public"."taxon" VALUES ('500327', 'Grenadiers', 'Macrourus');
INSERT INTO "public"."taxon" VALUES ('500348', 'Smooth-hounds', 'Mustelus');
INSERT INTO "public"."taxon" VALUES ('500351', 'Guitarfish', 'Rhinobatos');
INSERT INTO "public"."taxon" VALUES ('500352', 'Shads', 'Alosa');
INSERT INTO "public"."taxon" VALUES ('500357', 'Snappers', 'Lutjanus');
INSERT INTO "public"."taxon" VALUES ('500358', 'Mola', 'Mola');
INSERT INTO "public"."taxon" VALUES ('500366', 'Groupers', 'Epinephelus');
INSERT INTO "public"."taxon" VALUES ('500372', 'Barracudas', 'Sphyraena');
INSERT INTO "public"."taxon" VALUES ('500384', 'Gymnothorax', 'Gymnothorax');
INSERT INTO "public"."taxon" VALUES ('500391', 'Lampris', 'Lampris');
INSERT INTO "public"."taxon" VALUES ('500398', 'Odontognathus', 'Odontognathus');
INSERT INTO "public"."taxon" VALUES ('500442', 'Hinds', 'Cephalopholis');
INSERT INTO "public"."taxon" VALUES ('500467', 'Jacks', 'Caranx');
INSERT INTO "public"."taxon" VALUES ('500468', 'Queenfishes', 'Scomberoides');
INSERT INTO "public"."taxon" VALUES ('500475', 'Fusiliers', 'Caesio');
INSERT INTO "public"."taxon" VALUES ('500476', 'Plectorhinchus', 'Plectorhinchus');
INSERT INTO "public"."taxon" VALUES ('500477', 'Sea chubs', 'Kyphosus');
INSERT INTO "public"."taxon" VALUES ('500480', 'Naso', 'Naso');
INSERT INTO "public"."taxon" VALUES ('500487', 'Seerfishes', 'Scomberomorus');
INSERT INTO "public"."taxon" VALUES ('500488', 'Sailfishes', 'Istiophorus');
INSERT INTO "public"."taxon" VALUES ('500495', 'Sea robins', 'Prionotus');
INSERT INTO "public"."taxon" VALUES ('500504', 'Snooks', 'Centropomus');
INSERT INTO "public"."taxon" VALUES ('500508', 'Cheilinus', 'Cheilinus');
INSERT INTO "public"."taxon" VALUES ('500515', 'Slipmouths', 'Leiognathus');
INSERT INTO "public"."taxon" VALUES ('500516', 'Grunts', 'Pomadasys');
INSERT INTO "public"."taxon" VALUES ('500537', 'Achirus', 'Achirus');
INSERT INTO "public"."taxon" VALUES ('500538', 'Blue marlins', 'Makaira');
INSERT INTO "public"."taxon" VALUES ('500551', 'Eel catfishes', 'Plotosus');
INSERT INTO "public"."taxon" VALUES ('500598', 'Pompanos', 'Trachinotus');
INSERT INTO "public"."taxon" VALUES ('500618', 'Soles', 'Solea');
INSERT INTO "public"."taxon" VALUES ('500638', 'Mako sharks', 'Isurus');
INSERT INTO "public"."taxon" VALUES ('500639', 'Thresher sharks', 'Alopias');
INSERT INTO "public"."taxon" VALUES ('500640', 'Catsharks', 'Galeus');
INSERT INTO "public"."taxon" VALUES ('500642', 'Lanternsharks', 'Etmopterus');
INSERT INTO "public"."taxon" VALUES ('500646', 'Stingrays', 'Dasyatis');
INSERT INTO "public"."taxon" VALUES ('500654', 'Hakes', 'Merluccius');
INSERT INTO "public"."taxon" VALUES ('500657', 'Hippocampus', 'Hippocampus');
INSERT INTO "public"."taxon" VALUES ('500661', 'Jack and horse mackerels', 'Trachurus');
INSERT INTO "public"."taxon" VALUES ('500679', 'Picarels', 'Spicara');
INSERT INTO "public"."taxon" VALUES ('500686', 'Rocklings', 'Gaidropsarus');
INSERT INTO "public"."taxon" VALUES ('500693', 'Hammerhead sharks', 'Sphyrna');
INSERT INTO "public"."taxon" VALUES ('500705', 'Seabreams and porgies', 'Diplodus');
INSERT INTO "public"."taxon" VALUES ('500716', 'Cardinalfishes', 'Epigonus');
INSERT INTO "public"."taxon" VALUES ('500717', 'Sculpins', 'Myoxocephalus');
INSERT INTO "public"."taxon" VALUES ('500732', 'Ogcocephalus', 'Ogcocephalus');
INSERT INTO "public"."taxon" VALUES ('500737', 'Morone', 'Morone');
INSERT INTO "public"."taxon" VALUES ('500808', 'Monocle breams', 'Scolopsis');
INSERT INTO "public"."taxon" VALUES ('500809', 'Seabreams (Dentex spp)', 'Dentex');
INSERT INTO "public"."taxon" VALUES ('500814', 'Lesser catsharks', 'Scyliorhinus');
INSERT INTO "public"."taxon" VALUES ('500816', 'Sharks', 'Carcharhinus');
INSERT INTO "public"."taxon" VALUES ('500854', 'Aluterus', 'Aluterus');
INSERT INTO "public"."taxon" VALUES ('500856', 'Wolf herring', 'Chirocentrus');
INSERT INTO "public"."taxon" VALUES ('500871', 'Needlefishes', 'Belone');
INSERT INTO "public"."taxon" VALUES ('500891', 'Sillago', 'Sillago');
INSERT INTO "public"."taxon" VALUES ('500901', 'Groupers', 'Serranus');
INSERT INTO "public"."taxon" VALUES ('500903', 'Seabreams (Pagrus spp)', 'Pagrus');
INSERT INTO "public"."taxon" VALUES ('500912', 'Bigeyes', 'Priacanthus');
INSERT INTO "public"."taxon" VALUES ('500913', 'Trumpeters', 'Terapon');
INSERT INTO "public"."taxon" VALUES ('500928', 'Amberjacks', 'Seriola');
INSERT INTO "public"."taxon" VALUES ('500934', 'Batfishes', 'Platax');
INSERT INTO "public"."taxon" VALUES ('501026', 'Tonguesoles', 'Cynoglossus');
INSERT INTO "public"."taxon" VALUES ('501055', 'Silver biddies', 'Gerres');
INSERT INTO "public"."taxon" VALUES ('501096', 'Lings', 'Molva');
INSERT INTO "public"."taxon" VALUES ('501116', 'Etelis', 'Etelis');
INSERT INTO "public"."taxon" VALUES ('501129', 'Alfonsinos', 'Beryx');
INSERT INTO "public"."taxon" VALUES ('501130', 'Myripristis', 'Myripristis');
INSERT INTO "public"."taxon" VALUES ('501132', 'Tropical goatfishes', 'Upeneus');
INSERT INTO "public"."taxon" VALUES ('501135', 'Redfishes', 'Sebastes');
INSERT INTO "public"."taxon" VALUES ('501143', 'Haemulon', 'Haemulon');
INSERT INTO "public"."taxon" VALUES ('501144', 'Lethrinus', 'Lethrinus');
INSERT INTO "public"."taxon" VALUES ('501145', 'Pandoras', 'Pagellus');
INSERT INTO "public"."taxon" VALUES ('501163', 'Frigate tuna', 'Auxis');
INSERT INTO "public"."taxon" VALUES ('501164', 'Harvestfishes', 'Peprilus');
INSERT INTO "public"."taxon" VALUES ('501241', 'Sicklefishes', 'Drepane');
INSERT INTO "public"."taxon" VALUES ('501242', 'Scats', 'Scatophagus');
INSERT INTO "public"."taxon" VALUES ('501327', 'Western croakers', 'Micropogonias');
INSERT INTO "public"."taxon" VALUES ('501345', 'Needlefishes', 'Tylosurus');
INSERT INTO "public"."taxon" VALUES ('501410', 'Char', 'Salvelinus');
INSERT INTO "public"."taxon" VALUES ('501418', 'Iberian soles', 'Microchirus');
INSERT INTO "public"."taxon" VALUES ('501441', 'Whiprays', 'Himantura');
INSERT INTO "public"."taxon" VALUES ('501464', 'Sawsharks', 'Pristiophorus');
INSERT INTO "public"."taxon" VALUES ('501486', 'Eelpouts', 'Lycodes');
INSERT INTO "public"."taxon" VALUES ('501523', 'Porae', 'Nemadactylus');
INSERT INTO "public"."taxon" VALUES ('501548', 'Seabreams', 'Chrysoblephus');
INSERT INTO "public"."taxon" VALUES ('501550', 'Steenbras', 'Lithognathus');
INSERT INTO "public"."taxon" VALUES ('501551', 'Porgies', 'Calamus');
INSERT INTO "public"."taxon" VALUES ('501552', 'Threadfin breams', 'Nemipterus');
INSERT INTO "public"."taxon" VALUES ('501573', 'Scads', 'Alepes');
INSERT INTO "public"."taxon" VALUES ('501634', 'Cypselurus', 'Cypselurus');
INSERT INTO "public"."taxon" VALUES ('501677', 'Filefishes', 'Cantherhines');
INSERT INTO "public"."taxon" VALUES ('501682', 'Sea catfishes', 'Arius');
INSERT INTO "public"."taxon" VALUES ('501826', 'Conger eels', 'Muraenesox');
INSERT INTO "public"."taxon" VALUES ('501905', 'Tuna', 'Thunnus');
INSERT INTO "public"."taxon" VALUES ('501940', 'Sardinella', 'Sardinella');
INSERT INTO "public"."taxon" VALUES ('501941', 'Herring', 'Harengula');
INSERT INTO "public"."taxon" VALUES ('501944', 'Ilishas', 'Pellona');
INSERT INTO "public"."taxon" VALUES ('501945', 'Dussumieria', 'Dussumieria');
INSERT INTO "public"."taxon" VALUES ('502004', 'Barrelfishes', 'Seriolella');
INSERT INTO "public"."taxon" VALUES ('502057', 'Lizardfishes', 'Saurida');
INSERT INTO "public"."taxon" VALUES ('502100', 'Trevallies', 'Carangoides');
INSERT INTO "public"."taxon" VALUES ('502102', 'Scads', 'Decapterus');
INSERT INTO "public"."taxon" VALUES ('502124', 'Pristipomoides', 'Pristipomoides');
INSERT INTO "public"."taxon" VALUES ('502224', 'Porichthys', 'Porichthys');
INSERT INTO "public"."taxon" VALUES ('502364', 'Sand basses', 'Paralabrax');
INSERT INTO "public"."taxon" VALUES ('502403', 'Eucinostomus', 'Eucinostomus');
INSERT INTO "public"."taxon" VALUES ('502417', 'Cusk eels', 'Genypterus');
INSERT INTO "public"."taxon" VALUES ('502582', 'Halfbeaks', 'Hyporhamphus');
INSERT INTO "public"."taxon" VALUES ('502666', 'Macolor', 'Macolor');
INSERT INTO "public"."taxon" VALUES ('502682', 'European/spotted seabass', 'Dicentrarchus');
INSERT INTO "public"."taxon" VALUES ('502724', 'Pacific salmon', 'Oncorhynchus');
INSERT INTO "public"."taxon" VALUES ('502730', 'Pontinus', 'Pontinus');
INSERT INTO "public"."taxon" VALUES ('502790', 'Kingcroakers', 'Menticirrhus');
INSERT INTO "public"."taxon" VALUES ('502794', 'Weakfishes', 'Cynoscion');
INSERT INTO "public"."taxon" VALUES ('502906', 'Flounders', 'Pseudorhombus');
INSERT INTO "public"."taxon" VALUES ('502996', 'Acanthocybium', 'Acanthocybium');
INSERT INTO "public"."taxon" VALUES ('503028', 'Cat groupers', 'Mycteroperca');
INSERT INTO "public"."taxon" VALUES ('503078', 'Chimaeras', 'Hydrolagus');
INSERT INTO "public"."taxon" VALUES ('503124', 'Megrims', 'Lepidorhombus');
INSERT INTO "public"."taxon" VALUES ('503128', 'Flounders', 'Rhombosolea');
INSERT INTO "public"."taxon" VALUES ('503152', 'Croakers', 'Pseudotolithus');
INSERT INTO "public"."taxon" VALUES ('503328', 'Lampfish', 'Notoscopelus');
INSERT INTO "public"."taxon" VALUES ('503456', 'Parupeneus', 'Parupeneus');
INSERT INTO "public"."taxon" VALUES ('503580', 'Large-eye breams', 'Gymnocranius');
INSERT INTO "public"."taxon" VALUES ('503663', 'Vimba', 'Vimba');
INSERT INTO "public"."taxon" VALUES ('503990', 'Bathylagus', 'Bathylagus');
INSERT INTO "public"."taxon" VALUES ('504054', 'Moray cods', 'Muraenolepis');
INSERT INTO "public"."taxon" VALUES ('504140', 'Frostfishes', 'Benthodesmus');
INSERT INTO "public"."taxon" VALUES ('504212', 'Liza', 'Liza');
INSERT INTO "public"."taxon" VALUES ('504872', 'Toothfishes', 'Dissostichus');
INSERT INTO "public"."taxon" VALUES ('504943', 'Pterygotrigla', 'Pterygotrigla');
INSERT INTO "public"."taxon" VALUES ('505460', 'Notolepis', 'Notolepis');
INSERT INTO "public"."taxon" VALUES ('505469', 'Indo-Pacific mackerels', 'Rastrelliger');
INSERT INTO "public"."taxon" VALUES ('505577', 'Hysteronotus', 'Hysteronotus');
INSERT INTO "public"."taxon" VALUES ('505586', 'Anchoviella', 'Anchoviella');
INSERT INTO "public"."taxon" VALUES ('505799', 'Southern soles', 'Austroglossus');
INSERT INTO "public"."taxon" VALUES ('505897', 'Wolffish', 'Anarhichas');
INSERT INTO "public"."taxon" VALUES ('506253', 'Whitefishes', 'Coregonus');
INSERT INTO "public"."taxon" VALUES ('507028', 'Mulloidichthys', 'Mulloidichthys');
INSERT INTO "public"."taxon" VALUES ('507278', 'Croakers', 'Otolithoides');
INSERT INTO "public"."taxon" VALUES ('507412', 'Croakers', 'Pennahia');
INSERT INTO "public"."taxon" VALUES ('507720', 'Indo-Pacific anchovies', 'Stolephorus');
INSERT INTO "public"."taxon" VALUES ('508611', 'Skates', 'Bathyraja');
INSERT INTO "public"."taxon" VALUES ('509125', 'Puffers', 'Sphoeroides');
INSERT INTO "public"."taxon" VALUES ('509206', 'Abudefduf', 'Abudefduf');
INSERT INTO "public"."taxon" VALUES ('509207', 'Acanthurus', 'Acanthurus');
INSERT INTO "public"."taxon" VALUES ('509232', 'Thryssa', 'Thryssa');
INSERT INTO "public"."taxon" VALUES ('509274', 'Electric rays', 'Torpedo');
INSERT INTO "public"."taxon" VALUES ('509279', 'Anguilla', 'Anguilla');
INSERT INTO "public"."taxon" VALUES ('509289', 'Halfbeaks', 'Hemiramphus');
INSERT INTO "public"."taxon" VALUES ('509303', 'Gunnels and forkbeards', 'Phycis');
INSERT INTO "public"."taxon" VALUES ('509309', 'Sargocentron', 'Sargocentron');
INSERT INTO "public"."taxon" VALUES ('509366', 'Antarctic rockcods', 'Trematomus');
INSERT INTO "public"."taxon" VALUES ('520007', 'Silver pomfrets', 'Pampus');
INSERT INTO "public"."taxon" VALUES ('590010', 'Common squids', 'Loligo');
INSERT INTO "public"."taxon" VALUES ('590011', 'Sepia', 'Sepia');
INSERT INTO "public"."taxon" VALUES ('590013', 'Octopuses', 'Octopus');
INSERT INTO "public"."taxon" VALUES ('590014', 'Cupped oysters', 'Crassostrea');
INSERT INTO "public"."taxon" VALUES ('590024', 'Horned and musky octopuses', 'Eledone');
INSERT INTO "public"."taxon" VALUES ('590046', 'Abalones', 'Haliotis');
INSERT INTO "public"."taxon" VALUES ('590049', 'Periwinkles', 'Littorina');
INSERT INTO "public"."taxon" VALUES ('590050', 'Murex shells', 'Murex');
INSERT INTO "public"."taxon" VALUES ('590051', 'Stromboid conchs', 'Strombus');
INSERT INTO "public"."taxon" VALUES ('590053', 'Turbo snails', 'Turbo');
INSERT INTO "public"."taxon" VALUES ('590060', 'Pacifastacus', 'Pacifastacus');
INSERT INTO "public"."taxon" VALUES ('590062', 'Blue crabs', 'Callinectes');
INSERT INTO "public"."taxon" VALUES ('590065', 'Pacific snow crabs', 'Chionoecetes');
INSERT INTO "public"."taxon" VALUES ('590067', 'Deepsea crabs', 'Geryon');
INSERT INTO "public"."taxon" VALUES ('590070', 'Lithodes', 'Lithodes');
INSERT INTO "public"."taxon" VALUES ('590073', 'King crabs', 'Paralithodes');
INSERT INTO "public"."taxon" VALUES ('590074', 'Paralomis', 'Paralomis');
INSERT INTO "public"."taxon" VALUES ('590075', 'Swims crabs', 'Portunus');
INSERT INTO "public"."taxon" VALUES ('590076', 'Scylla', 'Scylla');
INSERT INTO "public"."taxon" VALUES ('590079', 'Lobsterette', 'Metanephrops');
INSERT INTO "public"."taxon" VALUES ('590082', 'Spiny lobsters', 'Palinurus');
INSERT INTO "public"."taxon" VALUES ('590083', 'Tropical spiny lobsters', 'Panulirus');
INSERT INTO "public"."taxon" VALUES ('590085', 'Acetes', 'Acetes');
INSERT INTO "public"."taxon" VALUES ('590088', 'Sand shrimps', 'Crangon');
INSERT INTO "public"."taxon" VALUES ('590089', 'Knife shrimps', 'Haliporoides');
INSERT INTO "public"."taxon" VALUES ('590091', 'Metapenaeus shrimps', 'Metapenaeus');
INSERT INTO "public"."taxon" VALUES ('590092', 'Palaemon', 'Palaemon');
INSERT INTO "public"."taxon" VALUES ('590093', 'Pandalus shrimps', 'Pandalus');
INSERT INTO "public"."taxon" VALUES ('590094', 'Shrimps', 'Parapenaeopsis');
INSERT INTO "public"."taxon" VALUES ('590096', 'Penaeus shrimps', 'Penaeus');
INSERT INTO "public"."taxon" VALUES ('590103', 'Euphausia', 'Euphausia');
INSERT INTO "public"."taxon" VALUES ('590107', 'Goose barnacles', 'Lepas');
INSERT INTO "public"."taxon" VALUES ('590110', 'Whelks', 'Busycon');
INSERT INTO "public"."taxon" VALUES ('590111', 'Sea snails', 'Rapana');
INSERT INTO "public"."taxon" VALUES ('590112', 'Flat oysters', 'Ostrea');
INSERT INTO "public"."taxon" VALUES ('590116', 'Horse mussels', 'Modiolus');
INSERT INTO "public"."taxon" VALUES ('590117', 'Mussels', 'Mytilus');
INSERT INTO "public"."taxon" VALUES ('590120', 'Chlamys', 'Chlamys');
INSERT INTO "public"."taxon" VALUES ('590124', 'Anadara clams', 'Anadara');
INSERT INTO "public"."taxon" VALUES ('590125', 'Ark clams', 'Arca');
INSERT INTO "public"."taxon" VALUES ('590128', 'Donax clams', 'Donax');
INSERT INTO "public"."taxon" VALUES ('590129', 'Dosinia', 'Dosinia');
INSERT INTO "public"."taxon" VALUES ('590130', 'Ensis', 'Ensis');
INSERT INTO "public"."taxon" VALUES ('590134', 'Hard clams', 'Meretrix');
INSERT INTO "public"."taxon" VALUES ('590137', 'Taquilla clams', 'Mulinia');
INSERT INTO "public"."taxon" VALUES ('590139', 'Short neck clams', 'Paphia');
INSERT INTO "public"."taxon" VALUES ('590140', 'Protothaca', 'Protothaca');
INSERT INTO "public"."taxon" VALUES ('590141', 'Carpet shell', 'Ruditapes');
INSERT INTO "public"."taxon" VALUES ('590143', 'Arks', 'Scapharca');
INSERT INTO "public"."taxon" VALUES ('590145', 'Razor clams', 'Solen');
INSERT INTO "public"."taxon" VALUES ('590146', 'Surf clam', 'Spisula');
INSERT INTO "public"."taxon" VALUES ('590147', 'Tapes clams', 'Tapes');
INSERT INTO "public"."taxon" VALUES ('590148', 'Giant clams', 'Tridacna');
INSERT INTO "public"."taxon" VALUES ('590158', 'Sea urchins', 'Strongylocentrotus');
INSERT INTO "public"."taxon" VALUES ('590159', 'Rhopilema Jellyfishes', 'Rhopilema');
INSERT INTO "public"."taxon" VALUES ('590160', 'Pearl oyster shells', 'Pinctada');
INSERT INTO "public"."taxon" VALUES ('590195', 'Trochus', 'Trochus');
INSERT INTO "public"."taxon" VALUES ('590201', 'Hyas', 'Hyas');
INSERT INTO "public"."taxon" VALUES ('590242', 'Limpets', 'Patella');
INSERT INTO "public"."taxon" VALUES ('590244', 'Scyllarides', 'Scyllarides');
INSERT INTO "public"."taxon" VALUES ('590248', 'Ghost shimps', 'Callianassa');
INSERT INTO "public"."taxon" VALUES ('590252', 'Gondolas', 'Cymbium');
INSERT INTO "public"."taxon" VALUES ('590260', 'Sculptured shrimps', 'Sclerocrangon');
INSERT INTO "public"."taxon" VALUES ('590262', 'Tellins', 'Tellina');
INSERT INTO "public"."taxon" VALUES ('590269', 'Gaper clams', 'Tresus');
INSERT INTO "public"."taxon" VALUES ('590272', 'Indo-Pacific swimming crabs', 'Charybdis');
INSERT INTO "public"."taxon" VALUES ('590323', 'SPIDER CONCH', 'Lambis');
INSERT INTO "public"."taxon" VALUES ('590401', 'Jellyfishes', 'Stomolophus');
INSERT INTO "public"."taxon" VALUES ('590403', 'Scallops', 'Amusium');
INSERT INTO "public"."taxon" VALUES ('600003', 'Mozambique tilapia', 'Oreochromis mossambicus');
INSERT INTO "public"."taxon" VALUES ('600004', 'Anchoveta', 'Engraulis ringens');
INSERT INTO "public"."taxon" VALUES ('600005', 'Pigfish', 'Orthopristis chrysoptera');
INSERT INTO "public"."taxon" VALUES ('600006', 'Common dolphinfish', 'Coryphaena hippurus');
INSERT INTO "public"."taxon" VALUES ('600009', 'Starry triggerfish', 'Abalistes stellaris');
INSERT INTO "public"."taxon" VALUES ('600010', 'Indian threadfish', 'Alectis indica');
INSERT INTO "public"."taxon" VALUES ('600012', 'Graysby', 'Cephalopholis cruentata');
INSERT INTO "public"."taxon" VALUES ('600014', 'Rock hind', 'Epinephelus adscensionis');
INSERT INTO "public"."taxon" VALUES ('600015', 'Red hind', 'Epinephelus guttatus');
INSERT INTO "public"."taxon" VALUES ('600016', 'Goliath grouper', 'Epinephelus itajara');
INSERT INTO "public"."taxon" VALUES ('600017', 'Red grouper', 'Epinephelus morio');
INSERT INTO "public"."taxon" VALUES ('600018', 'Nassau grouper', 'Epinephelus striatus');
INSERT INTO "public"."taxon" VALUES ('600020', 'Argentine', 'Argentina sphyraena');
INSERT INTO "public"."taxon" VALUES ('600024', 'Atlantic herring', 'Clupea harengus');
INSERT INTO "public"."taxon" VALUES ('600025', 'Silvery pout', 'Gadiculus argenteus thori');
INSERT INTO "public"."taxon" VALUES ('600026', 'Witch flounder', 'Glyptocephalus cynoglossus');
INSERT INTO "public"."taxon" VALUES ('600027', 'Fourspotted megrim', 'Lepidorhombus boscii');
INSERT INTO "public"."taxon" VALUES ('600028', 'Megrim', 'Lepidorhombus whiffiagonis');
INSERT INTO "public"."taxon" VALUES ('600029', 'Whiting', 'Merlangius merlangus');
INSERT INTO "public"."taxon" VALUES ('600030', 'European hake', 'Merluccius merluccius');
INSERT INTO "public"."taxon" VALUES ('600031', 'Blue whiting', 'Micromesistius poutassou');
INSERT INTO "public"."taxon" VALUES ('600032', 'Thickback sole', 'Microchirus variegatus');
INSERT INTO "public"."taxon" VALUES ('600033', 'Ling', 'Molva molva');
INSERT INTO "public"."taxon" VALUES ('600034', 'Pollack', 'Pollachius pollachius');
INSERT INTO "public"."taxon" VALUES ('600035', 'European eel', 'Anguilla anguilla');
INSERT INTO "public"."taxon" VALUES ('600039', 'Transparent goby', 'Aphia minuta');
INSERT INTO "public"."taxon" VALUES ('600041', 'Scaldfish', 'Arnoglossus laterna');
INSERT INTO "public"."taxon" VALUES ('600044', 'East Atlantic red gurnard', 'Chelidonichthys cuculus');
INSERT INTO "public"."taxon" VALUES ('600045', 'Sand smelt', 'Atherina presbyter');
INSERT INTO "public"."taxon" VALUES ('600047', 'Garpike', 'Belone belone');
INSERT INTO "public"."taxon" VALUES ('600051', 'Tusk', 'Brosme brosme');
INSERT INTO "public"."taxon" VALUES ('600054', 'Boarfish', 'Capros aper');
INSERT INTO "public"."taxon" VALUES ('600056', 'Red bandfish', 'Cepola macrophthalma');
INSERT INTO "public"."taxon" VALUES ('600058', 'Mediterranean rainbow wrasse', 'Coris julis');
INSERT INTO "public"."taxon" VALUES ('600059', 'Corkwing wrasse', 'Symphodus melops');
INSERT INTO "public"."taxon" VALUES ('600061', 'Goldsinny-wrasse', 'Ctenolabrus rupestris');
INSERT INTO "public"."taxon" VALUES ('600062', 'Lumpsucker', 'Cyclopterus lumpus');
INSERT INTO "public"."taxon" VALUES ('600063', 'European seabass', 'Dicentrarchus labrax');
INSERT INTO "public"."taxon" VALUES ('600066', 'European anchovy', 'Engraulis encrasicolus');
INSERT INTO "public"."taxon" VALUES ('600068', 'Grey gurnard', 'Eutrigla gurnardus');
INSERT INTO "public"."taxon" VALUES ('600069', 'Atlantic cod', 'Gadus morhua');
INSERT INTO "public"."taxon" VALUES ('600071', 'Crevalle jack', 'Caranx hippos');
INSERT INTO "public"."taxon" VALUES ('600072', 'Black goby', 'Gobius niger');
INSERT INTO "public"."taxon" VALUES ('600076', 'Blackbelly rosefish', 'Helicolenus dactylopterus');
INSERT INTO "public"."taxon" VALUES ('600077', 'Indo-Pacific sailfish', 'Istiophorus platypterus');
INSERT INTO "public"."taxon" VALUES ('600078', 'Atlantic sailfish', 'Istiophorus albicans');
INSERT INTO "public"."taxon" VALUES ('600080', 'Milkfish', 'Chanos chanos');
INSERT INTO "public"."taxon" VALUES ('600081', 'Small toothed jobfish', 'Aphareus furca');
INSERT INTO "public"."taxon" VALUES ('600083', 'Rusty jobfish', 'Aphareus rutilans');
INSERT INTO "public"."taxon" VALUES ('600084', 'Green jobfish', 'Aprion virescens');
INSERT INTO "public"."taxon" VALUES ('600086', 'African forktail snapper', 'Apsilus fuscus');
INSERT INTO "public"."taxon" VALUES ('600087', 'Ruby snapper', 'Etelis carbunculus');
INSERT INTO "public"."taxon" VALUES ('600088', 'Porbeagle', 'Lamna nasus');
INSERT INTO "public"."taxon" VALUES ('600089', 'Wahoo', 'Acanthocybium solandri');
INSERT INTO "public"."taxon" VALUES ('600090', 'Basking shark', 'Cetorhinus maximus');
INSERT INTO "public"."taxon" VALUES ('600091', 'Slender tuna', 'Allothunnus fallai');
INSERT INTO "public"."taxon" VALUES ('600093', 'Bullet tuna', 'Auxis rochei rochei');
INSERT INTO "public"."taxon" VALUES ('600094', 'Frigate tuna', 'Auxis thazard thazard');
INSERT INTO "public"."taxon" VALUES ('600096', 'Kawakawa', 'Euthynnus affinis');
INSERT INTO "public"."taxon" VALUES ('600097', 'Little tunny', 'Euthynnus alletteratus');
INSERT INTO "public"."taxon" VALUES ('600098', 'Black skipjack', 'Euthynnus lineatus');
INSERT INTO "public"."taxon" VALUES ('600101', 'Allis shad', 'Alosa alosa');
INSERT INTO "public"."taxon" VALUES ('600104', 'Double-lined mackerel', 'Grammatorcynus bilineatus');
INSERT INTO "public"."taxon" VALUES ('600105', 'Pontic shad', 'Alosa immaculata');
INSERT INTO "public"."taxon" VALUES ('600106', 'Dogtooth tuna', 'Gymnosarda unicolor');
INSERT INTO "public"."taxon" VALUES ('600107', 'Skipjack tuna', 'Katsuwonus pelamis');
INSERT INTO "public"."taxon" VALUES ('600108', 'Plain bonito', 'Orcynopsis unicolor');
INSERT INTO "public"."taxon" VALUES ('600109', 'Short mackerel', 'Rastrelliger brachysoma');
INSERT INTO "public"."taxon" VALUES ('600111', 'Indian mackerel', 'Rastrelliger kanagurta');
INSERT INTO "public"."taxon" VALUES ('600113', 'Eastern Pacific bonito', 'Sarda chiliensis chiliensis');
INSERT INTO "public"."taxon" VALUES ('600114', 'Striped bonito', 'Sarda orientalis');
INSERT INTO "public"."taxon" VALUES ('600115', 'Atlantic bonito', 'Sarda sarda');
INSERT INTO "public"."taxon" VALUES ('600116', 'Blue mackerel', 'Scomber australasicus');
INSERT INTO "public"."taxon" VALUES ('600117', 'Chub mackerel', 'Scomber japonicus');
INSERT INTO "public"."taxon" VALUES ('600118', 'Atlantic mackerel', 'Scomber scombrus');
INSERT INTO "public"."taxon" VALUES ('600119', 'Serra Spanish mackerel', 'Scomberomorus brasiliensis');
INSERT INTO "public"."taxon" VALUES ('600120', 'King mackerel', 'Scomberomorus cavalla');
INSERT INTO "public"."taxon" VALUES ('600121', 'Narrow-barred Spanish mackerel', 'Scomberomorus commerson');
INSERT INTO "public"."taxon" VALUES ('600123', 'Indo-Pacific king mackerel', 'Scomberomorus guttatus');
INSERT INTO "public"."taxon" VALUES ('600125', 'Streaked seerfish', 'Scomberomorus lineolatus');
INSERT INTO "public"."taxon" VALUES ('600126', 'Spanish mackerel', 'Scomberomorus maculatus');
INSERT INTO "public"."taxon" VALUES ('600131', 'Japanese Spanish mackerel', 'Scomberomorus niphonius');
INSERT INTO "public"."taxon" VALUES ('600134', 'Cero', 'Scomberomorus regalis');
INSERT INTO "public"."taxon" VALUES ('600135', 'Broad-barred king mackerel', 'Scomberomorus semifasciatus');
INSERT INTO "public"."taxon" VALUES ('600136', 'Pacific sierra', 'Scomberomorus sierra');
INSERT INTO "public"."taxon" VALUES ('600138', 'Greenland shark', 'Somniosus microcephalus');
INSERT INTO "public"."taxon" VALUES ('600139', 'Piked dogfish', 'Squalus acanthias');
INSERT INTO "public"."taxon" VALUES ('600140', 'Chola guitarfish', 'Rhinobatos percellens');
INSERT INTO "public"."taxon" VALUES ('600141', 'West African Spanish mackerel', 'Scomberomorus tritor');
INSERT INTO "public"."taxon" VALUES ('600142', 'Albacore', 'Thunnus alalunga');
INSERT INTO "public"."taxon" VALUES ('600143', 'Yellowfin tuna', 'Thunnus albacares');
INSERT INTO "public"."taxon" VALUES ('600144', 'Blackfin tuna', 'Thunnus atlanticus');
INSERT INTO "public"."taxon" VALUES ('600145', 'Southern bluefin tuna', 'Thunnus maccoyii');
INSERT INTO "public"."taxon" VALUES ('600146', 'Bigeye tuna', 'Thunnus obesus');
INSERT INTO "public"."taxon" VALUES ('600147', 'Atlantic bluefin tuna', 'Thunnus thynnus');
INSERT INTO "public"."taxon" VALUES ('600148', 'Longtail tuna', 'Thunnus tonggol');
INSERT INTO "public"."taxon" VALUES ('600149', 'Pacific guitarfish', 'Rhinobatos planiceps');
INSERT INTO "public"."taxon" VALUES ('600152', 'Spotted rose snapper', 'Lutjanus guttatus');
INSERT INTO "public"."taxon" VALUES ('600154', 'Dog snapper', 'Lutjanus jocu');
INSERT INTO "public"."taxon" VALUES ('600155', 'Jordans snapper', 'Lutjanus jordani');
INSERT INTO "public"."taxon" VALUES ('600156', 'Common bluestripe snapper', 'Lutjanus kasmira');
INSERT INTO "public"."taxon" VALUES ('600159', 'Bigeye snapper', 'Lutjanus lutjanus');
INSERT INTO "public"."taxon" VALUES ('600162', 'Malabar blood snapper', 'Lutjanus malabaricus');
INSERT INTO "public"."taxon" VALUES ('600166', 'Onespot snapper', 'Lutjanus monostigma');
INSERT INTO "public"."taxon" VALUES ('600167', 'Cape elephantfish', 'Callorhinchus capensis');
INSERT INTO "public"."taxon" VALUES ('600170', 'Pacific red snapper', 'Lutjanus peru');
INSERT INTO "public"."taxon" VALUES ('600171', 'Southern red snapper', 'Lutjanus purpureus');
INSERT INTO "public"."taxon" VALUES ('600172', 'Five-lined snapper', 'Lutjanus quinquelineatus');
INSERT INTO "public"."taxon" VALUES ('600175', 'Ladyfish', 'Elops saurus');
INSERT INTO "public"."taxon" VALUES ('600176', 'Russell''s snapper', 'Lutjanus russellii');
INSERT INTO "public"."taxon" VALUES ('600181', 'Lane snapper', 'Lutjanus synagris');
INSERT INTO "public"."taxon" VALUES ('600185', 'Silk snapper', 'Lutjanus vivanus');
INSERT INTO "public"."taxon" VALUES ('600186', 'Midnight snapper', 'Macolor macularis');
INSERT INTO "public"."taxon" VALUES ('600187', 'Black and white snapper', 'Macolor niger');
INSERT INTO "public"."taxon" VALUES ('600188', 'Yellowtail snapper', 'Ocyurus chrysurus');
INSERT INTO "public"."taxon" VALUES ('600191', 'Saddle-back snapper', 'Paracaesio kusakarii');
INSERT INTO "public"."taxon" VALUES ('600192', 'Dirty ordure snapper', 'Paracaesio sordida');
INSERT INTO "public"."taxon" VALUES ('600193', 'Cocoa snapper', 'Paracaesio stonei');
INSERT INTO "public"."taxon" VALUES ('600194', 'Yellowtail blue snapper', 'Paracaesio xanthura');
INSERT INTO "public"."taxon" VALUES ('600199', 'Ornate jobfish', 'Pristipomoides argyrogrammicus');
INSERT INTO "public"."taxon" VALUES ('600200', 'Goldflag jobfish', 'Pristipomoides auricilla');
INSERT INTO "public"."taxon" VALUES ('600201', 'Crimson jobfish', 'Pristipomoides filamentosus');
INSERT INTO "public"."taxon" VALUES ('600202', 'Golden eye jobfish', 'Pristipomoides flavipinnis');
INSERT INTO "public"."taxon" VALUES ('600203', 'Bogue', 'Boops boops');
INSERT INTO "public"."taxon" VALUES ('600204', 'Salema', 'Sarpa salpa');
INSERT INTO "public"."taxon" VALUES ('600206', 'Cardinal snapper', 'Pristipomoides macrophthalmus');
INSERT INTO "public"."taxon" VALUES ('600207', 'Wide-eyed flounder', 'Bothus podas');
INSERT INTO "public"."taxon" VALUES ('600208', 'Goldbanded jobfish', 'Pristipomoides multidens');
INSERT INTO "public"."taxon" VALUES ('600209', 'Lavender jobfish', 'Pristipomoides sieboldii');
INSERT INTO "public"."taxon" VALUES ('600211', 'Oblique-banded snapper', 'Pristipomoides zonatus');
INSERT INTO "public"."taxon" VALUES ('600213', 'Vermilion snapper', 'Rhomboplites aurorubens');
INSERT INTO "public"."taxon" VALUES ('600214', 'Sailfin snapper', 'Symphorichthys spilurus');
INSERT INTO "public"."taxon" VALUES ('600216', 'Atlantic blue marlin', 'Makaira nigricans');
INSERT INTO "public"."taxon" VALUES ('600217', 'Black marlin', 'Makaira indica');
INSERT INTO "public"."taxon" VALUES ('600218', 'Indo-Pacific blue marlin', 'Makaira mazara');
INSERT INTO "public"."taxon" VALUES ('600219', 'Atlantic white marlin', 'Tetrapturus albidus');
INSERT INTO "public"."taxon" VALUES ('600220', 'Longbill spearfish', 'Tetrapturus pfluegeri');
INSERT INTO "public"."taxon" VALUES ('600223', 'Striped marlin', 'Tetrapturus audax');
INSERT INTO "public"."taxon" VALUES ('600226', 'Swordfish', 'Xiphias gladius');
INSERT INTO "public"."taxon" VALUES ('600227', 'Indo-Pacific tarpon', 'Megalops cyprinoides');
INSERT INTO "public"."taxon" VALUES ('600228', 'Bonefish', 'Albula vulpes');
INSERT INTO "public"."taxon" VALUES ('600229', 'Longfin bonefish', 'Pterothrissus belloci');
INSERT INTO "public"."taxon" VALUES ('600230', 'Baird''s slickhead', 'Alepocephalus bairdii');
INSERT INTO "public"."taxon" VALUES ('600231', 'Vendace', 'Coregonus albula');
INSERT INTO "public"."taxon" VALUES ('600232', 'European whitefish', 'Coregonus lavaretus');
INSERT INTO "public"."taxon" VALUES ('600233', 'Houting', 'Coregonus oxyrinchus');
INSERT INTO "public"."taxon" VALUES ('600236', 'Atlantic salmon', 'Salmo salar');
INSERT INTO "public"."taxon" VALUES ('600238', 'Sea trout', 'Salmo trutta trutta');
INSERT INTO "public"."taxon" VALUES ('600239', 'Rainbow trout', 'Oncorhynchus mykiss');
INSERT INTO "public"."taxon" VALUES ('600240', 'Pink salmon', 'Oncorhynchus gorbuscha');
INSERT INTO "public"."taxon" VALUES ('600241', 'Chum salmon', 'Oncorhynchus keta');
INSERT INTO "public"."taxon" VALUES ('600242', 'Cherry salmon', 'Oncorhynchus masou masou');
INSERT INTO "public"."taxon" VALUES ('600243', 'Sockeye salmon', 'Oncorhynchus nerka');
INSERT INTO "public"."taxon" VALUES ('600244', 'Chinook salmon', 'Oncorhynchus tshawytscha');
INSERT INTO "public"."taxon" VALUES ('600245', 'Coho salmon', 'Oncorhynchus kisutch');
INSERT INTO "public"."taxon" VALUES ('600246', 'Brook trout', 'Salvelinus fontinalis');
INSERT INTO "public"."taxon" VALUES ('600247', 'Arctic char', 'Salvelinus alpinus alpinus');
INSERT INTO "public"."taxon" VALUES ('600249', 'Rudderfish', 'Centrolophus niger');
INSERT INTO "public"."taxon" VALUES ('600250', 'Imperial blackfish', 'Schedophilus ovalis');
INSERT INTO "public"."taxon" VALUES ('600251', 'Ayu sweetfish', 'Plecoglossus altivelis altivelis');
INSERT INTO "public"."taxon" VALUES ('600252', 'Capelin', 'Mallotus villosus');
INSERT INTO "public"."taxon" VALUES ('600253', 'Rainbow smelt', 'Osmerus mordax mordax');
INSERT INTO "public"."taxon" VALUES ('600255', 'Surf smelt', 'Hypomesus pretiosus');
INSERT INTO "public"."taxon" VALUES ('600256', 'Eulachon', 'Thaleichthys pacificus');
INSERT INTO "public"."taxon" VALUES ('600257', 'Deepsea smelt', 'Glossanodon semifasciatus');
INSERT INTO "public"."taxon" VALUES ('600258', 'Northern pike', 'Esox lucius');
INSERT INTO "public"."taxon" VALUES ('600259', 'Hectors lanternfish', 'Lampanyctodes hectoris');
INSERT INTO "public"."taxon" VALUES ('600260', 'Bombay duck', 'Harpadon nehereus');
INSERT INTO "public"."taxon" VALUES ('600261', 'Dory snapper', 'Lutjanus fulviflamma');
INSERT INTO "public"."taxon" VALUES ('600262', 'Blacktail snapper', 'Lutjanus fulvus');
INSERT INTO "public"."taxon" VALUES ('600264', 'Johns snapper', 'Lutjanus johnii');
INSERT INTO "public"."taxon" VALUES ('600265', 'Humpback red snapper', 'Lutjanus gibbus');
INSERT INTO "public"."taxon" VALUES ('600266', 'Grey snapper', 'Lutjanus griseus');
INSERT INTO "public"."taxon" VALUES ('600269', 'Tench', 'Tinca tinca');
INSERT INTO "public"."taxon" VALUES ('600270', 'Crucian carp', 'Carassius carassius');
INSERT INTO "public"."taxon" VALUES ('600272', 'Roach', 'Rutilus rutilus');
INSERT INTO "public"."taxon" VALUES ('600274', 'Silver carp', 'Hypophthalmichthys molitrix');
INSERT INTO "public"."taxon" VALUES ('600275', 'Bighead carp', 'Hypophthalmichthys nobilis');
INSERT INTO "public"."taxon" VALUES ('600283', 'Ziege', 'Pelecus cultratus');
INSERT INTO "public"."taxon" VALUES ('600286', 'Silver barb', 'Barbonymus gonionotus');
INSERT INTO "public"."taxon" VALUES ('600288', 'White baggar', 'Galeichthys feliceps');
INSERT INTO "public"."taxon" VALUES ('600289', 'Wels catfish', 'Silurus glanis');
INSERT INTO "public"."taxon" VALUES ('600298', 'Daggertooth pike conger', 'Muraenesox cinereus');
INSERT INTO "public"."taxon" VALUES ('600299', 'Argentine conger', 'Conger orbignianus');
INSERT INTO "public"."taxon" VALUES ('600300', 'American conger', 'Conger oceanicus');
INSERT INTO "public"."taxon" VALUES ('600301', 'European conger', 'Conger conger');
INSERT INTO "public"."taxon" VALUES ('600302', 'Whitespotted conger', 'Conger myriaster');
INSERT INTO "public"."taxon" VALUES ('600303', 'Pacific saury', 'Cololabis saira');
INSERT INTO "public"."taxon" VALUES ('600305', 'Japanese halfbeak', 'Hyporhamphus sajori');
INSERT INTO "public"."taxon" VALUES ('600306', 'Tadpole codling', 'Salilota australis');
INSERT INTO "public"."taxon" VALUES ('600308', 'Pacific cod', 'Gadus macrocephalus');
INSERT INTO "public"."taxon" VALUES ('600309', 'Greenland cod', 'Gadus ogac');
INSERT INTO "public"."taxon" VALUES ('600310', 'Burbot', 'Lota lota');
INSERT INTO "public"."taxon" VALUES ('600311', 'Brazilian codling', 'Urophycis brasiliensis');
INSERT INTO "public"."taxon" VALUES ('600312', 'Red hake', 'Urophycis chuss');
INSERT INTO "public"."taxon" VALUES ('600313', 'White hake', 'Urophycis tenuis');
INSERT INTO "public"."taxon" VALUES ('600314', 'Navaga', 'Eleginus nawaga');
INSERT INTO "public"."taxon" VALUES ('600315', 'Saffron cod', 'Eleginus gracilis');
INSERT INTO "public"."taxon" VALUES ('600316', 'Atlantic tomcod', 'Microgadus tomcod');
INSERT INTO "public"."taxon" VALUES ('600318', 'Alaska Pollock', 'Theragra chalcogramma');
INSERT INTO "public"."taxon" VALUES ('600319', 'Polar cod', 'Boreogadus saida');
INSERT INTO "public"."taxon" VALUES ('600320', 'Southern blue whiting', 'Micromesistius australis');
INSERT INTO "public"."taxon" VALUES ('600321', 'Senegalese hake', 'Merluccius senegalensis');
INSERT INTO "public"."taxon" VALUES ('600322', 'Southern hake', 'Merluccius australis');
INSERT INTO "public"."taxon" VALUES ('600323', 'Silver hake', 'Merluccius bilinearis');
INSERT INTO "public"."taxon" VALUES ('600324', 'South Pacific hake', 'Merluccius gayi gayi');
INSERT INTO "public"."taxon" VALUES ('600325', 'Argentine hake', 'Merluccius hubbsi');
INSERT INTO "public"."taxon" VALUES ('600326', 'North Pacific hake', 'Merluccius productus');
INSERT INTO "public"."taxon" VALUES ('600327', 'Benguela hake', 'Merluccius polli');
INSERT INTO "public"."taxon" VALUES ('600329', 'Patagonian grenadier', 'Macruronus magellanicus');
INSERT INTO "public"."taxon" VALUES ('600331', 'Onion-eye grenadier', 'Macrourus berglax');
INSERT INTO "public"."taxon" VALUES ('600332', 'Roundnose grenadier', 'Coryphaenoides rupestris');
INSERT INTO "public"."taxon" VALUES ('600333', 'Longspine snipefish', 'Macroramphosus scolopax');
INSERT INTO "public"."taxon" VALUES ('600334', 'Orange roughy', 'Hoplostethus atlanticus');
INSERT INTO "public"."taxon" VALUES ('600336', 'Silvery John dory', 'Zenopsis conchifer');
INSERT INTO "public"."taxon" VALUES ('600338', 'Bobo mullet', 'Joturus pichardi');
INSERT INTO "public"."taxon" VALUES ('600339', 'Atlantic silverside', 'Menidia menidia');
INSERT INTO "public"."taxon" VALUES ('600340', 'Fourfinger threadfin', 'Eleutheronema tetradactylum');
INSERT INTO "public"."taxon" VALUES ('600341', 'Lesser African threadfin', 'Galeoides decadactylus');
INSERT INTO "public"."taxon" VALUES ('600342', 'Royal threadfin', 'Pentanemus quinquarius');
INSERT INTO "public"."taxon" VALUES ('600344', 'Indonesian snakehead', 'Channa micropeltes');
INSERT INTO "public"."taxon" VALUES ('600345', 'Common snook', 'Centropomus undecimalis');
INSERT INTO "public"."taxon" VALUES ('600346', 'Barramundi', 'Lates calcarifer');
INSERT INTO "public"."taxon" VALUES ('600348', 'Spotted grouper', 'Epinephelus analogus');
INSERT INTO "public"."taxon" VALUES ('600349', 'Wreckfish', 'Polyprion americanus');
INSERT INTO "public"."taxon" VALUES ('600350', 'Hapuka', 'Polyprion oxygeneios');
INSERT INTO "public"."taxon" VALUES ('600351', 'Sea bass', 'Acanthistius brasilianus');
INSERT INTO "public"."taxon" VALUES ('600352', 'Peruvian rock seabass', 'Paralabrax humeralis');
INSERT INTO "public"."taxon" VALUES ('600353', 'Striped sea-bass', 'Morone saxatilis');
INSERT INTO "public"."taxon" VALUES ('600355', 'White perch', 'Morone americana');
INSERT INTO "public"."taxon" VALUES ('600356', 'Red bigeye', 'Priacanthus macracanthus');
INSERT INTO "public"."taxon" VALUES ('600357', 'Japanese splitfin', 'Synagrops japonicus');
INSERT INTO "public"."taxon" VALUES ('600358', 'European perch', 'Perca fluviatilis');
INSERT INTO "public"."taxon" VALUES ('600360', 'Pike-perch', 'Sander lucioperca');
INSERT INTO "public"."taxon" VALUES ('600361', 'Black seabass', 'Centropristis striata');
INSERT INTO "public"."taxon" VALUES ('600362', 'Great northern tilefish', 'Lopholatilus chamaeleonticeps');
INSERT INTO "public"."taxon" VALUES ('600363', 'False trevally', 'Lactarius lactarius');
INSERT INTO "public"."taxon" VALUES ('600364', 'Bluefish', 'Pomatomus saltatrix');
INSERT INTO "public"."taxon" VALUES ('600366', 'Japanese jack mackerel', 'Trachurus japonicus');
INSERT INTO "public"."taxon" VALUES ('600367', 'Inca scad', 'Trachurus murphyi');
INSERT INTO "public"."taxon" VALUES ('600368', 'Pacific jack mackerel', 'Trachurus symmetricus');
INSERT INTO "public"."taxon" VALUES ('600369', 'Rough scad', 'Trachurus lathami');
INSERT INTO "public"."taxon" VALUES ('600371', 'Cunene horse mackerel', 'Trachurus trecae');
INSERT INTO "public"."taxon" VALUES ('600372', 'Greenback horse mackerel', 'Trachurus declivis');
INSERT INTO "public"."taxon" VALUES ('600374', 'Indian scad', 'Decapterus russelli');
INSERT INTO "public"."taxon" VALUES ('600378', 'Atlantic moonfish', 'Selene setapinnis');
INSERT INTO "public"."taxon" VALUES ('600379', 'African moonfish', 'Selene dorsalis');
INSERT INTO "public"."taxon" VALUES ('600380', 'Florida pompano', 'Trachinotus carolinus');
INSERT INTO "public"."taxon" VALUES ('600381', 'Japanese amberjack', 'Seriola quinqueradiata');
INSERT INTO "public"."taxon" VALUES ('600382', 'Yellowtail amberjack', 'Seriola lalandi');
INSERT INTO "public"."taxon" VALUES ('600384', 'Torpedo scad', 'Megalaspis cordyla');
INSERT INTO "public"."taxon" VALUES ('600385', 'Atlantic bumper', 'Chloroscombrus chrysurus');
INSERT INTO "public"."taxon" VALUES ('600386', 'Parona leatherjacket', 'Parona signata');
INSERT INTO "public"."taxon" VALUES ('600387', 'Bigeye scad', 'Selar crumenophthalmus');
INSERT INTO "public"."taxon" VALUES ('600388', 'Yellowstripe scad', 'Selaroides leptolepis');
INSERT INTO "public"."taxon" VALUES ('600390', 'Moonfish', 'Mene maculata');
INSERT INTO "public"."taxon" VALUES ('600391', 'Atlantic pomfret', 'Brama brama');
INSERT INTO "public"."taxon" VALUES ('600392', 'Australian ruff', 'Arripis georgianus');
INSERT INTO "public"."taxon" VALUES ('600394', 'Spotted seabass', 'Dicentrarchus punctatus');
INSERT INTO "public"."taxon" VALUES ('600395', 'Redbait', 'Emmelichthys nitidus nitidus');
INSERT INTO "public"."taxon" VALUES ('600396', 'Golden threadfin bream', 'Nemipterus virgatus');
INSERT INTO "public"."taxon" VALUES ('600397', 'Cabinza grunt', 'Isacia conceptionis');
INSERT INTO "public"."taxon" VALUES ('600398', 'Rubberlip grunt', 'Plectorhinchus mediterraneus');
INSERT INTO "public"."taxon" VALUES ('600399', 'Silver grunt', 'Pomadasys argenteus');
INSERT INTO "public"."taxon" VALUES ('600400', 'Bigeye grunt', 'Brachydeuterus auritus');
INSERT INTO "public"."taxon" VALUES ('600401', 'Barred grunt', 'Conodon nobilis');
INSERT INTO "public"."taxon" VALUES ('600403', 'Peruvian weakfish', 'Cynoscion analis');
INSERT INTO "public"."taxon" VALUES ('600405', 'Spotted weakfish', 'Cynoscion nebulosus');
INSERT INTO "public"."taxon" VALUES ('600406', 'Gray weakfish', 'Cynoscion regalis');
INSERT INTO "public"."taxon" VALUES ('600407', 'South American striped weakfish', 'Cynoscion striatus');
INSERT INTO "public"."taxon" VALUES ('600408', 'Atlantic croaker', 'Micropogonias undulatus');
INSERT INTO "public"."taxon" VALUES ('600409', 'Southern kingcroaker', 'Menticirrhus americanus');
INSERT INTO "public"."taxon" VALUES ('600410', 'Northern kingcroaker', 'Menticirrhus saxatilis');
INSERT INTO "public"."taxon" VALUES ('600411', 'Gulf kingcroaker', 'Menticirrhus littoralis');
INSERT INTO "public"."taxon" VALUES ('600412', 'Rainbow runner', 'Elagatis bipinnulata');
INSERT INTO "public"."taxon" VALUES ('600413', 'Argentine croaker', 'Umbrina canosai');
INSERT INTO "public"."taxon" VALUES ('600416', 'Yellow croaker', 'Larimichthys polyactis');
INSERT INTO "public"."taxon" VALUES ('600417', 'King weakfish', 'Macrodon ancylodon');
INSERT INTO "public"."taxon" VALUES ('600418', 'Meagre', 'Argyrosomus regius');
INSERT INTO "public"."taxon" VALUES ('600419', 'Southern meagre', 'Argyrosomus hololepidotus');
INSERT INTO "public"."taxon" VALUES ('600420', 'Geelbeck croaker', 'Atractoscion aequidens');
INSERT INTO "public"."taxon" VALUES ('600422', 'White croaker', 'Genyonemus lineatus');
INSERT INTO "public"."taxon" VALUES ('600423', 'Boe drum', 'Pteroscion peli');
INSERT INTO "public"."taxon" VALUES ('600424', 'Peruvian banded croaker', 'Paralonchurus peruanus');
INSERT INTO "public"."taxon" VALUES ('600425', 'Black drum', 'Pogonias cromis');
INSERT INTO "public"."taxon" VALUES ('600426', 'White grouper', 'Epinephelus aeneus');
INSERT INTO "public"."taxon" VALUES ('600427', 'Nibe croaker', 'Nibea mitsukurii');
INSERT INTO "public"."taxon" VALUES ('600428', 'Large yellow croaker', 'Larimichthys crocea');
INSERT INTO "public"."taxon" VALUES ('600429', 'Spot croaker', 'Leiostomus xanthurus');
INSERT INTO "public"."taxon" VALUES ('600432', 'Cassava croaker', 'Pseudotolithus senegalensis');
INSERT INTO "public"."taxon" VALUES ('600433', 'Bobo croaker', 'Pseudotolithus elongatus');
INSERT INTO "public"."taxon" VALUES ('600434', 'White croaker', 'Pennahia argentata');
INSERT INTO "public"."taxon" VALUES ('600436', 'Red pandora', 'Pagellus bellottii');
INSERT INTO "public"."taxon" VALUES ('600438', 'Large-eye dentex', 'Dentex macrophthalmus');
INSERT INTO "public"."taxon" VALUES ('600439', 'Common dentex', 'Dentex dentex');
INSERT INTO "public"."taxon" VALUES ('600440', 'Angola dentex', 'Dentex angolensis');
INSERT INTO "public"."taxon" VALUES ('600441', 'Sheepshead seabream', 'Archosargus probatocephalus');
INSERT INTO "public"."taxon" VALUES ('600442', 'King soldierbream', 'Argyrops spinifer');
INSERT INTO "public"."taxon" VALUES ('600443', 'Carpenter seabream', 'Argyrozona argyrozona');
INSERT INTO "public"."taxon" VALUES ('600444', 'Santer seabream', 'Cheimerius nufar');
INSERT INTO "public"."taxon" VALUES ('600445', 'Red seabream', 'Pagrus major');
INSERT INTO "public"."taxon" VALUES ('600447', 'Red steenbras', 'Petrus rupestris');
INSERT INTO "public"."taxon" VALUES ('600448', 'Panga seabream', 'Pterogymnus laniarius');
INSERT INTO "public"."taxon" VALUES ('600449', 'White stumpnose', 'Rhabdosargus globiceps');
INSERT INTO "public"."taxon" VALUES ('600450', 'White steenbras', 'Lithognathus lithognathus');
INSERT INTO "public"."taxon" VALUES ('600452', 'Scup', 'Stenotomus chrysops');
INSERT INTO "public"."taxon" VALUES ('600453', 'West African goatfish', 'Pseudupeneus prayensis');
INSERT INTO "public"."taxon" VALUES ('600454', 'Spotted sicklefish', 'Drepane punctata');
INSERT INTO "public"."taxon" VALUES ('600458', 'Tautog', 'Tautoga onitis');
INSERT INTO "public"."taxon" VALUES ('600460', 'White morwong', 'Nemadactylus bergi');
INSERT INTO "public"."taxon" VALUES ('600461', 'Peruvian morwong', 'Cheilodactylus variegatus');
INSERT INTO "public"."taxon" VALUES ('600463', 'Sailfin sandfish', 'Arctoscopus japonicus');
INSERT INTO "public"."taxon" VALUES ('600464', 'Blue cod', 'Parapercis colias');
INSERT INTO "public"."taxon" VALUES ('600465', 'Brazilian flathead', 'Percophis brasiliensis');
INSERT INTO "public"."taxon" VALUES ('600466', 'Patagonian blennie', 'Eleginops maclovinus');
INSERT INTO "public"."taxon" VALUES ('600467', 'Patagonian toothfish', 'Dissostichus eleginoides');
INSERT INTO "public"."taxon" VALUES ('600468', 'Marbled rockcod', 'Notothenia rossii');
INSERT INTO "public"."taxon" VALUES ('600472', 'Antarctic silverfish', 'Pleuragramma antarctica');
INSERT INTO "public"."taxon" VALUES ('600473', 'Blackfin icefish', 'Chaenocephalus aceratus');
INSERT INTO "public"."taxon" VALUES ('600474', 'Mackerel icefish', 'Champsocephalus gunnari');
INSERT INTO "public"."taxon" VALUES ('600475', 'South Georgia icefish', 'Pseudochaenichthys georgianus');
INSERT INTO "public"."taxon" VALUES ('600476', 'Ocellated icefish', 'Chionodraco rastrospinosus');
INSERT INTO "public"."taxon" VALUES ('600477', 'Unicorn icefish', 'Channichthys rhinoceratus');
INSERT INTO "public"."taxon" VALUES ('600478', 'Spiny icefish', 'Chaenodraco wilsoni');
INSERT INTO "public"."taxon" VALUES ('600479', 'Viviparous blenny', 'Zoarces viviparus');
INSERT INTO "public"."taxon" VALUES ('600480', 'Ocean pout', 'Zoarces americanus');
INSERT INTO "public"."taxon" VALUES ('600481', 'Poor cod', 'Trisopterus minutus');
INSERT INTO "public"."taxon" VALUES ('600482', 'Pink cusk-eel', 'Genypterus blacodes');
INSERT INTO "public"."taxon" VALUES ('600483', 'Red cusk-eel', 'Genypterus chilensis');
INSERT INTO "public"."taxon" VALUES ('600484', 'Black cusk-eel', 'Genypterus maculatus');
INSERT INTO "public"."taxon" VALUES ('600485', 'Kingklip', 'Genypterus capensis');
INSERT INTO "public"."taxon" VALUES ('600486', 'Bearded brotula', 'Brotula barbata');
INSERT INTO "public"."taxon" VALUES ('600487', 'Pacific sandeel', 'Ammodytes personatus');
INSERT INTO "public"."taxon" VALUES ('600488', 'Korean sandeel', 'Hypoptychus dybowskii');
INSERT INTO "public"."taxon" VALUES ('600489', 'Snoek', 'Thyrsites atun');
INSERT INTO "public"."taxon" VALUES ('600490', 'White snake mackerel', 'Thyrsitops lepidopoides');
INSERT INTO "public"."taxon" VALUES ('600491', 'Silver pomfret', 'Pampus argenteus');
INSERT INTO "public"."taxon" VALUES ('600492', 'American butterfish', 'Peprilus triacanthus');
INSERT INTO "public"."taxon" VALUES ('600493', 'Pacific pompano', 'Peprilus simillimus');
INSERT INTO "public"."taxon" VALUES ('600496', 'Antarctic butterfish', 'Hyperoglyphe antarctica');
INSERT INTO "public"."taxon" VALUES ('600497', 'Melon seed', 'Psenopsis anomala');
INSERT INTO "public"."taxon" VALUES ('600501', 'Ocean perch', 'Sebastes marinus');
INSERT INTO "public"."taxon" VALUES ('600502', 'Widow rockfish', 'Sebastes entomelas');
INSERT INTO "public"."taxon" VALUES ('600503', 'Yellowtail rockfish', 'Sebastes flavidus');
INSERT INTO "public"."taxon" VALUES ('600504', 'Pacific ocean perch', 'Sebastes alutus');
INSERT INTO "public"."taxon" VALUES ('600505', 'Deepwater redfish', 'Sebastes mentella');
INSERT INTO "public"."taxon" VALUES ('600507', 'Bluefin gurnard', 'Chelidonichthys kumu');
INSERT INTO "public"."taxon" VALUES ('600508', 'Latchet', 'Pterygotrigla polyommata');
INSERT INTO "public"."taxon" VALUES ('600509', 'Lingcod', 'Ophiodon elongatus');
INSERT INTO "public"."taxon" VALUES ('600510', 'Okhostk atka mackerel', 'Pleurogrammus azonus');
INSERT INTO "public"."taxon" VALUES ('600512', 'Sablefish', 'Anoplopoma fimbria');
INSERT INTO "public"."taxon" VALUES ('600513', 'Indian spiny turbot', 'Psettodes erumei');
INSERT INTO "public"."taxon" VALUES ('600514', 'Pacific halibut', 'Hippoglossus stenolepis');
INSERT INTO "public"."taxon" VALUES ('600516', 'Greenland halibut', 'Reinhardtius hippoglossoides');
INSERT INTO "public"."taxon" VALUES ('600517', 'Arrowtooth flounder', 'Atheresthes stomias');
INSERT INTO "public"."taxon" VALUES ('600518', 'Kamchatka flounder', 'Atheresthes evermanni');
INSERT INTO "public"."taxon" VALUES ('600519', 'Flathead sole', 'Hippoglossoides elassodon');
INSERT INTO "public"."taxon" VALUES ('600520', 'Yellowfin sole', 'Limanda aspera');
INSERT INTO "public"."taxon" VALUES ('600521', 'Yellowtail flounder', 'Limanda ferruginea');
INSERT INTO "public"."taxon" VALUES ('600524', 'Winter flounder', 'Pseudopleuronectes americanus');
INSERT INTO "public"."taxon" VALUES ('600525', 'Common sole', 'Solea solea');
INSERT INTO "public"."taxon" VALUES ('600526', 'Wedge sole', 'Dicologlossa cuneata');
INSERT INTO "public"."taxon" VALUES ('600527', 'West coast sole', 'Austroglossus microlepis');
INSERT INTO "public"."taxon" VALUES ('600528', 'Mud sole', 'Austroglossus pectoralis');
INSERT INTO "public"."taxon" VALUES ('600529', 'Brill', 'Scophthalmus rhombus');
INSERT INTO "public"."taxon" VALUES ('600530', 'Windowpane', 'Scophthalmus aquosus');
INSERT INTO "public"."taxon" VALUES ('600531', 'Thread-sail filefish', 'Stephanolepis cirrhifer');
INSERT INTO "public"."taxon" VALUES ('600532', 'American angler', 'Lophius americanus');
INSERT INTO "public"."taxon" VALUES ('600545', 'Bay anchovy', 'Anchoa mitchilli');
INSERT INTO "public"."taxon" VALUES ('600547', 'Atlantic anchoveta', 'Cetengraulis edentulus');
INSERT INTO "public"."taxon" VALUES ('600548', 'Pacific anchoveta', 'Cetengraulis mysticetus');
INSERT INTO "public"."taxon" VALUES ('600555', 'Devis anchovy', 'Encrasicholina devisi');
INSERT INTO "public"."taxon" VALUES ('600556', 'Shorthead anchovy', 'Encrasicholina heteroloba');
INSERT INTO "public"."taxon" VALUES ('600558', 'Buccaneer anchovy', 'Encrasicholina punctifer');
INSERT INTO "public"."taxon" VALUES ('600569', 'Indian anchovy', 'Stolephorus indicus');
INSERT INTO "public"."taxon" VALUES ('600571', 'Hardenbergs anchovy', 'Stolephorus insularis');
INSERT INTO "public"."taxon" VALUES ('600572', 'Ballan wrasse', 'Labrus bergylta');
INSERT INTO "public"."taxon" VALUES ('600575', 'Pacific anchovy', 'Stolephorus pacificus');
INSERT INTO "public"."taxon" VALUES ('600636', 'Sharpnose sevengill shark', 'Heptranchias perlo');
INSERT INTO "public"."taxon" VALUES ('600637', 'Bluntnose sixgill shark', 'Hexanchus griseus');
INSERT INTO "public"."taxon" VALUES ('600641', 'Bramble shark', 'Echinorhinus brucus');
INSERT INTO "public"."taxon" VALUES ('600645', 'Silver scabbardfish', 'Lepidopus caudatus');
INSERT INTO "public"."taxon" VALUES ('600646', 'Black scabbardfish', 'Aphanopus carbo');
INSERT INTO "public"."taxon" VALUES ('600648', 'Gulper shark', 'Centrophorus granulosus');
INSERT INTO "public"."taxon" VALUES ('600650', 'Lowfin gulper shark', 'Centrophorus lusitanicus');
INSERT INTO "public"."taxon" VALUES ('600653', 'Leafscale gulper shark', 'Centrophorus squamosus');
INSERT INTO "public"."taxon" VALUES ('600656', 'Black dogfish', 'Centroscyllium fabricii');
INSERT INTO "public"."taxon" VALUES ('600662', 'Portuguese dogfish', 'Centroscymnus coelolepis');
INSERT INTO "public"."taxon" VALUES ('600663', 'Longnose velvet dogfish', 'Centroscymnus crepidater');
INSERT INTO "public"."taxon" VALUES ('600664', 'Shortnose velvet dogfish', 'Centroscymnus cryptacanthus');
INSERT INTO "public"."taxon" VALUES ('600669', 'Kitefin shark', 'Dalatias licha');
INSERT INTO "public"."taxon" VALUES ('600670', 'Birdbeak dogfish', 'Deania calcea');
INSERT INTO "public"."taxon" VALUES ('600671', 'Rough longnose dogfish', 'Deania hystricosa');
INSERT INTO "public"."taxon" VALUES ('600679', 'Southern lanternshark', 'Etmopterus granulosus');
INSERT INTO "public"."taxon" VALUES ('600687', 'Velvet belly lantern shark', 'Etmopterus spinax');
INSERT INTO "public"."taxon" VALUES ('600692', 'Leerfish', 'Lichia amia');
INSERT INTO "public"."taxon" VALUES ('600695', 'Dab', 'Limanda limanda');
INSERT INTO "public"."taxon" VALUES ('600700', 'Knifetooth dogfish', 'Scymnodon ringens');
INSERT INTO "public"."taxon" VALUES ('600704', 'Little sleeper shark', 'Somniosus rostratus');
INSERT INTO "public"."taxon" VALUES ('600706', 'Striped seabream', 'Lithognathus mormyrus');
INSERT INTO "public"."taxon" VALUES ('600716', 'Angler', 'Lophius piscatorius');
INSERT INTO "public"."taxon" VALUES ('600718', 'Angular roughshark', 'Oxynotus centrina');
INSERT INTO "public"."taxon" VALUES ('600719', 'Sailfin roughshark', 'Oxynotus paradoxus');
INSERT INTO "public"."taxon" VALUES ('600727', 'Argentine angelshark', 'Squatina argentina');
INSERT INTO "public"."taxon" VALUES ('600736', 'Angelshark', 'Squatina squatina');
INSERT INTO "public"."taxon" VALUES ('600747', 'Sand tiger shark', 'Carcharias taurus');
INSERT INTO "public"."taxon" VALUES ('600751', 'Great white shark', 'Carcharodon carcharias');
INSERT INTO "public"."taxon" VALUES ('600752', 'Shortfin mako', 'Isurus oxyrinchus');
INSERT INTO "public"."taxon" VALUES ('600753', 'Longfin mako', 'Isurus paucus');
INSERT INTO "public"."taxon" VALUES ('600754', 'Pearlsides', 'Maurolicus muelleri');
INSERT INTO "public"."taxon" VALUES ('600779', 'Deepwater catshark', 'Apristurus profundorum');
INSERT INTO "public"."taxon" VALUES ('600785', 'Flathead mullet', 'Mugil cephalus');
INSERT INTO "public"."taxon" VALUES ('600790', 'Red mullet', 'Mullus barbatus barbatus');
INSERT INTO "public"."taxon" VALUES ('600807', 'Blackmouth catshark', 'Galeus melastomus');
INSERT INTO "public"."taxon" VALUES ('600808', 'Mouse catshark', 'Galeus murinus');
INSERT INTO "public"."taxon" VALUES ('600817', 'Dusky catshark', 'Bythaelurus canescens');
INSERT INTO "public"."taxon" VALUES ('600845', 'Smallspotted catshark', 'Scyliorhinus canicula');
INSERT INTO "public"."taxon" VALUES ('600850', 'Saddled seabream', 'Oblada melanura');
INSERT INTO "public"."taxon" VALUES ('600854', 'Nursehound', 'Scyliorhinus stellaris');
INSERT INTO "public"."taxon" VALUES ('600858', 'Silvertip shark', 'Carcharhinus albimarginatus');
INSERT INTO "public"."taxon" VALUES ('600861', 'Grey reef shark', 'Carcharhinus amblyrhynchos');
INSERT INTO "public"."taxon" VALUES ('600864', 'Copper shark', 'Carcharhinus brachyurus');
INSERT INTO "public"."taxon" VALUES ('600868', 'Silky shark', 'Carcharhinus falciformis');
INSERT INTO "public"."taxon" VALUES ('600870', 'Galapagos shark', 'Carcharhinus galapagensis');
INSERT INTO "public"."taxon" VALUES ('600873', 'Bull shark', 'Carcharhinus leucas');
INSERT INTO "public"."taxon" VALUES ('600874', 'Blacktip shark', 'Carcharhinus limbatus');
INSERT INTO "public"."taxon" VALUES ('600875', 'Oceanic whitetip shark', 'Carcharhinus longimanus');
INSERT INTO "public"."taxon" VALUES ('600877', 'Blacktip reef shark', 'Carcharhinus melanopterus');
INSERT INTO "public"."taxon" VALUES ('600878', 'Dusky shark', 'Carcharhinus obscurus');
INSERT INTO "public"."taxon" VALUES ('600880', 'Sandbar shark', 'Carcharhinus plumbeus');
INSERT INTO "public"."taxon" VALUES ('600881', 'Smalltail shark', 'Carcharhinus porosus');
INSERT INTO "public"."taxon" VALUES ('600884', 'Spottail shark', 'Carcharhinus sorrah');
INSERT INTO "public"."taxon" VALUES ('600886', 'Tiger shark', 'Galeocerdo cuvier');
INSERT INTO "public"."taxon" VALUES ('600889', 'Axillary seabream', 'Pagellus acarne');
INSERT INTO "public"."taxon" VALUES ('600890', 'Blackspot seabream', 'Pagellus bogaraveo');
INSERT INTO "public"."taxon" VALUES ('600893', 'Common pandora', 'Pagellus erythrinus');
INSERT INTO "public"."taxon" VALUES ('600897', 'Lemon shark', 'Negaprion brevirostris');
INSERT INTO "public"."taxon" VALUES ('600898', 'Blue shark', 'Prionace glauca');
INSERT INTO "public"."taxon" VALUES ('600903', 'Caribbean sharpnose shark', 'Rhizoprionodon porosus');
INSERT INTO "public"."taxon" VALUES ('600905', 'Atlantic sharpnose shark', 'Rhizoprionodon terraenovae');
INSERT INTO "public"."taxon" VALUES ('600907', 'Whitetip reef shark', 'Triaenodon obesus');
INSERT INTO "public"."taxon" VALUES ('600912', 'Scalloped hammerhead', 'Sphyrna lewini');
INSERT INTO "public"."taxon" VALUES ('600914', 'Great hammerhead', 'Sphyrna mokarran');
INSERT INTO "public"."taxon" VALUES ('600915', 'Bonnethead', 'Sphyrna tiburo');
INSERT INTO "public"."taxon" VALUES ('600917', 'Smooth hammerhead', 'Sphyrna zygaena');
INSERT INTO "public"."taxon" VALUES ('600918', 'Blue and gold fusilier', 'Caesio caerulaurea');
INSERT INTO "public"."taxon" VALUES ('600920', 'Lunar fusilier', 'Caesio lunaris');
INSERT INTO "public"."taxon" VALUES ('600923', 'Yellow and blueback fusilier', 'Caesio teres');
INSERT INTO "public"."taxon" VALUES ('600935', 'Marr''s fusilier', 'Pterocaesio marri');
INSERT INTO "public"."taxon" VALUES ('600936', 'Banana fusilier', 'Pterocaesio pisang');
INSERT INTO "public"."taxon" VALUES ('600939', 'Dark-banded fusilier', 'Pterocaesio tile');
INSERT INTO "public"."taxon" VALUES ('600940', 'Red stingray', 'Dasyatis akajei');
INSERT INTO "public"."taxon" VALUES ('600941', 'Longfin kob', 'Atrobucca nibe');
INSERT INTO "public"."taxon" VALUES ('600948', 'Couma sea catfish', 'Sciades couma');
INSERT INTO "public"."taxon" VALUES ('600949', 'Thomas sea catfish', 'Notarius grandicassis');
INSERT INTO "public"."taxon" VALUES ('600950', 'Bartail flathead', 'Platycephalus indicus');
INSERT INTO "public"."taxon" VALUES ('600952', 'Gillbacker sea catfish', 'Sciades parkeri');
INSERT INTO "public"."taxon" VALUES ('600953', 'Passany sea catfish', 'Sciades passany');
INSERT INTO "public"."taxon" VALUES ('600954', 'Kukwari sea catfish', 'Amphiarius phrygiatus');
INSERT INTO "public"."taxon" VALUES ('600955', 'Crucifix sea catfish', 'Sciades proops');
INSERT INTO "public"."taxon" VALUES ('600956', 'Bressou sea catfish', 'Aspistor quadriscutis');
INSERT INTO "public"."taxon" VALUES ('600958', 'Coco sea catfish', 'Bagre bagre');
INSERT INTO "public"."taxon" VALUES ('600966', 'Black triggerfish', 'Melichthys niger');
INSERT INTO "public"."taxon" VALUES ('600972', 'Flat needlefish', 'Ablennes hians');
INSERT INTO "public"."taxon" VALUES ('600977', 'Hound needlefish', 'Tylosurus crocodilus crocodilus');
INSERT INTO "public"."taxon" VALUES ('600983', 'Atlantic goldeye tilefish', 'Caulolatilus chrysops');
INSERT INTO "public"."taxon" VALUES ('600988', 'African pompano', 'Alectis ciliaris');
INSERT INTO "public"."taxon" VALUES ('600993', 'Mackerel scad', 'Decapterus macarellus');
INSERT INTO "public"."taxon" VALUES ('600994', 'Round scad', 'Decapterus punctatus');
INSERT INTO "public"."taxon" VALUES ('600998', 'Pilotfish', 'Naucrates ductor');
INSERT INTO "public"."taxon" VALUES ('601002', 'White trevally', 'Pseudocaranx dentex');
INSERT INTO "public"."taxon" VALUES ('601004', 'Lookdown', 'Selene vomer');
INSERT INTO "public"."taxon" VALUES ('601005', 'Greater amberjack', 'Seriola dumerili');
INSERT INTO "public"."taxon" VALUES ('601007', 'Longfin yellowtail', 'Seriola rivoliana');
INSERT INTO "public"."taxon" VALUES ('601009', 'Cayenne pompano', 'Trachinotus cayennensis');
INSERT INTO "public"."taxon" VALUES ('601011', 'Great pompano', 'Trachinotus goodei');
INSERT INTO "public"."taxon" VALUES ('601012', 'Cottonmouth jack', 'Uraspis secunda');
INSERT INTO "public"."taxon" VALUES ('601021', 'Flying gurnard', 'Dactylopterus volitans');
INSERT INTO "public"."taxon" VALUES ('601022', 'Spot-fin porcupinefish', 'Diodon hystrix');
INSERT INTO "public"."taxon" VALUES ('601023', 'Norway pout', 'Trisopterus esmarkii');
INSERT INTO "public"."taxon" VALUES ('601024', 'Atlantic spadefish', 'Chaetodipterus faber');
INSERT INTO "public"."taxon" VALUES ('601042', 'Escolar', 'Lepidocybium flavobrunneum');
INSERT INTO "public"."taxon" VALUES ('601043', 'Round sardinella', 'Sardinella aurita');
INSERT INTO "public"."taxon" VALUES ('601044', 'Oilfish', 'Ruvettus pretiosus');
INSERT INTO "public"."taxon" VALUES ('601047', 'Madeiran sardinella', 'Sardinella maderensis');
INSERT INTO "public"."taxon" VALUES ('601048', 'Caitipa mojarra', 'Diapterus rhombeus');
INSERT INTO "public"."taxon" VALUES ('601049', 'Silver mojarra', 'Eucinostomus argenteus');
INSERT INTO "public"."taxon" VALUES ('601054', 'Yellow fin mojarra', 'Gerres cinereus');
INSERT INTO "public"."taxon" VALUES ('601055', 'Brushtooth lizardfish', 'Saurida undosquamis');
INSERT INTO "public"."taxon" VALUES ('601058', 'Bermuda halfbeak', 'Hemiramphus bermudensis');
INSERT INTO "public"."taxon" VALUES ('601059', 'Ballyhoo', 'Hemiramphus brasiliensis');
INSERT INTO "public"."taxon" VALUES ('601061', 'Squirrelfish', 'Holocentrus adscensionis');
INSERT INTO "public"."taxon" VALUES ('601063', 'Blackbar soldierfish', 'Myripristis jacobus');
INSERT INTO "public"."taxon" VALUES ('601066', 'Spotfin hogfish', 'Bodianus pulchellus');
INSERT INTO "public"."taxon" VALUES ('601071', 'Hogfish', 'Lachnolaimus maximus');
INSERT INTO "public"."taxon" VALUES ('601072', 'Opah', 'Lampris guttatus');
INSERT INTO "public"."taxon" VALUES ('601077', 'Atlantic tripletail', 'Lobotes surinamensis');
INSERT INTO "public"."taxon" VALUES ('601078', 'Blackfin goosefish', 'Lophius gastrophysus');
INSERT INTO "public"."taxon" VALUES ('601079', 'Tarpon', 'Megalops atlanticus');
INSERT INTO "public"."taxon" VALUES ('601084', 'Atlantic saury', 'Scomberesox saurus saurus');
INSERT INTO "public"."taxon" VALUES ('601089', 'Parassi mullet', 'Mugil incilis');
INSERT INTO "public"."taxon" VALUES ('601090', 'Liza', 'Mugil liza');
INSERT INTO "public"."taxon" VALUES ('601092', 'Yellow goatfish', 'Mulloidichthys martinicus');
INSERT INTO "public"."taxon" VALUES ('601094', 'Spotted goatfish', 'Pseudupeneus maculatus');
INSERT INTO "public"."taxon" VALUES ('601110', 'Atlantic threadfin', 'Polydactylus octonemus');
INSERT INTO "public"."taxon" VALUES ('601126', 'White margate', 'Haemulon album');
INSERT INTO "public"."taxon" VALUES ('601128', 'Tomtate grunt', 'Haemulon aurolineatum');
INSERT INTO "public"."taxon" VALUES ('601129', 'Black grunt', 'Haemulon bonariense');
INSERT INTO "public"."taxon" VALUES ('601130', 'Bronzestripe grunt', 'Haemulon boschmae');
INSERT INTO "public"."taxon" VALUES ('601133', 'Broad-striped anchovy', 'Anchoa hepsetus');
INSERT INTO "public"."taxon" VALUES ('601140', 'White grunt', 'Haemulon plumierii');
INSERT INTO "public"."taxon" VALUES ('601141', 'Bluestriped grunt', 'Haemulon sciurus');
INSERT INTO "public"."taxon" VALUES ('601142', 'Chere-chere grunt', 'Haemulon steindachneri');
INSERT INTO "public"."taxon" VALUES ('601146', 'Roughneck grunt', 'Pomadasys corvinaeformis');
INSERT INTO "public"."taxon" VALUES ('601149', 'Atlantic bigeye', 'Priacanthus arenatus');
INSERT INTO "public"."taxon" VALUES ('601150', 'Glasseye', 'Heteropriacanthus cruentatus');
INSERT INTO "public"."taxon" VALUES ('601161', 'Stoplight parrotfish', 'Sparisoma viride');
INSERT INTO "public"."taxon" VALUES ('601164', 'Gilthead seabream', 'Sparus aurata');
INSERT INTO "public"."taxon" VALUES ('601166', 'Ground croaker', 'Bairdiella ronchus');
INSERT INTO "public"."taxon" VALUES ('601168', 'Barbel drum', 'Ctenosciaena gracilicirrhus');
INSERT INTO "public"."taxon" VALUES ('601169', 'Acoupa weakfish', 'Cynoscion acoupa');
INSERT INTO "public"."taxon" VALUES ('601170', 'Sand weakfish', 'Cynoscion arenarius');
INSERT INTO "public"."taxon" VALUES ('601171', 'Jamaica weakfish', 'Cynoscion jamaicensis');
INSERT INTO "public"."taxon" VALUES ('601177', 'Smalltooth weakfish', 'Cynoscion steindachneri');
INSERT INTO "public"."taxon" VALUES ('601178', 'Green weakfish', 'Cynoscion virescens');
INSERT INTO "public"."taxon" VALUES ('601180', 'Shorthead drum', 'Larimus breviceps');
INSERT INTO "public"."taxon" VALUES ('601181', 'Northern puffer', 'Sphoeroides maculatus');
INSERT INTO "public"."taxon" VALUES ('601184', 'Smalleye croaker', 'Nebris microps');
INSERT INTO "public"."taxon" VALUES ('601191', 'Red drum', 'Sciaenops ocellatus');
INSERT INTO "public"."taxon" VALUES ('601198', 'Blue butterfish', 'Stromateus fiatola');
INSERT INTO "public"."taxon" VALUES ('601203', 'Sand seabass', 'Diplectrum formosum');
INSERT INTO "public"."taxon" VALUES ('601205', 'Yellowedge grouper', 'Hyporthodus flavolimbatus');
INSERT INTO "public"."taxon" VALUES ('601206', 'Misty grouper', 'Hyporthodus mystacinus');
INSERT INTO "public"."taxon" VALUES ('601207', 'Warsaw grouper', 'Hyporthodus nigritus');
INSERT INTO "public"."taxon" VALUES ('601208', 'Snowy grouper', 'Hyporthodus niveatus');
INSERT INTO "public"."taxon" VALUES ('601209', 'Black grouper', 'Mycteroperca bonaci');
INSERT INTO "public"."taxon" VALUES ('601211', 'Yellowmouth grouper', 'Mycteroperca interstitialis');
INSERT INTO "public"."taxon" VALUES ('601212', 'Gag', 'Mycteroperca microlepis');
INSERT INTO "public"."taxon" VALUES ('601213', 'Scamp', 'Mycteroperca phenax');
INSERT INTO "public"."taxon" VALUES ('601214', 'Mottled grouper', 'Mycteroperca rubra');
INSERT INTO "public"."taxon" VALUES ('601215', 'Tiger grouper', 'Mycteroperca tigris');
INSERT INTO "public"."taxon" VALUES ('601216', 'Yellowfin grouper', 'Mycteroperca venenosa');
INSERT INTO "public"."taxon" VALUES ('601217', 'Creole-fish', 'Paranthias furcifer');
INSERT INTO "public"."taxon" VALUES ('601219', 'Western Atlantic seabream', 'Archosargus rhomboidalis');
INSERT INTO "public"."taxon" VALUES ('601221', 'Jolthead porgy', 'Calamus bajonado');
INSERT INTO "public"."taxon" VALUES ('601222', 'Saucereye porgy', 'Calamus calamus');
INSERT INTO "public"."taxon" VALUES ('601235', 'Great barracuda', 'Sphyraena barracuda');
INSERT INTO "public"."taxon" VALUES ('601236', 'Guachanche barracuda', 'Sphyraena guachancho');
INSERT INTO "public"."taxon" VALUES ('601239', 'Smooth puffer', 'Lagocephalus laevigatus');
INSERT INTO "public"."taxon" VALUES ('601248', 'Longnose stingray', 'Dasyatis guttata');
INSERT INTO "public"."taxon" VALUES ('601250', 'Spotted eagle ray', 'Aetobatus narinari');
INSERT INTO "public"."taxon" VALUES ('601255', 'Elongate surgeonfish', 'Acanthurus mata');
INSERT INTO "public"."taxon" VALUES ('601256', 'Eyestripe surgeonfish', 'Acanthurus dussumieri');
INSERT INTO "public"."taxon" VALUES ('601258', 'Lined surgeonfish', 'Acanthurus lineatus');
INSERT INTO "public"."taxon" VALUES ('601260', 'Convict surgeonfish', 'Acanthurus triostegus');
INSERT INTO "public"."taxon" VALUES ('601261', 'Yellowfin surgeonfish', 'Acanthurus xanthopterus');
INSERT INTO "public"."taxon" VALUES ('601262', 'Striated surgeonfish', 'Ctenochaetus striatus');
INSERT INTO "public"."taxon" VALUES ('601263', 'Sleek unicornfish', 'Naso hexacanthus');
INSERT INTO "public"."taxon" VALUES ('601264', 'Orangespine unicornfish', 'Naso lituratus');
INSERT INTO "public"."taxon" VALUES ('601265', 'Bluespine unicornfish', 'Naso unicornis');
INSERT INTO "public"."taxon" VALUES ('601266', 'Sailfin tang', 'Zebrasoma velifer');
INSERT INTO "public"."taxon" VALUES ('601274', 'Indonesian shortfin eel', 'Anguilla bicolor bicolor');
INSERT INTO "public"."taxon" VALUES ('601278', 'Mediterranean horse mackerel', 'Trachurus mediterraneus');
INSERT INTO "public"."taxon" VALUES ('601279', 'Blue jack mackerel', 'Trachurus picturatus');
INSERT INTO "public"."taxon" VALUES ('601288', 'Largehead hairtail', 'Trichiurus lepturus');
INSERT INTO "public"."taxon" VALUES ('601290', 'Fivebeard rockling', 'Ciliata mustela');
INSERT INTO "public"."taxon" VALUES ('601300', 'Indian driftfish', 'Ariomma indicum');
INSERT INTO "public"."taxon" VALUES ('601303', 'Hardyhead silverside', 'Atherinomorus lacunosus');
INSERT INTO "public"."taxon" VALUES ('601306', 'Shi drum', 'Umbrina cirrosa');
INSERT INTO "public"."taxon" VALUES ('601307', 'Samoan silverside', 'Hypoatherina temminckii');
INSERT INTO "public"."taxon" VALUES ('601309', 'Chinese trumpetfish', 'Aulostomus chinensis');
INSERT INTO "public"."taxon" VALUES ('601311', 'Redtoothed triggerfish', 'Odonus niger');
INSERT INTO "public"."taxon" VALUES ('601312', 'Masked triggerfish', 'Sufflamen fraenatum');
INSERT INTO "public"."taxon" VALUES ('601314', 'Keeled needlefish', 'Platybelone argalus platyura');
INSERT INTO "public"."taxon" VALUES ('601317', 'Keel-jawed needle fish', 'Tylosurus acus melanotus');
INSERT INTO "public"."taxon" VALUES ('601319', 'Alfonsino', 'Beryx decadactylus');
INSERT INTO "public"."taxon" VALUES ('601320', 'Splendid alfonsino', 'Beryx splendens');
INSERT INTO "public"."taxon" VALUES ('601321', 'Leopard flounder', 'Bothus pantherinus');
INSERT INTO "public"."taxon" VALUES ('601327', 'Striped red mullet', 'Mullus surmuletus');
INSERT INTO "public"."taxon" VALUES ('601334', 'European smelt', 'Osmerus eperlanus');
INSERT INTO "public"."taxon" VALUES ('601336', 'Sand sole', 'Pegusa lascaris');
INSERT INTO "public"."taxon" VALUES ('601338', 'Summer flounder', 'Paralichthys dentatus');
INSERT INTO "public"."taxon" VALUES ('601340', 'Greater forkbeard', 'Phycis blennoides');
INSERT INTO "public"."taxon" VALUES ('601341', 'Flounder', 'Platichthys flesus');
INSERT INTO "public"."taxon" VALUES ('601342', 'European plaice', 'Pleuronectes platessa');
INSERT INTO "public"."taxon" VALUES ('601343', 'Saithe', 'Pollachius virens');
INSERT INTO "public"."taxon" VALUES ('601348', 'Turbot', 'Scophthalmus maximus');
INSERT INTO "public"."taxon" VALUES ('601350', 'European pilchard', 'Sardina pilchardus');
INSERT INTO "public"."taxon" VALUES ('601351', 'Bastard halibut', 'Paralichthys olivaceus');
INSERT INTO "public"."taxon" VALUES ('601352', 'Norway redfish', 'Sebastes viviparus');
INSERT INTO "public"."taxon" VALUES ('601353', 'Comber', 'Serranus cabrilla');
INSERT INTO "public"."taxon" VALUES ('601356', 'Black seabream', 'Spondyliosoma cantharus');
INSERT INTO "public"."taxon" VALUES ('601357', 'European sprat', 'Sprattus sprattus');
INSERT INTO "public"."taxon" VALUES ('601363', 'Greater weever', 'Trachinus draco');
INSERT INTO "public"."taxon" VALUES ('601365', 'Atlantic horse mackerel', 'Trachurus trachurus');
INSERT INTO "public"."taxon" VALUES ('601366', 'Tub gurnard', 'Chelidonichthys lucerna');
INSERT INTO "public"."taxon" VALUES ('601367', 'Pouting', 'Trisopterus luscus');
INSERT INTO "public"."taxon" VALUES ('601370', 'John dory', 'Zeus faber');
INSERT INTO "public"."taxon" VALUES ('601371', 'Atlantic halibut', 'Hippoglossus hippoglossus');
INSERT INTO "public"."taxon" VALUES ('601381', 'Haddock', 'Melanogrammus aeglefinus');
INSERT INTO "public"."taxon" VALUES ('601382', 'Lemon sole', 'Microstomus kitt');
INSERT INTO "public"."taxon" VALUES ('601383', 'Blue ling', 'Molva dypterygia');
INSERT INTO "public"."taxon" VALUES ('601385', 'Flame snapper', 'Etelis coruscans');
INSERT INTO "public"."taxon" VALUES ('601391', 'Queen snapper', 'Etelis oculatus');
INSERT INTO "public"."taxon" VALUES ('601403', 'Mutton snapper', 'Lutjanus analis');
INSERT INTO "public"."taxon" VALUES ('601404', 'Schoolmaster snapper', 'Lutjanus apodus');
INSERT INTO "public"."taxon" VALUES ('601406', 'Crimson snapper', 'Lutjanus erythropterus');
INSERT INTO "public"."taxon" VALUES ('601407', 'Mangrove red snapper', 'Lutjanus argentimaculatus');
INSERT INTO "public"."taxon" VALUES ('601408', 'Yellow snapper', 'Lutjanus argentiventris');
INSERT INTO "public"."taxon" VALUES ('601417', 'Two-spot red snapper', 'Lutjanus bohar');
INSERT INTO "public"."taxon" VALUES ('601423', 'Northern red snapper', 'Lutjanus campechanus');
INSERT INTO "public"."taxon" VALUES ('601427', 'Cubera snapper', 'Lutjanus cyanopterus');
INSERT INTO "public"."taxon" VALUES ('601450', 'Common carp', 'Cyprinus carpio carpio');
INSERT INTO "public"."taxon" VALUES ('601452', 'Whitefin wolf-herring', 'Chirocentrus nudus');
INSERT INTO "public"."taxon" VALUES ('601453', 'Rainbow sardine', 'Dussumieria acuta');
INSERT INTO "public"."taxon" VALUES ('601454', 'Slender rainbow sardine', 'Dussumieria elopsoides');
INSERT INTO "public"."taxon" VALUES ('601455', 'Round herring', 'Etrumeus teres');
INSERT INTO "public"."taxon" VALUES ('601456', 'Whiteheads round herring', 'Etrumeus whiteheadi');
INSERT INTO "public"."taxon" VALUES ('601457', 'Delicate round herring', 'Spratelloides delicatulus');
INSERT INTO "public"."taxon" VALUES ('601458', 'Silverstriped round herring', 'Spratelloides gracilis');
INSERT INTO "public"."taxon" VALUES ('601466', 'Falkland sprat', 'Sprattus fuegensis');
INSERT INTO "public"."taxon" VALUES ('601470', 'Black Sea sprat', 'Clupeonella cultriventris');
INSERT INTO "public"."taxon" VALUES ('601471', 'Anchovy sprat', 'Clupeonella engrauliformis');
INSERT INTO "public"."taxon" VALUES ('601477', 'South American pilchard', 'Sardinops sagax');
INSERT INTO "public"."taxon" VALUES ('601478', 'False herring', 'Harengula clupeola');
INSERT INTO "public"."taxon" VALUES ('601479', 'Redear herring', 'Harengula humeralis');
INSERT INTO "public"."taxon" VALUES ('601480', 'Scaled herring', 'Harengula jaguana');
INSERT INTO "public"."taxon" VALUES ('601484', 'Pacific thread herring', 'Opisthonema libertate');
INSERT INTO "public"."taxon" VALUES ('601486', 'Atlantic thread herring', 'Opisthonema oglinum');
INSERT INTO "public"."taxon" VALUES ('601494', 'Bluestripe herring', 'Herklotsichthys quadrimaculatus');
INSERT INTO "public"."taxon" VALUES ('601501', 'Spotted sardinella', 'Amblygaster sirm');
INSERT INTO "public"."taxon" VALUES ('601505', 'Brazilian sardinella', 'Sardinella janeiro');
INSERT INTO "public"."taxon" VALUES ('601507', 'Fringescale sardinella', 'Sardinella fimbriata');
INSERT INTO "public"."taxon" VALUES ('601508', 'Goldstripe sardinella', 'Sardinella gibbosa');
INSERT INTO "public"."taxon" VALUES ('601510', 'Bali sardinella', 'Sardinella lemuru');
INSERT INTO "public"."taxon" VALUES ('601511', 'Indian oil sardine', 'Sardinella longiceps');
INSERT INTO "public"."taxon" VALUES ('601519', 'Japanese sardinella', 'Sardinella zunasi');
INSERT INTO "public"."taxon" VALUES ('601520', 'Pacific herring', 'Clupea pallasii pallasii');
INSERT INTO "public"."taxon" VALUES ('601530', 'Araucanian herring', 'Strangomera bentincki');
INSERT INTO "public"."taxon" VALUES ('601574', 'Blueback shad', 'Alosa aestivalis');
INSERT INTO "public"."taxon" VALUES ('601582', 'Hickory shad', 'Alosa mediocris');
INSERT INTO "public"."taxon" VALUES ('601583', 'Alewife', 'Alosa pseudoharengus');
INSERT INTO "public"."taxon" VALUES ('601584', 'American shad', 'Alosa sapidissima');
INSERT INTO "public"."taxon" VALUES ('601587', 'Brazilian menhaden', 'Brevoortia aurea');
INSERT INTO "public"."taxon" VALUES ('601589', 'Gulf menhaden', 'Brevoortia patronus');
INSERT INTO "public"."taxon" VALUES ('601590', 'Argentine menhaden', 'Brevoortia pectinata');
INSERT INTO "public"."taxon" VALUES ('601592', 'Atlantic menhaden', 'Brevoortia tyrannus');
INSERT INTO "public"."taxon" VALUES ('601593', 'Pacific menhaden', 'Ethmidium maculatum');
INSERT INTO "public"."taxon" VALUES ('601594', 'Bonga shad', 'Ethmalosa fimbriata');
INSERT INTO "public"."taxon" VALUES ('601595', 'Kelee shad', 'Hilsa kelee');
INSERT INTO "public"."taxon" VALUES ('601596', 'Hilsa shad', 'Tenualosa ilisha');
INSERT INTO "public"."taxon" VALUES ('601600', 'Toli shad', 'Tenualosa toli');
INSERT INTO "public"."taxon" VALUES ('601604', 'American gizzard shad', 'Dorosoma cepedianum');
INSERT INTO "public"."taxon" VALUES ('601608', 'Chinese gizzard shad', 'Clupanodon thrissa');
INSERT INTO "public"."taxon" VALUES ('601609', 'Konoshiro gizzard shad', 'Konosirus punctatus');
INSERT INTO "public"."taxon" VALUES ('601616', 'Blochs gizzard shad', 'Nematalosa nasus');
INSERT INTO "public"."taxon" VALUES ('601619', 'Chacunda gizzard shad', 'Anodontostoma chacunda');
INSERT INTO "public"."taxon" VALUES ('601625', 'West African ilisha', 'Ilisha africana');
INSERT INTO "public"."taxon" VALUES ('601627', 'Elongate ilisha', 'Ilisha elongata');
INSERT INTO "public"."taxon" VALUES ('601641', 'Indian pellona', 'Pellona ditchela');
INSERT INTO "public"."taxon" VALUES ('601655', 'Guiana longfin herring', 'Odontognathus mucronatus');
INSERT INTO "public"."taxon" VALUES ('601659', 'Argentine anchoita', 'Engraulis anchoita');
INSERT INTO "public"."taxon" VALUES ('601661', 'Cape anchovy', 'Engraulis capensis');
INSERT INTO "public"."taxon" VALUES ('601663', 'Japanese anchovy', 'Engraulis japonicus');
INSERT INTO "public"."taxon" VALUES ('601664', 'Californian anchovy', 'Engraulis mordax');
INSERT INTO "public"."taxon" VALUES ('601684', 'Bermuda anchovy', 'Anchoa choerostoma');
INSERT INTO "public"."taxon" VALUES ('601692', 'Swallowtail seaperch', 'Anthias anthias');
INSERT INTO "public"."taxon" VALUES ('601696', 'Big-scale sand smelt', 'Atherina boyeri');
INSERT INTO "public"."taxon" VALUES ('601706', 'Damselfish', 'Chromis chromis');
INSERT INTO "public"."taxon" VALUES ('601707', 'Brown meagre', 'Sciaena umbra');
INSERT INTO "public"."taxon" VALUES ('601722', 'Large-scaled gurnard', 'Lepidotrigla cavillone');
INSERT INTO "public"."taxon" VALUES ('601729', 'Mediterranean moray', 'Muraena helena');
INSERT INTO "public"."taxon" VALUES ('601730', 'Brown moray', 'Gymnothorax unicolor');
INSERT INTO "public"."taxon" VALUES ('601732', 'Ocean sunfish', 'Mola mola');
INSERT INTO "public"."taxon" VALUES ('601734', 'Common mora', 'Mora moro');
INSERT INTO "public"."taxon" VALUES ('601735', 'Golden grey mullet', 'Liza aurata');
INSERT INTO "public"."taxon" VALUES ('601736', 'Leaping mullet', 'Liza saliens');
INSERT INTO "public"."taxon" VALUES ('601747', 'Forkbeard', 'Phycis phycis');
INSERT INTO "public"."taxon" VALUES ('601749', 'Sharpsnout seabream', 'Diplodus puntazzo');
INSERT INTO "public"."taxon" VALUES ('601752', 'Annular seabream', 'Diplodus annularis');
INSERT INTO "public"."taxon" VALUES ('601753', 'White seabream', 'Diplodus sargus sargus');
INSERT INTO "public"."taxon" VALUES ('601754', 'Common two-banded seabream', 'Diplodus vulgaris');
INSERT INTO "public"."taxon" VALUES ('601756', 'Common seabream', 'Pagrus pagrus');
INSERT INTO "public"."taxon" VALUES ('601758', 'Black scorpionfish', 'Scorpaena porcus');
INSERT INTO "public"."taxon" VALUES ('601759', 'Largescaled scorpionfish', 'Scorpaena scrofa');
INSERT INTO "public"."taxon" VALUES ('601765', 'European barracuda', 'Sphyraena sphyraena');
INSERT INTO "public"."taxon" VALUES ('601766', 'Picarel', 'Spicara smaris');
INSERT INTO "public"."taxon" VALUES ('601773', 'Derbio', 'Trachinotus ovatus');
INSERT INTO "public"."taxon" VALUES ('601779', 'Atlantic stargazer', 'Uranoscopus scaber');
INSERT INTO "public"."taxon" VALUES ('601800', 'Monrovia doctorfish', 'Acanthurus monroviae');
INSERT INTO "public"."taxon" VALUES ('601825', 'Blue grenadier', 'Macruronus novaezelandiae');
INSERT INTO "public"."taxon" VALUES ('601826', 'Deep-water Cape hake', 'Merluccius paradoxus');
INSERT INTO "public"."taxon" VALUES ('601827', 'Panama hake', 'Merluccius angustimanus');
INSERT INTO "public"."taxon" VALUES ('601828', 'Shallow-water Cape hake', 'Merluccius capensis');
INSERT INTO "public"."taxon" VALUES ('601832', 'Striped large-eye bream', 'Gnathodentex aureolineatus');
INSERT INTO "public"."taxon" VALUES ('601833', 'Grey large-eye bream', 'Gymnocranius griseus');
INSERT INTO "public"."taxon" VALUES ('601834', 'Blue-lined large-eye bream', 'Gymnocranius grandoculis');
INSERT INTO "public"."taxon" VALUES ('601837', 'Japanese large-eye bream', 'Gymnocranius euanus');
INSERT INTO "public"."taxon" VALUES ('601839', 'Blue-spotted large-eye bream', 'Gymnocranius microdon');
INSERT INTO "public"."taxon" VALUES ('601842', 'Longfin emperor', 'Lethrinus erythropterus');
INSERT INTO "public"."taxon" VALUES ('601843', 'Sky emperor', 'Lethrinus mahsena');
INSERT INTO "public"."taxon" VALUES ('601844', 'Snubnose emperor', 'Lethrinus borbonicus');
INSERT INTO "public"."taxon" VALUES ('601845', 'Smalltooth emperor', 'Lethrinus microdon');
INSERT INTO "public"."taxon" VALUES ('601846', 'Spangled emperor', 'Lethrinus nebulosus');
INSERT INTO "public"."taxon" VALUES ('601847', 'Orange-striped emperor', 'Lethrinus obsoletus');
INSERT INTO "public"."taxon" VALUES ('601848', 'Spotcheek emperor', 'Lethrinus rubrioperculatus');
INSERT INTO "public"."taxon" VALUES ('601849', 'Black blotch emperor', 'Lethrinus semicinctus');
INSERT INTO "public"."taxon" VALUES ('601850', 'Slender emperor', 'Lethrinus variegatus');
INSERT INTO "public"."taxon" VALUES ('601851', 'Thumbprint emperor', 'Lethrinus harak');
INSERT INTO "public"."taxon" VALUES ('601852', 'Yellowlip emperor', 'Lethrinus xanthochilus');
INSERT INTO "public"."taxon" VALUES ('601853', 'Ambon emperor', 'Lethrinus amboinensis');
INSERT INTO "public"."taxon" VALUES ('601854', 'Pacific yellowtail emperor', 'Lethrinus atkinsoni');
INSERT INTO "public"."taxon" VALUES ('601858', 'Trumpet emperor', 'Lethrinus miniatus');
INSERT INTO "public"."taxon" VALUES ('601862', 'Orange-spotted emperor', 'Lethrinus erythracanthus');
INSERT INTO "public"."taxon" VALUES ('601863', 'Pink ear emperor', 'Lethrinus lentjan');
INSERT INTO "public"."taxon" VALUES ('601864', 'Longface emperor', 'Lethrinus olivaceus');
INSERT INTO "public"."taxon" VALUES ('601866', 'Ornate emperor', 'Lethrinus ornatus');
INSERT INTO "public"."taxon" VALUES ('601867', 'Atlantic emperor', 'Lethrinus atlanticus');
INSERT INTO "public"."taxon" VALUES ('601869', 'Humpnose big-eye bream', 'Monotaxis grandoculis');
INSERT INTO "public"."taxon" VALUES ('601870', 'Mozambique large-eye bream', 'Wattsia mossambica');
INSERT INTO "public"."taxon" VALUES ('601874', 'Fourbeard rockling', 'Enchelyopus cimbrius');
INSERT INTO "public"."taxon" VALUES ('601879', 'Pacific tomcod', 'Microgadus proximus');
INSERT INTO "public"."taxon" VALUES ('601886', 'Three-stripe fusilier', 'Pterocaesio trilineata');
INSERT INTO "public"."taxon" VALUES ('601888', 'African threadfish', 'Alectis alexandrinus');
INSERT INTO "public"."taxon" VALUES ('601889', 'Shrimp scad', 'Alepes djedaba');
INSERT INTO "public"."taxon" VALUES ('601893', 'Yellowtail scad', 'Atule mate');
INSERT INTO "public"."taxon" VALUES ('601895', 'Giant trevally', 'Caranx ignobilis');
INSERT INTO "public"."taxon" VALUES ('601899', 'False scad', 'Caranx rhonchus');
INSERT INTO "public"."taxon" VALUES ('601906', 'Bluefin trevally', 'Caranx melampygus');
INSERT INTO "public"."taxon" VALUES ('601907', 'Bumpnose trevally', 'Carangoides hedlandensis');
INSERT INTO "public"."taxon" VALUES ('601909', 'Island trevally', 'Carangoides orthogrammus');
INSERT INTO "public"."taxon" VALUES ('601910', 'Barcheek trevally', 'Carangoides plagiotaenia');
INSERT INTO "public"."taxon" VALUES ('601916', 'Longfin trevally', 'Carangoides armatus');
INSERT INTO "public"."taxon" VALUES ('601917', 'Bigeye trevally', 'Caranx sexfasciatus');
INSERT INTO "public"."taxon" VALUES ('601918', 'Bar jack', 'Carangoides ruber');
INSERT INTO "public"."taxon" VALUES ('601921', 'Blue trevally', 'Carangoides ferdau');
INSERT INTO "public"."taxon" VALUES ('601923', 'Orangespotted trevally', 'Carangoides bajad');
INSERT INTO "public"."taxon" VALUES ('601924', 'Coastal trevally', 'Carangoides coeruleopinnatus');
INSERT INTO "public"."taxon" VALUES ('601926', 'Yellowspotted trevally', 'Carangoides fulvoguttatus');
INSERT INTO "public"."taxon" VALUES ('601931', 'Silvermouth trevally', 'Ulua aurochs');
INSERT INTO "public"."taxon" VALUES ('601933', 'Blue runner', 'Caranx crysos');
INSERT INTO "public"."taxon" VALUES ('601935', 'Horse-eye jack', 'Caranx latus');
INSERT INTO "public"."taxon" VALUES ('601936', 'Black jack', 'Caranx lugubris');
INSERT INTO "public"."taxon" VALUES ('601937', 'Pacific bumper', 'Chloroscombrus orqueta');
INSERT INTO "public"."taxon" VALUES ('601938', 'Shortfin scad', 'Decapterus macrosoma');
INSERT INTO "public"."taxon" VALUES ('601939', 'Japanese scad', 'Decapterus maruadsi');
INSERT INTO "public"."taxon" VALUES ('601947', 'Black pomfret', 'Parastromateus niger');
INSERT INTO "public"."taxon" VALUES ('601950', 'Talang queenfish', 'Scomberoides commersonnianus');
INSERT INTO "public"."taxon" VALUES ('601951', 'Doublespotted queenfish', 'Scomberoides lysan');
INSERT INTO "public"."taxon" VALUES ('601953', 'Needlescaled queenfish', 'Scomberoides tol');
INSERT INTO "public"."taxon" VALUES ('601954', 'Oxeye scad', 'Selar boops');
INSERT INTO "public"."taxon" VALUES ('601956', 'Hairfin lookdown', 'Selene brevoortii');
INSERT INTO "public"."taxon" VALUES ('601962', 'Blackbanded trevally', 'Seriolina nigrofasciata');
INSERT INTO "public"."taxon" VALUES ('601963', 'Snubnose pompano', 'Trachinotus blochii');
INSERT INTO "public"."taxon" VALUES ('601964', 'Indian pompano', 'Trachinotus mookalee');
INSERT INTO "public"."taxon" VALUES ('601978', 'Smallspotted dart', 'Trachinotus baillonii');
INSERT INTO "public"."taxon" VALUES ('601983', 'Whitemouth jack', 'Uraspis helvola');
INSERT INTO "public"."taxon" VALUES ('601984', 'Whitetongue jack', 'Uraspis uraspis');
INSERT INTO "public"."taxon" VALUES ('602005', 'Blue antimora', 'Antimora rostrata');
INSERT INTO "public"."taxon" VALUES ('602012', 'Slender codling', 'Halargyreus johnsonii');
INSERT INTO "public"."taxon" VALUES ('602014', 'Longfin codling', 'Laemonema longipes');
INSERT INTO "public"."taxon" VALUES ('602020', 'Red codling', 'Pseudophycis bachus');
INSERT INTO "public"."taxon" VALUES ('602023', 'Grenadier cod', 'Tripterophycis gilchristi');
INSERT INTO "public"."taxon" VALUES ('602058', 'Blue skate', 'Dipturus batis');
INSERT INTO "public"."taxon" VALUES ('602059', 'Thornback ray', 'Raja clavata');
INSERT INTO "public"."taxon" VALUES ('602060', 'Common stingray', 'Dasyatis pastinaca');
INSERT INTO "public"."taxon" VALUES ('602065', 'Starry sturgeon', 'Acipenser stellatus');
INSERT INTO "public"."taxon" VALUES ('602066', 'Sturgeon', 'Acipenser sturio');
INSERT INTO "public"."taxon" VALUES ('602067', 'Beluga', 'Huso huso');
INSERT INTO "public"."taxon" VALUES ('602081', 'Whale shark', 'Rhincodon typus');
INSERT INTO "public"."taxon" VALUES ('602083', 'Brown trout', 'Salmo trutta fario');
INSERT INTO "public"."taxon" VALUES ('602300', 'Clown triggerfish', 'Balistoides conspicillum');
INSERT INTO "public"."taxon" VALUES ('602420', 'Three-spined stickleback', 'Gasterosteus aculeatus aculeatus');
INSERT INTO "public"."taxon" VALUES ('602467', 'Live sharksucker', 'Echeneis naucrates');
INSERT INTO "public"."taxon" VALUES ('602497', 'Zebra seabream', 'Diplodus cervinus cervinus');
INSERT INTO "public"."taxon" VALUES ('602498', 'Bermuda sea chub', 'Kyphosus saltatrix');
INSERT INTO "public"."taxon" VALUES ('602499', 'Thicklip grey mullet', 'Chelon labrosus');
INSERT INTO "public"."taxon" VALUES ('602500', 'Ornate wrasse', 'Thalassoma pavo');
INSERT INTO "public"."taxon" VALUES ('602501', 'Wolf-fish', 'Anarhichas lupus');
INSERT INTO "public"."taxon" VALUES ('602503', 'Rabbit fish', 'Chimaera monstrosa');
INSERT INTO "public"."taxon" VALUES ('602508', 'Bulls-eye', 'Epigonus telescopus');
INSERT INTO "public"."taxon" VALUES ('602513', 'Hagfish', 'Myxine glutinosa');
INSERT INTO "public"."taxon" VALUES ('602530', 'Sea lamprey', 'Petromyzon marinus');
INSERT INTO "public"."taxon" VALUES ('602531', 'Broadnose sevengill shark', 'Notorynchus cepedianus');
INSERT INTO "public"."taxon" VALUES ('602532', 'Nurse shark', 'Ginglymostoma cirratum');
INSERT INTO "public"."taxon" VALUES ('602534', 'Bigeye thresher', 'Alopias superciliosus');
INSERT INTO "public"."taxon" VALUES ('602535', 'Thintail thresher', 'Alopias vulpinus');
INSERT INTO "public"."taxon" VALUES ('602536', 'False catshark', 'Pseudotriakis microdon');
INSERT INTO "public"."taxon" VALUES ('602540', 'Brown smooth-hound', 'Mustelus henlei');
INSERT INTO "public"."taxon" VALUES ('602544', 'Pacific sleeper shark', 'Somniosus pacificus');
INSERT INTO "public"."taxon" VALUES ('602557', 'Little skate', 'Leucoraja erinacea');
INSERT INTO "public"."taxon" VALUES ('602561', 'Barndoor skate', 'Dipturus laevis');
INSERT INTO "public"."taxon" VALUES ('602570', 'Starry skate', 'Raja stellulata');
INSERT INTO "public"."taxon" VALUES ('602572', 'Roughtail stingray', 'Dasyatis centroura');
INSERT INTO "public"."taxon" VALUES ('602577', 'Spiny butterfly ray', 'Gymnura altavela');
INSERT INTO "public"."taxon" VALUES ('602579', 'Smooth butterfly ray', 'Gymnura micrura');
INSERT INTO "public"."taxon" VALUES ('602589', 'Spotted ratfish', 'Hydrolagus colliei');
INSERT INTO "public"."taxon" VALUES ('602592', 'Green sturgeon', 'Acipenser medirostris');
INSERT INTO "public"."taxon" VALUES ('602594', 'White sturgeon', 'Acipenser transmontanus');
INSERT INTO "public"."taxon" VALUES ('602661', 'Spiny eel', 'Notacanthus chemnitzii');
INSERT INTO "public"."taxon" VALUES ('602669', 'Arctic cisco', 'Coregonus autumnalis');
INSERT INTO "public"."taxon" VALUES ('602674', 'Broad whitefish', 'Coregonus nasus');
INSERT INTO "public"."taxon" VALUES ('602676', 'Humpback whitefish', 'Coregonus pidschian');
INSERT INTO "public"."taxon" VALUES ('602678', 'Sardine cisco', 'Coregonus sardinella');
INSERT INTO "public"."taxon" VALUES ('602691', 'Dolly varden', 'Salvelinus malma malma');
INSERT INTO "public"."taxon" VALUES ('602692', 'Inconnu', 'Stenodus leucichthys');
INSERT INTO "public"."taxon" VALUES ('602700', 'Greater argentine', 'Argentina silus');
INSERT INTO "public"."taxon" VALUES ('602801', 'Orfe', 'Leuciscus idus');
INSERT INTO "public"."taxon" VALUES ('602951', 'Rudd', 'Scardinius erythrophthalmus');
INSERT INTO "public"."taxon" VALUES ('603249', 'Longjaw squirrelfish', 'Neoniphon marianus');
INSERT INTO "public"."taxon" VALUES ('603255', 'Mirror dory', 'Zenopsis nebulosa');
INSERT INTO "public"."taxon" VALUES ('603265', 'Dealfish', 'Trachipterus arcticus');
INSERT INTO "public"."taxon" VALUES ('603267', 'King of herrings', 'Regalecus glesne');
INSERT INTO "public"."taxon" VALUES ('603275', 'Cornet fish', 'Fistularia tabacaria');
INSERT INTO "public"."taxon" VALUES ('603310', 'Giant sea-bass', 'Stereolepis gigas');
INSERT INTO "public"."taxon" VALUES ('603334', 'Broomtail grouper', 'Mycteroperca xenarcha');
INSERT INTO "public"."taxon" VALUES ('603539', 'Ocean whitefish', 'Caulolatilus princeps');
INSERT INTO "public"."taxon" VALUES ('603542', 'Cobia', 'Rachycentron canadum');
INSERT INTO "public"."taxon" VALUES ('603561', 'Sickle pomfret', 'Taractichthys steindachneri');
INSERT INTO "public"."taxon" VALUES ('603565', 'Graceful mojarra', 'Eucinostomus gracilis');
INSERT INTO "public"."taxon" VALUES ('603572', 'Boga', 'Haemulon vittata');
INSERT INTO "public"."taxon" VALUES ('603574', 'South American silver porgy', 'Diplodus argenteus argenteus');
INSERT INTO "public"."taxon" VALUES ('603578', 'White weakfish', 'Atractoscion nobilis');
INSERT INTO "public"."taxon" VALUES ('603594', 'Opaleye', 'Girella nigricans');
INSERT INTO "public"."taxon" VALUES ('603599', 'Pacific spadefish', 'Chaetodipterus zonatus');
INSERT INTO "public"."taxon" VALUES ('603611', 'Pelagic armorhead', 'Pseudopentaceros richardsoni');
INSERT INTO "public"."taxon" VALUES ('603671', 'California sheephead', 'Semicossyphus pulcher');
INSERT INTO "public"."taxon" VALUES ('603672', 'Cunner', 'Tautogolabrus adspersus');
INSERT INTO "public"."taxon" VALUES ('603680', 'Blue bobo', 'Polydactylus approximans');
INSERT INTO "public"."taxon" VALUES ('603810', 'Northern wolffish', 'Anarhichas denticulatus');
INSERT INTO "public"."taxon" VALUES ('603811', 'Spotted wolffish', 'Anarhichas minor');
INSERT INTO "public"."taxon" VALUES ('603915', 'Shortbill spearfish', 'Tetrapturus angustirostris');
INSERT INTO "public"."taxon" VALUES ('603920', 'Black driftfish', 'Hyperoglyphe bythites');
INSERT INTO "public"."taxon" VALUES ('603923', 'Harvestfish', 'Peprilus alepidotus');
INSERT INTO "public"."taxon" VALUES ('603971', 'Chilipepper', 'Sebastes goodei');
INSERT INTO "public"."taxon" VALUES ('603979', 'Black rockfish', 'Sebastes melanops');
INSERT INTO "public"."taxon" VALUES ('603987', 'Bocaccio', 'Sebastes paucispinis');
INSERT INTO "public"."taxon" VALUES ('603989', 'Canary rockfish', 'Sebastes pinniger');
INSERT INTO "public"."taxon" VALUES ('604009', 'Shortspine thornyhead', 'Sebastolobus alascanus');
INSERT INTO "public"."taxon" VALUES ('604011', 'Atlantic thornyhead', 'Trachyscorpia cristulata cristulata');
INSERT INTO "public"."taxon" VALUES ('604014', 'Horned searobin', 'Bellator militaris');
INSERT INTO "public"."taxon" VALUES ('604025', 'Blackwing searobin', 'Prionotus rubio');
INSERT INTO "public"."taxon" VALUES ('604029', 'Lumptail searobin', 'Prionotus stephanophrys');
INSERT INTO "public"."taxon" VALUES ('604037', 'Atka mackerel', 'Pleurogrammus monopterygius');
INSERT INTO "public"."taxon" VALUES ('604122', 'Fourhorn sculpin', 'Triglopsis quadricornis');
INSERT INTO "public"."taxon" VALUES ('604140', 'Cabezon', 'Scorpaenichthys marmoratus');
INSERT INTO "public"."taxon" VALUES ('604215', 'Pacific sanddab', 'Citharichthys sordidus');
INSERT INTO "public"."taxon" VALUES ('604228', 'California flounder', 'Paralichthys californicus');
INSERT INTO "public"."taxon" VALUES ('604237', 'Petrale sole', 'Eopsetta jordani');
INSERT INTO "public"."taxon" VALUES ('604238', 'Rex sole', 'Glyptocephalus zachirus');
INSERT INTO "public"."taxon" VALUES ('604239', 'American plaice', 'Hippoglossoides platessoides');
INSERT INTO "public"."taxon" VALUES ('604247', 'Dover sole', 'Microstomus pacificus');
INSERT INTO "public"."taxon" VALUES ('604248', 'English sole', 'Parophrys vetulus');
INSERT INTO "public"."taxon" VALUES ('604249', 'Starry flounder', 'Platichthys stellatus');
INSERT INTO "public"."taxon" VALUES ('604250', 'Alaska plaice', 'Pleuronectes quadrituberculatus');
INSERT INTO "public"."taxon" VALUES ('604252', 'Curlfin sole', 'Pleuronichthys decurrens');
INSERT INTO "public"."taxon" VALUES ('604255', 'West American sand sole', 'Psettichthys melanostictus');
INSERT INTO "public"."taxon" VALUES ('604275', 'Scrawled filefish', 'Aluterus scriptus');
INSERT INTO "public"."taxon" VALUES ('604278', 'Ocean triggerfish', 'Canthidermis maculata');
INSERT INTO "public"."taxon" VALUES ('604279', 'Ocean triggerfish', 'Canthidermis sufflamen');
INSERT INTO "public"."taxon" VALUES ('604304', 'Grey bambooshark', 'Chiloscyllium griseum');
INSERT INTO "public"."taxon" VALUES ('604306', 'Achilles tang', 'Acanthurus achilles');
INSERT INTO "public"."taxon" VALUES ('604313', 'Normans camote', 'Normanichthys crockeri');
INSERT INTO "public"."taxon" VALUES ('604318', 'Velvet whalefish', 'Barbourisia rufa');
INSERT INTO "public"."taxon" VALUES ('604326', 'Cuckoo ray', 'Leucoraja naevus');
INSERT INTO "public"."taxon" VALUES ('604329', 'Spotted ray', 'Raja montagui');
INSERT INTO "public"."taxon" VALUES ('604330', 'Common eagle ray', 'Myliobatis aquila');
INSERT INTO "public"."taxon" VALUES ('604333', 'Greater eelpout', 'Lycodes esmarkii');
INSERT INTO "public"."taxon" VALUES ('604340', 'Whitebar gregory', 'Stegastes albifasciatus');
INSERT INTO "public"."taxon" VALUES ('604351', 'Blunt snout gregory', 'Stegastes lividus');
INSERT INTO "public"."taxon" VALUES ('604355', 'Carolines parrotfish', 'Calotomus carolinus');
INSERT INTO "public"."taxon" VALUES ('604357', 'Spinytooth parrotfish', 'Calotomus spinidens');
INSERT INTO "public"."taxon" VALUES ('604360', 'Marbled parrotfish', 'Leptoscarus vaigiensis');
INSERT INTO "public"."taxon" VALUES ('604443', 'Malabar trevally', 'Carangoides malabaricus');
INSERT INTO "public"."taxon" VALUES ('604445', 'Sulphur goatfish', 'Upeneus sulphureus');
INSERT INTO "public"."taxon" VALUES ('604451', 'Common ponyfish', 'Leiognathus equulus');
INSERT INTO "public"."taxon" VALUES ('604456', 'White-spotted spinefoot', 'Siganus canaliculatus');
INSERT INTO "public"."taxon" VALUES ('604457', 'Little spinefoot', 'Siganus spinus');
INSERT INTO "public"."taxon" VALUES ('604458', 'Jarbua terapon', 'Terapon jarbua');
INSERT INTO "public"."taxon" VALUES ('604460', 'Brown-marbled grouper', 'Epinephelus fuscoguttatus');
INSERT INTO "public"."taxon" VALUES ('604461', 'Greasy grouper', 'Epinephelus tauvina');
INSERT INTO "public"."taxon" VALUES ('604462', 'Toothpony', 'Gazza minuta');
INSERT INTO "public"."taxon" VALUES ('604464', 'Golden trevally', 'Gnathanodon speciosus');
INSERT INTO "public"."taxon" VALUES ('604465', 'Painted sweetlips', 'Diagramma picta');
INSERT INTO "public"."taxon" VALUES ('604466', 'Yellow-spotted triggerfish', 'Pseudobalistes fuscus');
INSERT INTO "public"."taxon" VALUES ('604474', 'Ruffe', 'Gymnocephalus cernua');
INSERT INTO "public"."taxon" VALUES ('604485', 'Oriental flying gurnard', 'Dactyloptena orientalis');
INSERT INTO "public"."taxon" VALUES ('604493', 'Obtuse barracuda', 'Sphyraena obtusata');
INSERT INTO "public"."taxon" VALUES ('604499', 'Sobaity seabream', 'Sparidentex hasta');
INSERT INTO "public"."taxon" VALUES ('604504', 'Spottail spiny turbot', 'Psettodes belcheri');
INSERT INTO "public"."taxon" VALUES ('604505', 'Threetooth puffer', 'Triodon macropterus');
INSERT INTO "public"."taxon" VALUES ('604508', 'Bluespotted stingray', 'Neotrygon kuhlii');
INSERT INTO "public"."taxon" VALUES ('604534', 'Gracile lizardfish', 'Saurida gracilis');
INSERT INTO "public"."taxon" VALUES ('604536', 'Pink dentex', 'Dentex gibbosus');
INSERT INTO "public"."taxon" VALUES ('604538', 'Morocco dentex', 'Dentex maroccanus');
INSERT INTO "public"."taxon" VALUES ('604539', 'Canary dentex', 'Dentex canariensis');
INSERT INTO "public"."taxon" VALUES ('604540', 'Bluespotted seabream', 'Pagrus caeruleostictus');
INSERT INTO "public"."taxon" VALUES ('604543', 'Twobar seabream', 'Acanthopagrus bifasciatus');
INSERT INTO "public"."taxon" VALUES ('604544', 'Silver sillago', 'Sillago sihama');
INSERT INTO "public"."taxon" VALUES ('604548', 'Canary drum', 'Umbrina canariensis');
INSERT INTO "public"."taxon" VALUES ('604552', 'Blonde ray', 'Raja brachyura');
INSERT INTO "public"."taxon" VALUES ('604556', 'Roughsnout grenadier', 'Trachyrincus scabrus');
INSERT INTO "public"."taxon" VALUES ('604559', 'Japanese threadfin bream', 'Nemipterus japonicus');
INSERT INTO "public"."taxon" VALUES ('604561', 'Vermiculated spinefoot', 'Siganus vermiculatus');
INSERT INTO "public"."taxon" VALUES ('604569', 'Mi-iuy croaker', 'Miichthys miiuy');
INSERT INTO "public"."taxon" VALUES ('604581', 'Pearly razorfish', 'Xyrichtys novacula');
INSERT INTO "public"."taxon" VALUES ('604582', 'Brown wrasse', 'Labrus merula');
INSERT INTO "public"."taxon" VALUES ('604583', 'Thinlip grey mullet', 'Liza ramada');
INSERT INTO "public"."taxon" VALUES ('604588', 'Goldlined spinefoot', 'Siganus guttatus');
INSERT INTO "public"."taxon" VALUES ('604589', 'Japanese seaperch', 'Lateolabrax japonicus');
INSERT INTO "public"."taxon" VALUES ('604597', 'False kelpfish', 'Sebastiscus marmoratus');
INSERT INTO "public"."taxon" VALUES ('604598', 'Red gurnard', 'Chelidonichthys spinosus');
INSERT INTO "public"."taxon" VALUES ('604599', 'Rosy seabass', 'Doederleinia berycoides');
INSERT INTO "public"."taxon" VALUES ('604604', 'Sterlet', 'Acipenser ruthenus');
INSERT INTO "public"."taxon" VALUES ('604611', 'Blue-spotted spinefoot', 'Siganus corallinus');
INSERT INTO "public"."taxon" VALUES ('604613', 'Dusky spinefoot', 'Siganus luridus');
INSERT INTO "public"."taxon" VALUES ('604614', 'Streamlined spinefoot', 'Siganus argenteus');
INSERT INTO "public"."taxon" VALUES ('604615', 'Shoemaker spinefoot', 'Siganus sutor');
INSERT INTO "public"."taxon" VALUES ('604620', 'Peppered spinefoot', 'Siganus punctatissimus');
INSERT INTO "public"."taxon" VALUES ('604621', 'Goldspotted spinefoot', 'Siganus punctatus');
INSERT INTO "public"."taxon" VALUES ('604625', 'Golden-lined spinefoot', 'Siganus lineatus');
INSERT INTO "public"."taxon" VALUES ('604626', 'Variegated spinefoot', 'Siganus randalli');
INSERT INTO "public"."taxon" VALUES ('604641', 'Congo dentex', 'Dentex congoensis');
INSERT INTO "public"."taxon" VALUES ('604642', 'Tope shark', 'Galeorhinus galeus');
INSERT INTO "public"."taxon" VALUES ('604683', 'Siberian sturgeon', 'Acipenser baerii baerii');
INSERT INTO "public"."taxon" VALUES ('604698', 'Spotted scat', 'Scatophagus argus');
INSERT INTO "public"."taxon" VALUES ('604699', 'Crown squirrelfish', 'Sargocentron diadema');
INSERT INTO "public"."taxon" VALUES ('604702', 'Yellowbelly rockcod', 'Notothenia coriiceps');
INSERT INTO "public"."taxon" VALUES ('604706', 'Striped eel catfish', 'Plotosus lineatus');
INSERT INTO "public"."taxon" VALUES ('604708', 'Sompat grunt', 'Pomadasys jubelini');
INSERT INTO "public"."taxon" VALUES ('604712', 'Russian sturgeon', 'Acipenser gueldenstaedtii');
INSERT INTO "public"."taxon" VALUES ('604722', 'Ghost shark', 'Callorhinchus milii');
INSERT INTO "public"."taxon" VALUES ('604733', 'Bluelined surgeon', 'Acanthurus nubilus');
INSERT INTO "public"."taxon" VALUES ('604736', 'Whitespotted surgeonfish', 'Acanthurus guttatus');
INSERT INTO "public"."taxon" VALUES ('604739', 'Brown surgeonfish', 'Acanthurus nigrofuscus');
INSERT INTO "public"."taxon" VALUES ('604740', 'Sohal surgeonfish', 'Acanthurus sohal');
INSERT INTO "public"."taxon" VALUES ('604742', 'Chocolate surgeonfish', 'Acanthurus pyroferus');
INSERT INTO "public"."taxon" VALUES ('604744', 'Orangespot surgeonfish', 'Acanthurus olivaceus');
INSERT INTO "public"."taxon" VALUES ('604746', 'White freckled surgeonfish', 'Acanthurus maculiceps');
INSERT INTO "public"."taxon" VALUES ('604747', 'Epaulette surgeonfish', 'Acanthurus nigricauda');
INSERT INTO "public"."taxon" VALUES ('604750', 'Ringtail surgeonfish', 'Acanthurus blochii');
INSERT INTO "public"."taxon" VALUES ('604783', 'Asp', 'Aspius aspius');
INSERT INTO "public"."taxon" VALUES ('604791', 'So-iuy mullet', 'Mugil soiuy');
INSERT INTO "public"."taxon" VALUES ('604796', 'Pacific bonito', 'Sarda chiliensis lineolata');
INSERT INTO "public"."taxon" VALUES ('604821', 'Yellowstriped goatfish', 'Upeneus vittatus');
INSERT INTO "public"."taxon" VALUES ('604824', 'Tiger-toothed croaker', 'Otolithes ruber');
INSERT INTO "public"."taxon" VALUES ('604826', 'Leopard coralgrouper', 'Plectropomus leopardus');
INSERT INTO "public"."taxon" VALUES ('604827', 'Pickhandle barracuda', 'Sphyraena jello');
INSERT INTO "public"."taxon" VALUES ('604887', 'Blotched picarel', 'Spicara maena');
INSERT INTO "public"."taxon" VALUES ('604888', 'Bluespotted wrasse', 'Anampses caeruleopunctatus');
INSERT INTO "public"."taxon" VALUES ('604905', 'Undulated moray', 'Gymnothorax undulatus');
INSERT INTO "public"."taxon" VALUES ('604906', 'Speckled squirrelfish', 'Sargocentron punctatissimum');
INSERT INTO "public"."taxon" VALUES ('604907', 'Silverspot squirrelfish', 'Sargocentron caudimaculatum');
INSERT INTO "public"."taxon" VALUES ('604908', 'Bluelined squirrelfish', 'Sargocentron tiere');
INSERT INTO "public"."taxon" VALUES ('604909', 'Violet squirrelfish', 'Sargocentron violaceum');
INSERT INTO "public"."taxon" VALUES ('604910', 'Blotcheye soldierfish', 'Myripristis berndti');
INSERT INTO "public"."taxon" VALUES ('604911', 'Sammara squirrelfish', 'Neoniphon sammara');
INSERT INTO "public"."taxon" VALUES ('604913', 'Radial firefish', 'Pterois radiata');
INSERT INTO "public"."taxon" VALUES ('604921', 'False stonefish', 'Scorpaenopsis diabolus');
INSERT INTO "public"."taxon" VALUES ('604923', 'Honeycomb grouper', 'Epinephelus merra');
INSERT INTO "public"."taxon" VALUES ('604925', 'Goldenstriped soapfish', 'Grammistes sexlineatus');
INSERT INTO "public"."taxon" VALUES ('604943', 'Atlantic spotted flounder', 'Citharus linguatula');
INSERT INTO "public"."taxon" VALUES ('604959', 'West African ladyfish', 'Elops lacerta');
INSERT INTO "public"."taxon" VALUES ('604961', 'Dungat grouper', 'Epinephelus goreensis');
INSERT INTO "public"."taxon" VALUES ('604964', 'Mediterranean slimehead', 'Hoplostethus mediterraneus mediterraneus');
INSERT INTO "public"."taxon" VALUES ('604969', 'Rivulated parrotfish', 'Scarus rivulatus');
INSERT INTO "public"."taxon" VALUES ('604970', 'Globehead parrotfish', 'Scarus globiceps');
INSERT INTO "public"."taxon" VALUES ('604973', 'Yellowbarred parrotfish', 'Scarus dimidiatus');
INSERT INTO "public"."taxon" VALUES ('604975', 'Yellowband parrotfish', 'Scarus schlegeli');
INSERT INTO "public"."taxon" VALUES ('604984', 'Blackspotted wrasse', 'Macropharyngodon meleagris');
INSERT INTO "public"."taxon" VALUES ('604988', 'Shortspine African angler', 'Lophius vaillanti');
INSERT INTO "public"."taxon" VALUES ('604996', 'Smooth-hound', 'Mustelus mustelus');
INSERT INTO "public"."taxon" VALUES ('604997', 'Common Atlantic grenadier', 'Nezumia aequalis');
INSERT INTO "public"."taxon" VALUES ('605002', 'Giant African threadfin', 'Polydactylus quadrifilis');
INSERT INTO "public"."taxon" VALUES ('605003', 'Bastard grunt', 'Pomadasys incisus');
INSERT INTO "public"."taxon" VALUES ('605007', 'Offshore rockfish', 'Pontinus kuhlii');
INSERT INTO "public"."taxon" VALUES ('605008', 'Roudi escolar', 'Promethichthys prometheus');
INSERT INTO "public"."taxon" VALUES ('605009', 'Law croaker', 'Pseudotolithus senegallus');
INSERT INTO "public"."taxon" VALUES ('605014', 'Brown ray', 'Raja miraletus');
INSERT INTO "public"."taxon" VALUES ('605038', 'Piper gurnard', 'Trigla lyra');
INSERT INTO "public"."taxon" VALUES ('605048', 'Eastern Australian salmon', 'Arripis trutta');
INSERT INTO "public"."taxon" VALUES ('605066', 'Redbanded seabream', 'Pagrus auriga');
INSERT INTO "public"."taxon" VALUES ('605068', 'Spiny turbot', 'Psettodes bennettii');
INSERT INTO "public"."taxon" VALUES ('605071', 'Rissos smooth-head', 'Alepocephalus rostratus');
INSERT INTO "public"."taxon" VALUES ('605081', 'Streaked gurnard', 'Trigloporus lastoviza');
INSERT INTO "public"."taxon" VALUES ('605094', 'Black-bellied angler', 'Lophius budegassa');
INSERT INTO "public"."taxon" VALUES ('605098', 'Borostomias antarcticus', 'Borostomias antarcticus');
INSERT INTO "public"."taxon" VALUES ('605109', 'Tubelip wrasse', 'Labrichthys unilineatus');
INSERT INTO "public"."taxon" VALUES ('605110', 'Whitetail dascyllus', 'Dascyllus aruanus');
INSERT INTO "public"."taxon" VALUES ('605112', 'Threespot dascyllus', 'Dascyllus trimaculatus');
INSERT INTO "public"."taxon" VALUES ('605122', 'Yellowing flyingfish', 'Cypselurus poecilopterus');
INSERT INTO "public"."taxon" VALUES ('605133', 'Pike icefish', 'Champsocephalus esox');
INSERT INTO "public"."taxon" VALUES ('605158', 'Hong Kong grouper', 'Epinephelus akaara');
INSERT INTO "public"."taxon" VALUES ('605188', 'Puntius katolo', 'Puntius katolo');
INSERT INTO "public"."taxon" VALUES ('605195', 'Red lionfish', 'Pterois volitans');
INSERT INTO "public"."taxon" VALUES ('605345', 'Blackblotch squirrelfish', 'Sargocentron melanospilos');
INSERT INTO "public"."taxon" VALUES ('605348', 'Blacktip grouper', 'Epinephelus fasciatus');
INSERT INTO "public"."taxon" VALUES ('605350', 'Highfin grouper', 'Epinephelus maculatus');
INSERT INTO "public"."taxon" VALUES ('605353', 'Comet grouper', 'Epinephelus morrhua');
INSERT INTO "public"."taxon" VALUES ('605354', 'Yellow-edged lyretail', 'Variola louti');
INSERT INTO "public"."taxon" VALUES ('605355', 'Twaite shad', 'Alosa fallax');
INSERT INTO "public"."taxon" VALUES ('605366', 'Garish hind', 'Cephalopholis igarashiensis');
INSERT INTO "public"."taxon" VALUES ('605367', 'Areolate grouper', 'Epinephelus areolatus');
INSERT INTO "public"."taxon" VALUES ('605368', 'Goldlined seabream', 'Rhabdosargus sarba');
INSERT INTO "public"."taxon" VALUES ('605376', 'Marble goby', 'Oxyeleotris marmorata');
INSERT INTO "public"."taxon" VALUES ('605382', 'Cape horse mackerel', 'Trachurus capensis');
INSERT INTO "public"."taxon" VALUES ('605388', 'Snowflake moray', 'Echidna nebulosa');
INSERT INTO "public"."taxon" VALUES ('605389', 'Barred moray', 'Echidna polyzona');
INSERT INTO "public"."taxon" VALUES ('605392', 'Yellow-edged moray', 'Gymnothorax flavimarginatus');
INSERT INTO "public"."taxon" VALUES ('605393', 'Blotch-necked moray', 'Gymnothorax margaritophorus');
INSERT INTO "public"."taxon" VALUES ('605394', 'Turkey moray', 'Gymnothorax meleagris');
INSERT INTO "public"."taxon" VALUES ('605396', 'Banded moray', 'Gymnothorax rueppellii');
INSERT INTO "public"."taxon" VALUES ('605398', 'Variegated lizardfish', 'Synodus variegatus');
INSERT INTO "public"."taxon" VALUES ('605402', 'Scarlet frogfish', 'Antennarius coccineus');
INSERT INTO "public"."taxon" VALUES ('605404', 'Black-barred halfbeak', 'Hemiramphus far');
INSERT INTO "public"."taxon" VALUES ('605406', 'Threespot squirrelfish', 'Sargocentron cornutum');
INSERT INTO "public"."taxon" VALUES ('605408', 'Pinecone soldierfish', 'Myripristis murdjan');
INSERT INTO "public"."taxon" VALUES ('605425', 'White-spotted puffer', 'Arothron hispidus');
INSERT INTO "public"."taxon" VALUES ('605429', 'Lusitanian toadfish', 'Halobatrachus didactylus');
INSERT INTO "public"."taxon" VALUES ('605444', 'Bluespotted cornetfish', 'Fistularia commersonii');
INSERT INTO "public"."taxon" VALUES ('605457', 'Lemonpeel angelfish', 'Centropyge flavissima');
INSERT INTO "public"."taxon" VALUES ('605459', 'Bluestreak cleaner wrasse', 'Labroides dimidiatus');
INSERT INTO "public"."taxon" VALUES ('605477', 'Staghorn damselfish', 'Amblyglyphidodon curacao');
INSERT INTO "public"."taxon" VALUES ('605482', 'Fivelined cardinalfish', 'Cheilodipterus quinquelineatus');
INSERT INTO "public"."taxon" VALUES ('605492', 'Small-eyed ray', 'Raja microocellata');
INSERT INTO "public"."taxon" VALUES ('605498', 'Axilspot hogfish', 'Bodianus axillaris');
INSERT INTO "public"."taxon" VALUES ('605503', 'Giant guitarfish', 'Rhynchobatus djiddensis');
INSERT INTO "public"."taxon" VALUES ('605504', 'Cape gurnard', 'Chelidonichthys capensis');
INSERT INTO "public"."taxon" VALUES ('605524', 'Brownspotted grouper', 'Epinephelus chlorostigma');
INSERT INTO "public"."taxon" VALUES ('605526', 'Picnic seabream', 'Acanthopagrus berda');
INSERT INTO "public"."taxon" VALUES ('605537', 'Green humphead parrotfish', 'Bolbometopon muricatum');
INSERT INTO "public"."taxon" VALUES ('605538', 'Bicolour parrotfish', 'Cetoscarus bicolor');
INSERT INTO "public"."taxon" VALUES ('605539', 'Pacific longnose parrotfish', 'Hipposcarus longiceps');
INSERT INTO "public"."taxon" VALUES ('605540', 'Filament-finned parrotfish', 'Scarus altipinnis');
INSERT INTO "public"."taxon" VALUES ('605544', 'Festive parrotfish', 'Scarus festivus');
INSERT INTO "public"."taxon" VALUES ('605545', 'Forstens parrotfish', 'Scarus forsteni');
INSERT INTO "public"."taxon" VALUES ('605546', 'Bridled parrotfish', 'Scarus frenatus');
INSERT INTO "public"."taxon" VALUES ('605547', 'Tan-faced parrotfish', 'Chlorurus frontalis');
INSERT INTO "public"."taxon" VALUES ('605548', 'Blue-barred parrotfish', 'Scarus ghobban');
INSERT INTO "public"."taxon" VALUES ('605550', 'Dusky parrotfish', 'Scarus niger');
INSERT INTO "public"."taxon" VALUES ('605551', 'Darkcapped parrotfish', 'Scarus oviceps');
INSERT INTO "public"."taxon" VALUES ('605553', 'Common parrotfish', 'Scarus psittacus');
INSERT INTO "public"."taxon" VALUES ('605555', 'Ember parrotfish', 'Scarus rubroviolaceus');
INSERT INTO "public"."taxon" VALUES ('605556', 'Daisy parrotfish', 'Chlorurus sordidus');
INSERT INTO "public"."taxon" VALUES ('605557', 'Threadfin butterflyfish', 'Chaetodon auriga');
INSERT INTO "public"."taxon" VALUES ('605559', 'Bluelashed butterflyfish', 'Chaetodon bennetti');
INSERT INTO "public"."taxon" VALUES ('605561', 'Speckled butterflyfish', 'Chaetodon citrinellus');
INSERT INTO "public"."taxon" VALUES ('605562', 'Saddle butterflyfish', 'Chaetodon ephippium');
INSERT INTO "public"."taxon" VALUES ('605564', 'Lined butterflyfish', 'Chaetodon lineolatus');
INSERT INTO "public"."taxon" VALUES ('605565', 'Raccoon butterflyfish', 'Chaetodon lunula');
INSERT INTO "public"."taxon" VALUES ('605566', 'Blackback butterflyfish', 'Chaetodon melannotus');
INSERT INTO "public"."taxon" VALUES ('605567', 'Atoll butterflyfish', 'Chaetodon mertensii');
INSERT INTO "public"."taxon" VALUES ('605572', 'Fourspot butterflyfish', 'Chaetodon quadrimaculatus');
INSERT INTO "public"."taxon" VALUES ('605574', 'Mailed butterflyfish', 'Chaetodon reticulatus');
INSERT INTO "public"."taxon" VALUES ('605578', 'Chevron butterflyfish', 'Chaetodon trifascialis');
INSERT INTO "public"."taxon" VALUES ('605580', 'Pacific doublesaddle butterflyfish', 'Chaetodon ulietensis');
INSERT INTO "public"."taxon" VALUES ('605581', 'Teardrop butterflyfish', 'Chaetodon unimaculatus');
INSERT INTO "public"."taxon" VALUES ('605584', 'Longnose butterfly fish', 'Forcipiger flavissimus');
INSERT INTO "public"."taxon" VALUES ('605586', 'Pyramid butterflyfish', 'Hemitaurichthys polylepis');
INSERT INTO "public"."taxon" VALUES ('605588', 'Pennant coralfish', 'Heniochus acuminatus');
INSERT INTO "public"."taxon" VALUES ('605589', 'Threeband pennantfish', 'Heniochus chrysostomus');
INSERT INTO "public"."taxon" VALUES ('605590', 'Masked bannerfish', 'Heniochus monoceros');
INSERT INTO "public"."taxon" VALUES ('605591', 'Singular bannerfish', 'Heniochus singularius');
INSERT INTO "public"."taxon" VALUES ('605595', 'Speckled maori wrasse', 'Oxycheilinus arenatus');
INSERT INTO "public"."taxon" VALUES ('605597', 'Celebes wrasse', 'Oxycheilinus celebicus');
INSERT INTO "public"."taxon" VALUES ('605598', 'Floral wrasse', 'Cheilinus chlorourus');
INSERT INTO "public"."taxon" VALUES ('605599', 'Cheeklined wrasse', 'Oxycheilinus digramma');
INSERT INTO "public"."taxon" VALUES ('605600', 'Redbreast wrasse', 'Cheilinus fasciatus');
INSERT INTO "public"."taxon" VALUES ('605601', 'Oriental maori wrasse', 'Oxycheilinus orientalis');
INSERT INTO "public"."taxon" VALUES ('605603', 'Tripletail wrasse', 'Cheilinus trilobatus');
INSERT INTO "public"."taxon" VALUES ('605604', 'Humphead wrasse', 'Cheilinus undulatus');
INSERT INTO "public"."taxon" VALUES ('605605', 'Ringtail maori wrasse', 'Oxycheilinus unifasciatus');
INSERT INTO "public"."taxon" VALUES ('605606', 'Slingjaw wrasse', 'Epibulus insidiator');
INSERT INTO "public"."taxon" VALUES ('605607', 'Knife razorfish', 'Cymolutes praetextatus');
INSERT INTO "public"."taxon" VALUES ('605610', 'Rockmover wrasse', 'Novaculichthys taeniourus');
INSERT INTO "public"."taxon" VALUES ('605611', 'Yellowblotch razorfish', 'Iniistius aneitensis');
INSERT INTO "public"."taxon" VALUES ('605613', 'Peacock wrasse', 'Iniistius pavo');
INSERT INTO "public"."taxon" VALUES ('605621', 'Sneaky wrasse', 'Pteragogus guttatus');
INSERT INTO "public"."taxon" VALUES ('605623', 'Cigar wrasse', 'Cheilio inermis');
INSERT INTO "public"."taxon" VALUES ('605624', 'Clown coris', 'Coris aygula');
INSERT INTO "public"."taxon" VALUES ('605626', 'Bird wrasse', 'Gomphosus varius');
INSERT INTO "public"."taxon" VALUES ('605627', 'Redlined wrasse', 'Halichoeres biocellatus');
INSERT INTO "public"."taxon" VALUES ('605630', 'Pink-belly wrasse', 'Halichoeres margaritaceus');
INSERT INTO "public"."taxon" VALUES ('605631', 'Dusky wrasse', 'Halichoeres marginatus');
INSERT INTO "public"."taxon" VALUES ('605632', 'Richmonds wrasse', 'Halichoeres richmondi');
INSERT INTO "public"."taxon" VALUES ('605634', 'Threespot wrasse', 'Halichoeres trimaculatus');
INSERT INTO "public"."taxon" VALUES ('605635', 'Barred thicklip', 'Hemigymnus fasciatus');
INSERT INTO "public"."taxon" VALUES ('605636', 'Blackeye thicklip', 'Hemigymnus melapterus');
INSERT INTO "public"."taxon" VALUES ('605638', 'Pastel ringwrasse', 'Hologymnosus doliatus');
INSERT INTO "public"."taxon" VALUES ('605640', 'Red shoulder wrasse', 'Stethojulis bandanensis');
INSERT INTO "public"."taxon" VALUES ('605643', 'Sixbar wrasse', 'Thalassoma hardwicke');
INSERT INTO "public"."taxon" VALUES ('605645', 'Moon wrasse', 'Thalassoma lunare');
INSERT INTO "public"."taxon" VALUES ('605646', 'Yellow-brown wrasse', 'Thalassoma lutescens');
INSERT INTO "public"."taxon" VALUES ('605647', 'Surge wrasse', 'Thalassoma purpureum');
INSERT INTO "public"."taxon" VALUES ('605648', 'Fivestripe wrasse', 'Thalassoma quinquevittatum');
INSERT INTO "public"."taxon" VALUES ('605649', 'Christmas wrasse', 'Thalassoma trilobatum');
INSERT INTO "public"."taxon" VALUES ('605652', 'Acute-jawed mullet', 'Neomyxus leuciscus');
INSERT INTO "public"."taxon" VALUES ('605653', 'Fringelip mullet', 'Crenimugil crenilabis');
INSERT INTO "public"."taxon" VALUES ('605656', 'Squaretail mullet', 'Liza vaigiensis');
INSERT INTO "public"."taxon" VALUES ('605658', 'Kanda', 'Valamugil engeli');
INSERT INTO "public"."taxon" VALUES ('605659', 'Bluespot mullet', 'Valamugil seheli');
INSERT INTO "public"."taxon" VALUES ('605675', 'Bicolor chromis', 'Chromis margaritifer');
INSERT INTO "public"."taxon" VALUES ('605677', 'Ternate chromis', 'Chromis ternatensis');
INSERT INTO "public"."taxon" VALUES ('605679', 'Blue-green damselfish', 'Chromis viridis');
INSERT INTO "public"."taxon" VALUES ('605687', 'Banded sergeant', 'Abudefduf septemfasciatus');
INSERT INTO "public"."taxon" VALUES ('605688', 'Scissortail sergeant', 'Abudefduf sexfasciatus');
INSERT INTO "public"."taxon" VALUES ('605689', 'Blackspot sergeant', 'Abudefduf sordidus');
INSERT INTO "public"."taxon" VALUES ('605693', 'Twinspot damselfish', 'Chrysiptera biocellata');
INSERT INTO "public"."taxon" VALUES ('605696', 'Grey demoiselle', 'Chrysiptera glauca');
INSERT INTO "public"."taxon" VALUES ('605712', 'Whitespotted devil', 'Plectroglyphidodon lacrymatus');
INSERT INTO "public"."taxon" VALUES ('605713', 'Singlebar devil', 'Plectroglyphidodon leucozonus');
INSERT INTO "public"."taxon" VALUES ('605715', 'Ambon damsel', 'Pomacentrus amboinensis');
INSERT INTO "public"."taxon" VALUES ('605726', 'Sapphire damsel', 'Pomacentrus pavo');
INSERT INTO "public"."taxon" VALUES ('605730', 'Ocellate damselfish', 'Pomacentrus vaiuli');
INSERT INTO "public"."taxon" VALUES ('605733', 'Sharpfin barracuda', 'Sphyraena acutipinnis');
INSERT INTO "public"."taxon" VALUES ('605734', 'Bigeye barracuda', 'Sphyraena forsteri');
INSERT INTO "public"."taxon" VALUES ('605736', 'Australian barracuda', 'Sphyraena novaehollandiae');
INSERT INTO "public"."taxon" VALUES ('605737', 'Orbicular batfish', 'Platax orbicularis');
INSERT INTO "public"."taxon" VALUES ('605738', 'Dusky batfish', 'Platax pinnatus');
INSERT INTO "public"."taxon" VALUES ('605739', 'Tiera batfish', 'Platax teira');
INSERT INTO "public"."taxon" VALUES ('605740', 'Ocellated cardinalfish', 'Apogonichthys ocellatus');
INSERT INTO "public"."taxon" VALUES ('605748', 'Three-spot cardinalfish', 'Apogon trimaculatus');
INSERT INTO "public"."taxon" VALUES ('605752', 'Ruby cardinalfish', 'Apogon coccineus');
INSERT INTO "public"."taxon" VALUES ('605756', 'Narrowstripe cardinalfish', 'Apogon exostigma');
INSERT INTO "public"."taxon" VALUES ('605758', 'Iridescent cardinalfish', 'Apogon kallopterus');
INSERT INTO "public"."taxon" VALUES ('605761', 'Humpback cardinal', 'Ostorhinchus lateralis');
INSERT INTO "public"."taxon" VALUES ('605763', 'Bigeye cardinalfish', 'Nectamia bandanensis');
INSERT INTO "public"."taxon" VALUES ('605764', 'Samoan cardinalfish', 'Nectamia savayensis');
INSERT INTO "public"."taxon" VALUES ('605765', 'Guam cardinalfish', 'Apogon guamensis');
INSERT INTO "public"."taxon" VALUES ('605766', 'Broadstriped cardinalfish', 'Apogon angustatus');
INSERT INTO "public"."taxon" VALUES ('605767', 'Reef-flat cardinalfish', 'Apogon taeniophorus');
INSERT INTO "public"."taxon" VALUES ('605768', 'Sevenstriped cardinalfish', 'Apogon novemfasciatus');
INSERT INTO "public"."taxon" VALUES ('605772', 'Gilberts cardinalfish', 'Zoramia gilberti');
INSERT INTO "public"."taxon" VALUES ('605774', 'Pearly cardinalfish', 'Zoramia perlita');
INSERT INTO "public"."taxon" VALUES ('605780', 'Wolf cardinalfish', 'Cheilodipterus artus');
INSERT INTO "public"."taxon" VALUES ('605781', 'Largetoothed cardinalfish', 'Cheilodipterus macrodon');
INSERT INTO "public"."taxon" VALUES ('605782', 'Truncate cardinalfish', 'Cheilodipterus singapurensis');
INSERT INTO "public"."taxon" VALUES ('605790', 'Barred flagtail', 'Kuhlia mugil');
INSERT INTO "public"."taxon" VALUES ('605791', 'Moontail bullseye', 'Priacanthus hamrur');
INSERT INTO "public"."taxon" VALUES ('605795', 'Quakerfish', 'Malacanthus brevirostris');
INSERT INTO "public"."taxon" VALUES ('605796', 'Blue blanquillo', 'Malacanthus latovittatus');
INSERT INTO "public"."taxon" VALUES ('605797', 'Smalltoothed ponyfish', 'Gazza achlamys');
INSERT INTO "public"."taxon" VALUES ('605798', 'Oblong slipmouth', 'Equulites stercorarius');
INSERT INTO "public"."taxon" VALUES ('605799', 'Common mojarra', 'Gerres argyreus');
INSERT INTO "public"."taxon" VALUES ('605801', 'Slender silverbiddy', 'Gerres oblongus');
INSERT INTO "public"."taxon" VALUES ('605802', 'Silver sweeper', 'Pempheris oualensis');
INSERT INTO "public"."taxon" VALUES ('605803', 'Pigmy sweeper', 'Parapriacanthus ransonneti');
INSERT INTO "public"."taxon" VALUES ('605804', 'Grey sea chub', 'Kyphosus bigibbus');
INSERT INTO "public"."taxon" VALUES ('605805', 'Blue seachub', 'Kyphosus cinerascens');
INSERT INTO "public"."taxon" VALUES ('605806', 'Brassy chub', 'Kyphosus vaigiensis');
INSERT INTO "public"."taxon" VALUES ('605807', 'Silver moony', 'Monodactylus argenteus');
INSERT INTO "public"."taxon" VALUES ('605814', 'Barchin scorpionfish', 'Sebastapistes strongia');
INSERT INTO "public"."taxon" VALUES ('605819', 'Guam scorpionfish', 'Scorpaenodes guamensis');
INSERT INTO "public"."taxon" VALUES ('605820', 'Flasher scorpionfish', 'Scorpaenopsis macrochir');
INSERT INTO "public"."taxon" VALUES ('605822', 'Tassled scorpionfish', 'Scorpaenopsis oxycephala');
INSERT INTO "public"."taxon" VALUES ('605825', 'Stonefish', 'Synanceia verrucosa');
INSERT INTO "public"."taxon" VALUES ('605831', 'Stocky hawkfish', 'Cirrhitus pinnulatus');
INSERT INTO "public"."taxon" VALUES ('605832', 'Flame hawkfish', 'Neocirrhites armatus');
INSERT INTO "public"."taxon" VALUES ('605836', 'Whitespotted filefish', 'Cantherhines dumerilii');
INSERT INTO "public"."taxon" VALUES ('605838', 'Pinktail triggerfish', 'Melichthys vidua');
INSERT INTO "public"."taxon" VALUES ('605839', 'White-banded triggerfish', 'Rhinecanthus aculeatus');
INSERT INTO "public"."taxon" VALUES ('605840', 'Wedge-tail triggerfish', 'Rhinecanthus rectangulus');
INSERT INTO "public"."taxon" VALUES ('605841', 'Smallmouth squirrelfish', 'Sargocentron microstoma');
INSERT INTO "public"."taxon" VALUES ('605842', 'Halfmoon triggerfish', 'Sufflamen chrysopterum');
INSERT INTO "public"."taxon" VALUES ('605852', 'Randalls threadfin bream', 'Nemipterus randalli');
INSERT INTO "public"."taxon" VALUES ('605867', 'Small-toothed whiptail', 'Pentapodus caninus');
INSERT INTO "public"."taxon" VALUES ('605873', 'Three-striped whiptail', 'Pentapodus trivittatus');
INSERT INTO "public"."taxon" VALUES ('605877', 'Striped monocle bream', 'Scolopsis lineata');
INSERT INTO "public"."taxon" VALUES ('605885', 'Two-lined monocle bream', 'Scolopsis bilineata');
INSERT INTO "public"."taxon" VALUES ('605889', 'Black-streaked monocle bream', 'Scolopsis taeniata');
INSERT INTO "public"."taxon" VALUES ('605891', 'Pelagic thresher', 'Alopias pelagicus');
INSERT INTO "public"."taxon" VALUES ('605895', 'Tawny nurse shark', 'Nebrius ferrugineus');
INSERT INTO "public"."taxon" VALUES ('605933', 'Spotted estuary smooth-hound', 'Mustelus lenticulatus');
INSERT INTO "public"."taxon" VALUES ('605937', 'Narrownose smooth-hound', 'Mustelus schmitti');
INSERT INTO "public"."taxon" VALUES ('605938', 'Starry smooth-hound', 'Mustelus asterias');
INSERT INTO "public"."taxon" VALUES ('605950', 'Moorish idol', 'Zanclus cornutus');
INSERT INTO "public"."taxon" VALUES ('605952', 'Blackside hawkfish', 'Paracirrhites forsteri');
INSERT INTO "public"."taxon" VALUES ('605953', 'Whitespot hawkfish', 'Paracirrhites hemistictus');
INSERT INTO "public"."taxon" VALUES ('605961', 'Scribbled pipefish', 'Corythoichthys intestinalis');
INSERT INTO "public"."taxon" VALUES ('605983', 'Yellowstripe goatfish', 'Mulloidichthys flavolineatus');
INSERT INTO "public"."taxon" VALUES ('605984', 'Yellowfin goatfish', 'Mulloidichthys vanicolensis');
INSERT INTO "public"."taxon" VALUES ('605985', 'Orange goatfish', 'Mulloidichthys pfluegeri');
INSERT INTO "public"."taxon" VALUES ('605986', 'Bicolor goatfish', 'Parupeneus barberinoides');
INSERT INTO "public"."taxon" VALUES ('605987', 'Dash-and-dot goatfish', 'Parupeneus barberinus');
INSERT INTO "public"."taxon" VALUES ('605988', 'Doublebar goatfish', 'Parupeneus trifasciatus');
INSERT INTO "public"."taxon" VALUES ('605989', 'Whitesaddle goatfish', 'Parupeneus ciliatus');
INSERT INTO "public"."taxon" VALUES ('605990', 'Goldsaddle goatfish', 'Parupeneus cyclostomus');
INSERT INTO "public"."taxon" VALUES ('605991', 'Cinnabar goatfish', 'Parupeneus heptacanthus');
INSERT INTO "public"."taxon" VALUES ('605992', 'Indian goatfish', 'Parupeneus indicus');
INSERT INTO "public"."taxon" VALUES ('605993', 'Manybar goatfish', 'Parupeneus multifasciatus');
INSERT INTO "public"."taxon" VALUES ('605994', 'Sidespot goatfish', 'Parupeneus pleurostigma');
INSERT INTO "public"."taxon" VALUES ('605995', 'Finstripe goatfish', 'Upeneus taeniopterus');
INSERT INTO "public"."taxon" VALUES ('605996', 'Common silver-biddy', 'Gerres oyena');
INSERT INTO "public"."taxon" VALUES ('606006', 'Javelin grunter', 'Pomadasys kaakan');
INSERT INTO "public"."taxon" VALUES ('606011', 'Whitecheek surgeonfish', 'Acanthurus nigricans');
INSERT INTO "public"."taxon" VALUES ('606012', 'Twospot surgeonfish', 'Ctenochaetus binotatus');
INSERT INTO "public"."taxon" VALUES ('606017', 'Palette surgeonfish', 'Paracanthurus hepatus');
INSERT INTO "public"."taxon" VALUES ('606018', 'Yellow tang', 'Zebrasoma flavescens');
INSERT INTO "public"."taxon" VALUES ('606019', 'Whitemargin unicornfish', 'Naso annulatus');
INSERT INTO "public"."taxon" VALUES ('606020', 'Humpback unicornfish', 'Naso brachycentron');
INSERT INTO "public"."taxon" VALUES ('606021', 'Spotted unicornfish', 'Naso brevirostris');
INSERT INTO "public"."taxon" VALUES ('606023', 'Humpnose unicornfish', 'Naso tuberosus');
INSERT INTO "public"."taxon" VALUES ('606024', 'Bignose unicornfish', 'Naso vlamingii');
INSERT INTO "public"."taxon" VALUES ('606025', 'Orange-lined triggerfish', 'Balistapus undulatus');
INSERT INTO "public"."taxon" VALUES ('606026', 'Titan triggerfish', 'Balistoides viridescens');
INSERT INTO "public"."taxon" VALUES ('606027', 'Yellowmargin triggerfish', 'Pseudobalistes flavimarginatus');
INSERT INTO "public"."taxon" VALUES ('606028', 'Blackbelly triggerfish', 'Rhinecanthus verrucosus');
INSERT INTO "public"."taxon" VALUES ('606029', 'Boomerang triggerfish', 'Sufflamen bursa');
INSERT INTO "public"."taxon" VALUES ('606030', 'Gilded triggerfish', 'Xanthichthys auromarginatus');
INSERT INTO "public"."taxon" VALUES ('606049', 'Rippled rockskipper', 'Istiblennius edentulus');
INSERT INTO "public"."taxon" VALUES ('606058', 'Jewelled blenny', 'Salarias fasciatus');
INSERT INTO "public"."taxon" VALUES ('606082', 'Squaretail coralgrouper', 'Plectropomus areolatus');
INSERT INTO "public"."taxon" VALUES ('606317', 'Totoaba', 'Totoaba macdonaldi');
INSERT INTO "public"."taxon" VALUES ('606356', 'Yellowfin seabream', 'Acanthopagrus latus');
INSERT INTO "public"."taxon" VALUES ('606358', 'Dorab wolf-herring', 'Chirocentrus dorab');
INSERT INTO "public"."taxon" VALUES ('606359', 'Outrigger triggerfish', 'Xanthichthys caeruleolineatus');
INSERT INTO "public"."taxon" VALUES ('606360', 'Brassy trevally', 'Caranx papuensis');
INSERT INTO "public"."taxon" VALUES ('606362', 'Two-stripe sweetlips', 'Plectorhinchus albovittatus');
INSERT INTO "public"."taxon" VALUES ('606366', 'Harry hotlips', 'Plectorhinchus gibbosus');
INSERT INTO "public"."taxon" VALUES ('606368', 'Giant sweetlips', 'Plectorhinchus obscurus');
INSERT INTO "public"."taxon" VALUES ('606369', 'Oriental sweetlips', 'Plectorhinchus orientalis');
INSERT INTO "public"."taxon" VALUES ('606370', 'Painted sweetlip', 'Plectorhinchus picus');
INSERT INTO "public"."taxon" VALUES ('606380', 'Giant moray', 'Gymnothorax javanicus');
INSERT INTO "public"."taxon" VALUES ('606395', 'Peppered moray', 'Gymnothorax pictus');
INSERT INTO "public"."taxon" VALUES ('606396', 'Peacock hind', 'Cephalopholis argus');
INSERT INTO "public"."taxon" VALUES ('606399', 'Longhorn cowfish', 'Lactoria cornuta');
INSERT INTO "public"."taxon" VALUES ('606400', 'Blackspotted puffer', 'Arothron nigropunctatus');
INSERT INTO "public"."taxon" VALUES ('606416', 'Sixfinger threadfin', 'Polydactylus sexfilis');
INSERT INTO "public"."taxon" VALUES ('606422', 'Sailray', 'Dipturus linteus');
INSERT INTO "public"."taxon" VALUES ('606426', 'Squirefish', 'Pagrus auratus');
INSERT INTO "public"."taxon" VALUES ('606438', 'Tricolour parrotfish', 'Scarus tricolor');
INSERT INTO "public"."taxon" VALUES ('606439', 'Malabar grouper', 'Epinephelus malabaricus');
INSERT INTO "public"."taxon" VALUES ('606440', 'Whitespotted grouper', 'Epinephelus coeruleopunctatus');
INSERT INTO "public"."taxon" VALUES ('606441', 'Redmouth grouper', 'Aethaloperca rogaa');
INSERT INTO "public"."taxon" VALUES ('606444', 'Chocolate hind', 'Cephalopholis boenak');
INSERT INTO "public"."taxon" VALUES ('606447', 'Yellowfin hind', 'Cephalopholis hemistiktos');
INSERT INTO "public"."taxon" VALUES ('606448', 'Leopard hind', 'Cephalopholis leopardus');
INSERT INTO "public"."taxon" VALUES ('606450', 'Coral hind', 'Cephalopholis miniata');
INSERT INTO "public"."taxon" VALUES ('606452', 'Harlequin hind', 'Cephalopholis polleni');
INSERT INTO "public"."taxon" VALUES ('606453', 'Sixblotch hind', 'Cephalopholis sexmaculata');
INSERT INTO "public"."taxon" VALUES ('606454', 'Tomato hind', 'Cephalopholis sonnerati');
INSERT INTO "public"."taxon" VALUES ('606455', 'Strawberry hind', 'Cephalopholis spiloparaea');
INSERT INTO "public"."taxon" VALUES ('606456', 'Darkfin hind', 'Cephalopholis urodeta');
INSERT INTO "public"."taxon" VALUES ('606457', 'Humpback grouper', 'Cromileptes altivelis');
INSERT INTO "public"."taxon" VALUES ('606465', 'Orange-spotted grouper', 'Epinephelus coioides');
INSERT INTO "public"."taxon" VALUES ('606466', 'Coral grouper', 'Epinephelus corallicola');
INSERT INTO "public"."taxon" VALUES ('606468', 'Giant grouper', 'Epinephelus lanceolatus');
INSERT INTO "public"."taxon" VALUES ('606470', 'Dusky grouper', 'Epinephelus marginatus');
INSERT INTO "public"."taxon" VALUES ('606471', 'One-blotch grouper', 'Epinephelus melanostigma');
INSERT INTO "public"."taxon" VALUES ('606473', 'Camouflage grouper', 'Epinephelus polyphekadion');
INSERT INTO "public"."taxon" VALUES ('606477', 'Masked grouper', 'Gracila albomarginata');
INSERT INTO "public"."taxon" VALUES ('606478', 'White-edged lyretail', 'Variola albimarginata');
INSERT INTO "public"."taxon" VALUES ('606479', 'Greater lizardfish', 'Saurida tumbil');
INSERT INTO "public"."taxon" VALUES ('606482', 'Round ribbontail ray', 'Taeniura meyeni');
INSERT INTO "public"."taxon" VALUES ('606490', 'White-margined moray', 'Enchelycore schismatorhynchus');
INSERT INTO "public"."taxon" VALUES ('606495', 'Fimbriated moray', 'Gymnothorax fimbriatus');
INSERT INTO "public"."taxon" VALUES ('606503', 'Razorfish', 'Aeoliscus strigatus');
INSERT INTO "public"."taxon" VALUES ('606504', 'Emperor angelfish', 'Pomacanthus imperator');
INSERT INTO "public"."taxon" VALUES ('606505', 'Whitetip soldierfish', 'Myripristis vittata');
INSERT INTO "public"."taxon" VALUES ('606506', 'Shadowfin soldierfish', 'Myripristis adusta');
INSERT INTO "public"."taxon" VALUES ('606507', 'Sabre squirrelfish', 'Sargocentron spiniferum');
INSERT INTO "public"."taxon" VALUES ('606526', 'Stellate puffer', 'Arothron stellatus');
INSERT INTO "public"."taxon" VALUES ('606531', 'Black porgy', 'Acanthopagrus schlegelii schlegelii');
INSERT INTO "public"."taxon" VALUES ('606532', 'Barred knifejaw', 'Oplegnathus fasciatus');
INSERT INTO "public"."taxon" VALUES ('606534', 'Korean rockfish', 'Sebastes schlegelii');
INSERT INTO "public"."taxon" VALUES ('606537', 'Girella punctata', 'Girella punctata');
INSERT INTO "public"."taxon" VALUES ('606550', 'Ornate butterflyfish', 'Chaetodon ornatissimus');
INSERT INTO "public"."taxon" VALUES ('606559', 'Harlequin filefish', 'Oxymonacanthus longirostris');
INSERT INTO "public"."taxon" VALUES ('606561', 'Latticed sandperch', 'Parapercis clathrata');
INSERT INTO "public"."taxon" VALUES ('606572', 'Royal angelfish', 'Pygoplites diacanthus');
INSERT INTO "public"."taxon" VALUES ('606574', 'Convict grouper', 'Hyporthodus septemfasciatus');
INSERT INTO "public"."taxon" VALUES ('606575', 'Blueband goby', 'Valenciennea strigata');
INSERT INTO "public"."taxon" VALUES ('606578', 'Spotted sharpnose', 'Canthigaster solandri');
INSERT INTO "public"."taxon" VALUES ('606582', 'Black squirrelfish', 'Neoniphon opercularis');
INSERT INTO "public"."taxon" VALUES ('606630', 'Indo-Pacific sergeant', 'Abudefduf vaigiensis');
INSERT INTO "public"."taxon" VALUES ('606635', 'Honeycomb filefish', 'Cantherhines pardalis');
INSERT INTO "public"."taxon" VALUES ('606660', 'Starspotted grouper', 'Epinephelus hexagonatus');
INSERT INTO "public"."taxon" VALUES ('606661', 'Snubnose grouper', 'Epinephelus macrospilos');
INSERT INTO "public"."taxon" VALUES ('606670', 'Blackdotted sand perch', 'Parapercis millepunctata');
INSERT INTO "public"."taxon" VALUES ('606672', 'Broom filefish', 'Amanses scopas');
INSERT INTO "public"."taxon" VALUES ('606932', 'Oneknife unicornfish', 'Naso thynnoides');
INSERT INTO "public"."taxon" VALUES ('606940', 'Yellowbanded sweetlips', 'Plectorhinchus lineatus');
INSERT INTO "public"."taxon" VALUES ('606948', 'Eatons skate', 'Bathyraja eatonii');
INSERT INTO "public"."taxon" VALUES ('606950', 'McCains skate', 'Bathyraja maccaini');
INSERT INTO "public"."taxon" VALUES ('606951', 'Dark-belly skate', 'Bathyraja meridionalis');
INSERT INTO "public"."taxon" VALUES ('606952', 'Murrays skate', 'Bathyraja murrayi');
INSERT INTO "public"."taxon" VALUES ('606953', 'Antarctic starry skate', 'Amblyraja georgiana');
INSERT INTO "public"."taxon" VALUES ('606957', 'Basketwork eel', 'Diastobranchus capensis');
INSERT INTO "public"."taxon" VALUES ('606974', 'Benthalbella elongata', 'Benthalbella elongata');
INSERT INTO "public"."taxon" VALUES ('607039', 'Antarctic toothfish', 'Dissostichus mawsoni');
INSERT INTO "public"."taxon" VALUES ('607040', 'Triangular notothen', 'Gobionotothen acuta');
INSERT INTO "public"."taxon" VALUES ('607041', 'Humped rockcod', 'Gobionotothen gibberifrons');
INSERT INTO "public"."taxon" VALUES ('607045', 'Grey rockcod', 'Lepidonotothen squamifrons');
INSERT INTO "public"."taxon" VALUES ('607046', 'Toad notothen', 'Lepidonotothen mizops');
INSERT INTO "public"."taxon" VALUES ('607047', 'Gaudy notothen', 'Lepidonotothen nudifrons');
INSERT INTO "public"."taxon" VALUES ('607048', 'Lepidonotothen larseni', 'Lepidonotothen larseni');
INSERT INTO "public"."taxon" VALUES ('607052', 'Patagonian rockcod', 'Patagonotothen brevicauda brevicauda');
INSERT INTO "public"."taxon" VALUES ('607054', 'Blunt scalyhead', 'Trematomus eulepidotus');
INSERT INTO "public"."taxon" VALUES ('607055', 'Striped rockcod', 'Trematomus hansoni');
INSERT INTO "public"."taxon" VALUES ('607082', 'Pogonophryne permitini', 'Pogonophryne permitini');
INSERT INTO "public"."taxon" VALUES ('607108', 'Chionobathyscus dewitti', 'Chionobathyscus dewitti');
INSERT INTO "public"."taxon" VALUES ('607110', 'Chionodraco myersi', 'Chionodraco myersi');
INSERT INTO "public"."taxon" VALUES ('607111', 'Cryodraco antarcticus', 'Cryodraco antarcticus');
INSERT INTO "public"."taxon" VALUES ('607113', 'Bible icefish', 'Neopagetopsis ionah');
INSERT INTO "public"."taxon" VALUES ('607117', 'Slender escolar', 'Paradiplospinus gracilis');
INSERT INTO "public"."taxon" VALUES ('607120', 'Antarctic armless flounder', 'Mancopsetta maculata antarctica');
INSERT INTO "public"."taxon" VALUES ('607124', 'Marbled moray cod', 'Muraenolepis marmorata');
INSERT INTO "public"."taxon" VALUES ('607126', 'Smalleye moray cod', 'Muraenolepis microps');
INSERT INTO "public"."taxon" VALUES ('607132', 'Marinis grenadier', 'Coelorinchus marinii');
INSERT INTO "public"."taxon" VALUES ('607136', 'Dogtooth grenadier', 'Cynomacrurus piriei');
INSERT INTO "public"."taxon" VALUES ('607138', 'Bigeye grenadier', 'Macrourus holotrachys');
INSERT INTO "public"."taxon" VALUES ('607139', 'Whitson''s grenadier', 'Macrourus whitsoni');
INSERT INTO "public"."taxon" VALUES ('607151', 'Smooth oreo', 'Pseudocyttus maculatus');
INSERT INTO "public"."taxon" VALUES ('607152', 'Spiny horsefish', 'Zanclorhynchus spinifer');
INSERT INTO "public"."taxon" VALUES ('607184', 'Splitfin flashlightfish', 'Anomalops katoptron');
INSERT INTO "public"."taxon" VALUES ('607187', 'Narrow-lined puffer', 'Arothron manilensis');
INSERT INTO "public"."taxon" VALUES ('607211', 'Tangaroa shrimpgoby', 'Ctenogobiops tangaroai');
INSERT INTO "public"."taxon" VALUES ('607292', 'Two-spot lizard fish', 'Synodus binotatus');
INSERT INTO "public"."taxon" VALUES ('607306', 'Shoulderbar soldierfish', 'Myripristis kuntee');
INSERT INTO "public"."taxon" VALUES ('607308', 'Scarlet soldierfish', 'Myripristis pralinia');
INSERT INTO "public"."taxon" VALUES ('607309', 'Lattice soldierfish', 'Myripristis violacea');
INSERT INTO "public"."taxon" VALUES ('607310', 'Clearfin squirrelfish', 'Neoniphon argenteus');
INSERT INTO "public"."taxon" VALUES ('607311', 'Pink squirrelfish', 'Sargocentron tiereoides');
INSERT INTO "public"."taxon" VALUES ('607327', 'Grey triggerfish', 'Balistes capriscus');
INSERT INTO "public"."taxon" VALUES ('607329', 'Yellow grouper', 'Epinephelus awoara');
INSERT INTO "public"."taxon" VALUES ('607348', 'Blacksaddle grouper', 'Epinephelus howlandi');
INSERT INTO "public"."taxon" VALUES ('607354', 'White-blotched grouper', 'Epinephelus multinotatus');
INSERT INTO "public"."taxon" VALUES ('607355', 'Eightbar grouper', 'Hyporthodus octofasciatus');
INSERT INTO "public"."taxon" VALUES ('607358', 'Smallscaled grouper', 'Epinephelus polylepis');
INSERT INTO "public"."taxon" VALUES ('607362', 'Surge grouper', 'Epinephelus socialis');
INSERT INTO "public"."taxon" VALUES ('607366', 'Summan grouper', 'Epinephelus summana');
INSERT INTO "public"."taxon" VALUES ('607367', 'Yellowspotted grouper', 'Epinephelus timorensis');
INSERT INTO "public"."taxon" VALUES ('607372', 'Blacksaddled coralgrouper', 'Plectropomus laevis');
INSERT INTO "public"."taxon" VALUES ('607374', 'Golden grouper', 'Saloptia powelli');
INSERT INTO "public"."taxon" VALUES ('607376', 'Deepwater stingray', 'Plesiobatis daviesi');
INSERT INTO "public"."taxon" VALUES ('607430', 'Roving coralgrouper', 'Plectropomus pessuliferus');
INSERT INTO "public"."taxon" VALUES ('607447', 'Pinda moray', 'Gymnothorax pindae');
INSERT INTO "public"."taxon" VALUES ('607530', 'Caribbean flounder', 'Trichopsetta caribbaea');
INSERT INTO "public"."taxon" VALUES ('607532', 'Duskycheek tonguefish', 'Symphurus plagusia');
INSERT INTO "public"."taxon" VALUES ('607535', 'Torroto grunt', 'Genyatremus luteus');
INSERT INTO "public"."taxon" VALUES ('607547', 'Spotted moray', 'Gymnothorax moringa');
INSERT INTO "public"."taxon" VALUES ('607553', 'Shortbeard cusk-eel', 'Lepophidium brevibarbe');
INSERT INTO "public"."taxon" VALUES ('607580', 'Slipper sole', 'Trinectes paulistanus');
INSERT INTO "public"."taxon" VALUES ('607614', 'Sandy ray', 'Leucoraja circularis');
INSERT INTO "public"."taxon" VALUES ('607616', 'Longnosed skate', 'Dipturus oxyrinchus');
INSERT INTO "public"."taxon" VALUES ('607617', 'Undulate ray', 'Raja undulata');
INSERT INTO "public"."taxon" VALUES ('607618', 'Devil fish', 'Mobula mobular');
INSERT INTO "public"."taxon" VALUES ('607619', 'Shagreen ray', 'Leucoraja fullonica');
INSERT INTO "public"."taxon" VALUES ('607620', 'Whitemouth croaker', 'Micropogonias furnieri');
INSERT INTO "public"."taxon" VALUES ('607626', 'Sordid rubberlip', 'Plectorhinchus sordidus');
INSERT INTO "public"."taxon" VALUES ('607641', 'Flowery flounder', 'Bothus mancus');
INSERT INTO "public"."taxon" VALUES ('607691', 'Starry flying gurnard', 'Dactyloptena peterseni');
INSERT INTO "public"."taxon" VALUES ('607699', 'Longtail silverbiddy', 'Gerres longirostris');
INSERT INTO "public"."taxon" VALUES ('607700', 'Striped silver biddy', 'Gerres methueni');
INSERT INTO "public"."taxon" VALUES ('607703', 'Blackspotted rubberlips', 'Plectorhinchus gaterinus');
INSERT INTO "public"."taxon" VALUES ('607706', 'Minstrel sweetlip', 'Plectorhinchus schotaf');
INSERT INTO "public"."taxon" VALUES ('607708', 'Striped piggy', 'Pomadasys stridens');
INSERT INTO "public"."taxon" VALUES ('607714', 'Dark-striped squirrelfish', 'Sargocentron praslin');
INSERT INTO "public"."taxon" VALUES ('607715', 'Rock flagtail', 'Kuhlia rupestris');
INSERT INTO "public"."taxon" VALUES ('607773', 'Brick soldierfish', 'Myripristis amaena');
INSERT INTO "public"."taxon" VALUES ('607848', 'Amboina cardinalfish', 'Apogon amboinensis');
INSERT INTO "public"."taxon" VALUES ('607897', 'Halfspined flathead', 'Sorsogona prionota');
INSERT INTO "public"."taxon" VALUES ('607903', 'Yellowbar angelfish', 'Pomacanthus maculosus');
INSERT INTO "public"."taxon" VALUES ('607931', 'Karenteen seabream', 'Crenidens crenidens');
INSERT INTO "public"."taxon" VALUES ('607937', 'Yellowtail barracuda', 'Sphyraena flavicauda');
INSERT INTO "public"."taxon" VALUES ('607938', 'Sawtooth barracuda', 'Sphyraena putnamae');
INSERT INTO "public"."taxon" VALUES ('607939', 'Blackfin barracuda', 'Sphyraena qenie');
INSERT INTO "public"."taxon" VALUES ('607943', 'Lighthouse lizardfish', 'Synodus jaculum');
INSERT INTO "public"."taxon" VALUES ('607945', 'Fourlined terapon', 'Pelates quadrilineatus');
INSERT INTO "public"."taxon" VALUES ('608053', 'Harlequin snake-eel', 'Myrichthys colubrinus');
INSERT INTO "public"."taxon" VALUES ('608092', 'African striped grunt', 'Parapristipoma octolineatum');
INSERT INTO "public"."taxon" VALUES ('608097', 'Steephead parrotfish', 'Chlorurus microrhinos');
INSERT INTO "public"."taxon" VALUES ('608121', 'Reef needlefish', 'Strongylura incisa');
INSERT INTO "public"."taxon" VALUES ('608166', 'Haffara seabream', 'Rhabdosargus haffara');
INSERT INTO "public"."taxon" VALUES ('608172', 'Silverside', 'Odontesthes regia');
INSERT INTO "public"."taxon" VALUES ('608173', 'Luderick', 'Girella tricuspidata');
INSERT INTO "public"."taxon" VALUES ('608187', 'Chinese silver pomfret', 'Pampus chinensis');
INSERT INTO "public"."taxon" VALUES ('608198', 'Japanese pufferfish', 'Takifugu rubripes');
INSERT INTO "public"."taxon" VALUES ('608273', 'Bollmannia chlamydes', 'Bollmannia chlamydes');
INSERT INTO "public"."taxon" VALUES ('608275', 'Pacific bearded brotula', 'Brotula clarkae');
INSERT INTO "public"."taxon" VALUES ('608280', 'Large-headed scorpionfish', 'Pontinus macrocephalus');
INSERT INTO "public"."taxon" VALUES ('608289', 'Pacific cornetfish', 'Fistularia corneta');
INSERT INTO "public"."taxon" VALUES ('608315', 'Trout sweetlips', 'Plectorhinchus pictus');
INSERT INTO "public"."taxon" VALUES ('608326', 'Panama spadefish', 'Parapsettus panamensis');
INSERT INTO "public"."taxon" VALUES ('608390', 'Choicy ruff', 'Seriolella porosa');
INSERT INTO "public"."taxon" VALUES ('608421', 'Spotted codlet', 'Bregmaceros mcclellandi');
INSERT INTO "public"."taxon" VALUES ('608483', 'Thorntooth grenadier', 'Lepidorhynchus denticulatus');
INSERT INTO "public"."taxon" VALUES ('608490', 'Silver gemfish', 'Rexea solandri');
INSERT INTO "public"."taxon" VALUES ('608540', 'Intermediate scabbardfish', 'Aphanopus intermedius');
INSERT INTO "public"."taxon" VALUES ('608556', 'Littlemouth flounder', 'Pseudopleuronectes herzensteini');
INSERT INTO "public"."taxon" VALUES ('608816', 'Coney', 'Cephalopholis fulva');
INSERT INTO "public"."taxon" VALUES ('608852', 'Senegalese sole', 'Solea senegalensis');
INSERT INTO "public"."taxon" VALUES ('608924', 'Starry ray', 'Raja asterias');
INSERT INTO "public"."taxon" VALUES ('608936', 'Bigelows ray', 'Rajella bigelowi');
INSERT INTO "public"."taxon" VALUES ('608991', 'Pudgy cuskeel', 'Spectrunculus grandis');
INSERT INTO "public"."taxon" VALUES ('609000', 'Large-eyed rabbitfish', 'Hydrolagus mirabilis');
INSERT INTO "public"."taxon" VALUES ('609005', 'Spearnose chimaera', 'Rhinochimaera atlantica');
INSERT INTO "public"."taxon" VALUES ('609033', 'Sharktooth moray', 'Gymnothorax maderensis');
INSERT INTO "public"."taxon" VALUES ('609146', 'Spiky oreo', 'Neocyttus rhomboidalis');
INSERT INTO "public"."taxon" VALUES ('609171', 'Agassiz slickhead', 'Alepocephalus agassizii');
INSERT INTO "public"."taxon" VALUES ('609204', 'Graceful pearlfish', 'Encheliophis gracilis');
INSERT INTO "public"."taxon" VALUES ('609256', 'Arctic skate', 'Amblyraja hyperborea');
INSERT INTO "public"."taxon" VALUES ('609648', 'Feathered river-garfish', 'Zenarchopterus dispar');
INSERT INTO "public"."taxon" VALUES ('609891', 'Pristigenys meyeri', 'Pristigenys meyeri');
INSERT INTO "public"."taxon" VALUES ('609907', 'Guinean striped mojarra', 'Gerres nigri');
INSERT INTO "public"."taxon" VALUES ('609908', 'Biglip grunt', 'Plectorhinchus macrolepis');
INSERT INTO "public"."taxon" VALUES ('610106', 'Tarakihi', 'Nemadactylus macropterus');
INSERT INTO "public"."taxon" VALUES ('610126', 'Slender guitarfish', 'Rhinobatos holcorhynchus');
INSERT INTO "public"."taxon" VALUES ('610190', 'Pemarco blackfish', 'Schedophilus pemarco');
INSERT INTO "public"."taxon" VALUES ('610220', 'Giant catfish', 'Netuma thalassina');
INSERT INTO "public"."taxon" VALUES ('610238', 'Skinnycheek lanternfish', 'Benthosema pterotum');
INSERT INTO "public"."taxon" VALUES ('610256', 'Cape monk', 'Lophius vomerinus');
INSERT INTO "public"."taxon" VALUES ('610285', 'Kai soldierfish', 'Ostichthys kaianus');
INSERT INTO "public"."taxon" VALUES ('610301', 'Pear puffer', 'Takifugu vermicularis');
INSERT INTO "public"."taxon" VALUES ('610307', 'Japanese flyingfish', 'Cheilopogon agoo');
INSERT INTO "public"."taxon" VALUES ('610308', 'Ramsay''s icefish', 'Patagonotothen ramsayi');
INSERT INTO "public"."taxon" VALUES ('610430', 'Peruvian mojarra', 'Diapterus peruvianus');
INSERT INTO "public"."taxon" VALUES ('610676', 'King dory', 'Cyttus traversi');
INSERT INTO "public"."taxon" VALUES ('611002', 'Stolzmanns weakfish', 'Cynoscion stolzmanni');
INSERT INTO "public"."taxon" VALUES ('611111', 'Mango angelfish', 'Centropyge shepardi');
INSERT INTO "public"."taxon" VALUES ('611512', 'Roundjaw bonefish', 'Albula glossodonta');
INSERT INTO "public"."taxon" VALUES ('611713', 'Indian pike conger', 'Congresox talabonoides');
INSERT INTO "public"."taxon" VALUES ('611783', 'Buru glass perchlet', 'Ambassis buruensis');
INSERT INTO "public"."taxon" VALUES ('611820', 'Canary damsel', 'Abudefduf luridus');
INSERT INTO "public"."taxon" VALUES ('612005', 'Sandpaper fish', 'Paratrachichthys trailli');
INSERT INTO "public"."taxon" VALUES ('612081', 'Pacora', 'Plagioscion surinamensis');
INSERT INTO "public"."taxon" VALUES ('612128', 'Ara', 'Niphon spinosus');
INSERT INTO "public"."taxon" VALUES ('612288', 'Rubyfish', 'Plagiogeneion rubiginosum');
INSERT INTO "public"."taxon" VALUES ('612354', 'Giant boarfish', 'Paristiopterus labiosus');
INSERT INTO "public"."taxon" VALUES ('612357', 'Bigspined boarfish', 'Pentaceros decacanthus');
INSERT INTO "public"."taxon" VALUES ('612361', 'Longfin armorhead', 'Pseudopentaceros wheeleri');
INSERT INTO "public"."taxon" VALUES ('612547', 'Muksun', 'Coregonus muksun');
INSERT INTO "public"."taxon" VALUES ('612586', 'Mangrove whipray', 'Himantura granulata');
INSERT INTO "public"."taxon" VALUES ('612587', 'Pink whipray', 'Himantura fai');
INSERT INTO "public"."taxon" VALUES ('612596', 'Yellowfin soldierfish', 'Myripristis chryseres');
INSERT INTO "public"."taxon" VALUES ('612620', 'Sand lizardfish', 'Synodus dermatogenys');
INSERT INTO "public"."taxon" VALUES ('612663', 'Checkerboard wrasse', 'Halichoeres hortulanus');
INSERT INTO "public"."taxon" VALUES ('612744', 'Blackfin hogfish', 'Bodianus loxozonus');
INSERT INTO "public"."taxon" VALUES ('612848', 'Liopropoma maculatum', 'Liopropoma maculatum');
INSERT INTO "public"."taxon" VALUES ('612896', 'Yellowstriped squirrelfish', 'Neoniphon aurolineatus');
INSERT INTO "public"."taxon" VALUES ('612917', 'Tilefish', 'Prolatilus jugularis');
INSERT INTO "public"."taxon" VALUES ('612918', 'Common warehou', 'Seriolella brama');
INSERT INTO "public"."taxon" VALUES ('612919', 'White warehou', 'Seriolella caerulea');
INSERT INTO "public"."taxon" VALUES ('612920', 'Giant stargazer', 'Kathetostoma giganteum');
INSERT INTO "public"."taxon" VALUES ('612922', 'Silver warehou', 'Seriolella punctata');
INSERT INTO "public"."taxon" VALUES ('612925', 'Porichthys porosissimus', 'Porichthys porosissimus');
INSERT INTO "public"."taxon" VALUES ('612961', 'Englemans lizardfish', 'Synodus englemani');
INSERT INTO "public"."taxon" VALUES ('612962', 'Black oreo', 'Allocyttus niger');
INSERT INTO "public"."taxon" VALUES ('612996', 'Silver eye', 'Polymixia japonica');
INSERT INTO "public"."taxon" VALUES ('613025', 'Parrotfish', 'Sparisoma cretense');
INSERT INTO "public"."taxon" VALUES ('613135', 'Garfish', 'Hyporhamphus ihi');
INSERT INTO "public"."taxon" VALUES ('613139', 'Velvet leatherjacket', 'Meuschenia scaber');
INSERT INTO "public"."taxon" VALUES ('613144', 'New Zealand rough skate', 'Zearaja nasuta');
INSERT INTO "public"."taxon" VALUES ('613146', 'Dark ghost shark', 'Hydrolagus novaezealandiae');
INSERT INTO "public"."taxon" VALUES ('613429', 'Brown sole', 'Achirus klunzingeri');
INSERT INTO "public"."taxon" VALUES ('613558', 'Speckled-tail flounder', 'Engyophrys sanctilaurentii');
INSERT INTO "public"."taxon" VALUES ('613632', 'Inkspot tonguefish', 'Symphurus atramentatus');
INSERT INTO "public"."taxon" VALUES ('613664', 'Greyfin croaker', 'Pennahia anea');
INSERT INTO "public"."taxon" VALUES ('613721', 'Shining grunt', 'Haemulopsis nitidus');
INSERT INTO "public"."taxon" VALUES ('613734', 'Yellowstripe grunt', 'Haemulopsis axillaris');
INSERT INTO "public"."taxon" VALUES ('613738', 'Longspine grunt', 'Pomadasys macracanthus');
INSERT INTO "public"."taxon" VALUES ('613740', 'Panama grunt', 'Pomadasys panamensis');
INSERT INTO "public"."taxon" VALUES ('613954', 'Toothed flounder', 'Cyclopsetta querna');
INSERT INTO "public"."taxon" VALUES ('613978', 'Oval flounder', 'Syacium ovale');
INSERT INTO "public"."taxon" VALUES ('613998', 'Tallfin croaker', 'Micropogonias altipinnis');
INSERT INTO "public"."taxon" VALUES ('614009', 'Pacific drum', 'Larimus pacificus');
INSERT INTO "public"."taxon" VALUES ('614015', 'Steeplined drum', 'Larimus acclivis');
INSERT INTO "public"."taxon" VALUES ('614018', 'Silver weakfish', 'Isopisthus remifer');
INSERT INTO "public"."taxon" VALUES ('614030', 'Striped weakfish', 'Cynoscion reticulatus');
INSERT INTO "public"."taxon" VALUES ('614063', 'Argentine goatfish', 'Mullus argentinae');
INSERT INTO "public"."taxon" VALUES ('614069', 'Suco croaker', 'Paralonchurus dumerilii');
INSERT INTO "public"."taxon" VALUES ('614084', 'Silver stardrum', 'Stellifer illecebrosus');
INSERT INTO "public"."taxon" VALUES ('614090', 'Softhead stardrum', 'Stellifer zestocarus');
INSERT INTO "public"."taxon" VALUES ('614129', 'Redfish', 'Centroberyx affinis');
INSERT INTO "public"."taxon" VALUES ('614146', 'Salema butterfish', 'Peprilus snyderi');
INSERT INTO "public"."taxon" VALUES ('614155', 'Shorthead lizardfish', 'Synodus scituliceps');
INSERT INTO "public"."taxon" VALUES ('614220', 'Reddish scorpionfish', 'Scorpaena russula');
INSERT INTO "public"."taxon" VALUES ('614242', 'Banded yellowfish', 'Centriscops humerosus');
INSERT INTO "public"."taxon" VALUES ('614248', 'Inshore sand perch', 'Diplectrum pacificum');
INSERT INTO "public"."taxon" VALUES ('614282', 'St. Pauls fingerfin', 'Nemadactylus monodactylus');
INSERT INTO "public"."taxon" VALUES ('614290', 'Pacific bluefin tuna', 'Thunnus orientalis');
INSERT INTO "public"."taxon" VALUES ('614296', 'Bigeye bass', 'Pronotogrammus eos');
INSERT INTO "public"."taxon" VALUES ('614300', 'Oval butterflyfish', 'Chaetodon lunulatus');
INSERT INTO "public"."taxon" VALUES ('614303', 'Jumping halfbeak', 'Hemiramphus archipelagicus');
INSERT INTO "public"."taxon" VALUES ('614327', 'Spotted gurnard', 'Pterygotrigla picta');
INSERT INTO "public"."taxon" VALUES ('614354', 'Orange perch', 'Lepidoperca pulchella');
INSERT INTO "public"."taxon" VALUES ('614383', 'Gulf parrotfish', 'Scarus persicus');
INSERT INTO "public"."taxon" VALUES ('614575', 'New Zealand dory', 'Cyttus novaezealandiae');
INSERT INTO "public"."taxon" VALUES ('614693', 'Peruvian hake', 'Merluccius gayi peruanus');
INSERT INTO "public"."taxon" VALUES ('614983', 'Bluegill longfin', 'Plesiops corallicola');
INSERT INTO "public"."taxon" VALUES ('615086', 'Pink maomao', 'Caprodon longimanus');
INSERT INTO "public"."taxon" VALUES ('615380', 'White-spotted shovelnose ray', 'Rhynchobatus australiae');
INSERT INTO "public"."taxon" VALUES ('615483', 'Sharpnose stingray', 'Himantura gerrardi');
INSERT INTO "public"."taxon" VALUES ('615628', 'Naso caesius', 'Naso caesius');
INSERT INTO "public"."taxon" VALUES ('616720', 'Barnard''s lanternfish', 'Symbolophorus barnardi');
INSERT INTO "public"."taxon" VALUES ('617190', 'Whitespot soldierfish', 'Myripristis woodsi');
INSERT INTO "public"."taxon" VALUES ('617304', 'Candidia barbata', 'Candidia barbata');
INSERT INTO "public"."taxon" VALUES ('617471', 'Black surgeonfish', 'Acanthurus gahhm');
INSERT INTO "public"."taxon" VALUES ('622522', 'Mottled sole', 'Aseraggodes melanostictus');
INSERT INTO "public"."taxon" VALUES ('622620', 'Rio de Oreo blenny', 'Spaniblennius riodourensis');
INSERT INTO "public"."taxon" VALUES ('623130', 'Elegant moray', 'Gymnothorax elegans');
INSERT INTO "public"."taxon" VALUES ('623333', 'Checked swallowtail', 'Odontanthias borbonius');
INSERT INTO "public"."taxon" VALUES ('623343', 'Sargocentron furcatum', 'Sargocentron furcatum');
INSERT INTO "public"."taxon" VALUES ('624115', 'Liparis tanakae', 'Liparis tanakae');
INSERT INTO "public"."taxon" VALUES ('624237', 'Rock sole', 'Lepidopsetta bilineata');
INSERT INTO "public"."taxon" VALUES ('625225', 'Yellowtail mullet', 'Sicamugil cascasia');
INSERT INTO "public"."taxon" VALUES ('625706', 'Indian Ocean oriental sweetlips', 'Plectorhinchus vittatus');
INSERT INTO "public"."taxon" VALUES ('626675', 'Corvina drum', 'Cilus gilberti');
INSERT INTO "public"."taxon" VALUES ('627348', 'Spiny squirrelfish', 'Sargocentron lepros');
INSERT INTO "public"."taxon" VALUES ('628128', 'Spotfin flathead', 'Grammoplites suppositus');
INSERT INTO "public"."taxon" VALUES ('628143', 'American harvestfish', 'Peprilus paru');
INSERT INTO "public"."taxon" VALUES ('628232', 'Scaly gurnard', 'Lepidotrigla brachyoptera');
INSERT INTO "public"."taxon" VALUES ('646376', 'Klunzingers mullet', 'Liza klunzingeri');
INSERT INTO "public"."taxon" VALUES ('646941', 'Bering cisco', 'Coregonus laurettae');
INSERT INTO "public"."taxon" VALUES ('646950', 'Sand fish', 'Awaous tajasica');
INSERT INTO "public"."taxon" VALUES ('648104', 'Allis and twaite shads', 'Alosa alosa, A.fallax');
INSERT INTO "public"."taxon" VALUES ('648134', 'Baltic herring', 'Clupea harengus membras');
INSERT INTO "public"."taxon" VALUES ('648382', 'Baltic sprat', 'Sprattus sprattus balticus');
INSERT INTO "public"."taxon" VALUES ('649232', 'Capro dory', 'Capromimus abbreviatus');
INSERT INTO "public"."taxon" VALUES ('650023', 'Lizardfish', 'Synodus marchenae');
INSERT INTO "public"."taxon" VALUES ('650099', 'Stingray', 'Urotrygon serrula');
INSERT INTO "public"."taxon" VALUES ('650136', 'Argentinian sandperch', 'Pseudopercis semifasciata');
INSERT INTO "public"."taxon" VALUES ('651212', 'Channel bull blenny', 'Cottoperca gobio');
INSERT INTO "public"."taxon" VALUES ('654963', 'Paralichthys microps', 'Paralichthys microps');
INSERT INTO "public"."taxon" VALUES ('656326', 'Surge damselfish', 'Chrysiptera brownriggii');
INSERT INTO "public"."taxon" VALUES ('657505', 'Kerguelen sandpaper skate', 'Bathyraja irrasa');
INSERT INTO "public"."taxon" VALUES ('657506', 'So-iny mullet', 'Liza haematocheilus');
INSERT INTO "public"."taxon" VALUES ('658000', 'Golden hind', 'Cephalopholis aurantia');
INSERT INTO "public"."taxon" VALUES ('658001', 'African coris', 'Coris gaimard');
INSERT INTO "public"."taxon" VALUES ('658002', 'BASSLET', 'Plectranthias kamii');
INSERT INTO "public"."taxon" VALUES ('658003', 'Greyface moray', 'Gymnothorax thyrsoideus');
INSERT INTO "public"."taxon" VALUES ('658004', 'Longfin African conger', 'Conger cinereus');
INSERT INTO "public"."taxon" VALUES ('661067', 'Golden redfish', 'Sebastes norvegicus');
INSERT INTO "public"."taxon" VALUES ('690003', 'Aesop shrimp', 'Pandalus montagui');
INSERT INTO "public"."taxon" VALUES ('690005', 'Akiami paste shrimp', 'Acetes japonicus');
INSERT INTO "public"."taxon" VALUES ('690009', 'American cupped oyster', 'Crassostrea virginica');
INSERT INTO "public"."taxon" VALUES ('690010', 'American lobster', 'Homarus americanus');
INSERT INTO "public"."taxon" VALUES ('690011', 'American sea scallop', 'Placopecten magellanicus');
INSERT INTO "public"."taxon" VALUES ('690013', 'Andaman lobster', 'Metanephrops andamanicus');
INSERT INTO "public"."taxon" VALUES ('690016', 'Antarctic krill', 'Euphausia superba');
INSERT INTO "public"."taxon" VALUES ('690018', 'Antarctic stone crab', 'Paralomis spinosissima');
INSERT INTO "public"."taxon" VALUES ('690022', 'Argentine red shrimp', 'Pleoticus muelleri');
INSERT INTO "public"."taxon" VALUES ('690023', 'Argentine shortfin squid', 'Illex argentinus');
INSERT INTO "public"."taxon" VALUES ('690024', 'Argentine stiletto shrimp', 'Artemesia longinaris');
INSERT INTO "public"."taxon" VALUES ('690029', 'Atlantic razor clam', 'Ensis directus');
INSERT INTO "public"."taxon" VALUES ('690030', 'Atlantic bay scallop', 'Argopecten irradians');
INSERT INTO "public"."taxon" VALUES ('690031', 'Atlantic rock crab', 'Cancer irroratus');
INSERT INTO "public"."taxon" VALUES ('690032', 'Atlantic seabob', 'Xiphopenaeus kroyeri');
INSERT INTO "public"."taxon" VALUES ('690033', 'Atlantic surf clam', 'Spisula solidissima');
INSERT INTO "public"."taxon" VALUES ('690036', 'Australian mussel', 'Mytilus planulatus');
INSERT INTO "public"."taxon" VALUES ('690039', 'Australian spiny lobster', 'Panulirus cygnus');
INSERT INTO "public"."taxon" VALUES ('690042', 'Banana prawn', 'Fenneropenaeus merguiensis');
INSERT INTO "public"."taxon" VALUES ('690043', 'Barnacle', 'Pollicipes pollicipes');
INSERT INTO "public"."taxon" VALUES ('690044', 'Bear paw clam', 'Hippopus hippopus');
INSERT INTO "public"."taxon" VALUES ('690047', 'Black stone crab', 'Menippe mercenaria');
INSERT INTO "public"."taxon" VALUES ('690048', 'Pacific pearl-oyster', 'Pinctada margaritifera');
INSERT INTO "public"."taxon" VALUES ('690049', 'Blacklip abalone', 'Haliotis rubra');
INSERT INTO "public"."taxon" VALUES ('690050', 'Granular ark', 'Tegillarca granosa');
INSERT INTO "public"."taxon" VALUES ('690051', 'Blue and red shrimp', 'Aristeus antennatus');
INSERT INTO "public"."taxon" VALUES ('690052', 'Blue crab', 'Callinectes sapidus');
INSERT INTO "public"."taxon" VALUES ('690053', 'Blue mussel', 'Mytilus edulis');
INSERT INTO "public"."taxon" VALUES ('690054', 'Blue shrimp', 'Litopenaeus stylirostris');
INSERT INTO "public"."taxon" VALUES ('690055', 'Blue swimming crab', 'Portunus pelagicus');
INSERT INTO "public"."taxon" VALUES ('690058', 'Brine shrimp', 'Artemia salina');
INSERT INTO "public"."taxon" VALUES ('690059', 'Broadtail shortfin squid', 'Illex coindetii');
INSERT INTO "public"."taxon" VALUES ('690060', 'Brown mussel', 'Perna viridis');
INSERT INTO "public"."taxon" VALUES ('690064', 'Butter clam', 'Saxidomus gigantea');
INSERT INTO "public"."taxon" VALUES ('690065', 'Calico scallop', 'Argopecten gibbus');
INSERT INTO "public"."taxon" VALUES ('690067', 'European squid', 'Loligo vulgaris');
INSERT INTO "public"."taxon" VALUES ('690069', 'Cape rock lobster', 'Jasus lalandii');
INSERT INTO "public"."taxon" VALUES ('690070', 'Caramote prawn', 'Melicertus kerathurus');
INSERT INTO "public"."taxon" VALUES ('690071', 'Caribbean spiny lobster', 'Panulirus argus');
INSERT INTO "public"."taxon" VALUES ('690075', 'Chilean flat oyster', 'Ostrea chilensis');
INSERT INTO "public"."taxon" VALUES ('690076', 'Chilean mussel', 'Mytilus chilensis');
INSERT INTO "public"."taxon" VALUES ('690077', 'Chilean nylon shrimp', 'Heterocarpus reedi');
INSERT INTO "public"."taxon" VALUES ('690078', 'Chilean sea urchin', 'Loxechinus albus');
INSERT INTO "public"."taxon" VALUES ('690081', 'Cholga mussel', 'Aulacomya ater');
INSERT INTO "public"."taxon" VALUES ('690082', 'Choro mussel', 'Choromytilus chorus');
INSERT INTO "public"."taxon" VALUES ('690085', 'Common cuttlefish', 'Sepia officinalis');
INSERT INTO "public"."taxon" VALUES ('690087', 'Common edible cockle', 'Cardium edule');
INSERT INTO "public"."taxon" VALUES ('690088', 'Common octopus', 'Octopus vulgaris');
INSERT INTO "public"."taxon" VALUES ('690089', 'Common periwinkle', 'Littorina littorea');
INSERT INTO "public"."taxon" VALUES ('690090', 'Common prawn', 'Palaemon serratus');
INSERT INTO "public"."taxon" VALUES ('690091', 'Common shrimp', 'Crangon crangon');
INSERT INTO "public"."taxon" VALUES ('690092', 'Common spiny lobster', 'Palinurus elephas');
INSERT INTO "public"."taxon" VALUES ('690094', 'Cortez oyster', 'Crassostrea corteziensis');
INSERT INTO "public"."taxon" VALUES ('690100', 'Crystal shrimp', 'Farfantepenaeus brevirostris');
INSERT INTO "public"."taxon" VALUES ('690105', 'Dana''s swimming crab', 'Callinectes danae');
INSERT INTO "public"."taxon" VALUES ('690109', 'Deepwater rose shrimp', 'Parapenaeus longirostris');
INSERT INTO "public"."taxon" VALUES ('690115', 'Dungeness crab', 'Cancer magister');
INSERT INTO "public"."taxon" VALUES ('690119', 'Edible crab', 'Cancer pagurus');
INSERT INTO "public"."taxon" VALUES ('690120', 'Endeavour shrimp', 'Metapenaeus endeavouri');
INSERT INTO "public"."taxon" VALUES ('690122', 'European edible sea urchin', 'Echinus esculentus');
INSERT INTO "public"."taxon" VALUES ('690123', 'European flat oyster', 'Ostrea edulis');
INSERT INTO "public"."taxon" VALUES ('690124', 'European flying squid', 'Todarodes sagittatus');
INSERT INTO "public"."taxon" VALUES ('690125', 'European lobster', 'Homarus gammarus');
INSERT INTO "public"."taxon" VALUES ('690126', 'European razor clam', 'Solen vagina');
INSERT INTO "public"."taxon" VALUES ('690127', 'False abalone', 'Concholepas concholepas');
INSERT INTO "public"."taxon" VALUES ('690129', 'Farrer''s scallop', 'Chlamys farreri');
INSERT INTO "public"."taxon" VALUES ('690133', 'Fleshy prawn', 'Fenneropenaeus chinensis');
INSERT INTO "public"."taxon" VALUES ('690134', 'Fluted giant clam', 'Tridacna squamosa');
INSERT INTO "public"."taxon" VALUES ('690143', 'Gazami crab', 'Portunus trituberculatus');
INSERT INTO "public"."taxon" VALUES ('690146', 'Giant abalone', 'Haliotis gigantea');
INSERT INTO "public"."taxon" VALUES ('690147', 'Giant clam', 'Tridacna gigas');
INSERT INTO "public"."taxon" VALUES ('690151', 'Giant tiger prawn', 'Penaeus monodon');
INSERT INTO "public"."taxon" VALUES ('690153', 'Globose clam', 'Mactra veneriformis');
INSERT INTO "public"."taxon" VALUES ('690155', 'Greasyback shrimp', 'Metapenaeus ensis');
INSERT INTO "public"."taxon" VALUES ('690156', 'Great Atlantic scallop', 'Pecten maximus');
INSERT INTO "public"."taxon" VALUES ('690157', 'Great Mediterranean scallop', 'Pecten jacobaeus');
INSERT INTO "public"."taxon" VALUES ('690158', 'Green crab', 'Carcinus maenas');
INSERT INTO "public"."taxon" VALUES ('690161', 'Green rock lobster', 'Jasus verreauxi');
INSERT INTO "public"."taxon" VALUES ('690163', 'Green tiger prawn', 'Penaeus semisulcatus');
INSERT INTO "public"."taxon" VALUES ('690166', 'Grooved carpet shell', 'Ruditapes decussatus');
INSERT INTO "public"."taxon" VALUES ('690167', 'Grooved sea squirt', 'Microcosmus sulcatus');
INSERT INTO "public"."taxon" VALUES ('690168', 'Guinea shrimp', 'Parapenaeopsis atlantica');
INSERT INTO "public"."taxon" VALUES ('690169', 'Half-crenated ark', 'Scapharca cornea');
INSERT INTO "public"."taxon" VALUES ('690176', 'Hen clam', 'Mactra sachalinensis');
INSERT INTO "public"."taxon" VALUES ('690177', 'Hooded oyster', 'Saccostrea cuccullata');
INSERT INTO "public"."taxon" VALUES ('690180', 'Horned turban', 'Turbo cornutus');
INSERT INTO "public"."taxon" VALUES ('690182', 'Horseshoe crab', 'Limulus polyphemus');
INSERT INTO "public"."taxon" VALUES ('690185', 'Iceland scallop', 'Chlamys islandica');
INSERT INTO "public"."taxon" VALUES ('690186', 'Indian backwater oyster', 'Crassostrea madrasensis');
INSERT INTO "public"."taxon" VALUES ('690189', 'Indian white prawn', 'Fenneropenaeus indicus');
INSERT INTO "public"."taxon" VALUES ('690190', 'Indo-Pacific swamp crab', 'Scylla serrata');
INSERT INTO "public"."taxon" VALUES ('690191', 'Inflated ark', 'Scapharca broughtoni');
INSERT INTO "public"."taxon" VALUES ('690194', 'Jack-knife shrimp', 'Haliporoides sibogae');
INSERT INTO "public"."taxon" VALUES ('690195', 'Japanese abalone', 'Haliotis discus');
INSERT INTO "public"."taxon" VALUES ('690196', 'Japanese carpet shell', 'Ruditapes philippinarum');
INSERT INTO "public"."taxon" VALUES ('690198', 'Japanese flying squid', 'Todarodes pacificus');
INSERT INTO "public"."taxon" VALUES ('690199', 'Japanese hard clam', 'Meretrix lusoria');
INSERT INTO "public"."taxon" VALUES ('690200', 'Japanese pearl oyster', 'Pinctada fucata');
INSERT INTO "public"."taxon" VALUES ('690201', 'Japanese sea cucumber', 'Apostichopus japonicus');
INSERT INTO "public"."taxon" VALUES ('690203', 'Jonah crab', 'Cancer borealis');
INSERT INTO "public"."taxon" VALUES ('690205', 'Juan Fernandez rock lobster', 'Jasus frontalis');
INSERT INTO "public"."taxon" VALUES ('690206', 'Jumbo flying squid', 'Dosidicus gigas');
INSERT INTO "public"."taxon" VALUES ('690215', 'Knife shrimp', 'Haliporoides triarthrus');
INSERT INTO "public"."taxon" VALUES ('690216', 'Coastal mud shrimp', 'Solenocera crassicornis');
INSERT INTO "public"."taxon" VALUES ('690217', 'Kolibri shrimp', 'Solenocera agassizii');
INSERT INTO "public"."taxon" VALUES ('690218', 'Korean mussel', 'Mytilus coruscus');
INSERT INTO "public"."taxon" VALUES ('690219', 'Kuruma prawn', 'Marsupenaeus japonicus');
INSERT INTO "public"."taxon" VALUES ('690227', 'Longfin squid', 'Loligo pealeii');
INSERT INTO "public"."taxon" VALUES ('690228', 'Longlegged spiny lobster', 'Panulirus longipes');
INSERT INTO "public"."taxon" VALUES ('690229', 'Lugubrious cupped oyster', 'Crassostrea belcheri');
INSERT INTO "public"."taxon" VALUES ('690230', 'Macha clam', 'Mesodesma donacium');
INSERT INTO "public"."taxon" VALUES ('690232', 'Mangrove cupped oyster', 'Crassostrea rhizophorae');
INSERT INTO "public"."taxon" VALUES ('690233', 'Asiatic clam', 'Corbicula manilensis');
INSERT INTO "public"."taxon" VALUES ('690241', 'Mediterranean mussel', 'Mytilus galloprovincialis');
INSERT INTO "public"."taxon" VALUES ('690242', 'Mediterranean shore crab', 'Carcinus aestuarii');
INSERT INTO "public"."taxon" VALUES ('690249', 'Mozambique lobster', 'Metanephrops mozambicus');
INSERT INTO "public"."taxon" VALUES ('690250', 'Mud spiny lobster', 'Panulirus polyphagus');
INSERT INTO "public"."taxon" VALUES ('690253', 'Natal spiny lobster', 'Palinurus delagoae');
INSERT INTO "public"."taxon" VALUES ('690256', 'New Zealand dredge oyster', 'Ostrea lutaria');
INSERT INTO "public"."taxon" VALUES ('690257', 'New Zealand lobster', 'Metanephrops challengeri');
INSERT INTO "public"."taxon" VALUES ('690258', 'New Zealand green mussel', 'Perna canaliculus');
INSERT INTO "public"."taxon" VALUES ('690259', 'New Zealand scallop', 'Pecten novaezelandiae');
INSERT INTO "public"."taxon" VALUES ('690262', 'Noble scallop', 'Chlamys nobilis');
INSERT INTO "public"."taxon" VALUES ('690265', 'Northern brown shrimp', 'Farfantepenaeus aztecus');
INSERT INTO "public"."taxon" VALUES ('690268', 'Northern pink shrimp', 'Farfantepenaeus duorarum');
INSERT INTO "public"."taxon" VALUES ('690269', 'Northern prawn', 'Pandalus borealis');
INSERT INTO "public"."taxon" VALUES ('690270', 'Northern quahog', 'Mercenaria mercenaria');
INSERT INTO "public"."taxon" VALUES ('690271', 'Northern shortfin squid', 'Illex illecebrosus');
INSERT INTO "public"."taxon" VALUES ('690272', 'Northern white shrimp', 'Litopenaeus setiferus');
INSERT INTO "public"."taxon" VALUES ('690273', 'Norway lobster', 'Nephrops norvegicus');
INSERT INTO "public"."taxon" VALUES ('690274', 'Norwegian krill', 'Meganyctiphanes norvegica');
INSERT INTO "public"."taxon" VALUES ('690275', 'Ocean quahog', 'Arctica islandica');
INSERT INTO "public"."taxon" VALUES ('690279', 'Olympia flat oyster', 'Ostrea lurida');
INSERT INTO "public"."taxon" VALUES ('690282', 'Pacific calico scallop', 'Argopecten ventricosus');
INSERT INTO "public"."taxon" VALUES ('690283', 'Pacific cupped oyster', 'Crassostrea gigas');
INSERT INTO "public"."taxon" VALUES ('690284', 'Pacific geoduck', 'Panopea abrupta');
INSERT INTO "public"."taxon" VALUES ('690285', 'Pacific littleneck clam', 'Protothaca staminea');
INSERT INTO "public"."taxon" VALUES ('690286', 'Pacific razor clam', 'Siliqua patula');
INSERT INTO "public"."taxon" VALUES ('690287', 'Pacific rock crab', 'Cancer productus');
INSERT INTO "public"."taxon" VALUES ('690288', 'Atlantic seabob', 'Xiphopenaeus kroyeri');
INSERT INTO "public"."taxon" VALUES ('690296', 'Patagonian squid', 'Loligo gahi');
INSERT INTO "public"."taxon" VALUES ('690300', 'Penguin wing oyster', 'Pteria penguin');
INSERT INTO "public"."taxon" VALUES ('690302', 'Perlemoen abalone', 'Haliotis midae');
INSERT INTO "public"."taxon" VALUES ('690303', 'Peruvian calico scallop', 'Argopecten purpuratus');
INSERT INTO "public"."taxon" VALUES ('690304', 'Pink conch', 'Lobatus gigas');
INSERT INTO "public"."taxon" VALUES ('690305', 'Pink spiny lobster', 'Palinurus mauritanicus');
INSERT INTO "public"."taxon" VALUES ('690306', 'Portuguese cupped oyster', 'Crassostrea angulata');
INSERT INTO "public"."taxon" VALUES ('690309', 'Pullet carpet shell', 'Tapes pullastra');
INSERT INTO "public"."taxon" VALUES ('690311', 'Purple sea urchin', 'Paracentrotus lividus');
INSERT INTO "public"."taxon" VALUES ('690313', 'Queen crab', 'Chionoecetes opilio');
INSERT INTO "public"."taxon" VALUES ('690314', 'Queen scallop', 'Aequipecten opercularis');
INSERT INTO "public"."taxon" VALUES ('690317', 'Red abalone', 'Haliotis rufescens');
INSERT INTO "public"."taxon" VALUES ('690318', 'Red bait', 'Pyura stolonifera');
INSERT INTO "public"."taxon" VALUES ('690320', 'Red deepsea crab', 'Chaceon quinquedens');
INSERT INTO "public"."taxon" VALUES ('690321', 'Red rock lobster', 'Jasus edwardsii');
INSERT INTO "public"."taxon" VALUES ('690322', 'Red sea squirt', 'Pyura chilensis');
INSERT INTO "public"."taxon" VALUES ('690324', 'Red starfish', 'Asterias rubens');
INSERT INTO "public"."taxon" VALUES ('690325', 'Red stone crab', 'Paralomis aculeata');
INSERT INTO "public"."taxon" VALUES ('690327', 'Redspotted shrimp', 'Farfantepenaeus brasiliensis');
INSERT INTO "public"."taxon" VALUES ('690328', 'Redtail prawn', 'Penaeus penicillatus');
INSERT INTO "public"."taxon" VALUES ('690332', 'River Plata mussel', 'Mytilus platensis');
INSERT INTO "public"."taxon" VALUES ('690334', 'Rock shrimp', 'Sicyonia brevirostris');
INSERT INTO "public"."taxon" VALUES ('690335', 'Royal red shrimp', 'Pleoticus robustus');
INSERT INTO "public"."taxon" VALUES ('690336', 'Royal spiny lobster', 'Panulirus regius');
INSERT INTO "public"."taxon" VALUES ('690337', 'Sand gaper', 'Mya arenaria');
INSERT INTO "public"."taxon" VALUES ('690338', 'Sao Paulo shrimp', 'Farfantepenaeus paulensis');
INSERT INTO "public"."taxon" VALUES ('690341', 'Scalloped spiny lobster', 'Panulirus homarus');
INSERT INTO "public"."taxon" VALUES ('690343', 'Scarlet shrimp', 'Plesiopenaeus edwardsianus');
INSERT INTO "public"."taxon" VALUES ('690354', 'Sevenstar flying squid', 'Martialia hyadesi');
INSERT INTO "public"."taxon" VALUES ('690356', 'Shiba shrimp', 'Metapenaeus joyneri');
INSERT INTO "public"."taxon" VALUES ('690363', 'Silver-lip pearl oyster', 'Pinctada maxima');
INSERT INTO "public"."taxon" VALUES ('690364', 'Slipper cupped oyster', 'Crassostrea iredalei');
INSERT INTO "public"."taxon" VALUES ('690366', 'Small abalone', 'Haliotis diversicolor');
INSERT INTO "public"."taxon" VALUES ('690368', 'Smooth mactra', 'Mactra glabrata');
INSERT INTO "public"."taxon" VALUES ('690370', 'Softshell red crab', 'Paralomis granulosa');
INSERT INTO "public"."taxon" VALUES ('690374', 'South American rock mussel', 'Perna perna');
INSERT INTO "public"."taxon" VALUES ('690376', 'Southern brown shrimp', 'Farfantepenaeus subtilis');
INSERT INTO "public"."taxon" VALUES ('690377', 'Southern king crab', 'Lithodes antarcticus');
INSERT INTO "public"."taxon" VALUES ('690378', 'Southern pink shrimp', 'Farfantepenaeus notialis');
INSERT INTO "public"."taxon" VALUES ('690379', 'Southern rough shrimp', 'Trachysalambria curvirostris');
INSERT INTO "public"."taxon" VALUES ('690381', 'Southern spiny lobster', 'Palinurus gilchristi');
INSERT INTO "public"."taxon" VALUES ('690382', 'Southern white shrimp', 'Litopenaeus schmitti');
INSERT INTO "public"."taxon" VALUES ('690383', 'Speckled shrimp', 'Metapenaeus monoceros');
INSERT INTO "public"."taxon" VALUES ('690387', 'Spinous spider crab', 'Maja squinado');
INSERT INTO "public"."taxon" VALUES ('690392', 'Spottail mantis squillid', 'Squilla mantis');
INSERT INTO "public"."taxon" VALUES ('690393', 'Squilla biformis', 'Squilla biformis');
INSERT INTO "public"."taxon" VALUES ('690398', 'Stimpsons surf clam', 'Mactromeris polynyma');
INSERT INTO "public"."taxon" VALUES ('690399', 'Stone king crab', 'Lithodes maia');
INSERT INTO "public"."taxon" VALUES ('690400', 'Stony sea urchin', 'Paracentrotus lividus');
INSERT INTO "public"."taxon" VALUES ('690403', 'Striped red shrimp', 'Aristeus varidens');
INSERT INTO "public"."taxon" VALUES ('690404', 'Striped venus', 'Venus gallina');
INSERT INTO "public"."taxon" VALUES ('690406', 'Subantarctic stone crab', 'Lithodes murrayi');
INSERT INTO "public"."taxon" VALUES ('690407', 'Suminoe oyster', 'Crassostrea rivularis');
INSERT INTO "public"."taxon" VALUES ('690411', 'Taca clam', 'Protothaca thaca');
INSERT INTO "public"."taxon" VALUES ('690416', 'Tristan da Cunha lobster', 'Jasus tristani');
INSERT INTO "public"."taxon" VALUES ('690420', 'Tuberculate abalone', 'Haliotis tuberculata');
INSERT INTO "public"."taxon" VALUES ('690423', 'Variegated scallop', 'Mimachlamys varia');
INSERT INTO "public"."taxon" VALUES ('690425', 'Velvet swimcrab', 'Necora puber');
INSERT INTO "public"."taxon" VALUES ('690429', 'Weathervane scallop', 'Patinopecten caurinus');
INSERT INTO "public"."taxon" VALUES ('690430', 'Wellington flying squid', 'Nototodarus sloanii');
INSERT INTO "public"."taxon" VALUES ('690432', 'Western king prawn', 'Melicertus latisulcatus');
INSERT INTO "public"."taxon" VALUES ('690433', 'Western white shrimp', 'Litopenaeus occidentalis');
INSERT INTO "public"."taxon" VALUES ('690434', 'Whelk', 'Buccinum undatum');
INSERT INTO "public"."taxon" VALUES ('690440', 'Whiteleg shrimp', 'Litopenaeus vannamei');
INSERT INTO "public"."taxon" VALUES ('690444', 'Yellowleg shrimp', 'Farfantepenaeus californiensis');
INSERT INTO "public"."taxon" VALUES ('690445', 'Yesso scallop', 'Pecten yessoensis');
INSERT INTO "public"."taxon" VALUES ('690470', 'Neon flying squid', 'Ommastrephes bartramii');
INSERT INTO "public"."taxon" VALUES ('690494', 'Green sea urchin', 'Strongylocentrotus droebachiensis');
INSERT INTO "public"."taxon" VALUES ('690595', 'Veined Squid', 'Loligo forbesii');
INSERT INTO "public"."taxon" VALUES ('690598', 'Mediterranean slipper lobster', 'Scyllarides latus');
INSERT INTO "public"."taxon" VALUES ('690599', 'Hays rock-shell', 'Stramonita haemastoma');
INSERT INTO "public"."taxon" VALUES ('690603', 'Queen scallop', 'Aequipecten opercularis');
INSERT INTO "public"."taxon" VALUES ('690605', 'common edible cockle', 'Cerastoderma edule');
INSERT INTO "public"."taxon" VALUES ('690606', 'Carrot Squat Lobster', 'Cervimunida johni');
INSERT INTO "public"."taxon" VALUES ('690608', 'Hair Crab', 'Erimacrus isenbeckii');
INSERT INTO "public"."taxon" VALUES ('690609', 'Chilean nylon shrimp', 'Haliporoides diomedeae');
INSERT INTO "public"."taxon" VALUES ('690610', 'Northern nylon shrimp', 'Heterocarpus vicarius');
INSERT INTO "public"."taxon" VALUES ('690611', 'Sand Crayfish', 'Ibacus ciliatus');
INSERT INTO "public"."taxon" VALUES ('690612', 'Same-spine stone crab', 'Lithodes aequispinus');
INSERT INTO "public"."taxon" VALUES ('690613', 'Giant barnacle', 'Megabalanus psittacus');
INSERT INTO "public"."taxon" VALUES ('690614', 'Armored spider crab', 'Mithrax armatus');
INSERT INTO "public"."taxon" VALUES ('690615', 'Sidestripe shrimp', 'Pandalopsis japonica');
INSERT INTO "public"."taxon" VALUES ('690616', 'Humpy shrimp', 'Pandalus goniurus');
INSERT INTO "public"."taxon" VALUES ('690617', 'Humpback shrimp', 'Pandalus hypsinotus');
INSERT INTO "public"."taxon" VALUES ('690618', 'Grass shrimp', 'Pandalus kessleri');
INSERT INTO "public"."taxon" VALUES ('690619', 'Blue spiny lobster', 'Panulirus gracilis');
INSERT INTO "public"."taxon" VALUES ('690620', 'Spiny king crab', 'Paralithodes brevipes');
INSERT INTO "public"."taxon" VALUES ('690621', 'Red king crab', 'Paralithodes camtschaticus');
INSERT INTO "public"."taxon" VALUES ('690622', 'Blue King Crab', 'Paralithodes platypus');
INSERT INTO "public"."taxon" VALUES ('690624', 'Squat Lobster', 'Pleuroncodes monodon');
INSERT INTO "public"."taxon" VALUES ('690625', 'Pelagic red crab', 'Pleuroncodes planipes');
INSERT INTO "public"."taxon" VALUES ('690627', 'Corvina', 'Cilus gilberti');
INSERT INTO "public"."taxon" VALUES ('690628', 'Ridgeback rock shrimp', 'Sicyonia ingentis');
INSERT INTO "public"."taxon" VALUES ('690629', 'Trigonal tivela', 'Tivela mactroides');
INSERT INTO "public"."taxon" VALUES ('690630', 'Pullet carpet shell', 'Venerupis pullastra');
INSERT INTO "public"."taxon" VALUES ('690631', 'Venus clam', 'Spisula ovalis');
INSERT INTO "public"."taxon" VALUES ('690649', 'Blood ark', 'Anadara ovalis');
INSERT INTO "public"."taxon" VALUES ('690651', 'Nuttall cockle', 'Clinocardium nuttallii');
INSERT INTO "public"."taxon" VALUES ('690658', 'California market squid', 'Loligo opalescens');
INSERT INTO "public"."taxon" VALUES ('690660', 'Ocean shrimp', 'Pandalus jordani');
INSERT INTO "public"."taxon" VALUES ('690664', 'Pacific gaper clam', 'Tresus nuttallii');
INSERT INTO "public"."taxon" VALUES ('690665', 'Blue mud shrimp', 'Upogebia pugettensis');
INSERT INTO "public"."taxon" VALUES ('690666', 'Blue Land Crab', 'Cardisoma guanhumi');
INSERT INTO "public"."taxon" VALUES ('690670', 'Bigfin reef squid', 'Sepioteuthis lessoniana');
INSERT INTO "public"."taxon" VALUES ('690671', 'Surf clam', 'Spisula solida');
INSERT INTO "public"."taxon" VALUES ('690673', 'Maxima clam', 'Tridacna maxima');
INSERT INTO "public"."taxon" VALUES ('690674', 'Angulate volute', 'Zidona dufresnei');
INSERT INTO "public"."taxon" VALUES ('690675', 'Banded carpet shell', 'Tapes rhomboides');
INSERT INTO "public"."taxon" VALUES ('690676', 'Blue-leg swimcrab', 'Liocarcinus depurator');
INSERT INTO "public"."taxon" VALUES ('690677', 'Chilean semele', 'Semele solida');
INSERT INTO "public"."taxon" VALUES ('690678', 'Dog cockle', 'Glycymeris glycymeris');
INSERT INTO "public"."taxon" VALUES ('690679', 'Delicate scallop', 'Chlamys delicatula');
INSERT INTO "public"."taxon" VALUES ('690680', 'Delta prawn', 'Palaemon longirostris');
INSERT INTO "public"."taxon" VALUES ('690681', 'Flathead lobster', 'Thenus orientalis');
INSERT INTO "public"."taxon" VALUES ('690682', 'Gay''s little venus', 'Tawera gayi');
INSERT INTO "public"."taxon" VALUES ('690683', 'Giant red shrimp', 'Aristaeomorpha foliacea');
INSERT INTO "public"."taxon" VALUES ('690684', 'Horned octopus', 'Eledone cirrhosa');
INSERT INTO "public"."taxon" VALUES ('690685', 'Knobbed triton', 'Charonia lampas');
INSERT INTO "public"."taxon" VALUES ('690686', 'Patagonean scallop', 'Zygochlamys patagonica');
INSERT INTO "public"."taxon" VALUES ('690687', 'Peppery furrow shell', 'Scrobicularia plana');
INSERT INTO "public"."taxon" VALUES ('690688', 'Pipi wedge clam', 'Paphies australis');
INSERT INTO "public"."taxon" VALUES ('690689', 'Purple dye murex', 'Bolinus brandaris');
INSERT INTO "public"."taxon" VALUES ('690690', 'Smooth callista', 'Callista chione');
INSERT INTO "public"."taxon" VALUES ('690691', 'St.Paul rock lobster', 'Jasus paulensis');
INSERT INTO "public"."taxon" VALUES ('690692', 'Stutchbury''s venus', 'Chione stutchburyi');
INSERT INTO "public"."taxon" VALUES ('690693', 'Warty venus', 'Venus verrucosa');
INSERT INTO "public"."taxon" VALUES ('690694', 'Whitebelly prawn', 'Nematopalaemon schmitti');
INSERT INTO "public"."taxon" VALUES ('690695', 'Oriental cyclina', 'Cyclina sinensis');
INSERT INTO "public"."taxon" VALUES ('690696', 'Southern rock lobster', 'Jasus novaehollandiae');
INSERT INTO "public"."taxon" VALUES ('690698', 'Chinese razor clam', 'Sinonovacula constricta');
INSERT INTO "public"."taxon" VALUES ('690750', 'Helmet ton', 'Tonna galea');
INSERT INTO "public"."taxon" VALUES ('690751', 'Rostrate pitar', 'Pitar rostratus');
INSERT INTO "public"."taxon" VALUES ('690752', 'Tuberculate cockle', 'Acanthocardia tuberculata');
INSERT INTO "public"."taxon" VALUES ('690753', 'Deep-sea red crab', 'Chaceon affinis');
INSERT INTO "public"."taxon" VALUES ('690754', 'Pod razor', 'Ensis ensis');
INSERT INTO "public"."taxon" VALUES ('690755', 'Sword razor shell', 'Ensis siliqua');
INSERT INTO "public"."taxon" VALUES ('690756', 'Norwegian egg cockle', 'Laevicardium crassum');
INSERT INTO "public"."taxon" VALUES ('690758', 'Atlantic ditch shrimp', 'Palaemonetes varians');
INSERT INTO "public"."taxon" VALUES ('690759', 'Bean solen', 'Pharus legumen');
INSERT INTO "public"."taxon" VALUES ('690761', 'Fly spotted auger', 'Terebra areolata');
INSERT INTO "public"."taxon" VALUES ('690762', 'Crenate swimming crab', 'Thalamita crenata');
INSERT INTO "public"."taxon" VALUES ('690763', 'Pacific partridge tun', 'Tonna perdix');
INSERT INTO "public"."taxon" VALUES ('690764', 'FLOWER URCHIN', 'Toxopneustes pileolus');
INSERT INTO "public"."taxon" VALUES ('690765', 'SHORTSPINE URCHIN', 'Tripneustes gratilla');
INSERT INTO "public"."taxon" VALUES ('690766', 'commercial top', 'Trochus niloticus');
INSERT INTO "public"."taxon" VALUES ('690767', 'Rough turban', 'Turbo setosus');
INSERT INTO "public"."taxon" VALUES ('690768', 'top vase', 'Vasum turbinellum');
INSERT INTO "public"."taxon" VALUES ('690769', 'SHALLOW REEF CRAB', 'Zosimus aeneus');
INSERT INTO "public"."taxon" VALUES ('690770', 'Red reef crab', 'Carpilius convexus');
INSERT INTO "public"."taxon" VALUES ('690771', 'spotted reef crab', 'Carpilius maculatus');
INSERT INTO "public"."taxon" VALUES ('690772', 'HORNED HELMET', 'Cassis cornuta');
INSERT INTO "public"."taxon" VALUES ('690773', 'HEBREW CONE', 'Conus ebraeus');
INSERT INTO "public"."taxon" VALUES ('690774', 'STRIATED CONE', 'Conus striatus');
INSERT INTO "public"."taxon" VALUES ('690781', 'horrid elbow crab', 'Daldorfia horrida');
INSERT INTO "public"."taxon" VALUES ('690782', 'whitespotted hermit', 'Dardanus megistos');
INSERT INTO "public"."taxon" VALUES ('690783', 'savigny''s long-spine sea urchin', 'Diadema savignyi');
INSERT INTO "public"."taxon" VALUES ('690786', 'REDEYE CRAB', 'Eriphia sebana');
INSERT INTO "public"."taxon" VALUES ('690787', 'splendid spooner', 'Etisus splendidus');
INSERT INTO "public"."taxon" VALUES ('690788', 'TUMID VENUS', 'Gafrarium tumidum');
INSERT INTO "public"."taxon" VALUES ('690789', 'Spanish dancer', 'Hexabranchus sanguineus');
INSERT INTO "public"."taxon" VALUES ('690790', 'LOLLYFISH', 'Holothuria atra');
INSERT INTO "public"."taxon" VALUES ('690791', 'PINKFISH', 'Holothuria edulis');
INSERT INTO "public"."taxon" VALUES ('690793', 'COMMON SPIDER CONCH', 'Lambis lambis');
INSERT INTO "public"."taxon" VALUES ('690794', 'GIANT SPIDER CONCH', 'Lambis truncata');
INSERT INTO "public"."taxon" VALUES ('690795', 'PLICATE NERITE', 'Nerita plicata');
INSERT INTO "public"."taxon" VALUES ('690796', 'POLISHED NERITE', 'Nerita polita');
INSERT INTO "public"."taxon" VALUES ('690797', 'ORNATE OCTOPUS', 'Octopus ornatus');
INSERT INTO "public"."taxon" VALUES ('690798', 'Japanese squillid mantis shrimp', 'Oratosquilla oratoria');
INSERT INTO "public"."taxon" VALUES ('690799', 'Indo-Pacific furry lobster', 'Palinurellus wieneckii');
INSERT INTO "public"."taxon" VALUES ('690800', 'Ornate spiny lobster', 'Panulirus ornatus');
INSERT INTO "public"."taxon" VALUES ('690801', 'Pronghorn spiny lobster', 'Panulirus penicillatus');
INSERT INTO "public"."taxon" VALUES ('690802', 'PAINTED spiny lobster', 'Panulirus versicolor');
INSERT INTO "public"."taxon" VALUES ('690803', 'Sculptured mitten lobster', 'Parribacus antarcticus');
INSERT INTO "public"."taxon" VALUES ('690804', 'BICOLOR PEN SHELL', 'Pinna bicolor');
INSERT INTO "public"."taxon" VALUES ('690806', 'BROADCLUB CUTTLEFISH', 'Sepia latimanus');
INSERT INTO "public"."taxon" VALUES ('690807', 'Selenka''s sea cucumber', 'Stichopus horrens');
INSERT INTO "public"."taxon" VALUES ('690808', 'GIBBOSE CONCH', 'Strombus gibberulus');
INSERT INTO "public"."taxon" VALUES ('690809', 'Strawberry conch', 'Strombus luhuanus');
INSERT INTO "public"."taxon" VALUES ('690810', 'PYRAMID TOP', 'Tectus pyramis');
INSERT INTO "public"."taxon" VALUES ('690811', 'CRENULATED AUGER', 'Terebra crenulata');
INSERT INTO "public"."taxon" VALUES ('690812', 'MARLINSPIKE', 'Terebra maculata');
INSERT INTO "public"."taxon" VALUES ('690813', 'Northern spined chiton', 'Acanthopleura gemmata');
INSERT INTO "public"."taxon" VALUES ('690814', 'SPINEY CHITON', 'Acanthopleura spinosa');
INSERT INTO "public"."taxon" VALUES ('690815', 'SEA CUCUMBER', 'Actinopyga obesa');
INSERT INTO "public"."taxon" VALUES ('690816', 'Pacific asaphis', 'Asaphis violascens');
INSERT INTO "public"."taxon" VALUES ('690817', 'Gaudy asaphis', 'Asaphis deflorata');
INSERT INTO "public"."taxon" VALUES ('690819', 'Chalky cucumber', 'Bohadschia marmorata');
INSERT INTO "public"."taxon" VALUES ('690821', 'BOX CRAB', 'Calappa hepatica');
INSERT INTO "public"."taxon" VALUES ('690882', 'Caledonian mitten lobster', 'Parribacus caledonicus');
INSERT INTO "public"."taxon" VALUES ('690883', 'Kona crab                ', 'Ranina ranina');
INSERT INTO "public"."taxon" VALUES ('690887', 'West African mangrove oyster ', 'Crassostrea tulipa');
INSERT INTO "public"."taxon" VALUES ('690888', 'Kumamoto oyster', 'Crassostrea sikamea');
INSERT INTO "public"."taxon" VALUES ('690889', 'giant rock-scallop ', 'Crassadoma gigantea');
INSERT INTO "public"."taxon" VALUES ('690891', 'North Pacific giant octopus', 'Enteroctopus dofleini');
INSERT INTO "public"."taxon" VALUES ('690892', 'long arm octopus', 'Octopus minor');
INSERT INTO "public"."taxon" VALUES ('690893', 'lion''s paw scallop ', 'Nodipecten nodosus');
INSERT INTO "public"."taxon" VALUES ('690894', 'Gomphina veneriformis', 'Gomphina veneriformis');
INSERT INTO "public"."taxon" VALUES ('690895', 'diphos sanguin ', 'Soletellina diphos');
INSERT INTO "public"."taxon" VALUES ('690896', 'Goneplax rhomboides', 'Goneplax rhomboides');
INSERT INTO "public"."taxon" VALUES ('690897', 'Purple whelk', 'Rapana venosa');
INSERT INTO "public"."taxon" VALUES ('690906', 'Big blue octopus', 'Octopus cyanea');
INSERT INTO "public"."taxon" VALUES ('690909', 'West Indian top shell', 'Cittarium pica');
INSERT INTO "public"."taxon" VALUES ('690910', 'Plesionika trispinus', 'Plesionika trispinus');
INSERT INTO "public"."taxon" VALUES ('690911', 'Caribbean reef squid', 'Sepioteuthis sepioidea');
INSERT INTO "public"."taxon" VALUES ('690912', 'Spear shrimp', 'Parapenaeopsis hardwickii');
INSERT INTO "public"."taxon" VALUES ('690913', 'Rainbow shrimp', 'Parapenaeopsis sculptilis');
INSERT INTO "public"."taxon" VALUES ('690914', 'Strong elbow crab', 'Platylambrus validus');
COMMIT;

-- ----------------------------
--  Table structure for reconstructed_catch
-- ----------------------------
DROP TABLE IF EXISTS "public"."reconstructed_catch";
CREATE TABLE "public"."reconstructed_catch" (
	"id" int4 NOT NULL DEFAULT nextval('reconstructed_catch_id_seq'::regclass),
	"year" int4 NOT NULL,
	"amount" numeric(20,12) NOT NULL,
	"fao_area" varchar(20) COLLATE "default",
	"sub_regional_area" varchar(200) COLLATE "default",
	"province_state" varchar(200) COLLATE "default",
	"ices_division" varchar(20) COLLATE "default",
	"ices_subdivision" varchar(20) COLLATE "default",
	"nafo_division" varchar(20) COLLATE "default",
	"ccamlr_area" varchar(20) COLLATE "default",
	"input_type" varchar(200) COLLATE "default",
	"reference_id" int4,
	"forward_carry_rule" varchar(400) COLLATE "default",
	"adjustment_factor" varchar(200) COLLATE "default",
	"gear" varchar(200) COLLATE "default",
	"notes" varchar(2000) COLLATE "default",
	"catch_type_id" int4 NOT NULL,
	"eez_id" int4 NOT NULL,
	"fishing_entity_id" int4 NOT NULL,
	"original_country_fishing_id" int4 NOT NULL,
	"raw_catch_id" int4 NOT NULL,
	"sector_id" int4 NOT NULL,
	"taxon_id" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."reconstructed_catch" OWNER TO "recon";


-- ----------------------------
--  Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."auth_group_id_seq" RESTART 2 OWNED BY "auth_group"."id";
ALTER SEQUENCE "public"."auth_group_permissions_id_seq" RESTART 2 OWNED BY "auth_group_permissions"."id";
ALTER SEQUENCE "public"."auth_permission_id_seq" RESTART 55 OWNED BY "auth_permission"."id";
ALTER SEQUENCE "public"."auth_user_groups_id_seq" RESTART 2 OWNED BY "auth_user_groups"."id";
ALTER SEQUENCE "public"."auth_user_id_seq" RESTART 2 OWNED BY "auth_user"."id";
ALTER SEQUENCE "public"."auth_user_user_permissions_id_seq" RESTART 2 OWNED BY "auth_user_user_permissions"."id";
ALTER SEQUENCE "public"."catch_type_id_seq" RESTART 2 OWNED BY "catch_type"."id";
ALTER SEQUENCE "public"."country_id_seq" RESTART 2 OWNED BY "country"."id";
ALTER SEQUENCE "public"."data_ingest_fileupload_id_seq" RESTART 92 OWNED BY "data_ingest_fileupload"."id";
ALTER SEQUENCE "public"."data_ingest_rawcatch_id_seq" RESTART 4871 OWNED BY "data_ingest_rawcatch"."id";
ALTER SEQUENCE "public"."django_admin_log_id_seq" RESTART 2 OWNED BY "django_admin_log"."id";
ALTER SEQUENCE "public"."django_content_type_id_seq" RESTART 19 OWNED BY "django_content_type"."id";
ALTER SEQUENCE "public"."django_migrations_id_seq" RESTART 46 OWNED BY "django_migrations"."id";
ALTER SEQUENCE "public"."eez_id_seq" RESTART 2 OWNED BY "eez"."id";
ALTER SEQUENCE "public"."fishing_sector_id_seq" RESTART 2 OWNED BY "fishing_sector"."id";
ALTER SEQUENCE "public"."reconstructed_catch_id_seq" RESTART 2 OWNED BY "reconstructed_catch"."id";
ALTER SEQUENCE "public"."reference_id_seq" RESTART 2 OWNED BY "reference"."id";
-- ----------------------------
--  Primary key structure for table django_admin_log
-- ----------------------------
ALTER TABLE "public"."django_admin_log" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Checks structure for table django_admin_log
-- ----------------------------
ALTER TABLE "public"."django_admin_log" ADD CONSTRAINT "django_admin_log_action_flag_check" CHECK ((action_flag >= 0)) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table django_admin_log
-- ----------------------------
CREATE INDEX  "django_admin_log_417f1b1c" ON "public"."django_admin_log" USING btree(content_type_id ASC NULLS LAST);
CREATE INDEX  "django_admin_log_e8701ad4" ON "public"."django_admin_log" USING btree(user_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table django_migrations
-- ----------------------------
ALTER TABLE "public"."django_migrations" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table django_session
-- ----------------------------
ALTER TABLE "public"."django_session" ADD PRIMARY KEY ("session_key") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table django_session
-- ----------------------------
CREATE INDEX  "django_session_de54fa62" ON "public"."django_session" USING btree(expire_date ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table eez
-- ----------------------------
ALTER TABLE "public"."eez" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table eez
-- ----------------------------
CREATE INDEX  "eez_93bfec8a" ON "public"."eez" USING btree(country_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table fishing_sector
-- ----------------------------
ALTER TABLE "public"."fishing_sector" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table data_ingest_rawcatch
-- ----------------------------
ALTER TABLE "public"."data_ingest_rawcatch" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table data_ingest_rawcatch
-- ----------------------------
CREATE INDEX  "data_ingest_rawcatch_01490fd0" ON "public"."data_ingest_rawcatch" USING btree(source_file_id ASC NULLS LAST);
CREATE INDEX  "data_ingest_rawcatch_e8701ad4" ON "public"."data_ingest_rawcatch" USING btree(user_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table reference
-- ----------------------------
ALTER TABLE "public"."reference" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table django_content_type
-- ----------------------------
ALTER TABLE "public"."django_content_type" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table django_content_type
-- ----------------------------
ALTER TABLE "public"."django_content_type" ADD CONSTRAINT "django_content_type_app_label_357160df_uniq" UNIQUE ("app_label","model") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table auth_user
-- ----------------------------
ALTER TABLE "public"."auth_user" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table auth_user
-- ----------------------------
ALTER TABLE "public"."auth_user" ADD CONSTRAINT "auth_user_username_key" UNIQUE ("username") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table auth_group_permissions
-- ----------------------------
ALTER TABLE "public"."auth_group_permissions" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table auth_group_permissions
-- ----------------------------
ALTER TABLE "public"."auth_group_permissions" ADD CONSTRAINT "auth_group_permissions_group_id_permission_id_key" UNIQUE ("group_id","permission_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table auth_group_permissions
-- ----------------------------
CREATE INDEX  "auth_group_permissions_0e939a4f" ON "public"."auth_group_permissions" USING btree(group_id ASC NULLS LAST);
CREATE INDEX  "auth_group_permissions_8373b171" ON "public"."auth_group_permissions" USING btree(permission_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table auth_group
-- ----------------------------
ALTER TABLE "public"."auth_group" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table auth_group
-- ----------------------------
ALTER TABLE "public"."auth_group" ADD CONSTRAINT "auth_group_name_key" UNIQUE ("name") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table auth_user_groups
-- ----------------------------
ALTER TABLE "public"."auth_user_groups" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table auth_user_groups
-- ----------------------------
ALTER TABLE "public"."auth_user_groups" ADD CONSTRAINT "auth_user_groups_user_id_group_id_key" UNIQUE ("user_id","group_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table auth_user_groups
-- ----------------------------
CREATE INDEX  "auth_user_groups_0e939a4f" ON "public"."auth_user_groups" USING btree(group_id ASC NULLS LAST);
CREATE INDEX  "auth_user_groups_e8701ad4" ON "public"."auth_user_groups" USING btree(user_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table auth_permission
-- ----------------------------
ALTER TABLE "public"."auth_permission" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table auth_permission
-- ----------------------------
ALTER TABLE "public"."auth_permission" ADD CONSTRAINT "auth_permission_content_type_id_codename_key" UNIQUE ("content_type_id","codename") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table auth_permission
-- ----------------------------
CREATE INDEX  "auth_permission_417f1b1c" ON "public"."auth_permission" USING btree(content_type_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table catch_type
-- ----------------------------
ALTER TABLE "public"."catch_type" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table auth_user_user_permissions
-- ----------------------------
ALTER TABLE "public"."auth_user_user_permissions" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table auth_user_user_permissions
-- ----------------------------
ALTER TABLE "public"."auth_user_user_permissions" ADD CONSTRAINT "auth_user_user_permissions_user_id_permission_id_key" UNIQUE ("user_id","permission_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table auth_user_user_permissions
-- ----------------------------
CREATE INDEX  "auth_user_user_permissions_8373b171" ON "public"."auth_user_user_permissions" USING btree(permission_id ASC NULLS LAST);
CREATE INDEX  "auth_user_user_permissions_e8701ad4" ON "public"."auth_user_user_permissions" USING btree(user_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table country
-- ----------------------------
ALTER TABLE "public"."country" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table data_ingest_fileupload
-- ----------------------------
ALTER TABLE "public"."data_ingest_fileupload" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table data_ingest_fileupload
-- ----------------------------
CREATE INDEX  "data_ingest_fileupload_e8701ad4" ON "public"."data_ingest_fileupload" USING btree(user_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table taxon
-- ----------------------------
ALTER TABLE "public"."taxon" ADD PRIMARY KEY ("taxon_key") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table reconstructed_catch
-- ----------------------------
ALTER TABLE "public"."reconstructed_catch" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table reconstructed_catch
-- ----------------------------
CREATE INDEX  "reconstructed_catch_02655565" ON "public"."reconstructed_catch" USING btree(eez_id ASC NULLS LAST);
CREATE INDEX  "reconstructed_catch_45e4b6df" ON "public"."reconstructed_catch" USING btree(fishing_entity_id ASC NULLS LAST);
CREATE INDEX  "reconstructed_catch_4a97df82" ON "public"."reconstructed_catch" USING btree(original_country_fishing_id ASC NULLS LAST);
CREATE INDEX  "reconstructed_catch_5b1d2adf" ON "public"."reconstructed_catch" USING btree(sector_id ASC NULLS LAST);
CREATE INDEX  "reconstructed_catch_87261c8f" ON "public"."reconstructed_catch" USING btree(raw_catch_id ASC NULLS LAST);
CREATE INDEX  "reconstructed_catch_8a985b4b" ON "public"."reconstructed_catch" USING btree(catch_type_id ASC NULLS LAST);
CREATE INDEX  "reconstructed_catch_96912c2c" ON "public"."reconstructed_catch" USING btree(taxon_id ASC NULLS LAST);

-- ----------------------------
--  Foreign keys structure for table django_admin_log
-- ----------------------------
ALTER TABLE "public"."django_admin_log" ADD CONSTRAINT "django_admin_content_type_id_477afe5d_fk_django_content_type_id" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;
ALTER TABLE "public"."django_admin_log" ADD CONSTRAINT "django_admin_log_user_id_226e739d_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."auth_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;

-- ----------------------------
--  Foreign keys structure for table eez
-- ----------------------------
ALTER TABLE "public"."eez" ADD CONSTRAINT "eez_country_id_10cc4a7_fk_country_id" FOREIGN KEY ("country_id") REFERENCES "public"."country" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;

-- ----------------------------
--  Foreign keys structure for table data_ingest_rawcatch
-- ----------------------------
ALTER TABLE "public"."data_ingest_rawcatch" ADD CONSTRAINT "data_inges_source_file_id_4a9039ab_fk_data_ingest_fileupload_id" FOREIGN KEY ("source_file_id") REFERENCES "public"."data_ingest_fileupload" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;
ALTER TABLE "public"."data_ingest_rawcatch" ADD CONSTRAINT "data_ingest_rawcatch_user_id_23b03467_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."auth_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;

-- ----------------------------
--  Foreign keys structure for table auth_group_permissions
-- ----------------------------
ALTER TABLE "public"."auth_group_permissions" ADD CONSTRAINT "auth_group_permiss_permission_id_13f8369d_fk_auth_permission_id" FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;
ALTER TABLE "public"."auth_group_permissions" ADD CONSTRAINT "auth_group_permissions_group_id_73b78026_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "public"."auth_group" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;

-- ----------------------------
--  Foreign keys structure for table auth_user_groups
-- ----------------------------
ALTER TABLE "public"."auth_user_groups" ADD CONSTRAINT "auth_user_groups_group_id_241d01c8_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "public"."auth_group" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;
ALTER TABLE "public"."auth_user_groups" ADD CONSTRAINT "auth_user_groups_user_id_14f45a0e_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."auth_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;

-- ----------------------------
--  Foreign keys structure for table auth_permission
-- ----------------------------
ALTER TABLE "public"."auth_permission" ADD CONSTRAINT "auth_permiss_content_type_id_5ee6a1a4_fk_django_content_type_id" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;

-- ----------------------------
--  Foreign keys structure for table auth_user_user_permissions
-- ----------------------------
ALTER TABLE "public"."auth_user_user_permissions" ADD CONSTRAINT "auth_user_user_per_permission_id_7a5d42b9_fk_auth_permission_id" FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;
ALTER TABLE "public"."auth_user_user_permissions" ADD CONSTRAINT "auth_user_user_permissions_user_id_128b49fe_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."auth_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;

-- ----------------------------
--  Foreign keys structure for table data_ingest_fileupload
-- ----------------------------
ALTER TABLE "public"."data_ingest_fileupload" ADD CONSTRAINT "data_ingest_fileupload_user_id_5b3dc4f3_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."auth_user" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;

-- ----------------------------
--  Foreign keys structure for table reconstructed_catch
-- ----------------------------
ALTER TABLE "public"."reconstructed_catch" ADD CONSTRAINT "reconstructe_original_country_fishing_id_5c6ab214_fk_country_id" FOREIGN KEY ("original_country_fishing_id") REFERENCES "public"."country" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;
ALTER TABLE "public"."reconstructed_catch" ADD CONSTRAINT "reconstructed__raw_catch_id_75639228_fk_data_ingest_rawcatch_id" FOREIGN KEY ("raw_catch_id") REFERENCES "public"."data_ingest_rawcatch" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;
ALTER TABLE "public"."reconstructed_catch" ADD CONSTRAINT "reconstructed_catch_catch_type_id_17b0ba3b_fk_catch_type_id" FOREIGN KEY ("catch_type_id") REFERENCES "public"."catch_type" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;
ALTER TABLE "public"."reconstructed_catch" ADD CONSTRAINT "reconstructed_catch_eez_id_2f6f5d68_fk_eez_id" FOREIGN KEY ("eez_id") REFERENCES "public"."eez" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;
ALTER TABLE "public"."reconstructed_catch" ADD CONSTRAINT "reconstructed_catch_fishing_entity_id_5141603d_fk_country_id" FOREIGN KEY ("fishing_entity_id") REFERENCES "public"."country" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;
ALTER TABLE "public"."reconstructed_catch" ADD CONSTRAINT "reconstructed_catch_sector_id_6388b257_fk_fishing_sector_id" FOREIGN KEY ("sector_id") REFERENCES "public"."fishing_sector" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;
ALTER TABLE "public"."reconstructed_catch" ADD CONSTRAINT "reconstructed_catch_taxon_id_4017bbd5_fk_taxon_taxon_key" FOREIGN KEY ("taxon_id") REFERENCES "public"."taxon" ("taxon_key") ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED ;

