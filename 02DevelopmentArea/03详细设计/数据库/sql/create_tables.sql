/*
Navicat MySQL Data Transfer

Source Server         : dianfaner
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : dianfaner

Target Server Type    : MYSQL
Target Server Version : 50699
File Encoding         : 65001

Date: 2018-04-03 09:38:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`c_open_id`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`c_wechat_number`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`c_wechat_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`c_regist_time`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`c_picture_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`c_point`  int(11) NULL DEFAULT NULL ,
`c_level`  int(11) NULL DEFAULT NULL ,
`c_create_time`  datetime NULL DEFAULT NULL ,
`c_update_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='顾客表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of customer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '物理主键' ,
`f_id`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '逻辑主键' ,
`f_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜品名称' ,
`f_weight`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜品重量' ,
`f_price`  decimal(5,2) NOT NULL COMMENT '菜品价格' ,
`f_picture_url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品图片url' ,
`f_discount_price`  decimal(5,2) NULL DEFAULT NULL COMMENT '折扣价' ,
`f_is_special`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是特色菜，0：不是，1：是' ,
`f_statu`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态，0：售罄，1：正常' ,
`f_like_ amount`  int(11) NULL DEFAULT NULL COMMENT '点赞个数' ,
`f_recommend_level`  int(1) NULL DEFAULT NULL COMMENT '推荐指数' ,
`f_describe`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品描述' ,
`f_create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`f_update_time`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
`r_id`  int(11) NULL DEFAULT NULL COMMENT '餐厅主键' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='菜品表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of food
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for food_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `food_evaluate`;
CREATE TABLE `food_evaluate` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '物理主键' ,
`f_e_id`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '逻辑主键' ,
`f_id`  int(11) NULL DEFAULT NULL COMMENT '菜品主键' ,
`r_id`  int(11) NULL DEFAULT NULL COMMENT '餐厅主键' ,
`c_open_id`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顾客微信号' ,
`f_e_content`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价内容' ,
`f_e_star_level`  int(1) NULL DEFAULT NULL COMMENT '星级指数 1-5颗星。由顾客设置，然后取平均数' ,
`f_e_time`  datetime NULL DEFAULT NULL COMMENT '评价时间[yyyy-mm-dd hh:mm:ss]' ,
`f_e_create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`f_e_update_time`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='菜品评价表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of food_evaluate
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '物理主键' ,
`o_id`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '逻辑主键' ,
`c_open_id`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顾客微信号' ,
`s_id`  int(11) NULL DEFAULT NULL COMMENT '员工主键' ,
`f_id`  int(11) NULL DEFAULT NULL COMMENT '菜品主键' ,
`r_id`  int(11) NULL DEFAULT NULL COMMENT '餐厅主键' ,
`f_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品名称' ,
`f_price`  decimal(5,2) NULL DEFAULT NULL COMMENT '菜品价格' ,
`f_weight`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品重量' ,
`o_status`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态，1：等待，2：制作中，3：完成' ,
`o_create_time`  datetime NULL DEFAULT NULL COMMENT '下单时间' ,
`o_update_time`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_temp
-- ----------------------------
DROP TABLE IF EXISTS `order_temp`;
CREATE TABLE `order_temp` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`o_t_id`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`c_open_id`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`f_id`  int(11) NULL DEFAULT NULL ,
`o_t_time`  datetime NULL DEFAULT NULL ,
`r_id`  int(11) NULL DEFAULT NULL ,
`o_t_create_time`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='点餐表，顾客下单之前点的菜品，会临时保存在此表，以防顾客未下单，退出系统，再次进入后，可以直接显示已点菜品'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order_temp
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`p_id`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流水号' ,
`o_id`  int(11) NULL DEFAULT NULL ,
`p_status`  int(1) NULL DEFAULT NULL COMMENT '支付状态' ,
`p_time`  datetime NULL DEFAULT NULL COMMENT '支付时间' ,
`p_total`  decimal(7,2) NULL DEFAULT NULL COMMENT '支付总额' ,
`p_method`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式' ,
`d_code`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单方式' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单支付表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of payment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for restaurant
-- ----------------------------
DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '物理主键' ,
`r_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '逻辑主键' ,
`r_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '餐厅名称' ,
`r_address`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '餐厅地址' ,
`r_telephone`  varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固话（####-########)' ,
`r_mobile`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '餐厅手机号' ,
`r_describe`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '餐厅描述' ,
`r_province_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '餐厅所在省' ,
`r_city_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '餐厅所在市' ,
`r_district_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '餐厅所在区' ,
`r_county_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '餐厅所在县' ,
`r_allipay`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝支付账号' ,
`r_wechat`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付账号' ,
`r_allipay_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝支付账号的二维码图片url' ,
`r_wechatpay_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付二维码图片url' ,
`r_like_amount`  int(11) NULL DEFAULT NULL COMMENT '餐厅点赞数' ,
`r_open_time`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '餐厅营业时间，hh:mm-hh:mm' ,
`r_create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`r_update_time`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`, `r_id`),
INDEX `r_id` (`r_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='餐厅表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of restaurant
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for restaurant_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `restaurant_evaluate`;
CREATE TABLE `restaurant_evaluate` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '物理主键' ,
`r_e_id`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '逻辑主键' ,
`r_id`  int(11) NULL DEFAULT NULL COMMENT '餐厅主键' ,
`c_open_id`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顾客微信号' ,
`r_e_content`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价内容' ,
`r_e_time`  datetime NULL DEFAULT NULL COMMENT '评价时间' ,
`r_e_star_level`  int(1) NULL DEFAULT NULL COMMENT '星级指数' ,
`r_e_create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`r_e_update_time`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='餐厅评价表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of restaurant_evaluate
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`s_id`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '逻辑主键' ,
`s_name`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工姓名' ,
`s_no`  varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '由年月日时分秒组成（yyyymmddhhmmss）,作为逻辑主键' ,
`s_age`  int(11) NULL DEFAULT NULL COMMENT '年龄' ,
`s_mobile`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号' ,
`s_email`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件' ,
`s_login_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工登录用户名' ,
`s_login_password`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码' ,
`s_is_artificial_person`  char(1) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL DEFAULT '0' COMMENT '是否为法人，0：不是，1：是' ,
`s_salary`  decimal(8,2) NULL DEFAULT 0.00 COMMENT '月工资' ,
`s_nick_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称' ,
` r_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '餐厅逻辑主键' ,
`s_is_part_time`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否兼职，0：不是，1：是' ,
`s_work_time`  decimal(4,2) NULL DEFAULT 0.00 COMMENT '工作时长，小时为单位' ,
`s_create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`s_update_time`  datetime NULL DEFAULT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`),
FOREIGN KEY (` r_id`) REFERENCES `restaurant` (`r_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `r_id` (` r_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='员工表'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of staff
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Auto increment value for customer
-- ----------------------------
ALTER TABLE `customer` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for food
-- ----------------------------
ALTER TABLE `food` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for food_evaluate
-- ----------------------------
ALTER TABLE `food_evaluate` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for order
-- ----------------------------
ALTER TABLE `order` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for order_temp
-- ----------------------------
ALTER TABLE `order_temp` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for payment
-- ----------------------------
ALTER TABLE `payment` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for restaurant
-- ----------------------------
ALTER TABLE `restaurant` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for restaurant_evaluate
-- ----------------------------
ALTER TABLE `restaurant_evaluate` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for staff
-- ----------------------------
ALTER TABLE `staff` AUTO_INCREMENT=1;
