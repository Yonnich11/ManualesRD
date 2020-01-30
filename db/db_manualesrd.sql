-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2020 at 10:01 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_manualesrd`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Manuales_Consulta` (IN `NombreManual` VARCHAR(100))  BEGIN

Select 
manuales_id,
Manual_Titulo,
Manual_Descripcion,
Manual_Autor,
Manual_Fecha_publicacion,
Manual_Numero_Pagina,
Manual_Ruta_URL
From manuales
Where Manual_Titulo  like concat('%', Replace(NombreManual, '','%'), '%') or Manual_Descripcion like concat('%', Replace(NombreManual, '','%'), '%')
or NombreManual = ''
And Manual_Estado = 1;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Manuales_Inactiva` (IN `manual_id` INT)  BEGIN

Update Manuales 
					Set Manual_Estado= 0
                    Where manuales_id = manual_id ;
				
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Manuales_Insertar` (`Manual_Titulo` VARCHAR(50), `Manual_Descripcion` VARCHAR(300), `Manual_Autor` VARCHAR(50), `Manual_Fecha_publicacion` DATETIME, `Manual_Numero_Pagina` INT, `Manual_ISBN` VARCHAR(200), `Manual_Ruta_URL` VARCHAR(100), `Registro_Usuario` INT)  BEGIN
INSERT INTO Manuales
(
Manual_Titulo ,
Manual_Descripcion , 
Manual_Autor ,
Manual_Fecha_publicacion ,
Manual_Numero_Pagina ,
Manual_ISBN ,
Manual_Ruta_URL , 
Registro_Usuario,
Registro_Fecha
)
VALUES
(
Manual_Titulo,
Manual_Descripcion , 
Manual_Autor ,
Manual_Fecha_publicacion ,
Manual_Numero_Pagina ,
Manual_ISBN ,
Manual_Ruta_URL , 
Registro_UsuariO,
Now()
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Manual_Actualizar` (`Manual_ID` INT, `Manual_Titulo` VARCHAR(50), `Manual_Descripcion` VARCHAR(300), `Manual_Autor` VARCHAR(50), `Manual_Fecha_publicacion` DATETIME, `Manual_Numero_Pagina` INT, `Manual_ISBN` VARCHAR(200), `Manual_Ruta_URL` VARCHAR(100), `Registro_Usuario` INT)  BEGIN
Update Manuales 
					Set Manual_Titulo = coalesce(Manual_Titulo,Manual_Titulo) ,
						Manual_Descripcion = coalesce(Manual_Descripcion, Manual_Descripcion) , 
						Manual_Autor = coalesce(Manual_Descripcion, Manual_Descripcion) ,
						Manual_Fecha_publicacion = coalesce(Manual_Fecha_publicacion, Manual_Fecha_publicacion)	 ,
						Manual_Numero_Pagina = coalesce(Manual_Numero_Pagina, Manual_Numero_Pagina) ,
						Manual_ISBN = coalesce( Manual_ISBN, Manual_ISBN) ,
						Manual_Ruta_URL = coalesce(Manual_Ruta_URL, Manual_Ruta_URL ) , 
						Registro_Usuario = coalesce(Registro_Usuario, Registro_Usuario) ,
						Registro_Fecha = now()     
					Where manuales_id = Manual_ID; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Usuario_Insertar` (`Usuario_User` VARCHAR(50), `Usuario_Clave` VARCHAR(50), `Usuario_Nombre` VARCHAR(50), `Usuario_Correo` VARCHAR(50), `Registro_Usuario` VARCHAR(50))  BEGIN
INSERT INTO Usuarios
(
Usuario_User ,
Usuario_Clave ,
Usuario_Nombre, 
Usuario_Correo , 
Registro_Usuario,
Registro_Fecha
)
Values 
(
Usuario_User ,
Usuario_Clave ,
Usuario_Nombre, 
Usuario_Correo , 
Registro_Usuario,
Now()
);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manuales`
--

CREATE TABLE `manuales` (
  `manuales_id` int(11) NOT NULL,
  `Manual_Estado` bit(1) NOT NULL DEFAULT b'1',
  `Manual_Titulo` varchar(200) NOT NULL,
  `Manual_Descripcion` varchar(300) NOT NULL,
  `Manual_Autor` varchar(50) NOT NULL,
  `Manual_Fecha_publicacion` datetime DEFAULT NULL,
  `Manual_Numero_Pagina` int(11) NOT NULL,
  `Manual_ISBN` varchar(100) NOT NULL DEFAULT 'xx-xxx-xxxx-x',
  `Manual_Ruta_URL` varchar(100) NOT NULL,
  `Registro_Usuario` int(11) NOT NULL,
  `Registro_Fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manuales`
--

INSERT INTO `manuales` (`manuales_id`, `Manual_Estado`, `Manual_Titulo`, `Manual_Descripcion`, `Manual_Autor`, `Manual_Fecha_publicacion`, `Manual_Numero_Pagina`, `Manual_ISBN`, `Manual_Ruta_URL`, `Registro_Usuario`, `Registro_Fecha`) VALUES
(2, b'1', 'Manual de C# a Fondo', 'Este manual es una prueba de consulta', 'Helmer', '0202-12-02 00:00:00', 50, '', '', 1, '2020-01-30 12:12:05'),
(3, b'1', 'La Biblia de php', 'Este manual es una prueba de consulta', 'Helmer', '0202-12-02 00:00:00', 50, '\\Desaarrollo', '', 2, '2020-01-30 12:15:56'),
(4, b'1', 'Manual Basico de Java', 'Prueba de Java ', 'Helmer', '0202-12-02 00:00:00', 50, '\\Desaarrollo', '', 2, '2020-01-30 12:16:27'),
(5, b'1', 'Introduccion a la programacion de Java', 'Prueba de Java ', 'Jame Gosling', '0202-12-02 00:00:00', 50, '\\Desaarrollo', '', 1, '2020-01-30 12:18:52'),
(6, b'1', 'Introduccion a la programacion orientada a objeto ', 'Prueba de C# ', 'Bill Gate', '0202-12-02 00:00:00', 50, '\\Desaarrollo', '', 1, '2020-01-30 12:20:06'),
(7, b'1', 'Introduccion a la programacion orientada a objeto con C# ', 'Este manual introduce al estudiante a los conocimiento necesario a la peogramacion', 'Bill Gate', '0202-12-02 00:00:00', 50, '\\Desaarrollo', '', 1, '2020-01-30 12:21:56'),
(8, b'1', 'Libro basico de Javascript ', 'Prueba de Javascript', 'Almarante ', '0202-12-02 00:00:00', 50, '\\Desaarrollo', '', 1, '2020-01-30 12:24:54'),
(9, b'1', 'Python Avanzado ', 'Python', 'Almarante ', '0202-12-02 00:00:00', 50, '\\Desaarrollo', '', 1, '2020-01-30 12:26:18'),
(10, b'1', 'Python basico ', 'Python', 'Happy ', '0202-12-02 00:00:00', 50, '\\Desaarrollo', '', 1, '2020-01-30 12:29:52'),
(11, b'1', 'Perl Avanzado ', 'Curso de Perl', 'Jame de la rosa', '0202-12-02 00:00:00', 50, '\\Desaarrollo', '', 1, '2020-01-30 12:29:52'),
(12, b'1', 'Perl Basico ', 'Python', 'manuale de Perl basico ', '0202-12-02 00:00:00', 50, '\\Desaarrollo', '', 1, '2020-01-30 12:29:52'),
(13, b'1', 'PHP Orientado a objeto ', 'Orientado a objeto con php', 'rasmun ', '0202-12-02 00:00:00', 50, '\\Desaarrollo', '', 1, '2020-01-30 12:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `Usuario_id` int(11) NOT NULL,
  `Usuario_Estado` bit(1) NOT NULL DEFAULT b'1',
  `Usuario_User` varchar(50) NOT NULL,
  `Usuario_Clave` varchar(50) NOT NULL,
  `Usuario_Nombre` varchar(50) NOT NULL,
  `Usuario_Correo` varchar(50) NOT NULL,
  `Registro_Usuario` varchar(50) NOT NULL,
  `Registro_Fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`Usuario_id`, `Usuario_Estado`, `Usuario_User`, `Usuario_Clave`, `Usuario_Nombre`, `Usuario_Correo`, `Registro_Usuario`, `Registro_Fecha`) VALUES
(1, b'1', 'h.salas', '1234', 'Helmer', 'yonnich@gmail.com', 'Helmer salas', '2020-01-30 12:01:00'),
(2, b'1', 'y.salas', '1234', 'Yonnich', 'hys-11@hotmail.com', 'Helmer salas', '2020-01-30 12:01:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `manuales`
--
ALTER TABLE `manuales`
  ADD PRIMARY KEY (`manuales_id`),
  ADD KEY `Registro_Usuario` (`Registro_Usuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `manuales`
--
ALTER TABLE `manuales`
  MODIFY `manuales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `manuales`
--
ALTER TABLE `manuales`
  ADD CONSTRAINT `manuales_ibfk_1` FOREIGN KEY (`Registro_Usuario`) REFERENCES `usuarios` (`Usuario_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
