SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- -----------------------------------------------------
-- Schema general
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `general` ;
-- -----------------------------------------------------

USE `general` ;

-- -----------------------------------------------------
-- Table `general`.`currency_code`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `general`.`currency_code` ;

CREATE TABLE IF NOT EXISTS `general`.`currency_code` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `currency_name` VARCHAR(255) NOT NULL COMMENT '貨幣名稱',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COMMENT = '貨幣幣別';


-- -----------------------------------------------------
-- Table `general`.`payee_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `general`.`payee_type` ;

CREATE TABLE IF NOT EXISTS `general`.`payee_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` TINYINT NOT NULL DEFAULT '0' COMMENT '收款方式\n0:銀行',
  `description` VARCHAR(45) NULL DEFAULT NULL COMMENT '收款方式描述',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `type_UNIQUE` (`type` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
COMMENT = '收款方式';


-- -----------------------------------------------------
-- Table `general`.`receive_bank`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `general`.`receive_bank` ;

CREATE TABLE IF NOT EXISTS `general`.`receive_bank` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `swift_code` VARCHAR(15) NULL DEFAULT NULL COMMENT 'Swift Code',
  `code` VARCHAR(5) NULL DEFAULT NULL COMMENT '台灣銀行代碼',
  `viet_name` VARCHAR(100) NULL DEFAULT NULL COMMENT '名稱(越南)',
  `en_name` VARCHAR(100) NULL DEFAULT NULL COMMENT '名稱(英文)',
  `tw_name` VARCHAR(100) NULL DEFAULT NULL COMMENT '名稱(繁体中文)',
  `sort_num` INT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_swift_code` (`swift_code` ASC))
ENGINE = InnoDB
COMMENT = '可收款银行表';


-- -----------------------------------------------------
-- Table `general`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `general`.`user` ;

CREATE TABLE IF NOT EXISTS `general`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phone` VARCHAR(255) NULL DEFAULT NULL COMMENT '手機號碼',
  `email` VARCHAR(255) NULL DEFAULT NULL COMMENT '信箱',
  `password` VARCHAR(255) NULL DEFAULT NULL COMMENT '密碼',
  `lock_status` INT NULL DEFAULT '0' COMMENT '是否被锁定, 0:未锁定; 1:锁定',
  `country` VARCHAR(255) NULL DEFAULT NULL COMMENT '國家',
  `arc_name` VARCHAR(255) NULL DEFAULT NULL COMMENT 'ARC姓名',
  `arc_no` VARCHAR(255) NULL DEFAULT NULL COMMENT 'ARC ID',
  `id_image_a` VARCHAR(255) NULL DEFAULT NULL COMMENT '證件正面',
  `id_image_b` VARCHAR(255) NULL DEFAULT NULL COMMENT '證件反面',
  `id_image_c` VARCHAR(255) NULL DEFAULT NULL COMMENT '手持證件照',
  `kyc_status` INT NULL DEFAULT NULL COMMENT 'KYC審核狀態, \r\n-1:未通過, \r\n0:未認證,\r\n1:待審核,\r\n2:審核通過;',
  `kyc_status_update_time` TIMESTAMP NULL DEFAULT NULL COMMENT 'LV2审核通过时间',
  `register_time` TIMESTAMP NULL DEFAULT NULL COMMENT '注册时间',
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `fb_id` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `fb_id_UNIQUE` (`fb_id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 10001
DEFAULT CHARACTER SET = utf8mb4
COMMENT = '用户表';


-- -----------------------------------------------------
-- Table `general`.`often_beneficiar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `general`.`often_beneficiar` ;

CREATE TABLE IF NOT EXISTS `general`.`often_beneficiar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT '收款人姓名',
  `type` TINYINT NOT NULL COMMENT '收款方式\n對應payee_type\n',
  `payee_address` VARCHAR(100) NOT NULL COMMENT '根據type有不同格式\n',
  `note` VARCHAR(100) NULL DEFAULT '' COMMENT '備註',
  `user_id` INT NOT NULL,
  `receive_bank_id` INT NOT NULL,
  `payee_type_id` INT NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_often_beneficiar_user1_idx` (`user_id` ASC),
  INDEX `fk_often_beneficiar_receive_bank1_idx` (`receive_bank_id` ASC),
  INDEX `fk_often_beneficiar_payee_type1_idx` (`payee_type_id` ASC),
  CONSTRAINT `fk_often_beneficiar_payee_type1`
    FOREIGN KEY (`payee_type_id`)
    REFERENCES `general`.`payee_type` (`id`),
  CONSTRAINT `fk_often_beneficiar_receive_bank1`
    FOREIGN KEY (`receive_bank_id`)
    REFERENCES `general`.`receive_bank` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_often_beneficiar_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `general`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = '常用收款人';


-- -----------------------------------------------------
-- Table `general`.`remit_record`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `general`.`remit_record` ;

CREATE TABLE IF NOT EXISTS `general`.`remit_record` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `arc_name` VARCHAR(255) NOT NULL,
  `arc_no` VARCHAR(255) NOT NULL,
  `payee_type` TINYINT NOT NULL COMMENT '收款方式,對應table:payee_type\n',
  `id_image_a` VARCHAR(255) NULL DEFAULT NULL,
  `id_image_b` VARCHAR(255) NULL DEFAULT NULL,
  `id_image_c` VARCHAR(255) NULL DEFAULT NULL,
  `real_time_pic` VARCHAR(255) NOT NULL COMMENT '即時拍照',
  `e-signature` VARCHAR(255) NOT NULL COMMENT '電子簽名',
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payee_address` VARCHAR(45) NULL DEFAULT NULL COMMENT '根據payee_type此欄位有不同格式\n若payee_type為銀行匯款方式\n則此欄位即為銀行帳號',
  `receive_bank_id` VARCHAR(45) NULL DEFAULT NULL,
  `from_currency_id` INT NOT NULL COMMENT '匯出國家幣',
  `to_currency_id` INT NULL DEFAULT NULL COMMENT '收款國家幣',
  `from_amount` DOUBLE NOT NULL,
  `apply_exchange_rate` DOUBLE NOT NULL COMMENT '使用者申請時當下匯率\n',
  `transaction_exchange_rate` DOUBLE NOT NULL COMMENT '實際匯款時的匯率\n',
  `fee` DOUBLE NOT NULL COMMENT '手續費要搭配fee_type\n',
  `fee_type` TINYINT(1) NOT NULL COMMENT '手續費計算方式\n0:數量\n1:百分比',
  `discount_id` INT NULL DEFAULT NULL,
  `discount_amount` DOUBLE NULL DEFAULT NULL COMMENT '總折扣金額',
  `transaction_status` TINYINT NOT NULL COMMENT '-9:其他錯誤\n-1: 拒絕\n0: 待繳款\n1: 已繳款\n2: 已匯款',
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_remit_record_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_remit_record_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `general`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = '匯款紀錄';


-- -----------------------------------------------------
-- Table `general`.`user_login_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `general`.`user_login_log` ;

CREATE TABLE IF NOT EXISTS `general`.`user_login_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ip` VARCHAR(255) NULL DEFAULT NULL COMMENT 'IP',
  `address` VARCHAR(255) NULL DEFAULT NULL COMMENT 'login地區',
  `login_time` TIMESTAMP NULL DEFAULT NULL COMMENT '登入時間',
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_user_login_log_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_login_log_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `general`.`user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '用戶登入紀錄';


SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

-- -----------------------------------------------------
-- Data for table `general`.`payee_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `general`;
INSERT INTO `general`.`payee_type` (`id`, `type`, `description`) VALUES (1, 0, '銀行帳號匯款');

-- -----------------------------------------------------
-- Data for table `general`.`currency_code`
-- -----------------------------------------------------
INSERT INTO `general`.`currency_code` (`id`, `currency_name`) VALUES (1, 'TWD');
INSERT INTO `general`.`currency_code` (`id`, `currency_name`) VALUES (2, 'USD');
INSERT INTO `general`.`currency_code` (`id`, `currency_name`) VALUES (3, 'VND');

COMMIT;

