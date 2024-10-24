/*
 Navicat Premium Data Transfer

 Source Server         : mysql8
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : chemical

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 24/10/2024 21:59:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for chemical_result_access
-- ----------------------------
DROP TABLE IF EXISTS `chemical_result_access`;
CREATE TABLE `chemical_result_access`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'ID号',
  `sample` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样品号',
  `mad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Mad',
  `aad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Aad',
  `ad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Ad',
  `vad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Vad',
  `vd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Vd',
  `vdaf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Vdaf',
  `fcad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'FCad',
  `sad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Sad',
  `h2o` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'H2O',
  `qd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Qd',
  `qn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Qn',
  `zn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Zn',
  `tfe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'TFe',
  `c` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'C',
  `room_no` int NULL DEFAULT NULL COMMENT '室编号',
  `granularity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '粒度',
  `grind_ability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '可磨性',
  `material_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '物料名称',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `push_status` tinyint NULL DEFAULT NULL COMMENT '推送状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chemical_result_access
-- ----------------------------
INSERT INTO `chemical_result_access` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, '1', '1', '1', '', NULL, 'admin', '2024-10-24 21:08:51', NULL, 0);

-- ----------------------------
-- Table structure for chemical_result_access_avg
-- ----------------------------
DROP TABLE IF EXISTS `chemical_result_access_avg`;
CREATE TABLE `chemical_result_access_avg`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'ID号',
  `sample` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样品号',
  `mad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Mad',
  `aad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Aad',
  `ad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Ad',
  `vad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Vad',
  `vd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Vd',
  `vdaf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Vdaf',
  `fcad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'FCad',
  `sad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Sad',
  `h2o` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'H2O',
  `qd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Qd',
  `qn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Qn',
  `zn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Zn',
  `tfe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'TFe',
  `c` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'C',
  `room_no` int NULL DEFAULT NULL COMMENT '室编号',
  `granularity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '粒度',
  `grind_ability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '可磨性',
  `material_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '物料名称',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `origin_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chemical_result_access_avg
-- ----------------------------
INSERT INTO `chemical_result_access_avg` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, '1', '1', '1', '', NULL, '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for chemical_result_txt
-- ----------------------------
DROP TABLE IF EXISTS `chemical_result_txt`;
CREATE TABLE `chemical_result_txt`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'ID号',
  `sample` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Sample',
  `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Operator',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Comment',
  `group_a` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Group',
  `date` datetime NULL DEFAULT NULL COMMENT 'Date',
  `tfe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'TFe',
  `sio2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'SiO2',
  `cao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'CaO',
  `mgo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'MgO',
  `a12o3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'A12O3',
  `p` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'P',
  `s` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'S',
  `tio2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'TiO2',
  `v2o5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'V2O5',
  `mno` int NULL DEFAULT NULL COMMENT 'MnO',
  `cr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Cr',
  `zn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Zn',
  `cu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Cu',
  `ni` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Ni',
  `pb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Pb',
  `a_s` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'As',
  `feo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Feo',
  `h2o` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'H2O',
  `burn_loss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '烧损',
  `granularity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '粒度',
  `strength` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '强度',
  `raw_fever` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生烧',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `push_status` tinyint NULL DEFAULT NULL COMMENT '推送状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chemical_result_txt
-- ----------------------------
INSERT INTO `chemical_result_txt` VALUES ('1', '1', '1', '1', '1', NULL, '1', '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, NULL, 0);

-- ----------------------------
-- Table structure for chemical_result_txt_avg
-- ----------------------------
DROP TABLE IF EXISTS `chemical_result_txt_avg`;
CREATE TABLE `chemical_result_txt_avg`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'ID号',
  `sample` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Sample',
  `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Operator',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Comment',
  `group_a` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Group',
  `date` datetime NULL DEFAULT NULL COMMENT 'Date',
  `tfe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'TFe',
  `sio2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'SiO2',
  `cao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'CaO',
  `mgo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'MgO',
  `a12o3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'A12O3',
  `p` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'P',
  `s` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'S',
  `tio2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'TiO2',
  `v2o5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'V2O5',
  `mno` int NULL DEFAULT NULL COMMENT 'MnO',
  `cr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Cr',
  `zn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Zn',
  `cu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Cu',
  `ni` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Ni',
  `pb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Pb',
  `a_s` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'As',
  `feo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Feo',
  `h2o` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'H2O',
  `burn_loss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '烧损',
  `granularity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '粒度',
  `strength` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '强度',
  `raw_fever` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生烧',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chemical_result_txt_avg
-- ----------------------------

-- ----------------------------
-- Table structure for chemical_users
-- ----------------------------
DROP TABLE IF EXISTS `chemical_users`;
CREATE TABLE `chemical_users`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chemical_users
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'chemical_result_access', 'ACCESS实验数据', NULL, NULL, 'ChemicalResultAccess', 'crud', 'com.ruoyi.chemical', 'chemical', 'chemicalAccess', 'access实验数据', 'xy', '0', '/', '{\"parentMenuId\":\"1\"}', 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41', NULL);
INSERT INTO `gen_table` VALUES (2, 'chemical_result_txt', 'TXT实验数据', NULL, NULL, 'ChemicalResultTxt', 'crud', 'com.ruoyi.chemical', 'chemical', 'chemicalTxt', 'txt实验数据', 'xy', '0', '/', '{\"parentMenuId\":\"1\"}', 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46', NULL);
INSERT INTO `gen_table` VALUES (3, 'chemical_result_access_avg', 'ACCESS发送数据', NULL, NULL, 'ChemicalResultAccessAvg', 'crud', 'com.ruoyi.chemical', 'chemical', 'accessAvg', 'access发送数据', 'xy', '0', '/', '{\"parentMenuId\":2019}', 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09', NULL);
INSERT INTO `gen_table` VALUES (4, 'chemical_result_txt_avg', 'TXT发送数据', NULL, NULL, 'ChemicalResultTxtAvg', 'crud', 'com.ruoyi.chemical', 'chemical', 'txtAvg', 'TXT发送数据', 'y', '0', '/', '{\"parentMenuId\":2019}', 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', 'ID号', 'varchar(255)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (2, '1', 'sample', '样品号', 'varchar(255)', 'String', 'sample', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (3, '1', 'mad', 'Mad', 'varchar(255)', 'String', 'mad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (4, '1', 'aad', 'Aad', 'varchar(255)', 'String', 'aad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (5, '1', 'ad', 'Ad', 'varchar(255)', 'String', 'ad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (6, '1', 'vad', 'Vad', 'varchar(255)', 'String', 'vad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (7, '1', 'vd', 'Vd', 'varchar(255)', 'String', 'vd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (8, '1', 'vdaf', 'Vdaf', 'varchar(255)', 'String', 'vdaf', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (9, '1', 'fcad', 'FCad', 'varchar(255)', 'String', 'fcad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (10, '1', 'sad', 'Sad', 'varchar(255)', 'String', 'sad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (11, '1', 'h2o', 'H2O', 'varchar(255)', 'String', 'h2o', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (12, '1', 'qd', 'Qd', 'varchar(255)', 'String', 'qd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (13, '1', 'qn', 'Qn', 'varchar(255)', 'String', 'qn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (14, '1', 'zn', 'Zn', 'varchar(255)', 'String', 'zn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (15, '1', 'tfe', 'TFe', 'varchar(255)', 'String', 'tfe', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (16, '1', 'c', 'C', 'varchar(255)', 'String', 'c', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (18, '1', 'room_no', '室编号', 'int', 'Long', 'roomNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (19, '1', 'granularity', '粒度', 'varchar(255)', 'String', 'granularity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (20, '1', 'grind_ability', '可磨性', 'varchar(255)', 'String', 'grindAbility', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (21, '1', 'material_name', '物料名称', 'varchar(255)', 'String', 'materialName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 20, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (22, '2', 'id', 'ID号', 'varchar(255)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (23, '2', 'sample', 'Sample', 'varchar(255)', 'String', 'sample', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (24, '2', 'operator', 'Operator', 'varchar(255)', 'String', 'operator', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (25, '2', 'comment', 'Comment', 'varchar(255)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (27, '2', 'date', 'Date', 'datetime', 'Date', 'date', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (28, '2', 'tfe', 'TFe', 'varchar(255)', 'String', 'tfe', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (29, '2', 'sio2', 'SiO2', 'varchar(255)', 'String', 'sio2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (30, '2', 'cao', 'CaO', 'varchar(255)', 'String', 'cao', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (31, '2', 'mgo', 'MgO', 'varchar(255)', 'String', 'mgo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (32, '2', 'a12o3', 'A12O3', 'varchar(255)', 'String', 'a12o3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (33, '2', 'p', 'P', 'varchar(255)', 'String', 'p', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (34, '2', 's', 'S', 'varchar(255)', 'String', 's', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (35, '2', 'tio2', 'TiO2', 'varchar(255)', 'String', 'tio2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (36, '2', 'v2o5', 'V2O5', 'varchar(255)', 'String', 'v2o5', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (37, '2', 'mno', 'MnO', 'int', 'Long', 'mno', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (38, '2', 'cr', 'Cr', 'varchar(255)', 'String', 'cr', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (39, '2', 'zn', 'Zn', 'varchar(255)', 'String', 'zn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (40, '2', 'cu', 'Cu', 'varchar(255)', 'String', 'cu', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (41, '2', 'ni', 'Ni', 'varchar(255)', 'String', 'ni', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (42, '2', 'pb', 'Pb', 'varchar(255)', 'String', 'pb', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (44, '2', 'feo', 'Feo', 'varchar(255)', 'String', 'feo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (45, '2', 'h2o', 'H2O', 'varchar(255)', 'String', 'h2o', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (46, '2', 'burn_loss', '烧损', 'varchar(255)', 'String', 'burnLoss', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (47, '2', 'granularity', '粒度', 'varchar(255)', 'String', 'granularity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:47');
INSERT INTO `gen_table_column` VALUES (48, '2', 'strength', '强度', 'varchar(255)', 'String', 'strength', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:47');
INSERT INTO `gen_table_column` VALUES (49, '2', 'raw_fever', '生烧', 'varchar(255)', 'String', 'rawFever', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-10-23 13:48:39', '', '2024-10-24 13:34:47');
INSERT INTO `gen_table_column` VALUES (50, '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 21, '', '2024-10-24 12:45:00', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (51, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 22, '', '2024-10-24 12:45:00', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (52, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 23, '', '2024-10-24 12:45:00', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (53, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 24, '', '2024-10-24 12:45:00', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (54, '1', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 25, '', '2024-10-24 12:45:00', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (55, '1', 'push_status', '推送状态', 'varchar(255)', 'Integer', 'pushStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'push_status', 26, '', '2024-10-24 12:49:22', '', '2024-10-24 13:04:41');
INSERT INTO `gen_table_column` VALUES (56, '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 29, '', '2024-10-24 12:50:34', '', '2024-10-24 13:34:47');
INSERT INTO `gen_table_column` VALUES (57, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 30, '', '2024-10-24 12:50:34', '', '2024-10-24 13:34:47');
INSERT INTO `gen_table_column` VALUES (58, '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 31, '', '2024-10-24 12:50:34', '', '2024-10-24 13:34:47');
INSERT INTO `gen_table_column` VALUES (59, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 32, '', '2024-10-24 12:50:34', '', '2024-10-24 13:34:47');
INSERT INTO `gen_table_column` VALUES (60, '2', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 33, '', '2024-10-24 12:50:34', '', '2024-10-24 13:34:47');
INSERT INTO `gen_table_column` VALUES (61, '2', 'push_status', '推送状态', 'tinyint', 'Long', 'pushStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'push_status', 34, '', '2024-10-24 13:13:02', '', '2024-10-24 13:34:47');
INSERT INTO `gen_table_column` VALUES (62, '2', 'group_a', 'Group', 'varchar(255)', 'String', 'groupA', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, '', '2024-10-24 13:34:25', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (63, '2', 'a_s', 'As', 'varchar(255)', 'String', 'aS', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 22, '', '2024-10-24 13:34:25', '', '2024-10-24 13:34:46');
INSERT INTO `gen_table_column` VALUES (64, '3', 'id', 'ID号', 'varchar(255)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (65, '3', 'sample', '样品号', 'varchar(255)', 'String', 'sample', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (66, '3', 'mad', 'Mad', 'varchar(255)', 'String', 'mad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (67, '3', 'aad', 'Aad', 'varchar(255)', 'String', 'aad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (68, '3', 'ad', 'Ad', 'varchar(255)', 'String', 'ad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (69, '3', 'vad', 'Vad', 'varchar(255)', 'String', 'vad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (70, '3', 'vd', 'Vd', 'varchar(255)', 'String', 'vd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (71, '3', 'vdaf', 'Vdaf', 'varchar(255)', 'String', 'vdaf', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (72, '3', 'fcad', 'FCad', 'varchar(255)', 'String', 'fcad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (73, '3', 'sad', 'Sad', 'varchar(255)', 'String', 'sad', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (74, '3', 'h2o', 'H2O', 'varchar(255)', 'String', 'h2o', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (75, '3', 'qd', 'Qd', 'varchar(255)', 'String', 'qd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (76, '3', 'qn', 'Qn', 'varchar(255)', 'String', 'qn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (77, '3', 'zn', 'Zn', 'varchar(255)', 'String', 'zn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (78, '3', 'tfe', 'TFe', 'varchar(255)', 'String', 'tfe', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (79, '3', 'c', 'C', 'varchar(255)', 'String', 'c', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (80, '3', 'room_no', '室编号', 'int', 'Long', 'roomNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (81, '3', 'granularity', '粒度', 'varchar(255)', 'String', 'granularity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (82, '3', 'grind_ability', '可磨性', 'varchar(255)', 'String', 'grindAbility', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (83, '3', 'material_name', '物料名称', 'varchar(255)', 'String', 'materialName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 20, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (84, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (85, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 22, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (86, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 23, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (87, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 24, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (88, '3', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 25, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (89, '3', 'origin_ids', '原始数据id', 'varchar(255)', 'String', 'originIds', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:45:09');
INSERT INTO `gen_table_column` VALUES (90, '4', 'id', 'ID号', 'varchar(255)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (91, '4', 'sample', 'Sample', 'varchar(255)', 'String', 'sample', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (92, '4', 'operator', 'Operator', 'varchar(255)', 'String', 'operator', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (93, '4', 'comment', 'Comment', 'varchar(255)', 'String', 'comment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (94, '4', 'group_a', 'Group', 'varchar(255)', 'String', 'groupA', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (95, '4', 'date', 'Date', 'datetime', 'Date', 'date', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (96, '4', 'tfe', 'TFe', 'varchar(255)', 'String', 'tfe', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (97, '4', 'sio2', 'SiO2', 'varchar(255)', 'String', 'sio2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (98, '4', 'cao', 'CaO', 'varchar(255)', 'String', 'cao', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (99, '4', 'mgo', 'MgO', 'varchar(255)', 'String', 'mgo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (100, '4', 'a12o3', 'A12O3', 'varchar(255)', 'String', 'a12o3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (101, '4', 'p', 'P', 'varchar(255)', 'String', 'p', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (102, '4', 's', 'S', 'varchar(255)', 'String', 's', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (103, '4', 'tio2', 'TiO2', 'varchar(255)', 'String', 'tio2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (104, '4', 'v2o5', 'V2O5', 'varchar(255)', 'String', 'v2o5', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (105, '4', 'mno', 'MnO', 'int', 'Long', 'mno', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (106, '4', 'cr', 'Cr', 'varchar(255)', 'String', 'cr', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (107, '4', 'zn', 'Zn', 'varchar(255)', 'String', 'zn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (108, '4', 'cu', 'Cu', 'varchar(255)', 'String', 'cu', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (109, '4', 'ni', 'Ni', 'varchar(255)', 'String', 'ni', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (110, '4', 'pb', 'Pb', 'varchar(255)', 'String', 'pb', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (111, '4', 'a_s', 'As', 'varchar(255)', 'String', 'aS', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (112, '4', 'feo', 'Feo', 'varchar(255)', 'String', 'feo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (113, '4', 'h2o', 'H2O', 'varchar(255)', 'String', 'h2o', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (114, '4', 'burn_loss', '烧损', 'varchar(255)', 'String', 'burnLoss', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (115, '4', 'granularity', '粒度', 'varchar(255)', 'String', 'granularity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (116, '4', 'strength', '强度', 'varchar(255)', 'String', 'strength', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (117, '4', 'raw_fever', '生烧', 'varchar(255)', 'String', 'rawFever', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (118, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 29, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:23');
INSERT INTO `gen_table_column` VALUES (119, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 30, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:24');
INSERT INTO `gen_table_column` VALUES (120, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 31, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:24');
INSERT INTO `gen_table_column` VALUES (121, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 32, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:24');
INSERT INTO `gen_table_column` VALUES (122, '4', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 33, 'admin', '2024-10-24 13:43:24', '', '2024-10-24 13:50:24');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-10-23 13:15:59', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-10-23 13:15:59', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-10-23 13:15:59', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-10-23 13:15:59', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-10-23 13:15:59', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-10-23 13:15:59', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 13:15:57', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 13:15:57', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 13:15:57', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 13:15:57', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 13:15:57', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 13:15:57', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 13:15:57', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 13:15:57', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 13:15:57', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 13:15:57', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '未推送', '0', 'push_status', NULL, 'default', 'N', '0', 'admin', '2024-10-24 13:01:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '已推送', '1', 'push_status', NULL, 'default', 'N', '0', 'admin', '2024-10-24 13:02:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '已撤销', '2', 'push_status', NULL, 'default', 'N', '0', 'admin', '2024-10-24 13:02:28', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-10-23 13:15:59', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '推送状态', 'push_status', '0', 'admin', '2024-10-24 13:01:30', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-10-23 13:15:59', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-10-23 13:15:59', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-10-23 13:15:59', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-10-23 13:48:16');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-10-24 12:44:40');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-10-24 13:30:11');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-10-24 13:30:15');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2013 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-10-23 13:15:58', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-10-23 13:15:58', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-10-23 13:15:58', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-10-23 13:15:58', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-10-23 13:15:58', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-10-23 13:15:58', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-10-23 13:15:58', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-10-23 13:15:58', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-10-23 13:15:58', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-10-23 13:15:58', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-10-23 13:15:58', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-10-23 13:15:58', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-10-23 13:15:58', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-10-23 13:15:58', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-10-23 13:15:58', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-10-23 13:15:58', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-10-23 13:15:58', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-10-23 13:15:58', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-10-23 13:15:58', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-10-23 13:15:58', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-10-23 13:15:58', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-10-23 13:15:58', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-10-23 13:15:58', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-10-23 13:15:58', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, 'Access实验数据', 2006, 1, 'chemicalAccess', 'chemical/chemicalAccess/index', NULL, 1, 0, 'C', '0', '0', 'chemical:chemicalAccess:list', '#', 'admin', '2024-10-23 14:04:30', 'admin', '2024-10-24 12:58:24', 'access实验数据菜单');
INSERT INTO `sys_menu` VALUES (2001, 'access实验数据查询', 2000, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:chemicalAccess:query', '#', 'admin', '2024-10-23 14:04:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, 'access实验数据新增', 2000, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:chemicalAccess:add', '#', 'admin', '2024-10-23 14:04:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, 'access实验数据修改', 2000, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:chemicalAccess:edit', '#', 'admin', '2024-10-23 14:04:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, 'access实验数据删除', 2000, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:chemicalAccess:remove', '#', 'admin', '2024-10-23 14:04:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, 'access实验数据导出', 2000, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:chemicalAccess:export', '#', 'admin', '2024-10-23 14:04:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '实验数据', 0, 2, 'chemical', NULL, NULL, 1, 0, 'M', '0', '0', '', 'cascader', 'admin', '2024-10-24 12:56:52', 'admin', '2024-10-24 12:57:13', '');
INSERT INTO `sys_menu` VALUES (2013, 'TXT实验数据', 2006, 1, 'chemicalTxt', 'chemical/chemicalTxt/index', NULL, 1, 0, 'C', '0', '0', 'chemical:chemicalTxt:list', '#', 'admin', '2024-10-24 13:26:16', 'admin', '2024-10-24 13:40:09', 'txt实验数据菜单');
INSERT INTO `sys_menu` VALUES (2014, 'txt实验数据查询', 2013, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:chemicalTxt:query', '#', 'admin', '2024-10-24 13:26:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, 'txt实验数据新增', 2013, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:chemicalTxt:add', '#', 'admin', '2024-10-24 13:26:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, 'txt实验数据修改', 2013, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:chemicalTxt:edit', '#', 'admin', '2024-10-24 13:26:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, 'txt实验数据删除', 2013, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:chemicalTxt:remove', '#', 'admin', '2024-10-24 13:26:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, 'txt实验数据导出', 2013, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:chemicalTxt:export', '#', 'admin', '2024-10-24 13:26:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '实验数据客户端', 0, 3, 'client', NULL, NULL, 1, 0, 'M', '0', '0', '', 'documentation', 'admin', '2024-10-24 13:41:52', 'admin', '2024-10-24 13:42:05', '');
INSERT INTO `sys_menu` VALUES (2020, 'ACCESS发送数据', 2019, 1, 'accessAvg', 'chemical/accessAvg/index', NULL, 1, 0, 'C', '0', '0', 'chemical:accessAvg:list', '#', 'admin', '2024-10-24 13:48:15', 'admin', '2024-10-24 13:55:35', 'access发送数据菜单');
INSERT INTO `sys_menu` VALUES (2021, 'access发送数据查询', 2020, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:accessAvg:query', '#', 'admin', '2024-10-24 13:48:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, 'access发送数据新增', 2020, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:accessAvg:add', '#', 'admin', '2024-10-24 13:48:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, 'access发送数据修改', 2020, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:accessAvg:edit', '#', 'admin', '2024-10-24 13:48:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, 'access发送数据删除', 2020, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:accessAvg:remove', '#', 'admin', '2024-10-24 13:48:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, 'access发送数据导出', 2020, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:accessAvg:export', '#', 'admin', '2024-10-24 13:48:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, 'TXT发送数据', 2019, 1, 'txtAvg', 'chemical/txtAvg/index', NULL, 1, 0, 'C', '0', '0', 'chemical:txtAvg:list', '#', 'admin', '2024-10-24 13:54:06', '', NULL, 'TXT发送数据菜单');
INSERT INTO `sys_menu` VALUES (2027, 'TXT发送数据查询', 2026, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:txtAvg:query', '#', 'admin', '2024-10-24 13:54:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, 'TXT发送数据新增', 2026, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:txtAvg:add', '#', 'admin', '2024-10-24 13:54:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, 'TXT发送数据修改', 2026, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:txtAvg:edit', '#', 'admin', '2024-10-24 13:54:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, 'TXT发送数据删除', 2026, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:txtAvg:remove', '#', 'admin', '2024-10-24 13:54:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, 'TXT发送数据导出', 2026, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'chemical:txtAvg:export', '#', 'admin', '2024-10-24 13:54:06', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-10-23 13:15:59', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-10-23 13:15:59', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"chemical_result_access,chemical_result_txt\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 13:48:40', 601);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"access\",\"className\":\"ChemicalResultAccess\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sample\",\"columnId\":2,\"columnName\":\"sample\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sample\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Mad\",\"columnId\":3,\"columnName\":\"mad\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"mad\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Aad\",\"columnId\":4,\"columnName\":\"aad\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"aad\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":4,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usable', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 13:51:19', 258);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chemicalAccess\",\"className\":\"ChemicalResultAccess\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-23 13:51:19\",\"usableColumn\":false},{\"capJavaField\":\"Sample\",\"columnId\":2,\"columnName\":\"sample\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sample\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-23 13:51:19\",\"usableColumn\":false},{\"capJavaField\":\"Mad\",\"columnId\":3,\"columnName\":\"mad\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"mad\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-23 13:51:19\",\"usableColumn\":false},{\"capJavaField\":\"Aad\",\"columnId\":4,\"columnName\":\"aad\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"aad\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":fa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 13:53:07', 228);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chemical_txt\",\"className\":\"ChemicalResultTxt\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sample\",\"columnId\":23,\"columnName\":\"sample\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sample\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Operator\",\"columnId\":24,\"columnName\":\"operator\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"operator\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Comment\",\"columnId\":25,\"columnName\":\"comment\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"comment\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":4,\"superColumn\":false', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 13:54:09', 266);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"chemical_result_access\"}', NULL, 0, NULL, '2024-10-23 13:54:32', 54);
INSERT INTO `sys_oper_log` VALUES (105, 'access实验数据', 1, 'com.ruoyi.web.controller.chemical.ChemicalResultAccessController.add()', 'POST', 1, 'admin', NULL, '/chemical/chemicalAccess', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-10-23 22:04:55\",\"granularity\":\"1\",\"grindAbility\":\"1\",\"mad\":\"1\",\"params\":{},\"sample\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2024-10-23 22:04:55\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in com/ruoyi/chemical/mapper/ChemicalResultAccessMapper.java (best guess)\r\n### The error may involve com.ruoyi.chemical.mapper.ChemicalResultAccessMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO chemical_result_access  ( sample, mad,                granularity, grind_ability,  create_by, create_time, update_by, update_time )  VALUES  ( ?, ?,                ?, ?,  ?, ?, ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2024-10-23 14:04:55', 501);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chemical_result_access', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 12:45:00', 429);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chemical_result_access', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 12:49:22', 323);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chemicalAccess\",\"className\":\"ChemicalResultAccess\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 12:49:22\",\"usableColumn\":false},{\"capJavaField\":\"Sample\",\"columnComment\":\"样品号\",\"columnId\":2,\"columnName\":\"sample\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sample\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 12:49:22\",\"usableColumn\":false},{\"capJavaField\":\"Mad\",\"columnComment\":\"Mad\",\"columnId\":3,\"columnName\":\"mad\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"mad\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 12:49:22\",\"usableColumn\":false},{\"capJavaField\":\"Aad\",\"columnComment\":\"Aad\",\"columnId\":4,\"columnName\":\"aad\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 12:50:10', 236);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chemical_result_txt', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 12:50:34', 343);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chemical_txt\",\"className\":\"ChemicalResultTxt\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID号\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 12:50:33\",\"usableColumn\":false},{\"capJavaField\":\"Sample\",\"columnComment\":\"Sample\",\"columnId\":23,\"columnName\":\"sample\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sample\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 12:50:33\",\"usableColumn\":false},{\"capJavaField\":\"Operator\",\"columnComment\":\"Operator\",\"columnId\":24,\"columnName\":\"operator\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"operator\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 12:50:33\",\"usableColumn\":false},{\"capJavaField\":\"Comment\",\"columnComment\":\"Comment\",\"columnId\":25,\"columnName\":\"comment\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 12:51:32', 299);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"chemical_result_access\"}', NULL, 0, NULL, '2024-10-24 12:51:40', 61);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"实验数据\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"chemical\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 12:56:52', 51);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-10-24 12:56:52\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"实验数据\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"chemical\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 12:57:13', 41);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chemical/chemicalAccess/index\",\"createTime\":\"2024-10-23 14:04:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"access实验数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"chemicalAccess\",\"perms\":\"chemical:chemicalAccess:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 12:58:03', 31);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chemical/chemicalAccess/index\",\"createTime\":\"2024-10-23 14:04:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"Access实验数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"chemicalAccess\",\"perms\":\"chemical:chemicalAccess:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 12:58:24', 39);
INSERT INTO `sys_oper_log` VALUES (116, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"推送状态\",\"dictType\":\"push_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:01:30', 32);
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未推送\",\"dictSort\":1,\"dictType\":\"push_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:01:52', 34);
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已推送\",\"dictSort\":2,\"dictType\":\"push_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:02:06', 33);
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已撤销\",\"dictSort\":3,\"dictType\":\"push_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:02:28', 30);
INSERT INTO `sys_oper_log` VALUES (120, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:03:32', 389);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chemicalAccess\",\"className\":\"ChemicalResultAccess\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 12:50:10\",\"usableColumn\":false},{\"capJavaField\":\"Sample\",\"columnComment\":\"样品号\",\"columnId\":2,\"columnName\":\"sample\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sample\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 12:50:10\",\"usableColumn\":false},{\"capJavaField\":\"Mad\",\"columnComment\":\"Mad\",\"columnId\":3,\"columnName\":\"mad\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"mad\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 12:50:10\",\"usableColumn\":false},{\"capJavaField\":\"Aad\",\"columnComment\":\"Aad\",\"columnId\":4,\"columnName\":\"aad\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:04:13', 292);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chemicalAccess\",\"className\":\"ChemicalResultAccess\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 13:04:13\",\"usableColumn\":false},{\"capJavaField\":\"Sample\",\"columnComment\":\"样品号\",\"columnId\":2,\"columnName\":\"sample\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sample\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 13:04:13\",\"usableColumn\":false},{\"capJavaField\":\"Mad\",\"columnComment\":\"Mad\",\"columnId\":3,\"columnName\":\"mad\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"mad\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 13:04:13\",\"usableColumn\":false},{\"capJavaField\":\"Aad\",\"columnComment\":\"Aad\",\"columnId\":4,\"columnName\":\"aad\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:04:41', 270);
INSERT INTO `sys_oper_log` VALUES (123, 'access实验数据', 2, 'com.ruoyi.web.controller.chemical.ChemicalResultAccessController.edit()', 'PUT', 1, 'admin', NULL, '/chemical/chemicalAccess', '127.0.0.1', '内网IP', '{\"aad\":\"1\",\"ad\":\"1\",\"c\":\"1\",\"createBy\":\"\",\"fcad\":\"1\",\"granularity\":\"1\",\"grindAbility\":\"1\",\"h2o\":\"1\",\"id\":\"1\",\"mad\":\"1\",\"materialName\":\"1\",\"params\":{},\"pushStatus\":\"0\",\"qd\":\"1\",\"qn\":\"1\",\"roomNo\":1,\"sad\":\"1\",\"sample\":\"1\",\"tfe\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2024-10-24 21:08:50\",\"vad\":\"1\",\"vd\":\"1\",\"vdaf\":\"1\",\"zn\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:08:50', 392);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chemical_result_txt', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:13:02', 514);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chemical_txt\",\"className\":\"ChemicalResultTxt\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID号\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 13:13:02\",\"usableColumn\":false},{\"capJavaField\":\"Sample\",\"columnComment\":\"Sample\",\"columnId\":23,\"columnName\":\"sample\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sample\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 13:13:02\",\"usableColumn\":false},{\"capJavaField\":\"Operator\",\"columnComment\":\"Operator\",\"columnId\":24,\"columnName\":\"operator\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"operator\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 13:13:02\",\"usableColumn\":false},{\"capJavaField\":\"Comment\",\"columnComment\":\"Comment\",\"columnId\":25,\"columnName\":\"comment\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:13:16', 280);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"chemical_result_txt\"}', NULL, 0, NULL, '2024-10-24 13:13:19', 60);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chemicalTxt\",\"className\":\"ChemicalResultTxt\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID号\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 13:13:15\",\"usableColumn\":false},{\"capJavaField\":\"Sample\",\"columnComment\":\"Sample\",\"columnId\":23,\"columnName\":\"sample\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sample\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 13:13:15\",\"usableColumn\":false},{\"capJavaField\":\"Operator\",\"columnComment\":\"Operator\",\"columnId\":24,\"columnName\":\"operator\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"operator\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 13:13:15\",\"usableColumn\":false},{\"capJavaField\":\"Comment\",\"columnComment\":\"Comment\",\"columnId\":25,\"columnName\":\"comment\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:19:35', 269);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"chemical_result_txt\"}', NULL, 0, NULL, '2024-10-24 13:20:07', 50);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chemical/chemical_txt/index\",\"createTime\":\"2024-10-24 13:22:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"TXT实验数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"chemical_txt\",\"perms\":\"chemical:chemical_txt:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:23:18', 91);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chemical/chemical_txt/index\",\"createTime\":\"2024-10-24 13:22:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"TXT实验数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"chemical_txt\",\"perms\":\"chemical:chemical_txt:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:23:39', 30);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chemical_result_txt', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:34:25', 604);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chemicalTxt\",\"className\":\"ChemicalResultTxt\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID号\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 13:34:25\",\"usableColumn\":false},{\"capJavaField\":\"Sample\",\"columnComment\":\"Sample\",\"columnId\":23,\"columnName\":\"sample\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sample\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 13:34:25\",\"usableColumn\":false},{\"capJavaField\":\"Operator\",\"columnComment\":\"Operator\",\"columnId\":24,\"columnName\":\"operator\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"operator\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 13:34:25\",\"usableColumn\":false},{\"capJavaField\":\"Comment\",\"columnComment\":\"Comment\",\"columnId\":25,\"columnName\":\"comment\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 13:48:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:34:47', 381);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chemical/chemicalTxt/index\",\"createTime\":\"2024-10-24 13:26:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"TXT实验数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"chemicalTxt\",\"perms\":\"chemical:chemicalTxt:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:40:09', 56);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"实验数据客户端\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"c\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:41:52', 30);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-10-24 13:41:52\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"实验数据客户端\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"client\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:42:05', 41);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"chemical_result_txt_avg,chemical_result_access_avg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:43:24', 616);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"accessAvg\",\"className\":\"ChemicalResultAccessAvg\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID号\",\"columnId\":64,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 13:43:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sample\",\"columnComment\":\"样品号\",\"columnId\":65,\"columnName\":\"sample\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 13:43:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sample\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Mad\",\"columnComment\":\"Mad\",\"columnId\":66,\"columnName\":\"mad\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 13:43:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"mad\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Aad\",\"columnComment\":\"Aad\",\"columnId\":67,\"columnName\":\"aad\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 13:43:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"aad\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":tru', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:45:09', 391);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"chemical_result_access_avg\"}', NULL, 0, NULL, '2024-10-24 13:45:14', 61);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"txtAvg\",\"className\":\"ChemicalResultTxtAvg\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID号\",\"columnId\":90,\"columnName\":\"id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 13:43:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sample\",\"columnComment\":\"Sample\",\"columnId\":91,\"columnName\":\"sample\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 13:43:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sample\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Operator\",\"columnComment\":\"Operator\",\"columnId\":92,\"columnName\":\"operator\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 13:43:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"operator\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Comment\",\"columnComment\":\"Comment\",\"columnId\":93,\"columnName\":\"comment\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 13:43:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"comment\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:50:24', 380);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"chemical_result_txt_avg\"}', NULL, 0, NULL, '2024-10-24 13:50:26', 245);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chemical/accessAvg/index\",\"createTime\":\"2024-10-24 13:48:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"ACCESS发送数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2019,\"path\":\"accessAvg\",\"perms\":\"chemical:accessAvg:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:55:35', 55);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-10-23 13:15:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-10-23 13:15:58', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-10-23 13:15:58', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-10-23 13:15:58', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-10-24 21:30:15', 'admin', '2024-10-23 13:15:57', '', '2024-10-24 13:30:15', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-10-23 13:15:57', 'admin', '2024-10-23 13:15:57', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
