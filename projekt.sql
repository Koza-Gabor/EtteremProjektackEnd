-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Ápr 17. 16:08
-- Kiszolgáló verziója: 10.4.17-MariaDB
-- PHP verzió: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `projekt`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `asztalok`
--

CREATE TABLE `asztalok` (
  `id` int(11) NOT NULL,
  `allapot` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `asztalok`
--

INSERT INTO `asztalok` (`id`, `allapot`) VALUES
(1, 0),
(2, 1),
(3, 2),
(4, 3),
(5, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `etlap`
--

CREATE TABLE `etlap` (
  `id` int(11) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `osszetetel` varchar(255) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `alergia` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `price` mediumint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `etlap`
--

INSERT INTO `etlap` (`id`, `category`, `name`, `osszetetel`, `alergia`, `price`) VALUES
(1, 'Előétel', 'Tatar beefsteak', '30 dkg marhabélszín; 1 tk mustár; fél darab hagyma (apróra vágott); 1 tk Ketchup; 1 darab tojássárgája; ízlés szerint bors (frissen őrölt); ízlés szerint só', 'Tojás', 2500),
(2, 'Előétel', 'Rántott Camembert Áfonya szósszal', 'Liszt; tojás; zsemlemorzsa; camembert sajt; áfonya öntet(áfonya; barna cukor; hideg víz; keményítő)', 'Tojás', 2250),
(3, 'Leves', 'Hús leves', 'Só, bors, fokhagyma, vöröshagyma, petrezselyem, sárgarépa, fehérrépa, zellergumó,karalábé, kelkáposzta, hús(tyúk, sertés, marha stb...)', 'Nincs', 750),
(5, 'Főétel', 'Rántott hús rizzsel', 'Sertés hús, liszt, tojás, zsemlemorzsa, rizs', 'Tojás', 1850),
(6, 'Főétel', 'Krumpli főzelék', 'Burgonya, babérlevél, só, zsiradék, liszt, tejföl', 'Laktoz', 1500),
(7, 'Saláta', 'Görög saláta', 'Paradicsom, kígyó uborka, lila hagyma, olíva bogyó, fetasajt,oregano', 'Paradicsom, laktóz', 1650),
(8, 'Saláta', 'Paradicsom saláta', 'Paradicsom, lila hagyma, víz, cukor, ecet, só', 'Paradicsom', 780),
(9, 'Desszert', 'Tiramisu', 'Tejszín, mascarpone, cukor, amaretto, kávé, babapiskóta', 'Laktóz', 1000),
(10, 'Desszert', 'Meggyes piskóta', 'Tojás, cukor, só, vaj, meggy', 'Tojás, Laktóz', 1250),
(11, 'Ital', 'Ásvány víz', '', '', 500),
(12, 'Ital', 'Egri bikavér', 'Szöllő', '', 450),
(13, 'Előétel2', 'Tatar beefsteak', '30 dkg marhabélszín; 1 tk mustár; fél darab hagyma (apróra vágott); 1 tk Ketchup; 1 darab tojássárgája; ízlés szerint bors (frissen őrölt); ízlés szerint só', 'Tojás', 2500),
(15, 'Előétel 3', 'Tatar beefsteak', '30 dkg marhabélszín; 1 tk mustár; fél darab hagyma (apróra vágott); 1 tk Ketchup; 1 darab tojássárgája; ízlés szerint bors (frissen őrölt); ízlés szerint só', 'Tojás', 2500);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `id` smallint(11) UNSIGNED NOT NULL,
  `nev` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `kod` varchar(16) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `jog` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `nev`, `kod`, `jog`) VALUES
(1, 'admin', '1234', 'admin'),
(2, 'Sanyi', '4321', 'user'),
(3, 'Gábor', '8850', 'user'),
(4, 'Dóri', '9950', 'user'),
(5, 'Fruzsina', '0000', 'user');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar`
--

CREATE TABLE `kosar` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `osszetetel` varchar(255) NOT NULL,
  `alergia` varchar(255) NOT NULL,
  `price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `kosar`
--

INSERT INTO `kosar` (`id`, `category`, `name`, `osszetetel`, `alergia`, `price`) VALUES
(1, 'Előétel2', 'Tatar beefsteak', '30 dkg marhabélszín; 1 tk mustár; fél darab hagyma (apróra vágott); 1 tk Ketchup; 1 darab tojássárgája; ízlés szerint bors (frissen őrölt); ízlés szerint só', 'Tojás', 2500);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szekek`
--

CREATE TABLE `szekek` (
  `id` int(11) NOT NULL,
  `asztal_id` int(11) NOT NULL,
  `allapot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `szekek`
--

INSERT INTO `szekek` (`id`, `asztal_id`, `allapot`) VALUES
(0, 0, 1),
(1, 1, 1),
(2, 1, 0),
(3, 2, 1),
(4, 2, 0),
(5, 3, 0),
(6, 3, 1),
(7, 4, 1),
(8, 4, 0),
(9, 5, 0),
(10, 5, 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `asztalok`
--
ALTER TABLE `asztalok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `etlap`
--
ALTER TABLE `etlap`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `kosar`
--
ALTER TABLE `kosar`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `szekek`
--
ALTER TABLE `szekek`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `asztalok`
--
ALTER TABLE `asztalok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `etlap`
--
ALTER TABLE `etlap`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `id` smallint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `kosar`
--
ALTER TABLE `kosar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
