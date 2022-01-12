-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema car_register_system_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema car_register_system_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_register_system_db` DEFAULT CHARACTER SET utf8 ;
USE `car_register_system_db` ;

-- -----------------------------------------------------
-- Table `car_register_system_db`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `rut` VARCHAR(45) NOT NULL,
  `telefono` INT NULL,
  `direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_register_system_db`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`venta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `pago_total` INT NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_venta_cliente_idx` (`cliente_id` ASC) ,
  CONSTRAINT `fk_venta_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `car_register_system_db`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_register_system_db`.`estado_vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`estado_vehiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_register_system_db`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`marca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_register_system_db`.`tipo_vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`tipo_vehiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_register_system_db`.`vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`vehiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ingreso` DATE NOT NULL,
  `valor` INT NULL,
  `patente` VARCHAR(8) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `estado_vehiculo_id` INT NOT NULL,
  `marca_id` INT NOT NULL,
  `venta_id` INT NULL,
  `tipo_vehiculo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vehiculo_estado_vehiculo1_idx` (`estado_vehiculo_id` ASC) ,
  INDEX `fk_vehiculo_marca1_idx` (`marca_id` ASC) ,
  INDEX `fk_vehiculo_venta1_idx` (`venta_id` ASC) ,
  INDEX `fk_vehiculo_tipo_vehiculo1_idx` (`tipo_vehiculo_id` ASC) ,
  CONSTRAINT `fk_vehiculo_estado_vehiculo1`
    FOREIGN KEY (`estado_vehiculo_id`)
    REFERENCES `car_register_system_db`.`estado_vehiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_marca1`
    FOREIGN KEY (`marca_id`)
    REFERENCES `car_register_system_db`.`marca` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_venta1`
    FOREIGN KEY (`venta_id`)
    REFERENCES `car_register_system_db`.`venta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_tipo_vehiculo1`
    FOREIGN KEY (`tipo_vehiculo_id`)
    REFERENCES `car_register_system_db`.`tipo_vehiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_register_system_db`.`tipo_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`tipo_pago` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_register_system_db`.`tipo_pago_has_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`tipo_pago_has_venta` (
  `tipo_pago_id` INT NOT NULL,
  `venta_id` INT NOT NULL,
  PRIMARY KEY (`tipo_pago_id`, `venta_id`),
  INDEX `fk_tipo_pago_has_venta_venta1_idx` (`venta_id` ASC) ,
  INDEX `fk_tipo_pago_has_venta_tipo_pago1_idx` (`tipo_pago_id` ASC) ,
  CONSTRAINT `fk_tipo_pago_has_venta_tipo_pago1`
    FOREIGN KEY (`tipo_pago_id`)
    REFERENCES `car_register_system_db`.`tipo_pago` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_pago_has_venta_venta1`
    FOREIGN KEY (`venta_id`)
    REFERENCES `car_register_system_db`.`venta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_register_system_db`.`pago_efectivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`pago_efectivo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `monto` INT NOT NULL,
  `venta_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pago_efectivo_venta1_idx` (`venta_id` ASC) ,
  CONSTRAINT `fk_pago_efectivo_venta1`
    FOREIGN KEY (`venta_id`)
    REFERENCES `car_register_system_db`.`venta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_register_system_db`.`pago_cheque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`pago_cheque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `plazo` INT NULL,
  `valor` INT NULL,
  `venta_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pago_cheque_venta1_idx` (`venta_id` ASC) ,
  CONSTRAINT `fk_pago_cheque_venta1`
    FOREIGN KEY (`venta_id`)
    REFERENCES `car_register_system_db`.`venta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_register_system_db`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_register_system_db`.`estado_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`estado_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_register_system_db`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_register_system_db`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `correo` VARCHAR(45) NULL,
  `contraseña` VARCHAR(45) NULL,
  `pass_recovery` VARCHAR(45) NULL,
  `token` VARCHAR(45) NULL,
  `rol_id` INT NOT NULL,
  `estado_usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_rol1_idx` (`rol_id` ASC) ,
  INDEX `fk_usuario_estado_usuario1_idx` (`estado_usuario_id` ASC) ,
  CONSTRAINT `fk_usuario_rol1`
    FOREIGN KEY (`rol_id`)
    REFERENCES `car_register_system_db`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_estado_usuario1`
    FOREIGN KEY (`estado_usuario_id`)
    REFERENCES `car_register_system_db`.`estado_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


