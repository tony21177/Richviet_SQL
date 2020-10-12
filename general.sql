
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;




-- -----------------------------------------------------
-- Schema general
--
-- 通用服務
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `general` DEFAULT CHARACTER SET utf8 ;
USE `general` ;

-- -----------------------------------------------------
-- Table `general`.`receive_bank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `general`.`receive_bank` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `swift_code` VARCHAR(15) NULL DEFAULT NULL COMMENT 'Swift Code',
  `code` VARCHAR(5) NULL DEFAULT NULL COMMENT '台灣銀行代碼',
  `viet_name` VARCHAR(100) NULL DEFAULT NULL COMMENT '名稱(越南)',
  `en_name` VARCHAR(100) NULL DEFAULT NULL COMMENT '名稱(英文)',
  `tw_name` VARCHAR(100) NULL DEFAULT NULL COMMENT '名稱(繁体中文)',
  `sort_num` INT NULL DEFAULT '0' COMMENT '排序',
  UNIQUE INDEX `uk_swift_code` (`swift_code` ASC),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 46
DEFAULT CHARACTER SET = utf8
COMMENT = '可收款银行表';


-- -----------------------------------------------------
-- Table `general`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `general`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phone` VARCHAR(255) NULL DEFAULT NULL COMMENT '手機號碼',
  `email` VARCHAR(255) NULL DEFAULT NULL COMMENT '信箱',
  `password` VARCHAR(255) NULL DEFAULT NULL COMMENT '密碼',
  `lock_status` INT NULL DEFAULT 0 COMMENT '是否被锁定, 0:未锁定; 1:锁定',
  `country` VARCHAR(255) NULL DEFAULT NULL COMMENT '國家',
  `arc_name` VARCHAR(255) NULL DEFAULT NULL COMMENT 'ARC姓名',
  `arc_no` VARCHAR(255) NULL DEFAULT NULL COMMENT 'ARC ID',
  `id_image_a` VARCHAR(255) NULL DEFAULT NULL COMMENT '證件正面',
  `id_image_b` VARCHAR(255) NULL DEFAULT NULL COMMENT '證件反面',
  `id_image_c` VARCHAR(255) NULL DEFAULT NULL COMMENT '手持證件照',
  `kyc_status` INT NULL DEFAULT NULL COMMENT 'KYC審核狀態, \r\n-1:未通過, \r\n0:未認證,\r\n1:待審核,\r\n2:審核通過;',
  `kyc_status_update_time` TIMESTAMP NULL DEFAULT NULL COMMENT 'LV2审核通过时间',
  `register_time` TIMESTAMP NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` TIMESTAMP NULL DEFAULT NULL COMMENT '更新时间',
  `fb_id` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `fb_id_UNIQUE` (`fb_id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 10001
DEFAULT CHARACTER SET = utf8
COMMENT = '用户表';


-- -----------------------------------------------------
-- Table `general`.`user_login_log`
-- -----------------------------------------------------
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
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '用戶登入紀錄';


-- -----------------------------------------------------
-- Table `general`.`remit_record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `general`.`remit_record` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_remit_record_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_remit_record_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `general`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '匯款紀錄';


-- -----------------------------------------------------
-- Table `general`.`often_beneficiar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `general`.`often_beneficiar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT '收款人姓名',
  `type` TINYINT(2) NOT NULL COMMENT '收款方式\n對應payee_type\n',
  `address` VARCHAR(100) NOT NULL COMMENT '根據type有不同格式\n',
  `note` VARCHAR(100) NULL DEFAULT '' COMMENT '備註',
  `user_id` INT NOT NULL,
  `bank_id` INT NULL COMMENT '銀行\n對應receive_bank的PK\n',
  `receive_bank_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_often_beneficiar_user1_idx` (`user_id` ASC),
  INDEX `fk_often_beneficiar_receive_bank1_idx` (`receive_bank_id` ASC),
  CONSTRAINT `fk_often_beneficiar_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `general`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_often_beneficiar_receive_bank1`
    FOREIGN KEY (`receive_bank_id`)
    REFERENCES `general`.`receive_bank` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '常用收款人';


-- -----------------------------------------------------
-- Table `general`.`payee_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `general`.`payee_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` TINYINT(2) NOT NULL DEFAULT 0 COMMENT '收款方式\n0:銀行',
  `description` VARCHAR(45) NULL COMMENT '收款方式描述',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `type_UNIQUE` (`type` ASC))
COMMENT = '收款方式';


SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

