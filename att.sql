/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 10.4.13-MariaDB : Database - attsystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`attsystem` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `attsystem`;

/*Table structure for table `academicyear` */

DROP TABLE IF EXISTS `academicyear`;

CREATE TABLE `academicyear` (
  `academicyearID` int(11) NOT NULL AUTO_INCREMENT,
  `ayCode` varchar(20) DEFAULT '',
  `ayDesc` varchar(100) DEFAULT '',
  `semester` varchar(30) DEFAULT '',
  `active` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`academicyearID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `academicyear` */

insert  into `academicyear`(`academicyearID`,`ayCode`,`ayDesc`,`semester`,`active`) values 
(1,'19-20','2019-2020','',0),
(3,'20-21','2020-2021','',1),
(6,'21-22','2021-2022','',0);

/*Table structure for table `attlog` */

DROP TABLE IF EXISTS `attlog`;

CREATE TABLE `attlog` (
  `attlogID` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `datetimeLog` timestamp NOT NULL DEFAULT current_timestamp(),
  `remarks` varchar(10) DEFAULT '',
  `timeSent` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `isSent` tinyint(1) DEFAULT 0,
  `academicyearID` int(11) DEFAULT NULL,
  PRIMARY KEY (`attlogID`),
  KEY `attlog_ibfk_1` (`id`),
  KEY `academicYearID` (`academicyearID`),
  CONSTRAINT `attlog_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attlog_ibfk_2` FOREIGN KEY (`academicyearID`) REFERENCES `academicyear` (`academicyearID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Data for the table `attlog` */

insert  into `attlog`(`attlogID`,`id`,`datetimeLog`,`remarks`,`timeSent`,`isSent`,`academicyearID`) values 
(47,30,'2020-10-11 18:58:33','OUT','2020-10-11 20:44:17',1,3),
(48,27,'2020-10-11 18:59:16','IN','2020-10-11 18:59:22',1,3),
(49,30,'2020-10-11 07:31:54','IN','2020-10-11 21:27:44',1,3),
(50,30,'2020-10-11 11:20:25','OUT',NULL,1,3),
(51,30,'2020-10-11 13:15:24','IN','2020-10-11 21:32:54',1,3);

/*Table structure for table `ay_students` */

DROP TABLE IF EXISTS `ay_students`;

CREATE TABLE `ay_students` (
  `ayStudentID` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `academicyearID` int(11) DEFAULT NULL,
  `isExempted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`ayStudentID`),
  KEY `id` (`id`),
  KEY `academicyearID` (`academicyearID`),
  CONSTRAINT `ay_students_ibfk_2` FOREIGN KEY (`academicyearID`) REFERENCES `academicyear` (`academicyearID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ay_students_ibfk_3` FOREIGN KEY (`id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `ay_students` */

insert  into `ay_students`(`ayStudentID`,`id`,`academicyearID`,`isExempted`) values 
(14,27,3,0),
(17,30,3,0),
(18,31,3,0);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(30) DEFAULT '',
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`categoryID`,`category`) values 
(1,'FACULTY'),
(2,'STAFF');

/*Table structure for table `grades` */

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `gradeID` int(11) NOT NULL AUTO_INCREMENT,
  `grade` varchar(30) DEFAULT '',
  PRIMARY KEY (`gradeID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `grades` */

insert  into `grades`(`gradeID`,`grade`) values 
(8,'GRADE 7'),
(9,'GRADE 8'),
(10,'GRADE 9'),
(11,'GRADE 10'),
(12,'GRADE 11');

/*Table structure for table `msgs` */

DROP TABLE IF EXISTS `msgs`;

CREATE TABLE `msgs` (
  `msgsID` int(11) NOT NULL AUTO_INCREMENT,
  `msg` text DEFAULT NULL,
  `mobile` varchar(15) DEFAULT '',
  `isSent` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `msgparentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`msgsID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `msgs` */

/*Table structure for table `msgs_parent` */

DROP TABLE IF EXISTS `msgs_parent`;

CREATE TABLE `msgs_parent` (
  `msgparentID` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(30) DEFAULT '',
  `subjectDesc` varchar(150) DEFAULT '',
  PRIMARY KEY (`msgparentID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `msgs_parent` */

/*Table structure for table `phonebook` */

DROP TABLE IF EXISTS `phonebook`;

CREATE TABLE `phonebook` (
  `phonebookID` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(100) DEFAULT '',
  `fname` varchar(100) DEFAULT '',
  `mname` varchar(100) DEFAULT '',
  `mobileNo` varchar(30) DEFAULT '',
  `positionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`phonebookID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `phonebook` */

insert  into `phonebook`(`phonebookID`,`lname`,`fname`,`mname`,`mobileNo`,`positionID`) values 
(11,'DUERME','SHEILA MAE','','+639120636270',2),
(12,'BELANO','JANZIEL','','+639074893166',1),
(13,'FLORIZA','JADE ANN','','+639124349394',1),
(14,'AMPARADO','ETIENNE WAYNE','NAMOCATCAT','+639167789585',3),
(15,'CENAS','VINCENT DAN','CABALLERO','+639129189977',2),
(16,'SANTARITA','JUNREY','','+639106299032',1),
(17,'AMPARADO','ET ET SMART','AMPARADO','+639309854469',2),
(18,'CABASAG','MARITCHO','CABASAG','+639487595475',1);

/*Table structure for table `port_setting` */

DROP TABLE IF EXISTS `port_setting`;

CREATE TABLE `port_setting` (
  `psettingID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT '',
  `port` varchar(30) DEFAULT '',
  PRIMARY KEY (`psettingID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `port_setting` */

insert  into `port_setting`(`psettingID`,`type`,`port`) values 
(1,'SMS','COM01'),
(2,'RFID','COM02');

/*Table structure for table `positions` */

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
  `positionID` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(30) DEFAULT '',
  PRIMARY KEY (`positionID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `positions` */

insert  into `positions`(`positionID`,`position`) values 
(1,'TEACHER'),
(2,'STAFF'),
(3,'ADMINISTRATOR'),
(4,'PRINCIPAL');

/*Table structure for table `programs` */

DROP TABLE IF EXISTS `programs`;

CREATE TABLE `programs` (
  `programID` int(11) NOT NULL AUTO_INCREMENT,
  `progCode` varchar(20) DEFAULT '',
  `progDesc` varchar(100) DEFAULT '',
  PRIMARY KEY (`programID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `programs` */

insert  into `programs`(`programID`,`progCode`,`progDesc`) values 
(1,'BSCS','BACHELOR OF SCIENCE IN COMPUTER SCIENCE'),
(2,'BEED','BACHELOR OF EDUCATION'),
(3,'BSED-FILL','BACHELOR OF SCIENCE IN EDUCATION MAJOR IN FILIPINO');

/*Table structure for table `rooms` */

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `roomID` int(11) NOT NULL AUTO_INCREMENT,
  `roomCode` varchar(150) DEFAULT '',
  `roomDesc` text DEFAULT NULL,
  `teacherID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`roomID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `rooms` */

insert  into `rooms`(`roomID`,`roomCode`,`roomDesc`,`teacherID`,`userID`) values 
(2,'ROOM 101','',9,NULL),
(3,'ROOM 102','',5,NULL),
(4,'ROOM 103','',0,NULL),
(6,'ROOM 105','103',0,NULL),
(7,'ROOM 104','',0,NULL),
(8,'ROOM 106','',0,NULL);

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `sectionID` int(11) NOT NULL AUTO_INCREMENT,
  `gradeID` int(11) DEFAULT NULL,
  `section` varchar(45) DEFAULT '',
  PRIMARY KEY (`sectionID`),
  KEY `gradeID` (`gradeID`),
  CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`gradeID`) REFERENCES `grades` (`gradeID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `sections` */

insert  into `sections`(`sectionID`,`gradeID`,`section`) values 
(8,8,'SECTION ALPHA'),
(9,8,'SECTION BETA'),
(10,9,'SECTION NARA'),
(11,9,'SECTION MAHOGANY'),
(12,10,'SECTION SAMPAGUITA'),
(13,10,'SECTION GUMAMELA');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rfid` varchar(15) DEFAULT '',
  `studentID` varchar(15) DEFAULT '',
  `lrn` varchar(60) DEFAULT '',
  `lname` varchar(50) DEFAULT '',
  `fname` varchar(50) DEFAULT '',
  `mname` varchar(50) DEFAULT '',
  `sex` varchar(6) DEFAULT '',
  `gradeID` int(11) DEFAULT NULL,
  `sectionID` int(11) DEFAULT NULL,
  `mobileNo` varchar(20) DEFAULT '',
  `pMobileNo` varchar(20) DEFAULT '',
  `guardian` varchar(60) DEFAULT '',
  `img` longblob DEFAULT NULL,
  `isExempted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `gradeID` (`gradeID`),
  KEY `sectionID` (`sectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`id`,`rfid`,`studentID`,`lrn`,`lname`,`fname`,`mname`,`sex`,`gradeID`,`sectionID`,`mobileNo`,`pMobileNo`,`guardian`,`img`,`isExempted`) values 
(27,'A97CF697','179452','','CLAVECILLA','FELMARKRISH','MACO','MALE',10,12,'+639973757039','+639052169107','MR CLAVECILLA','ÿØÿà\0JFIF\0,,\0\0ÿá\0ÎExif\0\0MM\0*\0\0\0\0‡i\0\0\0\0\0\0\0\Z\0\0\0\0\0’†\0\0\0\0˜\0\0\0,\0\0\0\0F\0i\0l\0e\0 \0s\0o\0u\0r\0c\0e\0:\0 \0h\0t\0t\0p\0:\0/\0/\0c\0o\0m\0m\0o\0n\0s\0.\0w\0i\0k\0i\0m\0e\0d\0i\0a\0.\0o\0r\0g\0/\0w\0i\0k\0i\0/\0F\0i\0l\0e\0:\0B\0e\0l\0l\0_\02\00\06\0L\03\0_\0(\0D\0-\0H\0A\0S\0A\0)\0.\0j\0p\0g\0\0\0\0\0ÿâXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0öÖ\0\0\0\0\0Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0Ï\0íÌ\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0Wçmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0Æ\0Ë\0Ğ\0Õ\0Û\0à\0å\0ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹ÁÉÑÙáéòú&/8AKT]gqz„˜¢¬¶ÁËÕàëõ\0!-8COZfr~Š–¢®ºÇÓàìù -;HUcq~Œš¨¶ÄÓáğş\r+:IXgw†–¦µÅÕåö\'7HYj{Œ¯ÀÑãõ+=Oat†™¬¿Òåø2FZn‚–ª¾Òçû		%	:	O	d	y		¤	º	Ï	å	û\n\n\'\n=\nT\nj\n\n˜\n®\nÅ\nÜ\nó\"9Qi€˜°Èáù*C\\u§ÀÙó\r\r\r&\r@\rZ\rt\r\r©\rÃ\rŞ\rø.Id›¶Òî	%A^z–³Ïì	&Ca~›¹×õ1OmŒªÉè&Ed„£Ãã#Ccƒ¤Åå\'Ij‹­Îğ4Vx›½à&Il²ÖúAe‰®Ò÷@eŠ¯Õú Ek‘·İ\Z\Z*\ZQ\Zw\Z\ZÅ\Zì;cŠ²Ú*R{£ÌõGp™Ãì@j”¾é>i”¿ê  A l ˜ Ä ğ!!H!u!¡!Î!û\"\'\"U\"‚\"¯\"İ#\n#8#f#”#Â#ğ$$M$|$«$Ú%	%8%h%—%Ç%÷&\'&W&‡&·&è\'\'I\'z\'«\'Ü(\r(?(q(¢(Ô))8)k))Ğ**5*h*›*Ï++6+i++Ñ,,9,n,¢,×--A-v-«-á..L.‚.·.î/$/Z/‘/Ç/ş050l0¤0Û11J1‚1º1ò2*2c2›2Ô3\r3F33¸3ñ4+4e44Ø55M5‡5Â5ı676r6®6é7$7`7œ7×88P8Œ8È99B99¼9ù:6:t:²:ï;-;k;ª;è<\'<e<¤<ã=\"=a=¡=à> >`> >à?!?a?¢?â@#@d@¦@çA)AjA¬AîB0BrBµB÷C:C}CÀDDGDŠDÎEEUEšEŞF\"FgF«FğG5G{GÀHHKH‘H×IIcI©IğJ7J}JÄKKSKšKâL*LrLºMMJM“MÜN%NnN·O\0OIO“OİP\'PqP»QQPQ›QæR1R|RÇSS_SªSöTBTTÛU(UuUÂVV\\V©V÷WDW’WàX/X}XËY\ZYiY¸ZZVZ¦Zõ[E[•[å\\5\\†\\Ö]\']x]É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—cëd@d”dée=e’eçf=f’fèg=g“géh?h–hìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnknÄooxoÑp+p†pàq:q•qğrKr¦ss]s¸ttptÌu(u…uáv>v›vøwVw³xxnxÌy*y‰yçzFz¥{{c{Â|!||á}A}¡~~b~Â#„å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§à¨R¨Ä©7©©ªª««u«é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀìÁgÁãÂ_ÂÛÃXÃÔÄQÄÎÅKÅÈÆFÆÃÇAÇ¿È=È¼É:É¹Ê8Ê·Ë6Ë¶Ì5ÌµÍ5ÍµÎ6Î¶Ï7Ï¸Ğ9ĞºÑ<Ñ¾Ò?ÒÁÓDÓÆÔIÔËÕNÕÑÖUÖØ×\\×àØdØèÙlÙñÚvÚûÛ€ÜÜŠİİ–ŞŞ¢ß)ß¯à6à½áDáÌâSâÛãcãëäsäüå„æ\ræ–çç©è2è¼éFéĞê[êåëpëûì†ííœî(î´ï@ïÌğXğåñrñÿòŒóó§ô4ôÂõPõŞömöû÷Šøø¨ù8ùÇúWúçûwüü˜ı)ıºşKşÜÿmÿÿÿÛ\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿÛ\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0°\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\0[\0\r\0!1AQa\"q‘2¡±#BRÁ3br‚’²ğ$Cs¢Ñ4ScÂá%&6dt“Ã5Dƒ³ÒÓñ\'£EFTeu”ãÿÄ\0\0\0\0\0\0\0\0\0\0ÿÄ\0:\0\0\0\0!1AQ2a‘\"Bq¡±ÁÑCR’#S‚$3¢áğñÿÚ\0\0\0?\0úd®p;€\0\0)\0RP\0\0\0\0\0\0\0€\0€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n@\0¤\n@\0\0\0¤\0\n\0\0BA\0\0\n)\n\0…\0\0\0B@\n\0\0\0 \0\0\n\0\0B€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0…\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H@\Z€IÔ\0\0 P\0\0\0\0A\nP\0\0\0\0\0\0\0!@\0\0\0 ER€R\0\0@\0\0\0\0H!AD\0\nB€!H\0P\0\0\0\0\0\0\0\0!@\0\0€\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¤¤#@\n@°)îPB€îp(\'`\0\0\0\0\0\0\0\0\0B\0\0\0ì\0\0\0\0\0\0\0\0\0\0\0\0€\0\0\nB\nB€\0€P\0\0\0\0\0PB€\0\0( \0 \0P!@\0\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0€P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¤;š€\0)\0\0\0‘€\0\0;”…\0^àB@\0\0\0@\0\0\0@\0\0\0\0`\0\0\0\0\0\0\0\0¤ \0P E €\0@ \0\0 \n(\0B‚\0(\0B‚HR@\0B \0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0i@4)\0\0\0\0\0€@\0\nAIôzPNÀ\n\0 ‚€\n\0… \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¤\0CDêBŞ–¸C«¹Öí(¶¹Ô¥ä\'é·Uû‰%ñ5–yÃ¿mw4ó#§¥yÎóÍŸ™Ê§]>åàrsÔ²S\n‰›±™&«İ”Êg\n … \0@(!@\0(€\0\0\0\0\0\0(\0\0€\0\0\0\0\0\0\0\0\0\0@(\0\0\0\0\0\0!@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@(\0\0\0\0\0\0\0\0\0\0\0\0€\0\0\0\0\0\0\0\0\0\0\0\0\0Ò\04\0\0 Øà\nB\0À\0(ØA\n(\0\0\0\0\0@ \0\0\0\0\0\0\0\0\0\0\0\0\0\0ı\0­í¹±Væ×y?$k”sÔÙ•4ÖÆ¢!™™p//î1ŠQåÏ~§–ÕÕı|ó\\TqıÔğ¿ØU¡“…^ÕI=‘Ö¸s¶Xæ¼ëZç1ßÑRÕçg›ö7ºdfšå<Î¥ §—MrËQÒ0ç9s,µ„úË§©ŞZjq’Yf3¸¶¼²›ŞR^f«]rT¤•L§ô55‚,Ëô.ã/Ú9´ëç¹4ş ‹Æeø’ËW„Ò÷“9Í‹=|*§Ñ›ªGGoycçÒ®ŸsœÕ¸³°L§\Z7T²bjÜN[…4©Ê¨\0€@\0¤\0@P!@\0P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0…\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0\0\0!@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Oq\r\0Q\0\0R@ˆ\0 R\0€@(\0P@)\n\0\0\0€\0€\0(\0\0\0\0\0\0\0\0\0qL \r©@Ú#”Gš‹$Ã®©C=kE.«\'vàmN{‹±5y+İ*\"Ó‚Ã<®¯ÃQ©ÌãY=óêe\n”3Øà×³RÎÇX»V\r¼Ó/¬gšjN+·‘µk¯W¶šU£5ñØÌÚT*Å§¹äµ®§YKÜé–pâé<S(©Ks×iúİ*±Xš}ŒAªh7–‹—*íÔàP×.´ùòÔæŠMöÉ&ÑV×ÑšÚI…+„Ì#£ñ½7ÊªM#İiœEJºXš14^O{\n©›±–{v×PŒÒÄ“îvtnSîršºE’–JqaU3z315n%¸SJe2ª\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0P@(\0\0\0\0!@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€\0Ò\04\0\0\0|À\0\0€\0Á@Á@°  \n@!A\0… \n\0\0@A@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04Š\n48S§Ç `±dÄ8(\'Øá\\YÆYÊ;™ES†QÒ,ÄÕäu\r&#$â¾‡€â¢éNP‡½èŒÃ^‡2y:‹İ65ÌSìv­ıÜæ¯–xƒO¼´­\'mMç¿C®Óø³PÒêEURä^Lú\'[á:7I§M}­xmZ¬›£“ï%”o±ô–ñ\Z•hÁT¨ÓéêŒ•£qE¥Z±Ëé¹€õ/î¬dåóõ\\™G[NëTÑªnäâ¼™1î¸Ã/­­58M,Hí(\\©%†|ÑÃ¾#Ê”¡™µé.¨Ê\ZÚŞF\n5’“é—Œ˜š3ÙNTğnÆiàóZ¬*E5#¶£t¤–ÊhÜYÚ\'’œZu”»›Ñ™ÎjÜN[…4¦R*€\0\0\0…\0\0\0@P\0\n\0\0P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B€(H\0Ğ\0\0\0\0d\0 \0\0\0\0™@€¤\0@€\0€\n@\0 \0 \0\n\0‚€\0\0\n\0\0\0 \0 \0\0\0\0\0\0\0\0Å2€6¥O&Ô¨\'Ôå±iLC¯¬_c‡qe~Ê;·›r§“¤]™«Çê\Z5:ÑjPOâ	Ä\\FáIÂ>Ì•(\'ØàÜYÆIìµÔsš¾Uâ>	­jç*tŞÛ¬OÚjz=WìåS|<Ÿ]j:%*ñjtÓÏš1ÿ\0ğ-…)S¦“ò:DÄ‘y’Æ|9â]kyÂäœ_L·¹–xs­¯[ß¯s\rq7Õ·“jŞhñN\Z¦‰_4*IÁvfg1İ¬E»>Ô°Ö)ÕŒZ’;ŠjK©ñÿ\0\rx—uc8Rº”£·¼ò‘—¸cÄ[KÈSSª“{uîfkÄòìßN²‘¿¦¼Ï¦k´n!\nŠIôiõ½äd¶håj,YÛ§qiÖO¹¿¦sš·–à\"`Š \0\0\0\0\0\0\0\0\n\0\0\0…!@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ñ€Ü\0¨\0\0\0\0\0\0¡H\0\0\0!ø;H\0\n\0/¨  …(\0\0{\0!@\0\0\0\0 \0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\n)\0(94J™¸aÃ©A>Ç\nâÉI=å¤úš%M3qvf¯©èt«Å©A5êŒwÄÜJ¿<¨Á&ú¬u3J	®‡âÊ2Oc´jg»”ÓÙñïğ%kyK–‹[ã¡ákÚê:Eg*3œRò>ÜÕt\n71’5ºò1ŸøyJ´g:0Ç¦2tŒOfë©1İ…¸kÄ‹í6j.J=O§ÈÌ|\'â•­äbªVYóLÄ\\KÀõíç,Ri®ë¹á«Úİéõs(8¾«mÌÚ&\ZãKö}Ï¤qªq”*ÆQ}òz+kØÍ,5õ>áÎ=ÔôŠ‘æ­9$úäÌü#âÕ½Ìa\ZóJ]læÕš¾§YK¹½¦xŠm¯©ÆTªÆI÷Lõ×ñšê™‰ªEİÎJqi×R7ã4Îs\\7–°L”Š…\0€\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B‚ wÊ\0\0\0\0\0\0\0\0Ü\n@\0dÜ\0\0\0Àu€\0€\0\n\0\n\0 \0\0\0\0\n\0\0Pì\0 \0\0\0\0\0\0\0\0\0\0¤\0\0\0€\0\0ÖM¦™¸Ä©A>ÇæÆ3Oİ;–2‚gH¾š¼&³Ãv÷tåÒ‹OÍ³‹¼6E)ÚÅsy5ÕCÔ ¤º«Í4âÕÕ÷sã‰Ì>#âN¸³œ³JPŸÃcÄÜÚ]XÕËR‹]Ñ÷^¹Âö×Ô¥\Z´¢Óô1øbš©;xe=Ú:q­»7\Z³è\\e©éŒ©×©$Ÿøò2ÿ\0xÇìéŞÍ¦¶y{˜Ãˆx.êÆ¬¹iÊ8êš<u{j–Õ}ø8Éæ&½á¾5»îã;=Jœ]\Zğ–{&zûMF\"œdš??4~\"Ô4ª‘•µy,>ìe¾ñ–­\nZ–p°¹›íŸ3‰ftíW×4«©w7ã$Ì[Ã<{a©ÓŒ©W‹o¶OqgªS¨–$ŒÍ,ï25+ˆÉlÍõ$ÑÎba¨–°B™P P\0\0\0\0( \0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\0\0\0\0(\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 @Pı\0€\0\0\0\0\0\0\0\0\02\0\0\00\n\0)\0 \0   R\n\0\0B\n\0îPÀ\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H)\nBƒ4¸¦j(ÈâÔ šèp.l#4ÓŠhî	(§Øİo0ÌÖï^á;è5R„^sĞÃÜeág»9P‡2í•¹ôõJ\nIìp.´øTO1X=ÕÏIsšÌu‡Á<AÂ7zuIş®I\'”°yz)8Î-IuÊ>ìâ>³Ô¡%R„rûàÂ\\máMJ|õ-©¹ÇÑn…´¢İjé]l|L¥ëšmXÎÖ¼éµÙ=Œ¥Â>1ŞXJõ)Ò]ú¤c­o†®ôê’N”ğ½7GC8Êœ·M¸ÍzK¤âıŸjğŸ‰ÚN¯{+¨©¼{“ÙçÑ™ÃV¥^”&š~§ç]­å{Zª¥½iSšîÁş,êÚ3;‰:ÔV3Ÿ\"ô—9¤ÇgÜT®#4°ÎB–LÁ~.iz¤!\nõãF«ÆT72¦›¬Ğº§S«F]\ZyLÄĞÌÇIzœjW’êoÆI˜˜ÃYj)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 (\0!@\Z@€\0\0;ú\0\0\0\0\0\0ä\0 \0\0\0\0\0¤)\0\0\0¤\0\0@\0/r€\n(‚R\0î\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 … \0;\0qO©¨qêPRÎR:ë½:\"ÓŠhîâ™ºŞa™¬KqWYjt¥š*3ÆÒHÁ|ká5Í·´«mhöq[Ÿ`T¡uG[{¦S­¥ÓìÑé®´Z1g9¬ÇX~yêÚ%ÖŸ9F­),wÁÔî¥†}ÁÅ¾Øj°›ö\nIE<&»Óå*¶ôå(/ÚŠ$éç­]+«şæ£^tª)Ó”£%ÒIáã„üKÖôÆ0¸•j+¬$Ï!¨éwV5jÓkÁÁyHç9î³h}kÀş6iº’…+úŞ¶T÷Yô3‘Ä×Ô£R…hT„ºJ2ÊgçTj8É8·èz®ãk‡«ÆV—“ä]a\'”Éİ‰ÓÇgè=+ˆÏ£7ÓLù£|v´¹övúÊû=m—;û¯æg\r‰¬µ:«kqN¤%ºjY10ÎqİêAÇ¥q¤Óêo§“k9P\0\0\0\0(\0\0 \0\0\0\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\n\0\0\0@\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 B€\0… ¸\0Ğw\0\0©6ğ“g‰â¸7C¯R…ÖµNâêŸŞ£e	\\Ê/É¸\'½º6‰3İºiÚóŠF]oŒ¼y¨ğU\r*\Z=½K«ïm>{¸JpJšº”eÌÜ×Ë\'¶áİR· izUÛjuñÒrYkäò™|pñLãjz<4Ëk»k{	ÕªêİSŠœç,EF)Iâ8M¼÷Áé¼5ñrÓ‡xJÃHÔì.ï~ÇeFµ£¦¿UœÅJ2’÷–ZÊê’îsó#/£oÔû=mûÙœşO¡AãøgÄ~â+ŠV¶·³µ½ªùiÛŞÓte7åıÙ?Dò{³ß©Ò&\'³ç_NÚs‹Æ\0V\0\0\0\0\0\0\0\0\0\0\0ƒ\0ød¤(€P@\0P\0\0AHRP\0\0\0\0\0\0P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0(\0\0\0\ZÈU(Æ}²÷J¥^\rJ)§Ù£¸\rdİo0ÌÖ%†øÓÂí;W„ç\nQ£Y­¥³øŸ7øƒáÅçU”æ³MıÖ—_÷eÅxµ¦;ã¾¶â:w8ÏöeÓ¿CÓKÅúYÏ­\'0øBQqxhtf_ã¯	5]&u*Ğ¥í©uR‡ñF+¼°¸³«*uéN\r?ÚX3}9¯W¢º‘nÎ=9´ÏCÃÜWªèu£SO»<?»ÌğyÌcª5Eá÷9·1—Ó	ã¢”)Ñ×©¸=“­Ÿ4g^â½?X·[ªU ûÆYkâ»Ÿ4jÊMgcÒh\\Gw¥×kKšÖõcº)5ù¢L{1Â= ô«Æ¢Ù¦o\'“åŞ\nñ¾â„iQ×aöŠ}=½‰?W9p·i\ZıÔÓo¨ÖÊŞ*X’ø®¨ÄÕ±İìA±F¼*,ÆI›É¦fc\n P\0\0\0\0@(\0\0!@\0@(\0@\0(€\0\0(€\0\0\0…\0\0\0\0\0\0\0\0€\0\0\0\0\0 \0\0\0\0\0\0P@\0¤\0\r\0åüNÑn¸‡€5­7O«VåJÒ³“‹œàÔÕ7ñ.^V¼™ñµµG*”&ãI®eEB1OÑt>ñO\r5Õn|{âîƒşŒø‰«ÚÓX´¹š¾¶‹ÙrUËq[c\n¢šø`ã«2û~­{iO¯öxÛº­IÇ›g¿Ì¶P:*“ÌVİú2æårÙãsVÍî—M™Åú,ú96mK4ëJ§$±œI¯ŸÅuOÌú»Â^%Ÿğ}	^Uöš¥‹V—’}g$½ÚŸÚ|ò|‘8ÔO>¯Bğ·ŠåÃOouVMiõÒ·¼‹ìÛÚ7Ÿƒ’:Rq/™â[;K1ŞTgƒM>w@ô?*½Á\0;€\0wØ\0¨Ğ\0\0dwØ€ \0î@… \0\0\0 ¬\0P\0\0\0\n\0\00\0€\0€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Rw\0\0\0\n@)\n@‰ÓŒº£X,N]y¦R¯A4û`Æücá6™¯FN•\nïöà¶ù£,ƒ­u­V&‘İò†«üœïiÓJ:½´ä·TãFQü^LQÅ<¬píYÆêÚnöâ²Ğ*”£4òº>¯ÃözS¹¡N¬%ÚQÊ:WR–éh3zö—çTàá´O™õˆ>Q¹u.t\ZU[¡SîËàú¯™óÿ\0p®£ İJßP¶©BYÛÚ,gàú2Îœ÷­×R-ÑÑR©(4Óhìì5‹Ë:ğ«o^têÅæ3ƒå’~yFÕ½†^fÍû‹z4á–Òôf1îÖYW‚üvÖ4§Nµ¨Û¬/iZ«×=Ÿø+ÄşâxÂ7ĞË[ÛV÷*/“ëòÉğÛäR÷V~&å\ZÒ§QNœ¥Eç)ãÑ“‡²qËôrÄ*¤âÓ7‹8+Æ#á÷NåHê–qÂp®Úš^“[ır}À1pßºt>Óöùa}ší¨6ÿ\0£.’üÌZ˜N°Ê Ú§Z>ëY7L`P@!@\0\0¤(\0\0\0\0€\n\0\0\0¤(\0B€\0\0!@\0\0\0\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0 \0\0P\0\0\0\Z\0\0†şS<>®ô\r7_£êéõ]µ|ØÕk>•?¼ÌĞuüA¤[kú¡¤Ş¬Û_P¼Ş:s,)/Tğ×ÀÍ£1‡]\rYÑÔ®¤z>¦ñ/àÍÆŞvk‹›[­>úæÎú*VÕ\'oZ?÷“Œ·õk?3r/İLócÛE¢ÑÒ«ªô9Vµ¹\ZO=ÓîqVz|zˆáâJ;çèXfÏ¨|âÓ7-ê«•ş•Æ\r½êÛ=©Ëã8?ê§ÜÉGÇœÄ·3¯ÙëÊu»jµÿ\0£-ªCÕá)/éE^ÙİÛßÙÛŞYUk[Šq­F¤zNYM|™Ş“˜~WÄ6şN¦c´·†@6ğ\0à\0ì\0\0\0\0\0€(\0ê<€\0À\0\nB€e\0B@\0P\0\0\0\0\0\0\0\n\0 \0\0\0\0\0\n\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÉH\0\0\0\0\0\0\0\0\0§¬Iğ¶­ÚN…ı­*ôäºN9úy„\Z­í^É5‰|ÇÇÖ¡í.xj£œwf¨÷ù3ëº>¡¥\\Ô¡¨[Õ£V\r§\n‰§â~‰Nœ&±$™æx¯‚´$³•\rJÒhşÌšÄ£êŸTwJßâèÏŞ¯n°üüjM¬šs¹ôÿ\0\'ıJÚ¤ëpİX^RÎU\ZÒTê%é/»/ÀÄzïëš¤µ\"úÍ/Ú©I¸?„–ß‰¯.}:ºVñ/=	%üMèÔMaá¥ØŞKx´û|’YÛs=VY‚¼Sânp§i~ïl!ÿ\0İ/sR)F_z?SèñÛ‡5ÇNßV›Ñ¯e¶.d?Jö°|y\neœ#uTM<ã>DšD˜~Ğ­N½8N”ã(Mf2‹Ê’óO¹¸|Á¼Ä¼5úR©dó+:ß¬¡?ì¿»ıœß„¿”U– ©Ûq”4›œòºéÊ­üÿ\0z?<üNV¤Õ0Ïàè4N\"£©Q§^{k‹ZŸræŞjP<ìwé¦“O)¬§æa2¤)(!@\0!@ \0\0@€ \0!@\0\0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€B€ €\0\0ˆæ>%â\0\0åÏåÃß¢8æ:­\njºÍjä°±qOšùÇ’^¯&0£\'ÊÓôÇsêïø{ôÿ\0‡Õ)BS¼Òäµ\n*Ş|‰©Å|`åø&Ğiaóg)nÌá©—ê<+_ÍĞã=êäç¦6Í\'õxXÙ\r6öå9¾‹zŞ§,£ûß²×fgÿ\0äóÅj­+»%IJîÃ/¬ÍZ_Ù“æKÊ^‡Ï2{&¼òß‡uK+R´¾Ó§É{iUW¢ÛÙÉ,r¿I,ÅúI›­±/÷o\ZÚs¯¶ÖğŞ·iÄz\r¯§K6÷tÔÒÎ]9t”%ı(Ë1~¨ì°w~Rbbq#\0`¨}\0\0\0Ø\0¸\0\0\0\0\0AĞ|\0w€@)\n\0\0@\0)\0\0\0\0P\0€P\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À\0\0\0\0\0\0¤(€€R€)\r&·Yø›Um©Uƒ…HFQ}SYFè51Ø˜ËÂñ…\\®óÊïD¶§ZYımºtgõ2|ãâŸ„÷ü9¬V–‡§j—º?\"”kF›¬é¾ñ“ŠÏ®qSìƒ­u¦>.¬ñÇgç\rÅ	R­ì«\'Jªıš‘pFm8ÆÃ«O9éÎ²~ˆk?£ëT¥OWÒì¯iËª¸£ş-dÑoÃZ¶Ÿ\n\Z.™NÊ8ÅkO1»ÙnkÍ«Q2ü÷”\\£Ì¢ñæ·_ªÚÆââ|”©ó¶ö>áÖ<\"à=ZS•Ç\rYQ«%ikÍBKÕr4¿q€—6VÓ­Á7óªÖ_Ùo&”ÿ\0±Q%¿õ—Ì¼ënÒrÇv*á]Œô:3Ôxz­õªQ“ŸÙä¥%×šg×Èåğ¿‰\\o£êÓ’â‰©Ïštoà«Q›î¹q˜ç²Ñ§IÓu½Q­GSõµzMsÒ¸ƒŒ—“õ[=ÖQÎ¾µ´¿’•í¼]UÒ­98Ëçæp¾\"f&\ZÎY÷EñZÆ¾BëR±¾•ITTªOOµ©Z”^Ù—Nd’i½=OSqÆœ5FS×,9–1j”äÛI$íå£\røyÅQáı6•´.ç(A¾hâYŠm¾İ³Ÿ©¯‹o­åeÿ\0«õão77UR•I¸JN\\Î/Éeç·s1L³ëº_\ré—\Z†¹yKKx{J“iÉ¨å,òÅ6÷k¢9Z}í¾£§ÛŞÙTö¶·ÕZSåqæ‹YO\r|€ãÄÜXù«ßèú-ì%ÊçRuç%5–ÓÏDü»àôµ¼S½§ú6ö÷JÖiÛİTŒ³³öÖò–pàª´¹³‡ºõòÉpe—ÀO)7¤ğûz*A\0 HP!@\nB€\0\0\0…\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \n@\0\n@\0ÓÜ¿ À\0\0\0Q’jqRƒX”ZÊiõGÄ<q ¾ãMWDiªvµÿ\0PüèÍsSİi?TÏ·Ÿÿ\0•âZGĞÒÿ\0Ñ·o¢Æ\\éIü:ù£¤f2ú^¯åkÅgµº0Œiú†“kFÍócgºø±k|ôôgéæîrÒé°£7\n‹ÆØmcãÕ›rŞIãé¶\n“g/äûÅr³Ö«píÜåöMJR¯kÌÖ)\\%™Çá8®oëEùŸ@Ÿi·5aRœèÕ•\Zô§\Z”ªGgNqyŒ—Á¤Ï°|?âŠ\\_ÂÖš¬iÜ¿Õ]ÑqJ¼~ôwíºkÑ£µ\'0üß‰í¸_ÌÒô@£å€ ¸\0€À\00\0\0\0¤  \0`\0\0@…î@\0¤\0P\0\0\0\n\0\0\0\0P\0\0\0\0!@¤(\0\0\n@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`\0 \0(¤\0ƒ‹øSNâ›(Ñ¿Œ©×§½š{N“ôôóF/»ğcVu$­õ}2µ>Ò«F¥9ÂÚ3yÒq¾›KWàífÂâ½kzUíjEÖ£÷á¶r–VztÎı\rDç)Û«æ-kNz6£sm^êÖâT\'ÈêZÔç§\'×gó[uO(è§¬V ı¢ÙFX\\Ïwõ3×\rø)¢Ûhğ¥©j7·UjÁOõ½8egÜ‚OâÙá¼Pğ†Ë†í­u2şòæ…{˜ÛÊÂMÃ™I©),gt–0º—¹W†tÛ~)•*Õµªø\\“£ís:k8X^Xlí8keqa{Âú¥­=J“¹Tí£uNœ=u÷»ì–Wô’1\rî—_E×”,î*Ñ®¹eIĞsryK©,¿üqÁ¶õíµŠR»§Q\\Ê£œãV.2rêó•×/,a›b!oüBıq/Ó\Z-İ;4œí«öÔ —^l$ãùG¥ĞxƒI×ìcy£j×vïnjUÃò~Oâ`½Væÿ\0SÓu[Kz”\':”ªQ\',T“óMíÛêb]ˆn82´éı’tµ8ESOxJ8ıåûKÑg0ûˆ‹Ât\"„4íF«±Ö%—\ZU¤ù*ã÷$öÏWËñ2îæf0Ğ\02!@\0\0\0\0\0!@\0D\0\0\0\0\0\0\0\0\0€P\0\0\0\0(\0\0H( €P!A \0\0°@Ğq÷GŠ¸7VÑ[ÅKªØË÷jÇŞ¦ÿ\0¼–}2wã|í×±&k9‡À´¦”jÁÓ©Ôã.±kªùtù¥¿|w=·<=ñ\ZòT©bÓU_o¢×iIµV?)ûßÛ<%	7KïiŒKöš\Z±¯§]Hõn9í×àhR–søšçş>~D}}ÿ\0\0í†šU}”ÓËÆz£,x%Å±áş*§muS“LÕœ-«e¥\Zu¿ÙTßÍ¾Gñ‘‰¤“QPÎË|»9F¢\n‰û:‰ÆK;ïåÿ\02ÄáæÜèFµ&²û­¬6šÜ‡‡ğŠçÅ\\#Oíµ9õ}=«kÇŞ¦Şå_íÇãÌ»àôCò¤éÚknğ±2e†›¤Ó6[$g‡”\\3É¾šk%õ#@\0\0 \0À\0`\0è\0\0R\0)\n\0€|ˆ)\0(€M¦£%úI¬áùàùú~6qN•ª]ÙkZ‹qZÎ½KjĞ¡V­»æƒk)ËŸg³[n™ô	óWò‡Ñ™Çvú¥(¨ÛküòkÏÒÄeóppÙ~F-œfİ…4õ5xjFrõÖ^>XJXÔxkQ ¼í®)V^½yYßXø×Á—Uõ;ş&Â£_Xs#æ9lß›$\'³Œylså/³o	Ğ·lÃë;Ä\nÔgZq>—ÎŞ*Õö2)àõ”ç\n´¡R”ã:sŠ”\'¤¤ŸFšê‡¹Ô¢ãS‡îÉs\'ò3ßòsâ¸×Óëp¥Ü×¶²‹¸±m%ÍA¿zIı$¼ÖùœKçï<3È§:Naš\nmò@@~`P\0…Ø\0)\0À\0îR\0(\0€\0 \0!A\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n@\n\0Ä«âªÇ…õz¸û–•_ü,í—¿ö7]Ç_±U_ğ³tø¡-Ú]µ¶ö´ıÔ?Ââí[†­¢ßÿ\0|¦ÖeğûÎŠÅ\nKÊœWà-âTT´|¯»wNXóÇÄ´ø’ÿ\0¶áÕğÆb)RÆËÙæ¸ó…,nø†‡´¥}J*¥U˜ÖÆZìñ¶W‘ê8b<œ=aôƒ_‹6xÍg„u…ÿ\0ºÍş“÷¢Ñš±Gxk«Quol•¨¶ê8Âx–ï;&b}gØjTgCQ¥ÔƒqR«˜Ôƒ[a·ºk\Z>Æôá•û+ò1Ïˆ~h|g©Z_TJÆîc+šÔ#‰ÜSK\rùôÄ·hÕmÜˆâùŠÛƒu=GÚ-2İßS‹Ä½Œ]UëËœ<–—ÅœiÁu]½©yoNÒëš¤ö*tùaèZ&™Ãúm-?F²£giMr¨SXÏÅõoÕš5LÖ(::•½Ô\ZéV\nXø>¨¼ë=Úœ¾o³şPüQEÒæ‘¢ÜAcŸ‘Õ§9¯MÚOåƒŞğÿ\0ò€áûÎHkv7ÚUGÖxUégúÑßnq€ü;|ªOI©u¦Ö–éB~Ò«/àÌMÄ~qn)NÂRŠé+iòÏç	cğl×—[vNPú—‡ø‹Jâ8İè×”®í›Ç´¦ò“ò~OĞí»\riÜAÅyìh^_éSæ•½h¸Â^®2Ù™‡üÖ-9iëv6÷‘If¥Ó—Ó¡ÎÔÂåôñLWÃŞ6ğ¶«(Ó¯qRÂ³Û–î<‹9ıî†E²Õ-/iF­½hT§.’Œ“OæŒMdËœ¤¤¶i”Š\0\0‚‚\0\0\0\0\0\0\0\0\n@(\0\0\0\0€\0\0(\0\n\0…\0@€\0 ø3B€\0\0<Àw\0z‰?”·½_€éê¶êNçG®ª¼eæŒñ\Z‹Ëİ—¢‹>`µc÷d½÷¥õ¾¡ese{MTµ¹¥*5 úJXkñ>Ö4ºúßéNR­iq;y7ß•ıïí,?™ÇR=_¡ğ]lÖÚ3ùÇ÷\"ÛYşM2m4’Ùö5)f1ÂïĞ®-¤–<ÙÇ/»†×]÷Áª/içrjKúü	Ê›–_È¹I«İøaÅÿ\0è¯[ês›z}H«køùÑoùÌyÂO›ú®GÖ¹‹IÆJQk*Iå5æ…¬ªû\Z©vk6Çsé_\0ø¥j\\;.»Ÿúî“ûÿ\0ÚÚ= ı\\¸ı|ÎºVô|ÚcşµVSocjR\r—<÷=1ÏLµ9nÊ47‘kŞ§>WèrëcˆêSìú˜j%º;\0Ì´@\0ò\0\0\0\0\0\0\0\0\0\0\0p\0u\0ã¦ƒúsÃ»ê” çu¦IjTVòäÏ´ŠøÓs_\0J0œe\Z°ŒéÉrÊ2YROfš\rÒóKE£¼>Ì\\2š’{©.vkähxMa%±ÛñV….âcD–y,n(¹4Û£$§Iÿ\0rI|S:z“…7ïI,ölóã‡ít¯\Z•‹ÇªÆX’OoŠ;-S»Ñõk-WK’WÖUzY{O´ ı%âş\'Uía•‡—ènÒšmïÓwÕë®%ö¿kœC¡XêúsnÖò’«úÁôq~©¦Ÿª;ç¿ä÷ÅŸ£õŠ¼5{8ÆÓPnµ›k\n7	{ĞşÜV~1~gĞ‡jÎaøíŞ„íõf“ÛĞ\0\Zy€\0 PA\0\0\0\0\0H\0\0\0\0\0 \0\0\0\'pì\0 … \0\0\0\0\0\0\0\0\0 \0\0\0tüdÿ\0õKXÿ\0áf¿¹:,IğÖ¤¥¼]Ÿª7OŠİ¥ÚSÚ•?êÇò<ßˆ:5ºÿ\0Şbş‰³ÒÃîCú«ò<ç¬èôß¯É–Ÿ[áv\\4ó Ù5Şóf×EÏ„õˆ®®Ò§änpÂÆdŸhµÿ\0Qÿ\0³:·ÿ\0SòøàŸ…ØÑ|Ô)KÎ¨Ûµÿ\0ªÛÿ\0»äÃÔ\0\0”T–ë( §WĞ4í^İÑÔ,íîi¿Ù«MI~&+â¸~ùN¦”ëé•_EJ\\Ôÿ\0ºó“3P:WVĞÌÖ!ë¾ñ.—9JÕÑÔ(¬ÿ\05.Iãú¯gõ<ş›WSáK·\ZWwúUÊëNY¦›õƒ÷YöÅJ0š÷’:mg†´íZ„¨ßZQ¸¦ÿ\0f¤‘Ò/Yù\'X`=Æû½=Â­M]Ã):”cË$¼ÚèÌ¯Âş)pş¹É\ZĞ…i²«ú¹~\'’â_4K¾yé±«cQçÆmÇ?Õf*â/¸—G”§b•ıò¹=Ù¯‘©¬Oc0úæŞúh§¦™ÊRO£>&Ò¸ÓŠxJº¥:×4”:ĞºO‰”x[Çkzœ´õz¡/ß‡½óÔç:^Ë™‡Ñ ñºèº­5+]BŞm®œé?£=%NŞª\\³O=ÎsI‚-y\r«	tf´óĞÎ\ZP\0\0\0\0\0\0\0 @P\0… \0\0B\0 ‚HR\0\0\0\0§¹Gp¾€\0\00;€@~`š•».%Óø‚„$©ê4•\nòIáU§Ó/¢æƒ^¾áô±ã<`á×ÄŞê¶”b¥wB?lµ_÷´ıìisGûF/‡«e¯äkÖşŸÙòI5ûùÑYIçàë´úéì÷ƒIÇàÖÇgÕ&–Z<¯Üñmáúã ÆÉô^¡çŸ£xYíÿ\02õÊ}û qiÆ1Ñ¤û÷ô=qßëv:½”\\ëYÍ·I?ç©5Š”ß£]<šO±çä±¾ßM‹oQÂªI<6ŸÀ±8rÔÒJÍmÚ_jYêÚ…µõ…eZÎê”kQ¨¿jY_??S_6æğ\'‰RU¸næ~äœîl[v]jÒ^<ëûFaO;ı;rŒ¿»Ğ¾¬Ò\\˜¼”Ú†{›ñMšyÖ,ÜI±‰™©æ#¡¦&®æ%Ğ\0\0\0\0â\0\0\0\0Ø\0?ÀÀ;€;€\0\0î\0)}Øêz\'Ò¹q¦Ü?é,Î“ú{Eô0…æVîQ•–İO±|Má÷Å«é”£›¹RöÖº¯Oß†ÿ\0ƒgÏ^éÚ>¹¦^ÏS§NU•Z~ÎºöRJP³•œI?ƒG›q©åG8~‹Ã7	¦§X¯·ÍŒ^‹}×+ø2+;ú9Ì\'Œö>‚ŸiuRöïàºşª¿:ürp+xyoÌùoïh¼n¥oïøv<‘âQëlßg?ŠĞÃZukÊUá5:´*BQ:‹)Óœ^c%êšLû\'ÃÎ(§Åü\'gª¥]<Ñ»¥üİxí%èŸŞ^’GÏÜEÁ¿£t»«ØjJ´hCT§oÉ)G8xyk;£•à®âØÚİO—MÕåj­¥ˆW[Rz¥»ƒøÇÈõhî+©÷¡ãŞí´µ´fú3™‡Óh°Ú}P=OÎ\0\0°\0\0\0\0\0\0\0¸\0\0˜\0\0\0\0\0\0õ\0\0\0\0\0\0\0Hyş:âİ/‚¸~®­¬Mò\'ÉF„1í.*>‚óõì“lÇ[Õí4[/´^ÏïIB8ï:³}#İ_ñM\rEÒ¶Ô#NÏQyióæ5=\"üıçÏºOŠ¸‹V­yÄàå9¿a\Z}-)ôTâº¿7.­ú$iSS¶£­QÆVê<Ó›’J;ánú~g—WVÔ¶0ïM(´3—@cş	ã?´b…ë­;µÚË–XXÚyêºâ~›™¡Ú—‹ÆaÊÕšÎ$\0d\0ey \0ÒçÒrŠo¢Ésê†)2¼À¨âÿ\0ı˜Ôİÿ\0vçSÅ¿û7¨&ğ¹_ë#Tø¡-ÙÛ/º¾óœv³£Ğ_ûÄ&z5Ò?yn¨PÓ-)U­N5ê\\GÙÓ“÷§„ó…üKO‰-ğ»N|Ú›ó‹ñ3sˆ×7ê‹ÎÖ§øYµÂ¿û=e•u½ş,äk«:¢»}š§øY#â\'áoØoajüèÃü(Ş8úcÎ™düèSğ£e¨ì\0\0\0 \0\0()¬3b­­:‹x¦rbÓ_\\á=;U¥*w¶”«Eö”rbn+ğ3Nºç©¥T©iUçeïG?è\Z%M>¨í]iìqÇX|UÄ>q>‰)NŞj¥Ú•Ô¾Ÿ«ÒøÛ‰øbº„êİEEïN®wÿ\0(ûzâÂTÔ¢ŸÈòÜAÀÚV¯NQ¼²£S)îât‹ÖİÌÏâŒ°ç\nøë¨CS¡8K£”wFdá4²ÖèÆvÕT²³æ(âoôú’].u-*o…Ú<Ç	q—	Ös°©:ô`óú½™®nÌçÙõı¸M/yˆÎ/¹ò‡âî­¥Î4u«z‹•¹,3+pßŠZN§bæ0“Ûx8ÛKÙ®SÙ`§Cc­Ğ¸Špš3´§w	®§9¤ÂÅ¢\\ hS‹èjÎLa¥A\n\0B€\0\0\0\0\0P\0\0 \0\n†^ı}Èh\\€\07„ÛÂKvbígÆ®´×+i6<ÕêR›¥;Ú¯’ÖEÕ6³7‡•îÅïß¹\'¢Äfq¥ÔÑ^­+xsÜT§Js’ŠüLQÅw\Z%%âgé´*G*ØRI­³)Ï›?$y=B‰sRUo<Váê³ëÍR\n³ù~´ÌÙè¦„OÅ8ı%—u®;ĞôªMªò¼ªºR·I¹|ÛI}Lk¬xÙªEÉiº%¥ŒcşÖò¬«5ëˆò¯Äó³áIÇš~(èĞyè¬cİfÍŠö< Õ­*l×»¦©~Y1kËÛ¥¡¶‰ûÑ3úK_â§:ÔÜ:’rıZÄVdÛIynvtœg½Úkª=Ö—aáLno#¨êšŞª½¤eF­•¥J4Úåße»÷³åĞì§kàûƒŒ5!µmu«\ZØ_ÓháŒú¿EöúÄDE-É\'ºËèiŠo{-Ù–4O´-rÒòïGãhU´·Ÿ,«FÚ5aN*<ß¬räåxË}’7Wƒ“º‹ıÆšôû\'oÙ_r¬¿\"ğ–šm¢q3?Ib\'·yf‰¬}îŒ©sàÓşgô5Ï|Ó»?ÂTÿ\0‰ÑÜxaÆ0ö¾ÏE…Ó¥7Ne¿£7$\Zmo‡Ó©xÛÙ¸ßííÚğóš%å{KŠ¬êû+ª5#VL}ÉÇî¿àı>¯á=VèZ­´y#qÖRÎôª-§ğyù`ùpOÚÖJ·\rë0]Ú¶ç_X¶z®\râ­g‚gsme\Z7S©k}Ftÿ\0X½Şh·Œ6°Ÿ^ˆé§y¤õìù¾%·¦ò\"t¦&Ñó}\nFüc„b[o§”®´JI>ôî[üâv¶ş.éRi\\i×—ıÜ£/Ï_:²ø³á[šşHHÕŒŠœ5<{I^Ñóæ£”¾8gemâ\n\\aCZ£œbp”_â‡8ŸW+m5©Ş“ôztô8£@®Ò¥­ií¾Î²_™ØÑ»µ¯üÍÕµ\\ôä«‰ìå:w¯x–ø*ŒšÊY^Å®©ı\nÂ\0™@v\0\0õ\0\0\0;\0ˆéÔ\0õ\0\0@\0\0§†šê|…âÓĞ<AÖ´ÿ\0ckR«¾µN+\noy¥·E?h°¼‘õá…ÿ\0”Îƒ9é:OR§.k:¿c¹i²ª×$›òEı·æbñ˜}Öòµã=§£Æu(¼SHR¤¢¿³96ÚŞ­mŸ²ë\Z•$ó„®fÿ\06üj‘ÎSIK|›Iá6½<Ï?\nÏx~·„Lvw·U®İXÖ²»Ö.îmkC’¥*­J3YÎÙê‘Öâ!:rO’kÃÃ_…Í“èÍú3–|òX¤W´\'—ZÇH}eá¾-á\n3»œe«Xµmy‡÷š^íO„â³ñÊì{sä¯¸±ğ‡ÛŞV“ZeÂV×Ë²¦ÚÅOŒ$óıW#ëW³Ù§ê»ŠÎaùÛy\Z³ÓØ\0ÓÂ\0>\0\0\0\0\0\0ø€\0\0\0 \0\0\0!@…!@à’÷`å6£ûRx@RMßèvs”+êÖj¤Vğ…Ny}#–uõx×Læå´¡©^?û«Wõ›Š&G¦•]WêÚC‡­ÍÄSúA?Ì•õmftó	YÑ}=Úÿ\09ËÖ?&y\r\Zÿ\0T¯§Ò–«s/µ\'(ÍRŠ§‰4š]“X}N\\ªÂRÅOk9/6Ùb½”cÖI|Y§ÛSıôt°“ÿ\0gB£_Z©=—#RéŒ—]·¶§¬ÄwáEçë¯Sâ.­J4óNÒÊÎÍ{+jO²s—½7zxYÙa$’Èµ.éÒx«^…7ı:©\nœE¥Æ¼hËU°UdÒPö«-·…ø–:vL±½—òyá*²¹Ö8½H¼æéÑOéş\'ªÓ<(à­>1OO½¼Q|Ø¼¿«V9óåæåÏÈïµ½VßI¶…}B­jt§.Eì©¹·,7Ñ/$÷<Ín<Ñ“Å;mN»óqŒ^{²Mc9•å=Î•£P--6ÑG¦%e™ÏW‘„c8Æ1XItHğœ=Å¶šÆ­NÂ^İÕ„ç\Z•+ÆIò¤ÚÇ^ÿ\0ŞJµİMR½¥¼­éS¥\nræ•\'9K™K=Ò[ÄDDvI™w²½ßzˆÓ;ÇË•Í/C©¯g¨5ÇP•9¾ôèÁeú§“£ğûY¼Ömõ¨ÕöÕhÖŠ‹öjƒ]6Ùîæ°ÎeëşÓ^_rŞ£õÊw™şn1^m˜WŠªê?¦u-FúTéÜÎ‚¸šŒÆKËsÎÒu)\\*”n.©ÔOj‘¯>o®FĞóç¨á*sB\\É­·91¬Òİ¥ñgŸà½B®«Ã7—2æ¸”\\*¿9Å¸·ø)±z—\rê¶0Š”î¬ëPŒZÎ\\ Ò_ˆî½äk=°òëİUYà¼´¾Óü=Òí5[+‹ºN¬½Å>IB*o—l½±ÓĞöÉàŠå*ÌMÆ¤*F3ƒë,§ò6Ø¼ÀrLŒ+p~›¬Ò©«ivwZÅÌ=¤{×pO—›-íÖ:£Ú\'™(¦·ØùêöÆÿ\0‹xÿ\0XÖé¹}–¥_³Ûg8\nk–/Í©KûD‘Ñc=YkNãŞÚ•½½•İ*0XŒRå_ŞÉË¸ã]æÖµ\n²º§\ZĞ•7ú§ÖCƒ¥\ZqÍiE¤¶QÙ\\)S™GíÃyŞc}¹áì§ñVƒNÚ…½+éb•8Ó^Ò8Kí×c²§¯iU:_Q_ÖÊüÌmK….#•ìŸõ©£‘O†îàò«Á¯êcø½ìŸwÒY6İµeú›Š5?«4Íî½71ŠÑ.é.”ä—u”r-•Õ«åU+ÓÇ”Ş\n~LŒ\'i©ßAï_yT¹µÔÜ×ëérÿ\0J/(¸g.Ì2RŠqi¯CQ\n\0\0@\0â™@3¡uHá\\é´ª¬J)˜hÔ^a&\"^_à]3SŒ¾ÑiJm÷åÜÆ\Zÿ\0‚ÖÊ¤êéUªZÕí…˜¿ŠgÑ’‚hØ©muŠgzë{³5ÇgÊOãN¨ıŸ=Í¼_Z{å|sÑh,Öµ©\Z:Å½Z/8æåkTÌóu¥RªaÊkœ\r§j’­kNM÷Kğ7¬¹âa£Aãİ;QŠöW4äü³†¾G­´ÕéUŠåš0¯á\\í¦êiW5)aåA¼¬ö:ÈO‹8uòÎS¸¡=ŞÒ\'±Êaô•;˜Ëº7£Q3hŞ%(b\Z:”dºû­£ßi<YiyéUŒ—¤S¤Ôj=Â`ê-µ*uRq’g:Ìdºœæ“‘hr·\Z‰šÓLÆ@! \0R\0\0\0\0\0\0\0\0\0P)\0”hEî@|Á\0¦>ãO¸CŠåusq§+-R·½öë\'ìçÏ…‰Jr}?iy÷y2(X™‰Ì>EãOäıÅ:<ç_Aû6½fŞÂ1£qı*oİ—Æ2ù#_P¹±º©k{Bµ­İ7‰Ğ¯MÓ©äâÒhı\Zlé¸›‡tN&´vÜE¥Yê4¿gÛÓNPõŒşô_ªhçåG§GÑÑñMJt¿X~zº’K¨¥)Jj1ov}5ÆÉÏG®¥[„õŠÚm]ßÙoóZÁM{ñ_c\nßpN«Ã\ZÜ­µê4éT„y¢èÕXÏ}°âöóßs–¥f½ß[g¹®êñZËzÆ”¨ÛS†RÂË9N£§Ôd×’{ÉöKÕ½¾f„—/¢ØÈ>ğÌuî2…İÜbì4[ªœÙåu_óQ~‹oú¨ãXå8}ÍÎµvús©>ï‹ïíø[Â=+†4ëÊUõ_ßU£QMF*_ëmlyicú,ÃÓ³µ¨°í(F/lò$ş§£ãÍ~<OÅº–­AGì“ªèÚâ)%B\nX]äó/™ĞÇyâYYÛsVœË†Çoåhò·Ån³ú­:	ÆÖU¨åô¥Zqøì™ÛiœA­ijpÓ5ÍNËæJ•ËŠ“ójYÜõ^ğU>\'Õ..õXJZ5†éçh­%µ6ú¨¥¼±¾éw34x„©QT×èÒ‚Îõ-”Şş¯,éM9´eówŞ#·ĞÔ)§)ış¸Ö’Ä8Šú¬<êÓ¥?ÅÀØ‡ˆÜc«Ñ¸¶­qKS³_«©ÒŒ9sÛ™,goC-qp%\r6îöïG§§Ñ·¥*µ+XVE-öYåÏÈÁü)âî¿Â–oOĞkÆ\Z_¶©Z.¨Â¬—;Ëæ’IÉú‰‰‰ÄËÏ§­¥¯´4â&•«\\FšöÚ=òk££8M\Z–³›«e¨Óï™ÛK‚=%§ò‚¾©ÿ\0Úš‹w¾ï’¤ÿ\0;*2ğ…Ëÿ\0ÒF-şÕ½hyúÆ#Œ{½q¼×ú¼<T8ƒNO•Ş(4ºT„ ÿ\0o­bÒ¦ñ½µ“òöÑCßPãï\rï’u4~É¾ôf¦—ÉT‘»RëÂI~·[¿¢ßÿ\0×ZJI}iãñ\'ú¯ó|TŸ£ÂÒ¹…UˆIT\\-ÿ\0v-S^ì#ùäG¯‡xs¨eXñoÉµ²­I¬ü\'zŸ„Z}ÚrÒu¼¿÷MF¬såûSDšÊÇˆèOé/#o¨İQx¡wuEô\\•¥|0ÎÚëöïõ\ZÖ¢–^«ócê²v—ñ%›eq=ÿ\0Øê4æ¾“¦¿3®­á¿Ûó9QÔYşr•*ŸşM“ ÎÖş±?G6ßÄ~* ×ş–uÛhÆgcoâÏAûëN®¿§IÇòg¹áN#µiÎ•H¨§½K\négãŒt8³½£)F´­”–s™û?ñ`±ÊÊÚj~e+o54’¸Ó,*<³çæv4|c¢±öKÍÂãú£Ó§xåîĞ…OXV„óôdšº¤¿[cyN8êé<?™yÛİ™ğı¥¿:ĞñwC>Ñe¨Q}ùTj%ôyüÆßÄş­Öòâ–VYm5üœİän^Ò-wphÛZ¼¤Ú¸‡2ßïa—Ì³œøFÚİ³õ}AoÇœ+_jzåªÓRæÂ‡èUåŠ:Ö›6û+˜gó>X…xIf5”ŸO½Ÿ‘¹™7†öÎRåØ¾l¹ÏéÏkKë:76õÖh\\Pª¼áR2ü™¿É/&×™ò<%:xqN/Í{¿‘Ê§«ê7¡wI/Ü¸šş%ó¾N6ğ9ü7ıŸVò¾éù‡\Zq\ræu»ì.ŠU\\—âvV¾%ñ=ÿ\0‰º©cjÔã/É\"ùÑìã>	­¦E[ø³ÄTÿ\0†›Y.î„¢¿vt<b¾Šÿ\0XÑí*zÓ«(~y,jÕÊŞ¹HŸÕ™\nbº1ZËjÚ-dÿ\0îî\"ÿ\04v4<[Ğeÿ\0XµÔ¨¬ıåN3_ƒ/™Wxvæ½é,†CÈPñ#…«-ïêÑÏOkBK?uŸ8KHÒ.µb„èÛÇ.4İJ’vXŞOÿ\07„™®Qîãm®µzÍ\'èàxËâ\rø]×¦áSZ¼æ¥§Ğ’ÊsXÍI/Ü†S~o¹ñ’âaÛÜZUÕïêÙİÔU.(ÎâR…Y©9sJ-ã<Ï?y#s¸ÃPãN%¼ÖµGŠÕß-:*NQ·¤¾í(ú.­í–Ûîyl³­—ÓÚiFŒE¦:½•­ë¯I&ğölÜX¨æPä_‰ãé]Õ¤Ó„Úg6\ZÍÃ&ù—©!÷©½ÒŸ‹£»¡¦FMJ­xµıüÍv÷ÔkTp·­\'Ÿ¼°×¡ç*]P­Ÿi\rı:ääXÜ[Q–a)Açêk‘¸‹_Œ=m\n™xxœ0ÓŒº<õGÓñgéz%íG-KHŒc\'½kWµ9ú¸áÁÿ\0U>çÊÖ·Ô{V†ß&f¯ä×;ŠœY¬UµÓ~ÑĞ¥B­ôê¸BÖ-óN\n8|ó›PÂíÈò×y^’ğx¥+}™ô} \0;?.\0\0\n(\0\0 …\0\0\0B€@\0Ù­qN’÷¥—ä·eÆÍÍÍxæ¬ğû%»#­¹Ô*K*œ”§_©×Ëšmõß«êØÀä_j·c([¿³ÅíÌ°çÿ\0%øvãL§s7;Ÿiq7ÖUæê?Çcº,šÕ-ŠËÌŞS²Ò¬+ÜÜÊ•µ¥¼J³ÂŒcğÿ\09<¼\\áÚrÅ–ªŞ/ŞQ…üñÌÛ=‹öR¸ğÛ_TóÍ\n«·xÂq”¿Ï©Y¯yõOç·c3•®Y^ŸŒT\ZÅ\Z¸^µoé¥øD÷¼Äñâ›KÚËìumjFŸµö™Œ£•,ác£Xô>xµ¶Ä—¯™—¼’mn’–[…	ı×ñ,%«†S§Œ´b\'â}vÓ\\Ômij5iR¥q(B©Æ.Û•g}ş¦YÑisÄ+uK‹õ‡S’«Ç¬Rá7õr—XõÍbµDî5}JK=>Ğãù`Éœ1V¦£áäãV¤êWt.)Ju$å\'%ÍÕ·—ØÄ‘ıÒo6õ2¯…Rö¼;sF[ò^TÊI?â)¡F—¸ı¸Eï³å^hî¯5+™i4,sN6ÖsjnK.YÃí…Øé*P”+N1S\\“œ:6$×‘»TäœgJ£Êiacªø_Äo×ğ¬n!,{:Ôªåy=ŸøŒU:1ç“•e´ºuÏ©”µ®ü1u\'»„*½ğó§üc[Ùe~¦MµŞy{úàŠìø.¤m8·I’Ÿ7=WE¾Ÿ~-/ÈÉ\Z½z¶ºÔ¥EâUl›[g.:}&b&¢¡©ØÜ(µìî)TûÙé5×ädëV±†}i*jj¥Kg)C™rÎÎ>0\"Ì8<=ª^jükF²•zvºu\ZÑ¸S“Js©Ê¡±Û—›ÓæiğıF×‹8Ê8ÚrJ™_„Ï.ø·Z£Z¤¨Şiôı£\\Ïì	Éí¼ŞÎÏÃÛ¹ÏŒãVæº«^ú•WR£J.¤’‹ÎË§à2¼eµÆ6Ò‡jK)B¥EUíçÿ\0Éjµ5Óš\rGl/?<ÇÄ¹F¿ºÔ¡7V!ÍI<©/Wje+;ÂÚÜÜ3V–[tnf¿½ïÙE)GtxRû¥8´èÊá$ÓÙµ™í¢×2÷Ò]×™ kŒ#¢’F¤m¹.dÔÖ;£yS›I¤·ş’(™\ršjş¯ÓÏMÍÒ/ö“®â{ÉYèwS¥,V©cKúÓÙ}3“ƒÃzU+>:qIF)tò\'?¶jÚuªŞ•5+‰z¿»âw–°å¦— OR4V:w”ëC’¤#87¼_tsc5\"ßLqhØÛÑmÒ¦¢ß«™ÈTÒìh¥woVJ4êÆRòİ„€Ğ©§±¦¥¤&·Š9F¸uSÓù~á®ŒeMbGl–z¢NÚ3ôø\r:~_´kh˜i§ÓŠŒ5– )0\04<äÓ*ŒãI)K¢óP\0\0\0‚ˆÒf‰SLÜ\'‡VÖ2ìu—šE*Éæèwæ—Î•Ô˜fko¬ğE•æ\\¨E?4°ÏÀuí*:–g	y&÷3´è§ØâU³Œº¤Î±ªç4`û{ı{H’~jñ_µ(aıQèt:‹’ÌeMù¼îóF¥U4à5©ğ•\Z©ş­uÊÛ¹Ò-[1‰ÎïOâ\Z	rUOàÎê†¡\n‰5$ÌQqÃW6“nŞ¤ã,ç®?U¾£©Ù6ªÇÚaãw†×a:q=–/1İ˜aqÜŞU1½‡¬¨ÖŒ¢óÜôvZİ\Z±MM<úœm¥‡H»Ó¦™N²ìd–Ç*ÓîršL7rA¡TLÔ¤™œJ¨\0\0\0€\0\0\0(¤\0\0\0	ØŒ”RdÒäG\"á2ÕÌ.fÜçƒR·©¨«3fõJ©#…q{ÅîlİT“O•ît×ÎM6Ú7beÆ×u™Å:tc)Î[,v>oâİFZ¶·uZsrJn÷^>¹3ŸŞÇAàíST‹ÅÊ‚·¶ÏzÕ}Èüp›—ÈùÛ–4Ú¦²ÔI¾èñîg¬Cõ?Ãš9å­1ò‚R8ÊsŞ1MË~e×ùü9ğfßIOÙñJN¼¢·‡<S«×÷)¸ÃâÏ#àÿ\0>$ãk_mOšÆÃ—|I§úªyé—=ß¤YÃñ_‰ÿ\0Òn9¿¹£7;+<ØÚ5z0oÚ©—Ÿ$55Ëéîõ[ªíãá¯YşĞò*08Ó¦¥Ëò¯Dr´ë;›ëÚ¶T½µİÅEJ…?ßœ\"¿çä“8´£ÌŞşóÛ&hğ†”İ~*º§ˆ\'+]62ïª×_ŒÂFi^S‡«º®×Fu\'ôüÙC†4;~\Záû=&Î^Ò6ñ~Ò«ëZ«ŞsÓÑ#—s5½ÙÈ“ÄrqèÛ;ûÅFYöKŞ©ğòùøŒFÏíy½¦Öï,#âö³k¨Uz-jô¾Ï§^3Ÿ\"œ»G;gOnø1—ú\'¥VNPRIçnoùŸnV£J½5N½\ZUi®œ’ù3 ¿àn¿rw\\9¥JRİÎñ§\'óÊtó=eßOq}8Å_Uà»>KËšRíÍ$ºYğTòı–§EÇ/Ôä¾2}kyá?\nÖÏÙhßií÷µº–ûû³æGEà½¼óú?ˆo)¾ÊêÚ_«+3åO£Ñ_Õ¯«åúœªEşª­¥E¾ş×—§ÄØŸq\'I¸¥–éWŒ—Õ3è{ß8Šœ¤ìõ\r\"ò”åRŞOå‰¬ï‡œaeï>«]\'kkš5_Ó)şf–‡hñMOV©k­Û<T¶¾Xêœ¿#;«ŠYW6ñ~~Ò‚‹_<zò×WÓeş¿¦êö}Û©kUEi,j±¨ã´ÛÔ}9\\ ßÑîfk1İÖ<S=ëñ\\;­*ú½½Ş¥w§ÛÊ[ÎÚ´Óø/}(¶û½‘˜8{Œ/ã¦ŞFÙë6ßd¼¶£F…½ßÚªÍOŸš¥YÕO.TÚøÙ3ÊU§oUbæÂÎ¤ZİNŞ>HÑ+->§²Í¬)òI8ªs’XòkÈ‘3˜ÔİWS¯2¢ãî ³ÒµËï¶Z^CMoc	Z¨Nê•)%:TåˆìÛ[4Ü^1Û¾\\g­Êé[ÎÏB¼ÌéRRûEj~üúÁ©BXk®ıVë&†•¦)FQ£^œãDéÜN-Eå5Õí»7ãd©)}ŸVÔè¹T…våYUÍH,FOš=V^lšçhqÎ”÷†`¡ÅšF±:0Z…©B¿µQˆoì¢¥7Š”¢ñ†°ûìÖÌ×m>¹­(Ã…ªÒ|ñ§)[U§ie¨¥\Z‰·•Ñ.èÄ.ù‡.©	Æš«S­iûHòÉ®VšÊI|¶6í³§×¥RÎêŞ·”ïv¦Û”áUœ·¶:ü˜ç>°±4Ó1úË$j:§‡”eB75¸ŠÙ×§í ã\ZÕ\\òƒÊ’–\Z”dºvxÉÄ”¼8¼iRã\ZÔ3¿-åšI|[¤¼üÌ3Äz^½q+/²Z]V§omì›¤ù°İYÍ¥İıÿ\0ÌóÕ!­ZO–­½õ\'Ó¦Ç(ğúZåX˜Õ˜ı_DÃƒøOQú7‹xVåµ÷jÓ§ztšüåá,ëÇšÇô%Ô%şÒ…õX7ğII~\'ÍSÕîbñ]Á¿*´Ön[ë*”Ô£oB2]é®Gø5zcK^>\\şúëÂ½fÚ/“J¯5œæ–£ü[]Çë4—¿§ktÒïxU_ƒf+²ã}FÛ•ĞÔuz-cÙ_ÕIÅüöÇÅ®$´åö<G«¤»Uœk/øâÇİ\\îëëôUøfúİş¶½ä6İ\\éµ!—ßt±ƒ‹=6öœ}Û½38xUªÊ”¾c¿™¹kã¯RÂı/g]yWÓá¿Î.\'oGÇV¤Z¿Ñ¸zş?Û¦ÿ\0d1_uó÷UïHŸÕÒşÕW½ökzĞéÍJê›üÿ\094ÎÒş’n®™v—œydºú6zx¿Ã·Î§ÀO;Jvµ`ßOX/ÌåQñ#Ã;†İ^Öí&òÛ¡S8o®jÿ\0ÃŒO«_lÕ‹Ngu§ævõáÙ©R—ü½\r0Ô-Ó¬Pô—ºÿ\0!Sâ_¯$=[²oµj’[y¸Kó4]Üğ<§\Z–¾!STöÌemaç¯İ[`qj<F“Òk1ú<KêÎRU©(Æ.OßÉnÙ‹¸«^©«İ¤-(åQ1×¬Ÿ«=_ŒZí„u£h:•¶§iM)Ü_P·5R]¡·iwyİ³¹,uÜD8î7‘©^4ì²–Û\ZrLç©q±§ƒ\"[8amÈ÷ø•‰jK¶Årä]w4çËf»jr¯Sh¹o„’êÃQ3=!ÎÑ­«]İR¥9JrI$}_áh<ÁÖ\Z<t»ÕRö·5hòÏÛW’Ìä÷Ï’ß¦[#	pîq¤PUnl®ÕÄâ›jŒšŠòMÜn¨ÒÇµ—³ß\rT‹‡oT‰6ö{£gMM8®£è‹øj¯ßwÔ;ûöííògaCÄ¬ùV¯Jò©Nqkã±ó\\+Òš+Smïüâÿ\0æ©É¬¯=ãÌ³œø>„ö™‡ÔvüQ \\cØëZ{o¦k(¿Äìè][\\/õ{›z¿îêÆ_“>J”²ß¯§¦\r—)5ñ_Mú—Í—x-\rß_ò7ÑgàNVŸF|Ÿk©ßZãØ_]SK÷kËmş9;~0âeúgQK§½]Í}/›òq·‚ßÒĞú|ˆùÖ‰\\UI%V0ºTµŒÊ‹|EO\n¤4úë;óQqÎşŒ¾l9[ÁõãÙ†(xÉ~£q¢ÙÏÏ’¼£¿Í3³¶ñ’Ò_õâ8Ùû\ZÑ—æ‘|Ê¹[Ã75ü,¨SÛø³ TÇ´¶Ôé·ÿ\0u~R;\Z$ğµW‰ßÔ¡,ghÉ~Y,^³êãm–½{Ò^Ä‡—^ ğ£o\ZÕş\\ÿ\0äpï|Ná{h7FêæòKömí¤ÿ\0a~%åÆ×ZgIú=¯S¤â*Ğ¸~-jú¥­½^Ô9ÔªÉã8P[˜ãQñª„eR48~îP]%RòÏÑ3Çj>3Ú[×œésr~ôª]E¹|_²Ë3:‘èõéxNæóÖ’öºß|1hçc¨TŠíF2kàç•ğÁçŸœ=RO“IÕ\\|åqoÁËø\ZèN«à\r>ïÚÅş>ÈçÇÆY¿»Á:/ÃÛ¯ÿ\0Dcœû½ñás^ú3ÿ\0\'kKÇ’÷´­O×Ïÿ\0¹ÿ\0N<2Ÿÿ\0fê›yW¶ÿ\0ô‡Rüb’Çş¥hyÿ\0ÿ\0üJ¼]E™p.…/xÿ\0\Z#œû§òÉÿ\0³?ò‡sx^[+\rgåöwÿ\0Ô7#ã	íÏm¬C?Ñ¡/Ê©Ñ/ìä¿YáŞ‚ÛëúÚş„Ô¼GĞğı¯‡Z/¯+¢ÿ\0:$ó\'ßö?–Gı‹Êÿ\0ı2pEÕ9Q¯úSÙÔ\\²…[u$ú¦”VZ^V¯\'§k¼CenŞcB:k©zE¸·©Ü¿ø^{UğËLqóŒ­\ZÇÿ\0-3OúmÀu?ëĞKÎ0¶ş8,ê|ÓùlÇmıcü8¶Öş¨®n*×bó»©¥TıÙéxSˆ¼=á»š÷¼WZ´ëÒ\'ö›Z«•)9mŠk»îtuxŸÂêü>¸¦ûû:×ã\Z¨ÛZ÷„•#‰ğ~·Ey(M%ıÚå‹üØ·†ûéßö{ºş,pM)´¸‚3ïîY×—å¢ÕxÃÃ}jïíW|Fá_’0nŸÚieG8ÊäÆw{úz:—ƒ’ª±Ãzî^%Ì£_mÿ\0ßdßu|¬±;n! ¼š»Çø™®sé$øvŒw¥şçFÿ\0ÃÜ¡Ä“óõxçëwÚğn‘F¥=/ˆô…Nrçjµÿ\03æéœËCÇ}‡Ájõ\rfİ½·Wø©¿3¬hZ[;ªzÖ½R\\Ê4èFYÇõé¬ôcœ³£=&/ÿ\0şŞ¥n¼«R¤4Šó©\'\'É¬(åÉ¶ÿ\0kmÛ*ÓøR£g·²¨÷Ç²Õ³Ûn•¢XxY«ÜF‚â}BÂMá;Û\n‹øÉÁ¥óg~¼5à)>z\"i[îœãi·¯TI½™ûÚ>+Z?ñ{ºwÏôWèë{5RÍÒ•%Jã/qå5”ÛîÎ¦®‰m$ä¸jµIyûZÒoç“ÏPğ›†ªÅ+´¹aç1…	~U½Nl|!¬¶Ó¼@¶\\(Êp_ğ×óìÄí6ÙûºŸZË•SK£MóG…¯[{HÆºÛ¯T±ÿ\0ë9:¦§©ĞT/´›Šô¢ò¡*SÂxÆs&×ÔâÇÂ.ƒæ´ã¼Ôè¤¯.¿%6o/üU·kì¼jªÓò•İÊñFC•½™û.o2?X˜şÎªvisrpÆ3Ô*ç¯—6>ZV7”î´ı	Ğ¹„”•Zp–SåkÏÕ¯™Û¢ş1Pû¼CÎ¿øèKüt\r²ñ„°«R¬—yJÊ_š‰yO±ZGXÔ¬ş³şN­KWÕ«Ó¯}¥×­Vœ=œf©<¥œş÷MßÔâ-û•ãJ­-ŸäA\Z1Ò_¬²·­ÿ\0àY?Ê¢6å¬xµAş·…èVõvåş\nÅ‹`¤Şq¯ÕÀ£wÄ:e·³´·\nK/‘[7¿wñ4½wˆÜ¤órŞ_J|±ëÓ§CŸ>+ñ:\rÆ|KÇ<4Ú¯o<{VlPâ6ŒåZ·ÎRkŞrµ»Icm’Ê]¾&&]i¶´F1_ùC¤¸â]~5eRqÆÉÆ.2Î6ß)»á\"¯qV½z–’ug*S“Ër“mş&sÿ\0Lµª5ı­ç·<ò·´Áç>N›^§asÇ3°Ò,5kî«{éT§Jíº”\ZœgErçªßtHê[JÙˆã¤Ã\ZøyGRáÚUçRqZíFN”äÓKt±ñ=İ%ÔÔy•O›òÅ^U«èú„$úâæßòmê*pskš†©Mÿ\0º¡Sü5cİ©ÛêÄuÒËÖpuËÕh«šïõĞ~Í¼vëƒÙRŒR]ğcû?ø=Eæúú’]}¥…M¾qÊ;(xÁòƒpât—W:£¸u­«Ö_?Sg¸›LÆœÇé/j¹WDFã‡œ´ãNºÇ±âmMöû\\cùàî-ïmnVmol«¯:w—äÍò‰õy­£©OŠ³£“Š2ÙÊËf²SšŠN4ù¾x6ákÏï{Éù¨§ø›®•Hõ„×öYXÄÂB¦d“£Ê¼òn©CÈØyîhnyÙ<|9ŠQ5)DàsK¾Åæ’{gÔŠç©\"ó#¯öï÷_Ô×í%†ü‰…s%4–{*WNºÊ¶öÛûÒçÇå“b5%8K=P¨ù{—	—4UQ•UdÁ—\"[aùuy¹Üsg£XßÈæ*¡¸KïF/äXèKy<¤Á¦-$’Ù\Z–ıÊ™\0\0\0;³Q@€ÖJ\n48&lÔ šèrFL:ªöQ’ÃŠ:«½•Tóz‡š%I>ÇJê35cÛî[òDêji—Ór¦äŒ¡RİK9G½„dŸºv®«G·¿»¶xd‘ÜÙké¥í6gaw¤F]GQq£Ê9÷Mf¶g¬=¶«	¥ï¦v4¯#%ÔÇò·«BMÅµ˜-=f­ª^Ñåztâ{,_İ’!]>æìj#Ûq]9<4é¾üï¡ÜÚkpª–&·9N”·zÎdTÑÔP¼SI¦s)ÕO¹ÎhÔYËÜfkR1†”\0\0\0\0\0“Cf¬š*¯w(Ô$´ÊX6¥2³nHÛ	<´q¦·9=½M¹Ç?Â8ÒQ²í¹¥“˜ .®-ôû›ëÙ*v–´¥^´ßhEeş¹Á™`?å¬{]wLáûy/g§SûmÊìëÔX¦šşŒ¶b©8Æ.¤ıØ­Ûo²9ºİıÆ¯¬_ê·«7—õå^¬^Ü¹~ìW¤cË‘ŞxcÃ3â4±²œ¬(¿µ^5œ{8½¡ëÏ,Gá“ç^fö~ÿ\0mJì6‘ËÒ3?› ÁÏÃçY5Gˆø†IEşÕ78ìüÿ\0WK/úÒ0u¾9T(¬F)$¼¢¶_ï<qâXñÜÑ¡SÇINÎ—.9\\ÛÍi§ë$£ğ‡©áè¥z[G¯2ì–íü…ı¡¯\rÒµtç[Sâ¿YşĞîxSA¹â]~ÏG³rŒîgúÊ©1F+5*|–õhúÂÊÖŞÂÊÚÎÆ”hÙÛS\Z4×HÂ+	ÏÕ˜÷ÁıÃoY»¤ã¨êĞR¦¦½ê6©æôr~ûøÅv25F£¾8Æ_—ñïÚ5¸Wá«jâ¦#Œ6ŞÉ.ş‡q§Zı’ÙF[Õ“æ©%çåğ]“CÛ×w5iÓx‡¬»¿—Cºï¹Ö_&=Ïøä4‹õõõ!Iæ¥)tRS®Ô4]+Ræı#¥é÷|ÛKÛÛByú£°êÀ2óÂş¹”¤´:v³k³­Rİ/^XI,üŠûÁ´scªë’]¥8W_ñÇ?‰”	Ü˜‰î±Ó³	Şø+¨ÁgO×¬k¼í‹9Ó7µø÷…¼cgèÙYßEgk;Å?•L~gÑ€Ï\nû/+{¾U½áÎ$ÓÔİçëãó8Û:±_89ltÕ/£B³¥^¬iUéËYºrúKû\r6ºe\Z.)R¹§*w4©V§%‡\Z°RMzä“¥\ry’ù\ZSr\\¹©ÚƒÏâõ}V÷æ’Xi¿Àú>ÿ\0€¸Jıæç†ô¶ñËšt7ìcêtWŞğ½Ì³o-VÅcîÛŞÉÅmå>by~Ò“|°{Ôe8òÊ4¥˜8<ş\ZVÚefı¾•§Tm~Õ¼cøÇ\\»ğR.Rv\\GV1æ÷cse	â>NQqËõ<ıçƒ¼On¥+[\Zö+÷jT¡)yí%$¾¦f’±«1Úe*h;_¦‘\Zi¼~¦âpïó8Õ¸;‡ê¶ ï­óÚÔñõG³½à0³MÕáëš±óµ­N·àšÑŞØj:|sa¨ÙA<7qkRšóêÖ;„û;×w©­/7W€´ù¿õ}Zê”vşvŞ3øô’8Uøå,ÛjvÕ_\\Jœ¡·âzZw©\'W¥:™ÆÖ~™ÉºêÎ?yrùíƒaŞ›ı|üOSµÊiû?±ÖÇjw1ÏŸ|+â*1r–—pâºÊ’_4Ì‰ö™9nŞ0k…ÖÆØ}G£ù–¼GV%¸Óõ+eúû+ˆ5×4ÙÂ«q^IÔŠõm`ÍôoêÁfqÏLwgúq¹ås¥\Z‘M¾YAd½æWŸŠ2´åQåÉÉùç&ÆZ35ÖŸaYIÔÓ-dü¹1Íñhéî¸{J©6•¬iæ9÷vHeÂwiË\Z)îjŒ–k_…¬ZR„ªÁ=ºçs…S…!™*w-rù¬ˆ³Q­_w˜æ_2ó#½Ÿ	İ³«	/\\£‹_†u?všş‹5˜_2%Õ/ÖIvF\\ğjÏ†mn+j\\_\rQÂ¿aVPæJK<Ó;ıÜ,y˜Öƒ©F¦>ÍRMoˆ¬ı*úÍ¥(Æ¦q\ZqXêš[ºéâÑŒâ_EKRğöpfâı[Ovuí¦ğıS¥¿_3Æi\\Eªês¬­î´¾jOíz„-y“rŠåæÙìºvÉ‰çÄWTrªB¤\Z[¦ÜM?ˆ¼İ7×âj#/Fm§¿3–qáëŠ\\E«KI¸§£[ê-9B7ÎQª×jujO¾ÏÌôÕü0Õ|ú•SúVÕÜ;í³ŠüÏ›®µ«Zµ©*´”’ë•·S¶³â[{i%o}{jûûª´ÿ\0)+æêú[£(q\'[ğıJKXÒu\r.œÕ9FåÊœŸV“÷·ÇŸ©µsÃt­)¹İCˆìySË«KÜ‹Kö¹©c¾şñun$¯¨Ñ¥\nú­ıå:rç§›™ÖP~qæoÔôSñsŠ«iµlkk—5­ëR•\Zªµ\ZRrŒ–\ZæåÏG×#†V7z±Ó§îîªéöP“å×%?ö¶y^[HÓâ´y­u]2átO’pO¯–N\'x“­pÎ…ú3OZM{5ZuT/-ç)\'.©8Ém·—,6¿Åš³­]jµiØÛÖ÷(ZÓä¢¹WNW»ËËyß†SQ½·yG-XQnœtªØíOPå–>‚üÍ54n÷´‹‰I=ãF¤*ı\Z}7Gq_ÄN¹ÓçR—\0Æ…Ï³jœèŞCÙÆmlÜV3¾9£k—Víúæ§i¨eÇÙGKWVïÉ¶¤¥¿t·^¦xaÒ»ÙŸŠ%jÛ_Ğ_ëZ^©KìçŒçÊÏtÎ4¯í£7ÔP—îÍ8ãäÑë¸+[Ğn¬ê®$×o8vúOv<ÛÖƒI¦³†V2™Æân/°ÒµHÚi\\GjËØFr¸§Óm¼Åá¼á(½¼ğ8Î]«¾¦xÏôyØ^ÙËÕ»yÿ\0´Y7}¤ªE:PX½òš—åó2µ§_ë6QºÓ¯xoW¡V<Ñœ1%$ıy^o©Â»ğÆõs:ü£Õo/š×–/êÜIÆ[Ñÿ\0ssÔu_¶rOú[$rªP¯\ZP{{štä³	Ô¥8Âk¤Öëoü;ö4æåÃ\Z•&“ÇÙ§&£¶İ%%™Ã¸á‹yÙS·«uÆVöĞ*¡:µe\nicešFf%Ú»­;cŒÇÕu›Ê´kÆ<µÕt:¯²T¯QÎây“òØÈW\'¡Sœ§;ÛøÉgù÷%ßì¼µ¡hÃı\'ÕæRHœ°÷SZ‘:´)Eò¬y¤r#•İù£ÓÃHĞsÿ\0Ûoº§qe|ÍQÒt…Q\'W‘gŞö±oæfléË=^c—•oÔ*°Îj2]œ°ÏXôm-­¯ãõ#ÿ\03r…•+z”iñ\r(Ò”\\\\]\n–ï{®½SÈåæ=ZÖ2å²Ù7Õ›‘|ÊOéÔíg¡é1råÖ©w{Ô~œßÃDÓÛJŸÒõQ„[úä™†úGwDáÍ-ßOÀÔ©=“éæwôø~Îm(kp7Úƒ—åÇ:ŸU”T•ÅYçÆÆ«øô‰IÕ¤w˜yN^X½º~&Ì©9Ë	ûÍäöôøò¢÷cs%Ó²®³òå;Õh\\S­KNûT`Ût.ôÚ•hÏl.hû¯g¾ÍÏ³İèÒ3Ê>°Æ\\œ—PN->Gº¬äí®ô»«-2òº¢­u:.-Ü*)7MEó%Ñå¯Ä÷wşkú…ô.iéŒT}…¥J0~o–Rxo»ÏcvóÃ0ºÓtË/ÑôªPÓiÖ…´]HÂIT¨ªK-½÷[z˜™ôq¶ÿ\0JxÏ:Ç¿Xb»‡UQr¥9©vİ¬[R½½”œ+T«5Œ,É³7ÿ\0Ñ/Mï¥SitNê’ş&Ÿúâê“nZ~˜³ŞwßòƒZÔßím\\y±«èğ¬ïiáIfKw±î!Ë‰EI¥Œ4Œ‰KÁN1¥ŒQÑaÚJöyúû3v>ñ+””êè1å~òwòÛ¾ø¤Y‹YÇO}³Ó¯Ô‰cGmFoz%ä(¿àO±[{°VvüÒ’ŠÅ&Ûx]¼Ì¼(Õc$ªk<3Kbï\'/ü(Ù¸ğÖª‹~*á\nk³•Üóº>«£Y1ÂÍÏ‰m}-ûOøcËíé:…Í•ŞNÒöÖjZxa,&–`ğö’èßR(¸4£V´_ô+N?“2>½ÃVZÆµ{¨ê!ğ5½Íİ_kV4®V¹cõ6Ú?‹8K‚ô8,ËÄ®_Õ­·ÿ\0ïK‰‡-=şÖÔ3âõé?áã¨ßêVò^ÃVÕ¨áì©ê—ş#Kˆø†šÄ8‡\\‚_ÿ\0pªÿ\09…ğ§\rÓY—‰¼:£Óè©ÿ\0õ3ĞÒ¸ƒòÜüDÒåœg“O©&ş“fZÆÎñŸğé©ñRk—‰ußy¿½u”¿¼™Î§âE.^%ÔïÏ\n5üP9k‡xA´—ˆ”÷}#£Uo?S“C„xb¦]>=æ_ÒÑ*çë“QŸw)ÔØÛı?şşÏøö¾“ªjšã«CL¥Nµ×µ¡nåÎM.Xò.oºóºÁÎÑ<RâIÕZÃZªmr¸Î6²¦—\\rÁ©g×¡ªÏ„´:6º…½·S•;úf¯hÕ=ø)©%œç9FõáçJ\\ÜcNU›mIÙÊšYşşe™·¤¼üv6›Eôúzb³ı=Ú*x­Å½I[ÖÓ©P”œ©Ò«jê8G´\\Ô—6<öÉ¹OÅî(‚r«o¢T—ûšĞÏ—ûFm®´¨óGŒômú{K:‘şQ\Zèò.X§ÅÜ?\'åìêùìÎoî×•á˜Ä×ö·øs£ã&³…ö­G¨±¾.*¯Î,KÅJ5±öÎ	ÑëåîÕÌsçÒtNğÖç+—‰8v^JR©ùïÒ¶©(KŒ8š?³=iBKåÊÇ+Ë·ğ¹íÓşPôrã¾«®ü9³mõT•¬¿8ÄÛŸxkqö¼¤ßWN<§ñTyU¢Qßé?ÍG^¦¿ÅlÕÒÂ³Â•?İëÖí¿MÚ/+5]®Ç8®¤ÇşRõ¶×]Asi\ZõvmÆáòíæ§$t|Qcáİ§>†§©N­í:W‘©	§onşıXóÒİ­¶Ë\ZÛÕÏÛu«;X¬r»Zö·jk|ïíV;ıÔ+V;jî}é(Jz/™.ETxÏ—bM§ÙÒ›}>SÖ·OŸGyG„ü0æÍ—ˆQµ—fîiSü9bv–œ¤©)hş,Õƒìá{MíJ¨óœ%Å¶W3¯i£J¬§G\Zöt®aŒçîÉ´İW¯™u×)IÕzWÛe^R”ãg§N1¦Şí(Ê+á·À¹éÖ{hD[Ú>¸—¾¶àş.ë£ø+Œn£U*¹ù©Èä.ñV…?ÔñFŸu%Œ{ZqÃúĞş&«ÁZ¼òëp«¾îŸ/àÚ<9¬[I8è:í´—GK˜5ğq,[ŒÛeí«Iüë³ÿ\0í~Ú^ı·\n]Åyæ-üó}\rÏô—ÄKj^ğ¥ÄŞv—‚÷ŸàcKJœ_Bj¥ÏB£xŒ\\®0Ÿÿ\0ˆ±õ9·z÷ˆ:5hBïRâ\nSk*¶ôëÅ¯Š„¾¥çù¹[Ãs?éÏÖ?¤½ëñY£mOÃ®$£¼¥E{D¼ÿ\0eøµ¡R_úCHâKŞöÚsi|Óşƒ£â‡Z?×ê4Û‹ßí:_/â”]/5úMFáğıuÑæ5i·ÿ\0,j|Ümáÿ\0·¥¿ËŞ[x«Àõ¥Ëúv´Ş}Ûš)?.èí¬¸»CÔ\Zı­é·q¤¹ëªuStéçïK8å^¦6ŸŒwPÆ§ÂšUã]]+˜Kë´áÛãÜØ´ãş”äªğM2U!:U*Z*æ§%‰AòÉ6šm5ên5>o6§„Ú#ÿ\0nßX–r¡%qMNŞP­²¥JjiüÑªQ”>ôd¾+\n‡ıİ?kËªhÕÙÁÜQK=ó$‘ÜiÖœ3:\\Ü9âÆ©f¥²…]FRÇôj¤Ë\Z-ü;Œõågûe–ò\\ßEãV¹´,5(vWvjgçMäÕ)x©iÌêé|\'©F/ıjÖò’øIa3Q“Ïm¦;^?§õ{Å#r3<x¿Š,öÖ<:ÕV1ššeİ+¨¿=¶\"ÇÄıŒµM7‰t¥½ö½\"¶=bšáŸ±êúF)‰d8É3Qã4Ïx;Pš§i|íáBµ_c,ùbx=U•Õº|ö•èÜÓıê5×àØé.VÒÔ§ÅY‡$\r×]¾ 0w¸\0\nB\0)\n\0\0\0\0#F—šÁbGt“ìqêÚ§Ã—j.“ŠãO„ÓÌzEŞ‹	g=Œ ™³:)ö:WQ‰£\\ğürÛM/Aoayæùõ}wVÕ<ì{ú#¬_,qtT.ªÒÆwGcoª/ÚØÛ­`×O¡Ä¼£œ¡ˆ“¬=øÏœÊw)÷<rR†éµèr¨İÔ§œîŒÍ2±g®Sr3Éç(j+ngƒŸFñI-ÑÎhÜYÛ©\"œWO¹¿\Z™9ÍZå\rğhS5ç&p­ïÔCbqå~†ÛG.QæXîq¤šxf¢X˜Ãi­ÙRÉ¯Q.Q¦01wò†×¿Gğ½‡o\'ö^¶jò¼8ÛRjSşôœ#ë–eˆAÉ¤·lù?Å!qæ©}F~ÒÒ„¾Áhâò½•6Ó’ş´Üåê¹N:×Å_SÂ6Ş~â&{W«ÈÖ’““”¾öy›];¼™‡…j?<Ô8–¤#K[Ö¤•¤g¥lÆŠùGš«F7à®Ÿqe†“ö5çÏs$³ÉBÔ5ˆ¯Y—Ç¾\"«ÅÔôKBŸ¢Ót”\"½Å^Isa-½ÈrÃÓsÍ^‘Éú]Üı£Z›XíŞß”1œcÊM,e¾¯[õ{³ÚøcÂñâŞ*…¥X7¥Zâæù®Í?v—ÆrI|<\\_$šrèöêßeñ{UøcÂßèŸ	Ğµ¸ŠZÓûMëêÔÚ÷içÊoY­:r•ñ}çÙt8×¼ô‡«œ·m¥ä¶KÑnYÜ×…\Zz]_î®ì×qQB\r¶’Kèv:=«£EÖ¨±V®øıØöG©øXë.m*p¥Jé¬B+	\ZÀù2:ù²ü™p/Äñ\0Rü@À\0\0\0R€\0›”æ;\0®gŒeàÓ[¨è:>§GQÒtû¤ÖşÚŞ\\dÀ0èö¼%ÅT!c¤ØCK¿·umã*n5\"ñV9Rß„—»ûOÈúE˜Ûù@èSÕ¼;¸¼µ¦çy£Í_ÁEnà“UıÆßöQ›Fa×G™»>~wvï?ª©4§œİZ¬ÊueN+÷£œ}¢UR‚[RYLòüK«9¿³[¿uı÷şGŸ/µ«µ¥aíéêºuL{JÒogÊäâÿ\0ráUÍ\'O–¢{~®JIïé“Éçw‡ñ5Q«:Oš”å	yÅà¼Ñ¯¤³$¦Ò÷¢â×ïG±´Ú’ÎS{öØÆ5ıVİ%OQ¹å[%)¹%òy;\n<eªBY­öjï¿´¤—ãå:SõÑ„·Âm~F‰ÚA¦¾MZ×“x»Ó!(tnŞ¼ ÿ\0âÉÚÛñ^‰V)Õz…¬±œN”+EüâÓü	ÆXšZ“´YRYÛò*µqI&úçÿ\0#µĞlèñÍMQ²º½¯…NŞJtç\'†ñ¼pšIç}êû€ø¯Ox¸áÛéG÷íykÅü¢óø„Ï£œÛ%æíiû:œÍ,öÆÇko{R\'SÇ\\íğ8×v7v-FöËPµyÿ\0ogV>18T®(ÕiR¸§RXè¦³ôê&&œ»»›×^Öµ9{99BQŠ”#†Úîñœ®Ÿë–‘”mëéÒŒºóIgñG¿’©™E¥æÖ	\ZI&ß×üù–%Ö—švy¾\Zà*Q©íõúñ­•…B“kæåÿ\0#¼«À|;]7]Q]œkåş)œÕUãÎøX7#sŒ7”ßÔÖIÖ¿¤±ïp­=*óO£¥Ö¹®îfã%:_Íï·‹yÏ7¡ÚkÜs¤i——KW¥r­£)8*3¦Ú]÷ØöÔ¯\'…7Ê÷åfç·„©¸Õ„jSÓ„×2’îš5×Úo¬=mFß…!­J´!kR»·§%Ï9%–Òò^g:Û‡x¾­½*´4ºõ©ÖŒeÃMIe{¹ÎèÉµm4ÛŠ¡_O¶©BœœéÑ”=ÈÉã-G¦v;Hß)TæŸ+S}{?\"ò>Ó1Œ0–¯{NÚ¼¥m9Bİ¥U¤ÿ\0W—…Ÿ-öß¹¹úF5âêÓŒã.»#*iZ.›§]j¨ÆµXjİ;ª5d9Å¼á,m‡ÓË¯áÕj«J×îlíê}úi<|‹Ãô/\'zîë8‰y{%©xÊ¥Owu³jŸ[ÍËÚ¾fóÛ¼­ÀV°ázÚV•V‡Û.+Bu¯îâùÔbŸ¹³Ê›i³ºÓø„¨YP·¼Ò)_T„#\Z—Ò­\'V]dğ§·’Ùl‡(\'{ˆï†:Óoì&¹ªP´uşqA)oÓ-oó=¿ZÕ/±jz¥®>ï°Ô+E/—>•á¬ê”¯íî¨ğçë­ÅµHÅ§”ãË9ÂÊyòêz\nh•Wú–»©R“[*Ô)Í~\rdçhë˜{ô<CB)Ôş™q­øó‰-×ê¸§[‹KöîcU/ïAÕŠ¼aB’Kˆ•T·ÿ\0X±¥7õŠN‚ëÂ[š4¥+n\'´«‘«mV~k(àÇÃ.-TùèUÓf»FW|²úIlsœÃ×\Zş©ßG¿‡<SJ+¦qæêYÎ\rÿ\0v¡¾ümÖ¥üî“ V]óí—üÌ]WÃş:¦Ş4j•’Ûš•Å)â:ûŠì.xU7m[Jkë™çgzèøv§HÆ6`^0º©}£ƒx~£ÂßÚ7ø{&q_Š\Z=ÍLİxuÃõznçüT~&¸»»´Ÿ-õµÍ³îªÒ”â‰OU…I,5øy/9ŸWZønÎİkûK8Qñ‡”vğÛA„|ã:/ÿ\0¢nKÅ\r*/<=ĞZş•ZIı\rBöiS©³ÍØİ¾‘’in™s.ŸÊvóŞ\'ë,ÁOÅŠ~çè4qİIKò¤åã6©›}C¡÷s—äÑ†ı¼ó‡%”öÁ®G(å¼íß°Í+á[Xü?¼³Oø–~íh¶şªÎ¤ÿ\0:¦Çı)q}o»®éğş¦”¿CûI9a=û<›ñ¯ê’ë”I›{ºG…í#ı8g>ñ?S£zãÄ÷”ï¬jcõ”h*3¡æñï/5ÕvÉ¿Ç³ãM\"”5¯.xn²ççV¶Ó•ñËïû?z?yã÷ëƒá^K¤°³Ó\'²ğû®8Vîv÷t¥y ]<]Z(óòeoRœ_§Ş‡Iu[õEóÒÏëÃ)§o?oHœw¯¤Çö—\"·q=dÕ~3ÕÛò§ì©†\\õ-zrr©ÅüJ×’Ô§ËiâOCJ´‡p•uwÃ1UZ§7/²©tœ_WK?8ô1ëºœ\\Ï8[\'œúœæ-YÆ^ıv›8¾#é”½uj÷ÕÚW:ö½Q-ß6§]çş3‰;:5eÍV÷V’î¿HUyúÉvıTã–’_{×àrV£S‘¨Å9g=pfb^ß²éÇjÇÒş•BzV¥Jÿ\0H¿»³½¤ó\nÊ¼çñRRmJ/£‹êŒœ­xcÅ\nP£¬éú}ŸÒ†i×ö\nJºKªÎó‡œæo3	ËRšYÏ_ÀÕVâ3ƒæ”\'	)BTäã8I=¥·OÕ¤ñéèòï<6ºøµ>í£´Çÿ\0»=v±Ã6Ú%ô¬5M\ZÆ…ÄSåÅ´%N¬~åİ|w]Îè­.3MiV\rúÛG‚2\nqNâ6™\Zâé*ZÒ\\Ö—”Òƒ­$¾ô;Fªï’[­²—€âkG†u™išÄTk´çJ¼êî©ÿ\0ÚCÉşôz§è/Hïœ¶{©½§o¯u#÷ùÃZ´°ñÓìR[ãìĞÇäoÓ\nMûzŞÜ¥öë²:o¶eg¼ù±öœ­,åe¼˜ÃéÄL=u	å(N¢yí\'†kZlÿ\0;S=>ó<×Úyz=Ë¶³–Ò0ôş«ëZ®v}ˆßO9S¨ñ¶9š…ZõÛVô*U’İªqæfık{Ê4ùëÛÔ£ÜS«îçà0Ç*Äñ™êì%©TŠÚ¤›]ù™cªUÛªôıã£UË‡$Z5—$T”sé¾I‡^ïIVÃ^ÚYõ‘·WR«Ö{Ib/»[Rœp·\\¿UV¥e·ëæ0Ïnj_¤¡\ZgQRoõœ³kÚG÷r·K;õqÓí)*vöT¡ékMçâÚm]ªs’R{+(Õs_–”š’ÊêñœzšÃ¤aİ}ºÍÅ\'ma%ŸÚ¶¤ÿ\0ğšM>{~Óëµ•?ÿ\04ë8FV7´îmõ<Îò\rÕHÔ58saEGdÚÊxõ;§e¡É¾z××~T¦ş›~g²6W´f%ùİoÛi^ijÎaÅäÓ*%7Kqÿ\0à©?Å£Lì´\Z™SÑ´——ÚÖèrã¦éiCU¸‹éµ’–V=gÔß™¦¸áj÷Km¹léõìğäoù}ıÜgø‹kşÙu«Náõ$Ö‰¥Ç~‘£ËŸ£EV:eîéÔa6±ŠuêÁş;o°é1i½CU’ßhÎ•<ïıF×‘É…æ‘oNP¥oV]ÜªÕö’úàŸËõùşÒşÎ¢ºZY…;¨ÿ\0WPº_LU9”jĞ¢—Ùî5z~r§¬]¥ÿ\0å^úÙÍº0Ã^IÈàW¹Œ¤ñ×à¿ä_°êû³üëe=ëûC´ı#4ğµ]nÉkwş‘šã«İÂ)C\\×’ÿ\0ü¥Gùäó“•9a%$û$qÜœyœeñ9êmui¦^¶ûe¹Ô:×¬ûÄ=—éıUÇ’—ë”–~ôn£Q¯ïÅ›ñ×5·¸»\\ÇıåJ™úÑş\'ŒöÒ”W½¿šëşv7cp×sËÊcÕõçc¡oÁG±ZÎ´ÓŒøšæiçiéVrÏÒÛİîy¥w¦Uîı¾‡nÿ\0ÃƒÊ;™Ålşö6g©ÖÚPè¿ı}ÍéÅõ\'Œ<»\r®Úf¥z|¡íÜğù¬øJ¤·ŞZ1ıÚ¨â×Tnrëh¼ZXÛ›Fª¿*¬ò¤îmI7Ÿ\"ş’¬×Xù¶×CÓöMgÊşcáİ£1õÿ\0/H´ı2mû^àyÉ÷§Jâƒü\"Î]‡²Óª)Ùhºm	\'•ìuíB’_ŒOôÆ6QxÎÛ–\Z­\\ûĞ\\¹ìÚf×ĞÌnü2İ&Óû²-4Õ­0á¥[Ô^ºıYÿ\0“‰ÚZø}%ŠÚBŠXÊ†©	mıªhÅÎñã)¼?#B¿œ\Z”ZXÆq¶ÇŸÌ¼t}_äÛ=ZÅ¢;üå”®ø«NÔÒ­ÂS¹O±×_‹Lèî-8u}­Õ´êémWLµt¤·Ïû\Z¸CÊÓÔ%Ë÷¶ôş&ıÚ•0ÔÖ{|K\Z¶–-àÚ:qšÚcõ{Í#ˆô½§ŠşÎ¿û¾¥¦×¯ºaKÙ¹/ï…x“Ã)â¦§N—ûë{Š_â¦ŒYí/iGš<ŞyYÿ\0õú¤o –jTŠ_³Îûoßc§;ÿ\0µàÔğ®¤çÍëùÃ.Sñ„&ÿ\0ö›B‹ò•ô`ÿ\0âÁÛé<C¤êõ#\r+RÓïdÖR¶»§Uµç„ò`jš­všœå,¥•,5ô:k»=\'PŒ£w¤éu%\'÷•´a?ïGlúÃœÿ\0Rcîj>¨Ä—XI|Q”!_Ráÿ\0ÖhWWU¬c÷´úÕ]NEÿ\0u\'ºï·Ffß\n¸Š–· Ô•:ò«Z•LÉJ£””ZXëÑ\'•Ct¿)Æ\rÿ\0ƒßg¥æòÏèÈ@Ø§_+sy4ÖÇI‰‡Å‰Ê€ \0\0\0\0\0€F²PQ¡Ã&Ô©mĞä\Z‹&\Z–éö8•­LíÜQ¢TóØÜ]&¯;VËÉJ–n=çªvùdû%7Ô×›†x<’¶›xÇàs-¬n$Ö3ÒFŞœzEª)tDUŠ:»{\Z‰.i³NİG«É¾sy–¢±\r*)v5\0eZ\0y\ZiœT—ª5\069Z{š’7ZÊ4à¹g#â¿Ë…¸Q½·“ıuö;<<?mS)IUsKû\'É°¦¡F•\ZrœU8ü–?ó3ò·Öj\\iws²¨ørÆ”œ®©¾xÂ½G‡*©oÆ)EI¬{ïu±ˆøgE©Ä|E¦iÓÃ¼©Ë*‘yä¤–jTO¦ÑOæÑäÖÍ­‡ê¼\Z)£·¶¬ÏçòÃ%øp¨ğ\'†ú×ŞÂ.òò>ÊÂœÖ ›TÒïïÔÌŸ¤Q†!í¥*õeZ½I:•jI¶ç6òäÛë–Ì¥ãÆ¹F¾·cÂÚZ=3E§R”>ê¬ãˆCĞ†>rf:²´¸¼¿¶µ²¥í¯.jF\n¿9<E|;·ä™‹Ï^1èõøÃmÎ§{uü£Ñïü\ráE¬qµ›Ø9iÚLÔ ¥vµ×XÇ~ªŞ~¼§Ğ“3)<·»gQÂú%·ğõ–g%8[Gõ•qmUï:ã,ü°s+NRœiÁsNo–+ÍºWŒaùoİÎïZoééù96>Ùwï¬Ñ¥‡/WÙ¿İ›–ñ¶·…(¼ãïKÍ÷fòÇ’5/$F\rÊM¼†§Ì¤ÈÛÈ\nÄû†\0€V@Ê°!@Ô€p\0NÀñ\0\0\0\04U§Nµ)Ò¯Ô£R.„–T¢Ö\Z#_pÂ\\o§ÖàígWĞj¶êY\\ºT§,ûÔñšrùÁ¯™ê=ÛêÏ¡•?=/V´âJ7—w4õZ³£^7RTjF<ĞŒ\ZKqæJ/8ÇW“çjÒq–?1—ÙyÕÓ¬Èß6vØ#B—™­<ïØ9HŞè‰õY.ùˆG/È¬µG¦_İ;?O„èÂ½xÊJoõpK._şrq¬ôÉÜÒ•G.ZKxÛ>_éäëáÔ¯«Zñf»NNÒÕ(é´jGùÙÇojóû1ıŸ9oÙeÆ¥øÃ øáòàííúMvúÚBIªÒë\ZK×¼½vìdôÚ{lÃİõ!§†ffs-\\òıæÎ«RáıTr–§£é·r—YW¶„äşmdìØ*<Eç…\\på(h±µœ¿jÖµJOè?¡¼ğOHšÿ\0QÖu[wÙUTê¥ÿ\0\n‰•A»ğSW¢ÛÓõÛ”ºBæ„é6¿­ñø¡áÚsJ\ZuÈ§ÖÚê2on©K•ŸHqeÌû¾O½áİNOíÚ©B>jÚS_Xdêê\\R¥7\Z•#Ji¼Æ®i´×¤’>ÅM¥´šø3næªjTh×‡•X)/Äœ`å/áUIşªjk³‹É¹\Z®=Sù£é‹Şá[×\'_‡ôôßYR¥ìŸÖ8:Ïx^¾~Ìõ;?J7r’úO˜pùœ˜+Ûú½—™¹—¶æW¼ğ^\r·c¯Õ~[›hÍuó‹Mç„|In—Ù+iWk§óÓ¦úù4×—rq“/§Ûö7!y<¶±×¯™Øj<\rÅ–XUô©®ªv²xõòO+èyíFÖ›7û+ëIôå¯m8oä¶310DÄ»h_ËªŠÏ¢ÁÉZ£YSrß~¹<¿Û\"ñ™¸½¾òÇæo+¬§(K+wùËQGq«IÑ’„šm4óş~\'ai©:p…7W™¥Œ¾ûŸ©ã#rçVæMug2[N2y]	•˜ô{xj2ß8^x;]R´#RqÏe\'ƒÅÙÒ©ïr¹f]Z;«;*ÓpÌê{»ç™§·ùü™cõ´u{‰Ã–ue(¾±“æOÏ©×jZ…¬áj\\?¥\\ÊK©ì)¯íCÜ´µœd›—ì¤–6[õ;+{5Fns|¹ïŒäÜF{¬jZ¿áµï´›ÔêpõåÎ—[ª¥]»ŠÓ?~?ñ·ŠøCˆx=©kv3…¬Ÿ,/hËÚÛÏ>S]¤°ÏªiBi,%‰È‡7³©NQŒéU\\µ)Î*P¨¼¥³E8ôèú{O\ZÜmçïO(ù¾4…×“íæoS¹¨£lÄÌ^\"ø3\nşÓQàz^Î¶ò«¤¹m/7BO£şƒù>Æ\r¨ªĞ©:uc:u!\'	Â¤\\e	.±’{¦¼™ÊfkñCõû/Ñİ×4ïíêíi7e„Şÿ\0S~L¨,®\\|Î’5q»“7!]ç*X~iŒÄ½ÑjËĞ{llºõxìoÓ¹ÆÉí†şWr_´r)_á¤ã²]™‰©,¡áçÖá+ÉĞ½§+êOívØRöMõ«¾¹ı¨ô—^½uøŸÀôt:0â>\Zš½á;´ªAÒ—:´æ{oŞ“oiv~ëíœiNı>TåŒwîdOxóıœìµ»¾¼n6³:£Ì±)Â=^}øw[­úê;q—Ì×ĞÔĞ¿Úvİıcıßı±äêNœÒ[·º]rWwQJQxqîºÅ.Ó§®põO¶pÒS¥Rçû\'7İ‹—zo8Œû}Ùo†ñœÓi·cd»¬c%öv{­=ŞœjSÿ\0ã—ÌI5’XÆ3øœ™W<)s$—}Ú:ŒúšùÜ¤›yhœaêãÚÌfŸ,¦¥•$ã\'FIæ2Mnšk)®†lá^!ÓüLÑ?Ñ.3’†·çe}£:ÒŠÚ¤?vª_z=$²ÖÙK\0S›ƒ÷p›ênÓ»p’’ç„””á:såœ$c$ûI=ÓEŒÖz>~ÿ\0Ãëº®c¥£´û=wèúëU´Í^šW1\\ôêÁbÅ>Õ#éæ»3¬w›|9-ŞæWá­rÃÅŞ|3Äµ¡mÅV±u,ï¡½¾ó‘_½¿Oº÷£ıM­i\Z†¬×Ó5zŞò‹JPæÌ$ŸIÁ¾°–2ŸËªbkáÃc¼¶¤Î†ã¦¥{Ç¿Î\ZÕvÖı:¦æì*åáå?Èéùœc\rŞÏ)slÍN·+OÚJ]úãc<_K‹Ûğ6»KEÖ+U¹äöU©*pn¼(¨É¾®sÛÏq%­î‘BÒj5§\Zª²•è]rÅeµ.Np³ÛàcEqîg+8Û(Ú©SšSŒâß/wäj¶˜/©á”ÔÜ×s3Ö?³¶wM©Inº<v4Ğ¹Ëjÿ\0Ç[F«M¤š]¼‹\nÎœ’i,ï»3Åô°î¾ÓÙtù›±®å¹»lü½.ûE…Ìµ(FµÄpèÓNIËÏtÖ>g\'V¸á÷l§§ÜN•mŸ±öRqYÎS›}‰‡ÔëŒ:úÕãíâÛYk—wØ\\UKj‘ÜÑìpk×„ ÒiÉ,£v5ıØÅşÖ6òEˆ[:¸O’P}Öë²ÎÖËR­)rÎJ¤s×¹Ó]¸Ò¸©Óyß±®ÒjRMu[ì}}f!üóÄô<½[D½•+¥%×É?_½+YaIããÔê­œ],µ™càZÓmg‚ó=™||eØ«ÅÙådÛ•Ü¹äóİz[“O-a÷x4Ê¾Ømš‰bhíİâO\rì»\\s.¸ìÎ5›i·ß-`Öëµˆ§û÷NvŠ®r”·ò}7/:Š[®Ÿù]:+v³¹¼ªs/4ş¦/jÌ;íí:w‹Çxh¼Õ(Y<W¯5ç»ÁÂ·â‹Z·´¨Pu+94²¢ñø—Q³¡qS5`§ÛàlĞÓ­¨ÕŒéÅ)-Ô¼™ğ/X‰Ãún…çSN¶ËÑı¡J-ådÙ”ññßs‰Nj)(ì£ºg,EËı­ú\rp¼Kí?BÔù9ÖÎ3¨”¼úœšôã.d“Â:ûYrÊ;t}™ÚÖªÕ³yËîÛÉ÷£«ù•úNT¥(É.½qª¼åù[Š©É8l±‡†höÎ1ËÃOo‰¬9Å°í½£Œ#,§•óÁ¢¥eŒ½ÒÛÈà[Vr“æ{?ST§”·Êkâ|}ŞŸOÍıÀ7>~Ö\"{×£›Nå{6¤ú#Tu7m^Ÿ2“„–:£ª£^NrXoâhÔ%ÍCÚ,óFI½ó±ç§KCên)ÏJÕ÷‰{+Mg–)Â¯¸ıNTµZ-¹,­°×OSÛÜU¡^rıOAmp§ıì¾èı1hËùv½-§|;Šµ!8e$ÜwÜàÕ­.EÛù\ZSiågÉ¤È¡8så.dšÎs–[R³˜4µ¯§hµg°¯»ßuåœ³— ë<1­ÒÕtõÍ.[š#V\rî¼“òõHíø‡AOLÕ”\\ªÑŠ”¢±ïGïècûíV4#N´§Ò0Oøºº3§lC÷›=æ—ˆíæ&>S­´»ëmSN¶¿Óê{[Kˆ*”çæŸgêº?Ts#,=x!ÆÕ4Bz&¶•\r:ú£³rrVõŸìç²—àş\'ĞP”eh5(ù§“µmÊ:¿¿ÙÛg­4ŞŸ““\nfâg<Äš¼±fø4ÆI¯SQŒ6\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ĞWThO€İ½–ç“†…ÄºtÚÑx©\\Zó7}rÏír‚yxhJœÚßöù6É\'ÃüG©K—^âÇNÍãš×C³ûùÄ«Js¨–ß°àúî{«ëzNŠé­cUÓ´÷Sî+»ªt\\¾Íç‰g\'\ZÜY¡ó$!w\Zşœ½;‚¸_M¦£iÃúd^rêT·Z“xÆeRy”Ÿ«y=\r­éF•Â•(íÂ*)|\"ôy(ø‰ÃU#ş¯q¨ŞFK´Ò.î\"Óõ&Œqj´^$Zÿ\0…ü)­»ËˆT§^ÎëF©JÎ|Í>h{IS•˜îâœZ{£;óÏ÷¥õ4·Í×-ú‰Œ·Kğìù1øaâ-Õz×wœ7Z­ÕÕIW­Rz·4ç&Ûm9m×¡ì¼0á\rS…µ›½Sˆ´Võ**•’¥B7Tàç•R|Ô¥\'ÍÊ’èº¾§Ğm¿sœiV\'/f¯‰ëjiùSˆ‡Œ¥¬YU~ÎNúE³U´Ûˆ~.;İ„j7y—%¼iæ.8óxi3¸SŸïKêL·Õ³®_;‰‘ùw\"©H‚ÀĞ»“`¤Ø@ \rÈÊ\0uè	ñ+Æ@~alÜnM€\0;È\0î\0\0¸gÄ·ã\r¿Ğ®j{ÖJ¥½wû\ZÑy„±åŸšmñW†<e¡^Õ£¨pæ£.G/×ÚP•Å¥ûQ”Ûï‡ô>ü,[İm|;ºiêÚŸ™•hºU*~®Iî¦œZúšc	oÊÔ»û¯\'é…İ\n7”ıå\Z7ıÚ´ã5ø£Ìêğfªäï¸WE©)uœmcNoûQÃjë‰õ‡ç³S]Mtù·æO»ÛÛš€^]ÿ\01¤İX·œ»kê«¯¤œ‘×èßÉç„´­~ÏQŞ©wBÚª­ö+©S:o&¢›Iáã£Æb±î¾|1wƒŞjœQZÆ§X]Xpí®*OÛSt¥tŞü±M&ÓX÷ºc£>³£N\n4èĞ§\ZtiEB‚Äc°’]’F¹IÉå¶È/y´æ@\0`\0\0\0\0\0 \n@  	RQöröÎ>É&åÏ÷Rïœ—¡Áœ¢×:ÍŒ^y_ûf¼ÿ\0£éßáÕ	2ñ:éº…İ{Ë»\n1Ñ§9JÖÎtñí\"úJK´zµùËìso<+àÛéé\nÒxÇ5­iÓÇÉ<?¡íÛËÜ	œ‘†(¸ğSLNRÓõB”ŸİÌcZ+Ó³kæx‹®­¤ju¬5ò\\ÑİIeÂ¤{N-öƒØú8è8Ë‡á¯éŠ4Ô#o™ÛTk£Æñ~’[}cX’fa‰tı6Sio¾qø‚ÒÖ)o†uV5\'Æ¤*S©á:sX”Zxiúäî¨Uõ3ÎræÑ¥–VBIalqiTé¾Æú–ysæn:œ²—‘ºšùœ:rÛ©º¦Ù¡ÈrôßÌñ^#øu¦qÍ\'s9ÇO×c\ZwÑU\\thşÒş’÷—¯CØ©yš”Úè&\"cé¥«}Eé8—ÅüM¡j|5«VÓ5«Y[]Óß\ræ5#Úp—IEù£ªSiìÏ²x»†t.Ò¿Gë–îtâóFâkwç	~q{3æ8Wà›èÆùFçN¯,[j–)Õï†¿bÑ,=M)§Xìıo‡øµwsS¥¿«Ì*¯³7#q×(â°š8ó˜}˜Ô˜vëïœ,üE½tÊ)¿#ªOÍp¨âö3Q«îïM_vgğŸÄ:\Zªè|A_†/3	Æ¤yãlç´³ôßí.İN\'‹>Ëƒî£{¦9ÜpåÛÍ½u7?³å,Rœ»Ç÷eİl÷ÜÅ”î¤S2ÿ\0„¾!ØÛØO„¸ËÙ×á«µìiÔ®ò­[vOµ&÷RëéÓ¤^¶Œ<:úvÚê}¯kÿ\0•}ãŞ>la,m†ú-ºÇÅ»à}iR›©_I¸oìWO¾7öSòš_)-×|x®uç°“‰}½¾çOq§\Zºs˜–æJ÷xXèhRMš”–|×©b]òŞ¶¹¯isF½µYQ¸£8Ô§V›Ä©Í<©\'ç“>éz¾™ã\r-/St¬øÂÚØÖ6ÔÒİÍ<myvxkª>}oèr´JóHÔ-¯ôÛ‰ÛŞ[O•H=âÿ\0Š}\ZèÑ¨œ>~ÿ\0c˜‹ÒqzöŸíù9ºµ•î—©]Øj²¡yk.JÔœ–ÏÍy§¶\Zó8ªT“Ş)>‰Úş‡Œü-úGI+.1Ó©òV¶rIU]y±&³~ËÙì`ıAT¡Zt+Ñ­F­9¸U§YrÎO-vhcÏ‡o¾Ñ§©Ô¯xşÿ\0“bd£…Íò7!Q<9ÉæOP¥eíŒã©¹·‡&ÓoOQ/¥8#(óòÂYIç¯_™È„ ä¦ŞV\ZM³gØCi{¯g•ÛæH/d›ŠÇgö32ÄË´Ñ4Mc‰õ:Ö<;mIº‹¸¹¸Ÿ%\Z	ôæ{å¼<$›x{lÙßj~\Zq…	»{­V«¨;kzœµ[íÊ¤’“ë·SÑğ<*ÃÂş\"zD?ô’­^s•9¥9åG‘ã9mC›–øÜñ\'Vöß‰ôÚºUİÄªV¸„\ZG(ÍKİ}wèß¯™ªÓ”eùï‰kÆâÕ¬â+8‡Ucq§UNŒ­®iÉÓ«JqjTŞpÓÎë3qJ8Çx¼aüO]â¾miÆ¼µ…8ÎòÑT­ËS*SSpSø¼~<TæÔêfKÏcİú\r¦¿Ú4k©ï¬œ$¥<,¬\ZlfÚRŒÖ2–XÔ©mË/{¿©Ã°’ŠåYë²Éô¶“ÓÍÿ\0èq˜Ô÷zˆÕ~ÂTê¦²šR‹İ3ˆçx¤•½ë”{)Ã8ùŠOÚPRÏ½{,Ûçä©‡æ÷gÑšÄ¿]I¬ô–¸ŞêÑi§mQI`Ü«©&”ôÛZ±ô¨Óü¦Û{Ií³ØÖ¤Ôs—†gË‡Hİê{»;:÷W:}kßÑPö4gÉUÂé{:¬y¼2»¢Ü”­ªÁöS=‡téßT×ôZ®+íÖnTùšûŞkàÒ<á.®)¿Gø¢N”-wv™˜˜£«W†•Xü`öøš£yi…šØşºhâ\'¾òxÏn¢U\'IÆQÊq\\ù^k}¾†f“îë]Å}kEjĞ•8Ô£R5aœe=™=«ÊåØî|F´·³â«ŠÖpŒlõ+Z\Z…(Áb<Í8Ï	l½åøjs†Ö\Zé“äëÓæ¿ğ­Zëí«©XÃ²U*ËRø®‚¬Ô£$–\Z]—S‡\Z®Qê²ºç¹®ma7×ËÈóáôf:9Q¸äI¤›Û©ª¦§Z¬Î}¶ÏÈë•LÆQmó\'äX>øüO»··*D¿™x®‘¸µ~nRÌ·“Y#]^_7£4ÓŠoŞÈ©/w\'¡òÛ´fñçÊö7ª¶äâºv8¶Ê£§¼ıß™½YJ÷”“[?FŸ¾¯İ‹?Wü/¯ÇRÚsëú6½£N/}ßuØŞ­ïÑ”^rÖ\ZÜáÖmEgc•NY¦“}±»ê|Çí¦:8>Õ¸Á$“Šåxó;;ÊtwU:yŞRè¶êqtÚP§V…XUª±ÍËKÏÍn{]GÒ¯D¡ìãÓR’”—¤“è}µ¹S£ùßiÆßs9“ÕÃ²¾Ó%KS²o?uV‹Ÿ©¿VZl¢ª=VÎœ’å„*Í$Öï9ÏÌÜ¹á½*^ÓìÖvõjFM?ÔÁ©vxi/‘8„-8X°¡«hö­¨YÔ|µ(Â£„á4ùró¿+ìu·8ïŸ]}¼uá?WKÃ÷z]M>QºâÇ“Œm­¨¹Ë—¢^ÑÇÃìxş.Òôı;W©-şıT¦¥Nœ¡ì§ûPÃúíæf¾9áŞ†+Î Ñl£em%Rs¶¶P«\'””S§‰<¶–3¹…õÚ:G\'·Ğ­n-ícq;zÔk)o	ûÔê¬ıÖ±(8ôÂ[=JŞô™}_\nİèÓs÷sºwŒ|½!çî#ÓK®›ã`ğß‹+ê\ZBn·úı¢Œ+¦ö©‘›_ƒõFrq–éø¿3wIÔêèš¥+»y´–cS)ÇË‰äÒ·f_£ñ=„ot&±ñGX}U¥ë/Z§/Õ\\cî7³øÈìÑŠ¬u6çoo¨P­zğJ_râ-eJ”ú=»u^G²Òu·©^Ëš«w_Öÿ\0™î¶—NU;åÆxÙé“7a<õ8Ñi¤âÓMe5ÜÖ™ç˜u‰rA·	ãgÓÌÜF&0é\0@\0\0\0\0\0\0\0\0\0\0\0\0\0 ÜĞ!¸\0\0\0\0\nL€/Ä@\0ï°@d\n³ÅîL¯Rjú-ÇÄ/˜ƒçø¼ÿ\0)ÛÍ¯˜ù€ôDù€”™†B€è@öè\n€\0À\0MÊ@(\0\0±Ü\0\0w€\0\0Ğ\0êP¿\0\0\0\0\0à\0\0\0PCfmÖ“§Õ4ñ9/ğ KL×Ú¤àŸúºx›ı÷û¿3º,c°\"”b£”RÂK±Ba\n@A\nAá¸ÿ\0AÂ©­XÁóÅ\'uNy%ûkÕwó_ÊÚÕRŒe•ºíÑü˜şK}°b¾,Ñ¨FvÉ½2æOÙ/û\ZwOú¯¬~kÈL11†º52“_S•	n°u”*eã¯™Ì„÷K9 çFK+sz2èqcºH×‡ÜĞåFFäpúœH·çò7#=’`r›XÃ8÷öVš•…Å£mNêÊ¼yjĞª³¯àüšİv/?ŸCR–JgaógŠ^İğ¼kêº\'µ¾áôó<®jÖkÊ¦>ô¦¾x1zôgÜğ©Èó³Ñåe5İ5İOÅ¡^5µ~¶J¢Ìëé4ûùÊ‡¯ıß÷|&¶†zÕúOñ~Ú[‰ü§ü°\"xeL4Ú{4ğÓXiù4:)~’\'Õ­K\rQ¨şFÒİù\Z‘2ÜZY³Â^5°Ö´ú?ã©*ÚUÔUš’Ä¨Ë>í>gÓîK³÷z<Ä>Ôx\'‰kiz‡=Jo5-®¹ycqO÷—ªé%Ùü%,8´÷O±øˆôÿ\08nŸñµfµŠqoJÕõ%$¶M÷š[5şÒ+y&ûVcR8ÏGÍÕå±Ô}(û“ñG÷aÖqHİÓîWh\Z‡ë—ZN¯GÙ]ÛË|o	ÅıÙÁ÷‹ìşOtuG	›Vpû:[u‹RsçÆá>¯ìj\'ƒ¬O¸Í®åi‡¢ºóêõ+Ä:‡ë–Ú®•QFæ‹Ã„Ÿ¹V/¬&»Å¯§S2ñ®‘§øÃéÒ¦¨ABşÃ¬«Ëº×z‘[Æ_µ·Ù:Æ«ÏSÔøÆwÜÄ4µ;*”!ukœFâ–zzIu‹ìıG£O^3‰|ıöŞÚ–ÎŞq©_Ş=¥×F¬^\Z~ëYİ}ã‘\Z©Ç1[ıÔå.¿‰“ü]á]?SÒ!ââ¶“z½­õ\ZqşnOg[•}×¦»=üÌCÏËñİ§§w·e½¦óOœtŸXö—e\n™ŠÃQôò4V“‡\'3Yym­²p}«Âß;çrûGîo÷z`aëÃÖğİpõü.¬ç¥§	G*__T{{n9ÒíêÔ¼·Ò£ùÂ)ÕX-Ò’rX‚{åg¿‘‡ÕDÖ96éî£S¼ªúÆŸ÷Æc>—¹ğÍÅùŞ:½&»ªÔÕµ*Ú…íHJ¬ñurF1OhÅy-†­xºñj9åme÷6%w9eK“ÕX4Î¢œgä–Æ¢İ-*éÖ+Xé\rúÜ²¤äğ¶Ù.çKV«¢°é³²m8¾Ë£QOlzöÖãgËñ½3m?\'¢]*´}îŸÄìn`–w‹XÎïËÿ\0ÖyN»öueMÉáî—c#ğ6½WBâ]+V§NU!k]J¬`²İ)\'\n‰.ï–M¯T«[æ¹‡ó­mRİ!ç(Ê/\r8µŸÏànóeï¶{#¼ã§¥×âÍRë‡hÊ“q8×£EÒP” ½¤T_EÏ—Ó»ÆÇAìŞvKæE¢\\¢–ör´«ÍFÏ\\Óî´šÔé\\S“Y©œ5•¶Ø{àìõKIÇW¸¥N”¥Uµ\njU$ùRI,·¾ÙgKm\'ouB²M*u\"úuó2•+ŠV+ğÕÜ\'IP¹©m\'(´¢œ³¾Om™fÕšÌtt«ÃÎ%«ET§ÃZ´r¿iQ‹\'Q?“8óà*„’©Ãz¶Şì)Ë·š™õFÎqáãĞò}¢}šˆ˜õ|¿Ç\ZeİáúºµÅí¥ZšuÄjÁ©ÆjTÛIµ‡‡‡şgåİ­Ó»ÓDøÑ¤U¹ÒõŠù÷\'gN½\'¼jP““Xï˜Éµğ>v¯9+….g(É).^>›wšÛŞ¸şÖå¶¶”şş­T›ço.]ÜqĞİ”ùŸE¨â<©%Õµ¸ÎÙ7©f0ËêŞZ<rıDµ9¥^jedBªSYk=7ó6+TJ´2ò—ôq×!O~íÇÌú{+}Ü?	üM¡ÇZºñı…:©­ß¡jÏmŞ_™ÄUSO©¼A´öóÉî~_\rp¬Ô¢óß±Ø]EÓ¦L®oz9}™Òó-²ÖıÎÊ•E;u²[aú`óîkËNaõ<WÊİRß6Ü¥ÍNMµ…»Ü×mR5#îå¾™8nRR”R\\¯l6i³¨£Yç1ÊÎEè|‰«útGFíÅÜ´íNÚî+¦c/ƒ=†‡V…ÃuyÜjKŞ“O|U¹áõxª–’©û¯ênğæ­{:3ÌjSÚOÎ\'»glt~Kø—kÎµÔ¯~Ì±¥]Òµ¶©N~ìVy£Ñõø™çP•^\rÒõ‰>jú5İ?j÷û™P“ØšoàbxÖ¥CÙ\\F0qÊË~‡»ĞµÛ*6·–7´ªÔÓ5(:5#•%ÊŸã‡İl}\rJö˜~èüd±¸½à·:3®©]Q­8Ó‡<¹º¨õ{´ı:˜\ZÖê1•XN*t&¹*ÆY‡»æöÊ{dú[ƒ¯jWá«?µOınÙ;Jí-ı¥6àŞ;g•?™ÃÔx;NÕuëÍ[Qƒ­Z½\nt!\n°Œ•ûĞÛi6úïŒ#ÏMH¬M,ôiêM\'”>jÔìëÙÖtk{ÕiÆ2Rëí!%˜Oæ}¬\Z“MíÕ,úleÏø>:.™o§F¥Åµ¦}É¾i¨=êC=Öq$»4ñÔÄu£ìjbqı™gªõgƒZ‘Ktí/è½æŞ-?tŸÿ\0|Ù“ÁNÏˆørëƒ5êp¯ö5ím9¥ï:YİEõRƒyMvkÈïïío8f¢Z…Yİir|´¯ù}ê~Q¬—GÛlûàÀúN«s¡ëz¾.[«)ª±KüzJÍJ9Oâ¼¢4ïxGY¯NÒî××´zMS„ŸZR“Û›|y<u:mµ¦¿wÑù_ğÏ+WÎÓ»?´¹:V§VÊJ?Î[½İ4÷¬_ğèzÊ©ÜQZS§.ÿ\0WÑêğïúŞœ§uÃòY8¾yÙ¯8şõ?N±õG3IÕem(W¶š«BªRqOİšıäüÏV¦œ^9UùêŞk8—¹Lİ„ñ×¡Â³º¥wAU·Ÿ4Ş©ù3}3É1îôD¹`Ù§<|?#{©Îc‘9\0P\0\0\0\0\0\0\0\0\0\0\0À@\0\0\0`\0\0\0\0\0\0\0@H6¾€c –]ü‰ó/ÍÀú†pÛ!ÜÀp‡P|H:\0üÇ^¥ê½\0”\0Ôv\0à€R|\0Ô\0À@\0è;\0\0\0€`\0· Ü\0\0u€\0\0~ YkÙùù¢mÍ¸AµûÒ]½>&¸%¨Åb+d„b¢°º\0€€\0 €ÇÔl­õ+\ZÖw´Õ[jË–qŸÅ3\0ÄwVW:Eí[¶ç*r®?‡i||ıQ½F¦ñYİû‰ôXë6ISq…í-èÔkoX¿GølÌs8Nq”\\+S“…JrXp’íüI1êçÙÚS›oÍª}6x:úuğ°ÓØäS®šëÔŠåÆ[u5óç~¨âûT×qívëê\\£–¤‘½	\'¹ÀU<ŸĞŞO©r9jKÈ¹İ4ğÖé­°qÕd‹ícçòÄÏôş/öºèéüBÓn¶1JéùUK¤¿¦¾y>mÖô›ıS­§jÖ•m/hıúUøìÓèâû5³>Ïç]Ú:(áİ#Š¬!i¯YÆâ4óìkAòÖ£¼“ê—¦ëĞá«¡ëßcaâ·Û}Ëõ¯ô|nUĞÎz¯€Ô¥QÏEâ>H>”ïí[kûtŞÿ\0İG¸ğ;Ši·ìnt;…Û’õÁ¿”¢íï¿§âÛ[ş,~l\\ÙªIÓœ\'Ns…HIJ„°ã%Ñ¦º5æ{ÛŸ¸ê“÷t8VëyşùüªëÃ¾2´Ë¯ÂºÖWYT_XäÇ—xôzk¼Ûßµá”¬®m|má(é÷µ([qî“IÊŞ´½ÕyIuOÑ÷ıÙ{İ0míµ{ªö·”jP¹¡7N­*‹„—TÎÊÖ×ˆxwQ¶Ô(Øjš}å­EV•Z–•!È×Åtì×‘–¸šÂÏÆ\\KÃ´iQãªZ–}¶Æz¼&àû¬ÇªGY¯›^¿~ï%5«²ÔÄ[:vÿ\0ã?áƒ\rF—îÊQ~ì“jQ–Í5Õ5Ù…úoğ<“³[g¬5dÕ“oÈÕ¿ra¸³ xIânÕ§Jî2ºáû×‹ëF¹±•kÿ\0i-šé(ìû5Üø¥á¥]&¤5Î¥=K…¯b«Ò•ªu]²–é4·tü¥Û£õÄÑo©í¸ÄÎ%àº_gÒ®iW°Ë’³»‹87ÕÃ\rJ©<?#ÑMJÍx]óõ¶ú”ÕûF×âñé/\'¨\'‰N9[nñù›ñ¸¢úU¥ğçF[‡ò…Öä¿×8wA¯ÿ\0Í_›g\"<[WkíÜ¤Uõhâ¤ÎÕµ#ñ7!½ôsú°â”Úq	&nF%XMöxLÌ“ño‚®ßúÿ\0†öSoou[Oó‚7øYv±uáíJyß4èQüã8+Æ{JÇ‰îs‹míõacW½9åÿ\0EšÕ*˜û3-sÁZÏ58U´o;Â¢¿àªËV—‚—9å¿Öì\\ºÿ\0Ö×ç\ZÆ;K_Íæ¿ãôaT²¶ø\rF/Ù¶“xìgUÃŞ]íCu+l~üùĞ6.xÃ\n°ÿ\0Uñ\rÿ\0ÚÖ·ş1‰Ò³‰Ë¿‹hêRijÚ3ò|óJéPŸ4#†»àäUÕİ\\{W,/-Œß?\n8OÛQ«iÅÑ¾¥Ì¤áRÆQŒã×\n¤^7úİ_Â¾Õh{-*¶“¥Üsf5j]æ8}œ[ËÛ8ş\'Yµç´¾ÚéYéı:ªK«^?	³z\ZÄÔ“Í\\§ŞLÃäñ«Uÿ\0«k<=_ú•j?àmTşN|YŸÔËG¨½.\'Î‹^ãw§=ïIbºzõÄeîŞMo”ÚO6—jtÜ=FIÁ©B\\‘ÌZİ5¶Íyõ=åäıÆtVÚmWıø/ñ$pçà‡\ZSxÿ\0G\\—œ/m¥ÿ\0Ô$ÚÒí]mïj´ÛøÓÇ´â’âUSıå­?«ÛZx÷Æôb£RãFº½VÓ\rÿ\0uÅ5O8¾ŠÌ¸nşK?ìİ)çéQœIxiÄô*p¶¸ŸôlÜÿ\0&ff[®†Êıø}^‹Wñ¯‰õ½>VZ…¦ì¤òåmNP—Lc.Ofáåwí¹dá¸¬rÇ¢^G>¯kÖëõÜ;®Sş¶YşQ8Õ4mF‚jzmı8¯ß³«}bI´Ïy}]…6»lÆœÖ3ómÂ®T#\\tô~g6.N”e·]¾;mHºıb3¢—WRŠüQÈ¶¯J¥\\PÊÛ.¢ÛêÌÎNu)=¦>­ûˆ¹C™&ğòf™¥Îÿ\0æP§İúœ^’n*¥6¿kÊfı\Zw1¥›Jõ!K®\"²ºtugO³åøÆ7´ŠúÃÔÃH°¶¥ŠJ]¤Ï=¬F”.h¦¢ûgSQm©\\Ï£Yö{mò6îcráÍRtñ›]wqêüö§ğî¯á˜lôIÇåÙ³gQµË-·Ïğ:úŠ¾rıİ[Ocz„n”¶t×wˆ¿Ãrßs[FGÀw\ZW‹LÇFûŸ¼Ûé—¿ÌáÎnÜ–Ë›?8T}£M·ÕõÉ±-Òmõ<X~êœûÚì¼¿²ı:uV©op¥O\nYÆşGo\Z«‘FK)õos­Ô­jKß£¼{3¦¸>~ÿ\0CÌ¦1—·Ò8Â›Qİ:Õn#…N.²oü³·µãi;;È_ÛÅô¨¨æQ}¤±ê—ĞÃn•Ú{”êj0ÂUjal—3Ø×Û5{?5ü§k3<©n¯©øCÅ®³ºÔ¾ß¨V¶£wVáí-¦ù\'ÉÔÎ2÷”yºw=µ§‰üweÅ:dsÿ\0k7KüIÒ¾Õ©Ëİ«Q/\'#µMUû²ä’ş•8¿Íí¯kNR|oo‡”~´ïx—„5>½¤ø—B«J´yZı<¯/Ú>{ã-ÃHÔjÚiú¥§k*ÔªÛÔO\nNYƒÃu¥òhÅó¸¯_z–vÙÎr©¥ùö®¼?›¥\nQÆü¤Y´q˜}ğ¯±êó¥çé‡¦£QÇ™÷k·sE(Viï¾ùèß©Ä§R¦{$ğüÍÉ7&§-ğóıS§/­¸Ó‹Òk>¯yÃ<o¬è	BÊònw£Y{H?†zµÑ§9Êº·u$ê{*Qı\\[ë„¶HÆê¯55<mƒ¿áJ®WUb¦ÒäËKÖÒÔ‹?œo6q¥yÌvd^ãçcïê3”¥—ÌéR“SŠé”¶Ï©“øsŠ4¾ «^–›R´ªÑ„jTJR‚I¶–ëº0&¯[–Ş-ÅuËKC¶ğßˆkiÚÏ´Sn•Hû:°“xk=~+ÏÔººqnİŞ.3aô\n{ìoS6}…åëhW·–`ök¼_“99ÁâšúKQoXs³F¦vfñÊcÑ9\0\0\0\0\0\0\0\0\0\0\0\Z:\0\r\0î\0Ø\0\0\0\0¸Ü€\0\0*€w/Ìø\r¼€î@øùƒ\0Ç èV/È\0!Hº\0/C\0X\0@X\0`°\'@/È0@`€P;€ ú€\0à\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0p\0\0\0\0\0Êq¶‚îé=KO‡úõ(ş²	ãÛÓ]¿¬»?—‘êÊ½Le‡mëF¤#(<¦²oecø§èß¢n%ªZC\Z}if¼WJûŞ“ëä÷îy×qŒõXÛ¡‰èÃå‡³i®Æ¥Q®»j¸ÎÆ¸Üaìş&r®ÍÖÃYïÕ7ó:ßmïl²~Ù<n2;(ÖÊ[•Vmu:øTÃÙåš£[\rõC#²ö=M~Ù¦±“®n˜}<ÍÅU7×ÿ\02äv­%¶rnÆ¾_S­Uƒ\\jáá¿™y+²U:l²kiCî¾_ƒg]\ZÉuh×í× Èìc}qµz‰ÿ\0]šjİJ´“«\'&¶ËÆ~§\\ê¶ş¥&–äÉ–«½3F¿©:—ú.‘wV£æJö4ç)?7\'·ó:ªü\rÁ·+õü)¤e÷£NT¿Ã$v±©…“Z«èÆ\"[[ÇkKÊWğ«k)rèu¨7Ş…ıe‚m£«­à—ÔÏ³»â\n/ú7¦¿\rT]Íj¦æ|ºO£½wÛŠö¼ıX¦ãÀMı—ˆµZ~^ÖÒ•L}$\r_\0›oìüYIúUÓd¿Í™¡HÕÌO#N}ëâÛºş9`šjË>ÃˆtZ·=:ğü¢Î\rø®’Í+­\nåyS¼”üpFu×uyèöTîié÷7îuéĞöVòJQæmsïÙÃ’Œœr¥‡Œùú“ìÚ~ÎÕñÍåìùš^q²Y§§ÙTô†¥EşmiøIÇÔ_şÎUš}é]PŸå3êu$úü\rKHFÖ‘ÙÚ¿Ä;¸ï£å\ZñµŠœ-«b’ŸødÎ5~âª<Ş×†uØ®Ù±¨Òú&}u’XØİYCîÊKàÎ‘¥ów¯ñ6â;Ö?wÆT´ZÃ§q§j”SÊjv•—ONS•;9ÒOÛÛ\\/>{j©cûQ>Ä©y^ÛÕÆpıör•ÍeşÚ§ÎLN}V‰u\'½#êù>s©ÛÙBŞµKÂœ#;ˆ8Ëe×N¿CsÆº•å{*·Z:¶­FqT(É¸=%,¼ã+\'ÖÕ*JªÅVª/)ÅKóG­•lû[\Z™ëÏkNYÿ\0„×—hõy#Åts™Ñ«âÚzm’ŒT)ÒÂXÊkošg2”nhíBâúŠOıÅHşLúŞ¯pílûnĞæß\\éô¿üÓ‹S‚8F¦yøWDß?vÕGò3:6÷{#Çtg¤éGÌT5=rÙ¥O\\Ö©/(ßÖÿ\0óÂŸqUîñ/¥™¼“ü\Zf¯á§WoŸ†,cŸû9Ô§ş#WÂªÓzHµÑÂşá5ÿ\0ò¬×ó”üZ´0…/8ÎÑâ}Kÿ\0Å…)şpg&—ŠÜuOîq´_÷–ü\"eéøCÁïzT5J;şÆ£7ş$Îo¸bÍ_ëô=Ì&¿â#Nğ×ó/\r·Å§ûCÛøÏÆô ³y¦MùÔ±[ÿ\0vHåRñ×i¼T£¡ÖK¿°«ş•UWÀíïG]Ö`ñŒÎ•	ÿ\0áG¿€ÖRÇ±â{ØItu,a/Êh¼nÕw^n³OÚ]\\?”¿…öG¨»ş²¼‹5GÇkk­µ^Ñê¬Ûó7¿”©2Üÿ\0\'ÙO>ËŠéoÿ\0i¦É~UÖTşOšœ$!Òe‡³½hçó$ÅâI¿„LıÎŸWgKÅ¯,\\xq`óûŠÚMü4k©Ç~\Zİ¾k¯\rÛ—Fáimü%§~qL#ú«ş«ëöŠĞŒ\rªŞñŒTT#¤Ë¡¨õúÁ	äéåøLü:“¬»˜q/„U—4øú‹êù-£·÷k\Z~Ûà¥ÄÒ–«ÑŸôiÜ§åÚ£<ôü$ãz9KF¡Yôæ¥EçêÑÃ¸ğËiîørñ¥œû*Ôgşå—«¥t6=©¸˜ÿ\0ÉìeKÁ‰î¯õËXçjImëiz_ƒµÚö\\]ªPÎ6ö“_â Ï	W€¸¾Œßş«ëyèùmù¾˜lâWá~$·ŠW\Z³å—iÕp¾j,‘×Ñ×ìº3ğî§şPÉàÿ\0nbşËâ,©§Úµ[wş:qf‡áÜ¬Úø“g$·÷§m$—ÊkÔÅÕ´íYm[IÔK	NÊ¦Ö?­»¤¡î×£(Iö•¼£¬Q§Jíu?êfa¶ğ‹A”±CÄ=\"¤óŒrQmúmXWğj¬c?°ñ>“s»g¼Ÿ—»&aJS±ŒñVT6êœ?vTea	©Ğ¯kJku*U\Z~yM4fgİm·ÜÇmÆHd;¯uE8êÚdó<$èÕ¦³¿íaıná-;ø>0”kÛİ8[ZFÂæ|Ò¯\'•Íˆ,.Túàğ:Î£¨ÓhâJëú2¿œ±òæ8T­n%;zõ©ÕšiËÚË›â›yO;äs‡)ÛïoY¬êÇÑ“¸¿Â;¸^Òÿ\0Eôê³²ö+\\ßSŒ£Wš\\ß\r®^S¥^ñ\\0×Tkl8]P›ÿ\0ĞÒâ.(¢Ò¶â]~.=cú²üg2<uÆ”!Å:¿Âu”¿4NQ-ièïôë‹Dşysgá×PM¢ú›óå)/Â¡Â¹àŞ&¤ß´áqaşÍ”¥şÎE?8æ–õ–ïnŠthÏó¦v¼Yãªisë6õôì)I¿¢DÌ:gÄkéYıeæ¥¡k4öÚ³O?µ=>²KşÎ%kzô\"şÕk{n÷Ã«kRúÄ÷T¼oãJ;JãF©¼ÖR_áš9´üxâøAÊvúâ»ºUãÿ\0ÔfºIm_Ç](ú±c¹£C1­qNš–yŸ/ærô}fµÅJ´*ZVsŠ‹µíÌŸTdK¯õ)ÅFû@Ğï±û*U_Çï¦‘¿oã.›yOıÃÍ&¤|£R“ËşÕ#uÔšü2ùšÚ:º–›jègõx»ZwÔã\Z”-àßíÒm¿Ï¾NFx¬®ãVmòôiÁ·ëĞö1ãîºmêÛÃ›¬¨Ñµ›NVk¥®x?tñW…u;7N…H¥ÿ\0Ëªÿ\0#¬n/îñÛkNÓ¡h“Ã\\so¥İÆ­:õeF[T¥*2Ì—åŸ-Ì‡KÄn«ã¨ÖR}`ìë6Ÿ–ÑhÇm<\"¸êšö£¥ÉtUk×‚_*‘hí-8;†oñú¬kïîÆn„ßü2‹%µ¯iÌáÇì[*ô˜½8{Êo¡UšT.nfßOõJ±Ï÷¢Sc}Fòštg—äú˜¶Ÿ†ÚÕÏa¥ŞCª“öoË§2;->ÇŠ´©~»Jö°z~Oğ17´÷†o²Úqÿ\0£©×æÉ@óv|Báˆj÷òÿ\0¿¦áŸOÄïèW§^Ôf¤½\nùºšVÓ­Ğ\0s\0\0\0\0\0\0\0\0h\0\Z\0À\0\0\0\0®¤©@.Ä)tC·Pª	äa‚ Q¶\0ú\0ø R|€ïè@ç (èO0şEîùŸ2çêêP\00\'r“°vÔ€P\0\0\0\0\0\0\0\0\0\0\0\0\0Ø\0\0ù\0\0\0\0\0\0\0\0\0)\0qŒá(T„g	\'FK)§Õ4c\'à;ûIı£†qsk¾ljÏ–¥5åNoïGú2éÙö2xëğ$Æ{¤Æ_9VÔ%ovínáZÚïlĞ­	Bkäúüúz†ïø¥³FzÕô­?YµvÚµ•µí¾åzjXø>«äc*ğ’nJü©N…X¬ÆÆúN­)?(ÔûğôÏ29Í\'ĞÃÌÂõwè–[ÉÈâÎøÛ¹hjzÅ¦•iªj\ZUİ6ê*¥ÈÓnŒãœ}å´wí,»~(¶qŒeYAKtŞÙøy™ÄÇI^,‡¸g«Âêqºi|GW\\rUŒ¶ÂÇS•ORèœ¥,¥–÷!ÅêşÓ÷õx5ÆºsÚO~çš† œÓü2oÂö<Ïš[½½>DÉ‡¡çî[èüjµD–$×¡ÑÆó/9ÂìnÂõ&²ğß˜ÊaÜûYôçüjÕI~±m¾\Z:µxŸ.øEûJí,áo‚dÃ¶…Ãî¤2şFì.¥¶d·gWe+[›µFµUIII¹9(ôY]~\ZU¢ôÈ^ÆX„¦àóšøî9z8Ü9E>eò7#Y÷êy^Ï)Â[cö–U=N¢|²‹e‹¯©UÊsj:¥	%Ë^Õ¬ã>Ş¾İÎ¥F­*¼ï•Åo³{àäišu…õÜèFÎÑT9VMS[òãËân-ÌáÜÒ»X©BQ©º”$¤¾¨ßgÊ\ZÉçì#eo+\Zôñ)*QKëƒ±…ÃÙö5UÅ­¥ÕERâ‹œÒåO™ìlkF1ItK¹ÖBá7Õ?TnF¯¿¶\rDŞ5Vq“r5²5{šÕ}²ßâk#³U7ìnF¡ÕÆºo®Æì.§Ô¹2æ\\·*QûØÊø›Ö×1¯F5\"ı\Zòkª8*²}N5JuiV•k)¨Ê_~œ²á/ù?TQŞ{OPê\ZÖ!NN7V÷Zıµi¿šßê]¶¡ks,P¹£R_º¤¹–zeuC)—cÏ’{CbRåÙå|Q§œ£•Î9Î7´Á}§ÔryÇ9Æö…ö‹`¹ryÇ9ÇU=G´Y\\r9lÎ?9yıA–üf’5)®Ç\rTùš½ 2ås¡˜³‹Î9ò.ZitØÔ«N?v¤×ÂLáûB© ¹s~ÓU·©ıöWu[Ö›^¯\'œsl0e¿íæçïIKãÿ\0¢µ½­çììêç¯=¼%Ÿª8Õ%‰\'êşoQˆX´Ã‡[‡ô*ùöúS?¿aIÿ\0á8sà©~Ğ}qeùÏ7©TÉÆkÇkOÕæªøsÁusÍÂúdsÿ\0gÃò’8“ğ§äÛ…*?îo«Ãò™ì9Ç´\'ön7ZÑÚóõxj¾ğt±ÉkªQô§©TâÉÄ­à¿	T~í]vŸõo”¿83\"{AÎO.¾Î±â˜í©?V-¸ğ+†æ’¡«k´R]%*57óŞáÖğJ–}Ÿêq]¹íiKòhËÜş¥çõ!Ö<[yêKTşOĞO48ªıö—ŸÊ¡Æ«àF¥Gk^\"Ók>ŞÖÖ­5ø6g~l“›}Ç—\rGŒo?ßı?ËÁ^(ƒ|—ü?[Ëıb´?M›<!ã\Z}-ôºËşçP_ø¢¢9nhÒ«BjÔ©Ô¸›…Nj2«%\'§¼šŠo²É<¨u¯î£Ö>œ*øwÇû.¹«Î•Åÿ\0ã8UøC‰èËık„u†Ö^Ušª¿álú…4mÜİĞ±´¸½½­ìm-©ÊµjŸ»¬¶O*=cÇõÿ\0b_/Ó³Ôt™sÔÑµm>_¾¬®(~1‰Ûéü{ªØJ1£Ä×Ô>í*÷É|aUe’ßÇúĞ©›NŒ²ãö{ùÆxÎÙR3¾§eOÇN»5MU]cBå/«LÔíìÜø¼_ÿ\0sJ%·¥ø§¯(\';«ê]Õ[}ß½·Ñ«HñO­(ş‘Ò¾ËSlÔ³«Ì³ßİi3Í>0ğƒU›W”,mg,æW\Zlíş>ôñ9Öz‡Z¼¿ôĞ§RO\n6ú¬vyí\n|Œğ´3m}–¤bÚsòe]/W°Ôi§gu\Z®’Ú_C°1l8XÓd«izµŠYÊÅM½ÿ\0~\r¯Àõ\Z6­h¡C[µ.ŞÒ2ç‡÷—ñÁb%àÖÑÓ½£lÇîõ@‘’œT¢Ô¢÷Mw(xÀ\0\0\0\0F€@ä\0`H‘€\0\0\0V\0Êˆ_¨Q¸ ƒ\0Ä¤ù!œu@;ŒÜ\0Â.àR\0.·)>€T6\'Rî\0z€€…\0R\0(@Ÿ (\0\0è\0\0\0\0\0\0\0\0÷0\0\0\0\0À\0\0d`àâ\0\0\0\0\0\0äU±\0\Z(Ò¥FŞ4(Ò§N„cÊ©B	A/.U¶kÆ¾	ğ—:•í¨UÑ/å—í´ö£	K³•\'î¿–ó2q(q?‚¼Q {Z¶Z¥¤2ÕÅ‹ÅN^ÜÔ^ùş«—sÄÛË_µ«8Q¹iS|³¥SİœZí(¼5ô>æéßEÄü# ñE4µİ2…ÔÒÄk¬Â´6ÆÕ#‰/©ÎÚq=š‹L>OÓukù>KËxSšIã›ªÉÛÒ¾š^ô}vfJ×<¹·r«Ãš¤n º[jM.ÉU]qı%¿™uUĞ*{=gO¸²ËÇ´¨”©Ëá5˜öô8Î¡yD¾ÆíÉ>Íêwïmÿ\0ó:¹FXMeÅ¬¬tf…9­¿Ï+‡îË8ôèn­A¯ºñ‡çÔóª·.Û­óñ5Æ¾İZ_”Ã¿©zç›÷sñ¸HOy,çw–ŞÎçG\Zï~æän$³——äL˜zÜÓ{4’O8]¿Ê7ásçuÓ|yoí--Ö––åÛ&2aè}½6àäÓ”z?\'üÎÃJÖŞ›v®(ÓYªr¥‰ËÄ–üä>Òùz´¿!ö¼½äğŞv5Á‡­¶¼Œ‚–ßÒ{çşG>ê{egÑ&‰gŞïŸ#—JöJ)©­—sQff¯oJåa<¯MúQæo›âxêzªŠnsÂ^ga¤TºÕ\'*Zuµk¹õı^0³ûÍ¼G£ëän,ÄÃÓ;ÔŞ’Û±§í˜_{ÿ\0#f¿ñ\r:N§èøTIeÆh¹/„s¿Ôó5¯êQ¯Vh:s§´ã-¥èÔÚcºaë~Ú“ûËên+ÕÚGŠz£OºÇ§rÃUÆî]vy}=Iæ/»…êµñÁ½äÖòGƒ­´}î›ylnÓÕğ×¼¶,jœ^ú7P“]©·qoir±Z9÷Ì¢ŸÀñÖÒÏë0–Ï~‡.–²¿¦æ£R%&Š½KxµesVœZÚ.NqOá,•ê7Öñnvğ¹K÷%ìåøíù,5šmo>»šÿ\0JSoiç>¥‹Baİş›·‹j²­E¯ßƒŠÊ5-rÃ—›ít”zå¶†7t³\'&Û›ËßòòB–øjO™ù³\\Œ==oO©g{o>ØUøœˆê%Ò¬võ<¼«ZÉåÁ9.íåıGµ¶İï©dr0õ_n ŸóÔ¿¾Q»§-ãRá$y;v×+Fµ+Y=å†!ë~ÕßÔ¿i‡ï#Ê~©ròÔÆ6ìj„£»u[Ï3M˜º9ß¯CS¬¼òyÚUãN**qÛ/u“~7qOïÇäEŒ;ÅYy£R«êtŸkŠxr‚/Úã…ºú±”Ãºö«¾Æ¯k“£ûRÆT–Wôjã}ÚÛÊC#ºö¾¡Uõ:uqœá½½MÅ]¼¬±‘Ï¯Wo›·™¿N²p[å5±ÒÖ¨§>gğx6¨T¹„yUY´º\'ì¾#ô>ÑPè=½âŠj¦ÿ\0²™¢W—ª\rÊ¬3®’k?CĞ¹ú•Tõ<Ó¿»[©Á¯Z_ù›‘¾¼kgò‹C’½´ÓÔóêşï?v†<Û–áê7}]+g·Nigò.Qè=§©}¦NƒôÊk6ô±æª´şœ¦¨ê•2”¨A/?mü02®÷Úc¸Uy±äu0½SÚR„W’y7~ÕÒqÇÄ¹Ÿ´]ÙÒk|;mªëº&­^­Ä.t™Îvğ„ÿ\0VùÒRæ7xXÊÆ2r•Ü^q%õ5«´ºµ‰r;8Ow¹„ÿ\0”ÏşÓm8VÆ\\×J7WÜ¯´“÷)¿ë5Ì×”W™”5^!ÓôM\"ûUÔê¨ÚYÒuf»Ï´b½[Â>$â½zïˆ¸‡PÕõ	fîö««4ºE~ÌW¢XKàn>ñÛuµ{—–ä“o;zšµÎø©Ó±ÂrOwĞÚ“Ì°“ytˆsV¯vF›ò5=F¼ß½S™ú¤Î\nËÎKÌÅ¥^£Aã. Ğ«B¦•¬_ZJ/eJ¼£¹Ç.yqéƒ1pOœEJp¥¯[Úë^Ò—,hWşò÷Î(ùò”[Â]N÷E‹WQK-—„LvbÖ—İœÄÚWØ«\"¤àKj±å©E¾™]>k(ô§Ï^:Ö—úeH7{˜ĞÏš—ğÙl}\rÊÛx‹8jWŒ¥-Ê±×øƒ›`\0 \0@\0 \0\0\0¸ø€\0\0°€\0*½ÇùêB6óPşcä>_ˆó‰rü€Ÿ<Œ›ù\0ÛÌmæ‹¿Ü\\|@Ç>¥!~`BıP\'Ô|Ù@ˆ\0A<€¤(\0\0¸ìB À\0\0\00\0\0\0\0È\0\0\0\0\0\0Ø\0 \0î\0\0\0\0\0\0\0¤\0\0\0\nh«Nj3¥Zœ*RšÄ¡8©E¯&™¨àøƒÂÍRö•4åSH¹ù¶Ã¤ß›¦öú`Æúÿ\0†\\G¤©Ô¶·§ªÛ,¾{\'Š˜õ¥/àÙô(1jVİÈéÙòãË^TjfàğéN.2[şëÜÚ†!•—×;çcëoCÒµÚ*–±§Û^Etu`œ£ğ—Uòf8âí«)TáİNv“Ãj…ä=µ?D¦±$¾§)Ñÿ\0k\\½Øg™acÉ|2xß8ïæw<EÀ¼U¡sÎóKjÿ\0ïOÛÓÇæKâîªI·¦»áçVkİ¨˜Îîuiá¤Î5K©E>H9vGM;ÙÇ®ø‘¼RMFx^FZÃ›=JK™Ê”—¢–pq§¯Ó‹Y§4ıN<êe¼IK>fÔÚ^óŠiõ)…¸âHâ\\‘1å¹ç®8·W¥)Ôµ¨¡M<(Îššõêv7s  Ü ²Îì¡{c:0J7^ãõò~F«ó%Şp]{µÈXQ”hÛÓÅK«…B?ã\'Ùw3Å¿iš%5§éÜ´í(,Î¬åÕ÷”šY”Ÿ§ÁlcN¾¶Ñx:–›§rÛF²ö·u»Ô;¾¸]0p>ÕNêœiÚó:9yu~oşfùc³œÆešøsÄ»‹ø[×ÅM¨Âµ\\8Iù6·ÅìÏSÆœ/mÅzgµ·”hj´W5…¶{òOÎ/.¨ù½IÆuåk|­±ó3ƒ|a¹KCºº§R½(¹[IËyÁláÇãœ)~],Ì×˜Æâ¥Í­Z´.)Îz3öuiIåÓ’ë_OCj7=}7ó3Šœ-MÕ×4Õ]E%qO|VŠ[KoÚ]=Q„¹ãÊ§ÌWŸùÿ\0(å©N2Õg.kºilŞW|’7.Ov’òò8jqÊËOàúš£–Òykc\r9sºäqß\röFªw²ÆdÛ~‡•Yç¹­\'º:-ßÔKïK™öO©¶µK…\'ËQç;f¶Î}‰UÆ=wK;É‡:\Z½eF¼ÚzµYA7.g×\'MN.SNxHßRO¦øô”Ã¹©S	¶“^LÕJ£R|Øólé½«}^|˜UTeº^I²æS÷ô¬½ÜË-y3ZÖåÎ_ø<ìêrg¾zwGwğE(óg÷·B-+ÅëÖ¯%¾{ù÷5ÇYk¯ÿ\0#È«˜IíËŸVnªÉ¬§ÓËÈ¼¥8ÃÖ~™ï>†¯ÓRMûÏ\rt]O*ë6ÛİoÔ×ÎÓm¶›òc”œaê£­ÉE<É¾ı¶Ï©­kRoicn­G+³ÂMäëëë–k*2¯Vu“Ä•:Rå§7Ÿ¡yIÆık3R\\Ó‹îÑ»rJ+šXêÿ\0‡sÆ*²|¼³m5½‡´œ^òÙ¯Ìs“Œ=Ì5”ÿ\0o©È§«&¶–>=YUÌ£Ûmc8ìËú«îS©Ìº$¿Ï ç)ÂBßTRÙ³vZ‚YÄŒMş•FÎj5£Y>¾í9K¿¡ìøBÛRâ‹8]ÙòÙéÒ|±»¼„¢ªcgìá÷¦»geô7[Zz15ÃÑTÕTV[g¦²¢ò·~‡c_ÃÍNµ+-rÆµV¾åKiS‹şÒ“ä/¸s‰-*JŞ›JK9ûm6ŸõvY5÷á\"!İ½i<-—Çb-qEıç…³ÏĞó54mm>iXC•~íÌ^QÔŞİW²¸v÷öwşõ55\'ñéĞ“i…ŠÄ½ó×¢–3¿Lyš–º³×‰%ª(Ë•´»á¿r§³íÜÏ›+Á‘Vµ³İ6Ÿc_é˜½¹£øëí¯™{Ø]VwÁV ÛÌ¤ù»¶ó’ù²pd_ÒğoƒùjĞ0 ÷ìŒ}é\'•9gâjû|ù}¤ñÛ#Í8=úÕiwŒR~{\Z*ë°ºs¾Ï=G‘g™üÏ5Å|U-2ÎNŒ¢¯kEª{ïôæf«|Î!&©ã¿}¾VÜ?§ÔnÖ„½­Ü¢ö©[ŒvÙ¨,üß¡†¦ÛË;;i;Ë‰+ª½s\')<åõ6jÑJM-ıOdGB::şY>¦¨C\'+“?ó5Bœ›Âó,C\\œuO=\rú0Iå¬ú3~³“J“—‘İé=}¨Ê_g¶­8SNu%\nnJ	,·&–Æ¡‰³§£JU&”_¢=çğÕ[ûÊu¹°†îrÙ7çğõ=/\0p¦áRUgzê¤sÌ³ÖR{Ez¿ÄÏ\\/Á4×,ní#oaM/ÕGı¯ô|ñæûö,Ş#»3=!£€xR•}6Íä$¬Şô`¥(J£ıü¬4¼¼ú²Ÿ	èP®«JÃÛTQäNâ½JØ]vS“Áİ¤’I$’Ù$¶H§š×›N]+X«ƒk¤i¶•£Z×Oµ£V9Jp¦”—Ìç\0g»@\0\0H\0 \0ì\0v\0\0\0\0\0\0\"ô¶\0v (÷è_çhw\"Xî>c îÁ>cŒ¿ç °|ÀÛ üÀüìOaòÀñ2üˆ\0cÌ\00_ßÈ\n\00\0\0\0\0\0\0:€\0\n;\0\0\0\0\0\'À \0\00\'˜îQÜ\0ø\0\0€\0\0\0\0{\0\0à\0â\0\0\0Ô\0\0\0\0\0\0\n›[§ƒÏqğçæZ¾‘kZ»_õˆGÙÕ_Ûğ=\0?ˆ<„¹§ÃšÓ•¾£Ogıä0ş©˜¿ˆü:â}J¦££]:1Mı¢Í}¦<Û‡¼¾qGØMÅå<3œéÖ}-0ø-Fu\\¾ËZZê”“ÇÅg(ê.õš–µeJyÙõGİ¼GÁü9Ä©şœÑlo*?ö²¦£U|*G_Sã?øVÇ†|E»Ò´e_ìq£B¤cZ£©(Êqm®g¾6îb4b:·Ë Ó®\'«ŞR·¶„êUŸHÇwô=ì4Zv.½.Z·‰frŒ²—ŸÓ»4p-¶ƒ¡sÑ‚©ªŞ\'T}iÇ§*òÎwôG#Pª•·êgWìó›Un£B|•œ^c6±ÈŸ“ÜÇeå—Z}´«K–”jÉ´İIgóÂèdxG†ï´JwÚş§s*õ\\±cmYĞ§²œ’æ”šßªXú˜ú—¿—J/£‹M~­ÜRœ&šrë(ÉÆKa:¤³öÃNê7vvtëU¤ŞÕ®§qúÆrkğ=Š¼¶ö*•zv°‹ÌcF”6ø,ÑĞãmUÔ±¾¾¶o££<mäs-í.iÆRûuÍJÏÚUŸ4–:4û\\z15ù¾º•Å¼ùÄéV”:J{K-a³\Zêşé÷w—V\\C¨ØN´¥R¡NZtäü”£Ìã—œe|Q†­oøÒš…¿Ö’éúÊjMoæÎÆÇˆx®…7íuÉNyÎ}”p—À¶Õ­£Vc´¹\Z·ñN‰¨ÜZUÓ®õ›jm{í:ÒRX´\\zÆ]šİg¡ÕÖ·Ô-ÚUômzİ­¿Y¦WÇáz\n<eÄô¢¿×á&¼éãò;\n>#qu&”kĞŸ¿(¯ÌçŠ5™x•«ÛÑŠÄêBK~YÒœ7ù¤hzî—Ë{må*Š-}L‹ø¢T¡F£òU²¿UOïjEı»@¶¸Šë˜ÑŸçÆ¾ægÙŒ-uëZó’ûe¶c&£V>òó9¬«I{ñ—}šÜÈãı\Z²åºá+*«£OO ××ëÜq•wÁZu<õp´qÿ\0xWÒI·Éãù±¹eåÔÒæú(õ[µOÂÚ³æ©¢Õ·è±NâæœSøslnşğÖ¢N•mBŞ;bPÕ*6¾RÈáóNOïwMw5Æ£K¦ŞK±ì©ğïŞÁ»N&×aÿ\0j¥4¾R‚fäx‡îVœmªÅÿ\0JÚ„×àòäå\rªU\'8BIÎ/ŠOİøüHé)ã£ºÙàöKÂÊ*¤ªZq½7)cùı5<ãÏ–¡±WÃm~œÚ¶â­M÷¨ëQ}|¹eù.Ç8yolû8\'ğ5ÆŸ*J1Â]ê*øuÅP‚tnxjåùS¿©ÿ\00h\\Æ±ûš^•UtÍ=Z›üÒ-‹Ê%ĞEµ5Î²–{›î½²ğ«ÍºìÑÙUàŞ5¤ñ>»«ı*Võÿ\0”Gã@â[úÇ	ëÑô§l«²q˜ôLÃ‰osJ”Ô¹U×mUıõ¥Ä—±RS}N\rzwVøW:»CÍTÓ+¯ü\'¦¡o	bµ;ªïmjÃó‰1*ç¹Eµæ»ùlNlÅ=ğuÿ\0¦4È§Í¨ZE¾¼Õ‰¹NşÖpıUÍ	\'Ş5ş$Â¹®\\²„¥%ˆõ]NûI…\ZÕ¥Ï‡ãk\'’•Ô%QF2“Î=ïÈì¬*\\ÓórKªÌwEˆIr(İÑZíİŒ­mé[ÚÇõóÇ3©)oÇ}–^Qí4}Væÿ\05]WJiÂ)å¯u}p¶Ùv1Ö«§ÎóS©y™ÙW¹KÚ7MI6¶æÆ:ã·¡ÜĞ¿£g¦P°·ç¯Bœ_4¦Ü}¬í¾ÿ\0CpÌÆ]¾…â…å•ï´ZÎRşnÜ\'ñÓ-çÏs8é÷Zgpı:Öõ£RX·N´>ô%Óä×t|¹V0iÎœ#K8÷ ö_î{\r8¢\\3¬Á\\NKJºj78YT¥ÑUù~×¦ıÖÓÔšÆ:9G©ëZ±u¦j¬Uz2ûşÉ¥V›ûµ\"¹Íg¾ÏcÆêU%yZò¼“©W•I%…²Áü]á*œO¡;½:^±c{]ğë®²¢ßF¤¾ï¯Äùº½­ıJ1­BKÙÉf-Áå,ôk³óFuc‘L;ªP÷vÂìûª¬1Õ|3*\ZªÏ-haÿ\0Eõ4Æ\Z¢YU!/GrŞ©ÕŒ“ÂÆ=HªÃ™guÓsªµuİ.kˆ¨Í-ğÎ#Ô=ù(Ó¨Ü^û0ôJ¯LKç’Ô®¡ŞVÌéè\\{JNmJ;gŞ%8T¸­lG¢XüB¦·¬R°·öµ•I\'ìé.ïÍúöú¥mBæWœ§9½Ûè¾º«¤ØT¹s¹»£R¿~y§òÆMèéVi\'Op:éZ+,Z2Æò±œd±g³9¶z¥}%;;Šíö¥JSü‘“)^~µæŒœ`¶ıU²©\'¶?uö9vz¯ª¯õk> ¯E¤œª:v”ı3–¶ßË¹ê®¦{9Û£Â[ø­º^ÒæÎv´¼îš£ôRiş Ò¸N§5\rC^³•NW7BÂKº‰%–ÛŠQ]–ìÈ6\\(îªÒ¡úW¿»¯ï:´\Z2XûÕjlŞıó‚xR’Óhİ*Ô£N«§Mó*±©(T”ÓÃ”¹¢ÒæxXXHíiéå7‡I£p“ASvZK¿­-ãSU®áşU<|w“=¥—R­Ég«\\«È=á¦iÔ>Ïn£ı5™iàìuNÕµ]5ÒÒïåB¬ªGW1Ú„?jTéErÎXÙ)í¾[Û|£évÚU¤(Z©Ë	)U¨Óœß›Æ~´ñèµ¬Û«¢h´4ëXS…½zPX…½¨Â×Nà„Î]¢0Š¤( \0\0\04\0\n\0\0\0\0â\0\0\0mú\0€\0½ˆP\0ˆ\0Ã*{uü\0½ˆ\0üGoA‰52d<c§àÀ~£¸æËr“ê>@\nÈ> 1±qé‚|†Ş_€©H\0¤ğ.@óR@&Ş P\0¹z‚@`\0\'Ä Bö\'¨ \0\0\0ó\0\0\0\0!@d|À\0?0\0\0\0€\0\0\0@\0\0\0\0\0\03ä\0\0R\0( ÓĞùûùAÃAÖ5[*Ş/WåöP«oO5ë6Ò„6ûÛıÔóÕã¹•|DâHè:K6¾ÕY>Uä»·è‹Âî…:«Šµªj®¯t¹­UE—oI¦”½\'$ßÁ<y—¤FÌÌôx¾ğKQ¼´œøÇU¯aJ­\'Yé³Š¬³ÿ\0iQ¦“_»×öŸC6è\Z=… XèÚ|$¬,èFŞœ*>|Å/ÚÏVú³°\"\"ËÍêœ	Âš¬œ¯t\r>So.té{)}c†y}CÁÍªoN¾ÔlßìÆrÄ#ıõÍÿ\0“g¯tÆJûÁ]FOO×-+®êæİÓoÓİoêt7~qeµ{Œ.´.¡¿Ã›—¡ôa63Â¾Ç_wËW\\#Ä–._háİU/:t=ªÿ\0³­«gyo•qa}Gıå­Hÿ\0ë„Ú{e_¼ÌùP¹—ÇÜñR÷ÚøÄ¢ÓüQUk|?G§ï¯‡FÏ¯jF5*B_ÒŠ™Ã¯¤iµŞké¶O~ÚüĞò Ëäïk&êSşò4Ç5–`Ó^I£êzÜ+Ãµ¿áı\"oÖÎŸü¹ğoOïpî‘ÿ\0ú°ÿ\0‘<¯™Ê_1F‹İòÙ#v0©·»,.¹‰ôœ¸…dš|;¥áöT6‡œÿ\0ş]Ó×Â\ryReó‹§<ç‘·İàÚ«F‹U(ó\'¶;GKÃ^—]‚ş­J‹¶;HÛ—†\'•£8úFê²]<¹Ç•>æeòõnÑêÊNV1‹ôm?ÀäYèºuœ\Z¡h“o9rrSéYø[ÂN8…Í?X^Uø~ñÇŸ„Ü/$ıİIgÿ\0}›üËåIÊ_>ÆÚ”rÒ«=¹jKş~¯ênSö‘şnêá//jßæg‰xAÃmå\\ë1ø^zç¼M2ğ‡Ú\\·ÚÌ_ûø¿Î#Ë“,½N›ıN­xºm˜¼ÍúzÎ¹ˆë5ßô]$ÿ\0ÏşFe—ƒºCÎ5}[Ó.?ÂmOÁ­2I¯ÓZ“Ol8S{cà8OºgäÄ´¸·Z‹ä†¯Ju?uÓ[ü³şrséq×ÑxWT$ıSäÏOÀ½“æ¥©ÖRó•µ<ş5KÁ˜¶Üx…ã=Šø‹ÆŞçOg¡âWS\'8¶»F¤’‰Å—|CmU«\Zû‘t”+§•×£g¹~IaÓâK¿eÿ\0)œjş]TÂ\\AnÖÙR´—ğ˜ÅÈÃÊÚøÙVê¯³ºĞ+Z´)5ø£z~!pıä¹¯øSK®üêXÛÏø‹ø~çK»­k}oö{ÛwÉRS_³(¾ñktşOsÉX[J¥ücQ5F;¾U×Ğ“kDâV+Ö¡q_\0Ö÷kpf—şæ•¾±¤ü/ºÂ«ÃÔhçşÆ5é>Â…KëÛ-:Â—·¿»«{[tñ¼¹Jo´RM¼.‰ú‰8Šÿ\0J×u-6æÚ*êÎâ¥µ\\O™sÂN/6-fÖ^,İ\ZÖÌŞĞÏhj—Q_G&nG‡¼7¯ÿ\0WÕµkw³XÔyñòšgÏô8ÂösŠ«gNQmE(­Ş^^¦t¥áW¨~·FÓ”±ÒĞÛÓî–sì“õvO¸>¬?QÅ\Z²mlæ¨T_áGwÃœÁÖtî#ªJ\ZÜªËÜÕ?gìãŒr¥a·ç³<6¥á§P·YpÃ¯\'6¨İR“é¾2míÑ#‰§øqÄ×¶ñ¯K‡ï¨Óy\\.©-¼ù\\ÿ\0ˆëé	ú¾†³½Ó-­m­m¥AP·ŒcF÷¹V#†óÑ.§•Ôü?á\rSP­xÕÕ¥ZÓsœl®åFOvùVÉ·»Æ7lÄpğÇmå\'m=~ŠÎËÛR–>“7¨p‡ZÉªÕ¸¦«ìã×á?¬úL&>oI¯øcsmwĞUêêösŒ¥%sqF…ZRÊÄTš÷Ö3Ùc·“ÏÕğ÷‹)IÊ—×¨—GËiã×ï¬›ß¢xö–e\Z|Gæ”­y¿,³{wÅÖiQÔ.µT’Ú…]>§4—«PègŸC3ªï†¸’‚N¿kN2YS¥kíâ×Æ›‘Ã—ëîjqá­u®îZuUüO¥ê|k¢YÓ·Ó´ÛÊvĞX§J›Y¤¼’QKéæséñŸˆ©,ğŞ³?,iUâNù¯)x{®âJå·áırmô‹°©¾¨çi<Æº„”g¤}‚ïVÔ¥\Z0_¦æşHõöš¿‹:­9J®§iô_İû}WB¦3×—y}QÍÑ´ ¹»©.2º{WÕ++©ò·•ˆ´¡c{#­vùÆ\"\\í«0ì´*PĞ-a¥U¾¶âYB0§ga¥P¥N’K»årøÊrßÈó%påK\Z6×Vö­uZP«öz)*<±æŠÊIo‡Ÿ“ôkjv6şÃK±û5·OgB‡$[óo«ùœËİë#o©i”n-Ô¹¹.RqÎ\ZÎ;¼7õ=3£XŒZ\\ãRÓ9‡‘ğïƒô›N°¿Ôô»[Rî¼êW‡;§	<Â	=’QÇO6{5+kæhĞ¦ûrSHçÑÑ¦ÔUÅt¢’Jã—©Ø[ØÛ[áÓ¥ù½Ø‹ÓN1N´æ]=;{»Üb-SµS§Ğìm4ª5EíjuË[\'çƒ±;kZİ#£¥tâœ \0(¤(\0\0 €iè\0\0à\0@\0>\0\0\0À2;2ş\0èT€…!@… ìC¹P.@óÄe Àñ`…\0]É°ÛÔ¿¡ŞL\0yÈ\nO¨ÎÃèA°\0<€d~\0RuCªùäl\0\02\0\0\0`\0ObŒ€ g \0øĞ	ò(\0\0\0\0\0\0ì\0€\0\0@\0\0\0ø€\0à\0\0\0\0\0\0\0\0WRM^ëìZUå×ıOæˆÌá\'¤eˆ5µ./ñFÛNY•¤kb§¥\ZIJW„f§Œí²ì—cx\'köc[Õj$åJ\nÖ2ş”¥Í?ÉlOt¯`\0\Z\0\0R2\0(\0 \0\n\0 €R\n (¤(\0\r»ŠĞ·¡Rµi(Ò§)7Ù!Üc-ôºÚ=µK‡\nz&ı\\¥Š_´¥éÑüWÄÅzG„|M¬ÛÛê\Z|iÙÛÜ¥%+ªŠ›åóåÃxktúµ¾{Ã³ñëjZŒ\\´‹Z®”³Ë97štñÑ­¹¥òFio/,^\"gÌ×=ŞÃO,8.ŸÚªVwÚÌéºs¹’ÄiÅ¼¸Óláe½Ş>Fş¹áoëºÍş¯Ãvw·Sö•«sN2œ±ÕòÉo±ìÁ#§f˜Æ~xlß48zt¥Õ8_Ü,?5ï™61åŒc™K•%™<·7æjr«N2qs\\Ë²İ¢{M±\n5\Z]6Q_‰º\0ÚÍgÒãıi7ùJ¯ïWÇ¥8%ø¼› dÃeÛBK%V§õê?áƒ]\Zp£Q„i¯è,\ZÀÌ˜^i~ô¾£™şóú„#äC/Í“â\n@)@€A`(\0P\0€\0(\0\0H\0 \0\0:€\0\0D\0‚\0€0\0¾Ä¸w&\0\0\0¬\0}w!@……Ø\n¡\nÕ—$Ø:¿Qô\07ø\r¼ÿ\0\0}Ì?€‘ôú„÷\0¨Œmæ\0·`À’}@€7ô(\00<€Ÿ™{\0¶\0;\0\0\0u\0ó\0\0\0\0\0\0\0\0\0\0\0\0\0`\0\0\0\0\0\0\0\0\0\0\0›ñ\Z·±àÍKg«G¤<_‹u].Ûö«Ç+Óò5NìÛ³‹àN©t÷wwµª)y¥.Uù3ß[ÂÚ>ÃÃÍ\n/« æı\\§\'üORa¨\0\0\0\0\0\0\0\0\0\0)\n\0\0\0\0\0\0\0\0( ÃøÃ«~Œàú´ã7İÉRÛgËÖ_î=ã4å«qN C.5T!$»º³åÆ;û©¿M‹_YöfŞÏiáVôÓÕH¥sy¶VøÍ&—Ê<¨õ¡F4Ò„!£è¶@Ì4 P@\0\0)@€\0\0\0)@€\0\0\0\0R@€¤\0R\0)@€\04€\n\0\0\0\0\0\0\0\0\0 \0¤\0\n@\0° .ä\02\0„ÈğèPÌ 2;€ü~„ÆıGÌ. 7°{÷ÀcÈg¨ú€Èÿ\0=F~#°“æÇÌÈ¤îà>C¹{÷#õ`\0òyQ\n‡ÌQŸ˜\0Àê>l\n\0@\0\0\0\0ó\0\n\0\0\0\0\0€\0ª`\0€\0\0\0\0w¯bá®Ìcõ[z\Z+V*âMVk?r-ò¦û­ŞßädîèÁ_Êîƒ¾·Š­ÍŠ<“ŠiÅnßoŠêşE‘2Ìû2g†:®£ÀºK´«	»z1·­¼ºu\"–bıpÓø4û¤Ç\0Ğ©K€ëÎqåmB´á¾}ÕEté÷Y‘ÌÄæ\Zì\0:\0\0\0`\0\0H\0\0\0\0\0\0\0\0\0\0\0\0\0\00íuúWù@Y¤›£jå9,~Õ:MgûÍŠ;Éƒ€â®¼e×®6~ÎéÓšpKø—ğÌ¤÷†^ø€ \0\0\0\0\0\0\0)D\0 \0\0\0\0@R\0\0\0\0\0€\n@\0\0\0¤\0\r €\0\0\0\0\0\0\0\0\0ê\0\0`\0 \0\0\0 \0\0~D\0\0Ô\n@\0äAØ\n £ñ}‡–J\0A–PPÇÄó‘êˆm‘òù”ƒ\0>C#2«äL‚ïçø\0!ó€4\\?0\"Š\0˜ø” Àt£“ĞÜ˜Èò\0\0!@\"â\0€¤*ù\0\0…\0qÜ\0\0@\0ˆ\0\0éÔ\0<ŸÖâK{8VáÛWwJ0—¶¥BIWMtqOi®ØM?‰„ªø“Äº]ZÑ¿ÓõÊ\n/ooeZ/àıÆ‘ôÉy¥ûÒú‰ÊDCä»Ï8†î2«w©U²¦–T>ÏËËéInyZšÕ¶§uí.5:5y’uş»³íéÉÎ.3Ä“í$š:«ÎĞ¯^ot=&åùÖ³§?Í˜™õk1ìù“†øêçH³°ÕçJ1|ŞÊ£8g?ºÿ\0Ó\\øÅW•+ØqE½yË1¶•\n±§Û\nIå®û¼îfú|\'ÃtãËO‡4HGÊ6’ÿ\0	¢·p½eŠ¼7¢ËãcOşC“òa¸øÆ±ååÖøv«ëŠºEX~UL<Pãzqåö|t×Y/´Ñoåº_S$×ğÏ‚«}î\ZÓáßõQ•?ğ´q*øMÁu“^Ÿ¥;úñKåÎ\\XòûÅ./¹°¸´«¢ğãöô¥IÔ£©N.*I¦×2êGø³¯éZ-…£Â”ïêÚÛÂŒ®¨ëTyërÅ.w­,½úäö5|áY&¨ËY¡ŸÜÔjKğ–N%Oô_ö:çRÿ\0ñhÏó¦Ëù’âÑñ–M~»‚µÔÿ\0în-êãF¸xİ¤Æn7\\-Åô1ÕıŠü3g¯‚Ë8£ÅW±]½¥şX6+x;ªÓX´â›iã×XN?à¨NÆ]½/¸JMªÔuû~™öºU]³ğÉË^4ø~¢]zt[íVÂâ?ı3Åê>q¥+yJÇVÑ¯j¥´*N½ür_‘ÒWà(IÆ\Z—qÑsÑÕR‹ùOeY#UñŸ‚VSGâK\núŒmê;Z3ŒãÏUEòEóEa9anw=âO	jºUzœM¢Pº­F«oVö9Ó›½öiäÄ_èJ”~ÓÃv•ä–é_[ÍgR87\\Ä‘Oíívé\Zv•Wá?V_D}G_ÑkÅ:\ZÆ™V/¼.é¿âsèW£q½\nÔªÿ\0»©~LùNãn¡ÿ\0Yğæá/:zr—ø$Î~°¥ŸiÁºµ³{sBÆî\roè° ™‡Ø>Î»/ ä—îËè|hôÍ*ÂJP–±§TM5ÍqwKš9‘ÕªSÇ±ãn&¡ı]f§*şû!˜}zöê>P·â}vœcOµœl—µ¸¡YıZÉÏ¶ã>7·Y£ÇuªÅôûFŸoU¨óe.?ñÚ\\ïˆt[¸/Ù¯¥8\'ôÇæséx±Ç±KšÖôtn)¶¼óÎĞY}GÅş+Œ¯Ã¼=V}İ=RpOá˜?ÌæÑñ“ZIF·Â¤óõ]f”¿	E2#3üAˆíüiÆ÷kôÿ\0øj´+¯ÂHäGÆıIF¿qm÷–Ÿ/øfÊ¸e@cŠ^3ğcÃ¯_W¶óöÚMÂÇÒ,ìtß¸Rº…µ¯Z{y¦Ô+Bt^Ë8÷â–}_t¬¬.nä¹£B”ªµ”³Ê›Æ_ÀÂ>j•nüH×gVS¸µŒ›Má796—àzş:ñ@£Ã·¶Ö7tµ«š3¥\Zt½è¬¬7\'ÑlÌsà6§ooÆ7Ò¼ª¨ÒS©\'y.©ü™©éLzå=rú0\ZhT§^œgF¤*Aô”dšfã„ÿ\0v_BJ´‚ò¼<o¸yÁ\0©7Ñ7ğGMÄ¼Q¡p½··âZÎÂ/îÆ­Eí\'é,ÊOÑ\"à—ŠzMz2­CKÖ½_-Jô!AN+ö¢§%,|R=	q=.\'¡;‹M6şŞÒ)rÜWŒ:¯ºƒRnXîÒÇ©f&0ïÀP\0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0(\0\0\0\0\0ÀÒ\0(\0\0\0\0\0\0`\0\0\0\0\0\0|€\0@\0À\0\0\0ï°\0\0\0\0²\0wÀˆØ>à>ƒå±\0ô Ÿ@\0º\"cÈ©2‹ò\'Èò |\0mä=qŸ&€}FGÔ.€ŞCüî7ï€çağ@¨	·qòË\0W\"/™~#á€\0™õE`>¡v \0ÂÀ\0\0£°À\0À\0:çØ\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0º\0\0\0\0v\0\0\0\0\00\0•Ñµğ5)Ë÷¥õ4‚\r^Ò¼ş¦İhB´qZ:‹ÊpRüÍ@£­« èÕ“U´}2¢ò¥7ü“Wğ×‚µz>Êû…ô§çša/ïCñ=håø#áÛÇş¯I$ú-BçOhn¿8‘*:={ZW÷	ÿ\0™§à¿	?æŞ³K¿¹©Tş98•|ĞZ~Ç[â*K²öôçş(Pb\n	SYû7jq}½µ­şJ&ÃğgT¦ù¨q”ôji~1ªŒÌ20•O	ø9PÖôj±ş;ˆ?ÂLêõO\n8ÉÑ’¥SI¹ÎÜ´ïêÃğœ\ZüO r |¥á§ZÖ”Ñ››¨$Ÿ´µ¼¡(¿¬Ô¿‰G„xÊT¡Âzå9G-MSƒÇÃÁõÀC\rr|·WAâzöª†«Â\Z½Õ¼gíc\n–~Ñ)µ‡$”¶~¨êï8{Q¡%ÃÜCcÑ{¶×‘ŠùFX>¸*“]_2õeñ®™J:=Â¸Ÿé2å·³§smSó,oóLîéñ¥{²ã-O¿6«5ïS>°çŸïKê9äúµôD%ò=~2Òî9¨×âş\'»RxöS×*b^˜‚M‡‚¸CQÔªÎç‡8R„ß¤µHJŸ\\µ*™ªşKéu&ºa|#mõmüDdÃp÷†6VÕ¡uÄwrÖnbÔ•Kh´¶÷7sÇô›^†AIF1ŒRŒb’I,$¼’(,Î@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0QHQÜ\0!@\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\n@â\0\0†@`P@¹{l\0\0\0¤(\rˆPÖä\r½HP\0wõ7ØmÔê\n@\0Àƒaßr}/}À£#ò/Ì\0d\0>#aù—p\'@\n\0\0º\nƒ\0\0\'Ì\n\0\0\0\0\0\0X\0\0\0\0\0\0ˆî\0\0\0à\0\0\0À\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0(\0\0\0\0\0\0\0\0¤\0\0\0\0À\0\0\0\0\0\0\0\0\0\0\0À\0\0\0\0\0\0\0\0\04²\0QHR\0)\0 \0\0\n\0\0\0@\0\0\0\0\0\0\0\0\0˜\0\0\0\0\0\0\0ø \0¤¸úX\0Rv(]H!rÏÄÃ\0\0ğğê>¡ô\0p½Fÿ\0å€{‡æùH‡ì\0 ı\0™p; @Øò\0±Ø 	·r˜\0:ğ\0\0p\0|@\0\0\0€\0\0\0\0\0À\0\0è\0\0\0\0\0\0\0\0\0Ü\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0€\0€\0\0\0\0\0\0\0\0\0\0\Z\0A\n\0P €@(\0\0€\0\0\0\0\0\0\0\0\0\0? \0\0\0\0\0 \0\0\0\0ø\0+\0^½	ŠB\0{°R‡æäB‘nAGP@v  £æÀ`;n\0Ì—ê~còaŞc¸âO˜ø”	·şeù‘€.Grw\n>l“Ô\0\'È\n\0}\0˜\0\0\0\0õ\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0†@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ø\0\0À\0\0\0\0\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0v\0\0\0\0@Á@€\0\0Ü€HP\0\n@;HP\0\0\0\0\0\0\0À\0ê\0\0\0\0\0\0\0\0\0\0`\0\0\0\0ÀØ\0@\0¬€\0Î@€@.Á¸…\rˆÔƒä>|È˜!  ü@¸õ2méôIòco —âO—Ğ|€¨üî? /q@(ïĞgâ\00L|J€.›‚/@à^À\0\0\0\0\0\0\0\0|€Ø\0\0\0\0\0\0v\0\0\0\0\0€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0w\0\0\0p\0\0\0\0ÀĞ\0(\0À\0\0\0\0\0`)\0\0\0€\0\0@( €\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0Ü\0é×¡HÀ\0\0\0}A{¸2\0èrH_0ø€îÄ>€>ı\0±2;˜{àz\0ÆÀ\0ß¸\07õ€é€+õô   ;”…èÀ\0@(\0\0\0À@ > \0\0\0\0\0\0\0\0\0\00\0w\0\0\0\0\0\0\0\0\0`u\0\0ø\0\0p\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ĞR \0\n\0\0\0 \0\0\0\n@\0 €\0€\n\0\0P\0…\0\0\0\0\0€\0\0\0y€\0\0\0\0\0\0\0\0\0\0€\0‚ê\0¤\0\nBüÀ˜+\'˜èA@!@¤*|Ëø\0\0\0@ò\0|\n_ÀÄ½€\0>a\0\0v!X·b1Ğ/FúèÌÅ\0Aóç¨â;ï°™|ÈPE)\0 }\0¨€\nŠ\0\0°Ô. N¥#(\0p\"(@\0@\0è\0\0\0p\0\0\0€\0\0\0|z\0\0\0\0d\0\0\0w\0À\0\0\0¸\0\0\0\0\0:à\0\0\0\0h\0\Z@\0\0 \0\0\0\0 \0\0Ø\0\0\0\0\0 \0\0€ \0\0@R@\0\0€\0;\0\0\0\0\0\0\0\0\0`\0\0\0@\0\0\0\0\0\0è\0\0\0Ü\0(î\0…@\n\0?¨EC°½@ì\0w!XB¯Èv û\n\0¡Aü\0@aÛa°™|\0> 7ê:|Ğ\rö\0Iòü@@>(¤@\nO!°ü€ğ\0:=õ$Æû\0òÜ/¨°^€ŸˆPD\'‘@\0\0w)\0¹È\0@\0\0ù€€€…ê n€\0\0|ˆ Àh\nÀ\0;”\0\"êP \0¨]\0|À}7\0\0è;€€\0\0\0wÈ@h\0\Z@\0\0\0\0\0@\0\0\0\0\0@\0\0\0\0\0\0\0\n\0\0\0P\0…\0\0!@\0\0\0\0\0\0\0\0|\0\0\0\0\0\0\0ù\0\0\0Ü\0Ø\0\0\0\0\0\0\0îF\0ú\n\0øÜŒ\0/æ@\0¤+ù\0êÁ\n\0\0¶G@‘A¸øğ(|‡QòĞ€î\0İ@‘H\0½Cê\0¬ƒ¾À\0ÈüÀ\0ì\0\0À¤ëØ€\0Ä]\0\0T\0-\0ºìPÉØ\nAä\0 …\0B€ õ\"\0R€!@âR0…\0\0È€›îP!@ê_¡H…\0À\0B“±~ \n\0\0€ˆ£!ş`h\0\ZD(\0@\0\0€\0(\0½p€\0\0\0\0\0\0\0\0\0\0\0\0\0(\0\0€\0\0\0€\0(\0\0\0\0\0\0\0\0\0\0\0P\0ä\0À\0\0\0\0\0\0\0\0‚\r€(\0\0\0 \0\0`Q\0 ¤\0 \0€\0P€@õëñ\0Ô\0PL\0\0\0A\n@\0@\0\0ì\0£¸\03ä\0\0;€\0.€\0/p\0ƒü \0 \0\0ÀÜ\0 \0ú\0\0\rÀ“ä\0±\0Ø\0€\0\0 \0\0\0@\00\0\0\0\0ÿÿÙ',0),
(30,'790E683B','162089','000','CABASAG','MARICHOOOO','','FEMALE',8,8,'+639487595475','+639167789585','',NULL,0),
(31,'1111','1111','111','ROSARIO','ANN','','FEMALE',8,9,'+631111111111','+630001111111','ETET',NULL,0);

/*Table structure for table `studentlists` */

DROP TABLE IF EXISTS `studentlists`;

CREATE TABLE `studentlists` (
  `studentlistID` int(11) NOT NULL AUTO_INCREMENT,
  `academicYearID` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `roomID` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentlistID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `studentlists` */

insert  into `studentlists`(`studentlistID`,`academicYearID`,`id`,`roomID`) values 
(1,3,22,2),
(2,1,22,2),
(3,3,23,2),
(4,1,24,3),
(5,3,27,2),
(6,3,28,2),
(7,3,29,3),
(8,3,30,2),
(9,3,31,3);

/*Table structure for table `textmessages` */

DROP TABLE IF EXISTS `textmessages`;

CREATE TABLE `textmessages` (
  `txtMsgID` int(10) unsigned NOT NULL,
  `nBody` varchar(255) DEFAULT '',
  `mobileNo` varchar(100) DEFAULT '',
  `nDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isSent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`txtMsgID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `textmessages` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT '',
  `pwd` varchar(45) DEFAULT '',
  `pin` varchar(30) DEFAULT '',
  `lname` varchar(45) DEFAULT '',
  `fname` varchar(45) DEFAULT '',
  `mname` varchar(45) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `positionID` int(11) DEFAULT NULL,
  `mobileNo` varchar(20) DEFAULT '',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`userID`,`username`,`pwd`,`pin`,`lname`,`fname`,`mname`,`sex`,`positionID`,`mobileNo`) values 
(1,'admin','a','112233','DUERME','CHELLA MAE','RUSIANA','FEMALE',3,'+639773705828'),
(5,'jrey','a','1234','SANTARITA','JUN REY','','MALE',1,'+639167789583'),
(6,'staff','a','1122','STAFF','STAFF','STAFF','MALE',2,'+639167789584'),
(7,'principal','a','p1234','TEST','TEST','TEST','MALE',4,'+639111111111'),
(9,'etet','a','8888','AMPARADO','ETIENNE','','MALE',1,'+639167785985');

/*Table structure for table `wrongpin` */

DROP TABLE IF EXISTS `wrongpin`;

CREATE TABLE `wrongpin` (
  `wrongpinID` int(11) NOT NULL AUTO_INCREMENT,
  `mobileNo` varchar(15) DEFAULT '',
  `nDate` date NOT NULL,
  PRIMARY KEY (`wrongpinID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `wrongpin` */

insert  into `wrongpin`(`wrongpinID`,`mobileNo`,`nDate`) values 
(1,'+639309854469','2020-01-19'),
(2,'+639973757031','2020-01-23'),
(3,'+639973757031','2020-01-23'),
(4,'TM','2020-10-11'),
(5,'TM','2020-10-11'),
(6,'TM','2020-10-11');

/* Procedure structure for procedure `proc_absentstudents` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_absentstudents` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_absentstudents`()
BEGIN
	SELECT id FROM ay_students a
	WHERE a.isExempted = 0 and id NOT IN 
	(
		SELECT id FROM attlog 
		WHERE academicYearID=(SELECT academicYearID FROM academicyear WHERE active=1 AND DATE(datetimeLog) = CURDATE()
		)
	);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_attendance_student` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_attendance_student` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_attendance_student`(vid int, vayid int, vfrom date, vto date)
BEGIN
    
    SELECT
table1.gen_date,
vid as user_id,
(SELECT CASE WHEN TIME(datetimeLog) BETWEEN '06:00:00' AND '7:31:00' THEN 'IN' ELSE 'IN(LATE)' END FROM attlog WHERE attlog.`id` = vid AND TIME(datetimeLog) BETWEEN '6:00:00' AND '08:31:00' AND remarks = 'IN' AND DATE(datetimeLog) = table1.gen_date and attlog.`academicyearID` = vayid) AS timeInAM,
(SELECT remarks FROM attlog WHERE attlog.`id` = vid AND TIME(datetimeLog) BETWEEN '11:00:00' AND '13:00:00' AND remarks = 'OUT' AND DATE(datetimeLog) = table1.gen_date and attlog.`academicyearID` = vayid) AS timeOutAM,
(SELECT CASE WHEN TIME(datetimeLog) BETWEEN '12:00:00' AND '13:16:00' THEN 'IN' ELSE 'IN(LATE)' END FROM attlog WHERE attlog.`id` = vid AND TIME(datetimeLog) BETWEEN '12:30:00' AND '13:30:00' AND remarks = 'IN' AND DATE(datetimeLog) = table1.gen_date and attlog.`academicyearID` = vayid) AS timeInPM,
(SELECT remarks FROM attlog WHERE attlog.`id` = vid AND TIME(datetimeLog) BETWEEN '16:30:00' AND '23:59:00' AND remarks = 'OUT' AND DATE(datetimeLog) = table1.gen_date and attlog.`academicyearID` = vayid) AS timeOutPM,
(select lname from student where id=vid) as lname,
(SELECT fname FROM student WHERE id=vid) as fname,
(SELECT mname FROM student WHERE id=vid) as mname
 FROM 
(
SELECT * FROM 
(SELECT ADDDATE('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) gen_date FROM
 (SELECT 0 t0 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t0,
 (SELECT 0 t1 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1,
 (SELECT 0 t2 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2,
 (SELECT 0 t3 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t3,
 (SELECT 0 t4 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t4) v
 
WHERE gen_date BETWEEN vfrom AND vto) AS table1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_attmonitoring` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_attmonitoring` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_attmonitoring`(vgrade varchar(30), vsection varchar(30), vaycode varchar(30), vdatefrom date, vdateto date)
BEGIN
    
    SELECT * FROM (
SELECT
  `a`.`attlogID`       AS `attlogID`,
  `a`.`id`             AS `id`,
  `a`.`datetimeLog`    AS `datetimeLog`,
  CAST(`a`.`datetimeLog` AS DATE) AS `dateLog`,
  `a`.`remarks`        AS `remarks`,
  `a`.`timeSent`       AS `timeSent`,
  `a`.`isSent`         AS `isSent`,
  `b`.`rfid`           AS `rfid`,
  `b`.`studentID`      AS `studentID`,
  `b`.`lrn`            AS `lrn`,
  `b`.`lname`          AS `lname`,
  `b`.`fname`          AS `fname`,
  `b`.`mname`          AS `mname`,
  `b`.`sex`            AS `sex`,
  `b`.`gradeID`        AS `gradeID`,
  `b`.`isExempted`     AS `isExempted`,
  `c`.`grade`          AS `grade`,
  `e`.`section`        AS `section`,
  `b`.`mobileNo`       AS `mobileNo`,
  `a`.`academicYearID` AS `academicYearID`,
  `f`.`ayCode`         AS `ayCode`,
  f.ayDesc,
  CAST(`a`.`datetimeLog` AS DATE) AS `dateDay`
FROM `attlog` `a`
      JOIN `student` `b`
        ON `a`.`id` = `b`.`id`
     LEFT JOIN `grades` `c`
       ON `b`.`gradeID` = `c`.`gradeID`
    LEFT JOIN `sections` `e`
      ON `b`.`sectionID` = `e`.`sectionID`
   LEFT JOIN `academicyear` `f`
     ON `a`.`academicYearID` = `f`.`academicyearID`
     WHERE c.grade LIKE concat(vgrade, '%') AND e.section LIKE CONCAT(vsection, '%') and f.ayCode LIKE CONCAT(vaycode, '%')) AS aa
     WHERE aa.dateLog BETWEEN vdatefrom AND vdateto and remarks = 'ABSENT';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_studentlist_byteacher` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_studentlist_byteacher` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_studentlist_byteacher`(vtid int, vsearch varchar(50))
BEGIN
select * from ( 
SELECT
a.`studentlistID`, a.`academicYearID`, a.`id`,
c.rfid,
c.studentID,
c.lrn,
c.`lname` AS stdLname,
c.`fname` AS stdFname,
c.`mname` AS stdMname, c.sex as stdSex, c.gradeID,
(select grade from grades where grades.gradeID = c.gradeID) as grade,
b.`roomID`,
b.`roomCode`, b.`roomDesc`, b.`teacherID`,
d.lname AS tLname,
d.fname AS tFname,
d.mname AS tMname
FROM `studentlists` a
JOIN rooms b ON a.`roomID` = b.`roomID`
JOIN student c ON a.`id` = c.`id`
JOIN users d ON b.`teacherID` = d.userID
where b.teacherID = vtid) as tbl1 where stdLname like concat(vsearch, '%')
or stdFname like concat(vsearch, '%') or stdMname like concat(vsearch, '%');
    END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_teacher_absentstdlist` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_teacher_absentstdlist` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `proc_teacher_absentstdlist`(vfrom date, vto date, vtid int, vaycode varchar(30))
BEGIN
    
    SELECT
a.attlogID,
a.id,
b.studentID,
b.lname AS 'stdLname',
b.fname AS 'stdFname',
b.mname AS 'stdMname',
a.remarks,
a.datetimeLog,
DATE(a.datetimeLog) AS 'dateLog',
a.timeSent,
a.isSent,
a.academicyearID,
c.ayCode, c.ayDesc,
t1.teacherID,
t1.lname AS 'tLname',
t1.fname AS 'tFname',
t1.mname AS 'tmname'
FROM attlog a
JOIN student b ON a.id=b.id
JOIN academicyear c ON a.academicyearID=c.academicyearID
LEFT JOIN (
	SELECT
	a.studentlistID, a.academicYearID,
	b.ayCode, b.ayDesc,
	a.id, a.roomID,
	c.roomCode, c.roomDesc, c.teacherID,
	d.lname, d.fname, d.mname
	FROM
	studentlists a
	JOIN academicyear b ON a.academicYearID = b.academicyearID
	JOIN rooms c ON a.roomID = c.roomID
	JOIN users d ON c.teacherID=d.userID
) AS t1 ON a.id = t1.id AND a.academicyearID = t1.academicYearID
WHERE a.remarks = 'ABSENT'
AND DATE(a.datetimeLog) BETWEEN vfrom AND vto
AND teacherID = vtid
and c.ayCode like concat(vaycode,'%');
    END */$$
DELIMITER ;

/*Table structure for table `vw_attlog` */

DROP TABLE IF EXISTS `vw_attlog`;

/*!50001 DROP VIEW IF EXISTS `vw_attlog` */;
/*!50001 DROP TABLE IF EXISTS `vw_attlog` */;

/*!50001 CREATE TABLE  `vw_attlog`(
 `attlogID` int(11) ,
 `id` int(11) ,
 `datetimeLog` timestamp ,
 `dateLog` date ,
 `remarks` varchar(10) ,
 `timeSent` datetime ,
 `isSent` tinyint(1) ,
 `rfid` varchar(15) ,
 `studentID` varchar(15) ,
 `lrn` varchar(60) ,
 `lname` varchar(50) ,
 `fname` varchar(50) ,
 `mname` varchar(50) ,
 `sex` varchar(6) ,
 `gradeID` int(11) ,
 `isExempted` tinyint(1) ,
 `grade` varchar(30) ,
 `section` varchar(45) ,
 `mobileNo` varchar(20) ,
 `pMobileNo` varchar(20) ,
 `academicyearID` int(11) ,
 `ayCode` varchar(20) ,
 `ayDesc` varchar(100) ,
 `dateDay` date 
)*/;

/*Table structure for table `vw_aystudents` */

DROP TABLE IF EXISTS `vw_aystudents`;

/*!50001 DROP VIEW IF EXISTS `vw_aystudents` */;
/*!50001 DROP TABLE IF EXISTS `vw_aystudents` */;

/*!50001 CREATE TABLE  `vw_aystudents`(
 `ayStudentID` int(11) ,
 `academicyearID` int(11) ,
 `id` int(11) ,
 `rfid` varchar(15) ,
 `studentID` varchar(15) ,
 `lrn` varchar(60) ,
 `lname` varchar(50) ,
 `fname` varchar(50) ,
 `mname` varchar(50) ,
 `sex` varchar(6) ,
 `gradeID` int(11) ,
 `sectionID` int(11) ,
 `mobileNo` varchar(20) ,
 `grade` varchar(30) ,
 `section` varchar(45) ,
 `img` longblob ,
 `ayCode` varchar(20) ,
 `ayDesc` varchar(100) ,
 `semester` varchar(30) ,
 `active` tinyint(1) 
)*/;

/*Table structure for table `vw_noattendance` */

DROP TABLE IF EXISTS `vw_noattendance`;

/*!50001 DROP VIEW IF EXISTS `vw_noattendance` */;
/*!50001 DROP TABLE IF EXISTS `vw_noattendance` */;

/*!50001 CREATE TABLE  `vw_noattendance`(
 `ayStudentID` int(11) ,
 `academicyearID` int(11) ,
 `id` int(11) ,
 `rfid` varchar(15) ,
 `studentID` varchar(15) ,
 `lrn` varchar(60) ,
 `lname` varchar(50) ,
 `fname` varchar(50) ,
 `mname` varchar(50) ,
 `sex` varchar(6) ,
 `gradeID` int(11) ,
 `sectionID` int(11) ,
 `mobileNo` varchar(20) ,
 `img` longblob 
)*/;

/*Table structure for table `vw_phonebook` */

DROP TABLE IF EXISTS `vw_phonebook`;

/*!50001 DROP VIEW IF EXISTS `vw_phonebook` */;
/*!50001 DROP TABLE IF EXISTS `vw_phonebook` */;

/*!50001 CREATE TABLE  `vw_phonebook`(
 `phonebookID` int(11) ,
 `lname` varchar(100) ,
 `fname` varchar(100) ,
 `mname` varchar(100) ,
 `mobileNo` varchar(30) ,
 `positionID` int(11) ,
 `position` varchar(30) ,
 `fullname` varchar(303) 
)*/;

/*Table structure for table `vw_rooms` */

DROP TABLE IF EXISTS `vw_rooms`;

/*!50001 DROP VIEW IF EXISTS `vw_rooms` */;
/*!50001 DROP TABLE IF EXISTS `vw_rooms` */;

/*!50001 CREATE TABLE  `vw_rooms`(
 `roomID` int(11) ,
 `roomCode` varchar(150) ,
 `roomDesc` text ,
 `teacherID` int(11) ,
 `lname` varchar(45) ,
 `fname` varchar(45) ,
 `mname` varchar(45) ,
 `mobileNo` varchar(20) ,
 `positionID` int(11) ,
 `position` varchar(30) ,
 `fullname` varchar(138) 
)*/;

/*Table structure for table `vw_sections` */

DROP TABLE IF EXISTS `vw_sections`;

/*!50001 DROP VIEW IF EXISTS `vw_sections` */;
/*!50001 DROP TABLE IF EXISTS `vw_sections` */;

/*!50001 CREATE TABLE  `vw_sections`(
 `sectionID` int(11) ,
 `gradeID` int(11) ,
 `section` varchar(45) ,
 `grade` varchar(30) 
)*/;

/*Table structure for table `vw_student` */

DROP TABLE IF EXISTS `vw_student`;

/*!50001 DROP VIEW IF EXISTS `vw_student` */;
/*!50001 DROP TABLE IF EXISTS `vw_student` */;

/*!50001 CREATE TABLE  `vw_student`(
 `id` int(11) ,
 `rfid` varchar(15) ,
 `studentID` varchar(15) ,
 `lrn` varchar(60) ,
 `lname` varchar(50) ,
 `fname` varchar(50) ,
 `mname` varchar(50) ,
 `sex` varchar(6) ,
 `gradeID` int(11) ,
 `sectionID` int(11) ,
 `mobileNo` varchar(20) ,
 `pMobileNo` varchar(20) ,
 `grade` varchar(30) ,
 `section` varchar(45) ,
 `guardian` varchar(60) ,
 `img` longblob 
)*/;

/*Table structure for table `vw_studentlists` */

DROP TABLE IF EXISTS `vw_studentlists`;

/*!50001 DROP VIEW IF EXISTS `vw_studentlists` */;
/*!50001 DROP TABLE IF EXISTS `vw_studentlists` */;

/*!50001 CREATE TABLE  `vw_studentlists`(
 `studentlistID` int(11) ,
 `id` int(11) ,
 `lname` varchar(50) ,
 `fname` varchar(50) ,
 `mname` varchar(50) ,
 `mobileNo` varchar(20) ,
 `academicyearID` int(11) ,
 `ayCode` varchar(20) ,
 `ayDesc` varchar(100) ,
 `semester` varchar(30) ,
 `roomID` int(11) ,
 `roomCode` varchar(150) ,
 `roomDesc` text ,
 `teacherID` int(11) ,
 `pin` varchar(30) ,
 `tlname` varchar(45) ,
 `tfname` varchar(45) ,
 `tmname` varchar(45) ,
 `tMobileNo` varchar(20) ,
 `positionID` int(11) ,
 `position` varchar(30) ,
 `pMobileNo` varchar(20) 
)*/;

/*Table structure for table `vw_users` */

DROP TABLE IF EXISTS `vw_users`;

/*!50001 DROP VIEW IF EXISTS `vw_users` */;
/*!50001 DROP TABLE IF EXISTS `vw_users` */;

/*!50001 CREATE TABLE  `vw_users`(
 `userID` int(11) ,
 `username` varchar(45) ,
 `pwd` varchar(45) ,
 `pin` varchar(30) ,
 `lname` varchar(45) ,
 `fname` varchar(45) ,
 `mname` varchar(45) ,
 `sex` varchar(10) ,
 `positionID` int(11) ,
 `position` varchar(30) ,
 `mobileNo` varchar(20) 
)*/;

/*View structure for view vw_attlog */

/*!50001 DROP TABLE IF EXISTS `vw_attlog` */;
/*!50001 DROP VIEW IF EXISTS `vw_attlog` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_attlog` AS (select `a`.`attlogID` AS `attlogID`,`a`.`id` AS `id`,`a`.`datetimeLog` AS `datetimeLog`,cast(`a`.`datetimeLog` as date) AS `dateLog`,`a`.`remarks` AS `remarks`,`a`.`timeSent` AS `timeSent`,`a`.`isSent` AS `isSent`,`b`.`rfid` AS `rfid`,`b`.`studentID` AS `studentID`,`b`.`lrn` AS `lrn`,`b`.`lname` AS `lname`,`b`.`fname` AS `fname`,`b`.`mname` AS `mname`,`b`.`sex` AS `sex`,`b`.`gradeID` AS `gradeID`,`b`.`isExempted` AS `isExempted`,`c`.`grade` AS `grade`,`e`.`section` AS `section`,`b`.`mobileNo` AS `mobileNo`,`b`.`pMobileNo` AS `pMobileNo`,`a`.`academicyearID` AS `academicyearID`,`f`.`ayCode` AS `ayCode`,`f`.`ayDesc` AS `ayDesc`,cast(`a`.`datetimeLog` as date) AS `dateDay` from ((((`attlog` `a` join `student` `b` on(`a`.`id` = `b`.`id`)) left join `grades` `c` on(`b`.`gradeID` = `c`.`gradeID`)) left join `sections` `e` on(`b`.`sectionID` = `e`.`sectionID`)) left join `academicyear` `f` on(`a`.`academicyearID` = `f`.`academicyearID`))) */;

/*View structure for view vw_aystudents */

/*!50001 DROP TABLE IF EXISTS `vw_aystudents` */;
/*!50001 DROP VIEW IF EXISTS `vw_aystudents` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_aystudents` AS (select `a`.`ayStudentID` AS `ayStudentID`,`a`.`academicyearID` AS `academicyearID`,`b`.`id` AS `id`,`b`.`rfid` AS `rfid`,`b`.`studentID` AS `studentID`,`b`.`lrn` AS `lrn`,`b`.`lname` AS `lname`,`b`.`fname` AS `fname`,`b`.`mname` AS `mname`,`b`.`sex` AS `sex`,`b`.`gradeID` AS `gradeID`,`b`.`sectionID` AS `sectionID`,`b`.`mobileNo` AS `mobileNo`,`b`.`grade` AS `grade`,`b`.`section` AS `section`,`b`.`img` AS `img`,`c`.`ayCode` AS `ayCode`,`c`.`ayDesc` AS `ayDesc`,`c`.`semester` AS `semester`,`c`.`active` AS `active` from ((`ay_students` `a` join `vw_student` `b` on(`a`.`id` = `b`.`id`)) join `academicyear` `c` on(`a`.`academicyearID` = `c`.`academicyearID`))) */;

/*View structure for view vw_noattendance */

/*!50001 DROP TABLE IF EXISTS `vw_noattendance` */;
/*!50001 DROP VIEW IF EXISTS `vw_noattendance` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_noattendance` AS (select `a`.`ayStudentID` AS `ayStudentID`,`a`.`academicyearID` AS `academicyearID`,`b`.`id` AS `id`,`b`.`rfid` AS `rfid`,`b`.`studentID` AS `studentID`,`b`.`lrn` AS `lrn`,`b`.`lname` AS `lname`,`b`.`fname` AS `fname`,`b`.`mname` AS `mname`,`b`.`sex` AS `sex`,`b`.`gradeID` AS `gradeID`,`b`.`sectionID` AS `sectionID`,`b`.`mobileNo` AS `mobileNo`,`b`.`img` AS `img` from (`ay_students` `a` join `student` `b` on(`a`.`id` = `b`.`id`)) where !(`b`.`mobileNo` in (select `msgs`.`mobile` from `msgs` where `msgs`.`created_at` = curdate()))) */;

/*View structure for view vw_phonebook */

/*!50001 DROP TABLE IF EXISTS `vw_phonebook` */;
/*!50001 DROP VIEW IF EXISTS `vw_phonebook` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_phonebook` AS (select `a`.`phonebookID` AS `phonebookID`,`a`.`lname` AS `lname`,`a`.`fname` AS `fname`,`a`.`mname` AS `mname`,`a`.`mobileNo` AS `mobileNo`,`a`.`positionID` AS `positionID`,`b`.`position` AS `position`,concat(`a`.`lname`,', ',`a`.`fname`,' ',`a`.`mname`) AS `fullname` from (`phonebook` `a` join `positions` `b` on(`a`.`positionID` = `b`.`positionID`))) */;

/*View structure for view vw_rooms */

/*!50001 DROP TABLE IF EXISTS `vw_rooms` */;
/*!50001 DROP VIEW IF EXISTS `vw_rooms` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_rooms` AS (select `a`.`roomID` AS `roomID`,`a`.`roomCode` AS `roomCode`,`a`.`roomDesc` AS `roomDesc`,`a`.`teacherID` AS `teacherID`,`b`.`lname` AS `lname`,`b`.`fname` AS `fname`,`b`.`mname` AS `mname`,`b`.`mobileNo` AS `mobileNo`,`b`.`positionID` AS `positionID`,`c`.`position` AS `position`,concat(`b`.`lname`,', ',`b`.`fname`,' ',`b`.`mname`) AS `fullname` from ((`rooms` `a` left join `users` `b` on(`a`.`teacherID` = `b`.`userID`)) left join `positions` `c` on(`b`.`positionID` = `c`.`positionID`)) order by `a`.`roomCode`) */;

/*View structure for view vw_sections */

/*!50001 DROP TABLE IF EXISTS `vw_sections` */;
/*!50001 DROP VIEW IF EXISTS `vw_sections` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_sections` AS (select `a`.`sectionID` AS `sectionID`,`a`.`gradeID` AS `gradeID`,`a`.`section` AS `section`,`b`.`grade` AS `grade` from (`sections` `a` join `grades` `b` on(`a`.`gradeID` = `b`.`gradeID`))) */;

/*View structure for view vw_student */

/*!50001 DROP TABLE IF EXISTS `vw_student` */;
/*!50001 DROP VIEW IF EXISTS `vw_student` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_student` AS (select `a`.`id` AS `id`,`a`.`rfid` AS `rfid`,`a`.`studentID` AS `studentID`,`a`.`lrn` AS `lrn`,`a`.`lname` AS `lname`,`a`.`fname` AS `fname`,`a`.`mname` AS `mname`,`a`.`sex` AS `sex`,`a`.`gradeID` AS `gradeID`,`a`.`sectionID` AS `sectionID`,`a`.`mobileNo` AS `mobileNo`,`a`.`pMobileNo` AS `pMobileNo`,case when `b`.`grade` is null then '' else `b`.`grade` end AS `grade`,case when `d`.`section` is null then '' else `d`.`section` end AS `section`,`a`.`guardian` AS `guardian`,`a`.`img` AS `img` from ((`student` `a` left join `grades` `b` on(`a`.`gradeID` = `b`.`gradeID`)) left join `sections` `d` on(`a`.`sectionID` = `d`.`sectionID`))) */;

/*View structure for view vw_studentlists */

/*!50001 DROP TABLE IF EXISTS `vw_studentlists` */;
/*!50001 DROP VIEW IF EXISTS `vw_studentlists` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_studentlists` AS (select `a`.`studentlistID` AS `studentlistID`,`a`.`id` AS `id`,`c`.`lname` AS `lname`,`c`.`fname` AS `fname`,`c`.`mname` AS `mname`,`c`.`mobileNo` AS `mobileNo`,`b`.`academicyearID` AS `academicyearID`,`b`.`ayCode` AS `ayCode`,`b`.`ayDesc` AS `ayDesc`,`b`.`semester` AS `semester`,`d`.`roomID` AS `roomID`,`d`.`roomCode` AS `roomCode`,`d`.`roomDesc` AS `roomDesc`,`e`.`userID` AS `teacherID`,`e`.`pin` AS `pin`,`e`.`lname` AS `tlname`,`e`.`fname` AS `tfname`,`e`.`mname` AS `tmname`,`e`.`mobileNo` AS `tMobileNo`,`e`.`positionID` AS `positionID`,`f`.`position` AS `position`,`c`.`pMobileNo` AS `pMobileNo` from (((((`studentlists` `a` join `academicyear` `b` on(`a`.`academicYearID` = `b`.`academicyearID`)) join `student` `c` on(`a`.`id` = `c`.`id`)) join `rooms` `d` on(`a`.`roomID` = `d`.`roomID`)) join `users` `e` on(`d`.`teacherID` = `e`.`userID`)) join `positions` `f` on(`e`.`positionID` = `f`.`positionID`))) */;

/*View structure for view vw_users */

/*!50001 DROP TABLE IF EXISTS `vw_users` */;
/*!50001 DROP VIEW IF EXISTS `vw_users` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_users` AS (select `a`.`userID` AS `userID`,`a`.`username` AS `username`,`a`.`pwd` AS `pwd`,`a`.`pin` AS `pin`,`a`.`lname` AS `lname`,`a`.`fname` AS `fname`,`a`.`mname` AS `mname`,`a`.`sex` AS `sex`,`a`.`positionID` AS `positionID`,`b`.`position` AS `position`,`a`.`mobileNo` AS `mobileNo` from (`users` `a` join `positions` `b` on(`a`.`positionID` = `b`.`positionID`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
