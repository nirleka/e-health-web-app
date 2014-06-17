SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `e_healthKMS` ;
CREATE SCHEMA IF NOT EXISTS `e_healthKMS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `e_healthKMS` ;

-- -----------------------------------------------------
-- Table `e_healthKMS`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e_healthKMS`.`user` ;

CREATE TABLE IF NOT EXISTS `e_healthKMS`.`user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nomor_sip` VARCHAR(50) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `salt` VARCHAR(60) NOT NULL,
  `nama` VARCHAR(50) NOT NULL,
  `lokasi_penugasan` VARCHAR(50) NOT NULL,
  `no_telp` VARCHAR(20) NOT NULL,
  `role` CHAR(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_healthKMS`.`penyakit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e_healthKMS`.`penyakit` ;

CREATE TABLE IF NOT EXISTS `e_healthKMS`.`penyakit` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(50) NOT NULL,
  `penyebab` TEXT NOT NULL,
  `gejala` TEXT NOT NULL,
  `diagnosis` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_healthKMS`.`obat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e_healthKMS`.`obat` ;

CREATE TABLE IF NOT EXISTS `e_healthKMS`.`obat` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(100) NOT NULL,
  `keterangan` TEXT NOT NULL,
  `dosis` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_healthKMS`.`penyakit_has_obat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e_healthKMS`.`penyakit_has_obat` ;

CREATE TABLE IF NOT EXISTS `e_healthKMS`.`penyakit_has_obat` (
  `id_penyakit` BIGINT NOT NULL,
  `id_obat` BIGINT NOT NULL,
  PRIMARY KEY (`id_penyakit`, `id_obat`),
  INDEX `fk_penyakit_has_obat_obat1_idx` (`id_obat` ASC),
  INDEX `fk_penyakit_has_obat_penyakit_idx` (`id_penyakit` ASC),
  CONSTRAINT `fk_penyakit_has_obat_penyakit`
    FOREIGN KEY (`id_penyakit`)
    REFERENCES `e_healthKMS`.`penyakit` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_penyakit_has_obat_obat1`
    FOREIGN KEY (`id_obat`)
    REFERENCES `e_healthKMS`.`obat` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_healthKMS`.`gambar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e_healthKMS`.`gambar` ;

CREATE TABLE IF NOT EXISTS `e_healthKMS`.`gambar` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `file` VARCHAR(60) NOT NULL,
  `deskripsi` TEXT NOT NULL,
  `id_penyakit` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_gambar_penyakit1`
    FOREIGN KEY (`id_penyakit`)
    REFERENCES `e_healthKMS`.`penyakit` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_healthKMS`.`LogData`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `e_healthKMS`.`LogData` ;

CREATE TABLE IF NOT EXISTS `e_healthKMS`.`LogData` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `stamp` TIMESTAMP NOT NULL,
  `log_act` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
