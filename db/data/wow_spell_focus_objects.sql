-- MySQL dump 10.13  Distrib 5.1.70, for pc-linux-gnu (x86_64)
--
-- Host: localhost    Database: valkyrie_development
-- ------------------------------------------------------
-- Server version	5.1.70-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wow_spell_focus_objects`
--

DROP TABLE IF EXISTS `wow_spell_focus_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wow_spell_focus_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_ru` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1367 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wow_spell_focus_objects`
--

LOCK TABLES `wow_spell_focus_objects` WRITE;
/*!40000 ALTER TABLE `wow_spell_focus_objects` DISABLE KEYS */;
INSERT INTO `wow_spell_focus_objects` VALUES (1,'Наковальня','Anvil'),(2,'Ткацкий Станок','Loom'),(3,'Кузня','Forge'),(4,'Очаг для приготовления пищи','Cooking Fire'),(5,'Кристаллы Мизраэли','Shards of Myzrael'),(6,'Колодец Заиндевевшего Копыта','Winterhoof Water Well'),(7,'Источник Громового Рога','Thunderhorn Water Well'),(8,'Колодец Буйногривых','Wildmane Water Well'),(9,'Костер Племени','Tribal Fire'),(10,'Механическая мастерская','Machine Shop'),(11,'Лунный колодец Тенистой долины','Shadowglen Moonwell'),(12,'Лунный колодец Деревни Звездного Ветра','Starbreeze Village Moonwell'),(13,'Лунный колодец Арлитриэнских Прудов','Pools of Arlithrien Moonwell'),(14,'Лунный колодец Поляны Оракула','Oracle Glade Moonwell'),(15,'Aэропорт торговой компании','Venture Co. Airport'),(16,'Фургон торговой компании (Синий)','Venture Co. Wagon (Blue)'),(17,'Фургон торговой компании (Красный)','Venture Co. Wagon (Red)'),(18,'NG-5 взрывчатка (красная)','NG-5 Explosives (Red)'),(19,'NG-5 взрывчатка (синяя)','NG-5 Explosives (Blue)'),(20,'Пламя Узеля','Flame of Uzel'),(21,'Лунный колодец Ясеневого леса','Ashenvale Moonwell'),(22,'Алтарь, источенный морем','Seaworn Altar'),(23,'Близлежащие клубни','Nearby Tubers'),(43,'Круг призыва Подгорода','Undercity Summoning Circle'),(63,'Шаманское святилище','Shaman Shrine'),(83,'Круг Призыва Штормграда','Stormwind Summoning Circle'),(103,'Круг Призыва Степей','Barrens Summoning Circle'),(123,'Водопад Зеркального озера','Mirror Lake Waterfall'),(143,'Логово Когтя','Talon Den'),(163,'Ксавианский водопад','Xavian Waterfall'),(164,'Камень Внешнего Круга','Stone of Outer Binding'),(183,'Возмущение Провала Маны','Mana Rift Disturbance'),(203,'Круг Призыва Оргриммара','Orgrimmar Summoning Circle'),(223,'Источник в руинах Звездной Пыли','Ruins of Stardust Fountain'),(224,'Иглогривский водопой','Quilboar Watering Hole'),(225,'Чистота воды - Серебряный бор','Water Purity - Silverpine'),(226,'Колодец Источника','Spring Well'),(243,'Фонтан Храма Луны','Temple of the Moon Fountain'),(263,'Алтарь Джинта\'Алора','Jintha\'Alor Altar'),(264,'Днище пиратского судна','Pirate Ship Bilge'),(283,'Монолит Равноденствия','Equinex Monolith'),(303,'Деревня Сухокожих','Witherbark Village'),(304,'Алтарь Шадра\'Алора','Shadra\'Alor Altar'),(323,'Водяная скважина Заставы Скорбных Песков','Sandsorrow Watch Water Hole'),(343,'Камни Когтя Ненависти','Hatetalon Stones'),(363,'Логово Ичуаки','Echeyakee\'s Lair'),(383,'Мертвое Дерево','The Dead Tree'),(403,'Временная посадочная площадка','Makeshift Helipad'),(423,'Круг Аквамонтоса','Circle of Aquementas'),(424,'Святилище падшего Бога','Sanctum of the Fallen God'),(443,'Первая приливная заводь','the First Tide Pool'),(444,'Вторая приливная заводь','the Second Tide Pool'),(445,'Третья приливная заводь','the Third Tide Pool'),(446,'Четвертая приливная заводь','the Fourth Tide Pool'),(463,'Инкубатор Улья Гориши','Gorishi Hive Hatchery'),(483,'Миблон Рыкозуб','Miblon Snarltooth'),(503,'Кладбище Прибамбасска.','Gadgetzan Graveyard'),(523,'Руины Железнолесья','the ruins of Irontree Woods'),(543,'Черная Кузня','Black Forge'),(563,'Кратер Голакка','Golakka Crater'),(583,'Гробница Семерых','Tomb of the Seven'),(603,'Плоская скала Ун\'Горо','Flat Un\'Goro Rock'),(604,'Высохший труп млатозуба','Preserved Threshadon Carcass'),(623,'Черная наковальня','Black Anvil'),(643,'Кристалл горишского силитида','Gorishi Silithid Crystal'),(644,'Оскверненный лунный колодец','Corrupted Moonwell'),(663,'Алхимическая лаборатория','Alchemy Lab'),(683,'Некованая печать Вознесения','Unforged Seal of Ascension'),(703,'Лунный колодец Аубердина','Auberdine Moonwell'),(704,'Большой северный костер чернолесского фурболга','Blackwood Furbolg North Bonfire'),(705,'Водопад реки Скалистой','Cliffspring River Waterfall'),(723,'Горячая точка Вулкана Огненного Венца','Fire Plume Ridge Hot Spot'),(743,'Груда приношений Арроку','Urok\'s Tribute Pile'),(763,'Андоральская временная аномалия','Andorhal Silo Temporal Rift'),(783,'Камень Ши-Ротам','Stone of Shy-Rotam'),(803,'Священный огонь Жизни','Sacred Fire of Life'),(804,'Передовой лагерь Алого ордена','Scarlet Crusade Forward Camp'),(805,'Башня Андорала','Andorhal Tower'),(823,'Смотровая Некроситета','Scholomance Viewing Room'),(843,'Порченый Лунный колодец в Джеденаре','the Jaedenar Corrupt Moon Well'),(863,'Друг Юми','Umi\'s Friend'),(883,'Лунный Колодец','Moonwell'),(903,'Лавовое озеро Вулкана Огненного Венца','Fire Plume Ridge Lava Lake'),(923,'ящик в центре лесопилки Северного Кряжа.','the crate in the center of the Northridge Lumber Mill'),(943,'Камень лунного совуха','Moonkin Stone'),(944,'Городская площадь Дарроушира','Darrowshire Town Square'),(963,'Яркий Луч Света','Bright Light Beam'),(983,'Знак Взрыва','Mark of Detonation'),(1003,'Зев пещеры водопада Скалистого','Cliffspring Falls Cave Mouth'),(1004,'Пруд Вершины Багрового Тумана','Dreadmist Peak Pool'),(1023,'Мертвые Гиганты.','The Dead Goliaths'),(1043,'Святилище Ремулоса','Shrine of Remulos'),(1063,'Тотемный курган Гиблой Чащи','Foulweald Totem Mound'),(1083,'Зловещий Пруд','Dire Pool'),(1103,'Портал Мародона','Maraudon Portal'),(1123,'Магический шар Орды','Horde Globe of Scrying'),(1143,'Восточный кратер','Eastern Crater'),(1144,'Восточный Кратер','Western Crater'),(1145,'Кладбище Снегопада','Snowfall Graveyard'),(1163,'Магический шар Альянса','Alliance Globe of Scrying'),(1164,'Внутренний двор Дун Болдара','Dun Baldar Courtyard'),(1165,'Внутренний двор Крепости Снежного Волка','Frostwolf Keep Courtyard'),(1183,'Кладбище Снегопада','Snowfall Graveyard'),(1184,'Восточный кратер','East Crater'),(1185,'Восточный Кратер','West Crater'),(1203,'Оранжевый пруд','Orange Crystal Pool'),(1223,'Пламенное дыхание Ониксии','Onyxia\'s Flame Breath'),(1243,'Останки Крошиуса','Kroshius\' Remains'),(1263,'Пьедестал Бессмер\'тера','Pedestal of Immol\'thar'),(1264,'Круг Призыва Тьмы','Circle of Dark Summoning'),(1283,'Главный склеп','The Great Ossuary'),(1284,'Блуждающий дух Долины Ужаса','Terrordale Haunting Spirit'),(1303,'Центр города Заоблачного Пика','Aerie Peak Town Center'),(1323,'Надгробная статуя Утера','Uther\'s Tomb Statue'),(1324,'Монумент Грома','Grom\'s Monument'),(1343,'Лютиковая вершина','Pagle\'s Pointe'),(1344,'Алтарь Занзы','Altar of Zanza'),(1345,'Южнобережье','Southshore'),(1346,'Кости Граккаронда','Bones of Grakkarond'),(1347,'Бомба-вонючка Отрекшихся','Forsaken Stink Bomb'),(1348,'Точка сброса','Drop-Off Point'),(1349,'Водоворот','Swirling Maelstrom'),(1350,'Пещера верховного вождя клана Зимней Спячки','High Chief Winterfall\'s Cave'),(1351,'Установка для фейерверка','Firework Launcher'),(1352,'Пусковая установка','Cluster Launcher'),(1353,'Великое Лунное Сияние','Greater Moonlight'),(1354,'Логово Вуна','Voone\'s Chamber'),(1355,'Чертог Аззлина','Alzzin\'s Chamber'),(1356,'Кровавый трон','The Crimson Throne'),(1357,'Чертог Раса Ледяного Шепота','Ras Frostwhisper\'s Chamber'),(1358,'Чертог Зверя','The Beast\'s Chamber'),(1359,'Место, посещаемое призраками.','Haunted Locus'),(1360,'Арена глубин Черной горы','Blackrock Depths Arena'),(1361,'[PH] Хрустальное Тело','[PH] Crystal Corpse'),(1362,'Наковальня Ледяного грохота','Icebellow Anvil'),(1364,'Освященная земля','Consecrated Earth'),(1365,'Костер летнего праздника','Midsummer Bonfire'),(1366,'Майский шест','Maypole');
/*!40000 ALTER TABLE `wow_spell_focus_objects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-05 15:36:18
