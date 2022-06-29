-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2022 a las 10:38:17
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectobd`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `ObtenNumeros` (`doc_id` INTEGER) RETURNS INT(11)  BEGIN
    DECLARE nroMateria INTEGER;
		SELECT COUNT(*) INTO nroMateria FROM doc_asignacion WHERE docente_id = doc_id;
		RETURN nroMateria;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `detalle_estudiante`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `detalle_estudiante` (
`estudiante` varchar(92)
,`ci` varchar(30)
,`edad` int(11)
,`semestre` varchar(30)
,`materia` varchar(50)
,`docente` varchar(92)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `docente_id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `paterno` varchar(30) DEFAULT NULL,
  `materno` varchar(30) DEFAULT NULL,
  `ci` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`docente_id`, `nombre`, `paterno`, `materno`, `ci`, `email`, `password`) VALUES
(1, 'Marco', 'Perez', 'Julian', '8456123', 'Marco@gmai.com', 'marcoPJ874'),
(2, 'Jose', 'Antoniet', 'Pacheco', '8453217', 'Jose@gmail.com', 'jose4587'),
(3, 'Maria', 'Acevedo', 'Condori', '4562178', 'Maria@gmail.com', 'mari1234'),
(4, 'Eimi', 'Celeste', 'Cutipa', '4513245', 'Eimi@gmail.com', 'eimi7845'),
(5, 'Rosa', 'Gomez', 'Jimenez', '8721354', 'Rosa@gmail.com', 'rosi4567');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doc_asignacion`
--

CREATE TABLE `doc_asignacion` (
  `doc_asignacion_id` int(11) NOT NULL,
  `docente_id` int(11) DEFAULT NULL,
  `materia_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `doc_asignacion`
--

INSERT INTO `doc_asignacion` (`doc_asignacion_id`, `docente_id`, `materia_id`) VALUES
(1, 1, 43),
(2, 2, 47),
(3, 3, 53),
(4, 2, 3),
(5, 3, 2),
(6, 4, 13),
(7, 5, 23),
(8, 1, 55),
(9, 2, 16),
(10, 3, 55),
(11, 4, 8),
(12, 5, 17),
(13, 1, 5),
(14, 2, 11),
(15, 3, 58),
(16, 4, 19),
(17, 5, 20),
(18, 1, 25),
(19, 2, 15),
(20, 3, 1),
(21, 4, 12),
(22, 5, 30),
(23, 1, 31),
(24, 2, 38),
(25, 3, 4),
(26, 4, 14),
(27, 5, 21),
(28, 1, 28),
(29, 2, 47),
(30, 3, 53);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `estudiante_id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `paterno` varchar(30) DEFAULT NULL,
  `materno` varchar(30) DEFAULT NULL,
  `ci` varchar(30) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `tutor` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`estudiante_id`, `nombre`, `paterno`, `materno`, `ci`, `direccion`, `celular`, `tutor`, `fecha_nacimiento`, `edad`) VALUES
(1, 'Sandra', 'Ospina', 'Cuesta', '5212321', 'Zona Pucarani', '72544484', 'Adrian', '1997-06-11', 25),
(2, 'Natalia', 'Fernandez', 'Prado', '4512378', 'Calle Caracol S/N, Zona Chillimarca', '74531284', 'Fabricio', '1999-05-08', 23),
(3, 'Liliana', 'Rosa', 'Portillo', '2154354', 'Calle Calderon', '78465312', 'Lucio', '2000-10-10', 21),
(4, 'Lina', 'Pava', 'Nogales', '4561235', 'Avenida Mariscal Santa Cruz', '79451235', 'Alvarez', '2001-11-17', 20),
(5, 'Ronal', 'Mollericona', 'Miranda', '4531278', 'Zona NorEste PI', '74251235', 'Juan', '1999-01-29', 23),
(6, 'Miguel', 'Delgado', 'Mamani', '8437424', 'Calle Colle', '69815461', 'Nancy', '1997-10-08', 24),
(7, 'Angel', 'Daniela', 'Arenas', '4521875', 'Calle 6 de Junio', '78451245', 'Annette', '2002-11-04', 19),
(8, 'Ariel', 'Pacari', 'Quispe', '5425423', 'tembladerani', '78513248', 'Wilson', '1998-05-02', 24),
(9, 'Ayelen', 'Gilda', 'Gomez', '4578123', 'Zona Cementerio', '75423589', 'Carla', '1999-07-12', 22),
(10, 'Claudio', 'Gaston', 'Choque', '5795132', 'Avenida Buenos Aires', '68452345', 'Nicol', '1998-05-05', 24),
(11, 'Grisel', 'Limachi', 'Morales', '4875123', 'Cruce Villadela', '62452354', 'Luci', '1999-10-12', 22),
(12, 'Adelayda', 'Callisaya', 'Callizaya', '4885551', 'Zona Portada', '77745213', 'Alex', '1998-12-31', 23),
(13, 'Esdras', 'Alfaro', 'Cespedes', '5422348', 'Calle Amor de Dios', '78453215', 'America', '1997-10-05', 24),
(14, 'Brian', 'Caceres', 'Mendoza', '4587521', 'Avenida Alamos', '68452354', 'Alcon', '1998-08-15', 23),
(15, 'Cinthia ', 'Rosales', 'Rojas', '8745421', 'Calle Gregorio', '78542135', 'Danny', '1996-04-19', 26),
(16, 'Efrain', 'Jimenez', 'Ortiz', '8451789', 'Avenida Murillo', '68542314', 'Elvis', '1997-11-13', 24),
(17, 'Elena', 'Mamani', 'Lopez', '2452354', 'Avenida Estructurante', '65421354', 'Emerson', '1995-03-25', 27),
(18, 'Esther', 'Blanco', 'Cabezas', '4531215', 'Avenida Apumalla', '65842344', 'Fernando', '1996-02-14', 26),
(19, 'Froilan', 'Sierra', 'Rios', '4875213', 'Calle Gladiolos', '68451232', 'Fidel', '1998-06-12', 24),
(20, 'Hugo', 'Mendoza', 'Quispe', '7854532', 'Calle Kantutas', '62312458', 'Iver', '1995-07-15', 26);

--
-- Disparadores `estudiantes`
--
DELIMITER $$
CREATE TRIGGER `calcularEdad` BEFORE INSERT ON `estudiantes` FOR EACH ROW BEGIN
	SET NEW.edad = TIMESTAMPDIFF(YEAR,NEW.fecha_nacimiento,CURDATE());
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calcularEdadUpdate` BEFORE UPDATE ON `estudiantes` FOR EACH ROW BEGIN
	SET NEW.edad = TIMESTAMPDIFF(YEAR,NEW.fecha_nacimiento,CURDATE());
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `est_asignacion`
--

CREATE TABLE `est_asignacion` (
  `est_asignacion_id` int(11) NOT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `grado_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `est_asignacion`
--

INSERT INTO `est_asignacion` (`est_asignacion_id`, `estudiante_id`, `grado_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3),
(6, 6, 3),
(7, 7, 4),
(8, 8, 8),
(9, 9, 9),
(10, 10, 1),
(11, 11, 2),
(12, 12, 3),
(13, 13, 4),
(14, 14, 5),
(15, 15, 6),
(16, 16, 7),
(17, 17, 8),
(26, 9, 9),
(27, 10, 1),
(28, 11, 2),
(29, 12, 3),
(30, 13, 4),
(31, 14, 5),
(32, 15, 6),
(33, 16, 7),
(34, 17, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `grado_id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`grado_id`, `nombre`) VALUES
(1, '1 Semestre'),
(2, '2 Semestre'),
(3, '3 Semestre'),
(4, '4 Semestre'),
(5, '5 Semestre'),
(6, '6 Semestre'),
(7, '7 Semestre'),
(8, '8 Semestre'),
(9, '9 Semestre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `materia_id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`materia_id`, `nombre`) VALUES
(1, 'Fisica I'),
(2, 'Algebra I'),
(3, 'Administración General'),
(4, 'Ingles I'),
(5, 'Calculo I'),
(6, 'Programacion I'),
(7, 'Programacion II'),
(8, 'Base de Datos I'),
(9, 'Programacion II'),
(10, 'Probabilitidad y Estadistica'),
(11, 'Calculo II'),
(12, 'Fisica II'),
(13, 'Algebra II'),
(14, 'Ingles II'),
(15, 'Estructura de Datos'),
(16, 'Análisis y Diseño I'),
(17, 'Base de Datos II'),
(18, 'Investigación Operativa I'),
(19, 'Ecuaciones Diferenciales'),
(20, 'Electricidad y Magnetismo'),
(21, 'Ingles III'),
(22, 'Programación III'),
(23, 'Analisis y Diseño II'),
(24, 'Sistemas Operativos'),
(25, 'Electrónica General'),
(26, 'Investigación Operativa II'),
(27, 'Métodos Numericos'),
(28, 'Ingles IV'),
(29, 'Programación Avanzada'),
(30, 'Ingenieria de Sistemas'),
(31, 'Ingenieria de Software I'),
(32, 'Sismteas Operativos Moviles y Embebidos'),
(33, 'Sistema de Comunicaciones'),
(34, 'Sistemas Digitales'),
(35, 'Preparación y Evaluación de Proyectos'),
(36, 'Proyecto Integrador Intermedio I'),
(37, 'Programacion Grafica y Multimedia I'),
(38, 'Ingenieria de Software II'),
(39, 'Programación de Sistemas Embebidos'),
(40, 'Mineria de Datos'),
(41, 'Redes I'),
(42, 'Microprocesadores y Microcontroladores '),
(43, 'Administración de Proyectos'),
(44, 'Proyecto Integrador Intermedio II'),
(45, 'Programación Grafica Multimedia II'),
(46, 'Programación de Dispositivos Moviles'),
(47, 'Inteligencia Artificial'),
(48, 'Testing Quality, Assurance'),
(49, 'Redes II'),
(50, 'Sistemas de Control'),
(51, 'Política y Gerencia Empresarial'),
(52, 'Proyecto Integrador III'),
(53, 'M2 Internet de las Cosas'),
(54, 'M1 Introducción a la Ingenieria Domótica'),
(55, 'Auditoria Informatica'),
(56, 'Seguridad Informática'),
(57, 'Legislación Empresarial'),
(58, 'Dirección y Liderazgo Creativo'),
(59, 'Metodología de la Investigación'),
(60, 'Practica Profesional'),
(61, 'M2 Realidad Aumentada y Virtual'),
(62, 'M2 Administración de Redes IoT'),
(63, 'M2 Big Data'),
(64, 'M2 Inteligencia Artificial en Sistemas Embebidos'),
(65, 'M1 Instrumentación Electrónica'),
(66, 'M1 Eficiencia Enegética'),
(67, 'M1 Instalaciones Domóticas'),
(68, 'M1 Automatización Seguridad y Control'),
(69, 'Taller de Grado'),
(70, 'Proyecto Integrador Final');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mat_grado`
--

CREATE TABLE `mat_grado` (
  `mat_grado_id` int(11) NOT NULL,
  `materia_id` int(11) DEFAULT NULL,
  `grado_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mat_grado`
--

INSERT INTO `mat_grado` (`mat_grado_id`, `materia_id`, `grado_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2),
(11, 11, 2),
(12, 12, 2),
(13, 13, 2),
(14, 14, 2),
(15, 15, 3),
(16, 16, 3),
(17, 17, 3),
(18, 18, 3),
(19, 19, 3),
(20, 20, 3),
(21, 21, 3),
(22, 22, 4),
(23, 23, 4),
(24, 24, 4),
(25, 25, 4),
(26, 26, 4),
(27, 27, 4),
(28, 28, 4),
(29, 29, 5),
(30, 30, 5),
(31, 31, 5),
(32, 32, 5),
(33, 33, 5),
(34, 34, 5),
(35, 35, 5),
(36, 36, 5),
(37, 37, 6),
(38, 38, 6),
(39, 39, 6),
(40, 40, 6),
(41, 41, 6),
(42, 42, 6),
(43, 43, 6),
(44, 44, 6),
(45, 45, 7),
(46, 46, 7),
(47, 47, 7),
(48, 48, 7),
(49, 49, 7),
(50, 50, 7),
(51, 51, 7),
(52, 52, 7),
(53, 53, 8),
(54, 54, 8),
(55, 55, 8),
(56, 56, 8),
(57, 57, 8),
(58, 58, 8),
(59, 59, 8),
(60, 60, 8),
(61, 61, 9),
(62, 62, 9),
(63, 63, 9),
(64, 64, 9),
(65, 65, 9),
(66, 66, 9),
(67, 67, 9),
(68, 68, 9),
(69, 69, 9),
(70, 70, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `nota_id` int(11) NOT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `materia_id` int(11) DEFAULT NULL,
  `primer` int(11) DEFAULT NULL,
  `segundo` int(11) DEFAULT NULL,
  `tercer` int(11) DEFAULT NULL,
  `promedio` int(11) DEFAULT 0,
  `final` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`nota_id`, `estudiante_id`, `materia_id`, `primer`, `segundo`, `tercer`, `promedio`, `final`) VALUES
(1, 1, 1, 50, 60, 40, 50, 'Medio');

--
-- Disparadores `notas`
--
DELIMITER $$
CREATE TRIGGER `insertNota` BEFORE INSERT ON `notas` FOR EACH ROW BEGIN
	SET NEW.segundo = 0;
	SET NEW.tercer  = 0;
	SET NEW.promedio = 0;
	SET NEW.final = 0;
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateNotaSegundo` BEFORE UPDATE ON `notas` FOR EACH ROW BEGIN
   IF OLD.primer = '' AND OLD.primer = 0 THEN
			SET NEW.segundo = 0;
	 END IF;
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateNotaTercera` BEFORE UPDATE ON `notas` FOR EACH ROW BEGIN
   IF OLD.primer = '' AND OLD.primer = 0 AND OLD.segundo = '' AND OLD.segundo = 0 THEN
			SET NEW.tercer = 0;
	 ELSE
			SET NEW.promedio = (NEW.primer + NEW.segundo + NEW.tercer)/3;
			IF NEW.promedio > 0 AND NEW.promedio < 40 THEN
				SET NEW.final = 'Bajo';
			END IF;
			IF NEW.promedio > 39 AND NEW.promedio < 70 THEN
				SET NEW.final = 'Medio';
			END IF;
			IF NEW.promedio > 69 AND NEW.promedio < 90 THEN
				SET NEW.final = 'Intermedio';
			END IF;
			IF NEW.promedio > 89 THEN
				SET NEW.final = 'Excelente';
			END IF;

	 END IF;
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `paterno` varchar(30) DEFAULT NULL,
  `materno` varchar(30) DEFAULT NULL,
  `ci` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura para la vista `detalle_estudiante`
--
DROP TABLE IF EXISTS `detalle_estudiante`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalle_estudiante`  AS SELECT concat(`e`.`nombre`,' ',`e`.`paterno`,' ',`e`.`materno`) AS `estudiante`, `e`.`ci` AS `ci`, `e`.`edad` AS `edad`, `g`.`nombre` AS `semestre`, `m`.`nombre` AS `materia`, concat(`d`.`nombre`,' ',`d`.`paterno`,' ',`d`.`materno`) AS `docente` FROM ((((((`estudiantes` `e` join `est_asignacion` `ea` on(`ea`.`estudiante_id` = `e`.`estudiante_id`)) join `grados` `g` on(`g`.`grado_id` = `ea`.`grado_id`)) join `mat_grado` `mg` on(`mg`.`grado_id` = `g`.`grado_id`)) join `materias` `m` on(`m`.`materia_id` = `mg`.`materia_id`)) join `doc_asignacion` `da` on(`da`.`materia_id` = `m`.`materia_id`)) join `docentes` `d` on(`d`.`docente_id` = `da`.`docente_id`)) WHERE `e`.`estudiante_id` = 11  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`docente_id`);

--
-- Indices de la tabla `doc_asignacion`
--
ALTER TABLE `doc_asignacion`
  ADD PRIMARY KEY (`doc_asignacion_id`),
  ADD KEY `docente_id` (`docente_id`),
  ADD KEY `materia_id` (`materia_id`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`estudiante_id`);

--
-- Indices de la tabla `est_asignacion`
--
ALTER TABLE `est_asignacion`
  ADD PRIMARY KEY (`est_asignacion_id`),
  ADD KEY `estudiante_id` (`estudiante_id`),
  ADD KEY `grado_id` (`grado_id`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`grado_id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`materia_id`);

--
-- Indices de la tabla `mat_grado`
--
ALTER TABLE `mat_grado`
  ADD PRIMARY KEY (`mat_grado_id`),
  ADD KEY `materia_id` (`materia_id`),
  ADD KEY `grado_id` (`grado_id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`nota_id`),
  ADD KEY `estudiante_id` (`estudiante_id`),
  ADD KEY `materia_id` (`materia_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `docente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `doc_asignacion`
--
ALTER TABLE `doc_asignacion`
  MODIFY `doc_asignacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `estudiante_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `est_asignacion`
--
ALTER TABLE `est_asignacion`
  MODIFY `est_asignacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `grado_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `materia_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `mat_grado`
--
ALTER TABLE `mat_grado`
  MODIFY `mat_grado_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `nota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `doc_asignacion`
--
ALTER TABLE `doc_asignacion`
  ADD CONSTRAINT `doc_asignacion_ibfk_1` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`docente_id`),
  ADD CONSTRAINT `doc_asignacion_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`materia_id`);

--
-- Filtros para la tabla `est_asignacion`
--
ALTER TABLE `est_asignacion`
  ADD CONSTRAINT `est_asignacion_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`estudiante_id`),
  ADD CONSTRAINT `est_asignacion_ibfk_2` FOREIGN KEY (`grado_id`) REFERENCES `grados` (`grado_id`);

--
-- Filtros para la tabla `mat_grado`
--
ALTER TABLE `mat_grado`
  ADD CONSTRAINT `mat_grado_ibfk_1` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`materia_id`),
  ADD CONSTRAINT `mat_grado_ibfk_2` FOREIGN KEY (`grado_id`) REFERENCES `grados` (`grado_id`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`estudiante_id`),
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`materia_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
