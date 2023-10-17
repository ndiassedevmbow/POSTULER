$server = "localhost";
    $login = "root";
    $bd = "gestFormat";
    $psw = "";

    $bdd = new mysqli($server, $login, $psw, $bd);
    if($bdd->connect_error)
    {
        echo "Erreur : " .$bdd->connect_error;
    }
    else
    {
        $req = "
            CREATE TABLE `choix` (
            `idChoix` int(11) PRIMARY KEY AUTO_INCREMENT,
            `region` varchar(255) NOT NULL,
            `ecole` varchar(255) NOT NULL,
            `description` varchar(255) NOT NULL,
            `argent` varchar(255) NOT NULL,
            `duree` varchar(255) NOT NULL,
            `projet` varchar(255) NOT NULL,
            `idFormat` int(11),
             CONSTRAINT FOREIGN KEY(idFormat) REFERENCES formation(idFormat)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
        ";

        if($bdd->query($req) === true)
        {
            echo "Table cree";
        }
        else
        {
            echo "Error : " .$con->error;
        }
    }


    -- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 13 oct. 2023 à 03:16
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestformat`
--

-- --------------------------------------------------------

--
-- Structure de la table `choix`
--

CREATE TABLE `choix` (
  `idChoix` int(11) NOT NULL,
  `region` varchar(255) NOT NULL,
  `ecole` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `argent` varchar(255) NOT NULL,
  `duree` varchar(255) NOT NULL,
  `projet` varchar(255) NOT NULL,
  `idFormat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `description`
--

CREATE TABLE `description` (
  `idDesc` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `argent` varchar(255) NOT NULL,
  `idFormat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `description`
--

INSERT INTO `description` (`idDesc`, `description`, `argent`, `idFormat`) VALUES
(1, 'Lorem ipsum dolor \r\nsit amet, consectetur adipisicing elit, \r\nsed do eiusmod\r\ntempor incididunt ', '150000', 2);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `idFormat` int(11) NOT NULL,
  `region` varchar(255) NOT NULL,
  `ecole` varchar(255) NOT NULL,
  `format` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`idFormat`, `region`, `ecole`, `format`) VALUES
(1, 'Kaolack', 'ISI KAOLACK', 'Genie Logiciel'),
(2, 'Dakar', 'ISI DAKAR', 'Genie Logiciel'),
(3, 'Kolda', 'ISI DAKAR', 'Genie Informatique'),
(4, 'Fatick', 'ISI DAKAR', 'Reseau'),
(5, 'Kolda', 'ISI KOLDA', 'Develppement web'),
(6, 'Diourbel', 'ISI FATICK', 'Dev Ops'),
(7, 'Sedhiou', 'ISI MBOUR', ' Logiciel');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `choix`
--
ALTER TABLE `choix`
  ADD PRIMARY KEY (`idChoix`),
  ADD KEY `idFormat` (`idFormat`);

--
-- Index pour la table `description`
--
ALTER TABLE `description`
  ADD PRIMARY KEY (`idDesc`),
  ADD KEY `idFormat` (`idFormat`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`idFormat`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `choix`
--
ALTER TABLE `choix`
  MODIFY `idChoix` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `description`
--
ALTER TABLE `description`
  MODIFY `idDesc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `idFormat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `choix`
--
ALTER TABLE `choix`
  ADD CONSTRAINT `choix_ibfk_1` FOREIGN KEY (`idFormat`) REFERENCES `formation` (`idFormat`);

--
-- Contraintes pour la table `description`
--
ALTER TABLE `description`
  ADD CONSTRAINT `description_ibfk_1` FOREIGN KEY (`idFormat`) REFERENCES `formation` (`idFormat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
