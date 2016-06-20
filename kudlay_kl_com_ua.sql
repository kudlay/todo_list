-- phpMyAdmin SQL Dump
-- version 4.6.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 20 2016 г., 18:49
-- Версия сервера: 10.0.25-MariaDB-2.cba
-- Версия PHP: 7.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kudlay_kl_com_ua`
--

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`id`, `name`, `user_id`) VALUES
(14, 'test!', 5),
(2, 'Ñ„Ñ„Ñ„ÑÑ„Ñ‹Ñ', 2),
(4, 'Ð¹Ð¹Ð¹', 3),
(5, 'Project vbcvb', 4),
(12, 'dfgdfgdfg', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `session_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `hash`, `session_time`, `user_id`) VALUES
(1, '947ff353606501d7040efe2690b71462', '2016-03-24 11:46:09', 1),
(2, 'c31b3ccfbc62f8c4a29a2c872b3a4665', '2016-03-24 11:46:59', 1),
(3, '76f44308ca9b01fafddfc9a9e8cc94f0', '2016-03-24 11:48:53', 2),
(4, 'ddf2a09d418cd66fa9007b69baccfe75', '2016-03-24 11:53:31', 1),
(5, '4b4573cfd56a60f4cdfcd2900a901c7e', '2016-03-24 12:11:25', 2),
(6, '7495129af8414fa12cecf39b3d46fc36', '2016-03-24 12:42:35', 1),
(7, '5d7ac5eac41596b3d01aca5b243cd5c6', '2016-03-24 12:44:27', 3),
(8, '1126e45328702da7294adb5b9a6ad183', '2016-03-24 12:45:34', 2),
(9, 'f4b27f1ff06a0d447a336b8f6fcf0c28', '2016-03-24 13:29:32', 4),
(10, '964e5f7bdd65bf8df24546c9ccb08f5c', '2016-03-24 13:31:47', 4),
(11, '7882ad8a090e694e8d073ed24376302a', '2016-03-24 13:57:15', 1),
(12, '762b67ac0e7b6f6b6d63701d4cd81dac', '2016-03-24 13:59:31', 4),
(13, '09d91fa5e780c55004745b002a3fc784', '2016-03-24 14:00:38', 1),
(14, 'eac8497c0c8da0fd30bbf422c3a95b3c', '2016-03-24 14:00:54', 1),
(15, 'd97c93e80203e68c281399bfe0b1e137', '2016-03-24 14:01:26', 1),
(16, '9827277bebd0ddee3c8a44c7f3f90119', '2016-03-24 14:19:15', 1),
(17, '9d6fd5c88128cd2952dd382b988e8c3f', '2016-03-24 14:20:13', 1),
(18, 'be96389b90b6e41bd601bd3bc20e692d', '2016-03-24 14:20:41', 1),
(19, 'be96389b90b6e41bd601bd3bc20e692d', '2016-03-24 14:20:41', 1),
(20, 'be96389b90b6e41bd601bd3bc20e692d', '2016-03-24 14:20:41', 1),
(21, 'cc53105cde99bc1983ea67e4de2f5575', '2016-03-24 14:21:03', 1),
(22, 'cc8dbd0d4abb940c3b81779924a4a0e4', '2016-03-24 14:21:37', 1),
(23, '614b31ca9f5e0a34fdd1c1d0ec17ca70', '2016-03-24 14:44:26', 1),
(24, '4fa7386e07f2f5985363d646f1a784ea', '2016-03-24 14:47:14', 1),
(25, '9b0f32125e764650494e9a73d2827a92', '2016-03-24 15:26:53', 1),
(26, 'bc036ba8ebc280d03ba5a565c8ca8754', '2016-03-24 15:33:09', 4),
(27, 'a196fc983807fd2abeb7e3154f75f902', '2016-03-24 15:34:12', 4),
(28, '7e0a9219c9995e6985b451284a27e7a5', '2016-03-24 15:54:52', 4),
(29, '00e229339d5d03c7dc402bbb6bd85807', '2016-03-24 18:00:05', 1),
(30, '70d9ee627f37e1f3168550e9cc25e69c', '2016-03-24 18:38:39', 4),
(31, 'ba47d380f80818fb94a0dde293b79307', '2016-03-26 18:16:38', 5),
(32, '2552e4d343c368e560eabe0fea0b149f', '2016-03-28 14:04:30', 1),
(33, '2a565520f39841ada7e53fc0ea9ed437', '2016-04-01 11:50:46', 1),
(34, '57411d9c7badf41e7f1d6c4585186456', '2016-06-20 16:21:07', 4),
(35, '6e16ba7972a5cda30509913b8791ac04', '2016-06-20 16:21:33', 4),
(36, '7ad13d25035be14c66176d9b8e005df0', '2016-06-20 17:26:18', 4),
(37, 'fdcc169d5d02578131ab1d5f36b5cb3b', '2016-06-20 17:26:50', 4),
(38, '193336a6430c10e43f8bf2f2a2eb750b', '2016-06-20 18:43:21', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `time` datetime NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `priority`, `status`, `time`, `project_id`) VALUES
(1, 'fhfhgffghgfh', 5, 1, '0000-00-00 00:00:00', 1),
(2, 'gfhfgh', 3, 0, '0000-00-00 00:00:00', 1),
(3, 'fghgfhgf', 1, 1, '0000-00-00 00:00:00', 1),
(4, 'Ñ„Ñ‹Ñ„', 1, 0, '0000-00-00 00:00:00', 2),
(5, 'ÑÑ„Ñ‹Ñ„ÑÑ„Ñ‹Ñ', 2, 0, '0000-00-00 00:00:00', 2),
(6, 'bfdbfdb', 1, 0, '0000-00-00 00:00:00', 3),
(7, 'Ð¹Ð¹Ð¹', 1, 0, '0000-00-00 00:00:00', 4),
(8, 'task 1', 2, 1, '0000-00-00 00:00:00', 5),
(17, 'vvcv', 3, 0, '0000-00-00 00:00:00', 3),
(16, 'dsfdsf', 1, 0, '0000-00-00 00:00:00', 7),
(14, 'task', 4, 1, '0000-00-00 00:00:00', 6),
(13, 'task 2 2', 1, 0, '0000-00-00 00:00:00', 5),
(18, 'vcbcvb', 4, 1, '0000-00-00 00:00:00', 3),
(19, 'vbvcb', 2, 1, '0000-00-00 00:00:00', 3),
(20, 'cvbvcbv', 5, 0, '0000-00-00 00:00:00', 3),
(21, 'fbfgfd', 4, 0, '0000-00-00 00:00:00', 1),
(22, 'fbfgfd', 6, 1, '0000-00-00 00:00:00', 1),
(23, 'fgfdg', 2, 0, '0000-00-00 00:00:00', 1),
(24, 'fbcbv', 1, 0, '0000-00-00 00:00:00', 8),
(25, 'vcnvcnvcbvcvvcncvn', 1, 0, '0000-00-00 00:00:00', 9),
(26, 'dfsdfsdf', 2, 0, '0000-00-00 00:00:00', 6),
(27, 'sdfsdfsdf', 1, 0, '0000-00-00 00:00:00', 6),
(28, 'sdfsdfsdf', 3, 1, '0000-00-00 00:00:00', 6),
(34, 'test', 1, 0, '0000-00-00 00:00:00', 13),
(31, 'vncvn', 1, 0, '0000-00-00 00:00:00', 11),
(32, 'fdgdfg', 2, 0, '0000-00-00 00:00:00', 12),
(33, 'fgdfg', 1, 0, '0000-00-00 00:00:00', 12),
(35, 'One more task', 2, 0, '0000-00-00 00:00:00', 14),
(36, 'Mikl', 1, 0, '0000-00-00 00:00:00', 14),
(37, 'ÐºÐµÑ€ÐºÐµÑ€', 1, 0, '0000-00-00 00:00:00', 15),
(39, 'fgfg', 1, 0, '0000-00-00 00:00:00', 16),
(40, 'fbfdb', 1, 0, '0000-00-00 00:00:00', 17),
(41, 'rytry', 2, 0, '0000-00-00 00:00:00', 18),
(42, 'ryry', 1, 0, '0000-00-00 00:00:00', 18),
(43, 'ryry', 3, 0, '0000-00-00 00:00:00', 18);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'kudlay', 'a242194bd3e73a473800d6174ae40899'),
(2, 'vas@vas.vas', '202cb962ac59075b964b07152d234b70'),
(3, 'vas@vas.va', 'b0baee9d279d34fa1dfd71aadb908c3f'),
(4, 'ann', '202cb962ac59075b964b07152d234b70'),
(5, 'sparrow', '1bbd886460827015e5d605ed44252251');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
