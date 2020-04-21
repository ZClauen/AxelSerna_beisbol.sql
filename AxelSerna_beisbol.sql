/*Axel Serna Roman MYSQL el proyecto tiene su tabla de estadisticas juegos y equipos, la tabla principal donde se modificara cada
encuentro sera la tabla de juegos en ella ya estan precargados todos los equipos con sus juegos de serie para que solamente 
se escriban las carreras anotadas por cada juego , las carreras recibidas y un boolean que indica que el juego ya se jugo
el boolean que es nesesario para cerrar el ciclo de la serie que viene cerrandose jugando los 56 juegos de esta, son 8 equipos 
precargados cada equipo tendra 7 juegos que jugar para cerrar el ciclo de la serie , al modificar la tabla de juego se iran haciendo 
cambios a la tabla de estadisticas mediante triggers */
/*FUNCIONA CON INSERTS,DELETES Y UPDATES EN TABLA DE JUEGO*/ 
/*NO HAY EMPATES EN EL PROCESO*/


-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema AxelSerna_proyecto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AxelSerna_proyecto` DEFAULT CHARACTER SET utf8 ;
USE `AxelSerna_proyecto` ;

-- -----------------------------------------------------
-- Table `AxelSerna_proyecto`.`equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AxelSerna_proyecto`.`equipos` (
  `equipo_id` INT NOT NULL AUTO_INCREMENT,
  `equipo_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`equipo_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AxelSerna_proyecto`.`estadisticas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AxelSerna_proyecto`.`estadisticas` (
  `estadisticas_id` INT NOT NULL AUTO_INCREMENT,
  `estadisticas_equipo_id` INT NOT NULL,
  `estadisticas_series_ganadas` INT NOT NULL,
  `estadisticas_juegos_ganados` INT NOT NULL,
  `estadisticas_juegos_perdidos` INT NOT NULL,
  `estadisticas_carreras_anotadas` INT NOT NULL,
  `estadisticas_carreras_recibidas` INT NOT NULL,
  PRIMARY KEY (`estadisticas_id`),
  CONSTRAINT `fk_estadisticas_equipos`
    FOREIGN KEY (`estadisticas_equipo_id`)
    REFERENCES `AxelSerna_proyecto`.`equipos` (`equipo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AxelSerna_proyecto`.`series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AxelSerna_proyecto`.`series` (
  `serie_id` INT NOT NULL AUTO_INCREMENT,
  `serie_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`serie_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AxelSerna_proyecto`.`juegos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AxelSerna_proyecto`.`juegos` (
  `juego_id` INT NOT NULL AUTO_INCREMENT,
  `serie_id` INT NOT NULL,
  `equipo_id` INT NOT NULL,
  `juego_carreras_anotadas` INT NOT NULL,
  `juego_carreras_recibidas` INT NOT NULL,
  `juego_jugado` INT NOT NULL,
  PRIMARY KEY (`juego_id`),
  CONSTRAINT `fk_juegos_series1`
    FOREIGN KEY (`serie_id`)
    REFERENCES `AxelSerna_proyecto`.`series` (`serie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_juegos_equipos1`
    FOREIGN KEY (`equipo_id`)
    REFERENCES `AxelSerna_proyecto`.`equipos` (`equipo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `axelserna_proyecto`.`j_series` (
  `idj_series` INT NOT NULL AUTO_INCREMENT,
  `serie_id` INT NOT NULL,
  `equipo_id` INT NOT NULL,
  `ganadas` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idj_series`),
  CONSTRAINT `serie_id`
    FOREIGN KEY (`serie_id`)
    REFERENCES `axelserna_proyecto`.`series` (`serie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipo_id`
    FOREIGN KEY (`equipo_id`)
    REFERENCES `axelserna_proyecto`.`equipos` (`equipo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `axelserna_proyecto`.`equipos` (`equipo_id`, `equipo_nombre`) VALUES ('1', 'gatos');
INSERT INTO `axelserna_proyecto`.`equipos` (`equipo_id`, `equipo_nombre`) VALUES ('2', 'perros');
INSERT INTO `axelserna_proyecto`.`equipos` (`equipo_id`, `equipo_nombre`) VALUES ('3', 'tortugas');
INSERT INTO `axelserna_proyecto`.`equipos` (`equipo_id`, `equipo_nombre`) VALUES ('4', 'conejos');
INSERT INTO `axelserna_proyecto`.`equipos` (`equipo_id`, `equipo_nombre`) VALUES ('5', 'zorros');
INSERT INTO `axelserna_proyecto`.`equipos` (`equipo_id`, `equipo_nombre`) VALUES ('6', 'pollos');
INSERT INTO `axelserna_proyecto`.`equipos` (`equipo_id`, `equipo_nombre`) VALUES ('7', 'pericos');
INSERT INTO `axelserna_proyecto`.`equipos` (`equipo_id`, `equipo_nombre`) VALUES ('8', 'hurones');


INSERT INTO `axelserna_proyecto`.`estadisticas` (`estadisticas_id`, `estadisticas_equipo_id`, `estadisticas_series_ganadas`, `estadisticas_juegos_ganados`, `estadisticas_juegos_perdidos`, `estadisticas_carreras_anotadas`, `estadisticas_carreras_recibidas`) VALUES ('1', '1', '0', '0', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`estadisticas` (`estadisticas_id`, `estadisticas_equipo_id`, `estadisticas_series_ganadas`, `estadisticas_juegos_ganados`, `estadisticas_juegos_perdidos`, `estadisticas_carreras_anotadas`, `estadisticas_carreras_recibidas`) VALUES ('2', '2', '0', '0', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`estadisticas` (`estadisticas_id`, `estadisticas_equipo_id`, `estadisticas_series_ganadas`, `estadisticas_juegos_ganados`, `estadisticas_juegos_perdidos`, `estadisticas_carreras_anotadas`, `estadisticas_carreras_recibidas`) VALUES ('3', '3', '0', '0', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`estadisticas` (`estadisticas_id`, `estadisticas_equipo_id`, `estadisticas_series_ganadas`, `estadisticas_juegos_ganados`, `estadisticas_juegos_perdidos`, `estadisticas_carreras_anotadas`, `estadisticas_carreras_recibidas`) VALUES ('4', '4', '0', '0', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`estadisticas` (`estadisticas_id`, `estadisticas_equipo_id`, `estadisticas_series_ganadas`, `estadisticas_juegos_ganados`, `estadisticas_juegos_perdidos`, `estadisticas_carreras_anotadas`, `estadisticas_carreras_recibidas`) VALUES ('5', '5', '0', '0', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`estadisticas` (`estadisticas_id`, `estadisticas_equipo_id`, `estadisticas_series_ganadas`, `estadisticas_juegos_ganados`, `estadisticas_juegos_perdidos`, `estadisticas_carreras_anotadas`, `estadisticas_carreras_recibidas`) VALUES ('6', '6', '0', '0', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`estadisticas` (`estadisticas_id`, `estadisticas_equipo_id`, `estadisticas_series_ganadas`, `estadisticas_juegos_ganados`, `estadisticas_juegos_perdidos`, `estadisticas_carreras_anotadas`, `estadisticas_carreras_recibidas`) VALUES ('7', '7', '0', '0', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`estadisticas` (`estadisticas_id`, `estadisticas_equipo_id`, `estadisticas_series_ganadas`, `estadisticas_juegos_ganados`, `estadisticas_juegos_perdidos`, `estadisticas_carreras_anotadas`, `estadisticas_carreras_recibidas`) VALUES ('8', '8', '0', '0', '0', '0', '0');

INSERT INTO `axelserna_proyecto`.`series` (`serie_id`, `serie_nombre`) VALUES ('1', '2019 MX');
INSERT INTO `axelserna_proyecto`.`series` (`serie_id`, `serie_nombre`) VALUES ('2', '2020 MX');

INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('1', '1', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('2', '1', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('3', '1', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('4', '1', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('5', '1', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('6', '1', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('7', '1', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('8', '1', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('9', '1', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('10', '1', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('11', '1', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('12', '1', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('13', '1', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('14', '1', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('15', '1', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('16', '1', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('17', '1', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('18', '1', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('19', '1', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('20', '1', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('21', '1', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('22', '1', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('23', '1', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('24', '1', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('25', '1', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('26', '1', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('27', '1', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('28', '1', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('29', '1', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('30', '1', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('31', '1', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('32', '1', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('33', '1', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('34', '1', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('35', '1', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('36', '1', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('37', '1', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('38', '1', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('39', '1', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('40', '1', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('41', '1', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('42', '1', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('43', '1', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('44', '1', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('45', '1', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('46', '1', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('47', '1', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('48', '1', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('49', '1', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('50', '1', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('51', '1', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('52', '1', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('53', '1', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('54', '1', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('55', '1', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('56', '1', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('57', '2', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('58', '2', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('59', '2', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('60', '2', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('61', '2', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('62', '2', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('63', '2', '1', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('64', '2', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('65', '2', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('66', '2', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('67', '2', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('68', '2', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('69', '2', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('70', '2', '2', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('71', '2', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('72', '2', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('73', '2', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('74', '2', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('75', '2', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('76', '2', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('77', '2', '3', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('78', '2', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('79', '2', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('80', '2', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('81', '2', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('82', '2', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('83', '2', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('84', '2', '4', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('85', '2', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('86', '2', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('87', '2', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('88', '2', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('89', '2', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('90', '2', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('91', '2', '5', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('92', '2', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('93', '2', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('94', '2', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('95', '2', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('96', '2', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('97', '2', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('98', '2', '6', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('99', '2', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('100', '2', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('101', '2', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('102', '2', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('103', '2', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('104', '2', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('105', '2', '7', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('106', '2', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('107', '2', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('108', '2', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('109', '2', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('110', '2', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('111', '2', '8', '0', '0', '0');
INSERT INTO `axelserna_proyecto`.`juegos` (`juego_id`, `serie_id`, `equipo_id`, `juego_carreras_anotadas`, `juego_carreras_recibidas`, `juego_jugado`) VALUES ('112', '2', '8', '0', '0', '0');

INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('1', '1', '1', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('2', '1', '2', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('3', '1', '3', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('4', '1', '4', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('5', '1', '5', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('6', '1', '6', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('7', '1', '7', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('8', '1', '8', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('9', '2', '1', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('10', '2', '2', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('11', '2', '3', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('12', '2', '4', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('13', '2', '5', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('14', '2', '6', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('15', '2', '7', '0');
INSERT INTO `axelserna_proyecto`.`j_series` (`idj_series`, `serie_id`, `equipo_id`, `ganadas`) VALUES ('16', '2', '8', '0');

use AxelSerna_proyecto;
/*...drop TRIGGER update_estadisticas;...*/ 
/*...drop TRIGGER insert_estadisticas;...*/ 
/*...drop TRIGGER delete_estadisticas;...*/ 

SET @juga2 = 0;
SET @juga3 = 0;
SET @gan = 0;
SET @gan2 = 0;
SET @VAR1 = 0;

DELIMITER $$
CREATE TRIGGER update_estadisticas AFTER UPDATE on juegos
FOR EACH ROW 
BEGIN
  Update estadisticas set estadisticas_carreras_anotadas = estadisticas_carreras_anotadas + new.juego_carreras_anotadas,  estadisticas_carreras_recibidas = estadisticas_carreras_recibidas + new.juego_carreras_recibidas where estadisticas_equipo_id = old.equipo_id;
  select sum(juegos.juego_jugado) into @juga2 from juegos where juegos.serie_id = 1;
  select sum(juegos.juego_jugado) into @juga3 from juegos where juegos.serie_id = 2;
  select j_series.equipo_id into @gan from j_series where j_series.serie_id = 1 order by ganadas desc limit 1;
  select j_series.equipo_id into @gan2 from j_series where j_series.serie_id = 2 order by ganadas desc limit 1;
  IF new.juego_carreras_anotadas > new.juego_carreras_recibidas THEN BEGIN
    Update estadisticas set estadisticas_juegos_ganados = estadisticas_juegos_ganados + 1 where estadisticas_equipo_id = old.equipo_id;
    if old.serie_id = 1 THEN BEGIN
		Update j_series set ganadas = ganadas + 1 where equipo_id = old.equipo_id && serie_id= old.serie_id;
	END;
	elseif old.serie_id = 2 THEN BEGIN
		Update j_series set ganadas = ganadas + 1 where equipo_id = old.equipo_id && serie_id= old.serie_id;
	END;
	END IF;
	 if @juga2 = 56 && @VAR1 = 0 THEN BEGIN
		Update estadisticas set estadisticas_series_ganadas = estadisticas_series_ganadas + 1 where estadisticas_equipo_id = @gan;
        SET @VAR1 = 1;
	END;
	elseif @juga3 = 56 && @VAR2 = 0 THEN BEGIN
		Update estadisticas set estadisticas_series_ganadas = estadisticas_series_ganadas + 1 where estadisticas_equipo_id = @gan2;
        SET @VAR2 = 1;
	END;
	END IF;
  END;
  elseif new.juego_carreras_anotadas < new.juego_carreras_recibidas THEN BEGIN
	Update estadisticas set estadisticas_juegos_perdidos = estadisticas_juegos_perdidos + 1 where estadisticas_equipo_id = old.equipo_id;
    if @juga2 = 56 THEN BEGIN
		Update estadisticas set estadisticas_series_ganadas = estadisticas_series_ganadas + 1 where estadisticas_equipo_id = @gan;
	END;
	elseif @juga3 = 56 THEN BEGIN
		Update estadisticas set estadisticas_series_ganadas = estadisticas_series_ganadas + 1 where estadisticas_equipo_id = @gan2;
	END;
	END IF;
  END;
  END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER insert_estadisticas AFTER INSERT on juegos
FOR EACH ROW 
BEGIN
  Update estadisticas set estadisticas_carreras_anotadas = estadisticas_carreras_anotadas + new.juego_carreras_anotadas,  estadisticas_carreras_recibidas = estadisticas_carreras_recibidas + new.juego_carreras_recibidas where estadisticas_equipo_id = new.equipo_id;
  select sum(juegos.juego_jugado) into @juga2 from juegos where juegos.serie_id = 1;
  select sum(juegos.juego_jugado) into @juga3 from juegos where juegos.serie_id = 2;
  select j_series.equipo_id into @gan from j_series where j_series.serie_id = 1 order by ganadas desc limit 1;
  select j_series.equipo_id into @gan2 from j_series where j_series.serie_id = 2 order by ganadas desc limit 1;
  IF new.juego_carreras_anotadas > new.juego_carreras_recibidas THEN BEGIN
    Update estadisticas set estadisticas_juegos_ganados = estadisticas_juegos_ganados + 1 where estadisticas_equipo_id = new.equipo_id;
    if new.serie_id = 1 THEN BEGIN
		Update j_series set ganadas = ganadas + 1 where equipo_id = new.equipo_id && serie_id= new.serie_id;
	END;
	elseif new.serie_id = 2 THEN BEGIN
		Update j_series set ganadas = ganadas + 1 where equipo_id = new.equipo_id && serie_id= new.serie_id;
	END;
	END IF;
	 if @juga2 = 56 && @VAR1 = 0 THEN BEGIN
		Update estadisticas set estadisticas_series_ganadas = estadisticas_series_ganadas + 1 where estadisticas_equipo_id = @gan;
        SET @VAR1 = 1;
	END;
	elseif @juga3 = 56 && @VAR2 = 0 THEN BEGIN
		Update estadisticas set estadisticas_series_ganadas = estadisticas_series_ganadas + 1 where estadisticas_equipo_id = @gan2;
        SET @VAR2 = 1;
	END;
	END IF;
  END;
  elseif new.juego_carreras_anotadas < new.juego_carreras_recibidas THEN BEGIN
	Update estadisticas set estadisticas_juegos_perdidos = estadisticas_juegos_perdidos + 1 where estadisticas_equipo_id = new.equipo_id;
    if @juga2 = 56 THEN BEGIN
		Update estadisticas set estadisticas_series_ganadas = estadisticas_series_ganadas + 1 where estadisticas_equipo_id = @gan;
	END;
	elseif @juga3 = 56 THEN BEGIN
		Update estadisticas set estadisticas_series_ganadas = estadisticas_series_ganadas + 1 where estadisticas_equipo_id = @gan2;
	END;
	END IF;
  END;
  END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER delete_estadisticas BEFORE DELETE on juegos
FOR EACH ROW 
BEGIN
  Update estadisticas set estadisticas_carreras_anotadas = estadisticas_carreras_anotadas - old.juego_carreras_anotadas,  estadisticas_carreras_recibidas = estadisticas_carreras_recibidas - old.juego_carreras_recibidas where estadisticas_equipo_id = old.equipo_id;
  select sum(juegos.juego_jugado) into @juga2 from juegos where juegos.serie_id = 1;
  select sum(juegos.juego_jugado) into @juga3 from juegos where juegos.serie_id = 2;
  select j_series.equipo_id into @gan from j_series where j_series.serie_id = 1 order by ganadas desc limit 1;
  select j_series.equipo_id into @gan2 from j_series where j_series.serie_id = 2 order by ganadas desc limit 1;
  IF old.juego_carreras_anotadas > old.juego_carreras_recibidas THEN BEGIN
    Update estadisticas set estadisticas_juegos_ganados = estadisticas_juegos_ganados - 1 where estadisticas_equipo_id = old.equipo_id;
    if old.serie_id = 1 THEN BEGIN
		Update j_series set ganadas = ganadas - 1 where equipo_id = old.equipo_id && serie_id= old.serie_id;
	END;
	elseif old.serie_id = 2 THEN BEGIN
		Update j_series set ganadas = ganadas - 1 where equipo_id = old.equipo_id && serie_id= old.serie_id;
	END;
	END IF;
  END;
  elseif old.juego_carreras_anotadas < old.juego_carreras_recibidas THEN BEGIN
	Update estadisticas set estadisticas_juegos_perdidos = estadisticas_juegos_perdidos - 1 where estadisticas_equipo_id = old.equipo_id;
  END;
  END IF;
END$$
DELIMITER ;
