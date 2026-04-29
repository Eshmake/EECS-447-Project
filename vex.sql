/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: mysql.eecs.ku.edu    Database: 447s26_s701a908
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Robotics_Event`
--

DROP TABLE IF EXISTS `Robotics_Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Robotics_Event` (
  `EventCode` varchar(50) NOT NULL,
  `Name` text DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Region` varchar(10) DEFAULT NULL,
  `RegistrationCost` decimal(10,2) DEFAULT NULL,
  `StartDate` varchar(20) DEFAULT NULL,
  `EndDate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`EventCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Robotics_Event`
--

LOCK TABLES `Robotics_Event` WRITE;
/*!40000 ALTER TABLE `Robotics_Event` DISABLE KEYS */;
INSERT INTO `Robotics_Event` VALUES
('RE-VURC-25-0152','\"2025 University of Kansas LEEP Back VURC; Lawrence',0,'16','United Sta',0.00,'100','22-Nov-2025'),
('RE-VURC-25-0292','Mecha Mayhem 2026 VEX U V5RC Push Back Showcase',24,'Canada','AB',326.55,'7-Feb-2026','8-Feb-2026\r'),
('RE-VURC-25-3063','JACKS Carrot Cup VEXU Push Back Qualifier',16,'United States','SD',100.00,'17-Jan-2026','17-Jan-2026\r'),
('RE-VURC-25-3330','SCTCC VEX U Regional Qualifying Tournament in Minnesota',12,'United States','MN',255.00,'5-Mar-2026','5-Mar-2026');
/*!40000 ALTER TABLE `Robotics_Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Robotics_Team`
--

DROP TABLE IF EXISTS `Robotics_Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Robotics_Team` (
  `TeamID` varchar(20) NOT NULL,
  `Name` text DEFAULT NULL,
  `Organization` text DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Region` varchar(10) DEFAULT NULL,
  `ProgrammingScore` int(11) DEFAULT NULL,
  `DrivingScore` int(11) DEFAULT NULL,
  PRIMARY KEY (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Robotics_Team`
--

LOCK TABLES `Robotics_Team` WRITE;
/*!40000 ALTER TABLE `Robotics_Team` DISABLE KEYS */;
INSERT INTO `Robotics_Team` VALUES
('ACU1','ACU Robotics 1','Abilene Christian University','United States','TX',0,10),
('AUBIE2','Auburn Robotics','Auburn University','United States','AL',82,106),
('BISON1','Bison Robotics','Bison Robotics','United States','ND',10,47),
('CLNKR','CLNKR','Connor\'s Basement','United States','IL',58,81),
('CYBER','VEX U Cyber Robotics Club at Iowa State University','Iowa State University','United States','IA',30,11),
('ETAMU','Lion Pride Robotics','Lion Pride Robotics','United States','TX',87,99),
('FOUR4','RoboClaws','Rogers State University','United States','OK',38,75),
('ILLIN1','Illini VEX Robotics','University of Illinois Urbana-Champaign','United States','IL',41,48),
('ILLIN2','Illini VEX Robotics','University of Illinois Urbana-Champaign','United States','IL',0,58),
('INTRT','Perfectly Lost In Transit','In Transit Robotics','United States','NE',65,97),
('JACKS','JACKS','SDSU Robotics','United States','SD',76,100),
('JHAWK','\"RSC2e: \"\"if the Robot has moved during the Match\"\"\"','KU Robotics','United States','KS',59,94),
('KGEAR','Potassium Gears','Elemental Robotics Inc','United States','MN',27,38),
('MINES','MINES Robotics','South Dakota School of Mines and Technology','United States','SD',30,51),
('MTG7','Mtronics','Mechatronics group','Libya','Libya',0,0),
('ORDGR','Orediggers','Colorado School of Mines','United States','CO',30,64),
('RVRSE','UNO Reverse','University of Nebraska Omaha','United States','NE',30,35),
('SKERS','Cornhuskers','University of Nebraska-Lincoln','United States','NE',80,114),
('SYSTM','System Overload','SYSTEM ROBOTICS NON-PROFIT ASSOCIATION FOR ROBOTICS EDUCATION','United States','OR',100,103),
('TNTN','Ten Ton','Ten Ton Robotics','Canada','BC',128,133),
('UMN','Gopher Gold','University of Minnesota Robotics','United States','MN',107,115),
('UND','Fighting Hawks','University of North Dakota','United States','ND',0,46),
('WCOE','RoboRaiders','Texas Tech University Whitacre College of Engineering','United States','TX',0,0);
/*!40000 ALTER TABLE `Robotics_Team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Member_Registry`
--

DROP TABLE IF EXISTS `Member_Registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Member_Registry` (
  `UserID` varchar(50) DEFAULT NULL,
  `TeamID` varchar(20) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Member_Registry`
--

LOCK TABLES `Member_Registry` WRITE;
/*!40000 ALTER TABLE `Member_Registry` DISABLE KEYS */;
INSERT INTO `Member_Registry` VALUES
('RoboFalcon','ACU1','V7!kQ#pL9@xT\r'),
('BotCircuit','ACU1','mR4$zN8!yW2^\r'),
('IronDrive','ACU1','Qp9@Lx3#Vt7!\r'),
('TrackForge','ACU1','J8^nK$4!sP2@\r'),
('MotionShift','ACU1','wT6#zM9@qL1$\r'),
('BotShift','ACU1','Xr3!Vb8^Np5@\r'),
('TitanDrive','AUBIE2','K9@tY#2!mQ7$\r'),
('PulseGear','AUBIE2','cL4^Wz8@Rp1!\r'),
('TrackNova','AUBIE2','P7#xN$5!kT9@\r'),
('WheelSync','AUBIE2','hQ2@Vm8^L#4!\r'),
('RapidForge','AUBIE2','Z5!pR@7#nX3$\r'),
('ServoVault','AUBIE2','uN8^kT2@qL9!\r'),
('RapidCore','AUBIE2','F3#vP$6!mW1@\r'),
('WheelStorm','AUBIE2','yL9@Xr4^Q#7!\r'),
('TitanShift','AUBIE2','B2!tK@8#pN5$\r'),
('MechaPulse','BISON1','sM7^wQ3@L!9#\r'),
('MechaTrail','BISON1','G4@xV#1!nT8$\r'),
('AxisPulse','BISON1','pR6!zL9^K@2#\r'),
('DriveStorm','BISON1','T8$mQ4@wX!7#\r'),
('SteelNova','BISON1','nY3^pL7@V#5!\r'),
('DrivePulse','BISON1','W9!kR@2#tM6$\r'),
('TitanStorm','BISON1','xP5^N8@qL!3#\r'),
('CodeCore','BISON1','L7@vT#4!mQ9$\r'),
('WheelForge','BISON1','rZ2!wK@8^pX5\r'),
('VexNova','CLNKR','M4#nQ$7!tL1@\r'),
('NovaClamp','CLNKR','qT9^xP3@V!6#\r'),
('RoboTrail','CLNKR','K8!mR@5#wL2$\r'),
('PulseVault','CLNKR','V1@pN7^tQ#9!\r'),
('LiftRunner','CLNKR','zL6#xT$4!mK8\r'),
('BotForge','CYBER','P3!qW@9^nR#5\r'),
('SteelAxis','CYBER','tX7@kL#2!mV8\r'),
('MotionForge','CYBER','N5^pQ4@wT!1#\r'),
('MechaCore','CYBER','R8!vM@6#xL3$\r'),
('CyberGrid','CYBER','yQ2@tP9^kN#7\r'),
('SteelSpark','ETAMU','F7#mL$3!wX8@\r'),
('DriveVolt','ETAMU','uV4!qR@8#pT1\r'),
('ServoGrid','ETAMU','J9^xN2@kL!5#\r'),
('IronClamp','ETAMU','wP6@tM#7!qV3\r'),
('DriveClamp','ETAMU','X3!nQ@5^rL#8\r'),
('MotorClamp','ETAMU','K7@pT#1!mW9$\r'),
('WheelVault','ETAMU','cR4^vL8@xQ!2\r'),
('FrameNova','ETAMU','P9#kM$6!tN3@\r'),
('CodeRunner','ETAMU','hT2@wQ8^pL#7\r'),
('GearGrid','FOUR4','Z6!xR@4#nV9$\r'),
('LogicLift','FOUR4','uL1^mP7@qT!5\r'),
('CodeRotor','FOUR4','B8#vQ$3!kX2@\r'),
('RapidNova','FOUR4','sN5@tL#9!wR6\r'),
('SparkVault','FOUR4','G2!pM@8^xQ#4\r'),
('AxisTrail','FOUR4','pT7^kV3@nL!9\r'),
('CodeForge','FOUR4','T4$wR6@qX!1#\r'),
('TorqueClamp','FOUR4','nQ9^xL2@pM#8\r'),
('ProtoWheel','ILLIN1','W5!tP@7#kV3$\r'),
('RotorRush','ILLIN1','xL8^mQ4@rN!2\r'),
('PivotSpark','ILLIN1','L3@vT#9!pW6$\r'),
('CodeDrive','ILLIN1','rK7!xM@5^qL#1\r'),
('GearPulse','ILLIN1','M9#pR$2!tV8@\r'),
('RapidStorm','ILLIN1','qN4^wL7@xQ!5\r'),
('FrameRunner','ILLIN1','K6!tP@3#mR9$\r'),
('CyberRunner','ILLIN1','V2@xQ8^nL#7!\r'),
('FrameCore','ILLIN1','zT5#kM$1!pW6\r'),
('ServoStorm','ILLIN1','P8!rL@4^qV#2\r'),
('CyberClamp','ILLIN2','tQ3@wN#7!xL9\r'),
('TitanTrack','ILLIN2','N7^mP5@kT!1#\r'),
('RapidCore','ILLIN2','R1!vQ@9#pL6$\r'),
('LiftMesh','ILLIN2','yX4@tM8^qN#3\r'),
('BoltRunner','INTRT','F8#kL$2!wR7@\r'),
('ServoForge','INTRT','uP5!xQ@6#nT1\r'),
('SteelTrail','INTRT','J3^mV9@rL!8#\r'),
('TitanGrid','INTRT','wT7@pN#4!qX2\r'),
('ServoStorm','JACKS','X9!kR@1^mL#5\r'),
('CyberPivot','JACKS','K4@vQ#8!tP7$\r'),
('TitanBolt','JACKS','cL2^xT6@pN!9\r'),
('CyberTrail','JACKS','P7#mR$3!wQ8@\r'),
('ServoTrack','JACKS','hV5@kL#1!xT9\r'),
('WheelCore','JACKS','Z8!pQ@4^nR#2\r'),
('CyberCore','JACKS','uT6^wM7@qL!3\r'),
('LiftPulse','JACKS','B1#xP$9!kV5@\r'),
('CircuitCore','JHAWK','sQ4@tL#8!mR2\r'),
('MotorCore','JHAWK','G7!vN@3^pX#6\r'),
('LiftPulse','JHAWK','pL9^kQ5@wT!1\r'),
('GearRunner','JHAWK','T2$xR8@mV!7#\r'),
('TitanCore','JHAWK','nP6^qL4@tN#3\r'),
('CodeGrid','JHAWK','W8!mQ@1#xK9$\r'),
('LiftForge','JHAWK','xT3^pR7@vL!5\r'),
('SparkForge','JHAWK','L5@kN#2!wQ8$\r'),
('DriveMatrix','KGEAR','rV9!tM@4^xL#1\r'),
('ClawDrive','KGEAR','M6#qP$8!nR3@\r'),
('CyberForge','KGEAR','qL1^wT9@kV!7\r'),
('SparkClamp','KGEAR','K3!xQ@5#mP8$\r'),
('MotorRush','KGEAR','V7@tL2^pN#4!\r'),
('FramePulse','KGEAR','zR8#kM$6!wQ1\r'),
('SparkTrail','KGEAR','P4!vT@9^xL#3\r'),
('AutoClaw','MINES','tN5@qR#1!mK7\r'),
('FrameShift','MINES','sT5^xP9@qM!2#\r'),
('DriveSync','MINES','xQ7!mL@4#pT9$\r'),
('MotorVault','MINES','V3^kR8@wN!2#\r'),
('AxisNova','MINES','pL9@tQ#5!xM7^\r'),
('TorqueRunner','MINES','K6!vP@1#nT8$\r'),
('GearShift','MINES','rW4^xL7@qM!9#\r'),
('GearCore','MINES','T2@kN#8!pV5$\r'),
('TorqueNova','MINES','mQ9^tR3@xL!1#\r'),
('DriveNova','MINES','B7!pM@6#wT4$\r'),
('TitanCore','MINES','zL5^qX8@nR!2#\r'),
('LiftLogic','MTG7','F1@vK#9!tP7$\r'),
('WheelPulse','MTG7','uT8!mQ@2#xL6$\r'),
('MotorShift','MTG7','J4^pR7@wN!3#\r'),
('AxisShift','MTG7','nV9@kL#5!qT1$\r'),
('DriveLogic','MTG7','W6!xM@8#pQ4$\r'),
('CyberNova','MTG7','cR3^tL9@vN!7#\r'),
('BotNova','MTG7','P5@qK#1!xT8$\r'),
('IronRotor','ORDGR','hL7!mR@4#wQ2$\r'),
('AutoTorque','ORDGR','Z2^pV8@nT!6#\r'),
('BotClamp','ORDGR','yQ9@xL#3!kM5$\r'),
('DriveForge','ORDGR','G4!tP@7#rN1$\r'),
('WheelForge','ORDGR','sM8^wQ2@vL!9#\r'),
('LiftShift','ORDGR','X1@pR#6!kT7$\r'),
('ServoClamp','ORDGR','K9!xN@3#qL5$\r'),
('BotVault','ORDGR','pT4^mV7@wQ!2#\r'),
('CyberPulse','ORDGR','L8@rK#1!xP6$\r'),
('MotorTrail','ORDGR','R5!qT@9#nL3$\r'),
('WheelRunner','ORDGR','uV2^kM8@pQ!7#\r'),
('CodeNova','ORDGR','F7@xL#4!tR1$\r'),
('MotionMesh','RVRSE','wQ3!pN@6#mT8$\r'),
('SparkMesh','RVRSE','J9^vK5@xL!2#\r'),
('TorqueRunner','RVRSE','nR4@tP#7!qM1$\r'),
('BotPulse','RVRSE','B6!xQ@8#kL3$\r'),
('CodePulse','RVRSE','zT1^mV9@wR!5#\r'),
('SparkCore','RVRSE','P8@qL#2!xN7$\r'),
('DriveCore','RVRSE','hK5!tM@4#pQ9$\r'),
('ServoRunner','RVRSE','Z7^xR1@nL!6#\r'),
('TorqueTrail','SKERS','yP3@vQ#8!mT2$\r'),
('GridMotion','SKERS','G9!kL@5#wR4$\r'),
('FrameNova','SKERS','sT2^pN7@xQ!1#\r'),
('ServoNova','SKERS','X4@mR#6!vL8$\r'),
('FrameTrail','SKERS','K1!qP@9#tN5$\r'),
('GearForge','SKERS','rL8^xT3@wM!7#\r'),
('MotorPulse','SKERS','T5@kQ#2!pV9$\r'),
('DriveTrail','SKERS','mN7!vR@4#xL1$\r'),
('LiftRunner','SKERS','F3^pT8@qM!6#\r'),
('SensorSync','SYSTM','uQ9@xL#5!kR2$\r'),
('LiftStorm','SYSTM','J6!wP@1#nT7$\r'),
('GearStorm','SYSTM','nL4^mQ8@vR!3#\r'),
('TorqueCore','SYSTM','W2@tK#9!xP5$\r'),
('TorqueMesh','SYSTM','cV7!qL@6#mT1$\r'),
('BotTrail','SYSTM','P9^xR3@nQ!8#\r'),
('AxisRunner','SYSTM','hT5@kM#2!pL7$\r'),
('MotorCore','SYSTM','Z1!vQ@4#wR9$\r'),
('SparkClamp','SYSTM','yL8^pN6@xT!3#\r'),
('AxisForge','SYSTM','G3@qR#7!mK5$\r'),
('RapidWheel','TNTN','sP6!xL@9#tQ2$\r'),
('DriveBolt','TNTN','X8^mV1@wN!4#\r'),
('AxisCore','TNTN','K2@pT#5!qL7$\r'),
('WheelTrail','TNTN','rQ9!vM@3#xR1$\r'),
('CyberStorm','TNTN','T4^kL8@nP!6#\r'),
('ServoPulse','TNTN','mR1@wQ#7!tV5$\r'),
('RapidForge','TNTN','F8!xP@2#kL9$\r'),
('AxisPulse','TNTN','uT3^qN6@vR!1#\r'),
('GearForge','TNTN','J5@mL#8!xQ4$\r'),
('RapidPulse','TNTN','nP7!tR@9#wK2$\r'),
('CodeCrank','UMN','B4^xL1@qM!8#\r'),
('BotRunner','UMN','zQ6@vT#3!pN5$\r'),
('SparkTrail','UMN','P2!kR@7#mL9$\r'),
('RotorStorm','UMN','Z5@pL#6!wR3$\r'),
('LiftCore','UMN','yT1!mQ@9#xK7$\r'),
('DriveRunner','UMN','G7^vP2@rL!4#\r'),
('TitanPulse','UMN','sL3@qN#8!tM6$\r'),
('RapidNova','UMN','X9!kT@5#pR1$\r'),
('BotCore','UMN','K4^xL7@wQ!2#\r'),
('AxisForge','UND','rM8@vP#1!qT6$\r'),
('GearVault','UND','T6!pN@3#xL9$\r'),
('ServoRush','UND','mQ2^kR8@wV!5#\r'),
('TrackPulse','UND','F9@tL#4!xP1$\r'),
('SparkRunner','UND','uR5!mQ@7#nT3$\r'),
('MotorNova','UND','J1^xL9@pV!6#\r'),
('SparkDrive','WCOE','nT8@qK#2!wR4$\r'),
('ClampCore','WCOE','W3!vM@5#xL7$\r'),
('RotorLogic','WCOE','cQ7^pT1@nR!9#\r'),
('FrameCore','WCOE','P4@kL#8!mV2$\r'),
('GearNova','WCOE','hX9!qR@3#tN6$\r'),
('AxisClamp','WCOE','Z6^wP5@xL!1#');
/*!40000 ALTER TABLE `Member_Registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Competes_At`
--

DROP TABLE IF EXISTS `Competes_At`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Competes_At` (
  `TeamID` varchar(20) DEFAULT NULL,
  `EventCode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Competes_At`
--

LOCK TABLES `Competes_At` WRITE;
/*!40000 ALTER TABLE `Competes_At` DISABLE KEYS */;
INSERT INTO `Competes_At` VALUES
('ACU1','RE-VURC-25-0152\r'),
('AUBIE2','RE-VURC-25-0152\r'),
('BISON1','RE-VURC-25-3063\r'),
('BISON1','RE-VURC-25-3330\r'),
('CLNKR','RE-VURC-25-3063\r'),
('CYBER','RE-VURC-25-3330\r'),
('ETAMU','RE-VURC-25-0152\r'),
('FOUR4','RE-VURC-25-0152\r'),
('ILLIN1','RE-VURC-25-0152\r'),
('ILLIN1','RE-VURC-25-3063\r'),
('ILLIN2','RE-VURC-25-0152\r'),
('INTRT','RE-VURC-25-0152\r'),
('INTRT','RE-VURC-25-3063\r'),
('INTRT','RE-VURC-25-3330\r'),
('JACKS','RE-VURC-25-0152\r'),
('JACKS','RE-VURC-25-3063\r'),
('JACKS','RE-VURC-25-3330\r'),
('JHAWK','RE-VURC-25-0152\r'),
('JHAWK','RE-VURC-25-3063\r'),
('JHAWK','RE-VURC-25-0292\r'),
('KGEAR','RE-VURC-25-0152\r'),
('KGEAR','RE-VURC-25-3330\r'),
('MINES','RE-VURC-25-3063\r'),
('MINES','RE-VURC-25-3330\r'),
('MTG7','RE-VURC-25-0152\r'),
('ORDGR','RE-VURC-25-0152\r'),
('ORDGR','RE-VURC-25-3063\r'),
('RVRSE','RE-VURC-25-3330\r'),
('SKERS','RE-VURC-25-0152\r'),
('SKERS','RE-VURC-25-3063\r'),
('SYSTM','RE-VURC-25-0292\r'),
('TNTN','RE-VURC-25-0292\r'),
('UMN','RE-VURC-25-3063\r'),
('UMN','RE-VURC-25-3330\r'),
('UND','RE-VURC-25-3330\r'),
('WCOE','RE-VURC-25-0152');
/*!40000 ALTER TABLE `Competes_At` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-29 17:09:00
