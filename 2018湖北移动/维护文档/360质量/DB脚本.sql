/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.31-log : Database - bass_clone
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `dacp_catalog_action` */

DROP TABLE IF EXISTS `dacp_catalog_action`;

CREATE TABLE `dacp_catalog_action` (
  `action_id` varchar(32) NOT NULL,
  `action_name` varchar(32) NOT NULL,
  `action_seq` int(11) DEFAULT NULL,
  `action_type` varchar(32) NOT NULL,
  `action_url` varchar(512) DEFAULT NULL,
  `icon_class` varchar(36) DEFAULT NULL,
  `meta_class` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_catalog_authority` */

DROP TABLE IF EXISTS `dacp_catalog_authority`;

CREATE TABLE `dacp_catalog_authority` (
  `auth_id` varchar(32) NOT NULL,
  `action_id` varchar(32) DEFAULT NULL,
  `team_codes` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_catalog_condi` */

DROP TABLE IF EXISTS `dacp_catalog_condi`;

CREATE TABLE `dacp_catalog_condi` (
  `condi_id` varchar(24) NOT NULL,
  `check_condi` varchar(32) DEFAULT NULL,
  `condi_field` varchar(32) DEFAULT NULL,
  `condi_f` varchar(64) DEFAULT NULL,
  `condi_k` varchar(24) DEFAULT NULL,
  `condi_seq` int(11) DEFAULT NULL,
  `condi_url` varchar(256) DEFAULT NULL,
  `condi_v` varchar(24) DEFAULT NULL,
  `condi_name` varchar(32) DEFAULT NULL,
  `defalt_value` varchar(24) DEFAULT NULL,
  `meta_class` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`condi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_catalog_config` */

DROP TABLE IF EXISTS `dacp_catalog_config`;

CREATE TABLE `dacp_catalog_config` (
  `meta_Class` varchar(32) NOT NULL,
  `meta_detail_url` varchar(64) NOT NULL,
  `meta_name` varchar(64) NOT NULL,
  `meta_seq` varchar(32) NOT NULL,
  `meta_service_url` varchar(64) NOT NULL,
  `team_codes` varchar(32) NOT NULL,
  PRIMARY KEY (`meta_Class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_catalog_metaarch` */

DROP TABLE IF EXISTS `dacp_catalog_metaarch`;

CREATE TABLE `dacp_catalog_metaarch` (
  `tab_id` varchar(32) NOT NULL,
  `arch_Name` varchar(128) NOT NULL,
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_broker` */

DROP TABLE IF EXISTS `dacp_dataflow_broker`;

CREATE TABLE `dacp_dataflow_broker` (
  `broker_id` varchar(20) NOT NULL,
  `broker_ip` varchar(50) DEFAULT NULL,
  `stat_date` datetime DEFAULT NULL,
  `is_alive` varchar(2) DEFAULT NULL,
  `broker_host` varchar(32) DEFAULT NULL,
  `log_path` varchar(256) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `workgroups` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`broker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_job` */

DROP TABLE IF EXISTS `dacp_dataflow_job`;

CREATE TABLE `dacp_dataflow_job` (
  `job_id` varchar(32) NOT NULL,
  `job_code` varchar(16) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `job_label` varchar(64) DEFAULT NULL,
  `job_descr` varchar(128) DEFAULT NULL,
  `subject_id` varchar(32) DEFAULT NULL,
  `pkg_code` varchar(16) DEFAULT NULL,
  `job_type` varchar(16) DEFAULT NULL,
  `job_script` varchar(128) DEFAULT NULL,
  `job_param` varchar(1024) DEFAULT NULL,
  `workgroup` varchar(16) DEFAULT NULL,
  `cron_exp` varchar(32) DEFAULT NULL,
  `batch_type` varchar(8) DEFAULT NULL,
  `batch_step` int(11) DEFAULT NULL,
  `batch_no` varchar(16) DEFAULT NULL,
  `batch_offset` int(11) DEFAULT NULL,
  `job_priority` int(11) DEFAULT NULL,
  `run_constraint` varchar(1) DEFAULT NULL,
  `redo_num` int(11) DEFAULT NULL,
  `lastdt_offset` int(11) DEFAULT NULL,
  `max_elapsed` int(11) DEFAULT NULL,
  `team_id` varchar(32) DEFAULT NULL,
  `create_user` varchar(16) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `lastupd` datetime DEFAULT NULL,
  `job_ext_cfg` varchar(1024) DEFAULT NULL,
  `eff_dt` varchar(16) DEFAULT NULL,
  `exp_dt` varchar(16) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_job_depend` */

DROP TABLE IF EXISTS `dacp_dataflow_job_depend`;

CREATE TABLE `dacp_dataflow_job_depend` (
  `depend_id` varchar(32) NOT NULL,
  `job_code` varchar(16) DEFAULT NULL,
  `depend_code` varchar(16) DEFAULT NULL,
  `depend_type` varchar(8) DEFAULT NULL,
  `batch_cal_exp` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`depend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_job_ext_log` */

DROP TABLE IF EXISTS `dacp_dataflow_job_ext_log`;

CREATE TABLE `dacp_dataflow_job_ext_log` (
  `id` bigint(20) NOT NULL,
  `ext_trig_id` varchar(32) DEFAULT NULL,
  `ext_job_code` varchar(16) DEFAULT NULL,
  `batch_no` varchar(16) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `lastupd` datetime DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_job_ext_trigger` */

DROP TABLE IF EXISTS `dacp_dataflow_job_ext_trigger`;

CREATE TABLE `dacp_dataflow_job_ext_trigger` (
  `ext_trig_id` varchar(32) NOT NULL,
  `ext_job_code` varchar(16) DEFAULT NULL,
  `batch_no` varchar(16) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `lastupd` datetime DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ext_trig_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_job_external` */

DROP TABLE IF EXISTS `dacp_dataflow_job_external`;

CREATE TABLE `dacp_dataflow_job_external` (
  `ext_job_id` varchar(32) NOT NULL,
  `ext_job_code` varchar(64) DEFAULT NULL,
  `ext_job_label` varchar(64) DEFAULT NULL,
  `external_type` varchar(8) DEFAULT NULL,
  `external_content` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ext_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_job_flow_log` */

DROP TABLE IF EXISTS `dacp_dataflow_job_flow_log`;

CREATE TABLE `dacp_dataflow_job_flow_log` (
  `flow_id` varchar(16) NOT NULL,
  `job_seq` varchar(8) DEFAULT NULL,
  `pre_seq` varchar(8) DEFAULT NULL,
  `aft_seq` varchar(32) DEFAULT NULL,
  `job_code` varchar(64) DEFAULT NULL,
  `batch_no` varchar(32) DEFAULT NULL,
  `job_state` varchar(8) DEFAULT NULL,
  `tip` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`flow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_job_log` */

DROP TABLE IF EXISTS `dacp_dataflow_job_log`;

CREATE TABLE `dacp_dataflow_job_log` (
  `id` bigint(20) NOT NULL,
  `job_trig_id` varchar(64) DEFAULT NULL,
  `job_code` varchar(16) DEFAULT NULL,
  `batch_no` varchar(32) DEFAULT NULL,
  `is_turnover` varchar(1) DEFAULT NULL,
  `broker_id` varchar(16) DEFAULT NULL,
  `broker_ip` varchar(16) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `message` varchar(128) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_job_package` */

DROP TABLE IF EXISTS `dacp_dataflow_job_package`;

CREATE TABLE `dacp_dataflow_job_package` (
  `pkg_code` varchar(16) NOT NULL,
  `pkg_label` varchar(64) DEFAULT NULL,
  `pkg_descr` varchar(128) DEFAULT NULL,
  `transact_ctrl` varchar(4) DEFAULT NULL,
  `job_codes` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`pkg_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_job_plugin` */

DROP TABLE IF EXISTS `dacp_dataflow_job_plugin`;

CREATE TABLE `dacp_dataflow_job_plugin` (
  `job_plugin_id` varchar(32) NOT NULL,
  `job_code` varchar(16) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL,
  `plugin_code` varchar(8) DEFAULT NULL,
  `plugin_cfg` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`job_plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_job_trigger` */

DROP TABLE IF EXISTS `dacp_dataflow_job_trigger`;

CREATE TABLE `dacp_dataflow_job_trigger` (
  `job_trig_id` varchar(64) NOT NULL,
  `job_code` varchar(16) DEFAULT NULL,
  `job_label` varchar(255) DEFAULT NULL,
  `batch_no` varchar(32) DEFAULT NULL,
  `batch_type` varchar(16) DEFAULT NULL,
  `is_turnover` varchar(1) DEFAULT NULL,
  `broker_id` varchar(16) DEFAULT NULL,
  `broker_ip` varchar(16) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `start_dt` datetime DEFAULT NULL,
  `complete_dt` datetime DEFAULT NULL,
  `lastupd` datetime DEFAULT NULL,
  `message` varchar(128) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  `is_new` varchar(32) DEFAULT NULL,
  `team_id` varchar(32) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_trig_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_plugin_define` */

DROP TABLE IF EXISTS `dacp_dataflow_plugin_define`;

CREATE TABLE `dacp_dataflow_plugin_define` (
  `plugin_id` varchar(32) NOT NULL,
  `plugin_inst` varchar(16) DEFAULT NULL,
  `plugin_label` varchar(16) DEFAULT NULL,
  `plugin_cfg` longtext,
  PRIMARY KEY (`plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataflow_plugin_template` */

DROP TABLE IF EXISTS `dacp_dataflow_plugin_template`;

CREATE TABLE `dacp_dataflow_plugin_template` (
  `temp_id` varchar(16) NOT NULL,
  `temp_label` varchar(64) DEFAULT NULL,
  `plugin_cfg` longtext,
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataps_data_query_comment` */

DROP TABLE IF EXISTS `dacp_dataps_data_query_comment`;

CREATE TABLE `dacp_dataps_data_query_comment` (
  `comment_id` varchar(32) NOT NULL,
  `team_name` varchar(16) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `ds_name` varchar(16) DEFAULT NULL,
  `run_sql` varchar(4000) DEFAULT NULL,
  `sql_comment` varchar(200) DEFAULT NULL,
  `save_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataps_data_query_log` */

DROP TABLE IF EXISTS `dacp_dataps_data_query_log`;

CREATE TABLE `dacp_dataps_data_query_log` (
  `log_id` varchar(32) NOT NULL,
  `team_name` varchar(16) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `ds_name` varchar(16) DEFAULT NULL,
  `run_sql` varchar(4000) DEFAULT NULL,
  `ip_address` varchar(32) DEFAULT NULL,
  `result_type` varchar(16) DEFAULT NULL,
  `run_time` varchar(32) DEFAULT NULL,
  `run_env` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataps_proc_exec_log` */

DROP TABLE IF EXISTS `dacp_dataps_proc_exec_log`;

CREATE TABLE `dacp_dataps_proc_exec_log` (
  `id` varchar(16) NOT NULL,
  `proc_name` varchar(32) DEFAULT NULL,
  `proc_exec_time` varchar(20) DEFAULT NULL,
  `log_content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataps_proc_global_val` */

DROP TABLE IF EXISTS `dacp_dataps_proc_global_val`;

CREATE TABLE `dacp_dataps_proc_global_val` (
  `id` varchar(16) NOT NULL,
  `var_name` varchar(32) DEFAULT NULL,
  `var_label` varchar(64) DEFAULT NULL,
  `var_type` varchar(10) DEFAULT NULL,
  `sql_def` longtext,
  `dll_def` varchar(250) DEFAULT NULL,
  `shell_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataps_proc_log` */

DROP TABLE IF EXISTS `dacp_dataps_proc_log`;

CREATE TABLE `dacp_dataps_proc_log` (
  `id` varchar(16) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `due_time` int(11) DEFAULT NULL,
  `effect_rows` int(11) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `wrate` int(11) DEFAULT NULL,
  `dq_runstate` varchar(32) DEFAULT NULL,
  `dq_intime` varchar(32) DEFAULT NULL,
  `dq_remark` varchar(64) DEFAULT NULL,
  `dq_state` varchar(16) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `proc_id` varchar(32) DEFAULT NULL,
  `dbms_id` varchar(32) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `alarm_level` varchar(32) DEFAULT NULL,
  `user` varchar(32) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `cycle_id` varchar(16) DEFAULT NULL,
  `proc_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataps_proc_step_define` */

DROP TABLE IF EXISTS `dacp_dataps_proc_step_define`;

CREATE TABLE `dacp_dataps_proc_step_define` (
  `step_inst` varchar(32) NOT NULL,
  `step_inst_label` varchar(64) DEFAULT NULL,
  `group_type` varchar(16) DEFAULT NULL,
  `step_cfg` longtext,
  `step_seq` int(11) DEFAULT NULL,
  `step_icon` varchar(32) DEFAULT NULL,
  `step_state` varchar(8) DEFAULT NULL,
  `step_style` varchar(8) DEFAULT NULL,
  `remark` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`step_inst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataps_proc_step_log` */

DROP TABLE IF EXISTS `dacp_dataps_proc_step_log`;

CREATE TABLE `dacp_dataps_proc_step_log` (
  `id` varchar(16) NOT NULL,
  `proc_name` varchar(32) DEFAULT NULL,
  `step_seq` varchar(32) DEFAULT NULL,
  `step_name` varchar(64) DEFAULT NULL,
  `cycle_id` varchar(20) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `step_result` varchar(1024) DEFAULT NULL,
  `rownum_val` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sqlcode` varchar(10) DEFAULT NULL,
  `parentseq` varchar(32) DEFAULT NULL,
  `step_type` int(11) DEFAULT NULL,
  `sql_text` longtext,
  `areacode` varchar(10) DEFAULT NULL,
  `redotimes` int(11) DEFAULT NULL,
  `run_param` varchar(1024) DEFAULT NULL,
  `busikey1` varchar(64) DEFAULT NULL,
  `busikey2` varchar(64) DEFAULT NULL,
  `busikey3` varchar(64) DEFAULT NULL,
  `step_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataps_proc_step_permit` */

DROP TABLE IF EXISTS `dacp_dataps_proc_step_permit`;

CREATE TABLE `dacp_dataps_proc_step_permit` (
  `id` varchar(32) NOT NULL,
  `step_inst` varchar(32) DEFAULT NULL,
  `step_inst_label` varchar(64) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proc_step_permit_index0` (`step_inst`),
  KEY `proc_step_permit_index1` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataps_proc_tmpl` */

DROP TABLE IF EXISTS `dacp_dataps_proc_tmpl`;

CREATE TABLE `dacp_dataps_proc_tmpl` (
  `tmpl_id` varchar(32) NOT NULL,
  `tmpl_name` varchar(32) DEFAULT NULL,
  `tmpl_label` varchar(64) DEFAULT NULL,
  `tmpl_desc` varchar(1024) DEFAULT NULL,
  `xml` longtext,
  `state` varchar(8) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`tmpl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataps_proc_tmpl_permit` */

DROP TABLE IF EXISTS `dacp_dataps_proc_tmpl_permit`;

CREATE TABLE `dacp_dataps_proc_tmpl_permit` (
  `id` varchar(32) NOT NULL,
  `tmpl_name` varchar(32) DEFAULT NULL,
  `tmpl_label` varchar(64) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dataps_proc_tmpl_step` */

DROP TABLE IF EXISTS `dacp_dataps_proc_tmpl_step`;

CREATE TABLE `dacp_dataps_proc_tmpl_step` (
  `step_id` varchar(32) NOT NULL,
  `tmpl_name` varchar(32) NOT NULL,
  `step_seq` int(11) NOT NULL,
  `tmpl_id` varchar(64) DEFAULT NULL,
  `aftid` varchar(16) DEFAULT NULL,
  `f_step` varchar(16) DEFAULT NULL,
  `n_step` varchar(16) DEFAULT NULL,
  `parent_id` varchar(16) DEFAULT NULL,
  `preid` varchar(16) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `s_step` varchar(16) DEFAULT NULL,
  `sql_text` longtext,
  `step_code` varchar(32) DEFAULT NULL,
  `step_name` varchar(32) DEFAULT NULL,
  `required_props` varchar(1024) DEFAULT NULL,
  `version` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`step_id`),
  UNIQUE KEY `UKkmywgif9hx9jn12m4ppl4e0y8` (`tmpl_name`,`step_seq`),
  KEY `proc_tmpl_step_index0` (`tmpl_name`),
  KEY `proc_tmpl_step_index1` (`tmpl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_coll_cfg` */

DROP TABLE IF EXISTS `dacp_dge_coll_cfg`;

CREATE TABLE `dacp_dge_coll_cfg` (
  `id` varchar(32) NOT NULL,
  `clt_scope` varchar(512) DEFAULT NULL,
  `clt_type` varchar(32) DEFAULT NULL,
  `ds_name` varchar(32) DEFAULT NULL,
  `ds_type` varchar(32) DEFAULT NULL,
  `clt_param` varchar(4048) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_coll_ds_space_info` */

DROP TABLE IF EXISTS `dacp_dge_coll_ds_space_info`;

CREATE TABLE `dacp_dge_coll_ds_space_info` (
  `ds_name` varchar(64) NOT NULL,
  `total_size` varchar(64) DEFAULT NULL,
  `used_size` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ds_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_coll_ds_statis` */

DROP TABLE IF EXISTS `dacp_dge_coll_ds_statis`;

CREATE TABLE `dacp_dge_coll_ds_statis` (
  `id` varchar(32) NOT NULL,
  `op_time` varchar(8) NOT NULL,
  `ds_name` varchar(32) NOT NULL,
  `capacity` varchar(32) DEFAULT NULL,
  `used_capacity` varchar(32) DEFAULT NULL,
  `free_capacity` varchar(32) DEFAULT NULL,
  `tab_cnt` int(11) DEFAULT NULL,
  `field_cnt` int(11) DEFAULT NULL,
  `tab_rows_cnt` varchar(32) DEFAULT NULL,
  `is_latest` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_coll_file_sql` */

DROP TABLE IF EXISTS `dacp_dge_coll_file_sql`;

CREATE TABLE `dacp_dge_coll_file_sql` (
  `ext_id` varchar(32) NOT NULL,
  `coll_date` varchar(36) DEFAULT NULL,
  `db_type` varchar(36) DEFAULT NULL,
  `proc_name` varchar(256) DEFAULT NULL,
  `sql_text` text,
  `parser_date` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_coll_log` */

DROP TABLE IF EXISTS `dacp_dge_coll_log`;

CREATE TABLE `dacp_dge_coll_log` (
  `id` varchar(32) NOT NULL,
  `clt_id` varchar(32) NOT NULL,
  `clt_start_time` varchar(24) DEFAULT NULL,
  `clt_end_time` varchar(24) DEFAULT NULL,
  `clt_status` varchar(8) DEFAULT NULL,
  `clt_message` varchar(512) DEFAULT NULL,
  `clt_lst` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_coll_sql_text` */

DROP TABLE IF EXISTS `dacp_dge_coll_sql_text`;

CREATE TABLE `dacp_dge_coll_sql_text` (
  `id` varchar(64) NOT NULL,
  `job_name` varchar(64) DEFAULT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `sql_text` text,
  `status` varchar(12) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `plat_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_coll_tab` */

DROP TABLE IF EXISTS `dacp_dge_coll_tab`;

CREATE TABLE `dacp_dge_coll_tab` (
  `tab_id` varchar(32) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `model_tab_name` varchar(64) NOT NULL,
  `tab_datatime` varchar(64) DEFAULT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_schema` varchar(64) DEFAULT NULL,
  `tab_rows` varchar(32) DEFAULT NULL,
  `tab_capacity` varchar(32) DEFAULT NULL,
  `field_num` int(11) DEFAULT NULL,
  `create_time` varchar(256) DEFAULT NULL,
  `update_time` varchar(256) DEFAULT NULL,
  `ds_name` varchar(16) NOT NULL,
  `clt_log_id` varchar(16) NOT NULL,
  `state` varchar(16) NOT NULL,
  `tab_location` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_coll_tab_delta` */

DROP TABLE IF EXISTS `dacp_dge_coll_tab_delta`;

CREATE TABLE `dacp_dge_coll_tab_delta` (
  `tab_id` varchar(32) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `model_tab_name` varchar(64) NOT NULL,
  `tab_datatime` varchar(64) NOT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_schema` varchar(64) DEFAULT NULL,
  `tab_rows` int(11) DEFAULT NULL,
  `tab_capacity` int(11) DEFAULT NULL,
  `field_num` int(11) DEFAULT NULL,
  `create_time` varchar(256) DEFAULT NULL,
  `update_time` varchar(256) DEFAULT NULL,
  `ds_name` varchar(16) NOT NULL,
  `clt_log_id` varchar(16) NOT NULL,
  `state` varchar(16) NOT NULL,
  `tab_location` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_coll_tab_field` */

DROP TABLE IF EXISTS `dacp_dge_coll_tab_field`;

CREATE TABLE `dacp_dge_coll_tab_field` (
  `field_id` varchar(32) NOT NULL,
  `tab_id` varchar(64) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `ds_name` varchar(64) NOT NULL,
  `field_name` varchar(64) NOT NULL,
  `field_label` varchar(512) DEFAULT NULL,
  `data_type` varchar(30) NOT NULL,
  `length` int(11) DEFAULT NULL,
  `isnullable` varchar(3) DEFAULT NULL,
  `field_posi` int(11) DEFAULT NULL,
  `def_value` varchar(1024) DEFAULT NULL,
  `primary_key` varchar(3) DEFAULT NULL,
  `partition_key` varchar(3) DEFAULT NULL,
  `distributed_key` varchar(3) DEFAULT NULL,
  `clt_log_id` varchar(16) NOT NULL,
  `precision_val` varchar(12) DEFAULT NULL,
  `scale` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_coll_tab_part` */

DROP TABLE IF EXISTS `dacp_dge_coll_tab_part`;

CREATE TABLE `dacp_dge_coll_tab_part` (
  `partition_id` varchar(32) NOT NULL,
  `clt_log_id` varchar(32) DEFAULT NULL,
  `ds_name` varchar(32) DEFAULT NULL,
  `tab_partition` varchar(512) DEFAULT NULL,
  `tab_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`partition_id`),
  KEY `dacpdgecolltabpart_index1` (`tab_id`,`ds_name`,`clt_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_coll_tab_statis` */

DROP TABLE IF EXISTS `dacp_dge_coll_tab_statis`;

CREATE TABLE `dacp_dge_coll_tab_statis` (
  `id` varchar(78) NOT NULL,
  `op_time` varchar(24) NOT NULL,
  `tab_id` varchar(32) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `tab_schema` varchar(64) DEFAULT NULL,
  `ds_name` varchar(32) NOT NULL,
  `tab_rows` varchar(32) DEFAULT NULL,
  `field_num` int(11) DEFAULT NULL,
  `capacity` varchar(32) DEFAULT NULL,
  `is_latest` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_data_storage_result` */

DROP TABLE IF EXISTS `dacp_dge_data_storage_result`;

CREATE TABLE `dacp_dge_data_storage_result` (
  `collect_tab_id` varchar(32) NOT NULL,
  `part_name` varchar(255) NOT NULL,
  `collect_tab_name` varchar(64) NOT NULL,
  `model_tab_name` varchar(64) NOT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_schema` varchar(64) DEFAULT NULL,
  `tab_rows` int(11) DEFAULT NULL,
  `tab_capacity` int(11) DEFAULT NULL,
  `field_num` int(11) DEFAULT NULL,
  `data_time` varchar(32) NOT NULL,
  `expire_date` varchar(255) DEFAULT NULL,
  `expire_days` int(11) DEFAULT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  `operate_user` varchar(255) DEFAULT NULL,
  `create_time` varchar(64) DEFAULT NULL,
  `update_time` varchar(64) DEFAULT NULL,
  `ds_id` varchar(16) DEFAULT NULL,
  `state` varchar(16) NOT NULL,
  `optime` varchar(16) DEFAULT NULL,
  `ds_type` varchar(16) DEFAULT NULL,
  `ds_name` varchar(32) NOT NULL,
  `strategy_type` int(11) DEFAULT NULL,
  `strategy_time` varchar(255) DEFAULT NULL,
  `trans_location` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`collect_tab_id`,`part_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_data_storage_rule` */

DROP TABLE IF EXISTS `dacp_dge_data_storage_rule`;

CREATE TABLE `dacp_dge_data_storage_rule` (
  `strategy_time` int(11) NOT NULL,
  `tab_id` varchar(32) NOT NULL,
  `strategy_type` varchar(16) NOT NULL,
  `extra_duration` int(11) DEFAULT NULL,
  `extra_time` varchar(16) DEFAULT NULL,
  `trans_location` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`strategy_time`,`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_data_storage_rule_alter` */

DROP TABLE IF EXISTS `dacp_dge_data_storage_rule_alter`;

CREATE TABLE `dacp_dge_data_storage_rule_alter` (
  `strategy_time` int(11) NOT NULL,
  `tab_id` varchar(32) NOT NULL,
  `strategy_type` varchar(16) NOT NULL,
  `extra_duration` int(11) DEFAULT NULL,
  `extra_time` varchar(16) DEFAULT NULL,
  `trans_location` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`strategy_time`,`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_data_storage_rule_his` */

DROP TABLE IF EXISTS `dacp_dge_data_storage_rule_his`;

CREATE TABLE `dacp_dge_data_storage_rule_his` (
  `his_tab_id` varchar(32) NOT NULL,
  `strategy_time` int(11) NOT NULL,
  `tab_id` varchar(32) NOT NULL,
  `strategy_type` varchar(16) NOT NULL,
  `extra_duration` int(11) DEFAULT NULL,
  `extra_time` varchar(16) DEFAULT NULL,
  `trans_location` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`his_tab_id`,`strategy_time`,`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_col_info` */

DROP TABLE IF EXISTS `dacp_dge_dc_col_info`;

CREATE TABLE `dacp_dge_dc_col_info` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `col_cn_name` varchar(256) DEFAULT NULL,
  `col_code` varchar(50) DEFAULT NULL,
  `col_len` int(11) DEFAULT NULL,
  `col_name` varchar(96) DEFAULT NULL,
  `col_state` varchar(2) DEFAULT NULL,
  `col_store` varchar(11) DEFAULT NULL,
  `creater` varchar(98) DEFAULT NULL,
  `DATATYPE` varchar(96) DEFAULT NULL,
  `eff_date` datetime DEFAULT NULL,
  `is_null` varchar(2) DEFAULT NULL,
  `mtab_code` varchar(128) DEFAULT NULL,
  `remark` varchar(800) DEFAULT NULL,
  `scan_time` datetime DEFAULT NULL,
  `tab_name` varchar(360) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_dus_config` */

DROP TABLE IF EXISTS `dacp_dge_dc_dus_config`;

CREATE TABLE `dacp_dge_dc_dus_config` (
  `ext_id` varchar(32) NOT NULL,
  `sql_expr` varchar(512) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_dus_fieldsumvisit` */

DROP TABLE IF EXISTS `dacp_dge_dc_dus_fieldsumvisit`;

CREATE TABLE `dacp_dge_dc_dus_fieldsumvisit` (
  `ext_id` varchar(32) NOT NULL,
  `db_name` varchar(50) DEFAULT NULL,
  `exam_date` varchar(8) DEFAULT NULL,
  `field_name` varchar(96) DEFAULT NULL,
  `tab_name` varchar(96) DEFAULT NULL,
  `visit_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_dus_tabfieldvisit` */

DROP TABLE IF EXISTS `dacp_dge_dc_dus_tabfieldvisit`;

CREATE TABLE `dacp_dge_dc_dus_tabfieldvisit` (
  `ext_id` varchar(32) NOT NULL,
  `db_name` varchar(50) DEFAULT NULL,
  `exam_date` varchar(8) DEFAULT NULL,
  `field_name` varchar(256) DEFAULT NULL,
  `tab_name` varchar(96) DEFAULT NULL,
  `visit_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_dus_visitdetail` */

DROP TABLE IF EXISTS `dacp_dge_dc_dus_visitdetail`;

CREATE TABLE `dacp_dge_dc_dus_visitdetail` (
  `ext_id` varchar(32) NOT NULL,
  `db_name` varchar(50) DEFAULT NULL,
  `entity_name` varchar(64) DEFAULT NULL,
  `exam_date` varchar(8) DEFAULT NULL,
  `sql_Text` text,
  `tab_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_error_log` */

DROP TABLE IF EXISTS `dacp_dge_dc_error_log`;

CREATE TABLE `dacp_dge_dc_error_log` (
  `id` varchar(32) NOT NULL,
  `error_desc` varchar(512) DEFAULT NULL,
  `exam_date` datetime DEFAULT NULL,
  `exam_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_floor_sqlinfo` */

DROP TABLE IF EXISTS `dacp_dge_dc_floor_sqlinfo`;

CREATE TABLE `dacp_dge_dc_floor_sqlinfo` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `DB_CODE` varchar(20) DEFAULT NULL,
  `EXAM_DATE` varchar(12) DEFAULT NULL,
  `RUN_DURA` varchar(20) DEFAULT NULL,
  `RUN_NUM` varchar(20) DEFAULT NULL,
  `RUN_TIME` varchar(50) DEFAULT NULL,
  `RUN_USER` varchar(200) DEFAULT NULL,
  `SQL_TEXT` text,
  `UPD_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_floor_tabvisit` */

DROP TABLE IF EXISTS `dacp_dge_dc_floor_tabvisit`;

CREATE TABLE `dacp_dge_dc_floor_tabvisit` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `DB_NAME` varchar(50) DEFAULT NULL,
  `SCAN_NO` varchar(8) DEFAULT NULL,
  `TAB_NAME` varchar(96) DEFAULT NULL,
  `UPD_DATE` datetime DEFAULT NULL,
  `VISIT_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_indicator` */

DROP TABLE IF EXISTS `dacp_dge_dc_indicator`;

CREATE TABLE `dacp_dge_dc_indicator` (
  `exam_date` varchar(32) NOT NULL,
  `exam_item_id` varchar(32) NOT NULL,
  `team_code` varchar(12) NOT NULL,
  `exam_item_name` varchar(128) NOT NULL,
  `exam_item_value` varchar(32) NOT NULL,
  `exam_type` varchar(8) DEFAULT NULL,
  `scan_time` datetime DEFAULT NULL,
  PRIMARY KEY (`exam_date`,`exam_item_id`,`team_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_item` */

DROP TABLE IF EXISTS `dacp_dge_dc_item`;

CREATE TABLE `dacp_dge_dc_item` (
  `exam_item_id` varchar(32) NOT NULL,
  `exam_item_desc` varchar(2000) DEFAULT NULL,
  `exam_item_name` varchar(128) NOT NULL,
  `exam_item_order` int(11) DEFAULT NULL,
  `exam_item_state` varchar(6) DEFAULT NULL,
  `exam_item_unit` varchar(6) DEFAULT NULL,
  `exam_type` varchar(8) DEFAULT NULL,
  `exam_type_name` varchar(128) DEFAULT NULL,
  `rpt_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`exam_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_item_eval` */

DROP TABLE IF EXISTS `dacp_dge_dc_item_eval`;

CREATE TABLE `dacp_dge_dc_item_eval` (
  `eval_seq` int(11) NOT NULL,
  `exam_item_id` varchar(32) NOT NULL,
  `cfg_color` varchar(12) DEFAULT NULL,
  `eval_content` varchar(512) DEFAULT NULL,
  `eval_desc` varchar(256) DEFAULT NULL,
  `exam_item_suggest` varchar(512) DEFAULT NULL,
  `h_limit` int(11) DEFAULT NULL,
  `l_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`eval_seq`,`exam_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_item_rela` */

DROP TABLE IF EXISTS `dacp_dge_dc_item_rela`;

CREATE TABLE `dacp_dge_dc_item_rela` (
  `exam_item_id` varchar(32) NOT NULL,
  `p_exam_item_id` varchar(32) NOT NULL,
  `state` varchar(12) NOT NULL,
  PRIMARY KEY (`exam_item_id`,`p_exam_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_modtab_strain_map` */

DROP TABLE IF EXISTS `dacp_dge_dc_modtab_strain_map`;

CREATE TABLE `dacp_dge_dc_modtab_strain_map` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `src_db` varchar(120) DEFAULT NULL,
  `src_mtab_code` varchar(120) DEFAULT NULL,
  `src_mtab_name` varchar(120) DEFAULT NULL,
  `strain_code` varchar(120) DEFAULT NULL,
  `tag_db` varchar(120) DEFAULT NULL,
  `tag_mtab_code` varchar(120) DEFAULT NULL,
  `tag_mtab_name` varchar(120) DEFAULT NULL,
  `transname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_mtab_info` */

DROP TABLE IF EXISTS `dacp_dge_dc_mtab_info`;

CREATE TABLE `dacp_dge_dc_mtab_info` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `allow_redun` varchar(2) DEFAULT NULL,
  `COLL_FREQ` varchar(2) DEFAULT NULL,
  `creater` varchar(96) DEFAULT NULL,
  `data_cycle_def` varchar(32) DEFAULT NULL,
  `data_cycle_type` varchar(32) DEFAULT NULL,
  `DATA_CYCLE_UNIT` varchar(96) DEFAULT NULL,
  `db_name` varchar(50) DEFAULT NULL,
  `eff_date` datetime DEFAULT NULL,
  `LEVEL_VAL` varchar(96) DEFAULT NULL,
  `mtab_cn_name` varchar(360) DEFAULT NULL,
  `mtab_code` varchar(128) DEFAULT NULL,
  `mtab_name` varchar(360) DEFAULT NULL,
  `mtab_state` varchar(32) DEFAULT NULL,
  `OPEN_STATE` varchar(32) DEFAULT NULL,
  `remark` varchar(800) DEFAULT NULL,
  `scan_time` datetime DEFAULT NULL,
  `source_system` varchar(64) DEFAULT NULL,
  `std_wlist_flag` varchar(32) DEFAULT NULL,
  `team_code` varchar(64) DEFAULT NULL,
  `topic_name` varchar(96) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_rpt` */

DROP TABLE IF EXISTS `dacp_dge_dc_rpt`;

CREATE TABLE `dacp_dge_dc_rpt` (
  `rpt_id` varchar(32) NOT NULL,
  `rpt_desc` varchar(512) NOT NULL,
  `rpt_html` varchar(4000) DEFAULT NULL,
  `rpt_name` varchar(128) NOT NULL,
  `rpt_seq` int(11) DEFAULT NULL,
  `rpt_template` varchar(512) DEFAULT NULL,
  `rpt_url` varchar(128) DEFAULT NULL,
  `score_proportion` float DEFAULT NULL,
  `state` varchar(12) NOT NULL,
  PRIMARY KEY (`rpt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_space_info` */

DROP TABLE IF EXISTS `dacp_dge_dc_space_info`;

CREATE TABLE `dacp_dge_dc_space_info` (
  `ds_id` varchar(32) NOT NULL,
  `exam_date` varchar(8) NOT NULL,
  `capacity` bigint(20) DEFAULT NULL,
  `used_capacity` bigint(20) DEFAULT NULL,
  `free_capacity` bigint(20) DEFAULT NULL,
  `tab_cnt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ds_id`,`exam_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_space_stat` */

DROP TABLE IF EXISTS `dacp_dge_dc_space_stat`;

CREATE TABLE `dacp_dge_dc_space_stat` (
  `ds_id` varchar(32) NOT NULL,
  `exam_date` varchar(8) NOT NULL,
  `capacity` bigint(20) DEFAULT NULL,
  `used_capacity` bigint(20) DEFAULT NULL,
  `free_capacity` bigint(20) DEFAULT NULL,
  `tab_cnt` bigint(20) DEFAULT NULL,
  `sp_dinc` bigint(20) DEFAULT NULL,
  `sp_minc` bigint(20) DEFAULT NULL,
  `tab_dinc` bigint(20) DEFAULT NULL,
  `tab_minc` bigint(20) DEFAULT NULL,
  `scan_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ds_id`,`exam_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_sql_info` */

DROP TABLE IF EXISTS `dacp_dge_dc_sql_info`;

CREATE TABLE `dacp_dge_dc_sql_info` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `db_name` varchar(36) DEFAULT NULL,
  `db_type` varchar(36) DEFAULT NULL,
  `EXAM_DATE` varchar(8) DEFAULT NULL,
  `scan_time` varchar(36) DEFAULT NULL,
  `SQL_TEXT` text,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_store_tab_info` */

DROP TABLE IF EXISTS `dacp_dge_dc_store_tab_info`;

CREATE TABLE `dacp_dge_dc_store_tab_info` (
  `tab_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `creater` varchar(98) DEFAULT NULL,
  `db_name` varchar(50) DEFAULT NULL,
  `db_sp_code` varchar(50) DEFAULT NULL,
  `db_sp_name` varchar(50) DEFAULT NULL,
  `dropdate` varchar(18) DEFAULT NULL,
  `eff_date` datetime DEFAULT NULL,
  `modtab_code` varchar(360) DEFAULT NULL,
  `scan_time` datetime DEFAULT NULL,
  `tab_capacity` int(11) DEFAULT NULL,
  `tab_cn_name` varchar(360) DEFAULT NULL,
  `tab_name` varchar(126) DEFAULT NULL,
  `tab_own` varchar(32) DEFAULT NULL,
  `tab_partition` varchar(64) DEFAULT NULL,
  `tab_state` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`tab_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_store_tab_log` */

DROP TABLE IF EXISTS `dacp_dge_dc_store_tab_log`;

CREATE TABLE `dacp_dge_dc_store_tab_log` (
  `COLL_TAB_SEQ` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `COLL_FREQ` varchar(32) DEFAULT NULL,
  `cycle_type` varchar(2) DEFAULT NULL,
  `data_cycle_actual` varchar(96) DEFAULT NULL,
  `data_cycle_def` varchar(32) DEFAULT NULL,
  `data_cycle_type` varchar(16) DEFAULT NULL,
  `data_cycle_unit` varchar(96) DEFAULT NULL,
  `db_name` varchar(32) DEFAULT NULL,
  `db_sp_code` varchar(120) DEFAULT NULL,
  `exam_date` varchar(8) NOT NULL,
  `level_val` varchar(96) DEFAULT NULL,
  `mtab_cn_name` varchar(360) DEFAULT NULL,
  `mtab_code` varchar(128) DEFAULT NULL,
  `mtab_name` varchar(360) DEFAULT NULL,
  `scan_time` datetime DEFAULT NULL,
  `tab_cn_name` varchar(128) DEFAULT NULL,
  `tab_code` int(11) DEFAULT NULL,
  `tab_name` varchar(128) DEFAULT NULL,
  `TAB_PARTITION` varchar(64) DEFAULT NULL,
  `team_code` varchar(64) DEFAULT NULL,
  `topic_name` varchar(96) DEFAULT NULL,
  PRIMARY KEY (`COLL_TAB_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_tab_info` */

DROP TABLE IF EXISTS `dacp_dge_dc_tab_info`;

CREATE TABLE `dacp_dge_dc_tab_info` (
  `tab_id` varchar(32) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `model_tab_name` varchar(64) DEFAULT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_rows` int(11) DEFAULT NULL,
  `tab_capacity` bigint(20) DEFAULT NULL,
  `field_num` int(11) DEFAULT NULL,
  `ds_id` varchar(16) NOT NULL,
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_tab_stat` */

DROP TABLE IF EXISTS `dacp_dge_dc_tab_stat`;

CREATE TABLE `dacp_dge_dc_tab_stat` (
  `ds_id` varchar(32) NOT NULL,
  `exam_date` varchar(8) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `entity_num` int(11) DEFAULT NULL,
  `cycle_type` varchar(32) DEFAULT NULL,
  `tab_rows` int(11) DEFAULT NULL,
  `tab_capacity` bigint(20) DEFAULT NULL,
  `field_num` int(11) DEFAULT NULL,
  `scan_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ds_id`,`exam_date`,`tab_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_task` */

DROP TABLE IF EXISTS `dacp_dge_dc_task`;

CREATE TABLE `dacp_dge_dc_task` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `creater` varchar(128) DEFAULT NULL,
  `own_system` varchar(12) DEFAULT NULL,
  `scan_time` datetime DEFAULT NULL,
  `task_code` varchar(128) NOT NULL,
  `task_name` varchar(128) DEFAULT NULL,
  `team_code` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_task_cres` */

DROP TABLE IF EXISTS `dacp_dge_dc_task_cres`;

CREATE TABLE `dacp_dge_dc_task_cres` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `duration` bigint(20) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `exam_date` varchar(8) NOT NULL,
  `max_dn_node` varchar(128) DEFAULT NULL,
  `max_dn_rate` float DEFAULT NULL,
  `max_up_node` varchar(128) DEFAULT NULL,
  `max_up_rate` float DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `task_code` varchar(128) NOT NULL,
  `task_name` varchar(256) DEFAULT NULL,
  `team_code` varchar(12) DEFAULT NULL,
  `wave_dc_rate` float DEFAULT NULL,
  `wave_duration` bigint(20) DEFAULT NULL,
  `wave_mc_rate` float DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_task_log` */

DROP TABLE IF EXISTS `dacp_dge_dc_task_log`;

CREATE TABLE `dacp_dge_dc_task_log` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `cycle_id` varchar(12) NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `own_system` varchar(32) DEFAULT NULL,
  `scan_time` varchar(32) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `task_code` varchar(128) DEFAULT NULL,
  `task_name` varchar(128) DEFAULT NULL,
  `team_code` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_task_step` */

DROP TABLE IF EXISTS `dacp_dge_dc_task_step`;

CREATE TABLE `dacp_dge_dc_task_step` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `own_system` varchar(12) DEFAULT NULL,
  `scan_time` datetime DEFAULT NULL,
  `task_code` varchar(128) NOT NULL,
  `task_name` varchar(256) DEFAULT NULL,
  `task_step_code` varchar(128) DEFAULT NULL,
  `task_step_name` varchar(256) DEFAULT NULL,
  `task_step_seq` int(11) DEFAULT NULL,
  `team_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_task_step_cres` */

DROP TABLE IF EXISTS `dacp_dge_dc_task_step_cres`;

CREATE TABLE `dacp_dge_dc_task_step_cres` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `duration` bigint(20) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `exam_date` varchar(8) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `task_code` varchar(128) NOT NULL,
  `task_name` varchar(256) DEFAULT NULL,
  `task_step_code` varchar(128) DEFAULT NULL,
  `task_step_name` varchar(256) DEFAULT NULL,
  `task_step_seq` int(11) NOT NULL,
  `team_code` varchar(12) DEFAULT NULL,
  `wave_dc_rate` float DEFAULT NULL,
  `wave_duration` bigint(20) DEFAULT NULL,
  `wave_mc_rate` float DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_task_step_log` */

DROP TABLE IF EXISTS `dacp_dge_dc_task_step_log`;

CREATE TABLE `dacp_dge_dc_task_step_log` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `cycle_id` varchar(12) NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `own_system` varchar(128) DEFAULT NULL,
  `scan_time` varchar(32) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `task_code` varchar(128) DEFAULT NULL,
  `task_name` varchar(256) DEFAULT NULL,
  `task_step_code` varchar(128) DEFAULT NULL,
  `task_step_name` varchar(256) DEFAULT NULL,
  `task_step_seq` int(11) DEFAULT NULL,
  `team_code` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_temp_table_list` */

DROP TABLE IF EXISTS `dacp_dge_dc_temp_table_list`;

CREATE TABLE `dacp_dge_dc_temp_table_list` (
  `ext_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `DB_NAME` varchar(50) DEFAULT NULL,
  `MTAB_CODE` varchar(512) DEFAULT NULL,
  `PRCNUM` bigint(20) DEFAULT NULL,
  `TB_LEVEL` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dc_use_tab_log` */

DROP TABLE IF EXISTS `dacp_dge_dc_use_tab_log`;

CREATE TABLE `dacp_dge_dc_use_tab_log` (
  `COLL_TAB_SEQ` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动生成',
  `DATA_CYCLE_TYPE` varchar(96) DEFAULT NULL,
  `DATA_STORE` bigint(20) DEFAULT NULL,
  `DB_NAME` varchar(50) DEFAULT NULL,
  `DIR_TIMES` decimal(8,0) DEFAULT NULL,
  `exam_date` varchar(8) NOT NULL,
  `IND_TIMES` decimal(8,0) DEFAULT NULL,
  `is_blood` varchar(12) DEFAULT NULL,
  `LEVEL_VAL` varchar(96) DEFAULT NULL,
  `MTAB_CN_NAME` varchar(360) DEFAULT NULL,
  `MTAB_CODE` varchar(256) DEFAULT NULL,
  `MTAB_NAME` varchar(360) DEFAULT NULL,
  `PRC_TIMES` decimal(8,0) DEFAULT NULL,
  `scan_time` datetime DEFAULT NULL,
  `TAB_HEAT` float DEFAULT NULL,
  `TEAM_CODE` varchar(64) DEFAULT NULL,
  `TOPIC_NAME` varchar(96) DEFAULT NULL,
  `usage_type` varchar(12) DEFAULT NULL,
  `USE_RATE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`COLL_TAB_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_alarm_level` */

DROP TABLE IF EXISTS `dacp_dge_dq_alarm_level`;

CREATE TABLE `dacp_dge_dq_alarm_level` (
  `lvl_code` varchar(8) NOT NULL,
  `lvl_label` varchar(32) DEFAULT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `time_unit` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`lvl_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_alarm_result` */

DROP TABLE IF EXISTS `dacp_dge_dq_alarm_result`;

CREATE TABLE `dacp_dge_dq_alarm_result` (
  `id` varchar(32) NOT NULL,
  `alarm_content` longtext,
  `alarm_level` varchar(16) NOT NULL,
  `alarm_state` varchar(8) NOT NULL,
  `alarm_time` varchar(64) DEFAULT NULL,
  `alarm_type` varchar(8) NOT NULL,
  `check_result_id` varchar(32) NOT NULL,
  `check_type` varchar(255) NOT NULL,
  `cycle_type` varchar(64) NOT NULL,
  `ds_label` varchar(256) DEFAULT NULL,
  `ds_name` varchar(128) DEFAULT NULL,
  `obj_id` varchar(128) NOT NULL,
  `obj_label` varchar(256) DEFAULT NULL,
  `obj_name` varchar(256) DEFAULT NULL,
  `obj_type` varchar(64) NOT NULL,
  `op_time` varchar(32) NOT NULL,
  `p_obj_id` varchar(128) DEFAULT NULL,
  `p_obj_label` varchar(256) DEFAULT NULL,
  `p_obj_name` varchar(256) DEFAULT NULL,
  `receiver` varchar(64) NOT NULL,
  `receiver_name` varchar(128) NOT NULL,
  `rule_code` varchar(32) DEFAULT NULL,
  `rule_id` varchar(32) NOT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `rule_type` varchar(128) NOT NULL,
  `team_label` varchar(512) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `gen_reason` longtext,
  `predict_val` varchar(1024) DEFAULT NULL,
  `comp_val` varchar(1024) DEFAULT NULL,
  `val_unit` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alarmresult_index0` (`op_time`,`check_type`,`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_check_result` */

DROP TABLE IF EXISTS `dacp_dge_dq_check_result`;

CREATE TABLE `dacp_dge_dq_check_result` (
  `id` varchar(32) NOT NULL,
  `check_descr` longtext,
  `check_result` varchar(64) DEFAULT NULL,
  `check_time` varchar(64) DEFAULT NULL,
  `check_type` varchar(255) NOT NULL,
  `cycle_type` varchar(64) DEFAULT NULL,
  `ds_label` varchar(256) DEFAULT NULL,
  `ds_name` varchar(128) DEFAULT NULL,
  `err_stic` varchar(64) DEFAULT NULL,
  `exe_ds_label` varchar(256) DEFAULT NULL,
  `exe_ds_name` varchar(128) DEFAULT NULL,
  `extend_info` longtext,
  `func_code` varchar(32) DEFAULT NULL,
  `func_name` varchar(32) DEFAULT NULL,
  `func_para` longtext,
  `member_name` varchar(64) DEFAULT NULL,
  `member_user_name` varchar(128) DEFAULT NULL,
  `obj_id` varchar(128) NOT NULL,
  `obj_label` varchar(256) DEFAULT NULL,
  `obj_name` varchar(256) DEFAULT NULL,
  `obj_type` varchar(64) NOT NULL,
  `op_time` varchar(32) NOT NULL,
  `real_val` varchar(1024) DEFAULT NULL,
  `result_sql` longtext,
  `rule_code` varchar(32) DEFAULT NULL,
  `rule_id` varchar(32) NOT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `rule_state` varchar(8) DEFAULT NULL,
  `rule_type` varchar(128) DEFAULT NULL,
  `run_time` varchar(32) DEFAULT NULL,
  `team_label` varchar(512) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `total_stic` varchar(64) DEFAULT NULL,
  `record_sql` longtext,
  `result_type` varchar(8) DEFAULT NULL,
  `comp_val` varchar(1024) DEFAULT NULL,
  `val_unit` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dqckresult_index0` (`op_time`,`obj_id`,`rule_code`),
  KEY `dqckresult_index1` (`op_time`,`obj_id`,`check_type`),
  KEY `dqckresult_index2` (`check_type`,`obj_type`,`op_time`),
  KEY `dqckresult_index3` (`check_type`,`obj_type`,`op_time`),
  KEY `dqckresult_index4` (`check_type`,`op_time`,`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_check_result_sum` */

DROP TABLE IF EXISTS `dacp_dge_dq_check_result_sum`;

CREATE TABLE `dacp_dge_dq_check_result_sum` (
  `check_type` varchar(255) NOT NULL,
  `obj_id` varchar(128) NOT NULL,
  `obj_type` varchar(64) NOT NULL,
  `op_time` varchar(32) NOT NULL,
  `all_rule_cnt` int(11) DEFAULT NULL,
  `check_result` varchar(64) DEFAULT NULL,
  `check_time` varchar(64) DEFAULT NULL,
  `cycle_type` varchar(64) DEFAULT NULL,
  `ds_label` varchar(256) DEFAULT NULL,
  `ds_name` varchar(128) DEFAULT NULL,
  `err_rule_cnt` int(11) DEFAULT NULL,
  `excep_rule_cnt` int(11) DEFAULT NULL,
  `member_name` varchar(64) DEFAULT NULL,
  `member_user_name` varchar(128) DEFAULT NULL,
  `obj_label` varchar(256) DEFAULT NULL,
  `obj_name` varchar(256) DEFAULT NULL,
  `ok_rule_cnt` int(11) DEFAULT NULL,
  `p_obj_id` varchar(128) DEFAULT NULL,
  `p_obj_label` varchar(256) DEFAULT NULL,
  `p_obj_name` varchar(256) DEFAULT NULL,
  `run_time` varchar(32) DEFAULT NULL,
  `team_label` varchar(512) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `use_rule_cnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`check_type`,`obj_id`,`obj_type`,`op_time`),
  KEY `dqckresultsum_index0` (`op_time`,`obj_id`),
  KEY `dqckresultsum_index1` (`op_time`),
  KEY `dqckresultsum_index2` (`obj_id`),
  KEY `dqckresultsum_index3` (`op_time`,`obj_id`),
  KEY `dqckresultsum_index4` (`obj_type`,`check_type`,`op_time`),
  KEY `dqckresultsum_index5` (`check_type`,`cycle_type`,`team_name`),
  KEY `dqckresultsum_index6` (`check_type`,`op_time`,`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_ckfun_list` */

DROP TABLE IF EXISTS `dacp_dge_dq_ckfun_list`;

CREATE TABLE `dacp_dge_dq_ckfun_list` (
  `func_code` varchar(128) NOT NULL,
  `base_func_code` varchar(128) DEFAULT NULL,
  `func_cfg` longtext,
  `func_descr` varchar(256) DEFAULT NULL,
  `func_name` varchar(256) DEFAULT NULL,
  `func_type` varchar(64) DEFAULT NULL,
  `obj_type` varchar(64) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL,
  `state_date` datetime NOT NULL,
  PRIMARY KEY (`func_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_err_data` */

DROP TABLE IF EXISTS `dacp_dge_dq_err_data`;

CREATE TABLE `dacp_dge_dq_err_data` (
  `id` varchar(32) NOT NULL,
  `err_data` varchar(512) DEFAULT NULL,
  `obj_id` varchar(128) DEFAULT NULL,
  `op_time` varchar(32) DEFAULT NULL,
  `rule_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dqerrdata_index0` (`op_time`,`obj_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_mp` */

DROP TABLE IF EXISTS `dacp_dge_dq_mp`;

CREATE TABLE `dacp_dge_dq_mp` (
  `problem_id` varchar(32) NOT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `end_time` varchar(64) DEFAULT NULL,
  `find_time` varchar(64) DEFAULT NULL,
  `problem_descr` text,
  `problem_level` varchar(32) DEFAULT NULL,
  `problem_title` varchar(160) DEFAULT NULL,
  `problem_type` varchar(32) DEFAULT NULL,
  `solution` varchar(225) DEFAULT NULL,
  `solution_time` varchar(64) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `update_time` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`problem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_mp_object` */

DROP TABLE IF EXISTS `dacp_dge_dq_mp_object`;

CREATE TABLE `dacp_dge_dq_mp_object` (
  `rela_id` varchar(32) NOT NULL,
  `object_id` varchar(32) NOT NULL,
  `problem_id` varchar(32) NOT NULL,
  PRIMARY KEY (`rela_id`),
  KEY `mpobject_index0` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_obj` */

DROP TABLE IF EXISTS `dacp_dge_dq_obj`;

CREATE TABLE `dacp_dge_dq_obj` (
  `obj_id` varchar(64) NOT NULL,
  `cycle_type` varchar(64) DEFAULT NULL,
  `ds_name` varchar(64) DEFAULT NULL,
  `obj_label` varchar(256) DEFAULT NULL,
  `lastupd_date` datetime NOT NULL,
  `lastupd_user` varchar(128) DEFAULT NULL,
  `member_name` varchar(64) DEFAULT NULL,
  `meta_id` varchar(128) DEFAULT NULL,
  `obj_name` varchar(256) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `obj_type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`obj_id`),
  KEY `dqobj_index0` (`obj_type`),
  KEY `dqobj_index1` (`obj_type`,`ds_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_obj_var` */

DROP TABLE IF EXISTS `dacp_dge_dq_obj_var`;

CREATE TABLE `dacp_dge_dq_obj_var` (
  `var_id` varchar(255) NOT NULL,
  `ds_name` varchar(255) DEFAULT NULL,
  `obj_id` varchar(255) DEFAULT NULL,
  `var_fields` longtext,
  `var_label` varchar(255) DEFAULT NULL,
  `var_name` varchar(255) DEFAULT NULL,
  `var_sql` longtext,
  `var_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`var_id`),
  KEY `dqobjvar_index0` (`obj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_prop` */

DROP TABLE IF EXISTS `dacp_dge_dq_prop`;

CREATE TABLE `dacp_dge_dq_prop` (
  `prop_name` varchar(384) DEFAULT NULL,
  `prop_value` varchar(1536) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_rela` */

DROP TABLE IF EXISTS `dacp_dge_dq_rela`;

CREATE TABLE `dacp_dge_dq_rela` (
  `id` varchar(32) NOT NULL,
  `code_a` varchar(128) DEFAULT NULL,
  `code_b` varchar(128) DEFAULT NULL,
  `descr` varchar(236) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `type_code` varchar(128) DEFAULT NULL,
  `type_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_repo` */

DROP TABLE IF EXISTS `dacp_dge_dq_repo`;

CREATE TABLE `dacp_dge_dq_repo` (
  `id` varchar(32) NOT NULL,
  `category_name` varchar(128) DEFAULT NULL,
  `content` longtext,
  `create_date` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_repo_category` */

DROP TABLE IF EXISTS `dacp_dge_dq_repo_category`;

CREATE TABLE `dacp_dge_dq_repo_category` (
  `id` varchar(32) NOT NULL,
  `category_descr` varchar(512) DEFAULT NULL,
  `category_label` varchar(256) DEFAULT NULL,
  `category_name` varchar(128) DEFAULT NULL,
  `seq` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_repo_obj` */

DROP TABLE IF EXISTS `dacp_dge_dq_repo_obj`;

CREATE TABLE `dacp_dge_dq_repo_obj` (
  `rela_id` varchar(32) NOT NULL,
  `problem_id` varchar(32) NOT NULL,
  `repo_id` varchar(32) NOT NULL,
  PRIMARY KEY (`rela_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_rule` */

DROP TABLE IF EXISTS `dacp_dge_dq_rule`;

CREATE TABLE `dacp_dge_dq_rule` (
  `id` varchar(32) NOT NULL,
  `alarm_cfg` longtext,
  `check_type` varchar(32) NOT NULL,
  `cycle_type` varchar(32) DEFAULT NULL,
  `ds_name` varchar(32) DEFAULT NULL,
  `func_code` varchar(32) DEFAULT NULL,
  `func_name` varchar(32) DEFAULT NULL,
  `func_para` longtext,
  `member_name` varchar(64) DEFAULT NULL,
  `obj_id` varchar(64) DEFAULT NULL,
  `obj_type` varchar(32) NOT NULL,
  `rule_code` varchar(32) NOT NULL,
  `rule_descr` varchar(1024) DEFAULT NULL,
  `rule_name` varchar(64) NOT NULL,
  `rule_type` varchar(128) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dqrule_index0` (`obj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_dq_tab_log` */

DROP TABLE IF EXISTS `dacp_dge_dq_tab_log`;

CREATE TABLE `dacp_dge_dq_tab_log` (
  `op_time` varchar(20) NOT NULL,
  `tab_id` varchar(32) NOT NULL,
  `drate` decimal(10,2) DEFAULT NULL,
  `generate_time` varchar(32) DEFAULT NULL,
  `mrate` decimal(10,2) DEFAULT NULL,
  `per_row_count` int(11) DEFAULT NULL,
  `row_count` int(11) DEFAULT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`op_time`,`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_mdq_chk_conf` */

DROP TABLE IF EXISTS `dacp_dge_mdq_chk_conf`;

CREATE TABLE `dacp_dge_mdq_chk_conf` (
  `team_code` varchar(32) NOT NULL,
  `no_dic` varchar(1) NOT NULL,
  `no_ins_obj` varchar(1) NOT NULL,
  `diff_field` varchar(1) NOT NULL,
  `no_cnname` varchar(1) NOT NULL,
  `no_topic` varchar(1) NOT NULL,
  `alone_model` varchar(1) NOT NULL,
  `no_field` varchar(1) NOT NULL,
  `sync_state` varchar(16) NOT NULL,
  `operator` varchar(64) NOT NULL,
  `state_date` varchar(32) NOT NULL,
  PRIMARY KEY (`team_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_mdq_chk_white_list` */

DROP TABLE IF EXISTS `dacp_dge_mdq_chk_white_list`;

CREATE TABLE `dacp_dge_mdq_chk_white_list` (
  `ds_name` varchar(32) NOT NULL,
  `own_platform` varchar(4) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `operator` varchar(64) NOT NULL,
  `create_time` varchar(32) NOT NULL,
  PRIMARY KEY (`ds_name`,`own_platform`,`tab_name`),
  KEY `mdq_ds_tab0` (`ds_name`,`tab_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_mdq_coll_tab` */

DROP TABLE IF EXISTS `dacp_dge_mdq_coll_tab`;

CREATE TABLE `dacp_dge_mdq_coll_tab` (
  `tab_id` varchar(32) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `model_tab_name` varchar(64) NOT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_schema` varchar(64) DEFAULT NULL,
  `ds_name` varchar(16) NOT NULL,
  PRIMARY KEY (`tab_id`),
  KEY `mdq_ds_tab3` (`ds_name`,`tab_name`),
  KEY `mdq_ds_tab4` (`ds_name`,`model_tab_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_mdq_coll_tab_field` */

DROP TABLE IF EXISTS `dacp_dge_mdq_coll_tab_field`;

CREATE TABLE `dacp_dge_mdq_coll_tab_field` (
  `field_id` varchar(32) NOT NULL,
  `tab_id` varchar(64) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `ds_name` varchar(64) NOT NULL,
  `field_name` varchar(64) NOT NULL,
  `field_label` varchar(512) DEFAULT NULL,
  `data_type` varchar(30) NOT NULL,
  `length` int(11) DEFAULT NULL,
  `precision_val` int(11) DEFAULT NULL,
  `isnullable` varchar(1) DEFAULT NULL,
  `field_posi` int(11) DEFAULT NULL,
  `def_value` varchar(64) DEFAULT NULL,
  `primary_key` varchar(1) DEFAULT NULL,
  `partition_key` varchar(1) DEFAULT NULL,
  `distributed_key` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`field_id`),
  KEY `mdq_tab_field1` (`tab_id`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_mdq_field_chk_rst` */

DROP TABLE IF EXISTS `dacp_dge_mdq_field_chk_rst`;

CREATE TABLE `dacp_dge_mdq_field_chk_rst` (
  `tab_id` varchar(64) NOT NULL,
  `tab_name` varchar(128) DEFAULT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_schema` varchar(32) DEFAULT NULL,
  `ds_name` varchar(64) DEFAULT NULL,
  `meta_tab_id` varchar(64) NOT NULL,
  `team_name` varchar(16) DEFAULT NULL,
  `lvl` varchar(32) DEFAULT NULL,
  `topic` varchar(32) DEFAULT NULL,
  `is_white` varchar(1) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `sync_time` varchar(32) DEFAULT NULL,
  `is_sync` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_mdq_integral_check_rst` */

DROP TABLE IF EXISTS `dacp_dge_mdq_integral_check_rst`;

CREATE TABLE `dacp_dge_mdq_integral_check_rst` (
  `tab_id` varchar(64) NOT NULL,
  `type` varchar(16) NOT NULL,
  `tab_name` varchar(128) DEFAULT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_schema` varchar(32) DEFAULT NULL,
  `field_state` varchar(1) DEFAULT NULL,
  `ds_name` varchar(32) DEFAULT NULL,
  `lvl` varchar(32) DEFAULT NULL,
  `topic` varchar(32) DEFAULT NULL,
  `team_name` varchar(16) DEFAULT NULL,
  `member_name` varchar(64) DEFAULT NULL,
  `is_white` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`tab_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_mdq_metatab_temp` */

DROP TABLE IF EXISTS `dacp_dge_mdq_metatab_temp`;

CREATE TABLE `dacp_dge_mdq_metatab_temp` (
  `tab_id` varchar(32) NOT NULL,
  `tab_name` varchar(128) DEFAULT NULL,
  `tab_schema` varchar(32) DEFAULT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `lvl` varchar(32) DEFAULT NULL,
  `topic` varchar(32) DEFAULT NULL,
  `ds_name` varchar(16) NOT NULL,
  `member_name` varchar(64) DEFAULT NULL,
  `team_name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`tab_id`),
  KEY `mdq_ds_tab1` (`ds_name`,`tab_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_mdq_metatabfield_temp` */

DROP TABLE IF EXISTS `dacp_dge_mdq_metatabfield_temp`;

CREATE TABLE `dacp_dge_mdq_metatabfield_temp` (
  `field_id` varchar(64) NOT NULL,
  `field_name` varchar(64) NOT NULL,
  `tab_id` varchar(64) NOT NULL,
  `field_label` varchar(256) DEFAULT NULL,
  `data_type` varchar(30) NOT NULL,
  `length` int(11) DEFAULT NULL,
  `precision_val` int(11) DEFAULT NULL,
  `isnullable` varchar(1) DEFAULT NULL,
  `def_value` varchar(64) DEFAULT NULL,
  `primary_key` varchar(1) DEFAULT NULL,
  `partition_key` varchar(1) DEFAULT NULL,
  `distributed_key` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`field_id`),
  KEY `mdq_tab_field0` (`tab_id`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_mdq_result_statis` */

DROP TABLE IF EXISTS `dacp_dge_mdq_result_statis`;

CREATE TABLE `dacp_dge_mdq_result_statis` (
  `ds_name` varchar(32) NOT NULL,
  `op_date` varchar(16) NOT NULL,
  `no_dic` int(11) DEFAULT NULL,
  `no_ins_obj` int(11) DEFAULT NULL,
  `diff_field` int(11) DEFAULT NULL,
  `no_cnname` int(11) DEFAULT NULL,
  `no_topic` int(11) DEFAULT NULL,
  `alone_model` int(11) DEFAULT NULL,
  `no_field` int(11) DEFAULT NULL,
  `model_num` int(11) DEFAULT NULL,
  `meta_model_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`ds_name`,`op_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_mdq_tab_chk_rst` */

DROP TABLE IF EXISTS `dacp_dge_mdq_tab_chk_rst`;

CREATE TABLE `dacp_dge_mdq_tab_chk_rst` (
  `tab_id` varchar(64) NOT NULL,
  `tab_name` varchar(128) DEFAULT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_schema` varchar(32) DEFAULT NULL,
  `ds_name` varchar(16) DEFAULT NULL,
  `field_state` varchar(1) DEFAULT NULL,
  `topic` varchar(32) DEFAULT NULL,
  `arch_name` varchar(32) DEFAULT NULL,
  `lvl` varchar(32) DEFAULT NULL,
  `cycle_type` varchar(32) DEFAULT NULL,
  `team_name` varchar(16) DEFAULT NULL,
  `member_name` varchar(32) DEFAULT NULL,
  `is_white` varchar(1) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `sync_time` varchar(32) DEFAULT NULL,
  `is_sync` varchar(1) DEFAULT NULL,
  `own_platform` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_mdq_tab_comp` */

DROP TABLE IF EXISTS `dacp_dge_mdq_tab_comp`;

CREATE TABLE `dacp_dge_mdq_tab_comp` (
  `tab_id` varchar(32) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_schema` varchar(64) DEFAULT NULL,
  `ds_name` varchar(16) NOT NULL,
  `meta_tab_id` varchar(32) NOT NULL,
  `team_name` varchar(16) DEFAULT NULL,
  `lvl` varchar(32) DEFAULT NULL,
  `topic` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_pars_config` */

DROP TABLE IF EXISTS `dacp_dge_pars_config`;

CREATE TABLE `dacp_dge_pars_config` (
  `id` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `conf` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_pars_error_log` */

DROP TABLE IF EXISTS `dacp_dge_pars_error_log`;

CREATE TABLE `dacp_dge_pars_error_log` (
  `id` varchar(32) NOT NULL,
  `rela_name` varchar(256) NOT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `sql_text` longtext,
  `error_detail` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_pars_obj_action` */

DROP TABLE IF EXISTS `dacp_dge_pars_obj_action`;

CREATE TABLE `dacp_dge_pars_obj_action` (
  `id` varchar(36) NOT NULL,
  `meta_type` varchar(12) DEFAULT NULL,
  `action_name` varchar(32) DEFAULT NULL,
  `action_url` varchar(512) DEFAULT NULL,
  `action_state` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_pars_obj_field_rela` */

DROP TABLE IF EXISTS `dacp_dge_pars_obj_field_rela`;

CREATE TABLE `dacp_dge_pars_obj_field_rela` (
  `id` varchar(32) NOT NULL,
  `rela_name` varchar(60) DEFAULT NULL,
  `rela_type` varchar(4) DEFAULT NULL,
  `source_name` varchar(60) DEFAULT NULL,
  `source_type` varchar(4) DEFAULT NULL,
  `source_field_name` varchar(60) DEFAULT NULL,
  `target_name` varchar(60) DEFAULT NULL,
  `target_type` varchar(4) DEFAULT NULL,
  `target_field_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_pars_obj_rela` */

DROP TABLE IF EXISTS `dacp_dge_pars_obj_rela`;

CREATE TABLE `dacp_dge_pars_obj_rela` (
  `id` varchar(32) NOT NULL,
  `rela_name` varchar(60) DEFAULT NULL,
  `rela_id` varchar(32) DEFAULT NULL,
  `rela_type` varchar(6) DEFAULT NULL,
  `source_name` varchar(60) DEFAULT NULL,
  `source_id` varchar(32) DEFAULT NULL,
  `source_type` varchar(6) DEFAULT NULL,
  `target_name` varchar(60) DEFAULT NULL,
  `target_id` varchar(32) DEFAULT NULL,
  `target_type` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_pars_obj_rela_bak0705` */

DROP TABLE IF EXISTS `dacp_dge_pars_obj_rela_bak0705`;

CREATE TABLE `dacp_dge_pars_obj_rela_bak0705` (
  `id` varchar(32) NOT NULL,
  `rela_name` varchar(60) DEFAULT NULL,
  `rela_id` varchar(32) DEFAULT NULL,
  `rela_type` varchar(6) DEFAULT NULL,
  `source_name` varchar(60) DEFAULT NULL,
  `source_id` varchar(32) DEFAULT NULL,
  `source_type` varchar(6) DEFAULT NULL,
  `target_name` varchar(60) DEFAULT NULL,
  `target_id` varchar(32) DEFAULT NULL,
  `target_type` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_pars_obj_rela_detail` */

DROP TABLE IF EXISTS `dacp_dge_pars_obj_rela_detail`;

CREATE TABLE `dacp_dge_pars_obj_rela_detail` (
  `ext_id` varchar(32) NOT NULL,
  `source_id` varchar(36) DEFAULT NULL,
  `source_name` varchar(256) DEFAULT NULL,
  `source_entity_name` varchar(256) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_name` varchar(256) DEFAULT NULL,
  `target_entity_name` varchar(256) DEFAULT NULL,
  `rela_id` varchar(36) DEFAULT NULL,
  `parser_date` varchar(8) DEFAULT NULL,
  `rela_name` varchar(256) DEFAULT NULL,
  `sql_text` text,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_pars_schema_mapp` */

DROP TABLE IF EXISTS `dacp_dge_pars_schema_mapp`;

CREATE TABLE `dacp_dge_pars_schema_mapp` (
  `map_id` varchar(32) NOT NULL,
  `map_name` varchar(128) DEFAULT NULL,
  `schema_name` varchar(32) DEFAULT NULL,
  `mapping_value` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_pars_var_rpl` */

DROP TABLE IF EXISTS `dacp_dge_pars_var_rpl`;

CREATE TABLE `dacp_dge_pars_var_rpl` (
  `id` varchar(32) NOT NULL,
  `db_type` varchar(12) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `r_key` varchar(64) NOT NULL,
  `r_value` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_stat_datasource` */

DROP TABLE IF EXISTS `dacp_dge_stat_datasource`;

CREATE TABLE `dacp_dge_stat_datasource` (
  `ds_name` varchar(32) NOT NULL,
  `tab_cnt` int(11) DEFAULT NULL,
  `field_cnt` int(11) DEFAULT NULL,
  `inst_tab_cnt` int(11) DEFAULT NULL,
  `inst_field_cnt` int(11) DEFAULT NULL,
  `total_size` bigint(20) DEFAULT NULL,
  `used_size` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ds_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_stat_subject_log` */

DROP TABLE IF EXISTS `dacp_dge_stat_subject_log`;

CREATE TABLE `dacp_dge_stat_subject_log` (
  `stat_date` varchar(255) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `inst_tab_cnt` varchar(255) DEFAULT NULL,
  `tab_cnt` varchar(255) DEFAULT NULL,
  `tab_size` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stat_date`,`subject_name`),
  KEY `dgestatsubject_index1` (`stat_date`),
  KEY `dgestatsubject_index2` (`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_stat_team` */

DROP TABLE IF EXISTS `dacp_dge_stat_team`;

CREATE TABLE `dacp_dge_stat_team` (
  `team_name` varchar(32) NOT NULL,
  `tab_cnt` int(11) DEFAULT NULL,
  `field_cnt` int(11) DEFAULT NULL,
  `proc_cnt` int(11) DEFAULT NULL,
  `indicator_cnt` int(11) DEFAULT NULL,
  `label_cnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`team_name`),
  KEY `dgestatteam_index1` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_stat_team_log` */

DROP TABLE IF EXISTS `dacp_dge_stat_team_log`;

CREATE TABLE `dacp_dge_stat_team_log` (
  `stat_date` varchar(12) NOT NULL,
  `team_name` varchar(32) NOT NULL,
  `field_cnt` int(11) DEFAULT NULL,
  `tab_cnt` int(11) DEFAULT NULL,
  `indicator_cnt` int(11) DEFAULT NULL,
  `label_cnt` int(11) DEFAULT NULL,
  `proc_cnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`stat_date`,`team_name`),
  KEY `dgestatteam_index1` (`stat_date`),
  KEY `dgestatteam_index2` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_std_chk` */

DROP TABLE IF EXISTS `dacp_dge_std_chk`;

CREATE TABLE `dacp_dge_std_chk` (
  `id` varchar(32) NOT NULL,
  `optime` varchar(32) NOT NULL,
  `field_id` varchar(128) NOT NULL,
  `std_name` varchar(32) NOT NULL,
  `chk_time` datetime NOT NULL,
  `chk_state` varchar(6) DEFAULT NULL,
  `chk_desr` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stdchk_index0` (`optime`),
  KEY `stdchk_index1` (`field_id`),
  KEY `stdchk_index2` (`std_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_std_nam_chk` */

DROP TABLE IF EXISTS `dacp_dge_std_nam_chk`;

CREATE TABLE `dacp_dge_std_nam_chk` (
  `item_id` varchar(64) NOT NULL,
  `optime` varchar(32) NOT NULL,
  `rule_type` varchar(32) NOT NULL,
  `chk_desr` varchar(4000) DEFAULT NULL,
  `chk_state` varchar(6) DEFAULT NULL,
  `chk_time` datetime NOT NULL,
  PRIMARY KEY (`item_id`,`optime`,`rule_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_std_nam_chk_dtl` */

DROP TABLE IF EXISTS `dacp_dge_std_nam_chk_dtl`;

CREATE TABLE `dacp_dge_std_nam_chk_dtl` (
  `item_id` varchar(64) NOT NULL,
  `optime` varchar(32) NOT NULL,
  `rule_code` varchar(64) NOT NULL,
  `rule_type` varchar(32) NOT NULL,
  `chk_desr` varchar(4000) DEFAULT NULL,
  `chk_state` varchar(6) DEFAULT NULL,
  `chk_time` datetime NOT NULL,
  PRIMARY KEY (`item_id`,`optime`,`rule_code`,`rule_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_std_nam_chk_tab` */

DROP TABLE IF EXISTS `dacp_dge_std_nam_chk_tab`;

CREATE TABLE `dacp_dge_std_nam_chk_tab` (
  `optime` varchar(32) NOT NULL,
  `tab_id` varchar(32) NOT NULL,
  `chk_desr` varchar(4000) DEFAULT NULL,
  `chk_state` varchar(6) DEFAULT NULL,
  `chk_time` datetime NOT NULL,
  `col_chk_state` varchar(6) DEFAULT NULL,
  `table_chk_state` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`optime`,`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_std_nam_rule` */

DROP TABLE IF EXISTS `dacp_dge_std_nam_rule`;

CREATE TABLE `dacp_dge_std_nam_rule` (
  `id` varchar(64) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `creator` varchar(64) DEFAULT NULL,
  `data_state` varchar(8) NOT NULL,
  `modifier` varchar(64) DEFAULT NULL,
  `modify_date` datetime NOT NULL,
  `obj_id` varchar(64) NOT NULL,
  `obj_type` varchar(8) NOT NULL,
  `rule_type` varchar(32) NOT NULL,
  `rules` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dge_std_pub_dim` */

DROP TABLE IF EXISTS `dacp_dge_std_pub_dim`;

CREATE TABLE `dacp_dge_std_pub_dim` (
  `ID` varchar(32) NOT NULL,
  `DIM_CODE` varchar(32) NOT NULL,
  `DIM_NAME` varchar(64) NOT NULL,
  `MEMBER_CODE` varchar(32) NOT NULL,
  `MEMBER_NAME` varchar(64) NOT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `MEMBER_SEQ` varchar(4) NOT NULL,
  `DESCR` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_directory_def` */

DROP TABLE IF EXISTS `dacp_directory_def`;

CREATE TABLE `dacp_directory_def` (
  `dir_id` varchar(32) NOT NULL,
  `dir_label` varchar(64) DEFAULT NULL,
  `dir_type` varchar(16) DEFAULT NULL,
  `team_name` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `dir_descr` varchar(512) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_directory_metaobj` */

DROP TABLE IF EXISTS `dacp_directory_metaobj`;

CREATE TABLE `dacp_directory_metaobj` (
  `dir_id` varchar(32) NOT NULL,
  `mobj_id` varchar(32) NOT NULL,
  `dir_node_id` varchar(32) DEFAULT NULL,
  `mobj_name` varchar(64) DEFAULT NULL,
  `mobj_label` varchar(64) DEFAULT NULL,
  `mobj_class` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`dir_id`,`mobj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_directory_node` */

DROP TABLE IF EXISTS `dacp_directory_node`;

CREATE TABLE `dacp_directory_node` (
  `dir_id` varchar(32) NOT NULL,
  `dir_node_id` varchar(32) NOT NULL,
  `dir_node_label` varchar(64) DEFAULT NULL,
  `parent_node_id` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`dir_id`,`dir_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_demand` */

DROP TABLE IF EXISTS `dacp_dps_demand`;

CREATE TABLE `dacp_dps_demand` (
  `id` varchar(32) NOT NULL,
  `demand_label` varchar(32) NOT NULL,
  `demand_descr` varchar(16) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_download_log` */

DROP TABLE IF EXISTS `dacp_dps_download_log`;

CREATE TABLE `dacp_dps_download_log` (
  `his_id` varchar(64) NOT NULL,
  `team_code` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `dir` varchar(300) DEFAULT NULL,
  `target_dir` varchar(300) DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  `server_id` varchar(32) DEFAULT NULL,
  `target_server_id` varchar(32) DEFAULT NULL,
  `dbname` varchar(64) DEFAULT NULL,
  `tablename` varchar(64) DEFAULT NULL,
  `encoding` varchar(32) DEFAULT NULL,
  `file_separator` char(1) DEFAULT NULL,
  `type` varchar(4) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`his_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_model_auth` */

DROP TABLE IF EXISTS `dacp_dps_model_auth`;

CREATE TABLE `dacp_dps_model_auth` (
  `id` varchar(32) NOT NULL,
  `auth_tennat` varchar(32) DEFAULT NULL,
  `model_id` varchar(32) DEFAULT NULL,
  `model_name` varchar(200) DEFAULT NULL,
  `obj_fields` varchar(256) DEFAULT NULL,
  `owner_team_id` varchar(32) DEFAULT NULL,
  `table_id` varchar(32) DEFAULT NULL,
  `table_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_ranger_hdfs` */

DROP TABLE IF EXISTS `dacp_dps_ranger_hdfs`;

CREATE TABLE `dacp_dps_ranger_hdfs` (
  `id` varchar(32) NOT NULL,
  `cluster_id` varchar(32) DEFAULT NULL,
  `flie_count` varchar(32) DEFAULT NULL,
  `groups` varchar(32) DEFAULT NULL,
  `max_flie_count` varchar(32) DEFAULT NULL,
  `max_quota` varchar(32) DEFAULT NULL,
  `owners` varchar(32) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  `percent` varchar(32) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `quota` varchar(32) DEFAULT NULL,
  `tenant_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_ranger_hive` */

DROP TABLE IF EXISTS `dacp_dps_ranger_hive`;

CREATE TABLE `dacp_dps_ranger_hive` (
  `id` varchar(32) NOT NULL,
  `cluster_id` varchar(32) DEFAULT NULL,
  `db_name` varchar(128) DEFAULT NULL,
  `db_url` varchar(255) DEFAULT NULL,
  `hdfs_path` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `table_name` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_ranger_yarn` */

DROP TABLE IF EXISTS `dacp_dps_ranger_yarn`;

CREATE TABLE `dacp_dps_ranger_yarn` (
  `id` varchar(32) NOT NULL,
  `application_num` varchar(32) DEFAULT NULL,
  `capacity` varchar(32) DEFAULT NULL,
  `cluster_id` varchar(32) DEFAULT NULL,
  `cpu` varchar(32) DEFAULT NULL,
  `max_capacity` varchar(32) DEFAULT NULL,
  `max_cpu` varchar(32) DEFAULT NULL,
  `max_memory` varchar(32) DEFAULT NULL,
  `memory` varchar(32) DEFAULT NULL,
  `percent` varchar(32) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `queue` varchar(128) DEFAULT NULL,
  `res_state` varchar(32) DEFAULT NULL,
  `tenant_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_resouce_auth` */

DROP TABLE IF EXISTS `dacp_dps_resouce_auth`;

CREATE TABLE `dacp_dps_resouce_auth` (
  `id` varchar(32) NOT NULL,
  `auth_Type` varchar(255) DEFAULT NULL,
  `del_state` varchar(32) DEFAULT NULL,
  `ds_id` varchar(32) DEFAULT NULL,
  `policy_id` varchar(32) DEFAULT NULL,
  `policy_name` varchar(100) DEFAULT NULL,
  `queue_name` varchar(32) DEFAULT NULL,
  `res_id` varchar(200) DEFAULT NULL,
  `res_type` varchar(64) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `tenant_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_resouce_cluster_cfg` */

DROP TABLE IF EXISTS `dacp_dps_resouce_cluster_cfg`;

CREATE TABLE `dacp_dps_resouce_cluster_cfg` (
  `id` varchar(32) NOT NULL,
  `ds_id` varchar(16) NOT NULL,
  `passwd` varchar(8) DEFAULT NULL,
  `rm_host` varchar(100) DEFAULT NULL,
  `rm_port` varchar(8) DEFAULT NULL,
  `username` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_resouce_docker` */

DROP TABLE IF EXISTS `dacp_dps_resouce_docker`;

CREATE TABLE `dacp_dps_resouce_docker` (
  `id` varchar(32) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `docker_name` varchar(32) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `tenant_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_resouce_docker_info` */

DROP TABLE IF EXISTS `dacp_dps_resouce_docker_info`;

CREATE TABLE `dacp_dps_resouce_docker_info` (
  `id` varchar(32) NOT NULL,
  `cpu_percent` int(11) DEFAULT NULL,
  `docker_id` varchar(32) DEFAULT NULL,
  `memory_limit` int(11) DEFAULT NULL,
  `memory_usage` int(11) DEFAULT NULL,
  `network_in` int(11) DEFAULT NULL,
  `network_out` int(11) DEFAULT NULL,
  `number_containers` int(11) DEFAULT NULL,
  `tree_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_resouce_hbase` */

DROP TABLE IF EXISTS `dacp_dps_resouce_hbase`;

CREATE TABLE `dacp_dps_resouce_hbase` (
  `id` varchar(32) NOT NULL,
  `ds_id` varchar(16) NOT NULL,
  `res_type` varchar(8) NOT NULL,
  `ds_name` varchar(32) DEFAULT NULL,
  `hbase_table` varchar(32) DEFAULT NULL,
  `columnFamily` varchar(255) DEFAULT NULL,
  `hbase_column` varchar(32) DEFAULT NULL,
  `ds_conf` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `allocated_State` varchar(1) DEFAULT NULL,
  `del_state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_resouce_hdfs` */

DROP TABLE IF EXISTS `dacp_dps_resouce_hdfs`;

CREATE TABLE `dacp_dps_resouce_hdfs` (
  `id` varchar(32) NOT NULL,
  `ds_id` varchar(16) NOT NULL,
  `res_type` varchar(8) NOT NULL,
  `folder_path` varchar(512) DEFAULT NULL,
  `storage_space_quota` bigint(20) DEFAULT NULL,
  `name_space_quota` varchar(255) DEFAULT NULL,
  `descr` varchar(256) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `allocated_State` varchar(1) DEFAULT NULL,
  `del_state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_resouce_hive` */

DROP TABLE IF EXISTS `dacp_dps_resouce_hive`;

CREATE TABLE `dacp_dps_resouce_hive` (
  `id` varchar(32) NOT NULL,
  `ds_id` varchar(16) NOT NULL,
  `res_type` varchar(8) NOT NULL,
  `ds_name` varchar(32) DEFAULT NULL,
  `ds_label` varchar(32) DEFAULT NULL,
  `ds_conf` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `allocated_State` varchar(1) DEFAULT NULL,
  `del_state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_resouce_hive_table` */

DROP TABLE IF EXISTS `dacp_dps_resouce_hive_table`;

CREATE TABLE `dacp_dps_resouce_hive_table` (
  `id` varchar(32) NOT NULL,
  `table_name` varchar(128) NOT NULL,
  `db_name` varchar(128) NOT NULL,
  `tenant_id` varchar(32) DEFAULT NULL,
  `cluster_id` varchar(128) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `deal_type` varchar(32) DEFAULT NULL,
  `hdfs_path` varchar(255) DEFAULT NULL,
  `db_id` varchar(255) DEFAULT NULL,
  `tbl_id` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_resouce_kafka` */

DROP TABLE IF EXISTS `dacp_dps_resouce_kafka`;

CREATE TABLE `dacp_dps_resouce_kafka` (
  `id` varchar(32) NOT NULL,
  `ds_id` varchar(16) NOT NULL,
  `res_type` varchar(8) NOT NULL,
  `topic` varchar(128) DEFAULT NULL,
  `partitions` int(11) DEFAULT NULL,
  `replication_factor` int(11) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `allocated_State` varchar(1) DEFAULT NULL,
  `del_state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_resouce_log` */

DROP TABLE IF EXISTS `dacp_dps_resouce_log`;

CREATE TABLE `dacp_dps_resouce_log` (
  `id` varchar(32) NOT NULL,
  `ds_id` varchar(32) DEFAULT NULL,
  `ds_name` varchar(255) DEFAULT NULL,
  `message` longtext,
  `obj_fields` varchar(256) DEFAULT NULL,
  `oper_dt` datetime DEFAULT NULL,
  `oper_type` varchar(32) DEFAULT NULL,
  `res_id` varchar(200) DEFAULT NULL,
  `res_type` varchar(32) DEFAULT NULL,
  `is_success` bit(1) DEFAULT NULL,
  `table_model` varchar(32) DEFAULT NULL,
  `table_model_name` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(32) DEFAULT NULL,
  `tenant_name` varchar(255) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_resouce_yarn` */

DROP TABLE IF EXISTS `dacp_dps_resouce_yarn`;

CREATE TABLE `dacp_dps_resouce_yarn` (
  `id` varchar(32) NOT NULL,
  `ds_id` varchar(16) NOT NULL,
  `res_type` varchar(8) NOT NULL,
  `queue_name` varchar(128) DEFAULT NULL,
  `capacity` float DEFAULT NULL,
  `maximum_capacity` float DEFAULT NULL,
  `maximum_applications` int(11) DEFAULT NULL,
  `queue_state` varchar(8) DEFAULT NULL,
  `yarn_version_tag` varchar(32) DEFAULT NULL,
  `descr` varchar(256) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `allocated_state` varchar(1) DEFAULT NULL,
  `del_state` varchar(1) DEFAULT NULL,
  `queue_mappings` varchar(256) DEFAULT NULL,
  `tenant` varchar(32) DEFAULT NULL,
  `queue_code` varchar(128) DEFAULT NULL,
  `queue_name_full_path` varchar(255) DEFAULT NULL,
  `minimum_user_limit_percent` float DEFAULT NULL,
  `user_limit_factor` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dps_resource_ocm` */

DROP TABLE IF EXISTS `dacp_dps_resource_ocm`;

CREATE TABLE `dacp_dps_resource_ocm` (
  `id` varchar(32) NOT NULL,
  `cluster_id` varchar(32) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `cuz_bsi_name` varchar(128) DEFAULT NULL,
  `host` varchar(32) DEFAULT NULL,
  `instance_id` varchar(128) DEFAULT NULL,
  `instance_name` varchar(128) DEFAULT NULL,
  `instance_type` varchar(10) DEFAULT NULL,
  `permission` varchar(128) DEFAULT NULL,
  `port` varchar(8) DEFAULT NULL,
  `tenant_id` varchar(32) DEFAULT NULL,
  `tenant_name` varchar(128) DEFAULT NULL,
  `uri` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_dsh_pars_obj_rela` */

DROP TABLE IF EXISTS `dacp_dsh_pars_obj_rela`;

CREATE TABLE `dacp_dsh_pars_obj_rela` (
  `id` varchar(128) NOT NULL,
  `rela_name` varchar(256) DEFAULT NULL,
  `rela_id` varchar(64) DEFAULT NULL,
  `rela_type` varchar(4) DEFAULT NULL,
  `source_name` varchar(256) DEFAULT NULL,
  `source_id` varchar(128) DEFAULT NULL,
  `source_type` varchar(4) DEFAULT NULL,
  `target_name` varchar(256) DEFAULT NULL,
  `target_id` varchar(128) DEFAULT NULL,
  `target_type` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_hive_mr_jobids` */

DROP TABLE IF EXISTS `dacp_hive_mr_jobids`;

CREATE TABLE `dacp_hive_mr_jobids` (
  `cycle_id` varchar(100) NOT NULL,
  `job_id` varchar(100) NOT NULL,
  `proc_name` varchar(100) NOT NULL,
  `step_seq` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cycle_id`,`job_id`,`proc_name`,`step_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_menu` */

DROP TABLE IF EXISTS `dacp_menu`;

CREATE TABLE `dacp_menu` (
  `menu_id` varchar(32) NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `menu_name` varchar(128) DEFAULT NULL,
  `menu_name_en` varchar(128) DEFAULT NULL,
  `menu_descr` varchar(256) DEFAULT NULL,
  `menu_icon` varchar(128) DEFAULT NULL,
  `menu_type` varchar(8) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `side_type` varchar(16) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `menu_ext_conf` varchar(1024) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_crypt` */

DROP TABLE IF EXISTS `dacp_meta_crypt`;

CREATE TABLE `dacp_meta_crypt` (
  `crypt_id` varchar(32) NOT NULL,
  `crypt_name` varchar(16) NOT NULL,
  `crypt_label` varchar(32) DEFAULT NULL,
  `crypt_descr` varchar(128) DEFAULT NULL,
  `algorithm` varchar(16) NOT NULL,
  `default_key` varchar(32) NOT NULL,
  `crypt_class_name` varchar(128) DEFAULT NULL,
  `algorithm_type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`crypt_id`),
  UNIQUE KEY `UK_s19y9odvhjg26to08m52ct630` (`crypt_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_crypt_rule` */

DROP TABLE IF EXISTS `dacp_meta_crypt_rule`;

CREATE TABLE `dacp_meta_crypt_rule` (
  `rule_id` varchar(32) NOT NULL,
  `rule_name` varchar(32) NOT NULL,
  `rule_label` varchar(64) NOT NULL,
  `rule_descr` varchar(256) DEFAULT NULL,
  `crypt_name` varchar(16) DEFAULT NULL,
  `key_name` varchar(16) DEFAULT NULL,
  `tenant_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rule_id`),
  UNIQUE KEY `UK_pqcfrnecobkxpxf95i9e8c2ha` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_dataarch` */

DROP TABLE IF EXISTS `dacp_meta_dataarch`;

CREATE TABLE `dacp_meta_dataarch` (
  `arch_id` varchar(32) NOT NULL,
  `parent_arch_name` varchar(64) DEFAULT NULL,
  `arch_name` varchar(64) NOT NULL,
  `subject_name` varchar(64) DEFAULT NULL,
  `arch_label` varchar(128) DEFAULT NULL,
  `arch_descr` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`arch_id`),
  UNIQUE KEY `UK_i8qalmypifrrsxgq2k57y1y8` (`arch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_dataarch_stat` */

DROP TABLE IF EXISTS `dacp_meta_dataarch_stat`;

CREATE TABLE `dacp_meta_dataarch_stat` (
  `arch_name` varchar(32) NOT NULL,
  `team_name` varchar(32) NOT NULL,
  `tab_cnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`arch_name`,`team_name`),
  KEY `dataarchstat_index1` (`arch_name`),
  KEY `dataarchstat_index2` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_datasource` */

DROP TABLE IF EXISTS `dacp_meta_datasource`;

CREATE TABLE `dacp_meta_datasource` (
  `ds_id` varchar(32) NOT NULL,
  `ds_name` varchar(32) NOT NULL,
  `ds_label` varchar(64) NOT NULL,
  `ds_descr` varchar(256) DEFAULT NULL,
  `ds_inst_name` varchar(32) DEFAULT NULL,
  `ds_alias` varchar(16) DEFAULT NULL,
  `ds_category` varchar(16) DEFAULT NULL,
  `ds_type` varchar(32) DEFAULT NULL,
  `ds_db_name` varchar(16) DEFAULT NULL,
  `ds_acct` varchar(64) DEFAULT NULL,
  `ds_auth` varchar(256) DEFAULT NULL,
  `ds_auth_type` varchar(16) DEFAULT NULL,
  `ds_conf` varchar(1024) DEFAULT NULL,
  `dev_ds_acct` varchar(64) DEFAULT NULL,
  `dev_ds_auth` varchar(256) DEFAULT NULL,
  `dev_ds_auth_type` varchar(16) DEFAULT NULL,
  `dev_ds_conf` varchar(1024) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL,
  `ds_inst_location` varchar(1024) DEFAULT NULL,
  `dev_ds_inst_location` varchar(1024) DEFAULT NULL,
  `physical_dbName` varchar(64) DEFAULT NULL,
  `dev_physical_dbName` varchar(64) DEFAULT NULL,
  `is_open` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ds_id`),
  UNIQUE KEY `UK_lumruf0hbhv3bywtaqyxdayxj` (`ds_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_datasource_bak20180627` */

DROP TABLE IF EXISTS `dacp_meta_datasource_bak20180627`;

CREATE TABLE `dacp_meta_datasource_bak20180627` (
  `ds_id` varchar(32) NOT NULL,
  `ds_name` varchar(32) NOT NULL,
  `ds_label` varchar(64) NOT NULL,
  `ds_descr` varchar(256) DEFAULT NULL,
  `ds_inst_name` varchar(32) DEFAULT NULL,
  `ds_alias` varchar(16) DEFAULT NULL,
  `ds_category` varchar(16) DEFAULT NULL,
  `ds_type` varchar(32) DEFAULT NULL,
  `ds_db_name` varchar(16) DEFAULT NULL,
  `ds_acct` varchar(64) DEFAULT NULL,
  `ds_auth` varchar(256) DEFAULT NULL,
  `ds_auth_type` varchar(16) DEFAULT NULL,
  `ds_conf` varchar(1024) DEFAULT NULL,
  `dev_ds_acct` varchar(64) DEFAULT NULL,
  `dev_ds_auth` varchar(256) DEFAULT NULL,
  `dev_ds_auth_type` varchar(16) DEFAULT NULL,
  `dev_ds_conf` varchar(1024) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_ds_instance` */

DROP TABLE IF EXISTS `dacp_meta_ds_instance`;

CREATE TABLE `dacp_meta_ds_instance` (
  `ds_inst` varchar(32) NOT NULL,
  `ds_inst_name` varchar(32) NOT NULL,
  `ds_inst_label` varchar(64) DEFAULT NULL,
  `ds_inst_descr` varchar(256) DEFAULT NULL,
  `ds_inst_loc` varchar(64) DEFAULT NULL,
  `ds_inst_port` varchar(8) DEFAULT NULL,
  `ds_db_name` varchar(16) DEFAULT NULL,
  `ds_category` varchar(16) DEFAULT NULL,
  `ds_type` varchar(16) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL,
  `ds_inst_location` varchar(1024) DEFAULT NULL,
  `dev_ds_inst_location` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ds_inst`),
  UNIQUE KEY `UK_t910p6pvqprrn1vom6jl7uh9l` (`ds_inst_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_flow` */

DROP TABLE IF EXISTS `dacp_meta_flow`;

CREATE TABLE `dacp_meta_flow` (
  `flow_id` varchar(32) NOT NULL,
  `flow_name` varchar(32) NOT NULL,
  `label` varchar(32) NOT NULL,
  `descr` varchar(64) DEFAULT NULL,
  `flow_type` varchar(64) DEFAULT NULL,
  `flow_graph` longtext,
  `run_type` varchar(8) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`flow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_flow_auth` */

DROP TABLE IF EXISTS `dacp_meta_flow_auth`;

CREATE TABLE `dacp_meta_flow_auth` (
  `auth_id` varchar(16) NOT NULL,
  `flow_id` varchar(32) NOT NULL,
  `team_name` varchar(32) NOT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_flow_inst` */

DROP TABLE IF EXISTS `dacp_meta_flow_inst`;

CREATE TABLE `dacp_meta_flow_inst` (
  `flow_inst_id` varchar(32) NOT NULL,
  `flow_id` varchar(32) NOT NULL,
  `flow_inst_label` varchar(256) NOT NULL,
  `flow_inst_descr` varchar(512) DEFAULT NULL,
  `cur_step_id` varchar(32) NOT NULL,
  `cur_handle_role` varchar(64) DEFAULT NULL,
  `cur_handle_users` varchar(64) DEFAULT NULL,
  `team_name` varchar(32) DEFAULT NULL,
  `create_user` varchar(32) NOT NULL,
  `create_dt` datetime DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `approve_state` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`flow_inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_flow_inst_log` */

DROP TABLE IF EXISTS `dacp_meta_flow_inst_log`;

CREATE TABLE `dacp_meta_flow_inst_log` (
  `inst_log_id` varchar(32) NOT NULL,
  `flow_inst_id` varchar(32) NOT NULL,
  `flow_id` varchar(32) NOT NULL,
  `step_id` varchar(32) NOT NULL,
  `handle_role` varchar(64) DEFAULT NULL,
  `handle_users` varchar(64) DEFAULT NULL,
  `handler` varchar(16) DEFAULT NULL,
  `next_step_handler` varchar(512) DEFAULT NULL,
  `next_step_id` varchar(32) DEFAULT NULL,
  `handle_status` varchar(8) DEFAULT NULL,
  `handle_dt` datetime DEFAULT NULL,
  `handle_comment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`inst_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_flow_inst_obj` */

DROP TABLE IF EXISTS `dacp_meta_flow_inst_obj`;

CREATE TABLE `dacp_meta_flow_inst_obj` (
  `id` varchar(32) NOT NULL,
  `flow_inst_id` varchar(32) NOT NULL,
  `step_id` varchar(32) NOT NULL,
  `obj_type` varchar(8) NOT NULL,
  `obj_id` varchar(32) NOT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `tenant_name` varchar(64) DEFAULT NULL,
  `obj_fields` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_flow_inst_step` */

DROP TABLE IF EXISTS `dacp_meta_flow_inst_step`;

CREATE TABLE `dacp_meta_flow_inst_step` (
  `flow_inst_step_id` varchar(32) NOT NULL,
  `step_id` varchar(32) NOT NULL,
  `flow_inst_id` varchar(32) NOT NULL,
  `flow_id` varchar(32) NOT NULL,
  `step_label` varchar(32) NOT NULL,
  `step_def_id` varchar(32) NOT NULL,
  `handle_role` varchar(32) DEFAULT NULL,
  `handle_users` varchar(512) DEFAULT NULL,
  `submit_step_id` varchar(32) DEFAULT NULL,
  `reject_step_id` varchar(32) DEFAULT NULL,
  `finish_step_id` varchar(32) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`flow_inst_step_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_flow_inst_task` */

DROP TABLE IF EXISTS `dacp_meta_flow_inst_task`;

CREATE TABLE `dacp_meta_flow_inst_task` (
  `id` varchar(32) NOT NULL,
  `flow_inst_id` varchar(32) NOT NULL,
  `step_id` varchar(32) NOT NULL,
  `obj_type` varchar(8) DEFAULT NULL,
  `obj_ids` varchar(256) DEFAULT NULL,
  `team_name` varchar(64) NOT NULL,
  `approve_user` varchar(64) NOT NULL,
  `state` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_flow_step` */

DROP TABLE IF EXISTS `dacp_meta_flow_step`;

CREATE TABLE `dacp_meta_flow_step` (
  `step_id` varchar(32) NOT NULL,
  `flow_id` varchar(32) NOT NULL,
  `step_label` varchar(32) NOT NULL,
  `step_def_id` varchar(32) NOT NULL,
  `handle_role` varchar(32) DEFAULT NULL,
  `handle_team_name` varchar(64) DEFAULT NULL,
  `handle_users` varchar(64) DEFAULT NULL,
  `submit_step_id` varchar(32) DEFAULT NULL,
  `reject_step_id` varchar(32) DEFAULT NULL,
  `finish_step_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`step_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_flow_step_def` */

DROP TABLE IF EXISTS `dacp_meta_flow_step_def`;

CREATE TABLE `dacp_meta_flow_step_def` (
  `step_def_id` varchar(8) NOT NULL,
  `step_def_label` varchar(32) NOT NULL,
  `descr` varchar(64) DEFAULT NULL,
  `step_type` varchar(8) NOT NULL,
  `def_url` varchar(256) DEFAULT NULL,
  `submit` varchar(256) DEFAULT NULL,
  `consign` varchar(256) DEFAULT NULL,
  `reject` varchar(256) DEFAULT NULL,
  `finish` varchar(256) DEFAULT NULL,
  `handle_role` varchar(32) NOT NULL,
  `is_team_step` varchar(8) NOT NULL,
  PRIMARY KEY (`step_def_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_flow_step_inst_prop` */

DROP TABLE IF EXISTS `dacp_meta_flow_step_inst_prop`;

CREATE TABLE `dacp_meta_flow_step_inst_prop` (
  `prop_inst_id` varchar(32) NOT NULL,
  `flow_inst_id` varchar(32) NOT NULL,
  `prop_id` varchar(32) NOT NULL,
  `prop_code` varchar(64) DEFAULT NULL,
  `step_id` varchar(64) NOT NULL,
  `prop_value` text,
  PRIMARY KEY (`prop_inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_flow_step_prop` */

DROP TABLE IF EXISTS `dacp_meta_flow_step_prop`;

CREATE TABLE `dacp_meta_flow_step_prop` (
  `prop_id` varchar(32) NOT NULL,
  `step_id` varchar(32) NOT NULL,
  `prop_code` varchar(32) NOT NULL,
  `descr` varchar(64) DEFAULT NULL,
  `prop_label` varchar(64) NOT NULL,
  `is_requried` varchar(2) NOT NULL,
  `type` varchar(64) NOT NULL,
  `enums` varchar(256) DEFAULT NULL,
  `is_regular` varchar(2) NOT NULL,
  PRIMARY KEY (`prop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_local_data_dic` */

DROP TABLE IF EXISTS `dacp_meta_local_data_dic`;

CREATE TABLE `dacp_meta_local_data_dic` (
  `dic_id` int(11) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `field_name` varchar(64) NOT NULL,
  `field_label` varchar(256) DEFAULT NULL,
  `data_type` varchar(30) DEFAULT NULL,
  `length` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`dic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_local_data_dic_analy` */

DROP TABLE IF EXISTS `dacp_meta_local_data_dic_analy`;

CREATE TABLE `dacp_meta_local_data_dic_analy` (
  `std_id` int(11) NOT NULL,
  `std_name` varchar(64) DEFAULT NULL,
  `std_label` varchar(256) DEFAULT NULL,
  `data_type` varchar(30) DEFAULT NULL,
  `length` varchar(8) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `std_pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`std_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_local_data_dic_rela` */

DROP TABLE IF EXISTS `dacp_meta_local_data_dic_rela`;

CREATE TABLE `dacp_meta_local_data_dic_rela` (
  `rela_id` int(11) NOT NULL,
  `std_id` int(11) DEFAULT NULL,
  `dic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rela_id`),
  KEY `FKemjteor3ip5k66mmv8ala6js` (`std_id`),
  CONSTRAINT `FKemjteor3ip5k66mmv8ala6js` FOREIGN KEY (`std_id`) REFERENCES `dacp_meta_local_data_dic_analy` (`std_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_member_tab` */

DROP TABLE IF EXISTS `dacp_meta_member_tab`;

CREATE TABLE `dacp_meta_member_tab` (
  `id` varchar(64) NOT NULL,
  `arch_full_path` varchar(512) DEFAULT NULL,
  `arch_name` varchar(64) NOT NULL,
  `member_name` varchar(32) DEFAULT NULL,
  `tab_id` varchar(64) NOT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `metamembertab_index0` (`tab_id`),
  KEY `metamembertab_index1` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_normative_dict` */

DROP TABLE IF EXISTS `dacp_meta_normative_dict`;

CREATE TABLE `dacp_meta_normative_dict` (
  `id` varchar(64) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `descr` varchar(256) DEFAULT NULL,
  `enname` varchar(32) DEFAULT NULL,
  `full_enname` varchar(64) DEFAULT NULL,
  `lastupd_date` datetime NOT NULL,
  `lastupd_user` varchar(32) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `similar_name` varchar(128) DEFAULT NULL,
  `state` varchar(16) DEFAULT NULL,
  `synonyms_name` varchar(128) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `version` varchar(16) DEFAULT NULL,
  `word_freq` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_object` */

DROP TABLE IF EXISTS `dacp_meta_object`;

CREATE TABLE `dacp_meta_object` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `label` varchar(64) DEFAULT NULL,
  `descr` varchar(512) DEFAULT NULL,
  `meta_class` varchar(16) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `lastupd` datetime DEFAULT NULL,
  `create_user` varchar(16) DEFAULT NULL,
  `lastupd_user` varchar(16) DEFAULT NULL,
  `mobj_extcfg` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `metaobject_index0` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_object_rela` */

DROP TABLE IF EXISTS `dacp_meta_object_rela`;

CREATE TABLE `dacp_meta_object_rela` (
  `rela_id` bigint(20) NOT NULL,
  `source_id` varchar(32) DEFAULT NULL,
  `source_name` varchar(64) DEFAULT NULL,
  `source_meta_class` varchar(16) DEFAULT NULL,
  `target_id` varchar(32) DEFAULT NULL,
  `target_name` varchar(64) DEFAULT NULL,
  `target_meta_class` varchar(16) DEFAULT NULL,
  `rela_type` varchar(16) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`rela_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_object_seq` */

DROP TABLE IF EXISTS `dacp_meta_object_seq`;

CREATE TABLE `dacp_meta_object_seq` (
  `meta_class` varchar(16) DEFAULT NULL,
  `seq_val` int(11) DEFAULT NULL,
  UNIQUE KEY `mobj_seq_uqx` (`meta_class`,`seq_val`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_phyarch` */

DROP TABLE IF EXISTS `dacp_meta_phyarch`;

CREATE TABLE `dacp_meta_phyarch` (
  `phy_id` varchar(32) NOT NULL,
  `parent_name` varchar(32) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `lvl_name` varchar(32) NOT NULL,
  `phy_name` varchar(32) NOT NULL,
  `descr` varchar(256) NOT NULL,
  PRIMARY KEY (`phy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_phyarch_prop` */

DROP TABLE IF EXISTS `dacp_meta_phyarch_prop`;

CREATE TABLE `dacp_meta_phyarch_prop` (
  `prop_id` varchar(32) NOT NULL,
  `lvl_name` varchar(32) NOT NULL,
  `lvl_label` varchar(32) DEFAULT NULL,
  `prop` varchar(32) DEFAULT NULL,
  `prop_val` varchar(256) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `category` varchar(16) DEFAULT NULL,
  `phy_name` varchar(32) NOT NULL,
  PRIMARY KEY (`prop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_proc` */

DROP TABLE IF EXISTS `dacp_meta_proc`;

CREATE TABLE `dacp_meta_proc` (
  `proc_id` varchar(32) NOT NULL,
  `proc_name` varchar(32) NOT NULL,
  `proc_label` varchar(64) DEFAULT NULL,
  `proc_cycle` varchar(10) DEFAULT NULL,
  `proc_type` varchar(32) DEFAULT NULL,
  `proc_script_type` varchar(32) DEFAULT NULL,
  `ds_name` varchar(32) DEFAULT NULL,
  `proc_script_server` varchar(32) DEFAULT NULL,
  `proc_script_para` varchar(256) DEFAULT NULL,
  `proc_script_name` varchar(32) DEFAULT NULL,
  `proc_script_path` varchar(64) DEFAULT NULL,
  `proc_tmpl_name` varchar(32) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `member_name` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `proc_descr` varchar(256) DEFAULT NULL,
  `state` varchar(16) DEFAULT NULL,
  `state_date` datetime DEFAULT NULL,
  `team_name` varchar(32) DEFAULT NULL,
  `arch_name` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `graph` longtext,
  `remark` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`proc_id`),
  UNIQUE KEY `UK_pejp66o0hgumtuot2l81hpdv9` (`proc_name`),
  KEY `metaproc_index0` (`proc_name`),
  KEY `metaproc_index1` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_proc_alter` */

DROP TABLE IF EXISTS `dacp_meta_proc_alter`;

CREATE TABLE `dacp_meta_proc_alter` (
  `proc_id` varchar(32) NOT NULL,
  `proc_name` varchar(32) NOT NULL,
  `proc_label` varchar(64) DEFAULT NULL,
  `proc_cycle` varchar(10) DEFAULT NULL,
  `proc_type` varchar(32) DEFAULT NULL,
  `proc_script_type` varchar(32) DEFAULT NULL,
  `ds_name` varchar(32) DEFAULT NULL,
  `proc_script_server` varchar(32) DEFAULT NULL,
  `proc_script_para` varchar(256) DEFAULT NULL,
  `proc_script_name` varchar(32) DEFAULT NULL,
  `proc_script_path` varchar(64) DEFAULT NULL,
  `proc_tmpl_name` varchar(32) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `member_name` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `proc_descr` varchar(256) DEFAULT NULL,
  `state` varchar(16) DEFAULT NULL,
  `state_date` datetime DEFAULT NULL,
  `team_name` varchar(32) DEFAULT NULL,
  `arch_name` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `graph` longtext,
  `remark` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`proc_id`),
  UNIQUE KEY `UK_55aj82t5uya7rl1kvuym8nn1h` (`proc_name`),
  KEY `metaproc_index0` (`proc_name`),
  KEY `metaproc_index1` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_proc_his` */

DROP TABLE IF EXISTS `dacp_meta_proc_his`;

CREATE TABLE `dacp_meta_proc_his` (
  `his_id` varchar(32) NOT NULL,
  `proc_id` varchar(32) DEFAULT NULL,
  `proc_name` varchar(32) NOT NULL,
  `proc_label` varchar(64) DEFAULT NULL,
  `proc_cycle` varchar(10) DEFAULT NULL,
  `proc_type` varchar(32) DEFAULT NULL,
  `proc_script_type` varchar(32) DEFAULT NULL,
  `ds_name` varchar(32) DEFAULT NULL,
  `proc_script_server` varchar(32) DEFAULT NULL,
  `proc_script_name` varchar(32) DEFAULT NULL,
  `proc_script_para` varchar(256) DEFAULT NULL,
  `proc_script_path` varchar(64) DEFAULT NULL,
  `proc_tmpl_name` varchar(32) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `member_name` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `proc_descr` varchar(256) DEFAULT NULL,
  `state` varchar(16) DEFAULT NULL,
  `state_date` datetime DEFAULT NULL,
  `his_date` datetime DEFAULT NULL,
  `team_name` varchar(32) DEFAULT NULL,
  `arch_name` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `graph` longtext,
  `remark` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`his_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_proc_step` */

DROP TABLE IF EXISTS `dacp_meta_proc_step`;

CREATE TABLE `dacp_meta_proc_step` (
  `step_id` varchar(32) NOT NULL,
  `proc_name` varchar(32) NOT NULL,
  `step_seq` int(11) NOT NULL,
  `proc_id` varchar(64) DEFAULT NULL,
  `aftid` varchar(16) DEFAULT NULL,
  `f_step` varchar(16) DEFAULT NULL,
  `n_step` varchar(16) DEFAULT NULL,
  `parent_id` varchar(16) DEFAULT NULL,
  `preid` varchar(16) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `s_step` varchar(16) DEFAULT NULL,
  `sql_text` longtext,
  `step_code` varchar(32) DEFAULT NULL,
  `step_name` varchar(32) DEFAULT NULL,
  `required_props` varchar(1024) DEFAULT NULL,
  `version` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`step_id`),
  UNIQUE KEY `UK2nnibjhv6pawwitx7txrc4k1m` (`proc_name`,`step_seq`),
  KEY `proc_step_index0` (`proc_name`),
  KEY `proc_step_index1` (`proc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_proc_step_alter` */

DROP TABLE IF EXISTS `dacp_meta_proc_step_alter`;

CREATE TABLE `dacp_meta_proc_step_alter` (
  `step_id` varchar(32) NOT NULL,
  `proc_name` varchar(32) NOT NULL,
  `step_seq` int(11) NOT NULL,
  `proc_id` varchar(64) DEFAULT NULL,
  `aftid` varchar(16) DEFAULT NULL,
  `f_step` varchar(16) DEFAULT NULL,
  `n_step` varchar(16) DEFAULT NULL,
  `parent_id` varchar(16) DEFAULT NULL,
  `preid` varchar(16) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `s_step` varchar(16) DEFAULT NULL,
  `sql_text` longtext,
  `step_code` varchar(32) DEFAULT NULL,
  `step_name` varchar(32) DEFAULT NULL,
  `required_props` varchar(1024) DEFAULT NULL,
  `version` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`step_id`),
  UNIQUE KEY `UKmka44qvtyj62utgwvxwjwvhjm` (`proc_name`,`step_seq`),
  KEY `proc_step_index0` (`proc_name`),
  KEY `proc_step_index1` (`proc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_proc_step_his` */

DROP TABLE IF EXISTS `dacp_meta_proc_step_his`;

CREATE TABLE `dacp_meta_proc_step_his` (
  `his_id` varchar(32) NOT NULL,
  `proc_his_id` varchar(32) DEFAULT NULL,
  `step_id` varchar(32) DEFAULT NULL,
  `proc_name` varchar(32) NOT NULL,
  `step_seq` int(11) NOT NULL,
  `proc_id` varchar(64) DEFAULT NULL,
  `aftid` varchar(16) DEFAULT NULL,
  `f_step` varchar(16) DEFAULT NULL,
  `n_step` varchar(16) DEFAULT NULL,
  `parent_id` varchar(16) DEFAULT NULL,
  `preid` varchar(16) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `s_step` varchar(16) DEFAULT NULL,
  `sql_text` longtext,
  `step_code` varchar(32) DEFAULT NULL,
  `step_name` varchar(32) DEFAULT NULL,
  `required_props` varchar(1024) DEFAULT NULL,
  `version` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`his_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_property` */

DROP TABLE IF EXISTS `dacp_meta_property`;

CREATE TABLE `dacp_meta_property` (
  `prop_id` varchar(16) NOT NULL,
  `prop_name` varchar(64) NOT NULL,
  `prop_label` varchar(512) NOT NULL,
  `prop_domain` varchar(16) NOT NULL,
  `prop_topic` varchar(32) DEFAULT NULL,
  `crypt_name` varchar(16) DEFAULT NULL,
  `descr` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`prop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_secret_key` */

DROP TABLE IF EXISTS `dacp_meta_secret_key`;

CREATE TABLE `dacp_meta_secret_key` (
  `key_id` varchar(32) NOT NULL,
  `key_name` varchar(16) NOT NULL,
  `key_label` varchar(128) DEFAULT NULL,
  `private_key` varchar(1024) DEFAULT NULL,
  `public_key` varchar(4096) DEFAULT NULL,
  `key_type` varchar(16) NOT NULL,
  `crypt_name` varchar(16) DEFAULT NULL,
  `tenant_name` varchar(16) DEFAULT NULL,
  `eff_time` datetime DEFAULT NULL,
  `exp_time` datetime NOT NULL,
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `UK_rpbds49e77gu5leg41r82ve9q` (`key_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_std` */

DROP TABLE IF EXISTS `dacp_meta_std`;

CREATE TABLE `dacp_meta_std` (
  `std_id` varchar(32) NOT NULL,
  `std_name` varchar(32) NOT NULL,
  `std_sn` varchar(16) DEFAULT NULL,
  `std_label` varchar(64) DEFAULT NULL,
  `std_descr` varchar(512) DEFAULT NULL,
  `std_category` varchar(16) DEFAULT NULL,
  `std_type` varchar(32) DEFAULT NULL,
  `arch_name` varchar(64) DEFAULT NULL,
  `std_sens_lvl` varchar(256) DEFAULT NULL,
  `corela_std_names` varchar(512) DEFAULT NULL,
  `source_system` varchar(128) DEFAULT NULL,
  `respo_dept` varchar(128) DEFAULT NULL,
  `std_basis` varchar(256) DEFAULT NULL,
  `pub_date` datetime DEFAULT NULL,
  `std_version` varchar(16) DEFAULT NULL,
  `creator` varchar(64) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `std_ext_conf` varchar(1024) DEFAULT NULL,
  `state` varchar(8) NOT NULL,
  PRIMARY KEY (`std_id`),
  UNIQUE KEY `UK_hh4613eotw7vbh8ooafr89k95` (`std_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_std_ext` */

DROP TABLE IF EXISTS `dacp_meta_std_ext`;

CREATE TABLE `dacp_meta_std_ext` (
  `std_ext_id` varchar(32) NOT NULL,
  `std_id` varchar(32) DEFAULT NULL,
  `std_name` varchar(32) NOT NULL,
  `std_sn` varchar(16) DEFAULT NULL,
  `std_ext_type` varchar(16) NOT NULL,
  `std_ext_name` varchar(32) DEFAULT NULL,
  `std_ext_val` varchar(128) DEFAULT NULL,
  `std_ext_label` varchar(64) DEFAULT NULL,
  `std_ext_conf` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`std_ext_id`),
  UNIQUE KEY `UK_5e9q65rjawfexmi2tcjtdc2kq` (`std_name`),
  UNIQUE KEY `UK_68xy3djvv6a9d0j2b2lgfgcov` (`std_ext_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_subject` */

DROP TABLE IF EXISTS `dacp_meta_subject`;

CREATE TABLE `dacp_meta_subject` (
  `subject_id` varchar(32) NOT NULL,
  `subject_name` varchar(64) NOT NULL,
  `parent_sub_name` varchar(64) DEFAULT NULL,
  `subject_label` varchar(64) DEFAULT NULL,
  `descr` varchar(256) DEFAULT NULL,
  `subject_type` varchar(16) NOT NULL,
  `subject_ext_conf` varchar(512) DEFAULT NULL,
  `subject_seq` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `UK_ijq8atepmmclur8awh177o9ly` (`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_system_design` */

DROP TABLE IF EXISTS `dacp_meta_system_design`;

CREATE TABLE `dacp_meta_system_design` (
  `design_id` varchar(32) NOT NULL,
  `design_name` varchar(32) NOT NULL,
  `label` varchar(32) NOT NULL,
  `descr` varchar(32) NOT NULL,
  `design_graph` longtext,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`design_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tab` */

DROP TABLE IF EXISTS `dacp_meta_tab`;

CREATE TABLE `dacp_meta_tab` (
  `tab_id` varchar(32) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_descr` varchar(1024) DEFAULT NULL,
  `ds_name` varchar(32) NOT NULL,
  `logic_tab_name` varchar(128) DEFAULT NULL,
  `tab_sens_lvl` varchar(1) DEFAULT NULL,
  `mask_type` varchar(16) DEFAULT NULL,
  `lvl` varchar(32) DEFAULT NULL,
  `topic` varchar(256) DEFAULT NULL,
  `cycle_type` varchar(8) DEFAULT NULL,
  `tab_schema` varchar(32) DEFAULT NULL,
  `tab_space` varchar(16) DEFAULT NULL,
  `tab_sn` varchar(16) DEFAULT NULL,
  `version` varchar(16) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `member_name` varchar(32) DEFAULT NULL,
  `open_state` varchar(8) DEFAULT NULL,
  `asset_sn` varchar(32) DEFAULT NULL,
  `extend_items` varchar(512) DEFAULT NULL,
  `busi_caliber` varchar(512) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `lastupd` datetime DEFAULT NULL,
  `create_user` varchar(16) DEFAULT NULL,
  `lastupd_user` varchar(16) DEFAULT NULL,
  `state` varchar(16) NOT NULL,
  PRIMARY KEY (`tab_id`),
  UNIQUE KEY `metatab_index1` (`tab_name`,`ds_name`),
  KEY `metatab_index2` (`team_name`),
  KEY `metatab_index0` (`ds_name`),
  KEY `idx_mtab_001` (`ds_name`,`tab_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tab_alter` */

DROP TABLE IF EXISTS `dacp_meta_tab_alter`;

CREATE TABLE `dacp_meta_tab_alter` (
  `tab_id` varchar(32) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `tab_schema` varchar(32) DEFAULT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_descr` varchar(1024) DEFAULT NULL,
  `tab_sens_lvl` varchar(1) DEFAULT NULL,
  `mask_type` varchar(16) DEFAULT NULL,
  `lvl` varchar(32) DEFAULT NULL,
  `topic` varchar(32) DEFAULT NULL,
  `cycle_type` varchar(8) DEFAULT NULL,
  `tab_space` varchar(16) DEFAULT NULL,
  `logic_tab_name` varchar(128) DEFAULT NULL,
  `tab_sn` varchar(16) DEFAULT NULL,
  `ds_name` varchar(32) NOT NULL,
  `version` varchar(16) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `member_name` varchar(32) DEFAULT NULL,
  `open_state` varchar(8) DEFAULT NULL,
  `asset_sn` varchar(32) DEFAULT NULL,
  `extend_items` varchar(512) DEFAULT NULL,
  `busi_caliber` varchar(512) DEFAULT NULL,
  `state` varchar(16) NOT NULL,
  PRIMARY KEY (`tab_id`),
  KEY `metatabalter_index0` (`ds_name`),
  KEY `metatabalter_index1` (`tab_name`,`ds_name`),
  KEY `metatabalter_index2` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tab_bak` */

DROP TABLE IF EXISTS `dacp_meta_tab_bak`;

CREATE TABLE `dacp_meta_tab_bak` (
  `tab_id` varchar(32) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_descr` varchar(1024) DEFAULT NULL,
  `ds_name` varchar(32) NOT NULL,
  `logic_tab_name` varchar(128) DEFAULT NULL,
  `tab_sens_lvl` varchar(1) DEFAULT NULL,
  `mask_type` varchar(16) DEFAULT NULL,
  `lvl` varchar(32) DEFAULT NULL,
  `topic` varchar(256) DEFAULT NULL,
  `cycle_type` varchar(8) DEFAULT NULL,
  `tab_schema` varchar(32) DEFAULT NULL,
  `tab_space` varchar(16) DEFAULT NULL,
  `tab_sn` varchar(16) DEFAULT NULL,
  `version` varchar(16) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `member_name` varchar(32) DEFAULT NULL,
  `open_state` varchar(8) DEFAULT NULL,
  `asset_sn` varchar(32) DEFAULT NULL,
  `extend_items` varchar(512) DEFAULT NULL,
  `busi_caliber` varchar(512) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `lastupd` datetime DEFAULT NULL,
  `create_user` varchar(16) DEFAULT NULL,
  `lastupd_user` varchar(16) DEFAULT NULL,
  `state` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tab_field` */

DROP TABLE IF EXISTS `dacp_meta_tab_field`;

CREATE TABLE `dacp_meta_tab_field` (
  `field_id` varchar(32) NOT NULL,
  `field_name` varchar(64) NOT NULL,
  `tab_id` varchar(32) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `tab_sn` varchar(64) DEFAULT NULL,
  `field_label` varchar(256) DEFAULT NULL,
  `field_descr` varchar(2048) DEFAULT NULL,
  `data_type` varchar(30) NOT NULL,
  `length` int(11) DEFAULT NULL,
  `precision_val` int(11) DEFAULT NULL,
  `scale` int(11) DEFAULT NULL,
  `isnullable` varchar(1) DEFAULT NULL,
  `field_posi` int(11) DEFAULT NULL,
  `std_name` varchar(32) DEFAULT NULL,
  `def_value` varchar(64) DEFAULT NULL,
  `primary_key` varchar(1) DEFAULT NULL,
  `partition_key` varchar(1) DEFAULT NULL,
  `distributed_key` varchar(1) DEFAULT NULL,
  `distribute_num` int(11) DEFAULT NULL,
  `distribute_sort_key` varchar(1) DEFAULT NULL,
  `field_sens_lvl` varchar(16) DEFAULT NULL,
  `mask_type` varchar(16) DEFAULT NULL,
  `mask_rule` varchar(16) DEFAULT NULL,
  `sampling` varchar(128) DEFAULT NULL,
  `segment_seq` varchar(1) DEFAULT NULL,
  `asset_sn` varchar(16) DEFAULT NULL,
  `busi_caliber` varchar(512) DEFAULT NULL,
  `extend_items` varchar(512) DEFAULT NULL,
  `summary` text,
  PRIMARY KEY (`field_id`),
  KEY `metatabfield_index0` (`tab_id`),
  KEY `metatabfield_index1` (`std_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tab_field_alter` */

DROP TABLE IF EXISTS `dacp_meta_tab_field_alter`;

CREATE TABLE `dacp_meta_tab_field_alter` (
  `field_id` varchar(64) NOT NULL,
  `field_name` varchar(64) NOT NULL,
  `tab_id` varchar(64) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `tab_sn` varchar(64) DEFAULT NULL,
  `field_label` varchar(256) DEFAULT NULL,
  `field_descr` varchar(512) DEFAULT NULL,
  `data_type` varchar(30) NOT NULL,
  `length` int(11) DEFAULT NULL,
  `precision_val` int(11) DEFAULT NULL,
  `scale` int(11) DEFAULT NULL,
  `isnullable` varchar(1) DEFAULT NULL,
  `field_posi` int(11) DEFAULT NULL,
  `def_value` varchar(64) DEFAULT NULL,
  `primary_key` varchar(1) DEFAULT NULL,
  `partition_key` varchar(1) DEFAULT NULL,
  `distributed_key` varchar(1) DEFAULT NULL,
  `distribute_num` int(11) DEFAULT NULL,
  `distribute_sort_key` varchar(1) DEFAULT NULL,
  `field_sens_lvl` varchar(16) DEFAULT NULL,
  `mask_type` varchar(16) DEFAULT NULL,
  `mask_rule` varchar(16) DEFAULT NULL,
  `sampling` varchar(128) DEFAULT NULL,
  `std_name` varchar(32) DEFAULT NULL,
  `segment_seq` varchar(1) DEFAULT NULL,
  `asset_sn` varchar(16) DEFAULT NULL,
  `busi_caliber` varchar(512) DEFAULT NULL,
  `summary` text,
  PRIMARY KEY (`field_id`),
  KEY `metatabfieldalter_index0` (`tab_id`),
  KEY `metatabfieldalter_index1` (`std_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tab_field_his` */

DROP TABLE IF EXISTS `dacp_meta_tab_field_his`;

CREATE TABLE `dacp_meta_tab_field_his` (
  `his_id` varchar(64) NOT NULL,
  `field_id` varchar(64) NOT NULL,
  `field_name` varchar(64) NOT NULL,
  `table_his_id` varchar(64) NOT NULL,
  `tab_id` varchar(64) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `tab_sn` varchar(64) DEFAULT NULL,
  `field_label` varchar(256) DEFAULT NULL,
  `field_descr` varchar(512) DEFAULT NULL,
  `data_type` varchar(30) NOT NULL,
  `length` int(11) DEFAULT NULL,
  `precision_val` int(11) DEFAULT NULL,
  `scale` int(11) DEFAULT NULL,
  `isnullable` varchar(1) DEFAULT NULL,
  `field_posi` int(11) DEFAULT NULL,
  `def_value` varchar(64) DEFAULT NULL,
  `primary_key` varchar(1) DEFAULT NULL,
  `partition_key` varchar(1) DEFAULT NULL,
  `distributed_key` varchar(1) DEFAULT NULL,
  `distribute_num` int(11) DEFAULT NULL,
  `distribute_sort_key` varchar(1) DEFAULT NULL,
  `field_sens_lvl` varchar(1) DEFAULT NULL,
  `mask_type` varchar(16) DEFAULT NULL,
  `mask_rule` varchar(16) DEFAULT NULL,
  `sampling` varchar(128) DEFAULT NULL,
  `std_name` varchar(32) DEFAULT NULL,
  `segment_seq` varchar(1) DEFAULT NULL,
  `asset_sn` varchar(16) DEFAULT NULL,
  `busi_caliber` varchar(512) DEFAULT NULL,
  `summary` text,
  PRIMARY KEY (`his_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tab_field_priv` */

DROP TABLE IF EXISTS `dacp_meta_tab_field_priv`;

CREATE TABLE `dacp_meta_tab_field_priv` (
  `id` varchar(32) NOT NULL,
  `tab_id` varchar(32) NOT NULL,
  `field_id` varchar(64) NOT NULL,
  `tenant_group_id` varchar(32) DEFAULT NULL,
  `field_sens_lvl` varchar(20) DEFAULT NULL,
  `mask_type` varchar(8) DEFAULT NULL,
  `mask_rule` varchar(16) DEFAULT NULL,
  `isAccess` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tab_his` */

DROP TABLE IF EXISTS `dacp_meta_tab_his`;

CREATE TABLE `dacp_meta_tab_his` (
  `his_id` varchar(32) NOT NULL,
  `tab_id` varchar(32) NOT NULL,
  `tab_name` varchar(64) NOT NULL,
  `tab_schema` varchar(32) DEFAULT NULL,
  `tab_label` varchar(512) DEFAULT NULL,
  `tab_descr` varchar(1024) DEFAULT NULL,
  `tab_sens_lvl` varchar(1) DEFAULT NULL,
  `mask_type` varchar(16) DEFAULT NULL,
  `lvl` varchar(32) DEFAULT NULL,
  `topic` varchar(32) DEFAULT NULL,
  `cycle_type` varchar(8) DEFAULT NULL,
  `tab_space` varchar(16) DEFAULT NULL,
  `logic_tab_name` varchar(128) DEFAULT NULL,
  `tab_sn` varchar(16) DEFAULT NULL,
  `ds_name` varchar(32) NOT NULL,
  `version` varchar(16) DEFAULT NULL,
  `team_name` varchar(64) DEFAULT NULL,
  `member_name` varchar(32) DEFAULT NULL,
  `open_state` varchar(8) DEFAULT NULL,
  `asset_sn` varchar(32) DEFAULT NULL,
  `extend_items` varchar(512) DEFAULT NULL,
  `busi_caliber` varchar(512) DEFAULT NULL,
  `state` varchar(16) NOT NULL,
  `his_dt` datetime DEFAULT NULL,
  `his_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`his_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tab_inst` */

DROP TABLE IF EXISTS `dacp_meta_tab_inst`;

CREATE TABLE `dacp_meta_tab_inst` (
  `inst_tab_id` varchar(255) NOT NULL,
  `tab_id` varchar(255) DEFAULT NULL,
  `tab_name` varchar(255) DEFAULT NULL,
  `tab_schema` varchar(255) DEFAULT NULL,
  `tab_space` varchar(255) DEFAULT NULL,
  `ds_id` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `drop_date` date DEFAULT NULL,
  `eff_date` date DEFAULT NULL,
  `inst_tab_name` varchar(255) DEFAULT NULL,
  `task_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`inst_tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tab_priv` */

DROP TABLE IF EXISTS `dacp_meta_tab_priv`;

CREATE TABLE `dacp_meta_tab_priv` (
  `priv_id` varchar(32) NOT NULL,
  `tab_id` varchar(32) NOT NULL,
  `tenant_id` varchar(64) DEFAULT NULL,
  `sens_lvl` varchar(1) NOT NULL,
  `can_read` varchar(1) NOT NULL,
  `can_Write` varchar(1) NOT NULL,
  PRIMARY KEY (`priv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tab_stat` */

DROP TABLE IF EXISTS `dacp_meta_tab_stat`;

CREATE TABLE `dacp_meta_tab_stat` (
  `tab_id` varchar(255) NOT NULL,
  `ds_id` varchar(255) DEFAULT NULL,
  `inst_tab_cnt` varchar(255) DEFAULT NULL,
  `used_cnt` varchar(255) DEFAULT NULL,
  `tab_size` varchar(255) DEFAULT NULL,
  `storage_rule_json` varchar(255) DEFAULT NULL,
  `storage_result_state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tab_stat_log` */

DROP TABLE IF EXISTS `dacp_meta_tab_stat_log`;

CREATE TABLE `dacp_meta_tab_stat_log` (
  `ext_id` varchar(32) NOT NULL,
  `ds_id` varchar(32) NOT NULL,
  `field_num` int(11) DEFAULT NULL,
  `op_time` varchar(8) NOT NULL,
  `tab_capacity` bigint(20) DEFAULT NULL,
  `tab_inst_cnt` int(11) DEFAULT NULL,
  `tab_name` varchar(128) NOT NULL,
  `tab_rows` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tag` */

DROP TABLE IF EXISTS `dacp_meta_tag`;

CREATE TABLE `dacp_meta_tag` (
  `tag_id` varchar(32) NOT NULL,
  `tag_descr` varchar(512) DEFAULT NULL,
  `tag_label` varchar(64) DEFAULT NULL,
  `tag_name` varchar(32) DEFAULT NULL,
  `cycle_type` varchar(8) DEFAULT NULL,
  `tag_category` varchar(255) DEFAULT NULL,
  `arch_name` varchar(32) DEFAULT NULL,
  `parent_tag_name` varchar(32) DEFAULT NULL,
  `tag_type` varchar(16) DEFAULT NULL,
  `tag_unit` varchar(16) DEFAULT NULL,
  `ds_name` varchar(32) DEFAULT NULL,
  `tag_test_choice` varchar(32) DEFAULT NULL,
  `tag_accurate_rate` varchar(255) DEFAULT NULL,
  `tag_cover_rate` varchar(255) DEFAULT NULL,
  `tag_trans_rule` varchar(255) DEFAULT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  `where_condition` varchar(255) DEFAULT NULL,
  `src_ds_name` varchar(32) DEFAULT NULL,
  `src_tab_name` varchar(32) DEFAULT NULL,
  `src_tab_field_name` varchar(32) DEFAULT NULL,
  `src_tab_is_vertical` varchar(8) DEFAULT NULL,
  `dim_ds_name` varchar(32) DEFAULT NULL,
  `dim_tab_name` varchar(32) DEFAULT NULL,
  `dim_tab_field_key` varchar(32) DEFAULT NULL,
  `dim_tab_field_value` varchar(32) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `lastupd` datetime DEFAULT NULL,
  `tag_publisher` varchar(255) DEFAULT NULL,
  `publish_dt` datetime DEFAULT NULL,
  `tag_ext_conf` varchar(1024) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `UK_7irtu9xwh7rwtcukaoqsqth8o` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_team` */

DROP TABLE IF EXISTS `dacp_meta_team`;

CREATE TABLE `dacp_meta_team` (
  `team_id` varchar(32) NOT NULL,
  `team_name` varchar(32) NOT NULL,
  `parent_team_name` varchar(32) DEFAULT NULL,
  `label` varchar(512) DEFAULT NULL,
  `descr` varchar(1024) DEFAULT NULL,
  `logo` varchar(512) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `sign_key` varchar(32) DEFAULT NULL,
  `arch_name` varchar(32) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `UK_pyaleapufxp2krcpq9khd8377` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_team_ds_map` */

DROP TABLE IF EXISTS `dacp_meta_team_ds_map`;

CREATE TABLE `dacp_meta_team_ds_map` (
  `ds_name` varchar(32) NOT NULL,
  `team_name` varchar(32) NOT NULL,
  PRIMARY KEY (`ds_name`,`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_team_member` */

DROP TABLE IF EXISTS `dacp_meta_team_member`;

CREATE TABLE `dacp_meta_team_member` (
  `member_id` varchar(32) NOT NULL,
  `member_name` varchar(64) NOT NULL,
  `descr` varchar(256) DEFAULT NULL,
  `team_name` varchar(32) NOT NULL,
  `tenant_name` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `is_default` varchar(1) DEFAULT NULL,
  `role_name` varchar(32) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `UK5954115umomsroh1r7eu84u87` (`team_name`,`user_id`),
  UNIQUE KEY `UK_p978d3i08vew0vy9tlj75fr7i` (`member_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_team_member_role` */

DROP TABLE IF EXISTS `dacp_meta_team_member_role`;

CREATE TABLE `dacp_meta_team_member_role` (
  `tm_role_id` varchar(16) NOT NULL,
  `tm_role_name` varchar(32) DEFAULT NULL,
  `tm_role_label` varchar(64) DEFAULT NULL,
  `tm_role_descr` varchar(256) DEFAULT NULL,
  `team_name` varchar(32) DEFAULT NULL,
  `has_read` varchar(1) DEFAULT NULL,
  `has_write` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`tm_role_id`),
  UNIQUE KEY `UK_n7lernii5h5xfh1ylbn2ok49a` (`tm_role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tenant` */

DROP TABLE IF EXISTS `dacp_meta_tenant`;

CREATE TABLE `dacp_meta_tenant` (
  `tenant_id` varchar(32) NOT NULL,
  `tenant_name` varchar(32) NOT NULL,
  `tenant_label` varchar(64) DEFAULT NULL,
  `tenant_descr` varchar(128) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `tenant_state` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`tenant_id`),
  UNIQUE KEY `UK_lbhysrv7rebtlm1t9xuh65o8e` (`tenant_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tenant_ds` */

DROP TABLE IF EXISTS `dacp_meta_tenant_ds`;

CREATE TABLE `dacp_meta_tenant_ds` (
  `rela_id` varchar(32) NOT NULL,
  `ds_name` varchar(32) NOT NULL,
  `tenant_name` varchar(32) NOT NULL,
  `ds_acct` varchar(64) DEFAULT NULL,
  `ds_auth` varchar(256) DEFAULT NULL,
  `ds_auth_type` varchar(16) DEFAULT NULL,
  `ds_conf` varchar(1024) DEFAULT NULL,
  `dev_ds_acct` varchar(64) DEFAULT NULL,
  `dev_ds_auth` varchar(256) DEFAULT NULL,
  `dev_ds_auth_type` varchar(16) DEFAULT NULL,
  `dev_ds_conf` varchar(1024) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`rela_id`),
  UNIQUE KEY `UK4qnxffs8urc50b951fl61olci` (`ds_name`,`tenant_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_tip` */

DROP TABLE IF EXISTS `dacp_meta_tip`;

CREATE TABLE `dacp_meta_tip` (
  `id` varchar(32) NOT NULL,
  `eff_date` datetime DEFAULT NULL,
  `mail_tip` varchar(3) DEFAULT NULL,
  `msg` varchar(768) DEFAULT NULL,
  `sms_tip` varchar(3) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL,
  `tip_seq` varchar(96) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `username` varchar(360) DEFAULT NULL,
  `web_tip` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_user` */

DROP TABLE IF EXISTS `dacp_meta_user`;

CREATE TABLE `dacp_meta_user` (
  `user_id` varchar(32) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `user_pwd` varchar(256) NOT NULL,
  `group_id` varchar(16) NOT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `user_type` varchar(16) DEFAULT NULL,
  `user_face` varchar(1024) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_meta_user_bak` */

DROP TABLE IF EXISTS `dacp_meta_user_bak`;

CREATE TABLE `dacp_meta_user_bak` (
  `user_id` varchar(32) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `user_pwd` varchar(256) NOT NULL,
  `group_id` varchar(16) NOT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `user_type` varchar(16) DEFAULT NULL,
  `user_face` varchar(1024) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_metaobj_convert_rule` */

DROP TABLE IF EXISTS `dacp_metaobj_convert_rule`;

CREATE TABLE `dacp_metaobj_convert_rule` (
  `id` varchar(32) NOT NULL,
  `rule_name` varchar(64) NOT NULL,
  `rule_express` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_metaobj_convert_scope` */

DROP TABLE IF EXISTS `dacp_metaobj_convert_scope`;

CREATE TABLE `dacp_metaobj_convert_scope` (
  `id` varchar(32) NOT NULL,
  `scope_name` varchar(64) NOT NULL,
  `scope_code` varchar(64) NOT NULL,
  `scope_list` varchar(256) DEFAULT NULL,
  `match_type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_offline_query` */

DROP TABLE IF EXISTS `dacp_offline_query`;

CREATE TABLE `dacp_offline_query` (
  `id` varchar(255) NOT NULL,
  `dbname` varchar(255) DEFAULT NULL,
  `end_dt` datetime DEFAULT NULL,
  `log_text` varchar(255) DEFAULT NULL,
  `query_name` varchar(255) DEFAULT NULL,
  `runenv` varchar(255) DEFAULT NULL,
  `sql_text` varchar(255) DEFAULT NULL,
  `start_dt` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `submit_dt` datetime DEFAULT NULL,
  `submit_person` varchar(255) DEFAULT NULL,
  `submit_team` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_offline_query_detail` */

DROP TABLE IF EXISTS `dacp_offline_query_detail`;

CREATE TABLE `dacp_offline_query_detail` (
  `id` varchar(255) NOT NULL,
  `datafile_path` varchar(255) DEFAULT NULL,
  `end_dt` datetime DEFAULT NULL,
  `log_text` varchar(255) DEFAULT NULL,
  `query_id` varchar(255) DEFAULT NULL,
  `sno` varchar(255) DEFAULT NULL,
  `sql_text` varchar(255) DEFAULT NULL,
  `start_dt` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_orm_id_gen` */

DROP TABLE IF EXISTS `dacp_orm_id_gen`;

CREATE TABLE `dacp_orm_id_gen` (
  `segment_name` varchar(255) NOT NULL,
  `next` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`segment_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_orm_jpa_gen` */

DROP TABLE IF EXISTS `dacp_orm_jpa_gen`;

CREATE TABLE `dacp_orm_jpa_gen` (
  `segment_name` varchar(255) NOT NULL,
  `next` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`segment_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_qrtz_blob_triggers` */

DROP TABLE IF EXISTS `dacp_qrtz_blob_triggers`;

CREATE TABLE `dacp_qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `dacp_qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `dacp_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_qrtz_calendars` */

DROP TABLE IF EXISTS `dacp_qrtz_calendars`;

CREATE TABLE `dacp_qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_qrtz_cron_triggers` */

DROP TABLE IF EXISTS `dacp_qrtz_cron_triggers`;

CREATE TABLE `dacp_qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `dacp_qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `dacp_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_qrtz_fired_triggers` */

DROP TABLE IF EXISTS `dacp_qrtz_fired_triggers`;

CREATE TABLE `dacp_qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_qrtz_job_details` */

DROP TABLE IF EXISTS `dacp_qrtz_job_details`;

CREATE TABLE `dacp_qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_qrtz_locks` */

DROP TABLE IF EXISTS `dacp_qrtz_locks`;

CREATE TABLE `dacp_qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `dacp_qrtz_paused_trigger_grps`;

CREATE TABLE `dacp_qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_qrtz_scheduler_state` */

DROP TABLE IF EXISTS `dacp_qrtz_scheduler_state`;

CREATE TABLE `dacp_qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_qrtz_simple_triggers` */

DROP TABLE IF EXISTS `dacp_qrtz_simple_triggers`;

CREATE TABLE `dacp_qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `dacp_qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `dacp_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `dacp_qrtz_simprop_triggers`;

CREATE TABLE `dacp_qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `dacp_qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `dacp_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_qrtz_triggers` */

DROP TABLE IF EXISTS `dacp_qrtz_triggers`;

CREATE TABLE `dacp_qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `dacp_qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `dacp_qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_quartzx_job_log` */

DROP TABLE IF EXISTS `dacp_quartzx_job_log`;

CREATE TABLE `dacp_quartzx_job_log` (
  `job_name` varchar(64) NOT NULL,
  `job_group` varchar(32) NOT NULL,
  `job_status` varchar(8) NOT NULL,
  `job_class_name` varchar(128) NOT NULL,
  `cron_expr` varchar(32) NOT NULL,
  `descr` varchar(256) NOT NULL,
  `command` varchar(256) DEFAULT NULL,
  `script` varchar(2048) DEFAULT NULL,
  `class_name` varchar(128) DEFAULT NULL,
  `method_name` varchar(64) DEFAULT NULL,
  `method_params` varchar(2048) DEFAULT NULL,
  `result_body` varchar(1024) DEFAULT NULL,
  `create_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_role_menu_map` */

DROP TABLE IF EXISTS `dacp_role_menu_map`;

CREATE TABLE `dacp_role_menu_map` (
  `menu_id` varchar(32) NOT NULL,
  `role_id` varchar(16) NOT NULL,
  PRIMARY KEY (`menu_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_trace_log` */

DROP TABLE IF EXISTS `dacp_trace_log`;

CREATE TABLE `dacp_trace_log` (
  `user_id` varchar(16) NOT NULL,
  `ip_addr` varchar(32) DEFAULT NULL,
  `uri` varchar(128) DEFAULT NULL,
  `req_method` varchar(16) DEFAULT NULL,
  `req_params` varchar(256) DEFAULT NULL,
  `resp_header` varchar(128) DEFAULT NULL,
  `resp_header_len` int(11) DEFAULT NULL,
  `resp_body` varchar(1024) DEFAULT NULL,
  `resp_body_len` int(11) DEFAULT NULL,
  `resp_cont_type` varchar(64) DEFAULT NULL,
  `resp_time` int(11) DEFAULT NULL,
  `create_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `referer` varchar(128) DEFAULT NULL,
  `serv_host` varchar(32) DEFAULT NULL,
  `user_agent` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_user_group` */

DROP TABLE IF EXISTS `dacp_user_group`;

CREATE TABLE `dacp_user_group` (
  `group_id` varchar(16) NOT NULL,
  `group_name` varchar(64) NOT NULL,
  `group_descr` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_user_role` */

DROP TABLE IF EXISTS `dacp_user_role`;

CREATE TABLE `dacp_user_role` (
  `role_id` varchar(16) NOT NULL,
  `role_name` varchar(64) NOT NULL,
  `role_type` varchar(16) NOT NULL,
  `role_descr` varchar(128) DEFAULT NULL,
  `state` varchar(1) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dacp_user_role_map` */

DROP TABLE IF EXISTS `dacp_user_role_map`;

CREATE TABLE `dacp_user_role_map` (
  `role_id` varchar(16) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dag_app_info` */

DROP TABLE IF EXISTS `dag_app_info`;

CREATE TABLE `dag_app_info` (
  `XMLID` varchar(32) DEFAULT NULL,
  `APP_CODE` varchar(64) DEFAULT NULL,
  `APP_NAME` varchar(512) DEFAULT NULL,
  `APP_DESC` varchar(1024) DEFAULT NULL,
  `APP_URI` varchar(512) DEFAULT NULL,
  `APP_TYPE` varchar(128) DEFAULT NULL,
  `CATEGORY_ID` varchar(128) DEFAULT NULL,
  `CYCLE_TYPE` varchar(16) DEFAULT NULL,
  `TECH_DESC` text,
  `MENU_ID` varchar(256) DEFAULT NULL,
  `IMG` varchar(256) DEFAULT NULL,
  `DBNAME` varchar(128) DEFAULT NULL,
  `SOURCE_TABLE` varchar(512) DEFAULT NULL,
  `SOURCE_PROC` varchar(512) DEFAULT NULL,
  `SOURCE_KPI` varchar(512) DEFAULT NULL,
  `CURDUTYER` varchar(128) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DATA_LAST_UPDATE_TIME` datetime DEFAULT NULL,
  `STATE` varchar(32) DEFAULT NULL,
  `TEAM_CODE` varchar(16) DEFAULT NULL,
  `ONLINE_DATE` date DEFAULT NULL,
  `META_DATE_TIME` date DEFAULT NULL,
  `ds_name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dag_data_zb` */

DROP TABLE IF EXISTS `dag_data_zb`;

CREATE TABLE `dag_data_zb` (
  `KPI_CODE` varchar(32) DEFAULT NULL,
  `OP_TIME` varchar(16) DEFAULT NULL,
  `CYCLE_TYPE` varchar(16) DEFAULT NULL,
  `DIM_CODE` varchar(100) DEFAULT NULL,
  `DIM_VAL` varchar(100) DEFAULT NULL,
  `KPI_VAL` decimal(30,4) DEFAULT NULL,
  `YESTERDAY` decimal(30,6) DEFAULT NULL,
  `LAST_MONTH` decimal(30,6) DEFAULT NULL,
  `LAST_YEAR` decimal(30,6) DEFAULT NULL,
  `DRATE` decimal(10,0) DEFAULT NULL,
  `MRATE` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `dps_team_obj_category` */

DROP TABLE IF EXISTS `dps_team_obj_category`;

CREATE TABLE `dps_team_obj_category` (
  `CATEGORY_CODE` varchar(64) NOT NULL,
  `TEAM_CODE` varchar(32) NOT NULL,
  `CATEGORY_NAME` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `del_state` varchar(1) DEFAULT NULL,
  `ds_name` varchar(16) DEFAULT NULL,
  `OBJ_TYPE` varchar(32) DEFAULT NULL,
  `parentcode` varchar(64) DEFAULT NULL,
  `seq` int(11) NOT NULL,
  PRIMARY KEY (`CATEGORY_CODE`,`TEAM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `kpi_def` */

DROP TABLE IF EXISTS `kpi_def`;

CREATE TABLE `kpi_def` (
  `KPI_CODE` varchar(128) NOT NULL,
  `KPI_NAME` varchar(600) NOT NULL,
  `LOGIC_KPICODE` varchar(128) NOT NULL,
  `KPI_TYPE` varchar(40) NOT NULL,
  `CYCLE` varchar(40) NOT NULL,
  `COMPDIMCODE` varchar(128) NOT NULL,
  `KPI_SCOPE_CODE` varchar(600) DEFAULT NULL,
  `KPI_SQL` longtext,
  `PRIORITY` varchar(40) DEFAULT NULL,
  `STATE` varchar(80) DEFAULT NULL,
  `START_DT` datetime DEFAULT NULL,
  `END_DT` datetime DEFAULT NULL,
  `DBNAME` varchar(160) DEFAULT NULL,
  `KPI_DES` varchar(4000) DEFAULT NULL,
  `REMARK` varchar(2000) DEFAULT NULL,
  `VERSION` varchar(200) DEFAULT NULL,
  `CREATE_USER` varchar(128) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(128) DEFAULT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `TEAM_CODE` varchar(50) DEFAULT NULL,
  `OPEN_STATE` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `kpi_def_bak` */

DROP TABLE IF EXISTS `kpi_def_bak`;

CREATE TABLE `kpi_def_bak` (
  `KPI_CODE` varchar(128) NOT NULL,
  `KPI_NAME` varchar(600) NOT NULL,
  `LOGIC_KPICODE` varchar(128) NOT NULL,
  `KPI_TYPE` varchar(40) NOT NULL,
  `CYCLE` varchar(40) NOT NULL,
  `COMPDIMCODE` varchar(128) NOT NULL,
  `KPI_SCOPE_CODE` varchar(600) DEFAULT NULL,
  `KPI_SQL` longtext,
  `PRIORITY` varchar(40) DEFAULT NULL,
  `STATE` varchar(80) DEFAULT NULL,
  `START_DT` datetime DEFAULT NULL,
  `END_DT` datetime DEFAULT NULL,
  `DBNAME` varchar(160) DEFAULT NULL,
  `KPI_DES` varchar(4000) DEFAULT NULL,
  `REMARK` varchar(2000) DEFAULT NULL,
  `VERSION` varchar(200) DEFAULT NULL,
  `CREATE_USER` varchar(128) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(128) DEFAULT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  `TEAM_CODE` varchar(50) DEFAULT NULL,
  `OPEN_STATE` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meta_team_object` */

DROP TABLE IF EXISTS `meta_team_object`;

CREATE TABLE `meta_team_object` (
  `SEQ_NO` varchar(64) NOT NULL,
  `TEAM_CODE` varchar(32) NOT NULL,
  `XMLID` varchar(100) DEFAULT NULL,
  `OBJTYPE` varchar(32) DEFAULT NULL,
  `OBJNAME` varchar(128) DEFAULT NULL,
  `READ_RIGHT` varchar(8) DEFAULT NULL,
  `WRITE_RIGHT` varchar(8) DEFAULT NULL,
  `APPLY_USER` varchar(64) DEFAULT NULL,
  `APPLY_TIME` datetime DEFAULT NULL,
  `AUDIT_STATUS` varchar(32) NOT NULL,
  `AUDIT_USER` varchar(64) DEFAULT NULL,
  `AUDIT_TIME` datetime DEFAULT NULL,
  `READ_PARA` varchar(128) DEFAULT NULL,
  `CONFINE_PARA` varchar(64) DEFAULT NULL,
  `SOURCE_TEAM_CODE` varchar(50) DEFAULT NULL,
  `SOURCE_DBNAME` varchar(50) DEFAULT NULL,
  `TARGET_DBNAME` varchar(50) DEFAULT NULL,
  `APPLY_STATE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `proc` */

DROP TABLE IF EXISTS `proc`;

CREATE TABLE `proc` (
  `XMLID` varchar(200) NOT NULL,
  `PROC_NAME` varchar(200) DEFAULT NULL,
  `INTERCODE` varchar(20) DEFAULT NULL,
  `PROCCNNAME` varchar(200) DEFAULT NULL,
  `INORFULL` varchar(4) DEFAULT NULL,
  `CYCLETYPE` varchar(60) DEFAULT NULL,
  `TOPICCODE` varchar(60) DEFAULT NULL,
  `TOPICNAME` varchar(60) DEFAULT NULL,
  `STARTDATE` varchar(16) DEFAULT NULL,
  `STARTTIME` varchar(32) DEFAULT NULL,
  `ENDTIME` varchar(32) DEFAULT NULL,
  `PARENTPROC` varchar(32) DEFAULT NULL,
  `REMARK` varchar(4000) DEFAULT NULL,
  `EFF_DATE` varchar(32) DEFAULT NULL,
  `CREATER` varchar(32) DEFAULT NULL,
  `STATE` varchar(32) DEFAULT NULL,
  `STATE_DATE` varchar(32) DEFAULT NULL,
  `PROCTYPE` varchar(32) DEFAULT NULL,
  `PATH` varchar(200) DEFAULT NULL,
  `RUNMODE` varchar(32) DEFAULT NULL,
  `DBUSER` varchar(32) DEFAULT NULL,
  `CURTASKCODE` varchar(32) DEFAULT NULL,
  `DESIGNER` varchar(32) DEFAULT NULL,
  `AUDITER` varchar(32) DEFAULT NULL,
  `DEPLOYER` varchar(32) DEFAULT NULL,
  `RUNPARA` varchar(300) DEFAULT NULL,
  `RUNDURA` varchar(32) DEFAULT NULL,
  `TEAM_CODE` varchar(32) DEFAULT NULL,
  `DEVELOPER` varchar(32) DEFAULT NULL,
  `CURDUTYER` varchar(32) DEFAULT NULL,
  `VERSEQ` int(11) DEFAULT NULL,
  `LEVEL_VAL` varchar(32) DEFAULT NULL,
  `APPTYPE` varchar(32) DEFAULT NULL,
  `DBNAME` varchar(32) DEFAULT NULL,
  `EXTEND_CFG` varchar(2048) DEFAULT NULL,
  `AREACODE` varchar(16) DEFAULT NULL,
  `XML` longtext,
  `IMPORTANCE` varchar(100) DEFAULT NULL,
  `TIME_LIMIT` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`XMLID`),
  KEY `PROC_PROC_NAME_INDEX` (`PROC_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `proc_bak` */

DROP TABLE IF EXISTS `proc_bak`;

CREATE TABLE `proc_bak` (
  `XMLID` varchar(200) NOT NULL,
  `PROC_NAME` varchar(200) DEFAULT NULL,
  `INTERCODE` varchar(20) DEFAULT NULL,
  `PROCCNNAME` varchar(200) DEFAULT NULL,
  `INORFULL` varchar(4) DEFAULT NULL,
  `CYCLETYPE` varchar(60) DEFAULT NULL,
  `TOPICCODE` varchar(60) DEFAULT NULL,
  `TOPICNAME` varchar(60) DEFAULT NULL,
  `STARTDATE` varchar(16) DEFAULT NULL,
  `STARTTIME` varchar(32) DEFAULT NULL,
  `ENDTIME` varchar(32) DEFAULT NULL,
  `PARENTPROC` varchar(32) DEFAULT NULL,
  `REMARK` varchar(4000) DEFAULT NULL,
  `EFF_DATE` varchar(32) DEFAULT NULL,
  `CREATER` varchar(32) DEFAULT NULL,
  `STATE` varchar(32) DEFAULT NULL,
  `STATE_DATE` varchar(32) DEFAULT NULL,
  `PROCTYPE` varchar(32) DEFAULT NULL,
  `PATH` varchar(200) DEFAULT NULL,
  `RUNMODE` varchar(32) DEFAULT NULL,
  `DBUSER` varchar(32) DEFAULT NULL,
  `CURTASKCODE` varchar(32) DEFAULT NULL,
  `DESIGNER` varchar(32) DEFAULT NULL,
  `AUDITER` varchar(32) DEFAULT NULL,
  `DEPLOYER` varchar(32) DEFAULT NULL,
  `RUNPARA` varchar(300) DEFAULT NULL,
  `RUNDURA` varchar(32) DEFAULT NULL,
  `TEAM_CODE` varchar(32) DEFAULT NULL,
  `DEVELOPER` varchar(32) DEFAULT NULL,
  `CURDUTYER` varchar(32) DEFAULT NULL,
  `VERSEQ` int(11) DEFAULT NULL,
  `LEVEL_VAL` varchar(32) DEFAULT NULL,
  `APPTYPE` varchar(32) DEFAULT NULL,
  `DBNAME` varchar(32) DEFAULT NULL,
  `EXTEND_CFG` varchar(2048) DEFAULT NULL,
  `AREACODE` varchar(16) DEFAULT NULL,
  `XML` longtext,
  `IMPORTANCE` varchar(100) DEFAULT NULL,
  `TIME_LIMIT` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `proc_check_code` */

DROP TABLE IF EXISTS `proc_check_code`;

CREATE TABLE `proc_check_code` (
  `xmlid` varchar(32) NOT NULL,
  `check_code` varchar(32) NOT NULL,
  PRIMARY KEY (`xmlid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `proc_func_def_java` */

DROP TABLE IF EXISTS `proc_func_def_java`;

CREATE TABLE `proc_func_def_java` (
  `FUNC_CODE` varchar(864) DEFAULT NULL,
  `FUNC_ID` int(10) DEFAULT NULL,
  `FUNC_TYPE` varchar(540) DEFAULT NULL,
  `FUN_ORDSEQ` varchar(216) DEFAULT NULL,
  `FUNC_ICON` varchar(864) DEFAULT NULL,
  `SQL_DEF` text,
  `DLL_DEF` varchar(1024) DEFAULT NULL,
  `DLL_FUNC` varchar(1024) DEFAULT NULL,
  `SHELL_NAME` varchar(1024) DEFAULT NULL,
  `MEMO` varchar(5400) DEFAULT NULL,
  `FUNC_NAME` varchar(5400) DEFAULT NULL,
  `APPLY` varchar(1728) DEFAULT NULL,
  `REMARK` varchar(3456) DEFAULT NULL,
  `SKIP_FLAG` varchar(108) DEFAULT NULL,
  `CFGJSON` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `proc_func_def_para` */

DROP TABLE IF EXISTS `proc_func_def_para`;

CREATE TABLE `proc_func_def_para` (
  `FUNC_CODE` varchar(512) DEFAULT NULL,
  `PARA_IN_OUT` varchar(512) DEFAULT NULL,
  `PARA_NAME` varchar(512) DEFAULT NULL,
  `PARA_CNNAME` varchar(512) DEFAULT NULL,
  `INPUTTYPE` varchar(512) DEFAULT NULL,
  `INPUTPARA` varchar(512) DEFAULT NULL,
  `ISNULL` varchar(18) DEFAULT NULL,
  `SELVAL` varchar(512) DEFAULT NULL,
  `SELMODEL` varchar(512) DEFAULT NULL,
  `PARA_SEQ` int(11) DEFAULT NULL,
  `REMARK` varchar(512) DEFAULT NULL,
  `TABSHEET` varchar(512) DEFAULT NULL,
  `INPUT_STYLE` varchar(512) DEFAULT NULL,
  `DEPENDENCIES` varchar(512) DEFAULT NULL,
  `CHECKITEMS` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `proc_global_val` */

DROP TABLE IF EXISTS `proc_global_val`;

CREATE TABLE `proc_global_val` (
  `VAR_NAME` varchar(750) DEFAULT NULL,
  `VAR_TYPE` varchar(30) DEFAULT NULL,
  `SQL_DEF` text,
  `DLL_DEF` varchar(750) DEFAULT NULL,
  `SHELL_NAME` varchar(750) DEFAULT NULL,
  `MEMO` varchar(750) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `proc_step` */

DROP TABLE IF EXISTS `proc_step`;

CREATE TABLE `proc_step` (
  `proc_name` varchar(765) DEFAULT NULL,
  `step_seq` int(11) DEFAULT NULL,
  `aftid` varchar(384) DEFAULT NULL,
  `areacode` varchar(18) DEFAULT NULL,
  `dbname` varchar(96) DEFAULT NULL,
  `f_step` int(11) DEFAULT NULL,
  `n_step` int(11) DEFAULT NULL,
  `parent_id` varchar(60) DEFAULT NULL,
  `parnet_id` varchar(24) DEFAULT NULL,
  `preid` varchar(384) DEFAULT NULL,
  `remark` varchar(768) DEFAULT NULL,
  `s_step` int(11) DEFAULT NULL,
  `sql_text` text,
  `step_code` varchar(120) DEFAULT NULL,
  `step_name` varchar(768) DEFAULT NULL,
  `step_type` int(11) DEFAULT NULL,
  `verseq` varchar(192) DEFAULT NULL,
  `xmlid` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
