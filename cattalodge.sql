-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Dec 17. 08:01
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `cattalodge`
--
CREATE DATABASE IF NOT EXISTS `cattalodge` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `cattalodge`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `foglalas`
--

CREATE TABLE `foglalas` (
  `azon` int(11) NOT NULL,
  `vendeg_azon` int(2) DEFAULT NULL,
  `erkezes` date NOT NULL,
  `tavozas` date NOT NULL,
  `ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `foglalas`
--

INSERT INTO `foglalas` (`azon`, `vendeg_azon`, `erkezes`, `tavozas`, `ar`) VALUES
(1, 1, '2024-10-01', '2024-10-07', 45000),
(2, 2, '2024-10-10', '2024-10-17', 45000),
(3, 3, '2024-10-20', '2024-10-27', 45000),
(4, 4, '2024-11-01', '2024-11-07', 45000),
(5, 5, '2024-11-10', '2024-11-17', 45000),
(6, 6, '2024-11-20', '2024-11-27', 45000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vendegek`
--

CREATE TABLE `vendegek` (
  `azon` int(2) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `email` varchar(25) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `cim` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `vendegek`
--

INSERT INTO `vendegek` (`azon`, `nev`, `email`, `telefon`, `cim`) VALUES
(1, 'Erika', 'randomuser56789@gmail.com', '36 30 123 4567', 'Kossuth Lajos utca 12, 1055 Budapest'),
(2, 'Vanessza', 'moonlight.vibes23@gmail.c', '36 20 987 6543', 'Fő utca 45, 6721 Szeged'),
(3, 'Áron', 'quickfox2024@gmail.com', '36 70 555 1234', 'Rákóczi út 72, 1074 Budapest'),
(4, 'Rebeka', 'blue.sparrow91@gmail.com', '36 1 234 5678', 'Jókai utca 8, 4000 Debrecen'),
(5, 'Marci', 'sunnydaydreamer08@gmail.c', '36 20 567 6874', 'Dózsa György út 123, 2132 Göd'),
(6, 'Barnabás', 'cosmicjourney456@gmail.co', '36 30 999 8765', 'Petőfi Sándor utca 56, 9000 Győr');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `foglalas`
--
ALTER TABLE `foglalas`
  ADD PRIMARY KEY (`azon`),
  ADD KEY `vendeg_azon` (`vendeg_azon`);

--
-- A tábla indexei `vendegek`
--
ALTER TABLE `vendegek`
  ADD PRIMARY KEY (`azon`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `foglalas`
--
ALTER TABLE `foglalas`
  MODIFY `azon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `vendegek`
--
ALTER TABLE `vendegek`
  MODIFY `azon` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `foglalas`
--
ALTER TABLE `foglalas`
  ADD CONSTRAINT `foglalas_ibfk_1` FOREIGN KEY (`vendeg_azon`) REFERENCES `vendegek` (`azon`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
