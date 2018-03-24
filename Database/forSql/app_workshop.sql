-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Mar 2018, 17:13
-- Wersja serwera: 10.1.31-MariaDB
-- Wersja PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `app_workshop`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role`
--

CREATE TABLE `role` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `role`
--

INSERT INTO `role` (`name`) VALUES
('ADMIN'),
('USER');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `task`
--

CREATE TABLE `task` (
  `id` bigint(20) NOT NULL,
  `date` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `stop_time` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `task`
--

INSERT INTO `task` (`id`, `date`, `description`, `start_time`, `stop_time`, `user_email`) VALUES
(1, '2018-03-24', 'Seperate all keys', '13:00', '15:00', 'lckorone@gmail.com'),
(2, '2018-03-25', 'New task', '02:03', '05:05', 'lckorone@gmail.com'),
(3, '2018-03-27', 'Test', '05:23', '10:15', 'admin@mail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`email`, `name`, `password`) VALUES
('admin@mail.com', 'Admin', '$2a$10$fu5AisjqpoCtSLBrfb.Teu2Sin06WsbH3D8oHyU7QWnkI21ATTcv.'),
('Barszczyk@wp.pl', 'Kamil', '$2a$10$Kot45JaOwVF9zZgpyAf4RuAg/yt1ljvDPp8FwuV7ToK9/9UeUVU5S'),
('Jacek.Krzynowek@op.pl', 'Jacek', '$2a$10$vxMnUc1Q1DFUU0oSmS6/zuvlScXTiT.sV7btWU8KI9gkSdmDSu1PG'),
('Jan.Kowalski@gmail.com', 'Jan', '$2a$10$2qHs6VjT381O/ntf.IY2H.dtdRSGLW029vOiAPEUPNTFKRQH0/.MO'),
('lckorone@gmail.com', 'Lucek', '$2a$10$KVVBk/7.zPRJT8Ynj338AOgSghwzsQOMVgI6zUuGuNuudij6lCNGK'),
('Przyklad@gmail.com', 'Marcin', '$2a$10$rim0uzkwX.MyvRuo594fwOKa5zgyuZhNCNs2WI90ExnHn7lVg.8si');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_roles`
--

CREATE TABLE `user_roles` (
  `user_email` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user_roles`
--

INSERT INTO `user_roles` (`user_email`, `role_name`) VALUES
('lckorone@gmail.com', 'USER'),
('Przyklad@gmail.com', 'USER'),
('Jacek.Krzynowek@op.pl', 'USER'),
('Barszczyk@wp.pl', 'USER'),
('Jan.Kowalski@gmail.com', 'USER'),
('admin@mail.com', 'ADMIN');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKegybiiy48edolpxof9xq44xiy` (`user_email`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Indeksy dla tabeli `user_roles`
--
ALTER TABLE `user_roles`
  ADD KEY `FK53v9b6vwc56nm9llvcdhs8y8f` (`role_name`),
  ADD KEY `FKfinmcawb90mtj05cpco76b963` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `task`
--
ALTER TABLE `task`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FKegybiiy48edolpxof9xq44xiy` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`);

--
-- Ograniczenia dla tabeli `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK53v9b6vwc56nm9llvcdhs8y8f` FOREIGN KEY (`role_name`) REFERENCES `role` (`name`),
  ADD CONSTRAINT `FKfinmcawb90mtj05cpco76b963` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
