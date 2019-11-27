/*
 Navicat Premium Data Transfer

 Source Server         : hgfds
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : mydb

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 08/11/2019 18:19:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alumno
-- ----------------------------
DROP TABLE IF EXISTS `alumno`;
CREATE TABLE `alumno`  (
  `clave_alumno` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `matricula_alumno` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clave_carrera` int(11) NOT NULL,
  `plan_estudios` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  `clave_proyecto` int(11) NULL DEFAULT 0,
  `id_persona` int(11) NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  PRIMARY KEY (`clave_alumno`) USING BTREE,
  INDEX `clave_carrera`(`clave_carrera`) USING BTREE,
  INDEX `clave_proyecto`(`clave_proyecto`) USING BTREE,
  INDEX `id_semestre`(`id_semestre`) USING BTREE,
  INDEX `id_persona`(`id_persona`) USING BTREE,
  INDEX `plan_estudios`(`plan_estudios`) USING BTREE,
  INDEX `id_solicitud`(`id_solicitud`) USING BTREE,
  INDEX `matricula_alumno`(`matricula_alumno`) USING BTREE,
  CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`clave_carrera`) REFERENCES `carrera` (`clave_carrera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`clave_proyecto`) REFERENCES `proyecto` (`clave_proyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `alumno_ibfk_3` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`idsemestre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `alumno_ibfk_4` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `alumno_ibfk_5` FOREIGN KEY (`plan_estudios`) REFERENCES `plan-estudios` (`id_plan_estudios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `alumno_ibfk_6` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudes` (`id_solicitud`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alumno
-- ----------------------------
INSERT INTO `alumno` VALUES ('AIP20192', '16232211', 3, 1, 9, NULL, 1, 1);

-- ----------------------------
-- Table structure for alumno-familiar
-- ----------------------------
DROP TABLE IF EXISTS `alumno-familiar`;
CREATE TABLE `alumno-familiar`  (
  `idalumno-familiar` int(11) NOT NULL AUTO_INCREMENT,
  `id_familiar` int(11) NOT NULL,
  `clave_alumno` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idalumno-familiar`) USING BTREE,
  INDEX `clave_alumno`(`clave_alumno`) USING BTREE,
  INDEX `id_familiar`(`id_familiar`) USING BTREE,
  CONSTRAINT `alumno-familiar_ibfk_1` FOREIGN KEY (`clave_alumno`) REFERENCES `alumno` (`clave_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `alumno-familiar_ibfk_2` FOREIGN KEY (`id_familiar`) REFERENCES `familiar` (`id_familiar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alumno-familiar
-- ----------------------------
INSERT INTO `alumno-familiar` VALUES (1, 1, 'AIP20192');

-- ----------------------------
-- Table structure for aprobacion
-- ----------------------------
DROP TABLE IF EXISTS `aprobacion`;
CREATE TABLE `aprobacion`  (
  `idaprobacion` int(11) NOT NULL,
  `id_solicitud` int(11) NOT NULL,
  `id_detalle_aprobacion` int(11) NOT NULL,
  `aprobacion_final` int(11) NOT NULL,
  `observaciones` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idaprobacion`) USING BTREE,
  INDEX `id_detalle_aprobacion`(`id_detalle_aprobacion`) USING BTREE,
  INDEX `aprobacion_final`(`aprobacion_final`) USING BTREE,
  INDEX `id_solicitud`(`id_solicitud`) USING BTREE,
  CONSTRAINT `aprobacion_ibfk_1` FOREIGN KEY (`id_detalle_aprobacion`) REFERENCES `detalle_aprobacion` (`iddetalle_aprobacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `aprobacion_ibfk_2` FOREIGN KEY (`aprobacion_final`) REFERENCES `estado_proyecto` (`id_estado_proyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `aprobacion_ibfk_3` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudes` (`id_solicitud`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aprobacion
-- ----------------------------
INSERT INTO `aprobacion` VALUES (1, 1, 1, 1, NULL);

-- ----------------------------
-- Table structure for asesor_externo
-- ----------------------------
DROP TABLE IF EXISTS `asesor_externo`;
CREATE TABLE `asesor_externo`  (
  `id_asesor_externo` int(11) NOT NULL,
  `rfc_empresa` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre_ae` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido_uno_ae` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido_dos_ae` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correo_electronico_ae` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono_ae` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usuario_ae` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_asesor_externo`) USING BTREE,
  INDEX `rfc_empresa`(`rfc_empresa`) USING BTREE,
  INDEX `usuario_ae`(`usuario_ae`) USING BTREE,
  CONSTRAINT `asesor_externo_ibfk_1` FOREIGN KEY (`rfc_empresa`) REFERENCES `empresa` (`rfc_empresa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `asesor_externo_ibfk_2` FOREIGN KEY (`usuario_ae`) REFERENCES `usuarios` (`usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of asesor_externo
-- ----------------------------
INSERT INTO `asesor_externo` VALUES (1, 'TRUP14', 'Pedro', 'Garcia', 'Sanchez', 'pedroGS@truper.com', '7617345692', 'pgs@tesji.edu.mx', '10003');

-- ----------------------------
-- Table structure for calificacion_exterior
-- ----------------------------
DROP TABLE IF EXISTS `calificacion_exterior`;
CREATE TABLE `calificacion_exterior`  (
  `id_cal_ext` int(11) NOT NULL,
  `calificacion_numero` float NOT NULL,
  `calificacion_documento` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_cal_ext`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of calificacion_exterior
-- ----------------------------
INSERT INTO `calificacion_exterior` VALUES (1, 80, 'calificacion.doc');

-- ----------------------------
-- Table structure for calificacion_interior
-- ----------------------------
DROP TABLE IF EXISTS `calificacion_interior`;
CREATE TABLE `calificacion_interior`  (
  `id_cal` int(11) NOT NULL,
  `calificacion_numero` float NOT NULL,
  `calificacion_documento` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_cal`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of calificacion_interior
-- ----------------------------
INSERT INTO `calificacion_interior` VALUES (1, 75, 'calificacion.doc');

-- ----------------------------
-- Table structure for carrera
-- ----------------------------
DROP TABLE IF EXISTS `carrera`;
CREATE TABLE `carrera`  (
  `clave_carrera` int(11) NOT NULL,
  `nombre_carrera` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status_carrera` bit(1) NOT NULL,
  PRIMARY KEY (`clave_carrera`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carrera
-- ----------------------------
INSERT INTO `carrera` VALUES (3, 'Ingenieria en sistemas computacionales', b'1');

-- ----------------------------
-- Table structure for detalle_aprobacion
-- ----------------------------
DROP TABLE IF EXISTS `detalle_aprobacion`;
CREATE TABLE `detalle_aprobacion`  (
  `iddetalle_aprobacion` int(11) NOT NULL,
  `clave_docente` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_estado_proyecto` int(11) NOT NULL,
  `observaciones` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`iddetalle_aprobacion`) USING BTREE,
  INDEX `id_estado_proyecto`(`id_estado_proyecto`) USING BTREE,
  INDEX `clave_docente`(`clave_docente`) USING BTREE,
  CONSTRAINT `detalle_aprobacion_ibfk_1` FOREIGN KEY (`id_estado_proyecto`) REFERENCES `estado_proyecto` (`id_estado_proyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalle_aprobacion_ibfk_2` FOREIGN KEY (`clave_docente`) REFERENCES `docente` (`clave_docente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detalle_aprobacion
-- ----------------------------
INSERT INTO `detalle_aprobacion` VALUES (1, 'DOC1', 1, NULL);

-- ----------------------------
-- Table structure for docente
-- ----------------------------
DROP TABLE IF EXISTS `docente`;
CREATE TABLE `docente`  (
  `clave_docente` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clave_carrera` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  PRIMARY KEY (`clave_docente`) USING BTREE,
  INDEX `clave_carrera`(`clave_carrera`) USING BTREE,
  INDEX `id_persona`(`id_persona`) USING BTREE,
  CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`clave_carrera`) REFERENCES `carrera` (`clave_carrera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `docente_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of docente
-- ----------------------------
INSERT INTO `docente` VALUES ('DOC1', 3, 3);

-- ----------------------------
-- Table structure for docente_rol
-- ----------------------------
DROP TABLE IF EXISTS `docente_rol`;
CREATE TABLE `docente_rol`  (
  `id_docente_rol` int(11) NOT NULL,
  `clave_docente` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_docente_rol`) USING BTREE,
  INDEX `clave_docente`(`clave_docente`) USING BTREE,
  INDEX `id_rol`(`id_rol`) USING BTREE,
  CONSTRAINT `docente_rol_ibfk_1` FOREIGN KEY (`clave_docente`) REFERENCES `docente` (`clave_docente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `docente_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of docente_rol
-- ----------------------------
INSERT INTO `docente_rol` VALUES (1, 'DOC1', 6);

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa`  (
  `rfc_empresa` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre_empresa` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correo_electronico_empresa` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status_empresa` bit(1) NOT NULL,
  PRIMARY KEY (`rfc_empresa`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO `empresa` VALUES ('TRUP14', 'TRUPER S.A. de C.V.', 'Jilotepec', '76523776', 'truper@tru.mx', b'1');

-- ----------------------------
-- Table structure for estado_proyecto
-- ----------------------------
DROP TABLE IF EXISTS `estado_proyecto`;
CREATE TABLE `estado_proyecto`  (
  `id_estado_proyecto` int(11) NOT NULL,
  `descripcion_estado_proyecto` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_estado_proyecto`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of estado_proyecto
-- ----------------------------
INSERT INTO `estado_proyecto` VALUES (1, 'Autorizo');
INSERT INTO `estado_proyecto` VALUES (2, 'No autorizo');
INSERT INTO `estado_proyecto` VALUES (3, 'Restructurar');

-- ----------------------------
-- Table structure for familiar
-- ----------------------------
DROP TABLE IF EXISTS `familiar`;
CREATE TABLE `familiar`  (
  `id_familiar` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `parentezco` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `numero_tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_familiar`) USING BTREE,
  INDEX `id_persona`(`id_persona`) USING BTREE,
  CONSTRAINT `familiar_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of familiar
-- ----------------------------
INSERT INTO `familiar` VALUES (1, 4, 'Tio', '5561206462');

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona`  (
  `id_persona` int(11) NOT NULL,
  `nombre_persona` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellidoUno_persona` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellidoDos_persona` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono_persona` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direccion_persona` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email_persona` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status_persona` bit(1) NOT NULL,
  `usuario_persona` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_persona`) USING BTREE,
  INDEX `usuario_persona`(`usuario_persona`) USING BTREE,
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`usuario_persona`) REFERENCES `usuarios` (`usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO `persona` VALUES (1, 'ADOLFO', 'INIESTA', 'PADILLA', '55513655664', 'CANALEJAS', 'ALGO@gmail.com', b'1', 'ainiesta@tesji.edu.mx');
INSERT INTO `persona` VALUES (2, 'LIZETH', 'GONZALEZ', 'ZARAGOZA', '77238768767', 'TEPEJI', 'OTROALGO@gmailcom', b'1', 'lgz@tesji.edu.mx');
INSERT INTO `persona` VALUES (3, 'JOEL', 'LARA ', 'HERNANDEZ', '76467638476', 'JILOTEPEC', 'QWERT@gmail.com', b'1', 'jlh@tesji.edu.mx');
INSERT INTO `persona` VALUES (4, 'PABLO', 'INIESTA', 'GOMEZ', '76736867328', 'CANALEJAS', 'USDHD@gmail.com', b'1', NULL);

-- ----------------------------
-- Table structure for plan-estudios
-- ----------------------------
DROP TABLE IF EXISTS `plan-estudios`;
CREATE TABLE `plan-estudios`  (
  `id_plan_estudios` int(11) NOT NULL,
  `descripcion_plan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status_plan_estudios` bit(1) NOT NULL,
  PRIMARY KEY (`id_plan_estudios`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plan-estudios
-- ----------------------------
INSERT INTO `plan-estudios` VALUES (1, 'ISIC-2010-31', b'1');

-- ----------------------------
-- Table structure for proyecto
-- ----------------------------
DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE `proyecto`  (
  `clave_proyecto` int(11) NOT NULL,
  `nombre_proyecto` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `anteproyecto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_inicio` datetime(0) NULL DEFAULT NULL,
  `fecha_termino` datetime(0) NULL DEFAULT NULL,
  `calificacion_final` float NULL DEFAULT NULL,
  `id_asesor_externo` int(11) NULL DEFAULT NULL,
  `clave_docente` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apoyo` bit(1) NULL DEFAULT NULL,
  `objetivo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_aprobacion` int(11) NULL DEFAULT NULL,
  `calificacion_externa` int(11) NULL DEFAULT NULL,
  `calificacion_interna` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`clave_proyecto`) USING BTREE,
  INDEX `id_asesor_externo`(`id_asesor_externo`) USING BTREE,
  INDEX `clave_docente`(`clave_docente`) USING BTREE,
  INDEX `id_aprobacion`(`id_aprobacion`) USING BTREE,
  INDEX `calificacion_externa`(`calificacion_externa`) USING BTREE,
  INDEX `calificacion_interna`(`calificacion_interna`) USING BTREE,
  CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`id_asesor_externo`) REFERENCES `asesor_externo` (`id_asesor_externo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyecto_ibfk_2` FOREIGN KEY (`clave_docente`) REFERENCES `docente` (`clave_docente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyecto_ibfk_3` FOREIGN KEY (`id_aprobacion`) REFERENCES `aprobacion` (`idaprobacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyecto_ibfk_4` FOREIGN KEY (`calificacion_externa`) REFERENCES `calificacion_exterior` (`id_cal_ext`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyecto_ibfk_5` FOREIGN KEY (`calificacion_interna`) REFERENCES `calificacion_interior` (`id_cal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proyecto
-- ----------------------------
INSERT INTO `proyecto` VALUES (1, 'ADMINISTRACION DE REDES LOCALES', 'adolfoRedesTruper.doc', '2019-07-30 16:05:23', '2019-10-30 16:05:35', 78, 1, 'DOC1', b'1', 'Administrar las redes locales de la empresa Truper con Linux', 1, 1, 1);

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `id_rol` int(11) NOT NULL,
  `descripcion_rol` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status_rol` bit(1) NOT NULL,
  PRIMARY KEY (`id_rol`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES (1, 'Docente', b'1');
INSERT INTO `rol` VALUES (2, 'Alumno', b'1');
INSERT INTO `rol` VALUES (3, 'Jefe Division', b'1');
INSERT INTO `rol` VALUES (4, 'Asesor Interno', b'1');
INSERT INTO `rol` VALUES (5, 'Asesor Externo', b'1');
INSERT INTO `rol` VALUES (6, 'Presidente', b'1');

-- ----------------------------
-- Table structure for semestre
-- ----------------------------
DROP TABLE IF EXISTS `semestre`;
CREATE TABLE `semestre`  (
  `idsemestre` int(11) NOT NULL,
  `descripcion_semestre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idsemestre`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of semestre
-- ----------------------------
INSERT INTO `semestre` VALUES (1, 'PRIMERO');
INSERT INTO `semestre` VALUES (2, 'SEGUNDO');
INSERT INTO `semestre` VALUES (3, 'TERCER');
INSERT INTO `semestre` VALUES (4, 'CUARTO');
INSERT INTO `semestre` VALUES (5, 'QUINTO');
INSERT INTO `semestre` VALUES (6, 'SEXTO');
INSERT INTO `semestre` VALUES (7, 'SEPTIMO');
INSERT INTO `semestre` VALUES (8, 'OCTAVO');
INSERT INTO `semestre` VALUES (9, 'NOVENO');
INSERT INTO `semestre` VALUES (10, 'DECIMO');
INSERT INTO `semestre` VALUES (11, 'ONCEAVO');
INSERT INTO `semestre` VALUES (12, 'DOCEAVO');

-- ----------------------------
-- Table structure for solicitudes
-- ----------------------------
DROP TABLE IF EXISTS `solicitudes`;
CREATE TABLE `solicitudes`  (
  `id_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `solicitud` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_solicitud`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of solicitudes
-- ----------------------------
INSERT INTO `solicitudes` VALUES (1, 'solicitudAdolfo.doc', 'Aceptada');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `usuario` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contrasenia` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status_usuario` bit(1) NOT NULL,
  `token` int(5) NOT NULL,
  PRIMARY KEY (`usuario`, `contrasenia`) USING BTREE,
  INDEX `usuario`(`usuario`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('ainiesta@tesji.edu.mx', 'qwerty', b'1', 10000);
INSERT INTO `usuarios` VALUES ('jlh@tesji.edu.mx', 'asdfg', b'1', 10001);
INSERT INTO `usuarios` VALUES ('lgz@tesji.edu.mx', 'poiuy', b'1', 10002);
INSERT INTO `usuarios` VALUES ('pgs@tesji.edu.mx', 'asdfg', b'1', 10003);

SET FOREIGN_KEY_CHECKS = 1;
