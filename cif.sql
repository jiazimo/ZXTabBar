/*
Navicat MySQL Data Transfer

Source Server         : local_DB
Source Server Version : 50515
Source Host           : 127.0.0.1:3306
Source Database       : cif

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2018-07-13 11:12:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apb_eodt
-- ----------------------------
DROP TABLE IF EXISTS `apb_eodt`;
CREATE TABLE `apb_eodt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `flowid` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '批量日终流程ID',
  `flowtp` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '日终流程类型',
  `flowdt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '批量日终管理日期',
  `flowst` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '批量流程日终状态',
  `systcd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '系统代码',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of apb_eodt
-- ----------------------------

-- ----------------------------
-- Table structure for apb_snvl
-- ----------------------------
DROP TABLE IF EXISTS `apb_snvl`;
CREATE TABLE `apb_snvl` (
  `sncode` varchar(32) NOT NULL COMMENT '序号编号',
  `corpno` varchar(3) NOT NULL COMMENT '法人代码',
  `trandt` varchar(8) NOT NULL COMMENT '序号日期',
  `systcd` varchar(30) NOT NULL COMMENT '系统代码',
  `dcnnoo` varchar(8) NOT NULL COMMENT 'DCN编号',
  `curval` bigint(19) NOT NULL COMMENT '当前序号',
  PRIMARY KEY (`sncode`,`trandt`,`systcd`,`dcnnoo`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apb_snvl
-- ----------------------------

-- ----------------------------
-- Table structure for apb_snvm
-- ----------------------------
DROP TABLE IF EXISTS `apb_snvm`;
CREATE TABLE `apb_snvm` (
  `sncode` varchar(32) NOT NULL COMMENT '序号编号',
  `corpno` varchar(3) NOT NULL COMMENT '法人代码',
  `trandt` varchar(8) NOT NULL COMMENT '序号日期',
  `systcd` varchar(30) NOT NULL COMMENT '系统代码',
  `dcnnoo` varchar(8) NOT NULL COMMENT 'DCN编号',
  `vmidxx` varchar(40) NOT NULL COMMENT 'JVM标识',
  `curval` bigint(19) NOT NULL COMMENT '当前序号',
  `maxval` bigint(19) NOT NULL COMMENT '最大序号',
  `usstat` varchar(1) NOT NULL COMMENT '是否使用中',
  PRIMARY KEY (`sncode`,`trandt`,`systcd`,`dcnnoo`,`corpno`,`vmidxx`),
  KEY `apb_snvm_idx2` (`vmidxx`,`usstat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apb_snvm
-- ----------------------------

-- ----------------------------
-- Table structure for app_cldt
-- ----------------------------
DROP TABLE IF EXISTS `app_cldt`;
CREATE TABLE `app_cldt` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `bflsdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '上上次交易日期',
  `lastdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '上次交易日期',
  `systdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '交易日期',
  `nextdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '下次交易日期',
  `afnxdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '下下次交易日期',
  `yreddt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '年终决算日期',
  `clenum` int(8) DEFAULT NULL COMMENT '清算场次',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of app_cldt
-- ----------------------------

-- ----------------------------
-- Table structure for app_corp
-- ----------------------------
DROP TABLE IF EXISTS `app_corp`;
CREATE TABLE `app_corp` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `corpna` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '法人中文名称',
  `addres` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '法人地址',
  `corplv` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '法人级别',
  `upcorp` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '上级法人',
  `recdver` bigint(19) DEFAULT NULL COMMENT '记录版本号',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`corpno`),
  UNIQUE KEY `app_corp_uk1` (`corpno`),
  KEY `app_corp_idx1` (`corplv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of app_corp
-- ----------------------------
INSERT INTO `app_corp` VALUES ('985', '中心法人', '深圳', '1', '', '1', null);

-- ----------------------------
-- Table structure for app_crcy
-- ----------------------------
DROP TABLE IF EXISTS `app_crcy`;
CREATE TABLE `app_crcy` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `crcycd` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '币种',
  `crcyna` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '贷币名称',
  `ccynum` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '货币数字代码',
  `cntycd` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '国别代码',
  `ccymin` bigint(19) DEFAULT NULL COMMENT '币种精度位',
  `iamnun` bigint(19) DEFAULT NULL COMMENT '计息精度位',
  `chgeun` decimal(21,2) DEFAULT NULL COMMENT '货币找零位',
  `basefg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否本币标志',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`crcycd`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of app_crcy
-- ----------------------------

-- ----------------------------
-- Table structure for app_sequ
-- ----------------------------
DROP TABLE IF EXISTS `app_sequ`;
CREATE TABLE `app_sequ` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `sequcd` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '流水号编号',
  `sequds` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '流水号描述',
  `intval` bigint(19) NOT NULL COMMENT '初始值',
  `cachsz` bigint(19) NOT NULL COMMENT '缓存大小',
  `seqlen` bigint(19) DEFAULT NULL COMMENT '增长大小',
  `maxval` bigint(19) NOT NULL COMMENT '最大值',
  `buidfg` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否有组成规则',
  `module` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '模块',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`sequcd`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of app_sequ
-- ----------------------------

-- ----------------------------
-- Table structure for app_sequ_buid
-- ----------------------------
DROP TABLE IF EXISTS `app_sequ_buid`;
CREATE TABLE `app_sequ_buid` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `sequcd` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '流水号编号',
  `datast` bigint(19) NOT NULL COMMENT '序号',
  `buidtp` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '组成类型',
  `datamr` varchar(25) COLLATE utf8_bin DEFAULT NULL COMMENT '数据区',
  `fildna` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '字段名称',
  `stposi` bigint(19) DEFAULT NULL COMMENT '起始位置',
  `cutlen` bigint(19) DEFAULT NULL COMMENT '截取长度',
  `padmod` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '补充模式',
  `padval` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '补充值',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`sequcd`,`datast`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of app_sequ_buid
-- ----------------------------

-- ----------------------------
-- Table structure for app_sndf
-- ----------------------------
DROP TABLE IF EXISTS `app_sndf`;
CREATE TABLE `app_sndf` (
  `sncode` varchar(32) NOT NULL COMMENT '序号编号',
  `snname` varchar(40) NOT NULL COMMENT '序号名称',
  `bycorp` varchar(1) NOT NULL COMMENT '是否按法人生成',
  `bydcnn` varchar(1) NOT NULL COMMENT '是否按DCN生成',
  `bydate` varchar(1) NOT NULL COMMENT '是否按日期生成',
  `minval` bigint(19) NOT NULL COMMENT '起始序号',
  `maxval` bigint(19) NOT NULL COMMENT '最大序号',
  `snlenn` int(8) NOT NULL COMMENT '长度',
  `stepsz` int(8) NOT NULL COMMENT '步长',
  `isolat` varchar(1) NOT NULL COMMENT '是否独立事务',
  `cachsz` int(8) NOT NULL COMMENT '缓存数量',
  `snrule` varchar(200) NOT NULL COMMENT '组成规则',
  `corpno` varchar(3) DEFAULT '000' COMMENT '默认法人代码',
  `dcnnoo` varchar(8) DEFAULT '000' COMMENT '默认DCN号',
  `trandt` varchar(8) DEFAULT '19000101' COMMENT '默认日期',
  `systcd` varchar(30) DEFAULT NULL COMMENT '所属系统代码',
  `isdigt` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否数字',
  `sndesc` varchar(80) DEFAULT NULL COMMENT '序号描述',
  PRIMARY KEY (`sncode`),
  KEY `app_sndf_idx2` (`systcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_sndf
-- ----------------------------
INSERT INTO `app_sndf` VALUES ('pckgsq', '报文流水号', '0', '1', '1', '0', '99999999999', '11', '1', '1', '100', '${trandt}${systcd}${dcnnoo}${curval}', '000', '000', '19000101', '010', '0', '按日期、系统、DCN，在全法人唯一');
INSERT INTO `app_sndf` VALUES ('transq', '交易流水', '0', '1', '1', '0', '99999999', '8', '1', '1', '1000', '${trandt}${systcd}${dcnnoo}${corpno}${curval}', '', '', '', '010', '0', '按日期、系统、DCN、法人');

-- ----------------------------
-- Table structure for app_sydt
-- ----------------------------
DROP TABLE IF EXISTS `app_sydt`;
CREATE TABLE `app_sydt` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `bflsdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '上上次交易日期',
  `lastdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '上次交易日期',
  `systdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '交易日期',
  `nextdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '下次交易日期',
  `afnxdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '下下次交易日期',
  `yreddt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '年终决算日期',
  `parmvi` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '参数版本',
  `timetm` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of app_sydt
-- ----------------------------
INSERT INTO `app_sydt` VALUES ('001', '20170526', '20170527', '20170528', '20170529', '20170530', '20171231', '1', '2017-05-04');
INSERT INTO `app_sydt` VALUES ('985', '20180630', '20180701', '20180702', '20180703', '20180704', '20181231', '1', '2017-03-03');

-- ----------------------------
-- Table structure for app_temp_defi
-- ----------------------------
DROP TABLE IF EXISTS `app_temp_defi`;
CREATE TABLE `app_temp_defi` (
  `corpno` varchar(3) NOT NULL COMMENT '法人代码',
  `meteid` varchar(20) NOT NULL COMMENT '短信模板ID',
  `metemp` varchar(400) NOT NULL COMMENT '短信模板',
  `smstyp` varchar(1) NOT NULL COMMENT '短信类型',
  `tmstmp` varchar(21) DEFAULT NULL COMMENT '时间戳',
  `remark` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '短息模版说明',
  `temptype` varchar(1) DEFAULT '0' COMMENT '是否万能模版',
  PRIMARY KEY (`meteid`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_temp_defi
-- ----------------------------
INSERT INTO `app_temp_defi` VALUES ('985', '47381', '您正在${trade}，验证码${vecode}，请于${minute}分钟内按页面提示提交验证码。如非本人操作，请忽略本短信！', '0', null, 'trade,vecode,minute', '0');
INSERT INTO `app_temp_defi` VALUES ('985', '66843', '您的身份证件于${msgDays}天后到期，为不影响您的正常交易。请尽快登陆ThreeBank更新证件信息。如您已更新，请忽略本信息！', '0', null, 'msgDays', '0');
INSERT INTO `app_temp_defi` VALUES ('985', 'MXXXNASKHCG00001', '金谷云平台客户操作结果：尊敬的先生/女士 ，您的验证码为${vecode}，请妥善保管。', '0', null, 'vecode：验证码', '1');

-- ----------------------------
-- Table structure for app_topi_defi
-- ----------------------------
DROP TABLE IF EXISTS `app_topi_defi`;
CREATE TABLE `app_topi_defi` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `topcid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '消息主题ID',
  `topicn` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '主题名称',
  `systcd` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '系统编号',
  `metype` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '消息类型',
  `msgmod` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '消息模式',
  `conscy` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '消息事务一致性粒度',
  `msgact` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '消息处理方式',
  `ismein` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否短信接口',
  `svcimp` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '跨节点消息处理',
  `meteid` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '短信模板ID',
  `istodb` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '源消息是否入库',
  `istrya` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否重试',
  `tragti` int(3) DEFAULT NULL COMMENT '重试次数',
  `tragst` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '重试策略',
  `svcopt` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '消息发送服务数据范围',
  `svceid` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '消息发送服务ID',
  `svcebd` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '消息发送服务绑定',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`corpno`,`topcid`,`systcd`),
  UNIQUE KEY `app_topi_defi_uk1` (`topcid`,`systcd`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of app_topi_defi
-- ----------------------------
INSERT INTO `app_topi_defi` VALUES ('985', 'Q0203003', '身份认证过期发消息给app', '020', '0', 'Q', '1', 'P', '1', null, 'Q0201001', '1', '0', '3', null, '3', 'IoCmqServType.sendMessageApp', 'Q0203003', '20170706111012.039000');
INSERT INTO `app_topi_defi` VALUES ('985', 'Q2101001', '客户修改手机号码通知审批系统', '020', '0', 'Q', '1', 'P', '1', '', 'Q2101001', '1', '0', '3', '', '3', 'IoCmqServType.syncMobile', '*', '20170706111012.039000');
INSERT INTO `app_topi_defi` VALUES ('985', 'Q2111001', '客户修改手机号码通知贷后系统', '020', '0', 'Q', '1', 'P', '1', '', 'Q2111001', '1', '0', '3', '', '3', 'IoCmqServType.syncMobile', '*', '20170706111012.039000');

-- ----------------------------
-- Table structure for app_topi_subs
-- ----------------------------
DROP TABLE IF EXISTS `app_topi_subs`;
CREATE TABLE `app_topi_subs` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `topcid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '消息主题ID',
  `systcd` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '系统编号',
  `subseq` int(8) NOT NULL COMMENT '订阅序号',
  `scopno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '订阅法人',
  `sdcnno` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '订阅DCN',
  `ssyscd` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '订阅系统ID',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`topcid`,`systcd`,`subseq`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of app_topi_subs
-- ----------------------------

-- ----------------------------
-- Table structure for aps_eodt_detl
-- ----------------------------
DROP TABLE IF EXISTS `aps_eodt_detl`;
CREATE TABLE `aps_eodt_detl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `flowid` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '批量日终流程ID',
  `flowdt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '批量日终管理日期',
  `dcnnum` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'DCN编号',
  `dcnste` varchar(15) COLLATE utf8_bin NOT NULL COMMENT 'DCN调度状态',
  `txntal` bigint(19) NOT NULL DEFAULT '0' COMMENT '有效交易个数',
  `txnsuc` bigint(19) NOT NULL DEFAULT '0' COMMENT '成功交易个数',
  `pecent` decimal(9,6) NOT NULL DEFAULT '0.000000' COMMENT '进度百分比',
  `systcd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '系统代码',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aps_eodt_detl
-- ----------------------------

-- ----------------------------
-- Table structure for aps_mess_data
-- ----------------------------
DROP TABLE IF EXISTS `aps_mess_data`;
CREATE TABLE `aps_mess_data` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `trandt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '交易日期',
  `messid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '消息ID',
  `topcid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '消息主题ID',
  `metype` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '消息类型',
  `md5chk` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'MD5校验',
  `premod` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '压缩方式',
  `mesobj` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '消息对象类',
  `afpres` text COLLATE utf8_bin COMMENT '消息压缩内容',
  `medata` text COLLATE utf8_bin NOT NULL COMMENT '消息明文内容',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`messid`,`trandt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aps_mess_data
-- ----------------------------

-- ----------------------------
-- Table structure for aps_mess_fail
-- ----------------------------
DROP TABLE IF EXISTS `aps_mess_fail`;
CREATE TABLE `aps_mess_fail` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `trandt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '交易日期',
  `busisq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '业务流水',
  `transq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '交易流水',
  `messeq` int(8) NOT NULL COMMENT '消息序号',
  `sosyco` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '源系统代码',
  `topcid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '消息主题ID',
  `messid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '消息ID',
  `sdcnid` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '源DCN号',
  `sovmid` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '源VMID',
  `sourip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '源主机',
  `tragti` int(3) DEFAULT NULL COMMENT '重试次数',
  `excode` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '异常错误码',
  `estack` text COLLATE utf8_bin COMMENT '异常堆栈',
  `devmid` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '收到VMID',
  `destip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '收到主机',
  `destdt` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '收到时间',
  `prvmid` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '处理VMID',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`transq`,`trandt`,`messeq`),
  UNIQUE KEY `aps_mess_fail_uk2` (`messid`,`corpno`),
  KEY `aps_mess_fail_idx3` (`busisq`,`trandt`,`topcid`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aps_mess_fail
-- ----------------------------

-- ----------------------------
-- Table structure for aps_mess_succ
-- ----------------------------
DROP TABLE IF EXISTS `aps_mess_succ`;
CREATE TABLE `aps_mess_succ` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `trandt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '交易日期',
  `busisq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '业务流水',
  `transq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '交易流水',
  `messeq` int(8) NOT NULL COMMENT '消息序号',
  `sosyco` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '源系统代码',
  `topcid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '消息主题ID',
  `messid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '消息ID',
  `sdcnid` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '源DCN号',
  `sovmid` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '源VMID',
  `sourip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '源主机',
  `tragti` int(3) DEFAULT NULL COMMENT '重试次数',
  `devmid` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '收到VMID',
  `destip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '收到主机',
  `destdt` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '收到时间',
  `prvmid` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '处理VMID',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  `groupid` int(8) DEFAULT NULL COMMENT '分组ID',
  UNIQUE KEY `aps_mess_succ_uk2` (`messid`,`corpno`),
  KEY `aps_mess_succ_idx3` (`busisq`,`trandt`,`topcid`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aps_mess_succ
-- ----------------------------

-- ----------------------------
-- Table structure for aps_mess_undo
-- ----------------------------
DROP TABLE IF EXISTS `aps_mess_undo`;
CREATE TABLE `aps_mess_undo` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `trandt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '交易日期',
  `busisq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '业务流水',
  `transq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '交易流水',
  `messeq` int(8) NOT NULL COMMENT '消息序号',
  `sosyco` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '源系统代码',
  `topcid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '消息主题ID',
  `messid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '消息ID',
  `sdcnid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '源DCN号',
  `sovmid` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '源VMID',
  `sourip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '源主机',
  `devmid` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '收到VMID',
  `destip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '收到主机',
  `destdt` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '收到时间',
  `prvmid` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '处理VMID',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  `groupid` int(8) DEFAULT NULL COMMENT '分组ID',
  UNIQUE KEY `aps_mess_undo_uk2` (`messid`,`corpno`),
  KEY `aps_mess_undo_idx3` (`busisq`,`trandt`,`topcid`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aps_mess_undo
-- ----------------------------

-- ----------------------------
-- Table structure for aps_shor_fail
-- ----------------------------
DROP TABLE IF EXISTS `aps_shor_fail`;
CREATE TABLE `aps_shor_fail` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `messid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '短信ID',
  `nacode` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '国家代码',
  `mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `templid` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `messty` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否实时发送',
  `para` text COLLATE utf8_bin COMMENT '消息参数',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`messid`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of aps_shor_fail
-- ----------------------------

-- ----------------------------
-- Table structure for aps_shor_succ
-- ----------------------------
DROP TABLE IF EXISTS `aps_shor_succ`;
CREATE TABLE `aps_shor_succ` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `messid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '短信ID',
  `nacode` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '国家代码',
  `mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `templid` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `messty` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否实时发送',
  `para` text COLLATE utf8_bin COMMENT '消息参数',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`messid`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of aps_shor_succ
-- ----------------------------

-- ----------------------------
-- Table structure for aps_shor_undo
-- ----------------------------
DROP TABLE IF EXISTS `aps_shor_undo`;
CREATE TABLE `aps_shor_undo` (
  `corpno` varchar(3) NOT NULL COMMENT '法人代码',
  `groupid` int(8) NOT NULL COMMENT '分组ID',
  `messid` varchar(40) NOT NULL COMMENT '短信ID',
  `nacode` varchar(2) DEFAULT NULL COMMENT '国家代码',
  `messst` varchar(1) DEFAULT NULL COMMENT '短信状态',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `templid` int(20) DEFAULT NULL COMMENT '短信模版ID',
  `messty` varchar(1) DEFAULT NULL COMMENT '是否实时发送',
  `para` varchar(2048) DEFAULT NULL COMMENT '消息参数',
  `tmstmp` varchar(21) DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`groupid`,`messid`,`corpno`),
  KEY `aps_shor_undo_uk2` (`groupid`,`messid`,`messst`,`messty`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aps_shor_undo
-- ----------------------------

-- ----------------------------
-- Table structure for aps_topi_detl
-- ----------------------------
DROP TABLE IF EXISTS `aps_topi_detl`;
CREATE TABLE `aps_topi_detl` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `affaid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '事务ID',
  `detlsq` int(8) NOT NULL COMMENT '明细序号',
  `iscons` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否消费方',
  `tacorp` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '目标法人',
  `tardcn` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '目标DCN',
  `tsyscd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '目标系统',
  `constm` varchar(22) COLLATE utf8_bin DEFAULT NULL COMMENT '消费时间',
  `status` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '状态',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`affaid`,`detlsq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aps_topi_detl
-- ----------------------------

-- ----------------------------
-- Table structure for aps_topi_mess
-- ----------------------------
DROP TABLE IF EXISTS `aps_topi_mess`;
CREATE TABLE `aps_topi_mess` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `affaid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '事务ID',
  `pumesq` int(8) NOT NULL COMMENT '序号',
  `messid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '消息ID',
  `topcid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '消息主题ID',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`affaid`,`pumesq`),
  UNIQUE KEY `aps_topi_mess_uk2` (`messid`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aps_topi_mess
-- ----------------------------

-- ----------------------------
-- Table structure for aps_topi_push
-- ----------------------------
DROP TABLE IF EXISTS `aps_topi_push`;
CREATE TABLE `aps_topi_push` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `affaid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '事务ID',
  `ssyscd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '发布系统',
  `sendcn` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '发布DCN',
  `constm` varchar(22) COLLATE utf8_bin DEFAULT NULL COMMENT '发布时间',
  `status` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '状态',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`affaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of aps_topi_push
-- ----------------------------

-- ----------------------------
-- Table structure for cif_acti_user
-- ----------------------------
DROP TABLE IF EXISTS `cif_acti_user`;
CREATE TABLE `cif_acti_user` (
  `actiid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '活动ID',
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `logina` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  `taskid` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '批次号',
  PRIMARY KEY (`actiid`,`userid`),
  KEY `cif_acti_user_idx2` (`taskid`),
  KEY `cif_acti_user_idx3` (`actiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_acti_user
-- ----------------------------

-- ----------------------------
-- Table structure for cif_addr_param
-- ----------------------------
DROP TABLE IF EXISTS `cif_addr_param`;
CREATE TABLE `cif_addr_param` (
  `addrid` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '省市区号',
  `addrnm` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '详细信息',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`addrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_addr_param
-- ----------------------------

-- ----------------------------
-- Table structure for cif_cler_oper
-- ----------------------------
DROP TABLE IF EXISTS `cif_cler_oper`;
CREATE TABLE `cif_cler_oper` (
  `cleseq` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '柜员流水号',
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `custid` varchar(14) COLLATE utf8_bin DEFAULT NULL COMMENT '客户ID',
  `custna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `idtftp` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `idtfno` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `optype` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '操作类型',
  `opstre` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '操作前记录',
  `opafre` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '操作后记录',
  `opdatm` datetime DEFAULT NULL COMMENT '操作时间',
  `chnlid` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道',
  `operid` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '操作柜员',
  `authid` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '授权柜员',
  `reason` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '原因',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  PRIMARY KEY (`cleseq`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_cler_oper
-- ----------------------------

-- ----------------------------
-- Table structure for cif_cust_agre
-- ----------------------------
DROP TABLE IF EXISTS `cif_cust_agre`;
CREATE TABLE `cif_cust_agre` (
  `biztra` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '签约流水号',
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `agreno` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '协议账户',
  `agtype` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '协议类型',
  `checfg` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '销户检查标志',
  `agrest` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '协议状态',
  `chnlid` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道',
  `sidatm` datetime DEFAULT NULL COMMENT '签约时间',
  `redatm` datetime DEFAULT NULL COMMENT '解约时间',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  `prodid` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '产品ID',
  `erorcd` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '错误码',
  `erortx` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`biztra`,`userid`),
  KEY `cif_cust_agre_idx1` (`userid`,`agtype`,`agrest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_cust_agre
-- ----------------------------

-- ----------------------------
-- Table structure for cif_cust_base
-- ----------------------------
DROP TABLE IF EXISTS `cif_cust_base`;
CREATE TABLE `cif_cust_base` (
  `custid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '客户ID',
  `custna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `bhdate` date DEFAULT NULL COMMENT '出生日期',
  `ctrycd` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '国籍',
  `gender` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `nation` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '民族',
  `idtftp` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `idtfno` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `idtedt` date DEFAULT NULL COMMENT '证件生效日',
  `idexdt` date DEFAULT NULL COMMENT '证件到期日',
  `issuat` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '发证机关',
  `idsite` varchar(280) COLLATE utf8_bin DEFAULT NULL COMMENT '证件地址',
  `eaopfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '电子账户开通标识',
  `eacclv` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '电子账户级别',
  `eaccbr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '电子账户所属机构',
  `custbr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '客户所属机构',
  `acmaid` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '客户经理ID',
  `ristlv` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '风险承受等级',
  `career` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '职业',
  `eannuin` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '年收入枚举',
  `annuin` decimal(17,2) DEFAULT NULL COMMENT '年收入',
  `txcztp` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '税收居民类型',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  PRIMARY KEY (`custid`),
  KEY `cif_cust_base_idx1` (`idtfno`,`idtftp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_cust_base
-- ----------------------------

-- ----------------------------
-- Table structure for cif_cust_bind
-- ----------------------------
DROP TABLE IF EXISTS `cif_cust_bind`;
CREATE TABLE `cif_cust_bind` (
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `custid` varchar(14) COLLATE utf8_bin DEFAULT NULL COMMENT '客户ID',
  `eactno` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '电子账号',
  `eactid` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '电子账号ID',
  `bindno` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '绑定账号',
  `atbkno` varchar(80) COLLATE utf8_bin NOT NULL COMMENT '账户开户行号',
  `atbkna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '账户开户行名',
  `isiner` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否本行账户',
  `accttp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '绑定账户类型',
  `bindst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '绑定状态',
  `acusna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '账户开户人名称',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  PRIMARY KEY (`userid`,`atbkno`,`bindno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_cust_bind
-- ----------------------------

-- ----------------------------
-- Table structure for cif_cust_chec
-- ----------------------------
DROP TABLE IF EXISTS `cif_cust_chec`;
CREATE TABLE `cif_cust_chec` (
  `chkseq` varchar(23) COLLATE utf8_bin NOT NULL COMMENT '核查流水',
  `ckdate` date DEFAULT NULL COMMENT '核查日期',
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `custna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `career` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '职业',
  `annuin` decimal(17,2) DEFAULT NULL COMMENT '年收入',
  `bhdate` date DEFAULT NULL COMMENT '出生日期',
  `ctrycd` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '国籍',
  `gender` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `nation` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '民族',
  `idtftp` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `idtfno` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `idtedt` date DEFAULT NULL COMMENT '证件生效日',
  `idexdt` date DEFAULT NULL COMMENT '证件到期日',
  `issuat` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '发证机关',
  `idsite` varchar(280) COLLATE utf8_bin DEFAULT NULL COMMENT '证件地址',
  `verist` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '核查状态',
  `btvrst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '批量核查状态',
  `vrphot` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '核查返回证件照片',
  `msgnfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '消息通知标志',
  `failrs` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '失败原因',
  `custbr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '客户所属机构',
  `acmaid` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '客户经理ID',
  `veribr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '核查机构',
  `verite` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '核查柜员',
  `iputtp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '录入方式',
  `rqsyno` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '请求系统编号',
  `chnlid` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道',
  `butype` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '核查业务类型',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  `stady1` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段1',
  `stady2` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段2',
  `stady3` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段3',
  PRIMARY KEY (`chkseq`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_cust_chec
-- ----------------------------

-- ----------------------------
-- Table structure for cif_cust_chec_hist
-- ----------------------------
DROP TABLE IF EXISTS `cif_cust_chec_hist`;
CREATE TABLE `cif_cust_chec_hist` (
  `chkseq` varchar(23) COLLATE utf8_bin NOT NULL COMMENT '核查流水',
  `ckdate` date DEFAULT NULL COMMENT '核查日期',
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `custna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `career` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '职业',
  `annuin` decimal(17,2) DEFAULT NULL COMMENT '年收入',
  `bhdate` date DEFAULT NULL COMMENT '出生日期',
  `ctrycd` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '国籍',
  `gender` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `nation` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '民族',
  `idtftp` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `idtfno` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `idtedt` date DEFAULT NULL COMMENT '证件生效日',
  `idexdt` date DEFAULT NULL COMMENT '证件到期日',
  `issuat` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '发证机关',
  `idsite` varchar(280) COLLATE utf8_bin DEFAULT NULL COMMENT '证件地址',
  `verist` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '核查状态',
  `btvrst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '批量核查状态',
  `vrphot` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '核查返回证件照片',
  `msgnfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '消息通知标志',
  `failrs` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '失败原因',
  `custbr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '客户所属机构',
  `acmaid` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '客户经理ID',
  `veribr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '核查机构',
  `verite` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '核查柜员',
  `iputtp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '录入方式',
  `rqsyno` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '请求系统编号',
  `chnlid` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道',
  `butype` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '核查业务类型',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  `stady1` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段1',
  `stady2` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段2',
  `stady3` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段3',
  PRIMARY KEY (`chkseq`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_cust_chec_hist
-- ----------------------------

-- ----------------------------
-- Table structure for cif_cust_prod_chck
-- ----------------------------
DROP TABLE IF EXISTS `cif_cust_prod_chck`;
CREATE TABLE `cif_cust_prod_chck` (
  `idtfno` varchar(20) NOT NULL COMMENT '证件号码',
  `prodid` varchar(100) NOT NULL COMMENT '产品ID',
  `isorno` varchar(1) DEFAULT NULL COMMENT '是否有效',
  `stady1` varchar(40) DEFAULT NULL COMMENT '备用1',
  `stady2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `stady3` varchar(40) DEFAULT NULL COMMENT '备用3',
  `corpno` varchar(3) DEFAULT NULL COMMENT '法人代码',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`idtfno`,`prodid`),
  KEY `cif_cust_prod_chck_idx1` (`idtfno`,`prodid`,`isorno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cif_cust_prod_chck
-- ----------------------------

-- ----------------------------
-- Table structure for cif_cust_ristlv
-- ----------------------------
DROP TABLE IF EXISTS `cif_cust_ristlv`;
CREATE TABLE `cif_cust_ristlv` (
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `custid` varchar(14) COLLATE utf8_bin DEFAULT NULL COMMENT '客户ID',
  `stdate` date DEFAULT NULL COMMENT '生效日期',
  `ivdate` date DEFAULT NULL COMMENT '失效日期',
  `risttp` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '风险种类',
  `ristlv` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '风险承受等级',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`userid`,`risttp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_cust_ristlv
-- ----------------------------

-- ----------------------------
-- Table structure for cif_cust_ristlv_hisrec
-- ----------------------------
DROP TABLE IF EXISTS `cif_cust_ristlv_hisrec`;
CREATE TABLE `cif_cust_ristlv_hisrec` (
  `cleseq` varchar(80) COLLATE utf8_bin NOT NULL COMMENT '柜员流水号',
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `custid` varchar(14) COLLATE utf8_bin DEFAULT NULL COMMENT '客户ID',
  `stdate` date DEFAULT NULL COMMENT '生效日期',
  `ivdate` date DEFAULT NULL COMMENT '失效日期',
  `risttp` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '风险种类',
  `ristlv` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '风险承受等级',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`cleseq`,`userid`,`risttp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_cust_ristlv_hisrec
-- ----------------------------

-- ----------------------------
-- Table structure for cif_cust_temp_base
-- ----------------------------
DROP TABLE IF EXISTS `cif_cust_temp_base`;
CREATE TABLE `cif_cust_temp_base` (
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `custid` varchar(14) COLLATE utf8_bin DEFAULT NULL COMMENT '客户ID',
  `custna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `bhdate` date DEFAULT NULL COMMENT '出生日期',
  `ctrycd` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '国籍',
  `gender` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `nation` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '民族',
  `idtftp` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `idtfno` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `idtedt` date DEFAULT NULL COMMENT '证件生效日',
  `idexdt` date DEFAULT NULL COMMENT '证件到期日',
  `issuat` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '发证机关',
  `idsite` varchar(280) COLLATE utf8_bin DEFAULT NULL COMMENT '证件地址',
  `verist` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否有效',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_cust_temp_base
-- ----------------------------

-- ----------------------------
-- Table structure for cif_cust_whit
-- ----------------------------
DROP TABLE IF EXISTS `cif_cust_whit`;
CREATE TABLE `cif_cust_whit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `phonno` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `custna` varchar(80) DEFAULT NULL COMMENT '客户姓名',
  `idtfno` varchar(20) DEFAULT NULL COMMENT '证件号码',
  `ishide` varchar(1) DEFAULT '0' COMMENT '是否有效',
  `stady1` varchar(40) DEFAULT NULL COMMENT '备用1',
  `stady2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `stady3` varchar(40) DEFAULT NULL COMMENT '备用3',
  `corpno` varchar(3) DEFAULT NULL COMMENT '法人代码',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cif_cust_whit_idx2` (`idtfno`,`stady1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cif_cust_whit
-- ----------------------------

-- ----------------------------
-- Table structure for cif_file_read
-- ----------------------------
DROP TABLE IF EXISTS `cif_file_read`;
CREATE TABLE `cif_file_read` (
  `chckdt` varchar(8) NOT NULL COMMENT '读取日期',
  `status` varchar(1) DEFAULT NULL COMMENT '文件交互状态',
  `descri` varchar(80) DEFAULT NULL COMMENT '文件交互结果描述',
  `stady1` varchar(40) DEFAULT NULL COMMENT '备用1',
  `stady2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `stady3` varchar(40) DEFAULT NULL COMMENT '备用3',
  `corpno` varchar(3) DEFAULT NULL COMMENT '法人代码',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`chckdt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cif_file_read
-- ----------------------------

-- ----------------------------
-- Table structure for cif_file_rgst
-- ----------------------------
DROP TABLE IF EXISTS `cif_file_rgst`;
CREATE TABLE `cif_file_rgst` (
  `tranno` varchar(40) COLLATE utf8_bin NOT NULL,
  `busseq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '业务流水',
  `source` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '源系统标识',
  `target` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '目标系统标识',
  `dataid` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '数据类型',
  `flpath` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '文件路径',
  `filenm` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名',
  `filemd` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '文件md5标识',
  `acctdt` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `params` text COLLATE utf8_bin COMMENT '附加参数',
  `status` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '交互状态',
  `descri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '结果描述',
  `filest` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '文件登记状态',
  `trandt` date DEFAULT NULL COMMENT '交易日期',
  `trantm` datetime DEFAULT NULL COMMENT '交易时间',
  `fainum` int(8) DEFAULT NULL COMMENT '重发错误次数',
  `isdewa` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否登记预警',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人编号',
  PRIMARY KEY (`tranno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_file_rgst
-- ----------------------------

-- ----------------------------
-- Table structure for cif_ocr_record
-- ----------------------------
DROP TABLE IF EXISTS `cif_ocr_record`;
CREATE TABLE `cif_ocr_record` (
  `ocrpid` varchar(80) NOT NULL COMMENT 'OCR记录主键',
  `userid` varchar(14) DEFAULT NULL COMMENT '用户ID',
  `custna` varchar(80) DEFAULT NULL COMMENT '姓名',
  `idtfno` varchar(20) DEFAULT NULL COMMENT '证件号码',
  `idfrpc` varchar(1024) DEFAULT NULL COMMENT '身份证正面OCR照片保存地址',
  `idbcpc` varchar(1024) DEFAULT NULL COMMENT '身份证反面OCR照片保存地址',
  `opvide` varchar(1024) DEFAULT NULL COMMENT '开户视频',
  `orsatp` varchar(5) DEFAULT NULL COMMENT 'OCR保存类型',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建日期',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改日期',
  `corpno` varchar(3) DEFAULT NULL COMMENT '法人',
  PRIMARY KEY (`ocrpid`),
  KEY `cif_ocr_record_idx1` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cif_ocr_record
-- ----------------------------

-- ----------------------------
-- Table structure for cif_publ_parm
-- ----------------------------
DROP TABLE IF EXISTS `cif_publ_parm`;
CREATE TABLE `cif_publ_parm` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `parmid` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '参数标识',
  `parmfg` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '参数类别',
  `parmtp` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '参数类型',
  `parmna` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '参数名称',
  `parmva` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值',
  `parmde` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '参数描述',
  `operid` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '操作柜员',
  `authid` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '授权柜员',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_publ_parm
-- ----------------------------

-- ----------------------------
-- Table structure for cif_publ_ques
-- ----------------------------
DROP TABLE IF EXISTS `cif_publ_ques`;
CREATE TABLE `cif_publ_ques` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `quesid` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '问题ID',
  `quesna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '问题名称',
  `ishide` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '是否隐藏',
  `operid` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '操作柜员',
  `authid` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '授权柜员',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  PRIMARY KEY (`id`),
  KEY `cif_publ_ques_idx1` (`quesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_publ_ques
-- ----------------------------

-- ----------------------------
-- Table structure for cif_publ_ristlv
-- ----------------------------
DROP TABLE IF EXISTS `cif_publ_ristlv`;
CREATE TABLE `cif_publ_ristlv` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `custna` varchar(80) DEFAULT NULL COMMENT '客户姓名',
  `idtfno` varchar(20) DEFAULT NULL COMMENT '证件号码',
  `risttp` varchar(10) DEFAULT NULL COMMENT '风险种类',
  `rstdlv` varchar(30) DEFAULT NULL COMMENT '线下风险评级等级',
  `stdate` date DEFAULT NULL COMMENT '生效时间',
  `ivdate` date DEFAULT NULL COMMENT '失效时间',
  `riskst` varchar(1) DEFAULT NULL COMMENT '风评同步状态',
  `stady1` varchar(40) DEFAULT NULL COMMENT '保留字段1',
  `stady2` varchar(40) DEFAULT NULL COMMENT '保留字段1',
  `corpno` varchar(3) DEFAULT NULL COMMENT '法人代码',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cif_publ_ristlv_idx1` (`idtfno`,`risttp`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cif_publ_ristlv
-- ----------------------------

-- ----------------------------
-- Table structure for cif_resp_over
-- ----------------------------
DROP TABLE IF EXISTS `cif_resp_over`;
CREATE TABLE `cif_resp_over` (
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `resptp` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '响应超时类型',
  `chkseq` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '核查流水',
  `jsonst` text COLLATE utf8_bin COMMENT 'json字段',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`userid`,`resptp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_resp_over
-- ----------------------------

-- ----------------------------
-- Table structure for cif_user_action
-- ----------------------------
DROP TABLE IF EXISTS `cif_user_action`;
CREATE TABLE `cif_user_action` (
  `busesq` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '流水',
  `opcucd` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '交易内码',
  `chnlid` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道号',
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `custid` varchar(14) COLLATE utf8_bin DEFAULT NULL COMMENT '客户ID',
  `custna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `idtftp` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `idtfno` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `operte` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '操作员',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`busesq`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_user_action
-- ----------------------------

-- ----------------------------
-- Table structure for cif_user_action_detail
-- ----------------------------
DROP TABLE IF EXISTS `cif_user_action_detail`;
CREATE TABLE `cif_user_action_detail` (
  `busesq` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '流水',
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `opcucd` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '交易内码',
  `optanm` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '操作表名字',
  `opcoln` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '操作列名字',
  `opcolc` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '操作列注释',
  `opvabf` varchar(280) COLLATE utf8_bin DEFAULT NULL COMMENT '修改前值',
  `opvaaf` varchar(280) COLLATE utf8_bin DEFAULT NULL COMMENT '修改后值',
  `oprtim` datetime DEFAULT NULL COMMENT '操作时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`busesq`,`opcoln`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_user_action_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cif_user_action_summ
-- ----------------------------
DROP TABLE IF EXISTS `cif_user_action_summ`;
CREATE TABLE `cif_user_action_summ` (
  `chnlid` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道号',
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `custid` varchar(14) COLLATE utf8_bin DEFAULT NULL COMMENT '客户ID',
  `custna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `idtftp` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `idtfno` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `operte` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '操作员',
  `oprtim` datetime DEFAULT NULL COMMENT '最后一次操作时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_user_action_summ
-- ----------------------------

-- ----------------------------
-- Table structure for cif_user_addr
-- ----------------------------
DROP TABLE IF EXISTS `cif_user_addr`;
CREATE TABLE `cif_user_addr` (
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `addrid` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '地址ID',
  `sitetp` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '地址类型',
  `postcd` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `ctrycd` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '国籍',
  `provcd` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '省级代码',
  `citycd` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '市级代码',
  `distcd` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '区代码',
  `detasi` varchar(280) COLLATE utf8_bin DEFAULT NULL COMMENT '详细地址',
  `sitede` varchar(280) COLLATE utf8_bin DEFAULT NULL COMMENT '地址描述',
  `recena` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人姓名',
  `remobi` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人手机号',
  `rephon` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人固定电话',
  `ftchfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '首选标识',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_user_addr
-- ----------------------------

-- ----------------------------
-- Table structure for cif_user_base
-- ----------------------------
DROP TABLE IF EXISTS `cif_user_base`;
CREATE TABLE `cif_user_base` (
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号ID',
  `custid` varchar(14) COLLATE utf8_bin DEFAULT NULL COMMENT '客户ID',
  `userst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户状态',
  `chnlid` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道',
  `hpsite` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '头像地址',
  `userem` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮箱',
  `logina` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `userle` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户级别',
  `phonno` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `refeph` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '推荐人手机号码',
  `lodatm` datetime DEFAULT NULL COMMENT '锁定时间',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  `rgdatm` datetime DEFAULT NULL COMMENT '注册时间',
  `opactm` datetime DEFAULT NULL COMMENT '开户时间',
  `recnum` int(11) DEFAULT NULL COMMENT '推荐人数',
  `bhdate` date DEFAULT NULL COMMENT '出生日期',
  `custna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `agrest` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '黄金签约状态',
  PRIMARY KEY (`userid`),
  KEY `cif_user_base_idx1` (`phonno`,`chnlid`),
  KEY `cif_user_base_idx2` (`custid`,`chnlid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_user_base
-- ----------------------------

-- ----------------------------
-- Table structure for cif_user_base_ilegal
-- ----------------------------
DROP TABLE IF EXISTS `cif_user_base_ilegal`;
CREATE TABLE `cif_user_base_ilegal` (
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `custid` varchar(14) COLLATE utf8_bin DEFAULT NULL COMMENT '客户ID',
  `userst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户状态',
  `chnlid` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道',
  `hpsite` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '头像地址',
  `userem` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮箱',
  `logina` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `userle` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户级别',
  `phonno` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `refeph` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '推荐人手机号码',
  `lodatm` datetime DEFAULT NULL COMMENT '锁定时间',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  `rgdatm` datetime DEFAULT NULL COMMENT '注册时间',
  `opactm` datetime DEFAULT NULL COMMENT '开户时间',
  `recnum` int(11) DEFAULT NULL COMMENT '推荐人数',
  `bhdate` date DEFAULT NULL COMMENT '出生日期',
  `custna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `agrest` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '黄金签约状态',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_user_base_ilegal
-- ----------------------------

-- ----------------------------
-- Table structure for cif_user_ques
-- ----------------------------
DROP TABLE IF EXISTS `cif_user_ques`;
CREATE TABLE `cif_user_ques` (
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `quesid` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '问题ID',
  `quesna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '问题名称',
  `answer` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '答案 ',
  `questp` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '问题类型',
  `corefl` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '是否柜面重置',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  PRIMARY KEY (`userid`,`quesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_user_ques
-- ----------------------------

-- ----------------------------
-- Table structure for cif_warn_info
-- ----------------------------
DROP TABLE IF EXISTS `cif_warn_info`;
CREATE TABLE `cif_warn_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无业务含义id主键',
  `tranno` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '流水',
  `trancd` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '交易码',
  `trannm` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '交易名称',
  `warnty` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '预警类型',
  `erinfo` text COLLATE utf8_bin COMMENT '错误信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cif_warn_info
-- ----------------------------

-- ----------------------------
-- Table structure for kapb_plwjrw
-- ----------------------------
DROP TABLE IF EXISTS `kapb_plwjrw`;
CREATE TABLE `kapb_plwjrw` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `fileid` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '文件ID号',
  `filena` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名称',
  `cdcnno` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT 'DCN编号',
  `trandt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '交易日期',
  `recdno` bigint(19) NOT NULL COMMENT '记录次序号',
  `sendct` bigint(19) DEFAULT NULL COMMENT '已发送笔数',
  `readct` bigint(19) DEFAULT NULL COMMENT '已读取笔数',
  `btfltp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '批量文件类别',
  `hostdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '主机日期',
  `btflst` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '批量文件状态标志',
  `filepr` text COLLATE utf8_bin COMMENT '文件属性信息',
  `trantm` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '交易时间',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`corpno`,`recdno`),
  KEY `kapb_plwjrw_idx1` (`corpno`,`btfltp`,`btflst`),
  KEY `kapb_plwjrw_idx2` (`corpno`,`cdcnno`,`btfltp`,`btflst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kapb_plwjrw
-- ----------------------------

-- ----------------------------
-- Table structure for kapb_wjplxxb
-- ----------------------------
DROP TABLE IF EXISTS `kapb_wjplxxb`;
CREATE TABLE `kapb_wjplxxb` (
  `btchno` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '批量交易批次号',
  `busseq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '业务流水号',
  `trandt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '交易日期',
  `acctdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '业务日期',
  `filetp` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '文件类型',
  `totanm` bigint(19) DEFAULT NULL COMMENT '总笔数',
  `distnm` bigint(19) DEFAULT NULL COMMENT '处理总笔数',
  `succnm` bigint(19) DEFAULT NULL COMMENT '成功笔数',
  `failnm` bigint(19) DEFAULT NULL COMMENT '失败笔数',
  `btfest` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '批量文件状态',
  `filetx` text COLLATE utf8_bin COMMENT '文件信息',
  `errotx` text COLLATE utf8_bin COMMENT '错误信息',
  `downph` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '下载路径',
  `downna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '下载文件名',
  `upfeph` text COLLATE utf8_bin COMMENT '返回文件路径',
  `upfena` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '返回文件名',
  `locaph` text COLLATE utf8_bin COMMENT '文件本地路径',
  PRIMARY KEY (`btchno`),
  KEY `kapb_wjplxxb_idx1` (`busseq`),
  KEY `kapb_wjplxxb_idx2` (`downna`,`downph`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kapb_wjplxxb
-- ----------------------------

-- ----------------------------
-- Table structure for kapp_scenario_def
-- ----------------------------
DROP TABLE IF EXISTS `kapp_scenario_def`;
CREATE TABLE `kapp_scenario_def` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `scenario_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '场景代码',
  `scenario_desc` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '场景描述',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`scenario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kapp_scenario_def
-- ----------------------------

-- ----------------------------
-- Table structure for kapp_sjdyhz
-- ----------------------------
DROP TABLE IF EXISTS `kapp_sjdyhz`;
CREATE TABLE `kapp_sjdyhz` (
  `evetno` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '事件编号',
  `evetna` text COLLATE utf8_bin NOT NULL COMMENT '事件名称',
  `blmodu` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '所属模块',
  PRIMARY KEY (`evetno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kapp_sjdyhz
-- ----------------------------

-- ----------------------------
-- Table structure for kcfa_bsibfo
-- ----------------------------
DROP TABLE IF EXISTS `kcfa_bsibfo`;
CREATE TABLE `kcfa_bsibfo` (
  `userid` varchar(14) COLLATE utf8_bin NOT NULL COMMENT '用户ID号',
  `lncatp` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '业务类型',
  `xytype` varchar(5) COLLATE utf8_bin NOT NULL COMMENT '协议类型',
  `qdtype` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道类型',
  `applid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '业务编号',
  `certfn` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证正面地址',
  `certbk` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证反面地址',
  `certvd` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '人脸视频地址',
  `xymbdz` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '协议模板地址',
  `xyloca` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '协议地址',
  `xyimdz` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '协议图片地址',
  `msgadr` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '短信信息地址',
  `custid` varchar(14) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编号',
  `idtftp` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `idtfno` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`applid`,`userid`,`xytype`),
  KEY `kcfa_bsibfo_idx1` (`xytype`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kcfa_bsibfo
-- ----------------------------

-- ----------------------------
-- Table structure for knb_eodp
-- ----------------------------
DROP TABLE IF EXISTS `knb_eodp`;
CREATE TABLE `knb_eodp` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `trandt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '交易日期',
  `dyedct` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '日终控制点',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`trandt`,`dyedct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knb_eodp
-- ----------------------------

-- ----------------------------
-- Table structure for knb_eodt
-- ----------------------------
DROP TABLE IF EXISTS `knb_eodt`;
CREATE TABLE `knb_eodt` (
  `trandt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '交易日期',
  `chckdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '核对日期',
  `sequnm` bigint(19) NOT NULL COMMENT '序号',
  `btchno` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易批次号',
  `bcstep` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易步骤标志',
  `bctrds` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易状态描述',
  PRIMARY KEY (`sequnm`),
  KEY `knb_eodt_idx1` (`trandt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knb_eodt
-- ----------------------------

-- ----------------------------
-- Table structure for knb_evnt
-- ----------------------------
DROP TABLE IF EXISTS `knb_evnt`;
CREATE TABLE `knb_evnt` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `trandt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '交易日期',
  `transq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '交易流水',
  `mntrsq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '主交易流水',
  `logsno` bigint(19) NOT NULL COMMENT '日志子序号',
  `evntlv` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '事件级别',
  `callsq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '外调流水',
  `callst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '外调服务状态',
  `tranev` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '交易事件',
  `prcscd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '交易码',
  `custac` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '客户账号',
  `tranac` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '交易账号',
  `tranam` decimal(21,2) DEFAULT NULL COMMENT '交易金额',
  `amntcd` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '借贷标志',
  `crcycd` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '币种',
  `stayno` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '待销账序号',
  `tranno` bigint(19) DEFAULT NULL COMMENT '交易序号',
  `frozno` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '冻结编号',
  `bgindt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '起息日期',
  `event1` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '事件关键字1',
  `event2` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '事件关键字2',
  `event3` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '事件关键字3',
  `event4` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '事件关键字4',
  `event5` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '事件关键字5',
  `event6` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '事件关键字6',
  `event7` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '事件关键字7',
  `event8` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '事件关键字8',
  `event9` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '事件关键字9',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  `inpudt` varchar(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '上送日期',
  PRIMARY KEY (`transq`,`logsno`,`corpno`,`trandt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knb_evnt
-- ----------------------------

-- ----------------------------
-- Table structure for knb_evnt_strk
-- ----------------------------
DROP TABLE IF EXISTS `knb_evnt_strk`;
CREATE TABLE `knb_evnt_strk` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `trandt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '交易日期',
  `transq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '交易流水',
  `logsno` bigint(19) NOT NULL COMMENT '日志子序号',
  `evntlv` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '事件级别',
  `callsq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '外调流水',
  `origdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '原始交易日期',
  `origsq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '原交易流水号',
  `origno` bigint(19) NOT NULL COMMENT '原日志子序号',
  `tranev` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '交易事件',
  `erorcd` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '错误代码',
  `failrs` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '失败原因',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`transq`,`logsno`,`trandt`,`corpno`),
  KEY `knb_evnt_strk_idx1` (`origsq`,`origno`,`origdt`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knb_evnt_strk
-- ----------------------------

-- ----------------------------
-- Table structure for knp_bach
-- ----------------------------
DROP TABLE IF EXISTS `knp_bach`;
CREATE TABLE `knp_bach` (
  `busisq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '批量提交流水号',
  `filesq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '批量交易批次号',
  `trandt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易日期',
  `acctdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '会计日期',
  `dataid` varchar(6) COLLATE utf8_bin NOT NULL COMMENT '数据标识ID',
  `source` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '源系统标识',
  `target` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '目标系统标识',
  `filenm` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名',
  `flpath` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '文件目录',
  `datast` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '数据状态',
  `errotx` text COLLATE utf8_bin COMMENT '错误信息',
  `status` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `descrp` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `filemd` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '文件md5标识',
  PRIMARY KEY (`filesq`),
  KEY `knp_bach_idx1` (`busisq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knp_bach
-- ----------------------------

-- ----------------------------
-- Table structure for knp_buss
-- ----------------------------
DROP TABLE IF EXISTS `knp_buss`;
CREATE TABLE `knp_buss` (
  `busseq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '批量提交流水号',
  `trandt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易日期',
  `acctdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '会计日期',
  `filetp` varchar(6) COLLATE utf8_bin NOT NULL COMMENT '数据标识ID',
  `source` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '源系统标识',
  `cursys` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '当前系统标识',
  `target` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '目标系统标识',
  `descrp` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `filels` text COLLATE utf8_bin COMMENT '文件列表',
  `status` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `issend` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否发送通知',
  `sendst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '发送通知状态',
  `sendnm` int(8) DEFAULT NULL COMMENT '通知次数',
  `sntaid` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '通知批次号',
  PRIMARY KEY (`busseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knp_buss
-- ----------------------------

-- ----------------------------
-- Table structure for knp_conf
-- ----------------------------
DROP TABLE IF EXISTS `knp_conf`;
CREATE TABLE `knp_conf` (
  `filetp` varchar(6) COLLATE utf8_bin NOT NULL COMMENT '文件类型',
  `source` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '来源系统标识',
  `cursys` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '接收系统标识',
  `target` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '目标系统标识',
  `filena` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名称',
  `coding` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '文件编码',
  `issued` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否分发文件',
  `bachtp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '文件批量类型',
  `bachcd` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易码',
  `isupfe` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否产生返回文件',
  `issend` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否通知文件系统',
  `isbuss` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否需要返回业务流水',
  PRIMARY KEY (`filetp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knp_conf
-- ----------------------------

-- ----------------------------
-- Table structure for knp_conf_detl
-- ----------------------------
DROP TABLE IF EXISTS `knp_conf_detl`;
CREATE TABLE `knp_conf_detl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无业务含义主键',
  `filetp` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '文件类型',
  `source` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '来源系统标识',
  `target` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '目标系统标识',
  PRIMARY KEY (`id`),
  KEY `knp_conf_detl_idx1` (`filetp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knp_conf_detl
-- ----------------------------

-- ----------------------------
-- Table structure for knp_glbl
-- ----------------------------
DROP TABLE IF EXISTS `knp_glbl`;
CREATE TABLE `knp_glbl` (
  `parmcd` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '参数代码',
  `pmkey1` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '参数键值1',
  `pmkey2` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '参数键值2',
  `pmkey3` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '参数键值3',
  `pmval1` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值1',
  `pmval2` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值2',
  `pmval3` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值3',
  `pmval4` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值4',
  `pmval5` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值5',
  PRIMARY KEY (`parmcd`,`pmkey1`,`pmkey2`,`pmkey3`),
  UNIQUE KEY `knp_glbl_uk1` (`parmcd`,`pmkey1`,`pmkey2`,`pmkey3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knp_glbl
-- ----------------------------

-- ----------------------------
-- Table structure for knp_para
-- ----------------------------
DROP TABLE IF EXISTS `knp_para`;
CREATE TABLE `knp_para` (
  `parmcd` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '参数代码',
  `pmkey1` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '参数键值1',
  `pmkey2` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '参数键值2',
  `pmkey3` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '参数键值3',
  `pmval1` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值1',
  `pmval2` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值2',
  `pmval3` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值3',
  `pmval4` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值4',
  `pmval5` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值5',
  PRIMARY KEY (`parmcd`,`pmkey1`,`pmkey2`,`pmkey3`),
  UNIQUE KEY `knp_para_uk1` (`parmcd`,`pmkey1`,`pmkey2`,`pmkey3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knp_para
-- ----------------------------
INSERT INTO `knp_para` VALUES ('BatchPublishMessgaeGroup', 'groupcount', 'groupsize', '%', '1', '200', null, null, '批量发送消息分组信息');
INSERT INTO `knp_para` VALUES ('BatchPublishSMSGroup', 'groupcount', 'groupsize', '%', '1', '1', null, null, null);
INSERT INTO `knp_para` VALUES ('CfcaAgreeTmplCode', '5', '%', '%', 'KH_protocol', '0', null, null, 'CFCA理财产品协议模板编号');
INSERT INTO `knp_para` VALUES ('CfcaCommonCode', '%', '%', '%', '/share/CIF/AGREEMENT/', '0001', 'CIF', null, 'CFCA公共变量');
INSERT INTO `knp_para` VALUES ('IsCreateAgreeFile', '%', '%', '%', '1', null, null, null, '是否生成协议开关，0：关闭；1：打开');
INSERT INTO `knp_para` VALUES ('SmsSingleSender', 'appid', '%', '%', '1400036859', null, null, null, '腾讯云短信APPID');
INSERT INTO `knp_para` VALUES ('SmsSingleSender', 'appkey', '%', '%', '8ba5c6a96dd09a7fbcb144b7e19e7ae6', null, null, null, '腾讯云短信APPKEY');
INSERT INTO `knp_para` VALUES ('SmsSingleSender', 'enabled', '%', '%', 'true', null, null, null, '腾讯云短信发送是否打开');
INSERT INTO `knp_para` VALUES ('SmsSingleSender', 'meteid', '%', '%', 'MXXXNASKHCG00001', '86', null, null, '腾讯云短信模板ID和国家代码');
INSERT INTO `knp_para` VALUES ('SmsSingleSender', 'phone', '%', '%', '17767209750', null, null, null, '腾讯云短信系统信息接收人手机号码');
INSERT INTO `knp_para` VALUES ('SmsSingleSender', 'templId', '%', '%', '30789', null, null, null, '默认短信模板');
INSERT INTO `knp_para` VALUES ('SmsSingleSender', 'url', '%', '%', 'http://10.101.168.5:8080/v5/tlssmssvr/sendsms', null, null, null, '腾讯云短信URL');
INSERT INTO `knp_para` VALUES ('SmsSingleSender', 'vecdid', '%', '%', '47381', '86', null, null, '腾讯云短信模板ID和国家代码');
INSERT INTO `knp_para` VALUES ('cif', 'xuniguiyuan', '%', '%', '985S206', '985000', 'K5', '985S206--虚拟柜员，985000--虚拟机构，K5--交易渠道', '响应报文头初始化参数');
INSERT INTO `knp_para` VALUES ('cif.config', '02001', 'AS_CIF_ACOPRE', '%', '2', '', '', '', '挡板测试外调电子账户开户');
INSERT INTO `knp_para` VALUES ('cif.config', '02001', 'AS_CIF_CHQUAN', '%', '2', '', '', '', '设置用户回答安全问题正确个数');
INSERT INTO `knp_para` VALUES ('cif.config', '02001', 'AS_CIF_IDAURE', '%', '2', null, null, null, '挡板默认默认身份证维护核查通过');
INSERT INTO `knp_para` VALUES ('cif.config', '02001', 'AS_CIF_IDCKRE', '%', '2', '', '', '', '挡板默认联网开户激活核查通过');
INSERT INTO `knp_para` VALUES ('cif.config', '02001', 'AS_CIF_REIDCK', '%', '985000', '9850001', '', '值一:客户所属虚拟机构', '值二:客户所属经理ID');
INSERT INTO `knp_para` VALUES ('cif.config', '02001', 'AS_CIF_UPACAC', '%', '2', '', '', '', '挡板测试外调非活跃账户激活');
INSERT INTO `knp_para` VALUES ('cif.config', '02001', 'AS_CIF_UPCUPH', '%', '2', '', '', '', '挡板测试外调内管修改手机号码');
INSERT INTO `knp_para` VALUES ('cif.config', '02001', 'AS_CIF_UPUPCU', '%', '2', null, null, null, '挡板默认信贷核查通过');
INSERT INTO `knp_para` VALUES ('cif.config', '02001', 'AS_CIF_UPUSPH', '%', '2', '', '', '', '挡板测试外调修改手机号码');
INSERT INTO `knp_para` VALUES ('cif.config', '02001', 'black', '%', '1', '', '', '', '进行黑名单检查0-不检查,1检查');
INSERT INTO `knp_para` VALUES ('cif.config', '02001', 'testck', '%', '1', null, null, null, '发起开户核查0超时1失败2成功3挡板不起作用');
INSERT INTO `knp_para` VALUES ('cif.config', '02001', 'whit', '%', '0', '', '', '', '进行白名单检查0-不检查,1检查');
INSERT INTO `knp_para` VALUES ('cif.config', '02002', 'opgold', '1', 'set_1494579432_1', '', '', '', '数据库节点');
INSERT INTO `knp_para` VALUES ('cif.config', '02002', 'opgold', '2', 'set_1498804433_3', '', '', '', '数据库节点');
INSERT INTO `knp_para` VALUES ('file_interactive', '9I2500', 'CIF', 'CMP', 'acuswr', '0203', '1', '', '符合活动条件用户文件读取');
INSERT INTO `knp_para` VALUES ('file_interactive', '9I2500', 'CMP', 'CIF', 'acuswr', '0203', '1', '', '接收文件交互处理');
INSERT INTO `knp_para` VALUES ('file_interactive', '9I2501', 'CIF', 'CMP', 'gemtsm', '0208', '1', '', '为营销活动生成短信');
INSERT INTO `knp_para` VALUES ('file_interactive', '9I2501', 'CMP', 'CIF', 'gemtsm', '0208', '1', '', '为营销活动生成短信');
INSERT INTO `knp_para` VALUES ('idOutOfDateMsgSwitch', '%', '%', '%', '1', '100', null, null, '身份证过期发送短信，0：关闭；1：打开，与提前发送短信的天数');
INSERT INTO `knp_para` VALUES ('local_file_path', '%', '%', '%', '/local-file', '/data/bat-work', 'D:	mpfilelocalFileName', '', '本地文件根目录');
INSERT INTO `knp_para` VALUES ('rstalg', '%', '%', '%', 'share', 'ODS/CIF', 'risk.dat', '0', '线下风险评级信息同步');
INSERT INTO `knp_para` VALUES ('rstalg_batch', '%', '%', '%', 'rstalg', '0207', '1', '', '批量同步线下风评信息批量');
INSERT INTO `knp_para` VALUES ('rstalg_finish', '%', '%', '%', 'share', 'ODS/CIF', 'a_pt_cust_risk.dat.xml', '-1', '线下风险评级信息同步完成文件');
INSERT INTO `knp_para` VALUES ('share_file_path', '%', '%', '%', '/share', '/data/shareJH', 'D:	mpfilelocalFileName', '', '批量交易文件根目录');
INSERT INTO `knp_para` VALUES ('syncMobile', 'ischeck', '%', '%', 'Y', null, null, null, '客户手机号修改通知其他系统时，是否校验4级客户');
INSERT INTO `knp_para` VALUES ('syncMobile', 'queues', '%', '%', 'Q2101001@000,Q2111001@000;', null, null, null, 'CMQ点对点通知消息队列');
INSERT INTO `knp_para` VALUES ('system.batch', '020', 'corpno', '%', '985', null, null, null, '批量交易默认法人编号');
INSERT INTO `knp_para` VALUES ('system.batch', '020', 'tranbr', '%', '985000', null, null, null, '批量交易默认虚拟机构');
INSERT INTO `knp_para` VALUES ('system.batch', '020', 'tranus', '%', '985S002', null, null, null, '批量交易默认虚拟柜员');
INSERT INTO `knp_para` VALUES ('system.config', '02001', 'appid', '%', '1253967667', 'idcard', null, null, '外调联网核查参数');
INSERT INTO `knp_para` VALUES ('system.config', '02001', 'corpno', '%', '985', '', '', '', '法人代码');
INSERT INTO `knp_para` VALUES ('system.config', '02001', 'tranbr', '%', '985000', '', '', '', '交易机构');
INSERT INTO `knp_para` VALUES ('system.config', '02001', 'tranus', '%', '9850001', '', '', '', '交易柜员');
INSERT INTO `knp_para` VALUES ('system.config', '02002', 'corpno', '%', '985', '', '', '', '法人代码');
INSERT INTO `knp_para` VALUES ('system.config', '02002', 'tranbr', '%', '985000', '', '', '', '交易机构');
INSERT INTO `knp_para` VALUES ('system.config', '02002', 'tranus', '%', '9850001', '', '', '', '交易柜员');

-- ----------------------------
-- Table structure for knp_secu_zpk
-- ----------------------------
DROP TABLE IF EXISTS `knp_secu_zpk`;
CREATE TABLE `knp_secu_zpk` (
  `systcd` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '系统标识号',
  `zpkval` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '密钥ZPK',
  `remark` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`systcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knp_secu_zpk
-- ----------------------------

-- ----------------------------
-- Table structure for knp_svcx
-- ----------------------------
DROP TABLE IF EXISTS `knp_svcx`;
CREATE TABLE `knp_svcx` (
  `svtpid` varchar(80) COLLATE utf8_bin NOT NULL COMMENT '业务服务类型ID',
  `svimky` varchar(80) COLLATE utf8_bin NOT NULL COMMENT '业务服务实现关键字',
  `svimid` varchar(80) COLLATE utf8_bin NOT NULL COMMENT '业务服务实现ID',
  `remark` text COLLATE utf8_bin NOT NULL COMMENT '备注信息',
  PRIMARY KEY (`svtpid`,`svimky`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knp_svcx
-- ----------------------------

-- ----------------------------
-- Table structure for knp_txns
-- ----------------------------
DROP TABLE IF EXISTS `knp_txns`;
CREATE TABLE `knp_txns` (
  `prcscd` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '交易码',
  `tranna` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '交易名称',
  `trantp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '交易类型',
  `vermac` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '验MAC标志',
  `verpin` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '验PIN标志',
  `sacotg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '当日抹账允许标志',
  `necotg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '隔日抹账允许标志',
  `inprcd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '内部处理码',
  `meunas` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单归属',
  `allofg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许执行',
  `pckgfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否登记包流水日志',
  `trsqfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否登交易流水日志',
  `overtm` bigint(19) DEFAULT NULL COMMENT '超时时间',
  `thspty` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT 'NotSupported' COMMENT '事务传播方式',
  `enrefg` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否启用路由',
  `bkdtfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许倒起息',
  `readfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否读写分离',
  `redufg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否防重',
  `rverfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否冲正交易',
  `busqfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否必须业务流水',
  PRIMARY KEY (`prcscd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of knp_txns
-- ----------------------------
INSERT INTO `knp_txns` VALUES ('AS_CIF_ACOPRE', '电子账户开户请求', '2', '0', '0', '0', '0', 'acopre', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_ACUSWR', '生成符合营销活动条件的客户信息', '2', '0', '0', '0', '0', 'acuswr', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_BCACUS', '客户信息生成活动用户信息', '2', '0', '0', '0', '0', 'bcacus', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_BSWTCK', '业务白名单校验', '2', '0', '0', '0', '0', 'bswtck', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_CFAGEN', '生成开户CFCA', '2', '0', '0', '0', '0', 'cfagen', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_CFASER', '查询开户cfca记录', '2', '0', '0', '0', '0', 'cfaser', 'us', '1', '1', '1', '60000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_CHQUAN', '校验安全问题答案', '0', '0', '0', '0', '0', 'chquan', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_CUDOWN', '客户降级交易', '2', '0', '0', '0', '0', 'cudown', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_CURALE', '升级用户为三级客户', '2', '0', '0', '0', '0', 'curalv', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_DLILUR', '处理异常用户', '2', '0', '0', '0', '0', 'dlilur', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_DLURVE', '删除异常用户发送验证码', '2', '0', '0', '0', '0', 'dlurve', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_DLWHLT', '删除白，黑，灰，红名单交易配置', '2', '0', '0', '0', '0', 'dlwhlt', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_IDAURE', '身份认证信息维护请求', '2', '0', '0', '0', '0', 'idaure', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_IDCKRE', '身份核查请求', '2', '0', '0', '0', '0', 'idckre', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_IDPRCK', '身份预核查', '2', '0', '0', '0', '0', 'idprck', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_ILESER', '查询2级用户信息', '2', '0', '0', '0', '0', 'ileser', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_INIDNU', '面签身份核查', '2', '0', '0', '0', '0', 'inidnu', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_INQUAN', '保存安全问题答案', '2', '0', '0', '0', '0', 'inquan', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_INUSER', '用户注册', '2', '0', '0', '0', '0', 'inuser', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_OCCKID', '修改手机号码客户信息系统验证身份', '0', '0', '0', '0', '0', 'occkid', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRCHEC', '根据流水号查询核查信息', '0', '0', '0', '0', '0', 'qrchec', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRCUAG', '客户协议查询', '0', '0', '0', '0', '0', 'qrcuag', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRCUBA', '个人客户信息查询——统一内管', '0', '0', '0', '0', '0', 'qrcuba', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRCUOD', '查询用户操作历史记录详细', '2', '0', '0', '0', '0', 'qrcuod', 'us', '1', '1', '1', '6000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRCUOS', '查询用户操作记录', '2', '0', '0', '0', '0', 'qrcuos', 'us', '1', '1', '1', '6000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRECIF', '查询用户电子账户开户信息', '2', '0', '0', '0', '0', 'qrecif', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QROCRR', '查询OCR记录', '2', '0', '0', '0', '0', 'qrocrr', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRREFP', '为活动用户查询推荐人信息', '2', '0', '0', '0', '0', 'qrrefp', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRRSHS', '查询风评历史记录', '2', '0', '0', '0', '0', 'qrrshs', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRRSOF', '查询风评线下记录', '2', '0', '0', '0', '0', 'qrrsof', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRSYSQ', '获取系统中安全问题', '0', '0', '0', '0', '0', 'qrsysq', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRUSAD', '用户联系地址查询', '0', '0', '0', '0', '0', 'qrusad', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRUSBA', '用户基本信息查询', '0', '0', '0', '0', '0', 'qrusba', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRUSLN', '用户名查询', '0', '0', '0', '0', '0', 'qrusln', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRUSPH', '用户手机号查询', '0', '0', '0', '0', '0', 'qrusph', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRUSQU', '获取用户设置安全问题', '0', '0', '0', '0', '0', 'qrusqu', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRUSST', '用户状态查询', '0', '0', '0', '0', '0', 'qrusst', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_QRYCFA', '内管开户协议查询', '2', '0', '0', '0', '0', 'qrycfa', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_REFIIN', '接受文件交互处理', '2', '0', '0', '0', '0', 'refiin', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_REIDCK', '接收联网核查结果', '2', '0', '0', '0', '0', 'reidck', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_SAOCRR', '保存OCR记录', '2', '0', '0', '0', '0', 'saocrr', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_SAWHLT', '增加白，黑，灰，红名单交易配置', '2', '0', '0', '0', '0', 'sawhlt', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_SLWHLT', '查询白，黑，灰，红名单交易配置', '2', '0', '0', '0', '0', 'slwhlt', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPACAC', '非活跃账户激活', '2', '0', '0', '0', '0', 'upacac', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPCUPH', '手机号码修改——统一内管', '2', '0', '0', '0', '0', 'upcuph', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPCURI', '增加/修改客户风险等级评价', '2', '0', '0', '0', '0', 'upcuri', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPCUST', '客户锁定/解锁——统一内管', '2', '0', '0', '0', '0', 'upcust', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPGRWT', '移动灰名单数据到黑名单', '2', '0', '0', '0', '0', 'upgrwt', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPSEME', '内管发送短信接口', '2', '0', '0', '0', '0', 'upseme', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPTXTP', '更新客户税收类型', '2', '0', '0', '0', '0', 'uptxtp', 'us', '1', '1', '1', '6000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPUPCU', '游客升级为3级普通客户', '2', '0', '0', '0', '0', 'upupcu', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPUSAD', '用户联系地址信息维护', '2', '0', '0', '0', '0', 'upusad', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPUSBA', '用户基本信息维护', '2', '0', '0', '0', '0', 'upusba', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPUSPH', '手机号码修改', '2', '0', '0', '0', '0', 'upusph', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPUSST', '用户临时锁定', '2', '0', '0', '0', '0', 'upusst', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPUXCM', '维护客户通用信息', '2', '0', '0', '0', '0', 'upuxcm', 'us', '1', '1', '1', '6000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('AS_CIF_UPWHLT', '修改白，黑，灰，红名单交易配置', '2', '0', '0', '0', '0', 'upwhlt', 'us', '1', '1', '1', '25000', 'NotSupported', '0', null, null, '1', null, null);
INSERT INTO `knp_txns` VALUES ('cuagsi', '客户协议签约/解约', '0', '0', '0', '0', '0', 'cuagsi', 'us', '1', '', '1', '25000', 'NotSupported', '0', null, null, '', null, null);
INSERT INTO `knp_txns` VALUES ('reacbi', '接收账户绑定/解绑', '0', '0', '0', '0', '0', 'reacbi', 'us', '1', '', '1', '25000', 'NotSupported', '0', null, null, '', null, null);
INSERT INTO `knp_txns` VALUES ('reaccl', '接收电子账户销户', '0', '0', '0', '0', '0', 'reaccl', 'us', '1', '', '1', '25000', 'NotSupported', '0', null, null, '', null, null);
INSERT INTO `knp_txns` VALUES ('reacop', '接收电子账户开户消息', '0', '0', '0', '0', '0', 'reacop', 'us', '1', '', '1', '25000', 'NotSupported', '0', null, null, '', null, null);

-- ----------------------------
-- Table structure for kns_pck2
-- ----------------------------
DROP TABLE IF EXISTS `kns_pck2`;
CREATE TABLE `kns_pck2` (
  `pckgdt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '报文日期',
  `pckgsq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '报文流水',
  `requme` text COLLATE utf8_bin COMMENT '请求报文',
  `respme` text COLLATE utf8_bin COMMENT '响应报文',
  PRIMARY KEY (`pckgsq`,`pckgdt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kns_pck2
-- ----------------------------

-- ----------------------------
-- Table structure for kns_pckg
-- ----------------------------
DROP TABLE IF EXISTS `kns_pckg`;
CREATE TABLE `kns_pckg` (
  `pckgdt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '报文日期',
  `pckgsq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '报文流水',
  `trandt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '交易日期',
  `transq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '交易流水',
  `mdcnno` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '主调DCN号',
  `cdcnno` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT 'DCN编号',
  `prcscd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '交易码',
  `servtp` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道',
  `tranus` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '交易柜员',
  `hostdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '主机日期',
  `startm` bigint(19) DEFAULT NULL COMMENT '开始时间',
  `endttm` bigint(19) DEFAULT NULL COMMENT '结束时间',
  `trantc` bigint(19) DEFAULT NULL COMMENT '交易耗时',
  `trbrch` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '交易机构',
  `sepsno` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '服务通道号',
  `hostip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '服务器IP地址',
  `vmidxx` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '应用虚拟机号',
  `requme` text COLLATE utf8_bin COMMENT '请求报文',
  `respme` text COLLATE utf8_bin COMMENT '响应报文',
  `smrycd` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '摘要代码',
  `abstds` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '摘要描述',
  `errosk` text COLLATE utf8_bin COMMENT '错误堆栈',
  `errocd` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '错误代码',
  `errotx` text COLLATE utf8_bin COMMENT '错误信息',
  `biglog` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否登记报文表副表',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  PRIMARY KEY (`pckgsq`,`pckgdt`),
  UNIQUE KEY `kns_pckg_uk2` (`transq`,`trandt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kns_pckg
-- ----------------------------

-- ----------------------------
-- Table structure for kns_redu
-- ----------------------------
DROP TABLE IF EXISTS `kns_redu`;
CREATE TABLE `kns_redu` (
  `inpudt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '上送系统日期',
  `inpusq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '上送系统流水',
  `retrtm` int(3) NOT NULL COMMENT '重发次数',
  `trandt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '交易日期',
  `transq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '交易流水',
  `pckgdt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '报文日期',
  `pckgsq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '报文流水',
  `cdcnno` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT 'DCN编号',
  `busisq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '业务流水',
  `mntrsq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '主交易流水',
  `prcscd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '交易码',
  `trantm` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '交易时间',
  `txnsts` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '交易状态',
  `errocd` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '错误代码',
  `corpno` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代码',
  PRIMARY KEY (`inpusq`,`inpudt`,`retrtm`),
  UNIQUE KEY `kns_redu_uk2` (`pckgsq`,`pckgdt`),
  UNIQUE KEY `kns_redu_uk3` (`transq`,`trandt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kns_redu
-- ----------------------------

-- ----------------------------
-- Table structure for kns_tran
-- ----------------------------
DROP TABLE IF EXISTS `kns_tran`;
CREATE TABLE `kns_tran` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `trandt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '交易日期',
  `transq` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '交易流水',
  `mntrsq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '主交易流水',
  `mntrfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主交易',
  `prcscd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '交易码',
  `aptrtp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '交易类型',
  `trantm` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '交易时间',
  `tranus` varchar(7) COLLATE utf8_bin NOT NULL COMMENT '交易柜员',
  `busisq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '业务流水',
  `systcd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '子系统编号',
  `cdcnno` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT 'DCN编号',
  `dtxnst` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '分布式交易状态',
  `trbrch` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '交易机构',
  `authus` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '授权柜员',
  `servtp` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道',
  `crcycd` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '币种',
  `tranam` decimal(21,2) DEFAULT NULL COMMENT '交易金额',
  `rviast` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主动冲正',
  `rvcdfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '当日抹账允许标志',
  `rvodfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '隔日抹账允许标志',
  `rvcdrs` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '当日冲正拒绝原因',
  `rvodrs` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '隔日冲正拒绝原因',
  `rvfxst` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '冲补账状态',
  `rverdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '冲正日期',
  `rverus` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '冲正柜员',
  `rverbr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '冲正机构',
  `rversq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '冲正交易流水号',
  `origdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '原错误日期',
  `origsq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '原错账流水号',
  `cstrfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '现转标志',
  `postst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '账务流水入账状态',
  `postvo` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '入账套号',
  `chacno` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '对账单号',
  `vochfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '特殊传票标志',
  `accofg` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否账务流水',
  `sqhotg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '勾对标志',
  `hookus` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '勾对柜员',
  `spaco1` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备用字段1',
  `spaco2` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备用字段2',
  `spaco3` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备用字段3',
  `spaco4` decimal(21,2) DEFAULT NULL COMMENT '备用字段4',
  `spaco5` decimal(21,2) DEFAULT NULL COMMENT '备用字段5',
  `spaco6` decimal(21,2) DEFAULT NULL COMMENT '备用字段6',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`transq`,`trandt`,`corpno`),
  KEY `kns_tran_idx1` (`chacno`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kns_tran
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_csbbxx
-- ----------------------------
DROP TABLE IF EXISTS `ksys_csbbxx`;
CREATE TABLE `ksys_csbbxx` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `canshudm` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '参数代码',
  `canshubb` int(11) NOT NULL DEFAULT '0' COMMENT '参数版本',
  `shijianc` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`xitongbs`,`farendma`,`canshudm`),
  UNIQUE KEY `index1` (`canshudm`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_csbbxx
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_cxzjsl
-- ----------------------------
DROP TABLE IF EXISTS `ksys_cxzjsl`;
CREATE TABLE `ksys_cxzjsl` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `chxizjbz` varchar(80) COLLATE utf8_bin NOT NULL COMMENT '抽象组件Schema路径ID',
  `zhongwmc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '中文名称',
  `zujianlx` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '组件类型',
  `zujiansx` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '组件实现Schema路径ID',
  `shifoudl` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否单例 0-非单例 1-单例',
  `shifoutb` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '是否同步调用 0-异步调用 1-同步调用 ',
  `miaoshxi` varchar(400) COLLATE utf8_bin NOT NULL COMMENT '描述信息',
  PRIMARY KEY (`xitongbs`,`farendma`,`chxizjbz`),
  UNIQUE KEY `ksys_cxzjsl_index` (`chxizjbz`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_cxzjsl
-- ----------------------------
INSERT INTO `ksys_cxzjsl` VALUES ('020', '985', 'AbstractComponent.FileTransfer', '组件测试', 'FaBaseComp.FileTransfer', 'FileTransferImpl.NFSFileTransfer', '0', '1', '无');
INSERT INTO `ksys_cxzjsl` VALUES ('020', '985', 'batchComp.BatchDataFileTransport', '同步组件测试', 'BaseComp.FileTransfer', 'FileTransferImpl.NFSFileTransfer', '0', '1', '无');

-- ----------------------------
-- Table structure for ksys_dsddrz
-- ----------------------------
DROP TABLE IF EXISTS `ksys_dsddrz`;
CREATE TABLE `ksys_dsddrz` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljypich` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量任务批次号',
  `jiaoyirq` date DEFAULT NULL COMMENT '交易日期',
  `pljyzbsh` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易组ID',
  `piljybss` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易ID',
  `fuwbiaoz` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '服务标识',
  `diaodumc` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `diaodurq` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '调度日期',
  `diaodusj` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '调度时间',
  `diaoduzt` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '调度状态',
  `miaosxxi` text COLLATE utf8_bin COMMENT '描述信息',
  `pljylcbs` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易流程ID',
  `zhixleim` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '执行类名',
  PRIMARY KEY (`pljypich`,`diaodumc`,`diaodurq`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_dsddrz
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_dsrwdd
-- ----------------------------
DROP TABLE IF EXISTS `ksys_dsrwdd`;
CREATE TABLE `ksys_dsrwdd` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `diaodumc` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `zhixleim` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '执行类名',
  `pljylcbs` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易流程ID',
  `pljyzbsh` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易组ID',
  `piljybss` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易ID',
  `diaoducs` text COLLATE utf8_bin COMMENT '调度参数',
  `dduniann` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '调度年',
  `diaodxqi` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '调度星期几（0-6）',
  `diaodyue` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '月份',
  `dijitian` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '每月第几天',
  `xiaoshii` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '小时',
  `fenzhong` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '分钟',
  `miaooooo` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '秒',
  `zidshanc` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '自动删除标识',
  `dengjriz` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否登记日志',
  `shifoutb` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否同步调用 0-异步调用 1-同步调用 ',
  `diaoduzt` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '调度状态',
  `rwyxxktj` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '批量任务运行许可条件',
  `miaosxxi` text COLLATE utf8_bin COMMENT '描述信息',
  `pljypich` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '批量任务批次号',
  `zxtongbh` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '子系统编号',
  PRIMARY KEY (`xitongbs`,`farendma`,`diaodumc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_dsrwdd
-- ----------------------------
INSERT INTO `ksys_dsrwdd` VALUES ('020', '985', 'chgday', '', '', '1900', 'chgday', '', '?', '?', '*', '*', '00', '00', '03', '0', '0', '1', 'SCHEDULING', '', 0xE697A5E58887, 'chgdaybatch.EC1AC195172C4C119180F5770B4565A0', '02002');
INSERT INTO `ksys_dsrwdd` VALUES ('020', '985', 'opgold', null, null, '0205', 'opgold', null, '?', '?', '*', '*', '*', '*', '*/30', '0', '0', '1', 'SCHEDULING', null, 0xE5AE9AE697B6E9BB84E98791E6B3A8E5868C, 'opgoldbatch.627CBE045F5A48C9B48A83552EAA6800', '02002');
INSERT INTO `ksys_dsrwdd` VALUES ('020', '985', 'rstalg', null, null, '0207', 'rstalg', null, '?', '?', '*', '*', '*', '*/1', '0', '0', '0', '1', 'SCHEDULING', null, 0xE7BABFE4B88BE9A38EE999A9E8AF84E7BAA7E4BFA1E681AFE5908CE6ADA5, 'rstalgbatch.C364FA4310EA4DAAB81F91C28B32ADF4', '02002');
INSERT INTO `ksys_dsrwdd` VALUES ('020', '985', 'upcurk', null, null, '0206', 'upcurk', null, '?', '?', '*', '*', '*', '*/1', '0', '0', '0', '1', 'SCHEDULING', null, 0xE69BB4E696B0E5AEA2E688B7E9A38EE999A9E8AF84E7BAA7, 'upcurkbatch.233B8BC03A5E4E8388F331B345588FF4', '02002');
INSERT INTO `ksys_dsrwdd` VALUES ('020', '985', 'upidov', null, null, '0202', 'upidov', null, '?', '?', '*', '*', '9', '0', '0', '0', '0', '1', 'SCHEDULING', null, 0xE5AE9AE697B6E5A484E79086E8BAABE4BBBDE8AF81E5BFABE8BF87E69C9FE79A84E5AEA2E688B7, 'upidovbatch.F0F1BC2831634545826F23141D484452', '02002');
INSERT INTO `ksys_dsrwdd` VALUES ('020', '985', 'upreov', null, null, '0204', 'upreov', null, '?', '?', '*', '*', '*', '*/1', '0', '0', '0', '1', 'SCHEDULING', null, 0xE5AE9AE697B6E5A484E79086E5A496E8B083E5938DE5BA94E8B685E697B6, 'upreovbatch.37E0A6A3CAEC4B5D88DE3D94E1F773D2', '02002');
INSERT INTO `ksys_dsrwdd` VALUES ('020', '985', 'upteus', null, null, '0201', 'upteus', null, '?', '?', '*', '*', '0', '0', '0', '0', '0', '1', 'STOPPED', null, 0xE5AE9AE697B6E8A7A3E99481E4B8B4E697B6E99481E5AE9AE78AB6E68081E79A84E794A8E688B7, 'upteusbatch.', '02002');
INSERT INTO `ksys_dsrwdd` VALUES ('020', '985', '批量发送消息组1', 'cn.sunline.ltts.amsg.util.AsyncMessageBatchUtil', '', '', '', 0x207B22636F6D6D5F726571223A7B226D617847726F75704964223A22323030222C226D696E47726F75704964223A2230222C22636F72706E6F223A22393835222C22696E70756364223A22434D50227D2C22737973223A7B22636F72706E6F223A22393835227D7D, '?', '?', '*', '*', '*', '*', '5', '0', '1', null, 'SCHEDULING', '', 0xE689B9E9878FE6B688E681AFE58F91E98081E58886E7BB8431, '', '02002');
INSERT INTO `ksys_dsrwdd` VALUES ('020', '985', '批量发送短信1', 'cn.sunline.ltts.amsg.util.SMSBatchNowSendUtil', '', '', '', 0x7B22636F6D6D5F726571223A7B226D617847726F75704964223A22323030222C226D696E47726F75704964223A2230222C22636F72706E6F223A22393835222C22696E70756364223A22434946222C227472616E6272223A22393835303030222C227472616E7573223A2239383553303032227D2C22737973223A7B22636F72706E6F223A22393835227D7D, '?', '?', '*', '*', '*', '*', '5', '0', '1', null, 'SCHEDULING', '', 0xE689B9E9878FE58F91E98081E79FADE4BFA1, '', '02002');

-- ----------------------------
-- Table structure for ksys_dsrzzx
-- ----------------------------
DROP TABLE IF EXISTS `ksys_dsrzzx`;
CREATE TABLE `ksys_dsrzzx` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljylcbs` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '批量交易流程ID',
  `dqrizriq` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '当前日终日期',
  `zddcnges` int(11) NOT NULL DEFAULT '0' COMMENT '总共DCN个数',
  `cgdcnges` int(11) NOT NULL DEFAULT '0' COMMENT '成功DCN个数',
  PRIMARY KEY (`pljylcbs`,`dqrizriq`,`farendma`,`xitongbs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_dsrzzx
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_fwbdxx
-- ----------------------------
DROP TABLE IF EXISTS `ksys_fwbdxx`;
CREATE TABLE `ksys_fwbdxx` (
  `bdid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '服务绑定ID',
  `fwlxid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '服务类型ID',
  `fwlxsxid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '服务类型实现ID',
  `zxqid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '执行器ID',
  PRIMARY KEY (`bdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_fwbdxx
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_fwcjxx
-- ----------------------------
DROP TABLE IF EXISTS `ksys_fwcjxx`;
CREATE TABLE `ksys_fwcjxx` (
  `zxtongbh` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '子系统编号',
  `waibfwma` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '外部服务码',
  `waibcjma` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '外部场景码',
  `ywfwbdid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '业务服务接口绑定ID',
  `fuwumosh` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'S' COMMENT '服务模式',
  `yunxzxbz` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '是否允许执行',
  `neibfwma` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '内部服务码',
  `miaosxxi` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `fuwuleix` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '外部服务类型',
  `txxybzhi` varchar(40) COLLATE utf8_bin DEFAULT 'defaultProtocol' COMMENT '通讯协议标识',
  PRIMARY KEY (`waibfwma`,`waibcjma`),
  UNIQUE KEY `ksys_fwcjxx_uidx1` (`waibfwma`,`waibcjma`),
  KEY `ksys_fwcjxx_idx2` (`zxtongbh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_fwcjxx
-- ----------------------------
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_ACOPRE', '0', '*', 'S', '1', 'AS_CIF_ACOPRE', '电子账户开户请求', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_ACOPRE', '0_000', '*', 'S', '1', 'AS_CIF_ACOPRE', '电子账户开户请求', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_ACUSWR', '0', '*', 'S', '1', 'AS_CIF_ACUSWR', '生成符合营销活动条件的客户信息', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_ACUSWR', '0_000', '*', 'S', '1', 'AS_CIF_ACUSWR', '生成符合营销活动条件的客户信息', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_BCACUS', '0', '*', 'S', '1', 'AS_CIF_BCACUS', '客户信息生成活动用户信息', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_BCACUS', '0_000', '*', 'S', '1', 'AS_CIF_BCACUS', '客户信息生成活动用户信息', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_BSWTCK', '0', '*', 'S', '1', 'AS_CIF_BSWTCK', '业务白名单校验', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_CFAGEN', '0', '*', 'S', '1', 'AS_CIF_CFAGEN', '生成开户CFCA', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_CFASER', '0', '*', 'S', '1', 'AS_CIF_CFASER', '查询开户cfca记录', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_CHQUAN', '0', '*', 'S', '1', 'AS_CIF_CHQUAN', '校验安全问题答案', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_CHQUAN', '0_000', '*', 'S', '1', 'AS_CIF_CHQUAN', '校验安全问题答案', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_CUAGSI', '0', '*', 'A', '1', 'cuagsi', '客户协议签约/解约', 'T', 'Q0201001000');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_CUDOWN', '0', '*', 'S', '1', 'AS_CIF_CUDOWN', '客户降级交易', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_CUDOWN', '0_000', '*', 'S', '1', 'AS_CIF_CUDOWN', '客户降级交易', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_CURALE', '0', '*', 'S', '1', 'AS_CIF_CURALE', '升级用户为三级客户', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_CURALE', '0_000', '*', 'S', '1', 'AS_CIF_CURALE', '升级用户为三级客户', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_DLILUR', '0', '*', 'S', '1', 'AS_CIF_DLILUR', '处理异常用户', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_DLURVE', '0', '*', 'S', '1', 'AS_CIF_DLURVE', '删除异常用户发送验证码', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_DLWHLT', '0', '*', 'S', '1', 'AS_CIF_DLWHLT', '删除白，黑，灰，红名单交易配置', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_IDAURE', '0', '*', 'S', '1', 'AS_CIF_IDAURE', '身份认证信息维护请求', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_IDAURE', '0_000', '*', 'S', '1', 'AS_CIF_IDAURE', '身份认证信息维护请求', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_IDCKRE', '0', '*', 'S', '1', 'AS_CIF_IDCKRE', '身份核查请求', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_IDCKRE', '0_000', '*', 'S', '1', 'AS_CIF_IDCKRE', '身份核查请求', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_IDPRCK', '0', '*', 'S', '1', 'AS_CIF_IDPRCK', '身份预核查', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_IDPRCK', '0_000', '*', 'S', '1', 'AS_CIF_IDPRCK', '身份预核查', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_ILESER', '0', '*', 'S', '1', 'AS_CIF_ILESER', '查询2级用户信息', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_INIDNU', '0', '*', 'S', '1', 'AS_CIF_INIDNU', '面签身份核查', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_INIDNU', '0_000', '*', 'S', '1', 'AS_CIF_INIDNU', '面签身份核查', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_INQUAN', '0', '*', 'S', '1', 'AS_CIF_INQUAN', '保存安全问题答案', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_INQUAN', '0_000', '*', 'S', '1', 'AS_CIF_INQUAN', '保存安全问题答案', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_INUSER', '0', '*', 'S', '1', 'AS_CIF_INUSER', '用户注册', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_INUSER', '0_000', '*', 'S', '1', 'AS_CIF_INUSER', '用户注册', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_OCCKID', '0', '*', 'S', '1', 'AS_CIF_OCCKID', '修改手机号码客户信息系统验证身份', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_OCCKID', '0_000', '*', 'S', '1', 'AS_CIF_OCCKID', '修改手机号码客户信息系统验证身份', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRCHEC', '0', '*', 'S', '1', 'AS_CIF_QRCHEC', '根据流水号查询核查信息', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRCHEC', '0_000', '*', 'S', '1', 'AS_CIF_QRCHEC', '根据流水号查询核查信息', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRCUAG', '0', '*', 'S', '1', 'AS_CIF_QRCUAG', '客户协议查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRCUAG', '0_000', '*', 'S', '1', 'AS_CIF_QRCUAG', '客户协议查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRCUBA', '0', '*', 'S', '1', 'AS_CIF_QRCUBA', '个人客户信息查询——统一内管', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRCUBA', '0_000', '*', 'S', '1', 'AS_CIF_QRCUBA', '个人客户信息查询——统一内管', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRCUOD', '0', '*', 'S', '1', 'AS_CIF_QRCUOD', '查询用户操作历史记录详细', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRCUOS', '0', '*', 'S', '1', 'AS_CIF_QRCUOS', '查询用户操作记录', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRECIF', '0', '*', 'S', '1', 'AS_CIF_QRECIF', '查询用户电子账户开户信息', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QROCRR', '0', '*', 'S', '1', 'AS_CIF_QROCRR', '查询OCR记录', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRREFP', '0', '*', 'S', '1', 'AS_CIF_QRREFP', '为活动用户查询推荐人信息', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRRSHS', '0', '*', 'S', '1', 'AS_CIF_QRRSHS', '查询风评历史记录', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRRSOF', '0', '*', 'S', '1', 'AS_CIF_QRRSOF', '查询风评线下记录', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRSYSQ', '0', '*', 'S', '1', 'AS_CIF_QRSYSQ', '获取系统中安全问题', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRSYSQ', '0_000', '*', 'S', '1', 'AS_CIF_QRSYSQ', '获取系统中安全问题', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRUSAD', '0', '*', 'S', '1', 'AS_CIF_QRUSAD', '用户联系地址查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRUSAD', '0_000', '*', 'S', '1', 'AS_CIF_QRUSAD', '用户联系地址查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRUSBA', '0', '*', 'S', '1', 'AS_CIF_QRUSBA', '用户基本信息查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRUSBA', '0_000', '*', 'S', '1', 'AS_CIF_QRUSBA', '用户基本信息查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRUSLN', '0', '*', 'S', '1', 'AS_CIF_QRUSLN', '用户名查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRUSLN', '0_000', '*', 'S', '1', 'AS_CIF_QRUSLN', '用户名查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRUSPH', '0', '*', 'S', '1', 'AS_CIF_QRUSPH', '用户手机号查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRUSPH', '0_000', '*', 'S', '1', 'AS_CIF_QRUSPH', '用户手机号查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRUSQU', '0', '*', 'S', '1', 'AS_CIF_QRUSQU', '获取用户设置安全问题', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRUSQU', '0_000', '*', 'S', '1', 'AS_CIF_QRUSQU', '获取用户设置安全问题', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRUSST', '0', '*', 'S', '1', 'AS_CIF_QRUSST', '用户状态查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRUSST', '0_000', '*', 'S', '1', 'AS_CIF_QRUSST', '用户状态查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_QRYCFA', '0', '*', 'S', '1', 'AS_CIF_QRYCFA', '内管开户协议查询', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_REACBI', '0', '*', 'A', '1', 'reacbi', '接收账户绑定/解绑', 'T', 'Q0201001000');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_REACCL', '0', '*', 'A', '1', 'reaccl', '接收电子账户销户', 'T', 'Q0201001000');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_REACOP', '0', '*', 'A', '1', 'reacop', '接收电子账户开户消息', 'T', 'Q0201001000');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_REFIIN', '0', '*', 'S', '1', 'AS_CIF_REFIIN', '接受交互文件处理', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_REFIIN', '0_000', '*', 'S', '1', 'AS_CIF_REFIIN', '接受交互文件处理', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_REIDCK', '0', '*', 'S', '1', 'AS_CIF_REIDCK', '接收联网核查结果', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_REIDCK', '0_000', '*', 'S', '1', 'AS_CIF_REIDCK', '接收联网核查结果', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_SAOCRR', '0', '*', 'S', '1', 'AS_CIF_SAOCRR', '保存OCR记录', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_SAWHLT', '0', '*', 'S', '1', 'AS_CIF_SAWHLT', '增加白，黑，灰，红名单交易配置', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_SLWHLT', '0', '*', 'S', '1', 'AS_CIF_SLWHLT', '查询白，黑，灰，红名单交易配置', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPACAC', '0', '*', 'S', '1', 'AS_CIF_UPACAC', '非活跃账户激活', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPACAC', '0_000', '*', 'S', '1', 'AS_CIF_UPACAC', '非活跃账户激活', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPCUPH', '0', '*', 'S', '1', 'AS_CIF_UPCUPH', '手机号码修改——统一内管', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPCUPH', '0_000', '*', 'S', '1', 'AS_CIF_UPCUPH', '手机号码修改——统一内管', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPCURI', '0', '*', 'S', '1', 'AS_CIF_UPCURI', '增加/修改客户风险等级评价', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPCURI', '0_000', '*', 'S', '1', 'AS_CIF_UPCURI', '增加/修改客户风险等级评价', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPCUST', '0', '*', 'S', '1', 'AS_CIF_UPCUST', '客户锁定/解锁——统一内管', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPCUST', '0_000', '*', 'S', '1', 'AS_CIF_UPCUST', '客户锁定/解锁——统一内管', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPGRWT', '0', '*', 'S', '1', 'AS_CIF_UPGRWT', '移动灰名单数据到黑名单', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPSEME', '0', '*', 'S', '1', 'AS_CIF_UPSEME', '内管发送短信接口', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPSEME', '0_000', '*', 'S', '1', 'AS_CIF_UPSEME', '内管发送短信接口', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPTXTP', '0', '*', 'S', '1', 'AS_CIF_UPTXTP', '更新客户税收类型', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPUPCU', '0', '*', 'S', '1', 'AS_CIF_UPUPCU', '游客升级为3级普通客户', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPUPCU', '0_000', '*', 'S', '1', 'AS_CIF_UPUPCU', '游客升级为3级普通客户', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPUSAD', '0', '*', 'S', '1', 'AS_CIF_UPUSAD', '用户联系地址信息维护', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPUSAD', '0_000', '*', 'S', '1', 'AS_CIF_UPUSAD', '用户联系地址信息维护', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPUSBA', '0', '*', 'S', '1', 'AS_CIF_UPUSBA', '用户基本信息维护', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPUSBA', '0_000', '*', 'S', '1', 'AS_CIF_UPUSBA', '用户基本信息维护', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPUSPH', '0', '*', 'S', '1', 'AS_CIF_UPUSPH', '手机号码修改', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPUSPH', '0_000', '*', 'S', '1', 'AS_CIF_UPUSPH', '手机号码修改', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPUSST', '0', '*', 'S', '1', 'AS_CIF_UPUSST', '用户临时锁定', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPUSST', '0_000', '*', 'S', '1', 'AS_CIF_UPUSST', '用户临时锁定', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPUXCM', '0', '*', 'S', '1', 'AS_CIF_UPUXCM', '维护客户通用信息', 'T', 'defaultProtocol');
INSERT INTO `ksys_fwcjxx` VALUES ('02001', 'AS_CIF_UPWHLT', '0', '*', 'S', '1', 'AS_CIF_UPWHLT', '修改白，黑，灰，红名单交易配置', 'T', 'defaultProtocol');

-- ----------------------------
-- Table structure for ksys_fwjdbdys
-- ----------------------------
DROP TABLE IF EXISTS `ksys_fwjdbdys`;
CREATE TABLE `ksys_fwjdbdys` (
  `jylcid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '交易流程ID',
  `fwjdid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '流程节点ID',
  `bdid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '服务绑定ID',
  PRIMARY KEY (`jylcid`,`fwjdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_fwjdbdys
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_global_journal
-- ----------------------------
DROP TABLE IF EXISTS `ksys_global_journal`;
CREATE TABLE `ksys_global_journal` (
  `globalseqno` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '主事务流水号',
  `outerseqno` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '外部流水号',
  `outerdate` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '外部发生日期',
  `controllerid` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '服务控制器ID',
  `begintime` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `status` varchar(15) COLLATE utf8_bin DEFAULT 'UNSUCCEED' COMMENT '交易状态',
  `vmid` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '虚拟机ID',
  `systemid` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '系统标识ID',
  PRIMARY KEY (`globalseqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_global_journal
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_jykzhq
-- ----------------------------
DROP TABLE IF EXISTS `ksys_jykzhq`;
CREATE TABLE `ksys_jykzhq` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljyzbsh` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '批量交易组ID',
  `buzhouha` int(8) NOT NULL DEFAULT '0' COMMENT '步骤号',
  `pljioyma` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '批量交易码',
  `pljyzwmc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易中文名称',
  `zhixbzhi` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '执行标识',
  `ylpljylb` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '依赖批量交易列表',
  `jyyxxktj` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易运行许可条件',
  `chlcishu` int(8) DEFAULT '0' COMMENT '重连次数',
  `shbzhdbz` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '失败中断标识',
  `shiwtjjg` int(8) DEFAULT '0' COMMENT '事务提交间隔（单位：笔数）',
  `shujcfms` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '数据拆分模式',
  `shujcfzj` text COLLATE utf8_bin COMMENT '数据拆分主键',
  `plzyzxms` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '批量作业执行模式',
  `zuidzybf` int(8) DEFAULT '0' COMMENT '最大作业并发数',
  `rizhijib` int(8) DEFAULT '0' COMMENT '日志级别',
  `zuoycftj` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '作业拆分条件（区间）',
  `pljyyxms` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '批量任务运行模式',
  `ngftiaog` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '能否跳过',
  `sfwenjpl` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '是否文件批量',
  `jiaoyilx` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '交易类型',
  PRIMARY KEY (`xitongbs`,`farendma`,`pljyzbsh`,`buzhouha`,`pljioyma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_jykzhq
-- ----------------------------
INSERT INTO `ksys_jykzhq` VALUES ('020', '985', '0201', '1', 'upteus', '定时解锁临时锁定状态的用户', '1', null, null, '0', '0', '2000', '9', null, '0', '0', '3', null, '0', '1', '0', '1');
INSERT INTO `ksys_jykzhq` VALUES ('020', '985', '0202', '1', 'upidov', '定时处理身份证快过期的客户', '1', null, null, '0', '0', '2000', '9', null, '0', '0', '3', null, '0', '1', '0', '1');
INSERT INTO `ksys_jykzhq` VALUES ('020', '985', '0203', '1', 'acuswrB', '生成符合活动条件的用户前处理', '1', null, null, '0', '0', '2000', '9', null, '0', '0', '3', null, '0', '1', '0', '1');
INSERT INTO `ksys_jykzhq` VALUES ('020', '985', '0203', '2', 'acuswr', '生成符合活动条件的用户信息文件', '1', null, null, '0', '0', '2000', '9', null, '0', '0', '3', null, '0', '1', '1', '1');
INSERT INTO `ksys_jykzhq` VALUES ('020', '985', '0204', '1', 'upreov', '定时处理外调响应超时', '1', null, null, '0', '0', '2000', '9', null, '0', '0', '3', null, '0', '1', '0', '1');
INSERT INTO `ksys_jykzhq` VALUES ('020', '985', '0205', '1', 'opgold', '定时黄金注册', '1', null, null, '0', '0', '2000', '9', null, '0', '0', '3', null, '0', '1', '0', '1');
INSERT INTO `ksys_jykzhq` VALUES ('020', '985', '0206', '1', 'upcurk', '更新客户风险评级', '1', null, null, '0', '0', '2000', '9', null, '0', '0', '3', null, '0', '1', '0', '1');
INSERT INTO `ksys_jykzhq` VALUES ('020', '985', '0207', '1', 'rstalg', '线下风险评级信息同步', '1', null, null, '0', '0', '2000', '9', null, '0', '0', '3', null, '0', '1', '1', '1');
INSERT INTO `ksys_jykzhq` VALUES ('020', '985', '0208', '1', 'gemtsm', '为营销活动生成短信', '1', null, null, '0', '0', '2000', '9', null, '0', '0', '3', null, '0', '1', '1', '1');
INSERT INTO `ksys_jykzhq` VALUES ('020', '985', '1900', '1', 'chgday', '日终切日', '1', null, null, '0', '0', '200', '9', null, '0', '0', '3', null, '0', '1', '0', '1');

-- ----------------------------
-- Table structure for ksys_jyrzmx
-- ----------------------------
DROP TABLE IF EXISTS `ksys_jyrzmx`;
CREATE TABLE `ksys_jyrzmx` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljypich` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量任务批次号',
  `plrwzxpc` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量任务执行批次号',
  `jyyxzxpc` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量交易执行批次号',
  `jiaoyirq` date DEFAULT NULL COMMENT '交易日期',
  `pljyzbsh` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '批量交易组ID',
  `buzhouha` int(8) NOT NULL DEFAULT '0' COMMENT '步骤号',
  `piljybss` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '批量交易ID',
  `picishjl` bigint(19) DEFAULT '0' COMMENT '批次数据数量',
  `chgfzjls` bigint(19) DEFAULT '0' COMMENT '成功分组记录数',
  `shbfzjls` bigint(19) DEFAULT '0' COMMENT '失败分组记录数',
  `chenggjl` bigint(19) DEFAULT '0' COMMENT '成功记录数',
  `shibaijl` bigint(19) DEFAULT '0' COMMENT '失败记录数',
  `bingfash` int(8) DEFAULT '0' COMMENT '并发数',
  `zuoyzxzt` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '作业执行状态',
  `jyksshij` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '交易开始时间',
  `kshishjc` bigint(19) DEFAULT NULL COMMENT '交易开始时间戳',
  `jyjsshij` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '交易结束时间',
  `jshishjc` bigint(19) DEFAULT NULL COMMENT '交易结束时间戳',
  `pljyzuhs` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易组执行耗时',
  `ljhaoshi` bigint(19) DEFAULT NULL COMMENT '累计耗时',
  `xinxiiii` text COLLATE utf8_bin COMMENT '信息',
  `cuowxinx` text COLLATE utf8_bin COMMENT '错误信息',
  `cuowduiz` text COLLATE utf8_bin COMMENT '错误堆栈',
  `cuowshuj` text COLLATE utf8_bin COMMENT '错误的数据',
  `xunijibs` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '虚拟机ID',
  `zhujimic` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '服务器主机名称',
  `ipdizhii` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'IP地址',
  `xiancmic` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '线程名称',
  PRIMARY KEY (`pljypich`,`plrwzxpc`,`jyyxzxpc`,`pljyzbsh`,`buzhouha`,`piljybss`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_jyrzmx
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_jyyxrz
-- ----------------------------
DROP TABLE IF EXISTS `ksys_jyyxrz`;
CREATE TABLE `ksys_jyyxrz` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljypich` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量任务批次号',
  `plrwzxpc` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '批量任务执行批次号',
  `jyyxzxpc` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易执行批次号',
  `jiaoyirq` date DEFAULT NULL COMMENT '交易日期',
  `pljyzbsh` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '批量交易组ID',
  `buzhouha` int(8) NOT NULL DEFAULT '0' COMMENT '步骤号',
  `piljybss` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '批量交易ID',
  `picishjl` bigint(19) DEFAULT '0' COMMENT '批次数据数量',
  `chgfzjls` bigint(19) DEFAULT '0' COMMENT '成功分组记录数',
  `shbfzjls` bigint(19) DEFAULT '0' COMMENT '失败分组记录数',
  `chenggjl` bigint(19) DEFAULT '0' COMMENT '成功记录数',
  `shibaijl` bigint(19) DEFAULT '0' COMMENT '失败记录数',
  `bingfash` int(8) DEFAULT '0' COMMENT '并发数',
  `zuoyzxzt` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '作业执行状态',
  `jyksshij` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '交易开始时间',
  `kshishjc` bigint(19) DEFAULT NULL COMMENT '交易开始时间戳',
  `jyjsshij` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '交易结束时间',
  `jshishjc` bigint(19) DEFAULT NULL COMMENT '交易结束时间戳',
  `pljyzuhs` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易组执行耗时',
  `ljhaoshi` bigint(19) DEFAULT NULL COMMENT '累计耗时',
  `xinxiiii` text COLLATE utf8_bin COMMENT '信息',
  `cuowxinx` text COLLATE utf8_bin COMMENT '错误信息',
  `cuowduiz` text COLLATE utf8_bin COMMENT '错误堆栈',
  `cuowshuj` text COLLATE utf8_bin COMMENT '错误的数据',
  `xunijibs` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '虚拟机ID',
  `zhujimic` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '服务器主机名称',
  `ipdizhii` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'IP地址',
  `xiancmic` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '线程名称',
  `yicitjzs` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '一次提交指示标志',
  `sfhuluee` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否忽略',
  PRIMARY KEY (`pljypich`,`pljyzbsh`,`buzhouha`,`piljybss`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_jyyxrz
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_jyzkzq
-- ----------------------------
DROP TABLE IF EXISTS `ksys_jyzkzq`;
CREATE TABLE `ksys_jyzkzq` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljyzbsh` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '批量交易组ID',
  `zubiezwm` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '交易组别中文描述',
  `rwyxxktj` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '批量任务运行许可条件',
  `rwyxhdfw` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '批量任务运行回调服务',
  PRIMARY KEY (`xitongbs`,`farendma`,`pljyzbsh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_jyzkzq
-- ----------------------------
INSERT INTO `ksys_jyzkzq` VALUES ('020', '985', '0201', '定时解锁临时锁定状态的用户', null, null);
INSERT INTO `ksys_jyzkzq` VALUES ('020', '985', '0202', '定时处理身份证快过期的客户', null, null);
INSERT INTO `ksys_jyzkzq` VALUES ('020', '985', '0203', '生成符合活动条件的用户信息文件', null, null);
INSERT INTO `ksys_jyzkzq` VALUES ('020', '985', '0204', '定时处理外调响应超时', null, null);
INSERT INTO `ksys_jyzkzq` VALUES ('020', '985', '0205', '定时黄金注册', null, null);
INSERT INTO `ksys_jyzkzq` VALUES ('020', '985', '0206', '更新客户风险评级状态', null, null);
INSERT INTO `ksys_jyzkzq` VALUES ('020', '985', '0207', '线下风险评级信息同步', null, null);
INSERT INTO `ksys_jyzkzq` VALUES ('020', '985', '0208', '为营销活动生成短信', null, null);
INSERT INTO `ksys_jyzkzq` VALUES ('020', '985', '1900', '日终换日', null, null);

-- ----------------------------
-- Table structure for ksys_liusdy
-- ----------------------------
DROP TABLE IF EXISTS `ksys_liusdy`;
CREATE TABLE `ksys_liusdy` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `liusbm` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '流水编码',
  `liusmc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '流水名称',
  `huancdx` int(8) DEFAULT '0' COMMENT '缓存大小',
  `buchang` int(8) DEFAULT '0' COMMENT '步长',
  `liuszdz` bigint(19) DEFAULT '0' COMMENT '流水最大值',
  `liuszxz` bigint(19) DEFAULT '0' COMMENT '流水最小值',
  `dangqzh` bigint(19) NOT NULL DEFAULT '0' COMMENT '流水当前值',
  PRIMARY KEY (`liusbm`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_liusdy
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_liuszc
-- ----------------------------
DROP TABLE IF EXISTS `ksys_liuszc`;
CREATE TABLE `ksys_liuszc` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `liusmc` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '流水名称',
  `dangqzh` bigint(19) DEFAULT NULL COMMENT '流水当前值',
  `liuszdz` bigint(19) DEFAULT NULL COMMENT '流水最大值',
  `buchang` int(8) DEFAULT NULL COMMENT '步长',
  `fuwbiaoz` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '服务标识',
  `liuszczt` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '流水注册状态',
  `zxtongbh` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '子系统编号',
  PRIMARY KEY (`liusmc`,`fuwbiaoz`,`zxtongbh`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_liuszc
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_mutex
-- ----------------------------
DROP TABLE IF EXISTS `ksys_mutex`;
CREATE TABLE `ksys_mutex` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT 'ç³»ç»Ÿæ ‡è¯†å·',
  `name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'äº’æ–¥é”åç§°',
  `zxtongbh` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'å­ç³»ç»Ÿç¼–å·',
  PRIMARY KEY (`name`,`zxtongbh`,`xitongbs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_mutex
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_named_master
-- ----------------------------
DROP TABLE IF EXISTS `ksys_named_master`;
CREATE TABLE `ksys_named_master` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT 'ç³»ç»Ÿæ ‡è¯†å·',
  `name` varchar(60) COLLATE utf8_bin NOT NULL COMMENT 'æœåŠ¡åç§°',
  `master_svc_id` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'é€‰ä¸¾ä¸ºmasterçš„æœåŠ¡ID',
  `zxtongbh` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'å­ç³»ç»Ÿç¼–å·',
  PRIMARY KEY (`name`,`zxtongbh`,`xitongbs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_named_master
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_named_svc
-- ----------------------------
DROP TABLE IF EXISTS `ksys_named_svc`;
CREATE TABLE `ksys_named_svc` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT 'ç³»ç»Ÿæ ‡è¯†å·',
  `name` varchar(60) COLLATE utf8_bin NOT NULL COMMENT 'æœåŠ¡åç§°',
  `svc_id` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'æœåŠ¡ID',
  `address` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'æœåŠ¡åœ°å€',
  `port` int(11) DEFAULT '0' COMMENT 'ç«¯å£',
  `start_heartbeat` bigint(20) NOT NULL DEFAULT '0' COMMENT 'åˆå§‹å¿ƒè·³æ›´æ–°æ—¶é—´æˆ³',
  `start_modify` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'åˆå§‹æ›´æ–°æ—¶é—´',
  `last_heartbeat` bigint(20) NOT NULL DEFAULT '0' COMMENT 'æœ€åŽå¿ƒè·³æ›´æ–°æ—¶é—´æˆ³',
  `last_modify` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'æœ€åŽæ›´æ–°æ—¶é—´',
  `payload` text COLLATE utf8_bin COMMENT 'è´Ÿè½½çŠ¶æ€ä¿¡æ¯',
  `zxtongbh` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'å­ç³»ç»Ÿç¼–å·',
  PRIMARY KEY (`name`,`svc_id`,`xitongbs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_named_svc
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_pllcbz
-- ----------------------------
DROP TABLE IF EXISTS `ksys_pllcbz`;
CREATE TABLE `ksys_pllcbz` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljylcbs` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '批量交易流程ID',
  `lcbuzmch` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '流程步骤名称',
  `liucbuzh` int(8) NOT NULL DEFAULT '0' COMMENT '流程步骤号',
  `zhixxuha` int(8) NOT NULL DEFAULT '0' COMMENT '执行序号',
  `pljyzbsh` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '批量交易组ID',
  `shifzhix` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否执行',
  PRIMARY KEY (`xitongbs`,`farendma`,`pljylcbs`,`liucbuzh`,`zhixxuha`,`pljyzbsh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_pllcbz
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_pllcdy
-- ----------------------------
DROP TABLE IF EXISTS `ksys_pllcdy`;
CREATE TABLE `ksys_pllcdy` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljylcbs` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '批量交易流程ID',
  `zhongwmc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '中文名称',
  PRIMARY KEY (`xitongbs`,`farendma`,`pljylcbs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_pllcdy
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_plrenw
-- ----------------------------
DROP TABLE IF EXISTS `ksys_plrenw`;
CREATE TABLE `ksys_plrenw` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljypich` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量任务批次号',
  `plrwzxpc` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '批量任务执行批次号',
  `pljytjrq` varchar(23) COLLATE utf8_bin NOT NULL COMMENT '批量任务提交日期',
  `jiaoyirq` date DEFAULT NULL COMMENT '交易日期',
  `dqjioyrq` varchar(23) COLLATE utf8_bin NOT NULL COMMENT '当前交易日期',
  `pljylcbs` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易流程ID',
  `liucbuzh` int(8) DEFAULT '0' COMMENT '流程步骤号',
  `pljyzbsh` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易组ID',
  `piljybss` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易ID',
  `ljhaoshi` bigint(19) DEFAULT '0' COMMENT '累计耗时',
  `jiaoyzht` varchar(15) COLLATE utf8_bin NOT NULL COMMENT '交易状态',
  `plzxmosh` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '批量任务执行模式',
  `plrwzdbz` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '批量任务中断标志',
  `plrwtjsj` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '批量任务提交时间',
  `plrwuyxj` int(8) DEFAULT '5' COMMENT '批量任务优先级',
  `jyksshij` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '交易开始时间',
  `kshishjc` bigint(19) DEFAULT NULL COMMENT '交易开始时间戳',
  `jyjsshij` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '交易结束时间',
  `jshishjc` bigint(19) DEFAULT NULL COMMENT '交易结束时间戳',
  `xunijibs` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '虚拟机ID',
  `ipdizhii` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'IP地址',
  `zhujimic` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '服务器主机名称',
  `shujuquu` text COLLATE utf8_bin COMMENT '数据区',
  `qslcbzha` int(8) DEFAULT '0' COMMENT '起始流程步骤号',
  `qszxxhao` int(8) DEFAULT '0' COMMENT '起始执行序号',
  `qspljyzu` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '起始批量交易组ID',
  `qsbuzhou` int(8) DEFAULT '0' COMMENT '起始步骤',
  `cuowxinx` text COLLATE utf8_bin COMMENT '错误信息',
  `cuowduiz` text COLLATE utf8_bin COMMENT '错误堆栈',
  `fuwbiaoz` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '服务标识',
  `zxtongbh` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '子系统编号',
  PRIMARY KEY (`pljypich`,`zxtongbh`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_plrenw
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_plrwyx
-- ----------------------------
DROP TABLE IF EXISTS `ksys_plrwyx`;
CREATE TABLE `ksys_plrwyx` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljypich` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量任务批次号',
  `plrwzxpc` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量任务执行批次号',
  `pljytjrq` varchar(23) COLLATE utf8_bin NOT NULL COMMENT '批量任务提交日期',
  `jiaoyirq` date NOT NULL COMMENT '交易日期',
  `dqjioyrq` varchar(23) COLLATE utf8_bin NOT NULL COMMENT '当前交易日期',
  `pljylcbs` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易流程ID',
  `liucbuzh` int(8) DEFAULT '0' COMMENT '流程步骤号',
  `pljyzbsh` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易组ID',
  `piljybss` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易ID',
  `pljyzuhs` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易组执行耗时',
  `ljhaoshi` bigint(19) DEFAULT '0' COMMENT '累计耗时',
  `jiaoyzht` varchar(15) COLLATE utf8_bin NOT NULL COMMENT '交易状态',
  `plzxmosh` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '批量任务执行模式',
  `plrwzdbz` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '批量任务中断标志',
  `plrwtjsj` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '批量任务提交时间',
  `plrwuyxj` int(8) DEFAULT '5' COMMENT '批量任务优先级',
  `jyksshij` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '交易开始时间',
  `kshishjc` bigint(19) DEFAULT NULL COMMENT '交易开始时间戳',
  `jyjsshij` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '交易结束时间',
  `jshishjc` bigint(19) DEFAULT NULL COMMENT '交易结束时间戳',
  `shujuquu` text COLLATE utf8_bin COMMENT '数据区',
  `dqlcbzha` int(8) DEFAULT '0' COMMENT '当前流程步骤号',
  `dqzxxhao` int(8) DEFAULT '0' COMMENT '当前执行序号',
  `dqpljyzu` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '当前批量交易组ID',
  `dqianbuz` int(8) DEFAULT '0' COMMENT '当前步骤',
  `cuowxinx` text COLLATE utf8_bin COMMENT '错误信息',
  `cuowduiz` text COLLATE utf8_bin COMMENT '错误堆栈',
  `fuwbiaoz` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '服务标识',
  `zxtongbh` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'bat' COMMENT '子系统编号',
  PRIMARY KEY (`pljypich`,`plrwzxpc`,`jiaoyirq`,`zxtongbh`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_plrwyx
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_plrzrqgl
-- ----------------------------
DROP TABLE IF EXISTS `ksys_plrzrqgl`;
CREATE TABLE `ksys_plrzrqgl` (
  `plrzlclx` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '批量日终流程类型',
  `pllcrzrq` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '批量流程日终日期',
  `pllcrzzt` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '批量流程日终状态',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  PRIMARY KEY (`plrzlclx`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_plrzrqgl
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_plzxkz
-- ----------------------------
DROP TABLE IF EXISTS `ksys_plzxkz`;
CREATE TABLE `ksys_plzxkz` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `plkzhibz` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量控制标识',
  `plkzhzhi` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '批量控制值1-允许 0-不不允许',
  `miaosxxi` text COLLATE utf8_bin COMMENT '描述信息',
  PRIMARY KEY (`plkzhibz`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_plzxkz
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_rwyxrz
-- ----------------------------
DROP TABLE IF EXISTS `ksys_rwyxrz`;
CREATE TABLE `ksys_rwyxrz` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljypich` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量任务批次号',
  `jiaoyirq` date NOT NULL COMMENT '交易日期',
  `pljylcbs` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易流程ID',
  `liucbuzh` int(8) DEFAULT '0' COMMENT '流程步骤号',
  `pljyzbsh` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易组ID',
  `rizhixuh` int(8) NOT NULL DEFAULT '0' COMMENT '日志序号',
  `pljioysj` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '批量任务执行日期',
  `yunxxinx` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '运行信息',
  PRIMARY KEY (`pljypich`,`jiaoyirq`,`rizhixuh`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_rwyxrz
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_rwzhxy
-- ----------------------------
DROP TABLE IF EXISTS `ksys_rwzhxy`;
CREATE TABLE `ksys_rwzhxy` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `jyzxybzh` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '批量交易执行域标识',
  `zuixbfas` int(8) NOT NULL DEFAULT '0' COMMENT '最小并发数',
  `zuidbfas` int(8) NOT NULL DEFAULT '0' COMMENT '最大并发数',
  `zuidbzbf` int(8) DEFAULT '0' COMMENT '最大步骤并发数',
  `zuixbzbf` int(8) DEFAULT '0' COMMENT '最小步骤并发数',
  `zuixzybf` int(8) NOT NULL DEFAULT '0' COMMENT '最小作业并发数',
  `zuidzybf` int(8) DEFAULT '0' COMMENT '最大作业并发数',
  `fenbsjql` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '分布式环境下,worker集群列表,格式ip1:port1;ip2:port2',
  `kezxlclb` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '可执行批量交易流程列表',
  `kezxjyzl` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '可执行批量交易组列表',
  `zhixyzht` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '执行域状态',
  `miaosxxi` text COLLATE utf8_bin COMMENT '描述信息',
  `zxtongbh` varchar(10) COLLATE utf8_bin DEFAULT 'bat' COMMENT '子系统编号',
  PRIMARY KEY (`xitongbs`,`farendma`,`jyzxybzh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_rwzhxy
-- ----------------------------
INSERT INTO `ksys_rwzhxy` VALUES ('020', '985', 'xs_onl_batch', '1', '20', '20', '1', '1', '50', ';', ';', '*', 'RUNNING', 0xE88194E69CBAE689B9E9878FE4BAA4E69893E7BB84E689A7E8A18CE59F9F, '02002');

-- ----------------------------
-- Table structure for ksys_rzzxjl
-- ----------------------------
DROP TABLE IF EXISTS `ksys_rzzxjl`;
CREATE TABLE `ksys_rzzxjl` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljylcbs` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '批量交易流程ID',
  `dqrizriq` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '当前日终日期',
  `jyksshij` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '交易开始时间',
  `dcnbianh` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'DCN编号',
  PRIMARY KEY (`pljylcbs`,`dqrizriq`,`dcnbianh`,`farendma`,`xitongbs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_rzzxjl
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_tabctl
-- ----------------------------
DROP TABLE IF EXISTS `ksys_tabctl`;
CREATE TABLE `ksys_tabctl` (
  `biaoming` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '表名',
  `biaozwmc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '表中文名称',
  `huancjib` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '缓存级别',
  `qianclbz` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '执行前处理标志',
  `denjbgrz` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '登记变更日志标志',
  `jiancshu` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '检查参数标志',
  `chulcshu` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '处理参数标志',
  `chuljieg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '处理结果标志',
  `caoshisj` bigint(19) DEFAULT NULL COMMENT 'sql超时时间',
  `suodgdsj` bigint(19) DEFAULT NULL COMMENT '锁等待时间',
  `chongscs` bigint(19) DEFAULT NULL COMMENT 'sql重试次数',
  `chongsjg` bigint(19) DEFAULT NULL COMMENT 'sql重试间隔',
  PRIMARY KEY (`biaoming`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_tabctl
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_wjcfjl
-- ----------------------------
DROP TABLE IF EXISTS `ksys_wjcfjl`;
CREATE TABLE `ksys_wjcfjl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无业务含义id主键',
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `plcfwjlj` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '文件路径',
  `pljypich` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量任务批次号',
  `pljyzbsh` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易组ID',
  `piljybss` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易ID',
  PRIMARY KEY (`id`),
  KEY `idx_pljypich` (`pljypich`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_wjcfjl
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_ywfwbd
-- ----------------------------
DROP TABLE IF EXISTS `ksys_ywfwbd`;
CREATE TABLE `ksys_ywfwbd` (
  `ywfwbdid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '业务服务接口绑定ID',
  `ywfwfuid` varchar(80) COLLATE utf8_bin NOT NULL COMMENT '业务服务FullID',
  `ywfwbdsx` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '业务服务实现ID',
  `ywfwzxid` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '执行器ID',
  `xitbshao` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '系统标识号',
  `ywfwbdms` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `waibfwma` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '外部服务码',
  `waibcjma` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '外部场景码',
  `lygujzhi` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '路由关键字',
  `shifqywg` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否启用网关',
  PRIMARY KEY (`ywfwbdid`,`ywfwfuid`,`xitbshao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_ywfwbd
-- ----------------------------
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoCmqServType.syncMobile', 'IoCmqServTypeImpl', 'service.executor.rpc', '020', '用户手机号码同步', 'upcust', '0', 'T', '');
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.AccountOpenRequest', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '电子账户开户请求', 'acopre', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.BatchActiveUser', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '客户信息生成活动用户信息', 'bcacus', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.BusinessWhiteListCheck', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '业务白名单校验', 'bswtck', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.CheckQuestionAnswer', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '校验安全问题答案', 'chquan', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.CusterAgreementSign', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '客户协议签约/解约', 'cuagsi', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.DealCusterDown', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '客户降级交易', 'cudown', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.DealIllegalUser', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '处理异常用户', 'dlilur', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.DeleteWhiteList', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '删除白，黑，灰，红名单交易配置', 'dlwhlt', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.GenerateCfcaInfoForOpenAccount', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '生成开户CFCA', 'cfagen', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.GetSystemQuestion', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '获取系统中安全问题', 'qrsysq', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.GetUserQuestion', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '获取用户设置安全问题', 'qrusqu', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.GoToIdentifyCheck', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '身份核查请求', 'idckre', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.IdentifyAuthenRequest', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '身份认证信息维护请求', 'idaure', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.IdentifyCheckByClerker', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '面签身份核查', 'inidnu', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.IdentifyCheckProcess', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '身份核查请求', 'idckre', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.InsertUser', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '用户注册', 'inuser', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.InsertWhiteList', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '增加白，黑，灰，红名单交易配置', 'sawhlt', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryByUserLoginName', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '用户名查询', 'qrusln', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryByUserPhone', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '用户手机号查询', 'qrusph', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryCfcaInfo', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '内管开户协议查询', 'qrycfa', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryCusterAgreement', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '客户协议查询', 'qrcuag', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryCusterBaseInfo', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '个人客户信息查询——统一内管', 'qrcuba', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryCusterCheck', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '根据流水号查询核查信息', 'qrchec', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryUserActionDetail', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '查询用户操作历史记录详细', 'qrcuod', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryUserActionSummary', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '查询用户操作记录', 'qrcuos', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryUserBaseInfo', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '用户基本信息查询', 'qrusba', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryUserContactAddress', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '用户联系地址查询', 'qrusad', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryUserEactnoInfo', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '查询用户电子账户开户信息', 'qrecif', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryUserInfoForActivityBySeactp', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '为活动用户查询推荐人信息', 'qrrefp', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryUserState', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '用户状态查询', 'qrusst', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.QueryWhiteList', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '查询白，黑，灰，红名单交易配置', 'slwhlt', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.ReceiveAccountBind', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '接收账户绑定/解绑', 'reacbi', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.ReceiveAccountClosing', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '接收电子账户销户', 'reaccl', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.ReceiveAccountOpening', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '接收电子账户开户消息', 'reacop', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.ReceiveIdentifyCheckResult', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '接收联网核查结果', 'reidck', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.SaveOcrRecord', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '保存OCR记录', 'saocrr', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.SaveQuestionAnswer', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '保存安全问题答案', 'inquan', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.SelCifPublRistlv', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '查询风评线下记录', 'qrrsof', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.SelIllegalUser', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '查询异常用户信息', 'ileser', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.SelOcrRecord', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '查询OCR记录', 'qrocrr', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.SelRistlvHistoryRecord', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '查询风评历史记录', 'qrrshs', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.SelectCfcaOpenAccountInfo', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '查询开户cfca记录', 'cfaser', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.SendMsgForDelIlegalUsr', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '删除异常用户发送验证码', 'dlurve', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdCustCommInfo', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '维护客户通用信息', 'upuxcm', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateAccountActive', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '非活跃账户激活', 'upacac', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateCusterPhone', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '手机号码修改——统一内管', 'upcuph', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateCusterRistlv', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '增加/修改客户风险等级评价', 'upcuri', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateCusterStatus', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '客户锁定/解锁——统一内管', 'upcust', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateSendMessage', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '内管发送短信接口', 'upseme', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateTourisToCuster', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '游客升级为3级普通客户', 'upupcu', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateTxcztpForUser', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '更新客户税收类型', 'uptxtp', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateUserBase', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '用户基本信息维护', 'upusba', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateUserContactAddress', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '用户联系地址信息维护', 'upusad', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateUserPhone', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '手机号码修改', 'upusph', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateUserStatus', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '用户临时锁定', 'upusst', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateWhiteList', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '修改白，黑，灰，红名单交易配置', 'upwhlt', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('*', 'IoUsSvcType.UpdateWhiteListTypeFGTB', 'IoUsSvcTypeImpl', 'service.executor.localimpl', '020', '移动灰名单数据到黑名单', 'upgrwt', '0', 'L', null);
INSERT INTO `ksys_ywfwbd` VALUES ('CMP_FILE_REQ', 'IoRemoteSvcType.FileInteractiveRequest', null, 'service.executor.rpc', '020', '外调通知客户信息系统文件生成', 'AS_CMP_AC_REFIIN', '0', 'T', '0');
INSERT INTO `ksys_ywfwbd` VALUES ('Q0203003', 'IoCmqServType.sendMessageApp', 'IoCmqServTypeImpl', 'service.executor.rpc', '020', '身份认证过期发消息给app', 'APP001', '0', 'T', null);
INSERT INTO `ksys_ywfwbd` VALUES ('RemoteAppTelupd', 'IoRemoteSvcType.RemoteAppTelupd', null, 'service.executor.rpc', '020', '外调App修改手机号', 'APP009', '0', 'T', '0');
INSERT INTO `ksys_ywfwbd` VALUES ('RemoteDeleteIllegalUser', 'IoRemoteSvcType.RemoteDeleteIllegalUser', null, 'service.executor.rpc', '020', '同步删除APP非法用户', 'APP010', '0', 'T', '0');
INSERT INTO `ksys_ywfwbd` VALUES ('RemoteForceUserExit', 'IoRemoteSvcType.RemoteForceUserExit', null, 'service.executor.rpc', '020', '外调app强制用户退出', 'APP002', '0', 'T', '0');
INSERT INTO `ksys_ywfwbd` VALUES ('RemoteGold', 'IoRemoteSvcType.RemoteGold', null, 'service.executor.rpc', '020', '外调黄金注册', 'GW.gateway.out.server.opgold', '0', 'T', null);
INSERT INTO `ksys_ywfwbd` VALUES ('RemoteIdentityCheckRequest', 'IoRemoteSvcType.RemoteIdentityCheckRequest', null, 'service.executor.rpc', '020', '调用第三方联网核查', '330CSFHC', '0', 'T', '0');
INSERT INTO `ksys_ywfwbd` VALUES ('RemoteNasActeac', 'IoRemoteSvcType.RemoteNasActeac', null, 'service.executor.rpc', '020', '外调电子账户非活跃激活', '010DPTS3111', '0', 'X', '');
INSERT INTO `ksys_ywfwbd` VALUES ('RemoteNasCkopac', 'IoRemoteSvcType.RemoteNasCkopac', null, 'service.executor.rpc', '020', '外调电子账户核查验证结果确认', '010DPTS2101', '0', 'X', '');
INSERT INTO `ksys_ywfwbd` VALUES ('RemoteNasClacb', 'IoRemoteSvcType.RemoteNasClacb', null, 'service.executor.rpc', '020', '外调电子账户开户', '010DPTS3001', '0', 'I;idtftp@idtfno;RD', '1');
INSERT INTO `ksys_ywfwbd` VALUES ('RemoteNasQracct', 'IoRemoteSvcType.RemoteNasQracct', null, 'service.executor.rpc', '020', '外调电子账户查询电子账户信息', '010DPTS2203', '0', 'RD', '1');
INSERT INTO `ksys_ywfwbd` VALUES ('RemoteNasTelupd', 'IoRemoteSvcType.RemoteNasTelupd', null, 'service.executor.rpc', '020', '外调电子账户修改手机号', '010DPTS3107', '0', 'C,cardno', '1');
INSERT INTO `ksys_ywfwbd` VALUES ('synthesizeAutoTemplate', 'IoRemoteSvcType.CallCfcaSynthesizeAutoTemplate', null, 'service.executor.rpc', '020', '调用无纸化自动化合成模板业务数据接口', '330CCFCA', '0', 'T', '0');
INSERT INTO `ksys_ywfwbd` VALUES ('transformPdfToImage', 'IoRemoteSvcType.CallCfcaTransformPdfToImage', null, 'service.executor.rpc', '020', '调用无纸化自动化合成pdf为png图片', '330CCFIM', '0', 'T', '0');

-- ----------------------------
-- Table structure for ksys_ywfwdy
-- ----------------------------
DROP TABLE IF EXISTS `ksys_ywfwdy`;
CREATE TABLE `ksys_ywfwdy` (
  `ywfwfuid` varchar(80) COLLATE utf8_bin NOT NULL COMMENT '业务服务FullID',
  `yewufwmc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '业务服务名称',
  `yewufwlx` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '业务服务类型',
  `shiwcbfs` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '事务传播方式',
  `csshjian` bigint(19) DEFAULT NULL COMMENT '超时时间',
  `cschshcs` bigint(19) DEFAULT NULL COMMENT '超时重试次数',
  `rizhijib` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '日志级别',
  `sfbiemys` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否别名映射',
  `sfdjfwls` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否登记服务流水',
  `sfdjbwls` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否登记报文流水',
  `ywfwztai` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '业务服务状态',
  `xitbshao` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '系统标识号',
  `csqrbioz` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '超时确认标志',
  `csqrfuid` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '超时确认服务FullID',
  `sbcschis` int(10) DEFAULT '0' COMMENT '失败重试次数',
  `ectjfuid` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '二次提交服务FullID',
  `chzhfuid` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '冲正服务FullID',
  PRIMARY KEY (`ywfwfuid`,`xitbshao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_ywfwdy
-- ----------------------------
INSERT INTO `ksys_ywfwdy` VALUES ('CifCommService.BatchFileInteractive', '接收交互文件处理', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoCmqServType.sendMessageApp', '身份认证过期发消息给app', 'TRY_SERVICE', 'NotSupported', '25000', '3', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoCmqServType.syncMobile', '用户手机号码同步', 'TRY_SERVICE', 'NotSupported', '25000', '3', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.CallCfcaSynthesizeAutoTemplate', '调用无纸化自动化合成模板业务数据接口', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.CallCfcaTransformPdfToImage', '调用无纸化自动化合成pdf为png图片', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.FileInteractiveRequest', '文件交互', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.RemoteAppTelupd', '外调App修改手机号', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.RemoteDeleteIllegalUser', '同步删除APP非法用户', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.RemoteForceUserExit', '外调app强制用户退出', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.RemoteGold', '外调黄金注册', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.RemoteIdentityCheckRequest', '调用第三方联网核查', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.RemoteNasActeac', '外调电子账户非活跃激活', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.RemoteNasCkopac', '外调电子账户核查验证结果确认', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.RemoteNasClacb', '外调电子账户开户', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.RemoteNasQracct', '外调电子账户查询电子账户信息', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoRemoteSvcType.RemoteNasTelupd', '外调电子账户修改手机号', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.AccountOpenRequest', '电子账户开户请求', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.BatchActiveUser', '客户信息生成活动用户信息', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.BusinessWhiteListCheck', '业务白名单校验', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.CheckQuestionAnswer', '校验安全问题答案', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.CusterAgreementSign', '客户协议签约/解约', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.DealCusterDown', '客户降级交易', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.DealIllegalUser', '处理异常用户', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.DeleteWhiteList', '删除白，黑，灰，红名单交易配置', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.GenerateCfcaInfoForOpenAccount', '生成开户CFCA', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.GetSystemQuestion', '获取系统中安全问题', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.GetUserQuestion', '获取用户设置安全问题', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.GoToIdentifyCheck', '身份核查请求', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.IdentifyAuthenRequest', '身份认证信息维护请求', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.IdentifyCheckByClerker', '面签身份核查', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.IdentifyCheckProcess', '身份核查请求', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.IdentityPreyCheck', '身份预核查', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.InsertUser', '用户注册', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.InsertWhiteList', '增加白，黑，灰，红名单交易配置', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryByUserLoginName', '用户名查询', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryByUserPhone', '用户手机号查询', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryCfcaInfo', '内管开户协议查询', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryCusterAgreement', '客户协议查询', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryCusterBaseInfo', '个人客户信息查询——统一内管', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryCusterCheck', '根据流水号查询核查信息', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryUserActionDetail', '查询用户操作历史记录详细', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryUserActionSummary', '查询用户操作记录', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryUserBaseInfo', '用户基本信息查询', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryUserContactAddress', '用户联系地址查询', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryUserEactnoInfo', '查询用户电子账户开户信息', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryUserInfoForActivityBySeactp', '为活动用户查询推荐人信息', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryUserState', '用户状态查询', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.QueryWhiteList', '查询白，黑，灰，红名单交易配置', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.ReceiveAccountBind', '接收账户绑定/解绑', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.ReceiveAccountClosing', '接收电子账户销户', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.ReceiveAccountOpening', '接收电子账户开户消息', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.ReceiveIdentifyCheckResult', '接收联网核查结果', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.SaveOcrRecord', '保存OCR记录', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.SaveQuestionAnswer', '保存安全问题答案', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.SelCifPublRistlv', '查询风评线下记录', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.SelIllegalUser', '查询异常用户信息', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.SelOcrRecord', '查询OCR记录', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.SelRistlvHistoryRecord', '查询风评历史记录', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.SelectCfcaOpenAccountInfo', '查询开户cfca记录', 'CHECK_SERVICE', 'NotSupported', '60000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.SendMsgForDelIlegalUsr', '删除异常用户发送验证码', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdCustCommInfo', '维护客户通用信息', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateAccountActive', '非活跃账户激活', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateCusterPhone', '手机号码修改——统一内管', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateCusterRistlv', '增加/修改客户风险等级评价', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateCusterStatus', '客户锁定/解锁——统一内管', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateSendMessage', '内管发送短信接口', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateTourisToCuster', '游客升级为3级普通客户', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateTxcztpForUser', '更新客户税收类型', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateUserBase', '用户基本信息维护', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateUserContactAddress', '用户联系地址信息维护', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateUserPhone', '手机号码修改', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateUserStatus', '用户临时锁定', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateWhiteList', '修改白，黑，灰，红名单交易配置', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpdateWhiteListTypeFGTB', '移动灰名单数据到黑名单', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);
INSERT INTO `ksys_ywfwdy` VALUES ('IoUsSvcType.UpgredeUserToThirdLevel', '升级用户为三级客户', 'CHECK_SERVICE', 'NotSupported', '25000', '0', '3', '0', '0', '0', '1', '020', '0', null, '0', null, null);

-- ----------------------------
-- Table structure for ksys_yxxktj
-- ----------------------------
DROP TABLE IF EXISTS `ksys_yxxktj`;
CREATE TABLE `ksys_yxxktj` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `yxxktjbs` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '批量任务运行许可条件标识',
  `yxsxfwsx` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '批量任务运行许可服务实现标识',
  `rwyxxkcs` text COLLATE utf8_bin COMMENT '批量任务运行许可参数',
  `zhongwmc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '中文名称',
  PRIMARY KEY (`yxxktjbs`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_yxxktj
-- ----------------------------

-- ----------------------------
-- Table structure for ksys_zjslsx
-- ----------------------------
DROP TABLE IF EXISTS `ksys_zjslsx`;
CREATE TABLE `ksys_zjslsx` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `chxizjbz` varchar(80) COLLATE utf8_bin NOT NULL COMMENT '抽象组件Schema路径ID',
  `shuximic` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '属性名称',
  `shuxingz` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '属性值',
  PRIMARY KEY (`xitongbs`,`farendma`,`chxizjbz`,`shuximic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_zjslsx
-- ----------------------------
INSERT INTO `ksys_zjslsx` VALUES ('020', '985', 'batchComp.BatchDataFileTransport', 'localWorkDir', '/local-file/bat-work');
INSERT INTO `ksys_zjslsx` VALUES ('020', '985', 'batchComp.BatchDataFileTransport', 'remoteWorkDir', '/local-file/bat-datas');

-- ----------------------------
-- Table structure for ksys_zyyxrz
-- ----------------------------
DROP TABLE IF EXISTS `ksys_zyyxrz`;
CREATE TABLE `ksys_zyyxrz` (
  `xitongbs` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '系统标识号',
  `farendma` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '''' COMMENT '法人代码',
  `pljypich` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量任务批次号',
  `plrwzxpc` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量任务执行批次号',
  `jyyxzxpc` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量交易执行批次号',
  `jiaoyirq` date DEFAULT NULL COMMENT '交易日期',
  `pljyzbsh` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '批量交易组ID',
  `buzhouha` int(8) NOT NULL DEFAULT '0' COMMENT '步骤号',
  `piljybss` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '批量交易ID',
  `plzybhao` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '批量作业编号',
  `picishjl` bigint(19) DEFAULT '0' COMMENT '批次数据数量',
  `chgfzjls` bigint(19) DEFAULT '0' COMMENT '成功分组记录数',
  `shbfzjls` bigint(19) DEFAULT '0' COMMENT '失败分组记录数',
  `chenggjl` bigint(19) DEFAULT '0' COMMENT '成功记录数',
  `shibaijl` bigint(19) DEFAULT '0' COMMENT '失败记录数',
  `zyffkssj` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '作业分发开始时间',
  `jyksshij` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '交易开始时间',
  `kshishjc` bigint(19) DEFAULT NULL COMMENT '交易开始时间戳',
  `jyjsshij` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '交易结束时间',
  `jshishjc` bigint(19) DEFAULT NULL COMMENT '交易结束时间戳',
  `pljyzuhs` varchar(23) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易组执行耗时',
  `ljhaoshi` bigint(19) DEFAULT NULL COMMENT '累计耗时',
  `zuoyzxzt` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '作业执行状态',
  `xunijibs` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '虚拟机ID',
  `zyfwqbzh` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '作业服务器标识',
  `zhujimic` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '服务器主机名称',
  `ipdizhii` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'IP地址',
  `xiancmic` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '线程名称',
  `cuowxinx` text COLLATE utf8_bin COMMENT '错误信息',
  `cuowduiz` text COLLATE utf8_bin COMMENT '错误堆栈',
  `cuowshuj` text COLLATE utf8_bin COMMENT '错误的数据',
  PRIMARY KEY (`pljypich`,`plrwzxpc`,`jyyxzxpc`,`pljyzbsh`,`buzhouha`,`piljybss`,`plzybhao`,`xitongbs`,`farendma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ksys_zyyxrz
-- ----------------------------

-- ----------------------------
-- Table structure for kub_aupr
-- ----------------------------
DROP TABLE IF EXISTS `kub_aupr`;
CREATE TABLE `kub_aupr` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `inuser` varchar(7) COLLATE utf8_bin NOT NULL COMMENT '接受柜员',
  `adusnm` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员姓名',
  `ouuser` varchar(7) COLLATE utf8_bin NOT NULL COMMENT '交出柜员',
  `ouusnm` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员姓名',
  `limtfg` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否交接限额',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `recost` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '恢复状态',
  `tranbr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '交易机构',
  `tranus` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '交易柜员',
  `trandt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '交易日期',
  `trantm` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '交易时间',
  `ussequ` varchar(22) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员流水',
  `authus` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '授权柜员',
  `prussq` varchar(22) COLLATE utf8_bin DEFAULT NULL COMMENT '维护柜员流水号',
  `prauus` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '维护授权柜员',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`inuser`),
  UNIQUE KEY `kub_aupr_uk2` (`trandt`,`ussequ`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_aupr
-- ----------------------------

-- ----------------------------
-- Table structure for kub_brch
-- ----------------------------
DROP TABLE IF EXISTS `kub_brch`;
CREATE TABLE `kub_brch` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `brchno` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '机构号',
  `brchna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '机构名称',
  `brnosh` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '机构号简称',
  `brsmna` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '机构简称',
  `addres` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `postcd` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '邮政编码',
  `telecd` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `contac` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `cttele` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人电话',
  `vatcod` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '节假日代码',
  `swftcd` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'SWIFT代码',
  `cityno` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '分行号',
  `uppebr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '上级机构',
  `brchtp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '部门类型',
  `brchlv` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '机构级别',
  `brstus` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '机构状态',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`corpno`),
  UNIQUE KEY `kub_brch_uk1` (`brchno`,`brchtp`,`brstus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_brch
-- ----------------------------

-- ----------------------------
-- Table structure for kub_brlw
-- ----------------------------
DROP TABLE IF EXISTS `kub_brlw`;
CREATE TABLE `kub_brlw` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `brchno` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '机构号',
  `brmptp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '机构对照关系',
  `crcycd` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '币种',
  `lowebr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '下级机构',
  `brchna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '机构名称',
  `brlevl` bigint(19) DEFAULT NULL COMMENT '机构层级',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`corpno`),
  UNIQUE KEY `kub_brlw_uk1` (`brchno`,`crcycd`,`lowebr`,`brmptp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_brlw
-- ----------------------------

-- ----------------------------
-- Table structure for kub_brmp
-- ----------------------------
DROP TABLE IF EXISTS `kub_brmp`;
CREATE TABLE `kub_brmp` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `brchno` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '机构号',
  `brmatp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '机构映射类型',
  `mabrno` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '映射机构号',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`corpno`),
  UNIQUE KEY `kub_brmp_uk1` (`brchno`,`brmatp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_brmp
-- ----------------------------

-- ----------------------------
-- Table structure for kub_brtp
-- ----------------------------
DROP TABLE IF EXISTS `kub_brtp`;
CREATE TABLE `kub_brtp` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `brchno` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '机构号',
  `brmptp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '机构对照关系',
  `crcycd` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '币种',
  `uppebr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '上级机构',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`corpno`),
  UNIQUE KEY `kub_brtp_uk1` (`brchno`,`crcycd`,`brmptp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_brtp
-- ----------------------------

-- ----------------------------
-- Table structure for kub_brup
-- ----------------------------
DROP TABLE IF EXISTS `kub_brup`;
CREATE TABLE `kub_brup` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `brchno` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '机构号',
  `brmptp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '机构对照关系',
  `crcycd` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '币种',
  `uppebr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '上级机构',
  `brchna` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '机构名称',
  `brlevl` bigint(19) DEFAULT NULL COMMENT '机构级别',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`corpno`),
  UNIQUE KEY `kub_brup_uk1` (`brchno`,`crcycd`,`uppebr`,`brmptp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_brup
-- ----------------------------

-- ----------------------------
-- Table structure for kub_prcs
-- ----------------------------
DROP TABLE IF EXISTS `kub_prcs`;
CREATE TABLE `kub_prcs` (
  `roleid` varchar(6) COLLATE utf8_bin NOT NULL COMMENT '角色',
  `prcsid` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '交易码',
  `prcsna` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '交易名称',
  PRIMARY KEY (`roleid`,`prcsid`),
  KEY `kub_prcs_idx2` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_prcs
-- ----------------------------

-- ----------------------------
-- Table structure for kub_role
-- ----------------------------
DROP TABLE IF EXISTS `kub_role`;
CREATE TABLE `kub_role` (
  `usrole` varchar(6) COLLATE utf8_bin NOT NULL COMMENT '柜员角色代码',
  `roleid` varchar(6) COLLATE utf8_bin NOT NULL COMMENT '角色',
  `usrlna` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '角色组名称',
  PRIMARY KEY (`usrole`,`roleid`),
  KEY `kub_role_idx2` (`usrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_role
-- ----------------------------

-- ----------------------------
-- Table structure for kub_smsm_logs
-- ----------------------------
DROP TABLE IF EXISTS `kub_smsm_logs`;
CREATE TABLE `kub_smsm_logs` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `bathid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '短信批次号',
  `senddt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '发送日期',
  `sendtm` varchar(22) COLLATE utf8_bin DEFAULT NULL COMMENT '发送时间',
  `sndmsg` text COLLATE utf8_bin COMMENT '发送短信信息',
  `errmsg` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '错误信息',
  `sendst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`bathid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_smsm_logs
-- ----------------------------

-- ----------------------------
-- Table structure for kub_sqrd
-- ----------------------------
DROP TABLE IF EXISTS `kub_sqrd`;
CREATE TABLE `kub_sqrd` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无业务含义主键',
  `transq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '交易流水',
  `prcscd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '交易码',
  `trandt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '交易日期',
  `trantm` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '交易时间',
  `dealst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '处理状态',
  `cardno` varchar(19) COLLATE utf8_bin DEFAULT NULL COMMENT '交易卡号',
  `appsid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'app推送ID',
  `dvtype` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '设备类型',
  `pmvl01` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '参数01',
  `pmvl02` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '参数02',
  `pmvl03` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '参数03',
  `pmvl04` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '参数04',
  `pmvl05` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '参数05',
  `btchno` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易批次号',
  `timetm` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_sqrd
-- ----------------------------

-- ----------------------------
-- Table structure for kub_user
-- ----------------------------
DROP TABLE IF EXISTS `kub_user`;
CREATE TABLE `kub_user` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `userid` varchar(7) COLLATE utf8_bin NOT NULL COMMENT '柜员代号',
  `userna` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员姓名',
  `usform` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '柜员属性',
  `brchno` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '所属部门',
  `userlv` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '级别',
  `manage` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '客户经理标志',
  `statdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '启用日期',
  `stopdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '终止日期',
  `ususfg` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '柜员启用标志',
  `userst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员状态',
  `resefl` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备用字段1',
  `usrole` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员角色代码',
  `usertp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员类型',
  `usercd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '员工编号',
  `custno` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '客户号',
  `usrklv` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '风险级别',
  `uslgtp` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员介质标识',
  `aucdno` varchar(19) COLLATE utf8_bin DEFAULT NULL COMMENT '授权卡号',
  `uscdid` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员卡序号',
  `passwd` varchar(48) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员密码',
  `pwdmdt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '密码修改日期',
  `vlidts` int(8) DEFAULT NULL COMMENT '密码有效天数',
  `unrpct` int(8) DEFAULT NULL COMMENT '密码不可重复次数',
  `pwaect` int(8) DEFAULT NULL COMMENT '密码允许错误次数',
  `pwerct` int(8) DEFAULT NULL COMMENT '密码错误次数',
  `lachbx` decimal(21,2) DEFAULT NULL COMMENT '现金尾箱总限额',
  `cyctfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '币种控制标志',
  `cysyfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '币种同步标志',
  `gptrls` text COLLATE utf8_bin COMMENT '交易组别列表',
  `gpauls` text COLLATE utf8_bin COMMENT '授权组别列表',
  `pdtrls` text COLLATE utf8_bin COMMENT '产品交易列表',
  `pdauls` text COLLATE utf8_bin COMMENT '产品授权列表',
  `redutr` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '删减交易',
  `redupd` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '删减产品',
  `usintm` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '签到时间',
  `usoutm` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '签退时间',
  `tmnlid` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '终端号',
  `tmnlip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'IP地址',
  `usdtfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员日结标记',
  `usacfg` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员在会计系统日结标志',
  `usprst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员权限状态',
  `uslgst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员签到状态',
  `usacst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员会计系统签到状态',
  `serino` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '序列号',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`userid`),
  KEY `kub_user_idx1` (`usrole`,`corpno`),
  KEY `kub_user_idx3` (`usform`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_user
-- ----------------------------

-- ----------------------------
-- Table structure for kub_user_role
-- ----------------------------
DROP TABLE IF EXISTS `kub_user_role`;
CREATE TABLE `kub_user_role` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `userid` varchar(7) COLLATE utf8_bin NOT NULL COMMENT '柜员号',
  `roleid` varchar(6) COLLATE utf8_bin NOT NULL COMMENT '角色代码',
  `status` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否有效',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`userid`,`roleid`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for kub_usld
-- ----------------------------
DROP TABLE IF EXISTS `kub_usld`;
CREATE TABLE `kub_usld` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `userid` varchar(7) COLLATE utf8_bin NOT NULL COMMENT '柜员代号',
  `uslgst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员登录状态',
  `oprtbr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '营业机构',
  `bookbr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '账务机构',
  `logibr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '登录营业机构',
  `trbkbr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '登录账务机构',
  `tmnlid` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '终端号',
  `tmnlip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'IP地址',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `trandt` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '交易日期',
  `trantm` varchar(21) COLLATE utf8_bin NOT NULL COMMENT '交易时间',
  `tranus` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '交易柜员',
  `tranbr` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '交易机构',
  `prcscd` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '交易码',
  `authus` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '授权柜员',
  `ussequ` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '柜员流水号',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`userid`,`trandt`,`trantm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kub_usld
-- ----------------------------

-- ----------------------------
-- Table structure for kup_lter
-- ----------------------------
DROP TABLE IF EXISTS `kup_lter`;
CREATE TABLE `kup_lter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无业务含义主键',
  `appsid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'app推送ID',
  `dvtype` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '设备类型',
  `scenmk` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '场景标识',
  `mtitle` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '消息标题',
  `phpara` text COLLATE utf8_bin COMMENT '推送参数',
  `expara` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展参数',
  `custid` varchar(14) COLLATE utf8_bin DEFAULT NULL COMMENT '用户ID',
  `vesion` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '模板版本号',
  `brchno` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '机构号',
  `mesgst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '站内信状态',
  `priori` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '优先级',
  `trandt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '交易日期',
  `transq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '交易流水',
  `btchno` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易批次号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_lter
-- ----------------------------

-- ----------------------------
-- Table structure for kup_perm
-- ----------------------------
DROP TABLE IF EXISTS `kup_perm`;
CREATE TABLE `kup_perm` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `permcd` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '权限代码',
  `permna` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '权限代码名称',
  `syscod` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '系统代码',
  `permtp` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '权限类型',
  `crcycd` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '币种',
  `pmcdtx` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '代码描述',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`permcd`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_perm
-- ----------------------------

-- ----------------------------
-- Table structure for kup_perm_auth
-- ----------------------------
DROP TABLE IF EXISTS `kup_perm_auth`;
CREATE TABLE `kup_perm_auth` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `permcd` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '权限代码',
  `userlv` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '柜员级别',
  `pramlw` decimal(21,2) NOT NULL COMMENT '金额区间下限',
  `issucc` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '能否授权成功',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`permcd`,`userlv`,`pramlw`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_perm_auth
-- ----------------------------

-- ----------------------------
-- Table structure for kup_perm_chck
-- ----------------------------
DROP TABLE IF EXISTS `kup_perm_chck`;
CREATE TABLE `kup_perm_chck` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `permcd` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '权限代码',
  `userlv` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '柜员级别',
  `pramlw` decimal(21,2) NOT NULL COMMENT '金额区间下限',
  `issucc` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '能否授权成功',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`permcd`,`userlv`,`pramlw`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_perm_chck
-- ----------------------------

-- ----------------------------
-- Table structure for kup_perm_oper
-- ----------------------------
DROP TABLE IF EXISTS `kup_perm_oper`;
CREATE TABLE `kup_perm_oper` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `permcd` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '权限代码',
  `userlv` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '柜员级别',
  `pramlw` decimal(21,2) NOT NULL COMMENT '金额区间下限',
  `issucc` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '独立操作成功',
  `isafrm` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否确认',
  `ischck` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否允许被现场授权',
  `isauth` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否允许被远程授权',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`permcd`,`userlv`,`pramlw`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_perm_oper
-- ----------------------------

-- ----------------------------
-- Table structure for kup_role
-- ----------------------------
DROP TABLE IF EXISTS `kup_role`;
CREATE TABLE `kup_role` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `roleid` varchar(6) COLLATE utf8_bin NOT NULL COMMENT '角色代码',
  `rolena` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `roletp` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '角色挂靠类型',
  `spclsc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '适用范围串',
  `spclbr` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '职能机构串',
  `syscod` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '系统代码',
  `status` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否有效',
  `desctx` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`roleid`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_role
-- ----------------------------

-- ----------------------------
-- Table structure for kup_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `kup_role_perm`;
CREATE TABLE `kup_role_perm` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `roleid` varchar(6) COLLATE utf8_bin NOT NULL COMMENT '角色代码',
  `scencd` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '场景代码',
  `scenvl` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '场景值',
  `prcscd` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '外部处理码',
  `permtp` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '权限类型',
  `crcycd` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '币种',
  `trantp` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '交易类型',
  `permcd` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '权限代码',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`roleid`,`scencd`,`scenvl`,`prcscd`,`permtp`,`crcycd`,`trantp`,`corpno`),
  KEY `kup_role_perm_idx1` (`scencd`,`scenvl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_role_perm
-- ----------------------------

-- ----------------------------
-- Table structure for kup_scen
-- ----------------------------
DROP TABLE IF EXISTS `kup_scen`;
CREATE TABLE `kup_scen` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `scencd` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '场景代码',
  `scentx` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '场景描述',
  `scensm` varchar(80) COLLATE utf8_bin NOT NULL COMMENT '场景摘要',
  `syscod` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '系统代码',
  `trigtp` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '触发条件类型',
  `explvl` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '表达式',
  `profvl` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '规则',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`scencd`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_scen
-- ----------------------------

-- ----------------------------
-- Table structure for kup_scen_tran
-- ----------------------------
DROP TABLE IF EXISTS `kup_scen_tran`;
CREATE TABLE `kup_scen_tran` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `prcscd` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '外部处理码',
  `bssvcd` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '服务节点ID',
  `scencd` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '场景代码',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`prcscd`,`bssvcd`,`scencd`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_scen_tran
-- ----------------------------

-- ----------------------------
-- Table structure for kup_scen_valu
-- ----------------------------
DROP TABLE IF EXISTS `kup_scen_valu`;
CREATE TABLE `kup_scen_valu` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `scencd` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '场景代码',
  `scenvl` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '场景值',
  `scvlds` varchar(400) COLLATE utf8_bin NOT NULL COMMENT '场景值说明',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`scencd`,`scenvl`,`corpno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_scen_valu
-- ----------------------------

-- ----------------------------
-- Table structure for kup_smpd
-- ----------------------------
DROP TABLE IF EXISTS `kup_smpd`;
CREATE TABLE `kup_smpd` (
  `corpno` varchar(3) COLLATE utf8_bin NOT NULL COMMENT '法人代码',
  `trantp` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '交易类型',
  `servip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '服务地址',
  `servpt` bigint(6) DEFAULT NULL COMMENT '服务端口',
  `smsact` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '账号',
  `smspsd` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `rgtnow` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否立即发送',
  `transt` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '有效状态',
  `tmstmp` varchar(21) COLLATE utf8_bin DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`trantp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_smpd
-- ----------------------------

-- ----------------------------
-- Table structure for kup_smsd
-- ----------------------------
DROP TABLE IF EXISTS `kup_smsd`;
CREATE TABLE `kup_smsd` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无业务含义主键',
  `scenmk` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '场景标识',
  `teleno` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `phpara` text COLLATE utf8_bin COMMENT '推送参数',
  `expara` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展参数',
  `custid` varchar(14) COLLATE utf8_bin DEFAULT NULL COMMENT '用户ID',
  `vesion` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '模板版本号',
  `brchno` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '机构号',
  `mesgst` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '短信状态',
  `priori` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '优先级',
  `trandt` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '交易日期',
  `transq` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '交易流水',
  `btchno` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '批量交易批次号',
  PRIMARY KEY (`id`),
  KEY `kup_smsd_idx1` (`scenmk`,`trandt`,`transq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_smsd
-- ----------------------------

-- ----------------------------
-- Table structure for kup_tpms
-- ----------------------------
DROP TABLE IF EXISTS `kup_tpms`;
CREATE TABLE `kup_tpms` (
  `mgtpid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '短信模板ID',
  `aftpid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT 'app模板ID',
  `dime01` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '模板参数',
  `dime02` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '参数对应字段',
  PRIMARY KEY (`mgtpid`,`aftpid`,`dime01`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_tpms
-- ----------------------------

-- ----------------------------
-- Table structure for kup_tppr
-- ----------------------------
DROP TABLE IF EXISTS `kup_tppr`;
CREATE TABLE `kup_tppr` (
  `prcscd` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '交易码',
  `dime01` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '状态维度1',
  `dime02` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '状态维度2',
  `dime03` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '状态维度3',
  `dime04` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '状态维度4',
  `dime05` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '状态维度5',
  `dime06` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '状态维度6',
  `dime07` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '状态维度7',
  `dime08` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '状态维度8',
  `mgtpid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '短信模板ID',
  `mgprio` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '短信优先级',
  `mgvers` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '短信模板版本号',
  `aftpid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '站内信模板ID',
  `afprio` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '站内信优先级',
  `afvers` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '站内信模板版本号',
  PRIMARY KEY (`prcscd`,`dime01`,`dime02`,`dime03`,`dime04`,`dime05`,`dime06`,`dime07`,`dime08`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kup_tppr
-- ----------------------------
