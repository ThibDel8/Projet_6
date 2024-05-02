-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : jeu. 02 mai 2024 à 07:27
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `snowtricks`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `figure_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `commentaire` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `figure`
--

CREATE TABLE `figure` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `nom` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `groupe` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_maj` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `figure`
--

INSERT INTO `figure` (`id`, `user_id`, `nom`, `description`, `groupe`, `date_maj`, `date_creation`, `slug`) VALUES
(201, 29, 'Le Weddle', 'Maîtriser Le Weddle (anciennement Mute Grab) en Snowboard : Guide pour Débutants\r\n\r\nSi vous cherchez à ajouter un peu de style à votre répertoire de tricks en snowboard, alors apprendre la figure \"Mute\" est un excellent choix. Cette figure, qui tire son nom du premier rider à l\'avoir réalisée, est à la fois classique et élégante. Dans ce guide, nous allons vous expliquer étape par étape comment exécuter cette figure emblématique.\r\n\r\nQu\'est-ce que la Figure Mute ?\r\n\r\nLa figure \"Mute\" est une trick de snowboard où le rider saisit la carre frontside de sa planche entre les deux pieds avec sa main avant, tandis que sa jambe arrière est tendue derrière lui. Cette position donne au rider un look stylé et ajoute une dose de créativité à sa descente.\r\n\r\nÉtapes pour Réaliser la Figure Mute :\r\n\r\nChoisissez votre Terrain : Trouvez une piste ou un parc à neige adapté à votre niveau de compétence et à la pratique des tricks. Assurez-vous que le terrain est suffisamment large et dégagé pour vous permettre d\'exécuter la figure en toute sécurité.\r\nVitesse et Équilibre : Prenez de la vitesse tout en gardant une bonne maîtrise de votre équilibre. La vitesse vous aidera à maintenir votre trajectoire pendant que vous effectuez la figure.\r\nPositionnement : Approchez la zone où vous souhaitez exécuter la figure \"Mute\". Fléchissez légèrement les genoux pour maintenir une position stable et prête à sauter.\r\nSaut et Saisie : Au moment de votre saut, dirigez votre regard vers le spot où vous souhaitez saisir la carre frontside de votre planche. À ce moment, pliez légèrement votre genou avant pour faciliter la saisie.\r\nSaisie Mute : Une fois en l\'air, pliez votre genou avant et saisissez la carre frontside de votre planche entre vos pieds avec votre main avant. Assurez-vous de saisir fermement la planche pour maintenir le contrôle.\r\nMaintien et Style : Tenez la position \"Mute\" pendant quelques instants pour ajouter du style à votre trick. Gardez votre regard fixé sur votre point d\'atterrissage pour assurer une réception en douceur.\r\nAtterrissage : Anticipez votre atterrissage en fléchissant légèrement vos genoux pour amortir le choc. Assurez-vous de garder votre poids centré sur votre planche pour éviter de tomber en arrière ou en avant.\r\nÉquilibre et Stabilité : Une fois atterri, maintenez votre équilibre et continuez votre descente en toute fluidité.\r\nConseils Utiles :\r\n\r\nCommencez par pratiquer la figure \"Mute\" sur des sauts de petite à moyenne taille avant de passer à des sauts plus grands.\r\nGardez vos mouvements fluides et contrôlés pour une exécution plus propre de la figure.\r\nN\'oubliez pas de porter un équipement de protection adéquat, notamment un casque et des protections pour les articulations.\r\nEn suivant ces étapes simples et en pratiquant régulièrement, vous serez bientôt en mesure de maîtriser la figure \"Mute\" avec style et assurance. Alors, enfilez votre équipement, dirigez-vous vers les pistes et commencez à impressionner vos amis avec ce trick emblématique !', 'Grabs', '2024-05-01 11:39:14', '2024-04-27 10:23:33', 'le-weddle'),
(203, 29, 'Le Indy', 'Comment réaliser la figure Le Indy en snowboard\r\n\r\nSi vous êtes passionné de snowboard et que vous cherchez à ajouter un peu de style à votre répertoire de tricks, alors la figure Le Indy est un incontournable. Cette figure classique est à la fois élégante et impressionnante, et une fois que vous maîtrisez les fondamentaux, vous pourrez l\'ajouter à votre arsenal de tricks avec aisance. Dans cet article, nous allons vous guider étape par étape pour apprendre à réaliser la figure Le Indy comme un pro.\r\n\r\nQu\'est-ce que la figure Le Indy ?\r\n\r\nLe Indy est une figure de base en snowboard qui implique un grab avec la main arrière de la planche entre les fixations, tout en étendant la jambe avant. Cette position caractéristique donne à la figure son nom distinctif. Le Indy peut être réalisé sur divers types de sauts et de modules, ce qui en fait une figure polyvalente et appréciée des snowboarders de tous niveaux.\r\n\r\nÉtapes pour réaliser la figure Le Indy :\r\n\r\nChoisissez votre ligne de saut : Avant de tenter la figure Le Indy, choisissez une ligne de saut appropriée sur la piste ou dans le snowpark. Assurez-vous que la taille du saut correspond à votre niveau de compétence et à votre confort.\r\nPrenez de la vitesse et fléchissez vos genoux : Approchez le saut avec une vitesse constante et fléchissez légèrement vos genoux pour absorber les irrégularités de la piste.\r\nPréparez-vous pour le saut : Juste avant d\'atteindre le kicker, pliez vos genoux un peu plus et gardez votre poids centré sur votre planche.\r\nLe moment du saut : Lorsque vous atteignez le lip du saut, poussez avec vos jambes pour prendre de la hauteur. Au moment où vous décollez, pliez votre jambe avant et étendez votre jambe arrière.\r\nLe grab : Une fois en l\'air, inclinez votre torse vers l\'avant et pliez votre dos pour attraper votre planche entre les fixations avec votre main arrière. Essayez d\'attraper le côté de la planche près de votre pied arrière.\r\nMaintien du grab : Tenez fermement la planche tout en gardant votre corps stable et équilibré en l\'air. Gardez les yeux sur votre atterrissage pour une meilleure orientation.\r\nLa réception : Lorsque vous approchez de la réception, relâchez doucement le grab et préparez-vous à fléchir vos genoux pour absorber le choc de l\'atterrissage.\r\nL\'atterrissage : Une fois que vous avez touché le sol, fléchissez vos genoux pour amortir le choc et gardez votre poids centré sur votre planche. Faites une descente contrôlée pour éviter toute chute.\r\nConseils pour réussir :\r\n\r\nCommencez par pratiquer la figure Le Indy sur des sauts de petite à moyenne taille avant de passer à des obstacles plus grands.\r\nConcentrez-vous sur le timing du grab pour attraper la planche au bon moment.\r\nGardez votre regard fixé sur l\'endroit où vous voulez atterrir pour maintenir votre équilibre.\r\nSoyez patient et persévérez. Comme pour toute nouvelle figure, la pratique régulière est la clé du succès.\r\nEn conclusion, la figure Le Indy est un ajout amusant et stylé à votre répertoire de snowboard. Avec de la pratique et de la persévérance, vous serez en train de maîtriser cette figure emblématique en un rien de temps. Alors, sortez sur les pistes, entraînez-vous et impressionnez vos amis avec votre nouveau trick Le Indy !', 'Grabs', NULL, '2024-04-27 10:59:40', 'le-indy'),
(205, 29, 'Rotation 360', 'Maîtriser le 360 en Snowboard : Un Guide pour Débutants\r\n\r\nLe 360 en snowboard est l\'une des figures les plus emblématiques et gratifiantes à réaliser sur les pistes enneigées. Bien que cela puisse sembler intimidant au premier abord, avec un peu de pratique et les bonnes techniques, vous serez en mesure de maîtriser cette figure et d\'impressionner vos amis sur les pistes. Dans cet article, nous allons vous guider à travers les étapes essentielles pour réussir un 360 en snowboard.\r\n\r\nÉtape 1 : Choisissez une Piste Adaptée\r\n\r\nAvant de vous lancer dans la réalisation d\'un 360, assurez-vous de choisir une piste appropriée. Optez pour une piste bien préparée et peu fréquentée, de préférence avec une bonne couverture de neige. Assurez-vous également que la pente est suffisamment douce pour éviter les chutes brutales.\r\n\r\nÉtape 2 : Maîtrisez les Fondamentaux\r\n\r\nAvant de tenter un 360, assurez-vous de bien maîtriser les techniques de base du snowboard, telles que le virage, le carving et l\'équilibre. Une bonne maîtrise de ces compétences vous aidera à exécuter le 360 avec plus de facilité et de fluidité.\r\n\r\nÉtape 3 : Visualisez la Figure\r\n\r\nAvant de vous lancer, visualisez mentalement la figure. Imaginez-vous effectuer un tour complet dans les airs, en gardant votre corps centré et équilibré. Visualiser la figure vous aidera à vous préparer mentalement et à anticiper chaque mouvement.\r\n\r\nÉtape 4 : Abordez la Piste avec Confiance\r\n\r\nLorsque vous êtes prêt à tenter le 360, abordez la piste avec confiance. Assurez-vous d\'avoir une bonne vitesse et une position stable sur votre planche. Gardez votre regard fixé sur le point où vous souhaitez atterrir.\r\n\r\nÉtape 5 : Engagez le Mouvement\r\n\r\nAu moment de lancer le 360, fléchissez vos genoux et engagez votre rotation en pivotant votre corps dans le sens de la figure. Utilisez vos épaules et vos bras pour aider à amorcer la rotation tout en gardant votre centre de gravité bas et centré sur votre planche.\r\n\r\nÉtape 6 : Gardez le Contrôle\r\n\r\nPendant la rotation, gardez vos bras et vos jambes serrés pour maintenir une rotation stable et contrôlée. Assurez-vous de rester concentré et de garder votre regard fixé sur votre point de réception.\r\n\r\nÉtape 7 : Atterrissez en Douceur\r\n\r\nAu moment de l\'atterrissage, préparez-vous à absorber le choc en fléchissant vos genoux. Cherchez à atterrir avec douceur et en gardant le contrôle de votre planche. Une fois que vous avez touché le sol, redressez-vous et poursuivez votre descente avec confiance.\r\n\r\nEn suivant ces étapes et en pratiquant régulièrement, vous serez en mesure de maîtriser le 360 en snowboard et d\'ajouter une nouvelle dimension de style à votre répertoire de tricks. Alors, enfilez votre équipement, lancez-vous sur les pistes et préparez-vous à repousser vos limites avec cette figure emblématique !', 'Rotations', '2024-04-27 16:40:28', '2024-04-27 11:05:03', 'rotation-360'),
(206, 29, 'Rotation 180', 'Maîtriser le 180 en Snowboard : Guide pas à pas pour Débutants\r\n\r\nSi vous êtes passionné par le snowboard, vous avez sûrement déjà été impressionné par les riders exécutant des figures spectaculaires sur les pistes. Parmi ces figures, le 180 est l\'une des premières que vous devriez maîtriser en tant que débutant. Dans cet article, nous allons vous guider étape par étape pour réaliser cette figure emblématique.\r\n\r\nQu\'est-ce que le 180 ?\r\n\r\nLe 180, aussi appelé \"half cab\", est une rotation à mi-air sur votre snowboard, où vous tournez votre corps de 180 degrés dans le sens opposé de votre direction de départ. C\'est une figure de base, mais essentielle, qui vous permettra de progresser vers des tricks plus avancés.\r\n\r\nÉtape 1 : Positionnement\r\n\r\nCommencez par choisir une piste avec une zone plate et dégagée pour pratiquer en toute sécurité. Avant de vous lancer, assurez-vous d\'avoir une bonne maîtrise de votre équilibre sur votre snowboard.\r\n\r\nÉtape 2 : Vitesse et Élan\r\n\r\nPrenez de la vitesse en descendant la piste, mais ne soyez pas trop rapide. Un bon équilibre entre vitesse et contrôle est essentiel. Fléchissez légèrement les genoux et gardez votre poids centré sur votre planche.\r\n\r\nÉtape 3 : Initiation du 180\r\n\r\nEn approchant du point où vous souhaitez effectuer le 180, commencez à tourner votre corps dans la direction opposée à celle de votre mouvement. Utilisez vos épaules pour amorcer la rotation, tout en gardant votre regard fixé sur le point où vous voulez atterrir.\r\n\r\nÉtape 4 : Rotation\r\n\r\nUne fois que vous avez amorcé la rotation avec vos épaules, utilisez votre poids et vos jambes pour faire tourner votre snowboard. Gardez vos bras tendus et équilibrés pour maintenir votre position.\r\n\r\nÉtape 5 : Atterrissage\r\n\r\nAnticipez le moment où votre snowboard atteindra la position de 180 degrés et préparez-vous à l\'atterrissage. Fléchissez vos genoux pour absorber le choc et maintenir votre équilibre en douceur.\r\n\r\nÉtape 6 : Stabilité et Fin de la Figure\r\n\r\nUne fois que vous avez atterri, stabilisez-vous en gardant votre poids centré sur votre planche. Assurez-vous de bien contrôler votre vitesse et votre direction avant de continuer votre descente.\r\n\r\nConseils Importants :\r\n\r\nCommencez par des rotations de 90 degrés avant de passer au 180 complet.\r\nGardez toujours votre regard fixé sur votre destination.\r\nEntraînez-vous régulièrement pour améliorer votre technique et votre confiance.\r\nEn conclusion, le 180 en snowboard est une figure passionnante qui peut sembler intimidante au début, mais avec de la pratique et de la persévérance, vous serez capable de la maîtriser. N\'oubliez pas de rester patient et de vous amuser sur les pistes !', 'Rotations', '2024-04-27 11:23:50', '2024-04-27 11:10:59', 'rotation-180'),
(207, 29, 'Front Flip', 'Comment réaliser un front flip en snowboard\r\n\r\nLe front flip, également connu sous le nom de \"front somersault\", est une figure impressionnante qui demande de la technique et de la confiance sur votre planche. Si vous êtes prêt à relever le défi, voici un guide simple pour vous aider à maîtriser cette figure.\r\n\r\n1. Choisissez la bonne pente\r\n\r\nAvant de vous lancer dans un front flip, assurez-vous de choisir une pente appropriée. Optez pour une pente suffisamment raide pour donner de l\'élan, mais pas trop escarpée pour éviter les chutes brutales.\r\n\r\n2. Maîtrisez la technique du saut\r\n\r\nAvant de tenter un front flip, assurez-vous d\'avoir une bonne maîtrise des sauts de base en snowboard. Pratiquez les sauts droits et les rotations simples pour vous familiariser avec le mouvement.\r\n\r\n3. Visualisez la figure\r\n\r\nAvant de vous lancer, visualisez mentalement la figure. Imaginez-vous exécuter le front flip avec succès, en contrôlant chaque mouvement de votre corps.\r\n\r\n4. Prenez de l\'élan\r\n\r\nCommencez par prendre de l\'élan en descendant la piste. Gardez une vitesse constante et fléchissez légèrement les genoux pour absorber les bosses éventuelles.\r\n\r\n5. Le moment du saut\r\n\r\nLorsque vous êtes prêt à sauter, fléchissez vos jambes pour prendre de l\'élan, puis poussez avec force vers le haut en utilisant vos jambes et vos bras. Le saut doit être puissant et vertical.\r\n\r\n6. Amenez vos genoux vers votre poitrine\r\n\r\nUne fois en l\'air, ramenez vos genoux vers votre poitrine pour commencer la rotation. Gardez vos bras près de votre corps pour conserver une rotation contrôlée.\r\n\r\n7. Effectuez la rotation\r\n\r\nUtilisez votre force abdominale pour effectuer une rotation avant complète. Gardez votre tête et vos épaules alignées avec votre planche pour maintenir une rotation stable.\r\n\r\n8. Aterrissez en douceur\r\n\r\nAnticipez le moment de l\'atterrissage et préparez-vous à fléchir vos genoux pour absorber le choc. Visez à atterrir en douceur sur la partie inférieure de votre planche, en gardant votre poids centré.\r\n\r\n9. Gardez l\'équilibre\r\n\r\nUne fois atterri, maintenez votre équilibre en gardant vos genoux fléchis et en ajustant votre position au besoin. Gardez le contrôle de votre vitesse pour éviter les chutes.\r\n\r\n10. Pratiquez, pratiquez, pratiquez\r\n\r\nComme pour toute figure en snowboard, la clé du succès est la pratique régulière. Ne vous découragez pas en cas de chute, mais utilisez chaque tentative comme une occasion d\'apprendre et de vous améliorer.\r\n\r\nEn suivant ces étapes simples et en pratiquant avec persévérance, vous serez bientôt capable de réaliser des front flips impressionnants sur les pistes de snowboard. N\'oubliez pas de toujours porter un équipement de protection adéquat et de consulter un instructeur si vous avez des questions ou des préoccupations.', 'Flips', NULL, '2024-04-27 11:14:41', 'front-flip'),
(209, 29, 'Back Flip', 'Comment réaliser un backflip en snowboard : Guide étape par étape\r\n\r\nSi vous êtes passionné par le snowboard et que vous aspirez à repousser vos limites sur les pistes, alors apprendre à réaliser un backflip est un objectif qui peut sembler intimidant, mais qui est tout à fait réalisable avec la bonne technique et beaucoup de pratique. Dans cet article, nous allons vous guider à travers les étapes pour réussir cette figure emblématique.\r\n\r\nÉtape 1 : Préparation mentale\r\n\r\nAvant de vous lancer dans l\'air, il est essentiel d\'être mentalement prêt. Visualisez-vous en train d\'exécuter le backflip avec succès, imaginez chaque mouvement et ressentez la confiance en vous-même. La préparation mentale est aussi importante que la technique physique.\r\n\r\nÉtape 2 : Choix de la piste\r\n\r\nTrouvez une piste qui convient à votre niveau de compétence et qui offre un bon espace pour pratiquer en toute sécurité. Assurez-vous qu\'il n\'y a pas d\'obstacles ou de skieurs à proximité qui pourraient interférer avec votre tentative.\r\n\r\nÉtape 3 : Maîtrise de la technique\r\n\r\nVitesse et élan: Prenez de la vitesse sur la piste et trouvez un endroit plat pour vous lancer. Assurez-vous d\'avoir assez de vitesse pour accomplir le backflip, mais évitez d\'être trop rapide, car cela pourrait rendre la figure incontrôlable.\r\nPositionnement du corps: Approchez le saut avec votre corps légèrement penché vers l\'arrière, les genoux fléchis et les épaules alignées avec votre planche. Gardez vos bras près de votre corps pour plus de stabilité.\r\nInitiation du saut: Juste avant d\'atteindre la bosse ou le tremplin, fléchissez vos jambes et engagez votre noyau pour générer de la puissance. Poussez vers le haut avec vos jambes tout en inclinant légèrement votre corps vers l\'arrière.\r\nRotation: Utilisez vos bras pour aider à initier la rotation vers l\'arrière. Gardez votre regard fixé sur le point où vous voulez atterrir et concentrez-vous sur la rotation de votre corps autour de son axe longitudinal.\r\nPositionnement en l\'air: Une fois en l\'air, ramenez vos genoux vers votre poitrine pour accélérer la rotation et vous assurer que votre corps tourne complètement.\r\nÉtape 4 : Atterrissage en douceur\r\n\r\nLorsque vous avez effectué une rotation complète et que vous voyez la piste en dessous de vous, préparez-vous à l\'atterrissage. Étendez vos jambes pour amortir le choc et fléchissez légèrement vos genoux pour absorber l\'impact. Gardez votre corps stable et en équilibre pour éviter de tomber en arrière ou sur le côté.\r\n\r\nÉtape 5 : Pratique et persévérance\r\n\r\nComme pour toute nouvelle compétence en snowboard, la clé du succès est la pratique régulière et la persévérance. Ne vous découragez pas par les chutes ou les moments de frustration. Chaque tentative vous rapproche un peu plus de la maîtrise du backflip.\r\n\r\nEn conclusion, réaliser un backflip en snowboard demande du courage, de la technique et de la confiance en soi. En suivant ces étapes et en restant déterminé, vous pouvez ajouter cette figure spectaculaire à votre répertoire de tricks sur les pistes. Alors, lancez-vous et profitez de l\'adrénaline de voler à l\'envers dans les airs !', 'Flips', NULL, '2024-04-27 11:16:57', 'back-flip'),
(210, 29, 'Corkscrew', 'Maîtriser la figure Corkscrew : Un Guide Étape par Étape\r\n\r\nSi vous cherchez à épater vos amis sur les pistes de snowboard, la figure Corkscrew est un mouvement qui va certainement attirer l\'attention. Avec son mélange de rotation et d\'inversion, le Corkscrew est un incontournable pour tout snowboarder cherchant à repousser ses limites. Dans cet article, nous allons vous guider étape par étape pour maîtriser cette figure impressionnante.\r\n\r\nÉtape 1 : Assurez-vous d\'être prêt\r\n\r\nAvant de vous lancer dans la réalisation du Corkscrew, assurez-vous d\'avoir acquis une certaine expérience en snowboard. Vous devriez être à l\'aise sur les pistes et avoir déjà maîtrisé des figures de base telles que les sauts et les rotations simples.\r\n\r\nÉtape 2 : Choisissez votre terrain\r\n\r\nTrouvez une piste appropriée pour pratiquer le Corkscrew. Recherchez une zone avec une bonne quantité de neige fraîche et une pente suffisante pour obtenir de la vitesse, mais pas trop raide pour compromettre votre équilibre.\r\n\r\nÉtape 3 : La préparation mentale\r\n\r\nLa clé pour réussir le Corkscrew est la confiance et la concentration. Visualisez-vous en train d\'exécuter la figure avec succès et répétez mentalement chaque étape. Gardez votre esprit clair et concentré sur l\'objectif à atteindre.\r\n\r\nÉtape 4 : L\'approche\r\n\r\nCommencez par prendre de la vitesse sur la piste et choisissez votre zone de décollage. Fléchissez légèrement les genoux et gardez votre centre de gravité bas pour maintenir votre équilibre.\r\n\r\nÉtape 5 : L\'envol\r\n\r\nLorsque vous atteignez votre zone de décollage, pliez vos genoux encore plus bas et utilisez votre impulsion pour sauter dans les airs. Concentrez-vous sur le maintien d\'une position stable avec votre corps légèrement incliné vers l\'arrière.\r\n\r\nÉtape 6 : La rotation\r\n\r\nUne fois en l\'air, utilisez vos épaules pour amorcer la rotation. Lancez votre corps dans le sens contraire des aiguilles d\'une montre (ou dans le sens des aiguilles d\'une montre si vous êtes régulier) en gardant votre tête et votre regard fixés sur votre épaule arrière.\r\n\r\nÉtape 7 : L\'inversion\r\n\r\nAu sommet de votre rotation, commencez à basculer votre tête et vos épaules vers le bas pour amorcer l\'inversion. Imaginez-vous en train de regarder par-dessus votre épaule avant d\'étendre vos jambes pour créer une rotation supplémentaire.\r\n\r\nÉtape 8 : L\'atterrissage\r\n\r\nAnticipez votre atterrissage en ramenant lentement votre corps à une position droite. Fléchissez vos genoux pour absorber le choc et maintenir votre équilibre. Essayez de planer en douceur sur la neige pour éviter de tomber en arrière.\r\n\r\nÉtape 9 : La pratique\r\n\r\nLa clé pour maîtriser le Corkscrew est la pratique régulière. Répétez ces étapes encore et encore jusqu\'à ce que vous vous sentiez à l\'aise avec la figure. N\'ayez pas peur d\'expérimenter avec différents angles et variations pour trouver votre propre style.\r\n\r\nConclusion\r\n\r\nLe Corkscrew peut sembler intimidant au début, mais avec de la pratique et de la détermination, vous pouvez le maîtriser avec brio. N\'oubliez pas de rester en sécurité sur les pistes et de porter un équipement de protection approprié à chaque session. Alors allez-y, lancez-vous et impressionnez tout le monde avec vos compétences de snowboarder !', 'Rotations désaxées', NULL, '2024-04-27 11:23:31', 'corkscrew'),
(211, 29, 'Nose Slide', 'Guide pratique pour réaliser un nose slide en snowboard\r\n\r\nLe nose slide est une figure emblématique du snowboard, alliant technique et style. Si vous souhaitez maîtriser cette manoeuvre et impressionner vos amis sur les pistes, suivez ce guide pratique étape par étape.\r\n\r\n1. Comprendre le nose slide :\r\n\r\nLe nose slide est une figure de jibbing où le rider glisse sur le nose (avant) de sa planche le long d\'un rail ou d\'une barre. La clé de cette figure réside dans le maintien de l\'équilibre tout en conservant une bonne vitesse.\r\n\r\n2. Positionnement et approche :\r\n\r\nAvant de vous lancer dans le nose slide, assurez-vous d\'avoir une bonne vitesse et de bien repérer le rail ou la barre sur laquelle vous souhaitez réaliser la figure. Approchez-vous du rail en gardant votre poids centré sur la planche.\r\n\r\n3. Engagement du nose slide :\r\n\r\nPour engager le nose slide, déplacez votre poids sur le nose de la planche en vous penchant légèrement en avant. Gardez vos épaules parallèles au rail pour maintenir votre équilibre.\r\n\r\n4. Glisser en équilibre :\r\n\r\nUne fois engagé, laissez-vous glisser le long du rail en maintenant une pression constante sur le nose de la planche. Fléchissez légèrement les genoux pour absorber les imperfections du rail et ajustez votre équilibre en fonction des mouvements de la planche.\r\n\r\n5. Sortie du nose slide :\r\n\r\nPour sortir du nose slide, transférez votre poids vers l\'arrière de la planche tout en redressant votre corps. Assurez-vous de garder le contrôle de votre vitesse et de votre équilibre jusqu\'à ce que vous ayez complètement quitté le rail.\r\n\r\n6. Conseils supplémentaires :\r\n\r\nCommencez par pratiquer sur des rails ou des barres de faible hauteur pour vous familiariser avec la sensation du nose slide.\r\nGardez votre regard fixé sur le bout du rail pour anticiper les mouvements et ajuster votre équilibre.\r\nSoyez patient et persévérant. Le nose slide demande de la pratique et de la précision pour être maîtrisé.\r\nEn suivant ces étapes et en vous entraînant régulièrement, vous serez en mesure de réaliser des nose slides fluides et stylés sur les pistes de snowboard. N\'oubliez pas de porter votre équipement de protection et de toujours respecter les règles de sécurité sur les pistes. Amusez-vous bien !', 'Slides', NULL, '2024-04-27 11:26:24', 'nose-slide'),
(212, 29, 'Tail Slide', 'Comment réaliser un Tail Slide en snowboard : Guide étape par étape\r\n\r\nVous avez peut-être déjà vu des snowboarders glisser avec aisance le long d\'une rampe ou d\'un rail, réalisant des figures impressionnantes. L\'une de ces figures, le Tail Slide, est un mouvement de base mais néanmoins élégant qui peut ajouter du style à votre répertoire de tricks. Dans cet article, nous allons vous guider étape par étape pour réaliser un Tail Slide en snowboard.\r\n\r\nQu\'est-ce qu\'un Tail Slide ?\r\nUn Tail Slide est une figure de snowboard où le rider glisse le long d\'un rail ou d\'une barre avec la queue de sa planche. Cette figure peut être effectuée sur des rails, des boxes ou d\'autres obstacles similaires dans un snowpark.\r\n\r\nÉtapes pour réaliser un Tail Slide :\r\nChoisissez votre rail : Avant de commencer, repérez un rail ou une barre appropriée dans le snowpark. Recherchez une surface lisse et droite pour faciliter votre glisse.\r\nApprochez-vous avec vitesse : Prenez de la vitesse en abordant le rail. Vous aurez besoin d\'une vitesse suffisante pour maintenir votre équilibre tout au long de la figure.\r\nPositionnement : Avant d\'atteindre le rail, assurez-vous d\'être centré sur votre planche avec les genoux légèrement fléchis pour absorber les imperfections de la piste.\r\nEngagez le Tail Slide : Lorsque vous atteignez le rail, tournez légèrement votre corps pour que la queue de votre planche entre en contact avec la surface du rail. Gardez votre poids centré sur la planche avec une légère inclinaison vers l\'arrière.\r\nMaintien de l\'équilibre : Concentrez-vous sur le maintien de votre équilibre tout au long du slide. Utilisez vos bras pour garder votre corps stable et ajustez votre poids si nécessaire pour rester au centre du rail.\r\nSortie en douceur : Lorsque vous atteignez la fin du rail, relâchez le Tail Slide en ramenant doucement votre planche à sa position normale. Fléchissez légèrement vos genoux pour amortir la sortie et poursuivez votre descente en toute fluidité.\r\nConseils supplémentaires :\r\nCommencez par des rails ou des boxes de taille modérée pour vous familiariser avec la technique du Tail Slide.\r\nGardez votre regard fixé vers l\'extrémité du rail pour anticiper les mouvements et maintenir votre trajectoire.\r\nEntraînez-vous régulièrement pour améliorer votre équilibre et votre coordination.\r\nEn suivant ces étapes simples et en pratiquant régulièrement, vous pourrez maîtriser l\'art du Tail Slide et impressionner vos amis sur les pistes de snowboard. N\'oubliez pas de toujours porter un équipement de protection approprié et de respecter les règles de sécurité du snowpark. Amusez-vous bien et ridez en toute sécurité !', 'Slides', NULL, '2024-04-27 11:28:04', 'tail-slide'),
(213, 29, 'Backside Air', 'Maîtriser le Backside Air : Le Guide Complet pour Dompter les Cieux\r\n\r\nLe Backside Air est l\'une des figures les plus emblématiques du snowboard, une véritable démonstration de style et de technique qui impressionne sur les pistes et dans les snowparks du monde entier. Si vous avez déjà rêvé de voler au-dessus des obstacles avec grâce et élégance, alors le Backside Air est la figure qu\'il vous faut maîtriser. Dans cet article, nous allons vous guider à travers les étapes pour réaliser cette manœuvre avec confiance et panache.\r\n\r\nQu\'est-ce que le Backside Air ?\r\n\r\nLe Backside Air est une figure de snowboard où le rider saute hors de la rampe, tourne son dos vers la direction de la rotation et attrape la carre arrière de sa planche avec sa main arrière. C\'est une figure impressionnante qui demande à la fois force, équilibre et coordination.\r\n\r\nÉtapes pour Réaliser un Backside Air :\r\n\r\nChoisissez la Rampe Appropriée : Avant de vous lancer dans un Backside Air, assurez-vous d\'avoir trouvé une rampe appropriée dans un snowpark ou sur une piste spécialement conçue pour les sauts.\r\nApprochez avec Vitesse et Confiance : En approchant la rampe, gardez une vitesse constante et une posture solide. Fléchissez légèrement les genoux pour absorber les chocs.\r\nPrenez de l\'Élan : Juste avant d\'atteindre la lèvre de la rampe, fléchissez vos jambes et pliez votre corps vers le bas pour vous préparer au saut.\r\nEngagez le Backside Air : Au moment où vous atteignez le sommet de la rampe, tournez votre épaule arrière vers la direction de la rotation (habituellement vers le bas de la pente) et commencez à pivoter votre corps dans cette direction.\r\nAttrapez la Carre Arrière : Une fois que vous avez commencé votre rotation, tendez votre main arrière vers la carre arrière de votre planche. Essayez d\'attraper la carre avec votre main pour un style maximal.\r\nMaintenez l\'Équilibre : Gardez votre regard fixé sur le point d\'atterrissage tout en maintenant une position stable dans les airs. Utilisez vos bras pour équilibrer votre rotation.\r\nPréparez-vous à l\'Atterrissage : À mesure que vous approchez de l\'atterrissage, commencez à redresser votre corps et à ramener la planche sous vous.\r\nAmortissez l\'Impact : Fléchissez vos genoux au moment de l\'atterrissage pour absorber le choc et maintenir votre équilibre. Assurez-vous de garder votre poids centré sur votre planche.\r\nRidez avec Style : Une fois que vous avez atterri en toute sécurité, continuez à rider avec assurance et style. Félicitations, vous venez de maîtriser le Backside Air !\r\nConseils pour Réussir :\r\n\r\nPratiquez d\'abord sur des petites rampes avant de passer à des sauts plus grands.\r\nVisualisez la figure dans votre tête avant de l\'exécuter.\r\nGardez toujours une posture solide et un regard vers l\'avant.\r\nLe Backside Air est une figure qui demande de la pratique et de la persévérance, mais une fois que vous l\'avez maîtrisée, vous serez capable d\'ajouter une touche de style à votre snowboard et d\'impressionner vos amis sur les pistes. Alors n\'ayez pas peur de vous lancer et de repousser vos limites. Bonne glisse !', 'Old school', '2024-05-01 06:50:15', '2024-04-27 11:29:44', 'backside-air'),

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int NOT NULL,
  `figure_id` int DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `url_media` longtext COLLATE utf8mb3_unicode_ci,
  `by_default` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `figure_id`, `type`, `url_media`, `by_default`) VALUES
(247, 201, 'video', '<iframe width=\"1280\" height=\"720\" src=\"https://www.youtube.com/embed/c1vfTvXjVxY\" title=\"Trick Tip (The Weddle Grab)\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 0),
(248, 201, 'image', '662cd22574714.avif', 0),
(249, 201, 'image', '662cd22574cb5.jpg', 1),
(250, 201, 'image', '662cd225752a4.jpg', 0),
(251, 201, 'image', '662cd22575976.avif', 0),
(253, 203, 'video', '<iframe width=\"1280\" height=\"720\" src=\"https://www.youtube.com/embed/6yA3XqjTh_w\" title=\"How To Indy Grab - Snowboarding Tricks\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 0),
(254, 203, 'image', '662cda9c6fa88.jpg', 1),
(255, 205, 'video', '<iframe width=\"1280\" height=\"720\" src=\"https://www.youtube.com/embed/XKoj-e52w30\" title=\"TUTO - Apprendre à faire un backside 360 en Snowboard| Decathlon\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 0),
(256, 205, 'image', '662cdbdfa9218.jpg', 0),
(257, 205, 'image', '662cdbdfa97de.webp', 1),
(258, 206, 'video', '<iframe width=\"1280\" height=\"720\" src=\"https://www.youtube.com/embed/Hb-X84nrNig\" title=\"How to 180 Jump on a Snowboard - (Regular) 180 Trick Tip\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 0),
(260, 206, 'image', '662cdd43b200f.webp', 1),
(261, 207, 'video', '<iframe width=\"1280\" height=\"720\" src=\"https://www.youtube.com/embed/xhvqu2XBvI0\" title=\"How To Tame Dog (Front Flip) On A Snowboard (Regular)\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 0),
(262, 207, 'image', '662cde21812d1.jpg', 1),
(263, 207, 'image', '662cde218195d.jpg', 0),
(264, 207, 'image', '662cde2182009.webp', 0),
(265, 209, 'video', '<iframe width=\"1280\" height=\"720\" src=\"https://www.youtube.com/embed/hW_RhD0D-Ew\" title=\"TUTO - Apprendre à faire un wildcat (backflip) en Snowboard | Decathlon\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 0),
(266, 209, 'image', '662cdeaa29eb6.jpg', 1),
(267, 209, 'image', '662cdeaa2a4c9.jpg', 0),
(268, 209, 'image', '662cdeaa2abcf.jpg', 0),
(269, 210, 'video', '<iframe width=\"1280\" height=\"720\" src=\"https://www.youtube.com/embed/FMHiSF0rHF8\" title=\"How To Frontside Cork 540 On A Snowboard\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 0),
(270, 210, 'image', '662ce033f2733.avif', 1),
(271, 211, 'video', '<iframe width=\"1280\" height=\"720\" src=\"https://www.youtube.com/embed/KqSi94FT7EE\" title=\"How To Nose &amp; Tail Slide\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 0),
(272, 211, 'image', '662ce0e1160cb.jpg', 1),
(273, 211, 'image', '662ce0e116703.webp', 0),
(274, 212, 'video', '<iframe width=\"1280\" height=\"720\" src=\"https://www.youtube.com/embed/KqSi94FT7EE\" title=\"How To Nose &amp; Tail Slide\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 0),
(275, 212, 'image', '662ce14463f78.jpg', 1),
(276, 213, 'video', '<iframe width=\"1280\" height=\"1055\" src=\"https://www.youtube.com/embed/vf_st7mh0ag\" title=\"Snowboard tuto : Le Back Side Air #method #grab #tutoriel\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 0),
(277, 213, 'image', '662ce1a8e6d10.jpg', 1),
(278, 213, 'image', '662ce1a8e7451.png', 0),
(330, 240, 'video', '<iframe width=\"1280\" height=\"1055\" src=\"https://www.youtube.com/embed/0t6lhROhvqY\" title=\"S.ia - Control (Demo Audio)\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen>dfrgdghfghrhtryjrtjytjfyujk</iframe>', 0);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `url_photo_profil` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `date_inscription` datetime NOT NULL,
  `password` varchar(72) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C5C011B5` (`figure_id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `figure`
--
ALTER TABLE `figure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F57B37A989D9B62` (`slug`),
  ADD KEY `IDX_2F57B37AA76ED395` (`user_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6A2CA10C5C011B5` (`figure_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1352;

--
-- AUTO_INCREMENT pour la table `figure`
--
ALTER TABLE `figure`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C5C011B5` FOREIGN KEY (`figure_id`) REFERENCES `figure` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `figure`
--
ALTER TABLE `figure`
  ADD CONSTRAINT `FK_2F57B37AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C5C011B5` FOREIGN KEY (`figure_id`) REFERENCES `figure` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
