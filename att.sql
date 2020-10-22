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
(27,'A97CF697','179452','','CLAVECILLA','FELMARKRISH','MACO','MALE',10,12,'+639973757039','+639052169107','MR CLAVECILLA','����\0JFIF\0,,\0\0��\0�Exif\0\0MM\0*\0\0\0\0�i\0\0\0\0\0\0\0\Z\0\0\0\0\0��\0\0\0\0�\0\0\0,\0\0\0\0F\0i\0l\0e\0 \0s\0o\0u\0r\0c\0e\0:\0 \0h\0t\0t\0p\0:\0/\0/\0c\0o\0m\0m\0o\0n\0s\0.\0w\0i\0k\0i\0m\0e\0d\0i\0a\0.\0o\0r\0g\0/\0w\0i\0k\0i\0/\0F\0i\0l\0e\0:\0B\0e\0l\0l\0_\02\00\06\0L\03\0_\0(\0D\0-\0H\0A\0S\0A\0)\0.\0j\0p\0g\0\0\0\0\0��XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ �\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0�\0\0\0�vued\0\0L\0\0\0�view\0\0�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0�\0��\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\r%+28>ELRY`gnu|����������������&/8AKT]gqz������������\0!-8COZfr~���������� -;HUcq~���������\r+:IXgw��������\'7HYj{�������+=Oat�������2FZn�������		%	:	O	d	y	�	�	�	�	�	�\n\n\'\n=\nT\nj\n�\n�\n�\n�\n�\n�\"9Qi������*C\\u�����\r\r\r&\r@\rZ\rt\r�\r�\r�\r�\r�.Id����	%A^z����	&Ca~����1Om����&Ed����#Cc����\'Ij����4Vx���&Il����Ae����@e���� Ek���\Z\Z*\ZQ\Zw\Z�\Z�\Z�;c���*R{���Gp���@j���>i���  A l � � �!!H!u!�!�!�\"\'\"U\"�\"�\"�#\n#8#f#�#�#�$$M$|$�$�%	%8%h%�%�%�&\'&W&�&�&�\'\'I\'z\'�\'�(\r(?(q(�(�))8)k)�)�**5*h*�*�++6+i+�+�,,9,n,�,�--A-v-�-�..L.�.�.�/$/Z/�/�/�050l0�0�11J1�1�1�2*2c2�2�3\r3F33�3�4+4e4�4�55M5�5�5�676r6�6�7$7`7�7�88P8�8�99B99�9�:6:t:�:�;-;k;�;�<\'<e<�<�=\"=a=�=�> >`>�>�?!?a?�?�@#@d@�@�A)AjA�A�B0BrB�B�C:C}C�DDGD�D�EEUE�E�F\"FgF�F�G5G{G�HHKH�H�IIcI�I�J7J}J�KKSK�K�L*LrL�MMJM�M�N%NnN�O\0OIO�O�P\'PqP�QQPQ�Q�R1R|R�SS_S�S�TBT�T�U(UuU�VV\\V�V�WDW�W�X/X}X�Y\ZYiY�ZZVZ�Z�[E[�[�\\5\\�\\�]\']x]�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c�d@d�d�e=e�e�f=f�f�g=g�g�h?h�h�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn�ooxo�p+p�p�q:q�q�rKr�ss]s�ttpt�u(u�u�v>v�v�wVw�xxnx�y*y�y�zFz�{{c{�|!|�|�}A}�~~b~�#��G���\n�k�͂0����W�������G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z��M��� �����_�ɖ4���\n�u���L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v��V�ǥ8���\Z�����n��R�ĩ7�������u��\\�ЭD���-������\0�u��`�ֲK�³8���%�������y��h��Y�ѹJ�º;���.���!������\n�����z���p���g���_���X���Q���K���F���Aǿ�=ȼ�:ɹ�8ʷ�6˶�5̵�5͵�6ζ�7ϸ�9к�<Ѿ�?���D���I���N���U���\\���d���l���v��ۀ�܊�ݖ�ޢ�)߯�6��D���S���c���s����\r����2��F���[���p������(��@���X���r������4���P���m��������8���W���w����)���K���m����\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(��\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0	��\0[\0\r\0!1AQa\"q��2��#BR�3br����$Cs��4Sc��%&6dt��5D�����\'�EFTeu����\0\0\0\0\0\0\0\0\0\0��\0:\0\0\0\0!1AQ2a�\"Bq�����CR�#S�$3������\0\0\0?\0�d���p;�\0\0)\0RP\0\0\0\0\0\0\0�\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n@\0��\n@\0\0\0�\0\n\0\0B�A\0\0\n)\n\0�\0\0\0B�@\n\0\0\0�\0\0\n\0\0B�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H@\Z�I�\0\0�P\0\0\0\0A\nP\0\0\0\0\0\0\0!@\0\0\0 ER�R\0\0�@\0\0\0\0H!AD\0\nB�!H\0P\0\0\0\0\0\0\0\0!@\0\0�\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��#@\n@�)�PB��p(\'`\0\0\0\0\0\0\0\0\0B�\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\nB�\nB�\0�P\0\0\0\0\0PB�\0\0(�\0 \0P!@\0\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0�P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�;��\0)\0\0\0��\0\0;��\0^�B�@\0\0\0@\0\0\0@\0\0\0\0`\0\0\0\0\0\0\0\0� \0P E �\0@ \0\0��\n(\0B�\0(\0B�HR@\0B��\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0i@4)\0\0\0\0\0�@\0�\nAI�zPN�\n\0���\n\0� \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0CD�Bޖ��C����(��ԥ�\'�U��%�5�yÿmw4�#��y��͟�ʧ]>��rsԲS�\n����&����g\n�� \0@(!@\0(�\0\0\0\0\0\0(\0\0�\0\0\0\0\0\0\0\0\0\0@(\0\0\0\0\0\0!@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@(\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0�\04\0\0 ��\nB�\0�\0(�A\n(\0\0\0\0\0@�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0��V��y?$k�s�ٕ4�Ƣ!��p//�1�Q��~�����|�\\Tq����U���^�I=�ָs�X��Z�1��R��g��7�df��<Υ���Mr�Q�0�9s,���˧��Zjq�Yf3������R^f�]rT��L��55�,��.�/�9��繍4� ��e����W����9��=|*�ћ�GGoyc�Ү�s�ո��L�\Z7T�bj�N[�4�ʨ\0�@\0�\0@P!@\0P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0!@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Oq�\r\0Q\0\0R@�\0 R\0�@(\0P@)\n\0\0\0�\0�\0(\0\0\0\0\0\0\0\0\0qL�\r�@ڝ#�G��$î�C=�kE.�\'v�mN�{��5y+�*\"ӂ�<���Q���Y=��e\n�3��׳R��X�V\r��/�g�jN+���k�W��U�5����T*ŧ�䵮�YK���p��<S(�Ks�i��*�X�}�A�h7����*���P�.�����M��&�V�њ�I��+��#��7ʪM#�i�EJ�X�14^O{\n����{�v�P��ē�vtnS�r��E���JqaU3z315n%�SJe2�\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0P@(\0\0\0\0!@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0�\04\0\0\0|�\0\0�\0�@��@�  \n@!A\0��\n\0\0@A@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04�\n48S��� `�d�8(\'��\\Y�Y�;�ES�Q�,���u\r&#$⾇����NP����^�2y:��65�S�v���毖x�O���\'mM�C����P��EUR�^L�\'[�:7I�M}�xmZ�����%�o������\Z�h�T���ꌕ�qE�Z��鹀�/�d���\\�G[N�TѪn�⼙1�/��58M,H�(\\�%�|�þ#ʔ����.��\Z��F\n5��闌��3�N�T�n�i��Z�*E5#��t���h�Y�\'��Zu���љ�j�N[�4�R*�\0\0\0�\0\0\0@P\0\n\0\0P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B�(H\0�\0\0\0\0d\0�\0\0\0\0�@��\0@�\0���\n@\0�\0 \0\n\0��\0\0\n\0\0\0�\0 \0\0\0\0\0\0\0\0�2�6�O&Ԩ\'�吱iLC���_c�qe~�;��r���]����\Z5:�jPO�	�\\F�I>̕(\'���Y�I쎵�s��U�>	�j�*t�۬O�jz=W��S|<�]j:%*�jt�Ϛ1�\0�-�)S���:Dđy���|9�]ky�_L���xs���[߯s\rq7շ�j��h�N\Z��_4*I�vfg1ݬE�>԰�)ՌZ�;�jK���\0\rx�uc8R�����򑗸c�[K�SS��{u�fk�����N�������k�n!\n�I�i����d�h�j,Yۧ�qi�O���s����\"`��\0\0\0\0\0\0\0\0\n\0\0\0�!@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���\0�\0\0\0\0\0\0�H\0\0\0!�;H\0\n\0/� ��(\0\0{\0!@\0\0\0\0 \0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\n)\0(�94J��aéA>�\n��I=����%M3qvf���t�ũA5�w��J�<��&��u3�J	����2Oc�jg�������%kyK��[��k��:Eg*3�R�>��t\n71��5��1��yJ�g:0Ǧ2t�Of�1݅�kċ�6j.J=O���|\'╭�b�VY�L�\\K����,Ri�������s(8��m��&\Z�K�}Ϥq�q�*�Q}�z+k��,5�>��=���9$����#�ս�a\Z�J]l�՚���YK���x�m���T��I�L���ꙉ�E��Jqi�R7�4�s\\7��L���\0�\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B�� w�\0\0\0\0\0\0\0\0�\n@\0d�\0\0\0�u�\0�\0�\n\0\n\0�\0\0\0\0\n\0\0P�\0 \0\0\0\0\0\0\0\0\0\0�\0\0\0�\0\0�M����ĩA>���3O�;��2�gH���&��v�t�ҋO����6�E)��sy5�CԠ����4����s��>#�N����JP��c���]X��R�]��^����ԥ\Z����1�b��;xe=�:q��7\Z��\\e����ש$����2�\0x����ͦ�y{�Èx.�Ƭ�i�8�<u{j��}�8��&��5���;=J�]\Z�{&z�MF\"�d�??4~\"�4����y,>��e��\nZ�p����3�ft�W�4��w7�$�[�<{a�ӌ�W�o�Oqg�S��$��,�25+��l��$��ba���B�P�P\0\0\0\0( \0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\0\0\0\0(\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�@P��\0�\0\0\0\0\0\0\0\0\02\0\0\00\n\0)\0��\0 ��R\n\0\0B\n\0�P�\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H)\nB�4��j(��Ԡ��p.l#4ӊh�	(���o0���^�;�5R�^s���e�g�9P�2핹��J\nI�p.��TO1X=��Is��u��<A�7zuI��I\'��yz��)8�-Iu�>��>�ԡ%R�r���\\m�MJ|�-����n����j�]l|L���mX�ּ��=���>1�XJ�)�]��c�o����N��7GC8ʜ�M��zK����j��N�{+���{���љ�V�^�&�~��]��{Z���iS�����,��3�;�:�V3�\"��9��g�T�#4��B�L�~.iz�!\n��F��T�72���к�S�F]\ZyL����Iz�jW��o�I���Yj)�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 (\0!@\Z@�\0\0;�\0�\0\0\0\0\0�\0 \0\0\0\0\0�)\0\0\0�\0\0@\0/r�\n(�R\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 � \0;\0qO��q�PR�R:�:\"ӊh�♺�a��KqWYjt��*3��H�|k�5ͷ��mh�q[�`T�uG[{�S�����鮴Z1g9��X~y��%֟9F�),w��}�ž�j���\nIE�<&���*���(/ڊ$��]+����^t�)Ӕ�%�I���K���0��j+�$�!��wV5j�k��yH�9��h}k��6i���+��޶T�Y�3���ԣR�hT��J2�g�Tj8�8��z��k���V���]a\'��݉��g�=+�ϣ7�L���|v���v���=m�;���g\r���:�kqN�%�jY10�q��Aǥq���o��k9P\0\0\0\0(\0\0 \0\0\0\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\n\0\0\0@\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�B�\0� �\0�w\0\0�6�g���7C�R�ֵN��ޣe	\\�/ɸ\'��6�3ݺi��F]o��y��U\r*\Z=��K��m>{�JpJ����e����\'���R���iz�U�ju��rYk��|p�L�jz<4�k�k{	ժ��S���,EF)I�8M����5�rӇxJ�H��.�~�eF����U��J2���Z���s�#/�o��=m�ٜ�O�A��g�~�+�V�������i���te7���?D�{�ߩ�&\'��_N�s��\0V\0\0\0\0\0\0\0\0\0\0\0�\0�d�(�P@\0P\0\0AHRP\0\0\0\0\0\0P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0(\0\0\0\Z�U(�}���J�^\rJ)�٣�\rd�o0��%�����;W��\nQ�Y�����7�����U��M�֗_��e�x���;���:�w8��eӿC�K��Yϭ\'0�BQqxhtf_�	5]&u*Х�uR��F+�����*u�N\r?�X3}9�W���n�=9��C��W��u�SO��<?���y�c�5E��9�1��	㢔)�ש�=���4g^�?X��[�U���Yk��4j�Mgc�h\\Gw�׍kK���c��)5���L{1�=���Ƣ٦o\'���\n��iQ�a��}=��?W9p�i\Z���o����*X�����Վ���A�F�*,�I�ɦfc\n�P\0\0\0\0@(\0\0!@\0@(\0@\0(�\0\0(�\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0�\0\0\0\0\0\0P@\0�\0\r\0��N�n���5�7O�V��Jҏ�������7��.^V���G*�&�I�eEB1O�t>�O\r5�n|{���������X�������rU�q[c\n���`�2�~�{iO��xۺ�IǛg�̶P�:*��Vݍ�2��r��sV��M���,�96mK4�J�$��I���uO����^%��}	^U����V��}g$�ڟڎ|�|�8�O>�B���OouVMi�ҷ�����7���:Rq/��[;K1�Tg�M>�w@�?*��\0�;�\0w�\0��\0\0dw�� \0�@� �\0\0\0 �\0P\0\0\0\n\0\00\0�\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Rw\0\0\0\n@)\n@�ӌ��X,N]y�R�A4�`��c�6��FN�\n�����,��u�V&������iӝJ:���T�FQ�^LQ�<�p�Y���n�ⲏ�*��4�>���z�S��N�%�Q�:WR��h3z���T�ᴐO���>Q�u.t\ZU[�S��������\0p����J�P��BY��,g��2Μ����R-��R�(4�h��5��:�o^t���3��~yFս�^f���z4���f1��YW��v�4�N���۬/i�Z��=��+���x�7Ѝ�[�V�*/�������R�V~&�\ZҧQN��E�)�ѓ��q��r��*���7��8+ƞ#��N��H�q�p�ښ^�[�r}��1p��t>���a}��6�\0�.���Z�N�� ڧZ>�Y7L`P@!@\0\0�(\0\0\0\0�\n\0\0\0�(\0B�\0\0!@\0\0\0\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0�\0\0P\0\0\0\Z\0\0��S<>��\r7_����]�|��k>�?���u�A�[k���ެ�_P���:s,)/T���ͣ1�]\rY�Ԯ�z>��/����vk��[�>����*V�\'oZ?������k?3r/�L�c�E���ҫ��9V��\ZO=��qVz|z���J;��XfϨ|��7-꫕���\r���=���8?���Gǜķ3����u�j��\0��-�C��)/�E^�������YU�k[�q�F�zNYM|�ޓ�~W�6�N�c���@6�\0�\0�\0\0\0\0\0�(\0�<�\0�\0\nB�e\0B�@\0P\0\0\0\0\0\0\0\n\0 \0\0\0\0\0\n\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0�H\0\0\0\0\0\0\0\0\0���I𶝭�N���*��N9�y�\Z��^�5�|�Ǟ֡�.xj��wf���3�>��\\ԡ�[գV\r�\n����~�N�&�$��x����$��\rJҝh�̚ģ�Tw�J����ޯn���jM��s���\0\'�Jڤ�p�X^R�U\Z�T�%�/�/��z�����\"��/کI�?��߉�.}:�V�/=	%�M��Ma�؎�Kx��|�Y�s=VY��S�np�i~�l!�\0�/sR)F_z?S��ۇ5�N�V�ѯe�.d�?J���|y\n�e�#uTM<�>D�D�~�ЭN�8N��(Mf2�ʒ�O��|��ļ5�R�d�+:߬�?쿻��߄��U����q�4����ʭ��\0z?<�NV��0���4N\"��Q�^�{k�Z�r��jP<�w馓O)���a2�)(!@\0!@�\0\0@��\0!@\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�B� �\0\0��>%�\0\0����ߢ8�:�\nj��j䰱qO��ǒ^�&0�\'����s���{��\0��)BS���\n*�|���|`��&�ia�g)n�����<+_���=���6�\'�xX�\r6��9��zާ,��߲�fg�\0���j�+���%IJ��/��Z_ٓ�K�^��2{&��߇uK�+R��ӧ�{iUW����,r�I,��I���/�o\Z�s����޷i�z\r���K6�t���]9t�%�(�1~��w~Rbbq#\0`�}\0\0\0�\0�\0\0\0\0\0A�|\0w�@)\n\0\0@\0)\0\0\0\0P\0�P\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0�(��R�)\r&�Y��Um�U��HFQ}SYF�51ؘ����\\����D��ZY�m�tg��2|�⟄��9�V���j��?\"�kF����Ϯq�S쁃�u�>.���g�\r�	R��\'J����pFm8�ëO9�β~�k?��T�OW��i˪���-d�o�Z��\n\Z.�N�8�kO�1��nkͫQ2���\\�̢��_������|����>��<\"�=ZS��\rYQ�%�ik�BK�r4�q���6Vӭ�7��_�o&��\0�Q%���̼�n�r�v*�]��:3�xz���Q����%ךg����\\o��Ӓ���Ϛto�Q��q���ѧI�u�Q�GS���zMsҸ�����[=�Qξ������]Uҭ98���p�\"f&\Z�Y�E�Zƾ�B�R���ITT�OO��Z�^ٗNd�i��=OSqƜ5FS�,9�1j���I$���\r�y�Q��6��.�(A�h�Y�m�ݳ����o��e�\0���o77UR�I�JN\\�/�e�s1L��_\r�\Z��yKKx{J�iɨ�,��6�k�9Z}�����T����ZS�q�YO\r|����X�����-�%��Ru�%5���D������S���6��J�i��T������p઴�������pe��O)7���z*�A\0�HP!@\nB�\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\n@\0�\n@\0�ܿ��\0\0\0Q�jqR�X�Z�i�G�<q���MWDi�v��\0P���sS�i?TϷ���\0��ZGЎ��\0ѷo��\\�I�:����f2�^��k�g��0�i���kF��cg���k|��g���r�鰣7\n���mc�՛r�I��\n�g/���r�֫p����MJR�k��)\\%���8�o�E��@�i�5aR��Օ\Z��\Z��GgNqy����ϰ|?�\\_�֚�iܿ�]юqJ�~�w�kѣ�\'0�߉�_̎��@�� �\0��\00\0\0\0�  \0`\0\0@��@\0�\0P\0\0\0\n\0\0\0\0P\0\0\0\0!@�(\0\0\n@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`\0�\0(�\0���SN�(ѿ��ק��{N����F/��cVu$��}2�>ҫF�9��3y�q��KW��f��kzU�jE֣��r�Vzt��\rD�)۫�-kNz6�sm^���T\'��Z��\'�g�[uO(觬V����FX\\�w�3�\r�)��h�j7�Uj�O���8eg܂O���P��ˆ�u2���{��ʍ�MÙI�),gt�0����W�t�~)�*յ��\\���s:k8X^Xl�8k�eqa{����=J��T�uN�=�u���W��1\r�_Eה,�*Ѯ�eI�sryK�,���q����R��Q\\ʣ��V.2r���/,a�b!�o�B�q/�\Z-�;4����Ԡ�^l$��G��x�I��cy�j�v�njU��~O�`�V��\0S�u[Kz�\':��Q�\',T��M���b]�n82����t�8ESOxJ8���Kюg0����t�\"�4�F���%�\ZU��*��$��W��2��f0�\02!@\0\0\0\0\0!@\0D\0\0\0\0\0\0\0\0\0�P\0\0\0\0(\0\0H(��P!A�\0\0�@�q�G��7V�[�K����j�ަ�\0��}2w�|�ױ&k9�����j�ө��.�k��t���|w=��<=�\Z�T�b�U_o��iI�V?)���<%	7K�i�K��\Z���]H�n9���hR�s����>~D}}�\0\0톚U}����z�,x%ű��*�muS�L՜-�e�\Zu��T�;G񏑉��QP��|�9F��\n��:��K;���\02�����F�&����6�܇�����\\#O�9�}=�k�ަ��_���̻��C����kn����2e����6[$g��\\3ɾ�k%�#@\0\0 \0�\0`\0�\0\0R\0)\n\0�|�)\0(�M��%�I������~6qN��]�kZ�qZνKjСV���k)˟g�[n��	�W����v��(��k��k���e�pp�~F-�f݅4�5xjFr��^>XJX�xkQ���)V^�yY�X����U�;�&£_Xs#�9lߛ$\'���yls�/�o	зl��;Ğ\n�gZq>���*��2)����\n��R��:s��\'���F�ꏇ�Ԣ�S���s\'�3��s����p��׶����m%�A�zI�$�����K��<3ȧ:Na�\nm�@@~`P\0��\0)\0�\0�R\0(\0�\0�\0!A\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n@\n\0��⪞ǅ�z����_�,�����7]�_�U_�t��-�]������?��[�����\0|��e����Ί�\nKʜW��-�TT�|��wNX��Ĵ���\0����Ɲb)R�����,n�����}J*�U���Z��W��8b<�=a�_�6x�g�u��\0������њ�Gxk�Quol����8�x��;&b}g�jTgCQ�ԃqR��ԃ[a��k\Z>Ǝ���+�1ψ~h|g�Z_TJ��c+��#��SK\r��ķh�m܈���ۃu=G�-2��S�Ľ�]U�˜<��Ŝi�u]���yoN�뚤�*t�a�Z&���m-?F��giMr�SX���o՚5�L�(::����\Z�V\nX�>���=ڜ�o��P�QEҍ摢�Ac��է9�M�O����\0����Hkv7�UG�xU�g���nq��;|�OI�u�֖�B~Ҟ�/��M�~qn�)NR��+i���	c�lח[vNP�����J�8��ה��Ǵ���~O��\ri�A�y�h^_�S敽h��^�2ٙ���-9i�v6��If�ӗӡ������LW��6�(ӯqR³ۖ�<�9��E��-/iF��hT�.���O�Md˜���i��\0\0��\0\0\0\0\0\0\0\0\n@(\0\0\0\0�\0\0(\0\n\0�\0@�\0 �3B�\0\0<�w\0z��?���_����N�G���e��\Z��ݗ��>`��c�d�������ese{MT���*5��JXk�>�4����NR�iq;y7ߕ���,?��R=_��]l��3���\"�Y�M2m4���5)f1��Ю-��<��/���]���/i�rjK��	ʛ�_ȹI���a��\0�[�s�z}H�k���o��y�O���Gֹ�I�JQk*I�5揅���\Z�vk6�s�_\0��j\\;.������\0��=��\\��|κV�|�c��VSocjR�\r�<�=1�L�9n�47�kާ>W�r�c���S���j%�;\0̴@\0�\0\0\0\0\0\0\0\0\0\0\0p\0u\0㦃�sûꔠ�u�IjTV��ϴ���s_\0J0�e\Z����r�2YROf�\r��KE��>�\\2��{�.�vk�hxMa%���V�.�cD�y,n(�4ۣ$�I�\0rI|S:z��7�I,�l����t�\Z��Ǫ�X�Oo�;-S���k-WK�W�UzY{O���%��\'U�a����nҚm��w����%��k�C�X��sn�����q~����;���ş����5{8��Pn��k\n7	{���V~1~gЇj�a��ބ��f���\0\Zy�\0��PA\0�\0\0\0\0H\0\0\0\0\0�\0\0\0\'p�\0�� \0\0\0\0\0\0\0\0\0 \0\0\0t�d�\0�KX�\0�f��:�,I�֤��]��7O�ݥ�Sڕ?���<߈:5��\0�b������C���<����߯ɖ�[�v\\4��5��f�Eτ����ҧ�np�Ɓd�h��\0Q�\0�:��\0S�������|�)K���۵�\0���\0�����\0\0�T��(��W�4�^���,��i�٫MI~&+��~�N����_EJ\\��\0��3P:WV���!��.�9J���(��\05.I���g�<��WS�K�\ZWw�U��NY�����Y��J0���:mg���Z���ZQ���\0f���/Y�\'X`=���=�M]�):�c�$���̯��)p���\ZЅi����~\'��_4K�y鱫cQ��m�?�f*�/��G��b���=ٯ���Oc0�����h����RO�>&ҸӊxJ��:�4�:кO��x[�kz���z�/߇����:^˙�� �躭5+]B�m���?�=%Nު\\�O=�sI�-y\r�	tf����\ZP\0\0\0\0\0\0\0�@P\0� \0\0B�\0 �HR\0\0\0\0��Gp��\0\00;�@~`���.%����$��4�\n�I�U��/��^�����<`����궔b�wB?l�_����isG�F/��e��k�����I5����YI��������I����g�&�Z<���m������^����xY��\02��}��qi�1Ѥ���=q��v:��\\�YͷI?�5��ߣ]<�O��䱾�M�oQªI<6���8r�ҍJ�m�_jY�ڝ����eZ��kQ��jY_??S_6��\'�RU�n�~��l[v]j�^�<��FaO;��;r���Н���\\���چ{��M�y�,܎I�����#��&��%�\0\0\0\0�\0\0\0\0�\0?��;�;�\0\0�\0)}��z\'ҏ�q��?�,Γ�{E�0��V�Q���O�|M����锣��R�֏��O߆�\0��g�^��>��^�S�NU�Z~���RJP���I?�G�q��G8~��7�	��X��͌^�}�+�2+;�9�\'��>��iuR������:�rp+xyo��o�h�n�o��v<��Q�l�g?���Zuk�U�5:�*BQ�:�)Ӝ^c%�L�\'��(���\'g��]<ѻ���x�%��^�G��E���t���jJ�hC�T�o�)G8xyk;���������O�M��j���W[R�z�������h�+�������f�3���h��}P=O�\0\0�\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0�\0\0\0\0\0\0\0Hy�:��/��~���M�\'�F�1�.*>�����l�[��4[/�^��IB�8�:�}#ݝ_�M\rEҶ�#N�Q�yi��5=\"���ϺO���V�y���9�a\Z}-)�T⺿7.��$�iSS����Q�V�<ӛ�J;�n�~g�WVԶ0�M(�3�@c�	�?�b��;��˖XX�y��~���ڗ��a�՚�$\0d\0ey�\0���r�o��s�)2�����\0�����\0v�Sſ�7�&�_�#T��-��/���v���_��&z5�?yn�P�-)U�N5�\\G�ӓ�����KO�-�N|����3s��7��֧�Y�¿�=e��u��,�k�:��}���Y#�\'�o�oaj����(�8�cΙd��S�e��\0\0\0 \0\0(�)�3b��:�x�rb�_\\�=;U�*w���E��rbn+�3N�穥T�iU�e�G?�\Z%M>��]i��q�X|U�>q>�)N�j�ڕԾ����ۉ�b����EE�N�w�\0(�z�TԢ����A��V�NQ���S)��t�����⌰�\n���CS�8K��wFd�4����v�T����(�o����].u-*o��<�	q�	�s��:�`�����n������M/y��/����4u�z���,3+pߊZN�b�0��x8�KٮS�`�Cc�и�p�3��w	��9��Ţ\\�hS��j�La�A\n\0B�\0\0\0\0\0P\0\0 \0\n�^�}�h\\�\07���Kvb�gƮ��+i6<��R��;گ�֝E�6�7�����߹\'��fq���^�+xs�T�Js���LQ�w\Z�%%�g�*G*�RI��)ϛ?$y=B��sRUo<V����R\n��~���覄O�8�%�u�;���M�򼪺R�I�|�I}Lk�x٪E�i�%��c���5�����Iǚ~(��y�c���f͊�<���*l׻��~Y1k�ۥ�����3�K_➧:��:�r�Z�Vd�Iynvt�g��k�=֗a�Lno#��ު��eF���J4���e������k����5!�mu�\Z�_�h���E���DE-�ɍ\'���i�o{-ٖ4O�-r���G�hU���,�F�5aN*<߬r��x�}�7W�����ƚ��\'o��_r��\"��m�q3?Ib\'�yf��}�s����g�5�|ӻ�?�T�\0���xa�0���E�ӥ7Ne��7$�\Zmo�өx�ٸ������%�{K����+�5#V�L}�����>��=V��Z��y#q�R���-��y�`��pO��J�\r�0]ڶ�_X�z�\r�g�gsme\Z7S�k}Ft�\0X��h��6��^��y�����%���\"t�&��}\nF�c�b[o����JI>��[��v��.�Ri\\iא��ܣ/�_:����[��HHՌ���5<{I^��棔�8gem�\n\\aCZ��bp�_�8�W+m5�ޓ�z�t�8�@�ҥ�i�β_��ѻ����յ\\�����:w�x��*���Y^�Ů��\n�\0�@v\0\0�\0\0\0;\0���\0�\0\0@\0\0����|����<Aִ�\0ckR���N+\n�oy��E?h������\0�΃9�:OR�.k:�c�i���$��E���b�}���=���u(�S�HR����96�ޭm���\Z�$�f�\06��j��SIK|�I�6�<�?\n�x~��Lvw�U��Xֲ��.�mkC��*�J3Y�����!:rO�k��_�͍����3�|�X�W�\'�Z�H}e��-�\n3��e�X�my���^�O�����{s�������V�Ze�V�˲���O�$��W#�W�٧껞��a��y\Z����\0��\0>\0\0\0\0\0\0��\0\0\0�\0\0\0!@�!@���`�6��Rx@RM��vs�+��j�V��Ny}#�u�x�L�崡�^?��W���&G���]W��C����S�A?̕�mft�	Y�}=���\09��?&y\r\Z�\0T��Җ�s/�\'(�R���4�]�X}N\\��R�Ok9/6�b��c�I|Y��S��t���\0gB�_Z�=�#R錗]������w�E��S�.�J4�N����{+jO�s��7�zxY�a$�ȵ.��x�^�7�:�\n�E�Ƽh�U�Ud�P��-����:vL����y�*���8��H����O��\'��<(�>1OO��Q|ؼ��V9������ﵽV�I��}B�jt�.E쩹�,7�/$�<�n<ѓ�;mN��q�^{�Mc9��=�Ύ��P�--6�G�%e���W��c8�1XItH�=Ŷ�ƭN�^�Մ�\Z�+�I���^�\0��J��MR�����S�\nr�\'9K�K=�[�DDvI�w���z��;�˕�/C��g�5�P�9����e������Y��m�����h֊��j�]6����e���^_rޣ��w��n1^m�W���?�u-F�T��������K�s��u)\\*�n.��Oj��>o�F����*�sB\\ɭ�91��ݥ�g��B���7�2渔\\*�9Ÿ���)�z�\r�0����P�Z�\\��_��k=����UY�����=��5[+��N���>IB*o�l���������*��MƤ*F3��,��6ؼ�rL��+p~��ҩ�ivwZ��=�{�pO��-��:��\'�(��������\0�x�\0X��}��_��g8�\nk�/ͩK�D���c=YkN��ڕ����*0X�R�_��˸�]�ֵ\n���\ZЕ7����C��\Zq�iE��Q�\\)S�G��y�c}��쁧�V�Nڅ�+�b�8�^�8K��c���iU:_Q_����mK�.#������O�������c����w�Y6�ݵe���5?�4��71��.�.��u�r-�ի�U+�ǔ�\n~L�\'i��A�_�yT��������r�\0J/(�g.�2R�qi�CQ\n\0\0@\0�@3�uH�\\鴪�J)��h�^a&\"^_�]3S���iJm����\Z�\0��ʤ��U�Z�텘��gђ�hةmu�gz�{�5�gʏO�N���=ͼ_Z{�|s�h�,ֵ�\Z:ŽZ/8��kT��u�R��a�k�\r�j��kNM�K�7���a�A��;Q��W4�����G����U��0���\\��iW5)a�A���:�O�8u��S��=��\'��a��;�˺7�Q3h�%(b\Z�:�d�����i<Yiy�U����S��j=�`�-�*uRq�g:��d����hr��\Z���L�@! \0R\0\0\0\0\0\0\0\0\0P)\0�hE�@|�\0�>�O�C��usq�+-R����\'��υ�Jr}?iy�y2(X���>E�O���:<�_A�6�f���1�q�*oݗ�2�#_P����k{B���7�ЯMө���h�\Zl鸛�tN&�v�E�Y�4�g��NP����_�h��G�G���MJt�X~z��K��)Jj1ov}5���G��[����m]��o�Z��M{�_c\n�pN��\Zܭ��4�T�y��ՍX�}�����s��f��[g����Z�zƔ��S�R��9N���dג{��Kս�f��/���>��u�2���b�4�[����u_�Q~�o���X�8}�εv�s�>�����[�=+�4��U�_��U�QMF*_�ml�yic�,�ӳ����(F/l�$�����~<Oź��AG쓪���)%B\nX]��/���y�YY�sV�ˆ�o�h��n���:	��U����Zq���i�A�ijp�5�N˝�J�ˊ��jY��^�U>\'�..�XJZ5���h�%�6�������w34x��QT��҂��-����,�M9�e�w�#��ԝ)�)����֒�8���<�ӥ?��؇��c�Ѹ��qKS�_��Ҍ9sۙ,goC-q�p%\r6���G��ѷ�*�+XV�E-�Y�����)��oO�k�\Z_��Z.�¬�;��I�������ϧ����4�&��\\F���=�k��8M\Z����e����K�=%�򂾩�\0ښ�w��\0;*2����\0�F-�սhy��#�{�q�׎��<T8�NO��(4�T���\0o�bҦ񽵓���C�P��\r�u4�~ɾ�f���T��R�I~�[����\0�ZJI}i��\'���|T���ҹ�U�IT�\\-�\0v-S^�#��G��xs�eX�oɵ��I��\'z��Z}�r�u����MF�s��SD��ǈ�O�/#o��Qx�wuE�\\��|0�ڏ����\Z֢�^��c�v��%�eq=�\0��4澓��3�����9Q�Y�r�*��M��������?G6��~*����u�h�gco��A��N���I��g���N#�iΕH���K\n�g�t8���)F����s��?�`����j~e+o54���,*<���v4|c����K�����ӧx��ЅOXV���d����[cyN8��<?�y�ݙ����:��wC�>�e�Q}�Tj%�y���������VYm5����n^�-wph�Z���ڸ�2��a�̳��F�ݳ�}Aoǜ+_jz��R���U�:֛6�+�g�>X�xIf5��O�����7���R�ؾl�ρ��kK�:76��h\\P���R2����/&י�<%:xqN/�{��ʧ��7�wI/ܸ��%�N6�9�7��V�����\Zq\r�u��.�U\\��vV�%�=�\0���cj��/�\"����>	��E[���T�\0���Y.�vt<b���\0X��*zӫ(~y,j�����H�ՙ\nb�1Z�j�-d�\0��\"�\04v4<[�e�\0X�Ԩ���N3_�/�Wxv��,�C�P�#��-����OkBK?�u�8KH�.��b����.�4�J�vX�O�\07���Q��m��z�\'��x��\r�]צ�SZ�楧В�sX�I/܆S~o���a��ZU������U.(��R�Y�9sJ-�<�?y#s���P�N%�ֵG���-:*NQ����(�.����y�l������iF�E�:����I&��lܝX��P�_���]դӄ�g6\Z�Î&���!���ҟ������FMJ�x����v��kTp��\'���ס�*]P��i\r�:��X�[Q�a)A��k���_�=m\n�xx�0ӌ�<�G��g�z%�G-KH�c\'�kW�9�����\0U>��ַ�{V��&f���;��Y�U��~�ХB���B�-�N\n8|�P�����y^��x�+}��} \0;?.\0\0\n(\0\0 �\0\0\0B�@\0٭qN�����e����x���%�#���*K*���_��˚m�߫����_j�c([����̰��\0%��v�L�s7;�iq7�U��?�c��,��-����S�Ҭ+��ʕ���J�c��\09<�\\��rŖ���/�Q�����=���R���_T��\n��x�q��Ϟ�Y�y�O�c3��Y^��T\Z�\Z�^�o��D�����Kڎ��umjF�������,�c�X�>x��ė������mn��[�	���,%��S���b�\'�}v�\\�mij5iR�q(B��.ەg}��Y��is�+uK���S��ǬR�7�r�X��b�D�5}JK=>���`ɜ1V�����V��Wt.)Ju$�\'%�շ��đ���o6�2��R��;sF[�^T��I?�)�F�����E���^h�5+�i4,sN6�s�jnK.Y����*P�+N1S\\��:6�$ב�T�gJ��iac��_�o��n!,{:Ԫ�y=���U:1瓕e��uϩ����1u\'���*�����c[�e~�M��y{������.�m8�I��7=WE��~-/��\Z�z��ԥE�Ul�[g.:}&b�&�����(���)T���5��d�V���}i*jj�Kg)C�r��>0\"�8<=�^j�kF��zv�u\ZѸS�Js�ʡ�ۗ���i��F׋8��8�rJ�_��.��Z�Z���i���\\��	�펼ޝ���۹ό�V溫^��WR�J.����˧�2�e��6҇jK)B�EU���\0ɞj�5Ӛ\rGl/?<��ĹF���ԡ7�V�!�I<�/Wje+;����3V�[tnf����E)GtxR��8����$�ٵ���2��]י k�#��F�m�.d��;�yS�I����(�\r�j����M��/����{�Y�wS�,V�cK���}3���zU+>�:qIF)t�\'?�j�u�ޕ5+�z���w��妗�OR4V:w��C��#87�_tsc�5\"�Lqh���mҦ�߫��T��h�woVJ4��R����Щ�����&��9F��uS��~ᮌeMbGl�z�N�3��\r:~_�kh�i�ӊ�5��)0\04<��*���I)K��P\0\0\0����f�SL�\'�V�2�u��E*���w�ΕԘfko��E��\\�E?4���u�*:�g	y&�3����U����α��4`�{�{H��~j�_�(a�Q�t�:����eM�����F�U4��5��\Z���u�۹�-[1����O�\Z	rUO��ꆡ\n�5$�Qq�W6�nޤ�,�?U����6���a�w��a:q=�/1ݘaq��U1����֌����vZ�\Z�MM<��m��H�Ӧ�N���d��*��r�L7rA�TLԤ��J�\0\0\0�\0\0\0(�\0\0\0	���Rd��G\"�2�̍.f�烏R����3f�J�#�q{��l�T�O��t��M6�7be��u��:tc)�[,v>o��FZ��uZsrJn�^>�3���A��ST��ʂ���z�}��p����ۖ4ڦ��I����g�C�?Ú9�1�R�8�s�1M�~e���9�f�IO��JN����<S���)����#��\0>$�k_mO����|I���y�=ߤY��_��\0�n9���7;+<��5�z0o�ک��$�5�5����[����Y���*0�8Ӧ���Dr��;����T����EJ�?ߜ�\"���8�������&h����~*���\'+]62�_��Fi^S�����Fu\'���C�4;~\Z��=&�^�6�~ҫ�Z��s��#�s5��ȓ�rq��;��FY�Kީ������F��y����,#���k�Uz-j����^3�\"��G;gOn�1��\'�VNPRI��no��nV�J�5N�\ZUi�����3���n�rw\\9�JR���\'��t�=e�Oq}8�_U�>K˚R��$�Y�T����E�/��2}ky�?\n���h�i���������GEོ��?�o)���ڝ_��+3�O��_կ�����E����E��ח��؟q\'I����W���3�{�8�����\r\"���R�O剬�ae�>�]\'�kk�5_�)�f��h�MOV�k��<T��X��#�;��YW6�~~҂�_<z��W�e�����}۩kUEi,j������}9\\����fk1��<S=��\\;�*����ޥw���[�ڴ��/}(�����8{�/��F��6�d���F���ڪ�O���Y�O�.Tڎ��3�U�oUb��ΤZ�N�>H�+->��ͬ)�I8�s�X�kȑ3���WS�2��� �ҵ��Z^CM�oc	Z�N�)%:�T���[4�^1۾\\g���[��B���RR�Ej~����BXk��V�&���)FQ�^��D��N-E�5��7�d�)}�V��T�v�YU�H,FO�=V^l��hqΔ��`�ŚF�:0Z��B��Q��o좥7���������m>��(Å��|�)[U��ie��\Z����.��.��.�	ƚ�S�i�H�ɮV��I|�6ힳ�ץR������v�۔�U���:���>��4��1��$j:���eB75���ק� �\Z�\\�ʒ�\Z�d�vx�Ĕ�8�iR�\Z�3�-�I|[����3�z^�q+/�Z]V�om웤���Yͥ���\0���!�ZO����\'���(���Z�X�՘�_DÃ�OQ�7�xV��jӧzt�����,�ǚ��%�%�҅�X7�II~\'�S��b�]��*��n[�*�ԣoB2]�G�5zcK^>\\����½f�/�J�5�斣�[�]��4���kt��xU_�f+��}Fە��uz-c�_�I����Ů$���<G���U�k/����\\����U�f������6�\\�!��t���=6��}۽38xU�ʔ��c���k�R��/g]yW���.\'oGǍV�Z�Ѹz�?ۦ�\0d1_u��U�H������W��kz���J���\094����n��v��yd��6zx�÷Χ�O;Jv�`�OX/��Q�#�;��^��&�ۡS8o�j�\0ÌO�_lՏ�Ng�u��v��٩R���\r0�-��P����\0!S�_�$�=[�o�j�[y�K�4]��<�\Z��!ST��ema��[`qj<F��k1�<K��RU�(�.Oߎ�nً��^��ݤ�-(�Q�1׬��=_�Z�u�h:���iM)�_P��5R]��iwyݳ�,u�D8�7��^4첖�\ZrL�q���\"[8am������jK��r�]w4��f�jr�Sh�o����Q3=!�ѭ�]�R�9JrI$}_�h<��\Z<t��R��5h���W����ϒߦ[#	p�q�PUnl����j����M�n��ǵ���\rT��oT�6�{�gMM8����j��w�;�����gaC���V�J�Nqk��\\+Қ�+Sm����\0��ɬ�=��̳��>�����v�Q�\\c��Z{o�k(����][\\/�{�z����_�>J��߯��\r�)5�_M��͗x-\r�_�7�g�NV�F|�k��Z��_]SK�k�m�9;~0�e��gQK��]�}/��q������|��֏�\\UI%V0�T���ʏ�|EO\n�4��;�Qq����l9[���ٞ�(x�~�q���ϒ����3����_���8��\Zї�|ʹ[�75�,�S����TǴ����\0u~R;\Z$�W��ԡ,gh�~Y,^���m��{�^ć�^ �o\Z��\\�\0�p�|N�{h7F���K�m��\0a~%���ZgI�=�S��*и~-j����^�9Ԫ��8P[��Q�eR48~�P]%R���3�j>3�[ל�sr~��]E�|_��3:����xN��֒��ߎ|1h�c�T��F2k����矏�=RO�I�\\|�qo����\Z�N��\r>����>����Y���:/�ۯ�\0Dc�����s^�3�\0\'kK�����O���\0��\0N<2��\0f�yW��\0�R�b����hy�\0�\0�J�]�E�p.�/�x�\0\Z#������\0�?�sx^[+\rg��w�\0�7#�	��m�C?ѡ/ʩ�/��Y�ނ������ԼG�����Z/�+��\0:$�\'��?�G����\0�2pE�9Q��S��\\��[u$����VZ^V�\'�k�Cen�cB:k�zE����ܿ�^{U��Lq�\Z��\0-3O�m�u?��K�0��8,�|��l�m�c�8�����n*�b󻩥T����xS��=Ớ��WZ��ҍ\'��Z��)9m�k��tux����>����:��\Z��Z���#��~�Ey(M%����ط�����{��,pM)���3��Yח���x��}j��W|F�_�0n��ieG8���w{��z:������z�^%̣_m�\0�d�u|��;n!��������s�$�v�w����F�\0�ܡĐ���x��w��n�F�=/��Nr�j��\03���C�}��j��\rfݽ�W���3��hZ[;�zֽR\\�4�FY����c���=&/�\0�ޞ�n��R�4��\'\'ɬ(�ɶ�\0km�*��R�g����ǲճ�n��XxY��F��}B�M�;�\n������g~�5�)>z\"i[��i��TI����>+Z?�{�w��W��{5R�ҕ%J�/q�5���Φ��m$�j�Iy�Z�o��P𛆪�+��a�1�	~U�Nl|!��Ӽ@��\\(�p_������6����Z˕SK�M�G��[{HƺۯT��\0�9:����T/������*S�x�s�&����.����褯.�%6o/�U�k�j������FC����.�o2?X��Ϊvisrp�3��*篗6>ZV7���	й���Zp�S�k�կ����1P��Cο��K�t\r�񞄰�R��yJ�_��yO�ZGXԬ���N�KWիӯ}�׭V�=�f�<����M���-���J�-��A\Z�1�_�����\0�Y?ʢ6�x�A����V�v��\nŋ`���q����w�:e�����\nK/�[7�w�4�w�ܤ�r�_J|��ӧC�>+�:\r�|K�<4گo<{VlP�6��Z��Rk�r��Icm��]�&&]i��F1_�C���]~5eRq���.2�6�)��\"�qV�z��ug*�S��r�m�&s�\0L��5����<����>N�^�as�3��,5k��{�T�J��\Z�gEr��tH�[Jو���\Z�yGR��U�Rq�Z�FN���Kt��=�%��y�O���^U����$�����m�*psk���M�\0��S�5cݩ���u���pu��h�����~ͼv��R�R]�c�?�=E����]}��M�q�;(x���p�t�W:����u���_?Sg��LƜ��/j�WDF㎇���N�Ǳ�mM��\\c���-�mnVmol��:w�����y���O�����2���f��S��N4��x6�k��{��������H����YX��B�d��ʼ�n�C��y�hny�<|9�Q5)D�sK���{gԊ�\"�#����_���%����s%4�{*WN�ʶ�������b5%8K=�P��{�	�4UQ�Ud��\"[a�uy��sg�X���*��K�F/�X�Ky<���-$��\Z��ʙ\0\0\0;�Q@��J\n48&lԠ��rFL:��Q�Ê:���T�z��%I>�J�35c��[�D�ji��r�䌡R�K9G��d��v��G�����x�d���k��6gaw�F]GQq��9�Mf�g�=��	��v4�#%���BMŵ��-=f��^��zt�{,_ݒ!]>��j#�q]9<4�����kp��&�9N��z�dT��P�SI�s)�O��h�Y��fkR1��\0\0\0\0\0�Cf��*�w(�$��X6�2�nH�	<�q��9=�M��?�8ҎQ�����.�-�����*v���^��hEe����`?��{]wL��y/g�S�m����X�����b�8�.��ح�o�9���Ư�_귫7���^�^ܹ~�W�c���xc�3�4����(��^5�{8����,G��^f�~�\0mJ�6���3?� ����Y5G���IE��78���\0WK/��0u�9T(�F)$���_��<q�X��ѡS��INΗ.9\\��i��$������z[G�2�������\rҵt�[S�Y���xSA��]~�G�r��g�ʩ1F+5*|��h���������Ɣh��S�\Z4�H�+	�՘����oY�����R����6���r~���v25F���8�_����5�W�j�#�6��.��q�Z���F[Փ�%���]�C��w5i�x�����C���_&=ϐ��4�����!I��)tRS��4]+R��#���|�K��By�����2�������:v�k��R�/^XI,�������sc���]�8W_��?��	ܘ��ӳ	��+��gO׬k���9�7�����cg��Y�Egk;�?�L~gр�\n�/+{�U���$�������8�:�_89lt�/�B��^�iU��Y�r�K�\r6�e\Z.)R��*w4�V�%�\Z�RMz䓥\ry��\ZSr\\���ڃ���}V��Xi���>�\0��J������˚t7��c�tW��̳o-V�c�����m�>by~ғ|�{�e8��4���8<�\ZV�ef����Tm~ռc��\\��R.Rv\\GV1��cse	�>NQq��<�烼On�+[�\Z�+�jT�)y�%$��f���1�e�*h;_��\Zi�~��p��8ո;�궠������G���0�M��뚱�N�������j:|sa��A<7qkR����;��;�w��/7W�����}Z�v�v�3���8U��,�jv�_\\J����zZw�\'W�:���~�ɺ��?yr��aޛ�|�OS���i�?���jw1ϟ|+��*1r��p���_4̉��9n�0k����}G����GV%���+e��+�5�4�«q^IԊ�m`��o��fq�Lwg�q��s�\Z�M�YAd���W��2��Q�����&�Z35֟aYI��-d��1��h��{J�6��i�9�vHe�wi�\Z)�j��k_��ZR���=��s�S�!�*w-r����Q�_w��_2�#��	���	/\\��_�u?v���5�_2%�/�IvF\\�jφmn+j\\_\rQ��aVP�JK<Ӟ;��,y�֎��F�>�RMo����*�ͥ(Ʀ�q\ZqX��[���ь�_EKR��pf��[O�vu���S��_3�i\\E��s��jO�z�-y�r�����vɉ��WTr�B�\Z[��M�?���7��j#/Fm���3�q��\\E�KI���[�-9B7��Q��jujO������0�|��S�V��;��ϛ���Z��*���땷S���[{i%o}{j�����\0)+���[�(q\'[��JKX�u\r.��9F�ʜ�V���ǟ��s�t�)��C��yS˫K܋K���c���un$��ѥ\n����:r����P~q�o��S�s��i�lkk�5��R�\Z��\ZRr��\Z���G�#�V7z�ӧ����P���%?���y^[H��y�u]2�tO�pO��N\'x��p΅�3OZM{5ZuT/-�)\'.�8�m��,6�Ś���]j�i����(Z�䢹WNW���y��SQ��y��G-XQn�t���OP�>���54�n����I=�F�*�\Z}7Gq_�N���R�\0ƅϳj���C��ml�V3�9�k�V���i�e��GKWV�ɶ���t�^�xaһٟ�%j�_�_�Z^�K�����t�4��7�P���8����+[�n��$�o8v��Ov<��փI����V2���n/�ҵH�i\\Gj��Fr���m����(���8�]���x��y�^���ջy�\0�Y7}��E:P�X����2��_�6Q�ӯxoW�V<ќ1%$�y^o�»���s:���o/�ז/��I�[���\0ss�u_�rO�[$r�P�\ZP�{{�t�	ԥ8�k���o�;�4���\Z�&��٧&���%%��ø�y�S��u�V�Џ*�:�e\nice�Ff%ڻ�;c��Վu�ʴkƝ<��t:��T�Q��y����W\'�S��;���g��%�켍��h��\'��RH���SZ�:��)E�y�r#������H�s�\0�o��qe|�Q�t�Q\'W�g���o�fl��=^c��o�*���j2]���X�m-�����#�\03r���+z�i�\r(Ҕ\\\\]\n��{��S���=Z�2��7՛�|�O���g��1r�֩w{Ԏ~���D��J���Q�[�䙆�GwD��-�O�ԩ=���w��~�m(kp�7ڃ���:�U�T��Y��ƫ��Iդw�yN^X��~&̩9�	��������cs%�Ӳ����;�h\\S�KN�T`�t.�ڕh�l.h��g��ϳ���3�>��\\��PN->G��������-2򺢭u:.-�*)7ME�%����w�k���.i��T}���J0~o�Rxo��cv�Î0��t�/���P�iօ�]H�IT��K-��[z���q��\0Jx�:ǿXb��UQr�9�vݬ[R����+T�5�,ɳ7�\0�/M�SitN��&����nZ~���w��Z���m\\y�����i�IfKw��!ˉEI��4��K�N1��Q�a�J�y��3v>�+����1�~�w�۾��Y�Y�O}�ӯԉcGmFoz%�(��O�[{�Vv�Ғ��&�x]�̞�(�c$�k<3Kb�\'/�(ٸ�֪��~*�\nk�����>��Y1��ωm}-�O�c���:�͕ޝN���j�Zx�a,&�`�����R(�4�V�_�+N?�2>��VZƵ{��!�5���_kV4�V�c�6�?�8K��8,�Į_խ��\0�K��-=��ԏ3���?����V�^�Vը�����#�K�����8�\\�_�\0p��\09��\r�Y���:����\0�3�Ҹ����D��g�O�&��fZ�������Rk��u�y��u����Χ�E.^%���\n5�P9k�xA�����}#�Uo?S�C�xb�]>=�_��*��Q�w)����?��ύ�����j��CL�N�׵�n��M.X�.o�����<R�I�Z�Z�mr��6���\\r��gס�τ�:6����S�;�f�h�=�)�%��9F���J\\�cNU�mI�ʚY���e�����v6�E��zb��=�*x�Ŏ�I[�өP���ҫj�8G�\\ԗ6<�ɹO��(�r�o�T����ϗ�Fm����G��m�{K:��Q\Z��.X���?\'������o�ו������s��&����G���.*��,K�J5���	������s��tN���+��8v^JR����Ҷ�(K�8�?�=iBK���+������P�r����9�m�T���8�۟xkq�����WN�<��TyU�Q���?�G^���l���?����M�/+5]��8����R��מ]Asi\Z��vm�����$t|Qc���>���N��:W��	�on��X��ݭ��\Z����u�;X�r�Z��jk|��V;��+V�;j�}�(J�z/�.�ETxϗbM��қ}>SַO�GyG��0�͗�Q��f�iS�9bv����)h�,Ճ��{M�J���%ŶW3�i�J��G\Z�t�a���ɴ��W��u��)I�zW�e^R��g�N1���(�+�����{hD[��>������.���+�n�U*�����.�V�?��F�u%�{Zq����&��Z���p�����/���<9�[I8�:�GK�5�q,[��e�I����\0�~�^��\n]�y�-��}\r����Kj�^����v������cKJ�_Bj���B�x�\\�0��\0���9�z��:5hB�R�\nSk�*���ů��������[�s?���?����Y�mOî$���E{D��\0e���R_�CH�K���si|�����Z?��4ۋ��:_/�]/5�MF���u��5i��\0,j|�m��\0�����[x������v���}ۚ)?.���C�\Z���q���uSt���K8�^�6��wPƧU�]]+�K�����ش������M2U!:U*Z*�%�A��6�m5�n5>o6���#�\0n�X�r�%qMN�P���Jji�ѪQ�>�d�+\n���?k˪h����QK=�$��i֜3:\\�9�Ʃf���]FR��j��\Z�-�;����g�e��\\��E�V��,5(vWvjg�M��)x�i���|\'�F/��j���Ia3Q��m�;^?��{�#r3<x��,��<:�V1��e�+��=�\"�����M7�t����\"�=b�៱��F)�d8�3Q�4�x;P���i|��B�_c,�bx=U���|�������5����.V�ԧ�Y�$\r�]� 0w�\0\nB\0)\n\0\0\0\0#F���bGt��q�ڧ����j.���O���z�Eދ	g=����:)�:WQ��\\��r�M/Aoay���}�wV�<�{�#�_,qtT.���wGco�/��ۭ`�O�ĝ�������=����w)�<rR���r��ԧ���2�g��Sr3��(j+ng��F�I-��h�Y۩\"�WO��\Z�9�Z�\r�hS5�&p���Cbq�~��G.Q�X�q��xf�X��i��RɯQ.Q�01w�׿G𽞇o\'��^�j�8�RjS���#�e�Aɤ�l�?�!�q�}F~�҄��h��6Ӓ�����N:��_S�6�~�&{W��֒�����y�];����j?<�8��#K[֤��g�lƊ�G��F7��qe����5��s$��B�5��Y�Ǿ\"�����KB����t�\"��^Isa-��r��s�^���]���Z�X��ߔ1�c�M,e��[�{���c����*��X7�Z������?v��rI|<\\_$�r����e�{U�c���	е��Z���M�����i��o�Y�:r��}��t8׼􇫜�m��K�nY�ׅ\Zz]_���qQB\r��K�v:=��E֨�V�����G��X�.m*p�J�B+	\Z��2:����p/��\0R�@�\0\0\0�R�\0���;\0�g�e�Ӑ[��:>�GQ�t������\\d�0���%�T!c��CK��um�*n5\"�V9R�����O��E���@�Sռ;�����y��_�En���U����Q�Fa�G���>~wv�?��4���Z��ueN+���}��UR��[RYL��K�9��[�u����G�/����a���uL{J�og����\0r�U�\'O��{~�JI����w��5Q�:O���	y��ѯ��$�������G��ڒ�S{���5�V�%OQ��[%)�%�y;\n<e�BY��j￴����:S��ф��m~F��A��MZ׍�x��!(tn޼��\0�����^�V)�z����N�+E����	�X�Z��YRY��*�qI&���\0#��l���MQ�����N�Jt�\'��p�I�}������Ox����G��yk������ϣ��%��i�:��,���ko{R\'S�\\��8�v7v-F��P�y�\0ogV>18T�(�iR��RX観��&&�����^ֵ9{99BQ��#������떑�m��Ҍ��Ig�G����E���	\Z�I&�����%֗�vy�\Z�*Q����񭕅B�k���\0#���|;]7]Q]�k��)��U���X7#s�7����Iֿ���p�=*�O��ֹ��f�%:_����y�7��k�s�i��KW�r��)8*3��]���ԯ\'�7���f緄��ՄjS�ӄ�2��5��o�=mF߅!�J�!kR���%�9%���^g:ۇx���*�4���֌e�MIe{���ɵm4ۊ�_O��B���є=���-G�v;H�)T�+�S}{?\"�>�1�0���{Nڼ�m9BݥU��\0W���-�߹��F5��ӌ�.�#*iZ.��]j�ƵXj�;�5d�9ż�,m�������j�J��l��}�i<|���/\'z��8�y{%�xʥOwu�j�[��ھf�����V��z�V�V��.+Bu�����b���ʛi������YP���)_T�#\Z�ҭ\'V]d𧷒�l�(\'{��:�o�&��P�u�qA)o�-o�=��Z�/�jz��>��+E/�>��ꔯ������ŵHŧ���9��y��z\n�h�W����R�[*�)�~\rd�h�{�<CB)���q���-�긧[�K��cU/�A�Տ��aB�K��T��\0X��7���N���[�4�+n\'�����mV�~k(���.-T��U�f�FW|��Ils���\Z���G���<SJ+���q��Y�\r�\0v���m֥�V]����]W��:��4j��ۚ��)�:����.xU�7m[Jk���gz��v�H�6`^0��}��x~����7�{&q_�\Z=�L�xu��zn��T~&�����-��ͳ�Ҕ�OU�I,5��y/9�WZ�n��k�K8Q���v��A�|�:/�\0�nK�\r*/<=�Z��ZI�\rB�iS�����ݾ��in�s.��v��\'�,�OŊ~��4q�IK���6��}C��s��ц���%�����G(��߰͝+�[X�?��O��~�h���Τ�\0:���)q}o���������C�I9a=�<����I�{�G��#�8g>�?S�z�����jc��h*3����/5�vɿǳ�M\"�5���.xn���V�ӕ����?z?y����^K����\'�����8V�v�t�y�]<]Z(��eoR�_�އIu[�E�����)�o?oH�w�����\"�q=d�~3�����\\�-zrr���Jגԧ�i�OCJ��p�uw�1UZ�7/��t�_WK?8�1뺜\\�8[\'����-Y�^��v��8��#����uj���W:��Q-�6�]��3�;:5e�V�V��HUy�ɞv��T㖒_{��rV�S���9g=pfb^߲��j����BzV�J�\0H������\nʼ��RRmJ/��ꌜ�xc�\nP����}�҆i��\nJ�K����o3	�R�Y�_��V�3��\'	)BT��8I=��O�������<6���>���\0�=v��6�%��5M\Zƅ�S�Ŵ%N�~��|w]��.3MiV\r��G�2\nqN��6�\Z��*Z�\\֗�҃�$��;F���[�����kG�u�i��Tk��J����\0�C���z��/H���{���o�u#���Z������R[�����oӝ\nM�z�ܥ��:o�eg��������,�e�����L=u	�(N�y�\'�kZ�l�\0;S=>�<��yz=�����0����Z�v}��O9S��9���Z��V�*U�ݪq�f�k{�4���ԣ�S����0�*����%�T�ڤ�]��c�U����㣝Uˇ�$Z5�$T�s�I�^�IV�^�Y���WR��{Ib/�[�R�p�\\�UV�e���0�nj_��\ZgQRo���k�G�r�K;�q��)*v�T��kM���m�]�s�R{+(�s_�������z���a�}���\'ma%�ڶ��\0�M>{~��뵕?�\04�8FV7��m�<��\rՍHԍ58saEGd��x�;�e�ɾz��~T���~g�6W�f%��o�i^ij�a���*%�7Kq�\0�?ţL�\Z�SѴ�����r��iCU��鵒�V=g�ߎ����j�Km�l�����o�}��g��k��u�N��$։��~��˟�EV:e���a6��u���;o��1i�CU��hΕ<��FבɅ�oNP�oV]ܪ������������΢�ZY�;��\0WP�_LU9�jТ���5z~r��]��\0�^��ͺ0�^I��W�������_������e=��C��#4�]n�kw������)C\\ג�\0��G���9a%$�$qܜy�e�9�mui�^���e�ԍ:׬��=���Uǒ�딖~�n�Q��ś��5���\\���J����\'��ҔW�����v7cp�s��c���c�o�G�Zδӌ���i�i�Vr��ۍ��y�w�U����n�\0Ã�;��l��6g���P���}����\'�<��\r�ڞf�z|�������J���Z1�ڨ��Tnr�h�ZXۛF��*����mI7�\"����X���C��Mg��c�ݣ1��\0/H��2m�^�y���J��\"�]��Ӫ)�h�m	\'��u�B�_�O���6Qx�ۖ\Z�\\��\\���f׎��n�2�&���-4խ0�[�^��Y�\0����Z��}%��B�Xʆ�	m��h����)�?#B��\Z�ZX�q�ǟ̼t}_��=ZŢ;�售��N�Ҏ��S���O��_�L��-8u}�մ��mWL�t����\Z�C���%�����&�ڕ0��{|K\Z��-��:q��c�{�#������ο����ׯ�aKٹ/��x��)⦧N���{�_⦌Y�/iG�<�yY�\0����o �jT�_���o�c�;�\0������������.S��&�\0��B���`�\0����<C���#\r+R��d�R���U���`j��v���,��,5�:k�=\'P��w��u%\'���a?�G�l�Ü�\0Rc�j>�ėXI|Q�!_R��\0�hWWU�c����]NE�\0u\'��Ff�\n�����ԕ:�Z�L�J���ZX��\'��Ct�)�\r�\0��g������@ا_+sy4��I��ŉʀ�\0\0\0\0\0�F�PQ��&ԩm��\Z�&\Z���8��L��Q�T���]&�;V��J�n=�v�d�%7�כ�x<���x��s-�n$�3�FޜzE�)tD�U�:�{\Z�.i��N�G�ɾsy���\r*)v5\0eZ\0y\Zi�T��5\069Z{��7Z�4�g#�˅�Q�����u�;<<?mS)IUsK�\'ɰ��F�\Zr�U8��?�3��j\\iws���rƔ����x½G�*�o�)EI�{�u���gE��|E�i�ü��*�y䤖jTO��O����ͭ��\Z)��������%�p��\'�����.��>����T����̟�Q�!�*�eZ�I:�jI��6����̥�ƹF��c��Z�=3E�R�>��CІ>rf:����������.jF�\n�9<E|;�䙋�^1����mΧ{u�����\r�E�q���9i�LԠ�v��X�~��~��Г�3)<��gQ��%�����g%8[G��q�mU�:��,��s+NR�i�sNo�+͞�W�a�o���Zo���96>�w�ѥ�/W��ݛ�񶷅(���K��f�ǒ5/$F\r�M���̤���\nĝ��\0�V@��!@Ԁp\0N��\0\0\0\04U�N�)үԣR.��T��\Z#_p�\\o����gW�j��Y\\�T�,���r������=��ϡ�?=/V��J7�w4�Z��^7RTjF<Ќ\ZKq�J/8�W��j�q�?�1�ٍy�Ӭ��6v�#B���<��9H���Y.��G/Ȭ�G�_�;�?O��½x�Jo�pK._�rq����ҕG.ZKx�>_����ԯ�Z�f�NN��(�jG���oj��1��9o�eƥ�� ��������Mv��BI���\ZK׼�v�d��{l���!��ffs-\\���ΫR��Tr����r�YW����md��*<E�\\p�(h����jֵJO�?���OH��\0Q�u[w�UT��\0\n��A��SW�������B��6��������sJ\Zuȧ���2on�K��Hq�e���O���NO���B>j�S_Xd��\\R�7\Z�#Ji�Ʈi�פ�>�M����3n��jThׇ�X)/Ĝ`�/��UI��jk��ɹ\Z�=S�����[�\'_����YR���8:�x^�~��;?J7r��O�p���+���������W��^\r�c�Տ~[�h�u�M�|In��+iWk��Ӧ��4חrq�/���7!y<��ׯ��j<\rŖXU����v��x��O+�y�F�֛7�+�I��m8o�310DĻh_˪�Ϣ��Z�YSr�~�<��\"񙸽����o+��(K+�w��QGq�Iђ��m4��~\'ai�:p�7W��������#r�V�Mug2�[N2y]	���{xj2�8^x;]R�#Rq�e\'���ҩ�r�f]Z;�;*�p��{�癧����c��u{�Öue(����Oϩ�jZ���j\\?�\\�K��)��Cܴ��d��줖6[�;+{5Fns|����F{�jZ�Ᏽ�����p��Η[��]���?~?����C�x=�kv3���,/h����>S]��ϪiBi,%��ȇ7��NQ��U\\�)�*P����E�8���{O\Z�m��O(��4�ד��oS����l��^\"�3\n��Q�z^ζ򫤹m/7BO����>�\r��Щ:uc:u!\'	¤\\e	.��{����fk�C��/���4����i7�e���\0S~�L�,�\\|Β5q��7!]�*X~i�Ľ�j��{ll��x�oӹ�����Wr_�r)_��]���,�����+�н�+��O�v�R�M��������^�u����t:0�>\Z���;��Aҗ:��{oޓoiv~��iN�>T�w�dOx�������n6��:�̱)�=^}�w[���;q�����п�v��c������N��[��]rWwQJQxq��.�ӧ�p�O�p��S�R��\'7݋�zo8��}�o���i�cd��c%�v{�=ޜjS�\0��I5�X�3���W�<)s$�}�:����ܤ�yh�a��ڍ�f�,���$�\'FI�2Mn�k)��l�^!��L�?�.3����e}�:Ҋڤ?v�_z=$���K\0S���p��nӻp��焔��:s�$�c$�I=�E��z>~�\0�뺮c����=w����U��^�W1\\���b��>�#��3�w�|9-��W�r���|3ĵ�m�V�u,����_���O����M�i\Z�����5z��JP��$�I����2�˪bk��c���Ά㦥{ǿ�\Z�v��:����*���?����c\r��)sl�N�+O�J]��c<_K���6�KE�+U���U�*pn�(�ɾ�s��q%��Bҍj5�\Z����]r�e�.N�p���cEq�g+8�(کS�S���/w�j���/������s3�?��wM�In�<v4й�j�\0��[F�M��]��\nΜ�i,�3������t�������l���.�E��̵(F��p��NI��t�>g\'V���l���N�m���RqY�S�}����:������Yk�w�\\U�Kj�����pkׄ��i�,�v5�����6�E�[:�O�P}������R�)r�J�s׹�]�Ҹ���y߱��jRMu[�}}f!����<�[D��+�%��?_��+�YaI���ꭜ],��c�Z�mg��=�||eث���dەܹ���z[�O-a�x4ʾ�m��bh���O\r�\\s.��Ξ5�i��-`�뵈����Nv��r���}7/:�[����]:�+v����s/4��/j�;��:w��xh��(Y<W�5��·�Z���Pu+94�����Q��qS5`���l�ӭ�Ռ��)-Լ��/X���n��SN�����J-�dٔ���s�Nj)(죺g,E����\rp�K�?B��9��3��������.d��:�Yr�;t}��֪ճy����������NT�(�.��q����[���8l���h��1��Oo��9Ű��#,������e������[Vr��{?ST����k�|}ޟO���7>~�\"{ף�N�{6��#Tu7m^�2���:���^NrXo�h�%�C�,�FI���KC�n)�J���{+Mg�)¯��NT�Z-�,���OS��U�^�r�OAmp�����1h��v�-�|;��!8e$�w��խ.E���\ZSi�gɤȡ8s�.d��s�[R��4���h�g����u圳���<1���t��.[�#V\r��H���AOL�Ք\\�ъ����G��c��V4#N���0O���3�lC��=旈��&>S����mSN����{[K�*���g�?Ts#,=x!��4�Bz&��\r:����rrV���粗��\'�P�eh5(����m�:����g�4�ޟ��\n�f�g<��Ě��f�4�I�SQ�6\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�WThO�ݽ�瓆�ĺt��x�\\Z�7}r��r�yx�hJ������6�\'��G�K�^��N���C����īJs��߰���{��zN��cUӴ�S�+��t\\���g\'\Z�Y��$�!w\Z����;��_M��i��d^r�T��Z�x�eRy���y=\r��F�(��*)|\"�y(���U#��q��FK��.�\"���&�qj�^$Z�\0��)��ˈT�^��F�J�|�>h{IS����Z{�;�����4���-����K���1�a�-�z�w�7Z���IW�Rz��4�&�m9mס�0�\rS����S��V��**���B7T��R|ԥ\'�ʒ躾��m�s�iV\'/f���ji�S�����YU~�N��E�U�ۈ~.;��j7y�%�i�.8�xi3�S��K�L�ճ�_;����w\"�H��л�`��@�\r��\0u�	�+�@~al�nM�\0;�\0�\0\0�gĎ��\r�Юj{�J��w�\Z�y��坟�m�W�<e�^գ�p�.G/��P����Q����>�,[��m|;�i�ڝ���h�U*~�IZ��c	o�Ի��\'��\n7����\Z7�ڴ�5�����f���WE�)u�mcNo�Q�j�����S]�Mt���O��ۚ��^]�\01��X���kꫯ�������焴�~�Q�ީwBڪ��+�S�:�o&��I���b��|1w��j�QZƧX]Xp�*O�St�t���M&�X��c�>��N�\n4�Ч\ZtiEB��c��]�F�I���/y��@\0`\0\0\0\0\0�\n@ �	RQ�r��>�&���R�����:͌^y_�f��\0�����	2�:麅�{˻\n1ѧ9J��t��\"�JK�z����so<+�ۍ��\n�x�5�i���<?�����	���(��SLNR���B��ݍ�cZ+ӳk�x����ju�5�\\��Ie¤{N-����8�8ˇ��4�#o��Tk���~�[}cX�fa�t�6�Sio�q�����)o�uV5\'Ƥ*S��:sX�Zxi���U�3�r�ѥ�VBIalqiT����ys�n:��������:r۩��١�r����^#�u�q�\'s9�O�c\ZwюU\\t�h�������Cةy����&\"c饫}E�8���M�j|5�V�5�Y[]��\r�5#�p�IE���Si�ϲx��t�.ҿG��t��F�kw�	~q{3�8W�����F�N�,[j�)�b�,�=M)�X��o���wsS����*��7#q�(Ⱊ8�}�Ԙv��,�E�t��)�#�O�p���3Q���M_vg��:\Z��|A_�/3	Ƥy�l紳���.�N\'�>˃�{�9�p��ͽu7?��,R����e�l��ŔS2�\0��!���O�����᫵�iԮ�[vO�&�R��Ӥ^��<:�v��}�k�\0�}��>la,m��-������}iR��_I�o�WO�7�S�_)-�|x�u簞��}���Oq�\Z�s���J�xX�hRM���|שb]�޶��isF��YQ��8ԧV�ĩ�<�\'�>�z���\r-/St�����֍6����<m�yvxk�>}o�r��J�H�-��ۉ��[O��H=��\0�}\Z�Ѩ�>~�\0c���qz����9���]�j��yk.JԜ���y��\Z�8�T��)>�������-�GI�+.1ө�V�rIU]y�&�~���`�AT�Zt+ѭF�9�U�Yr�O-vhcχo����ԯx��\0�bd����7!Q<9��OP�e�㩹��&�oOQ/�8#(���YI�_�Ȅ ��V\ZM�g�Ci{�g���H/d���g�32�˴�4Mc��:�<;mI������%\Z	��{�<$�x{l��j~\Zq��	�{�V��;kz��[�ʤ���S��<*���\"zD?���^s�9�9�G��9mC�����\'V�߉�ںU�ĪV��\Z�G(�K�}w�߯��Ӕe��k��լ�+8�Ucq�UN���i�ӫJqjT�p���3qJ8�x�a�O]⾝miƐ���8���T��S*SSpS��~<T���fK�c��\r���4k����$�<,�\Zlf�R��2�X��m�/{��ð���Y��������\0�q���z��~�Tꦲ�R��3��x����{)�8��O�PRϽ�{,��䩇��gњĿ]I�������i�mQI`܎��&���Z��������{I��֤�s��gˇH��{�;:�W:}k��P�4g�U��{�:�y�2��ܔ�����S=�t��T��Z�+��nT����k��<��.�)��G��N�-wv�������W��X�`����yi�����h�\'��x�n�U\'I�Q�q\\�^k}��f���]�}kEjЕ8ԣR5a�e=�=�����|F���⫊�p�l�+Z\Z�(�b<�8�	l����js��\Z���Ӎ���Z��XòU*�R����ԣ$�\Z]�S�\Z�Q겺繮ma7������f:9Q��I��۩���Z��}����L�Qm�\'�X>��O���*D��x�����~nR̷�Y#]^_7�4ӊo�ȩ/w\'��۴f����7����v8��ʣ���ߙ�YJ���[?F����݋?W�/��R�s��6��N/}�u�ޭ�є^r�\Z���mEgc�NY��}���|��:8>ո�$���x�;;�twU:y�R��qt�P��V�XU����K��n{]Gү�D����R������}���S��ߍi��s9���ò��%KS�o?uV����VZl��=VΜ��*�$��9Ϟ�ܹ�*^���v�jFM?���vxi/��8�-8X���h���Y�|�(£��4�r�+�u�8��]}�u�?WK��z]M>Q�����m���˗�^����x�.���;W�-����T��N����P����f�9����+� �l�em%Rs��P�\'��S��<��3����:G\'�Эn-�cq;z�k)o	����ֱ(8��[�=J���}_\n���s�s�w�|�!��#�K���`�ߋ+�\ZBn�����+�����_��Frq����3wI��蚥+�y��cS)����ҷf_��=�ot&��GX}U��/Z�/�\\c�7����ъ�u6�oo�P��z��J_r�-eJ��=�u^G��u��^˚�w_��\0�NU;��x��7a<�8�i���Me5�֙�u�rA�	�g���F&0��\0@\0\0\0\0\0\0\0\0\0\0\0\0\0���!�\0\0\0\0\nL��/Ğ@\0�@d\n����L�Rj�-��/�������\0)�ͯ����D������B��@��\n�\0�\0M�@(\0\0��\0\0w�\0\0�\0�P�\0\0\0\0\0�\0\0\0PCfm֓��4�9/�KL�ڤ����x�����3��,c�\"�b��R�K�Ba\n@A\nA��\0A©�X���\'uNy%�k�w�_���R�e�������K}�b�,���Fvɽ2�O�/�\Z�wO���~k�L11��52�_S�	n�u�*e㯙̄�K9 �FK+sz2�qc�H�����FF�p��H���7#=�`r�X�8��V���Ŏ�mN�ʼyjЪ������v/?�CR�Jga�g�^��k�\'�����<�j�kʦ>���x1z�g�������e5�5�O��^5�~�J����4��ʇ����|�&��z��O�~�[�����\"xeL�4�{4��Xi�4:)~�\'խK\rQ��F���\Z�2�ZY��^5�ִ�?�*�U�U��Ĩ�>�>g��K��z<�>�x\'�kiz�=Jo5-��ycqO����%���%,8��O������\08n��f��qoJ��%$�M��[5��+y&�VcR8�G���ԝ}(���G�a�qHݍ��Wh\Z��ZN�G�]��|o	��������OtuG	�Vp�:[�u�Rs���>��j\'��O�ͮ�i������+�:��ڮ�QF�Ä��V/�&�ů�S2񮑧�������AB�������z�[�_���:ƫ�S���w��4�;*��!uk�F�zzIu���G�O^3�|���ږ���q�_�=��F�^\Z~�Y�}�\Z��1[���.����]�]?S�!�ⶓz���\Zq�nOg[�}ם��=��C�ˍ����w�e���O�t�X��e\n���Q��4V��\'3Yym��p}���;�r�G�o�z`a������p��.����	G*__T{{n9���Լ�ң��)ՍX-ҒrX�{�g����D�96��S���Ɵ��c>��������:�&���յ*څ�HJ��urF1Oh�y-���x��j9�me�6%w9eK��X4΢�g�Ƣ�-*��+X�\r�ܲ����.�KV����鳲m8���QOlz���g��3m?\'�]*�}���n`�w�X����\0�yN��ueM���c#�6�WB�]+V�NU!k]J�`��)\'\n�.�M�T��[湇�mR�!�(�/\r8�����n�e�{#�㧥���R�hʞ�q8ףE�P����T_Eϗӻ��A��vK�E�\\���r���F�\\���\\S�Y��5���{���KI�W��N��U�\njU$��RI,���gKm\'ouB�M*u\"�u�2�+�V�+���\'IP��m\'(�����Om�f՚�tt���%�ET��Z�r�iQ�\'Q?�8��*����z���)˷���F�q�����}�}����|��\Ze������ŝ�Z�u�j���jT�I������g��ݭӏ��D�ѤU������\'gN�\'�jP��X�ɵ�>v�9+�.g(�).^�>��w������嶶����T��o.]�q�ݔ��E���<�%յ����7�f0���Z<r�D�9�^jedB�SYk=7�6+TJ�2��q�!O~����{+}�?	�M��Z�����:��ߡj�m�_��USO��A�����~_\rp�Ԣ�߱�]EӦ�L�oz9}���-����ʕE;u�[a�`��k�Na�<W��R�6ܥ�NM�����mR5#�徙8nRR�R\\�l6i���Y�1��E�|���tGF��ܴ�N��+�c/�=��V��uy�jKޓO|U���x�������n��{:3�jS�O�\'�glt~K��kεԯ~̱�]ҏ���N~�Vy������P�^\r���>j�5�?j���P�ؚo�bx֥C�\\F0qʎ�~��е�*6��7����5(:5#�%ʟ��l}\rJ��~��d����:3��]Q�8Ӈ<����{��:�\Z��1�XN*t&�*�Y�����{d�[��jW�?�O�n�;J�-��6��;g�?���x;N�u��[Q��Z�\nt!\n������i6��#�MH�M,�i�M\'�>j�����tk{�i�2R��!%�O�}�\Z�M��,�le��>:.�o�F�ŵ�}ɾi�=�C=�q$�4���u��jbq��g��g�Z�Kt�/�����-?t��\0|ٓ��Nψ�r�5�p��5�m9��:Y�E�R�yMvk����o8f�Z�Y�ir|���}�~Q��G۝l����N�s��z��.[�)��K�zJ�J9O⼏�4�xGY�Nҝ��״�zMS��ZR�ۛ|y<u:m���w��_��+W�ӏ�?��:V�V�J?�[��4���_��z���Q�ZS�.��\0W�����ޜ�u��Y�8�yٯ8��?N��G3I�em(W���B�RqOݚ����V��^9U���k8��L݄�ס³��wAU��4ީ�3}3�1��D�`٧<|?#{��c�9\0P\0\0\0\0\0\0\0\0\0\0\0��@\0\0\0`\0\0\0\0\0\0\0@H6��c ��]���/́���p��!���p�P|H:\0��^��\0�\0�v\0��R|\0�\0�@\0�;\0\0\0�`\0���\0\0u�\0\0~ Yk����m͸A���]�>&�%��b+d�b���\0��\0����l��+\Z�w��[j˖q��3�\0�wVW:E�[��*r�?��i||�Q�F��Yݞ���X�6ISq��-��koX�G�l�s8Nq�\\+S��JrXp���I1����S�o��}6x:�u����S���Ԋ��[u5��~���T�q�v��\\�����	\'��U<��ލO�r9jKȹ�4��魰q�d��c������/�������B�n�1J��UK����y>m����S��j֕m/h��U������5�>��]�:�(��#��!i�Y��4��kA�֣���ꗦ��᫡��ca��}����|nU��z��ԥQ�E�>H>���[k�t��\0�G���;�i��nt;�ے�������������[�,~l\\٪�IӜ\'Ns�HIJ���%Ѧ�5�{۟���t8V���y�����þ2�˯º�WYT_X�Ǘx�zk��ߵᔬ�m|m�(���([q�I�޴��yIuO����{�0m�{����jP��7N�*���T���׈xwQ��(�j�}�EV�Z��!���t�ב������\\KôiQ��Z���}��z�&���ǪGY��^�~�%5����[:v�\0�?�\rF���Q~�jQ��5�5م�o�<��[g�5dՓo�տra�� xI�nէJ�2���׋�F����k�\0i-��(��5����]&�5��=K��b�ҕ�u]���4�t��ۣ���o����%�_gҮiW�˒����87��\rJ�<?#�MJ�x]�������F����/\'�\'�N9[n�����U���F[�����8wA��\0�_�g\"<[Wk���U��h��յ#�7!���s����q	&nF%�XM�xL̓�o�����\0��Soou[O�7�Yv�u��Jy�4�Q��8�+�{Jǉ�s�m��a�cW�9��\0E��*���3-s�Z�58U�o;�����V���9���\\��\0���\Z�;K_�����aT���\rF/ٶ�x�gU��]�C�u+l~���6.x�\n��\0U�\r�\0�ַ�1�ҳ�ˎ��h�Rij�3�|�J�P�4#����U��\\{W,/-��?\n8O�Q�i�Ѿ�̤�R�Q���\n�^7��_¾�h{-*����sf5j]�8}�[��8�\'Y�紾��Y��:�K�^?	�z\Z�ԓ��\\���L���U�\0�k<=_��j?�mT�N|Y���G��.\'��^�w�=�Ib�z��e��Mo��O6�jt�=FI��B\\��Z�5��y�=����tV�m�W��/�$p���\ZSx�\0G\\��/m��\0�$���]m�j����Ǵ��US��?���Zx���b�R�F��V�\r�\0u�5O8��̸n�K?��)��Q�Ixi���*p����l��\0&ff[�����}^�W���>VZ������mNP�Lc.Of���w�d���rǢ^G>�k����;�S���Y�Q8�4mF�jzm�8�߳�}bI��y}]�6�lƜ�3�m®T#�\\t�~g6.N�e�]�;�mH��b3��WR��Qȶ�J�\\P��.�����Nu)=�>����C�&��f����\0�P����^�n*�6�k�f�\Zw1��J�!K�\"���tugO�����7������H�����J]��=�F�.h���gSQm�\\ϣY�{m�6�cr��Rt񝛎]wq�������l�I��ٳ�gQ��-���:���r���[Ocz�n��t�w���r�s[FG�w\ZW�L�F����闿���nܖ˛?8T�}�M���ɱ-�m�<X~Ꝝ�ڏ켿��:�uV�op�O\nY��Go\Z��FK)�os�ԭjKߣ�{3���>~�\0C̦1���8��Q�:�n#�N�.�o�����i;;�_������Q}�����n��{��j0�Ujal�3���5{?5��k3<�n���CŮ��ԾߨV��wV��-��\'���2��y�w=����w�e�:ds�\0k7K�IҾթ�ݫQ/\'#��MU�����8���kNR|oo��~���x��5�>����B�J�yZ��<�/�>{�-�H�j�i����k*Ԫ��O\nNY��u��h��_z�v��r������?��\nQ����Y�q�}����釦�QǙ�k�sE(Vi���ߩħR�{$����7&�-���S�/��Ӌ�k>�y�<o��	B��n�w�Y{H?�z��ѧ9ʝ��u$�{*Q�\\[넶H��55<m���J�WUb����K��ԋ?�o6q�y�vd^��c��3�����R�S�锶ϩ��s�4� �^��R��фjT�JR�I���0&�[��-�u�KC��߈ki�ϴSn�H�:��xk=~+�Ժ�qn��.3a�\n{�oS�6}���hW��`�k�_�99���KQoXs�F�vf��c�9\0\0\0\0\0\0\0\0\0\0\0\Z:\0\r\0�\0�\0\0\0\0�܀\0\0*�w/��\r���@���\0Ǡ�V/�\0!H�\0/�C\0X\0@�X\0`�\'@/�0@`�P;����\0�\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0p\0\0\0\0\0�q����=KO���(��	���]���?���ʽLe�m�F�#(<��oec����ߢn%�ZC\Z}if�WJ�ސ�����y�q��Xۡ��Þ凳i�ƥQ���j��Ƹ�a��&r����Y��7�:�m�l��~�<n2;(��[�Vmu:�T��嚣[\r�C#���=M~٦����n�}<��U7��\02�v�%�rnƾ_S��U�\\j�Ῑy+�U:l�k�iC�_�g]\Z�uh��נ��c}q�z��\0]�j�J���\'&���~�\\���&��ɖ��3F��:��.�wV��J�4�)?7\'��:��\r��+��)�e��NT��$v����Z���\"[�[�kK�W�k)r�u�7ޅ�e��m������ϳ��\n/�7��\rT]�j��|�O��wۊ���X����M����Z~^�ҕL}$�\r_\0�o��YI�U�d�͙�H��O#N}��ۺ�9`��j�>ÈtZ��=:����\r����+�\n�yS���pFu�uy��T�i��7�u���V�JQ�ms��Ò��r��������~��������^q�Y���T�E�mi�I��_��U�}�]P��3�u$��\rKHF֑�ڿ�;��\Z����-�b���d�5~�<�׆uخٱ���&}u�X�ݍYC��K�Α��w��6�;�?w�T��Z�çq�j�S�jv��ONS�;9�O��\\/>{j�c�Q>ĩy^���p��r��e�ڧ�L�N}V�u\'�#��>s���B޵K#;�8�e��N�C�sƺ��{*�Z:��FqT(ɸ=�%,��+\'��*J��V�/)�K�G���l�[\Z���kNY�\0�חh�y#�ts�я���zm��T)��X�ko�g2�nh�B���O���H�L�ޯp�l�n���\\����ӋS�8F�y�WD�?v�G�3:6�{#�tg��G�T5=r٥O\\֩/(���\0�qU��/�����\Zf��Wo��,c��9ԧ�#�W��zH�����5�\0����Z�0�/8Ύ��}K�\0Ņ)�pg&���uO�q�_���\"e��C��zT5J;�ƣ7�$�o�b�_��=�&��#N���/\r�ŧ�C�������y�M�Ա[�\0vH�R�׍i�T���K�����UW���G]�`�Ε	�\0�G���RǱ�{�Itu,a/�h�n�w^n�O�]\\?�����G������5G�kk��^����7���2��\0\'�O>ˊ�o�\0i��~U�T�O��$�!�e����h��$��I��L�ΟWgKŎ�,\\xq`����M��4k��~\Zݾk�\rۗF�im�%�~qL#���������\r���TT#�������	����L�:����q/�U�4�����-���k\Z~���Җ��џ�iܧ�ڣ<��$�z9KF�Y��E���ø�ˎi��r��*�g�嗫�t6=����\0��eK�����X�jIm�iz_����\\]�P�6��_��	W��������y��m���l�W�~$��W\Z��i�p�j,�����3���P���\0nb���,��ڵ[w�:qf��ܬ���g$���m$��k��մ�Ym[I�K	Nʦ�?�����ף(I������Q�J�u?�fa���A��C�=\"��rQm�mXW�j�c?��>�s��g����&aJS���VT6�?vTea	�ЯkJku*U\Z~yM4fg�m���m�Hd;�uE8��d�<$�զ���a�n��-;�>0�k��8[ZF��|ү\'�͈,.T���:Σ��h�J��2�����8T�n%;z��՚i��˛�yO;�s�)��oY���ѓ���;�^��\0E�곲�+�\\�S��W�\\�\r�^S�^�\\0�Tkl8]P��\0���.(�Ҷ�]~.=c���g2<uƔ!�:��u��4NQ-i�����D�ysg��PM�����)/¡¹��&�ߴ�qa�͔���E?8����n�th��v�Y�is�6���)I��D�:g�k�Y�e楡k4���O?�=>�K��%kz�\"��k{n�ëkR���T�o�J;J�F����R_�9��x��A�v�⻺U��\0�f�Im_�](��c��C1�qN��y�/�r�}f���J�*ZVs�����̟TdK��)�F�@���*U_�撚�o�.�yO���&�|�R����#uԚ�2���:���j�g�x��Zw��\Z�-����m�ϾNF�x���Vm��i�����1���m��Û��ѵ�NVk��x?t�W�u;7N�H��\0˪�\0#�n/���kNӡh����\\so��ƭ:�eF[T�*2̗�-̇K�n���R}`��6���h�m<\"������tUkׂ_*�h�-8;�o����k���n���2�%��i����[*���8{�o�U�T.nf�O�J�����Sc}F�tg����������a��C����o˧2;->Ǌ��~�J���z�~O�17���o��q�\0�����@�v|B�j���\0��ᏟO���W�^�f��\n���VӞ��\0s\0\0\0\0\0\0\0\0h\0\Z\0�\0\0\0\0���@.�)tC�P�	�a����Q�\0�\0� R|���@�(�O0�E���2���P\00\'r��v�ԀP\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0\0\0)\0q��(T�g	\'FK)��4c\'�;�I���qsk�ljϖ�5�No�G�2���2x��$�{��_9V�%ov�n�Z��lЭ	Bk�����z�����Fz���?Y�vڵ�����zjX�>��c*�n�J��N�X����N�)?(�����29�\'�����w�[�ȍ���۹�hjzŦ�i�j\ZU�6�*���n��}�w�,�~(�q�eYAKt���y���I^,��g���q��i|�GW�\\rU����S�OR蜥,���!������x5ƺs�O~皆����2o��<Ϛ[��>Dɇ���[���j�D�$ס���/9��n��&��ߘ�a��Y���j�I~�m�\Z:�x�.�E�J�,�o�dö�Î�2�F�.��d�gWe+[��F�UIII�9(�Y]~\ZU���^�X������9z8�9E>e�7#Y��y^�)�[c��U=N�|��e���Uʏsj:�	%�^լ�>���Ξ��F�*���o�{��i�u����F��T�9VMS[����n-����һ�X�BQ���$���ߍgʞ\Z���#eo+\Z��)*QK냱����5�Uŭ��ER⋜��O��lkF1ItK��B�7�?TnF���\rD��5Vq�r5�5{��}���k#�U7�nF��ƺo���.�Թ2�\\�*Q�������1�F5\"�\Z�k�8*�}N5JuiV�k)��_~���/�?TQ�{OP�\Z�!NN7V�Z��i����]��ks,P��R_����zeuC)�cϒ{CbR���|Q�����9�7��}��ry�9�����`�ry�9�U=G�Y\\�r9l�?9y�A��f�5)��\rT����2�s�����9�.Zit�ԫN?v���L��B���s~�U����Wu[֛^�\'�sl0e�����IK��\0����������=�%��8�%�\'��oQ�X�Ç[��*����S?�aI�\0�8s����~�}qe��7�T���k�kO���s�us���ds�\0g��8���ێ�*?�o����9Ǵ\'�n7Z����xj��t��k�Q���T��ĭ�	T~�]v��o��83\"{A�O.�α���?V-��+�撡�k�R]%*57�����J�}��q]��iK�h������!�<[y�KT�O�O48�����ʡƫ�F�Gk^\"�k>��֭5�6g~l��}Ǘ\rG�o?��?��^(�|��?[��b�?M�<!�\Z}-�����P_����9�nhҫB�jԩԸ��Nj2�%\'����o��<�u����>��*�w��.��Ε��\0�8U�C����k�u��^U����l��4m��б������m-�ʵj����O*=c���\0b_/ӳ�t�s�ѵm>_���(~1����{��J1����>�*��|aUe�����Щ��N����{��x��R�3���eO�N��5MU]�cB�/�L������_�\0sJ%�����(\';��]�[}�߽�ў�H�O�(��Ҿ�SlԳ�̳��i3�>0��U�W�,mg,�W\Zl��>��9�z�Z���ЧRO\n6��vy�\n�|��3m}��b�s�e]/W��i�gu\Z����_C�1l8X�d�iz��Yʍ�M��\0~\r���\Z6�h�C[��.��2�����b%���ӏ��l���@���T�Ԣ�Mw(x�\0\0\0\0F�@�\0`H��\0\0\0V\0ʈ_�Q�� �\0Ĥ�!�u@;���\0�.�R\0.�)>�T6\'R�\0z���\0R\0(@� (\0\0�\0\0\0\0\0\0\0\0�0\0\0\0\0�\0\0d`��\0\0\0\0\0\0�U�\0\Z(ҥF�4(ҧN�cʩB	A/.U�kƾ	�:��U�/����	K��\'�2q(q?��Q�{Z�Z��2�ŋ�N^��^����s���_��8Q��iS|��SݜZ�(�5�>���E��#��E4��2����k�´6��#�/���q=��L>O�uk�>K�xS�I㛪��Ҿ�^�}vfJ�<��r�Ú�n �[jM.�U]q�%���u�U�*{=gO���Ǵ�����5���8Ν�yD�����>���w�m�\0�:�FXMeŬ�tf�9����+���8��n�A������.ۭ��5ƾ�Z_�ÿ�z���s��HOy,�w����G\Z�~��n$����L�z��{4�O8]��7�s�u�|y�o�--�����&2a�}�6��Ӕz?\'����J�ޛv�(ӍY�r���Ė��>��z��!������v5����������{��G>��{egў&�g��#�J�J)���sQff�oJ�a<��M�Q�o��x�z��ns�^ga�T��\'*Zu�k���^0��ͼG���n,���;���۱��_{�\0#f��\r:N���TIeƝh�/�s���5��Q�V�h:s���-�����c�a�~ړ���n+��G�z�O�ǧr�U��]vy}=I�/����������G����}�yln���׼�,j�^�7P�]��qoir�Z�9�̢�������0��~�.�����R%&���Kx�esV�Z�.NqO�,��7��nv�K�%�����,5�mo>���\0JSoi�>��Ba�����j��E�߃��5-r×��t�z嶎�7t�\'&ۛ����B��jO���\\�==oO��g{o>�U����%Ҭv�<��Z���9.���G���dr0�_n���Կ��Q��-�R�$y;v�+F�+Y=叆!�~�ߏԿi��#�~�r���6�j���u[Ϟ3M���9߯CS���y�U�N**q�/u�~7qO���E�;�Yy�R��t�k�xr�/�ㅺ���ú���Ưk���R�T�W�j�}���C#����U�:uq�ώM�]����ϯWo����N�p[�5��֨�>g�x6�T��yUY��\'�#��>�P�=��j��\0���W��\rʬ3���k?�Cй��T�<ӿ�[���Z_�����kg�C���������?v�<ۖ��7}]+g�Nig�.Q�=��}�N����k6��檴�����2��A/?m�02���c�Uy��u0�S�R�W�y7~��q�Ĺ��]��k|;m��&�^��.t��v���\0V��R�7xX��2r��^q%�5������r;8Ow���\0�����m8V�\\�J7Wܯ���)��5�הW��5^!��M\"�U���Y�uf�ϴb�[�>$�z�P��	f����4�E~�W�XK�n�>��u�{���o;z�����ӱ�rOw�ړ̰��yt�sV�v�F��5=F�߽S����\n��K�ť^�A�. ЫB���_ZJ/eJ����.yq�1pO��EJp��[��^җ,hW����(��[�]N�E�WQK-��Lvb֗ݜ��Wث�\"���Kj��E��]>k(���^:֗�eH7{��Ϛ���l}\r��x�8jW��-������`\0�\0@\0�\0\0\0���\0\0���\0*����B�6�P�c�>_���r���<���\0��m拿��\\|@ǐ>�!~`B�P\'�|�@�\0A<��(\0\0��B��\0\0\00\0\0\0\0�\0\0\0\0\0\0�\0 \0�\0\0\0\0\0\0\0�\0\0\0\nh�N�j3�Z�*R�ġ8�E�&�������R��4�SH����äߛ���`���\0�\\G��Զ����,�{\'����/���(1jV�������^Tjf���N.2[���چ!���;�c�oCҵ�*����^Etu`���U�f8��)T��Nv��j��=�?D��$��)��\0k\\��g�ac�|2x�8��w<E��U�s��K�j�\0�O��Ǟ�K��I�����Vkݨ����ui��5K�E>H9vGM;�Ǯ���RMFx^FZÛ=JK�ʔ���pq��ӋY�4�N<�e�IK>f��^�i�)���H�\\��1��8�W�)Ե��M<(Κ���v7s��ܠ���{c:0J7^���~F��%�p]{���XQ�h���K��B�?�\'�w3ſi�%5��ܴ�(,ά�����Y����lcN���x:���r�F���u�Ԟ;��]0p>�N�i��:9yu~o�f�c���e��sĻ��[׍�M�µ\\8I�6�����SƜ/m�zg���hj�W5��{�O�/.���I�u�k|���3�|a�KC���R�(�[I�y�lឍ��)~],�����ͭZ�.)΍z3�uiI�Ӓ�_OCj7=}7�3��-M��4�]E%qO|V�[Ko�]=Q���ʧ̞W���\0(�N2�g.k�il�W|�7.Ov���8jq��O������ykc\r9s��q�\r�F�w��d�~��Y繭\'��:-��K�K��O���K�\'�Q�;f��}�U�=wK;ɇ:\Z�e�F���z�YA7.g�\'MN.SNxH�RO����ù��S	��^L�J�R|��l齫}^|�UTe�^I��S������-y3Z���_��<��rg�zwGw��E(�g��B-+��֯%�{��5�Yk��\0#ȫ�I�˟Vn�ɬ���ȼ�8��~���>���RM��\rt]O*�6��o����m���c��a꣭�E<ɾ��ϩ�kRoicn��G+��M����k*2�Vu�ĕ:R叧7��yI��k3R\\Ӌ�ѻrJ+�X��\0�s�*�|��m5�����^�ٯ�s��=�5��\0o�ȧ�&��>=Y�Ụ�mc8�����S�̺$�Ϡ�)�B�TRٳvZ�YČM��F�j5�Y>��9K����B�R�8]�����|������cg�����ge�7[Zz15��T�TV[g����~�c_��N�+-rƵV��KiS��ғ��/�s�-*J�ޛJK9�m6��vY5��\"!ݽi<-��b-qE�煳���54mm>iXC�~��^Q���W��v���w��55\'��Гi��Ľ�ע�3�Ly�������%�(˕�����r����ϛ+��V���6�c_阽�����{�]Vw�V��̤������pd_��o��jО0���}�\'�9g�j�|�}���#�8=��iw�R~{\Z*���s���=G�g���5�|U-2�N���kE�{���f�|�!&��}�V�?��nք��ܢ��[�v٨,�ߡ����;;i;ˉ+��s\')<��6j�JM-�OdGB::�Y>��C\'+�?�5B����,C\\�uO=\r�0I��3~���J�����=}��_g��8SNu%\nnJ	,�&�ơ����JU&�_�=���[��u����r�7���=/\0p���RUgz�ꍤs̳�R{Ez���\\/�4�,n�#oaM/�G���|����,�#�3=!��xR�}6���$���`�(J����4������	�P��J��TQ�N�J�]vS��ݤ�I$��$�H��כN]+X��k�i���Z�O��V9Jp�����\0g�@\0\0H\0�\0�\0v\0\0\0\0\0\0\"��\0v (��_�hw\"X�>c���>c����|�۠����O�a���2��\0c�\00_���\n\00\0\0\0\0\0\0:�\0\n;\0\0\0\0\0\'��\0\00\'��Q�\0�\0\0�\0\0\0\0{\0\0�\0�\0\0\0��\0\0\0\0\0\0\n�[���q���Z��kZ�_��G��_ێ�=\0?�<���Úӏ���O�g��0������:�}J���]:1M���}��<ۇ��qG�M��<3���}-0�-Fu\\��ZZꔓ��g(�.����eJy��GݼG��9ĩ���lo*?����U|*G_S�?�Vǆ|E�Ҵe_�q�B�cZ��(�qm�g�6�b4b:�ˠӮ\'��R����U�H�w�=�4Zv.��.Z��fr����ӻ4p-����sт���\'T}iǧ*��w�G#P����gW��Un�B|��^c6�ȟ���e�Z}��K��jɴ�Ig���d�xG��Jw���s*�\\�cmYЍ����攚ߪX������J/��M~��R�&�r�(��Ka:�����N�7vvt�U��ծ�q��rk�=����*��zv���cF�6�,���mUԱ���o��<m�s-�.i�R�u�J��U�4�:4��\\z15����ż���V�:J{K-a�\Z����w�V\\C��N��R�N�Zt�����㗜e|Q��o��Қ��֒���jMo���ǈx��7�u�Ny�}�p���խ�Vc��\Z��N���ZUӮ��jm{�:�R�X��\\z�]��g��ַ�-�U�mzݭ�Y�W��z\n<e������&����;\n>#qu&�kП�(���5�x���ъ���BK~YҜ7��hz�{m�*�-}L���T�F��U��UO�jE��@����џ�ƾ�gٌ-u�Z��e�c&�V>��9���I{�}�����\Z���+*��OO�����q�w�Zu<�p�q�\0xW�I������e�����(�[�O�ڳ橢շ�N��S�sln���֢N�mB�;bP�*6�R���NO�wMw5ƣK��K�������N&�a��\0j�4�R�f�x��V�m���\0Jڄ������\r�U\'8BI�/�O���H�)������K��*��Zq�7)c��5<�ϖ��W�m~�ڶ��M���Q}|�e��.�8yol�8\'�5Ɵ*J1�]�*�u�P�tnxj��S���\00h\\Ʊ��^�Ut�=Z���-��%�E�5β�{���ͺ���U��5��>���*V��\0�G�@�[��	����l���q��LÉosJ�ԹU�m�U���ė�RS}N\rzwV�W:�C�T�+��\'��o	b�;��mj��1*�E���lNl�=�u�\0�4ȧͨZE�����N��p�U�	\'�5�$¹�\\���%��]N�I�\Zեχ�k\'���%QF2��=���*\\ӏ�rK��wE�Ir(��Z�݌�m�[�����3�)o�}�^Q�4}V��\05]WJi�)�u}p��v1֫���S�y��W�K�7MI6���:㷡�п�g�P���B�_4��}����\0Cp��]����ﴝZ�R�n�\'��-��s8��Zgp�:���R�X�N�>�%���t|�V0�iΜ#K8� �_�{\r8�\\3��\\NKJ�j78YT��U�~צ����Ԛ�:9G��Z�u�j�Uz2��ɥV���\"���g��c��U%yZ򼓩W�I%�����]�*�O�;�:^�c{]�뮲��F���������J1�BK��f-��,�k��Fuc�L;�P�v�����1�|�3*\Z��-ha�\0E�4�\Z�YU!/Gr��Ռ���=H�Ùgu�s��u�.k���-��#�=�(Ө�^�0�J�LK�Ԯ��V���\\{JNmJ;g�%8T���lG�X�B���R�����I\'��.������mB�W��9�������T�s���R�~y���M��Vi\'Op:�Z+,Z2��d�g�9�z�}%;;����JS���)^~��挜`��U��\'�?u�9vz�����k> �E���:v��3���˹ꮦ{9ۣ�[���^���v���Ri��ҸN�5\rC^��NW7BK��%�ۊQ]���6\\(�ҡ�W����:��\Z2X��jl����xR��h�*ԣN��M�*��(T��Ô����xXXH�i��7�I�p�ASvZK��-�SU���U<|w�=��R��g�\\��=�i�>�n��5�i��uNյ]5����B��GW1ڄ?jT�Er�X�)�[�|���v�U�(Z��	)U�Ӝߛ�~��赬۫��h�4�XS��zPX�����N���]�0��(�\0\0\04\0\n\0\0\0\0�\0\0\0m�\0�\0��P\0�\0�*{u�\0��\0�GoA��52d<c���~����r��>@\n�>�1�q�|��_��H\0��.@��R@&ޠP\0�z�@`\0\'ĠB�\'���\0\0\0�\0\0\0\0!@d|�\0?0\0\0\0�\0\0\0@\0\0\0\0\0\03�\0\0R\0( �����A�A�5[*�/W��P�oO5�6҄6������㹕|D�H�:K�6��Y>U价莋���:����j��t��UE�oI���\'$��<y��F���x��KQ�����U�aJ�\'Y鳊���\0iQ��_����C6�\Z=���X��|$�,�Fޜ*>|�/��V���\"\"���	���t\r>So.t�{)}c�y}C���oN��l���r��#����\0�g�t�J��]FOO�-+�����o��o�t7~qe�{�.�.��Û���a63¾�_w�W\\#Ė._h��U/:t=��\0����gyo�qa}G��H�\0��{e�_���P�����R�ڎ�Ģ��QUk|?G�﯇FϯjF5*B_Ҋ�ï�i��k�O~�������k&�S��4�5�`�^I��z�+õ����\"o�Ο����oO�p��\0���\0�<���_1F����#v0���,.������d�|;���T6���\0�]���\ryRe�<瑷��ګF�U(�\'�;GK�^�]���J��;Hۗ�\'��8�F�]<�Ǖ>�e��n���NV1��m?��Y�u�\Z�h�o9rrS�Y�[�N8���?X^U�~�ǟ��/$��Ig�\0}����I�_>�ڔrҫ=�jK�~��nS���n��//j��g�xA�m�\\�1�^z�M2���\\���_����#˓,�N��N�x�m�����zι��5��]$�\0��Fe���C�5}[�.�?�mO��2I��Z�Ol8S{c�8O�g�Ĵ��Z�䆯Ju?u�[���rs�q��xWT$�S���O���楩�R�<�5K����x��=������Og���WS�\'8��F���ŗ�|CmU��\Z��t�+��ףg�~Ia��K�e�\0)�j�]T�\\An��R����������V꯳��+Z�)5��z~!p�乯�SK���X�����~�K��k}o�{�w�RS_�(��kt�Os�X[J��cQ5F;�U�ГkD�V+��q_\0��kpf�������/�«��h���5���>K��-:����{[t���Jo�RM�.���8��\0J�u-6��*��⥵\\O�s�N/6-f�^,�\Z�����hj�Q_G&nG��7��\0Wյkw�X�y��g��8��s��gNQmE(��^^�t��W�~�FӔ������s��vO��>�?Q�\Z�ml�T_�GwÜ��t�#�J\Zܪ�ܝ�?g��r�a��<6��P��Ypï\'6��R��2m��#���q�׶�K��Ӟy\\.�-��\\�\0���	������-�m�m�AP��cF��V#���.����?�\rSP�x�եZ�s�l��FOv�Vɷ��7l�p�ǎm�\'m=~����R�>�7�p�Zɪո������?���L&>oI��csmw�U���s��%sqF�ZR��T���3�c�������)Iʗר�G�i��﬛ߢx��e\Z|G攭y�,��{w��iQ�.�T�څ]>�4��P�g�C3���N�kN2YS�k���ƛ�×��jq�u��ZuU�O��|k�YӷӴ��v�X�J��Y���QK��s�񟈩,�޳?,iU�N��)x{��J����rm􋰩���i<ƺ��g�}��Vԥ\Z0_���H�����:�9J���i�_��}WB�3חy}Q�Ѵ ���.2��{W�++�򷕈��c{#�v��\"\\�0�*P�-a�U���YB0�ga�P�N�K��r��r���%p�K\Z6�V��uZP��z)*<���Io�����kjv6��K��5�OgB�$[�o������#o�i�n-Թ�.Rq�\Z�;�7�=3�X�Z\\�R�9������N�����[�R���W�;�	<�	=�Q�O6{5+k�hЦ�rSH��Ѧ�U�t��J㍗��[��[�ӥ��؋�N1N��]=;{��b-S�S���m4�5E�ju�[\'烱;kZ�#��t����\0(�(\0\0��i�\0\0�\0@\0>\0\0\0�2;2�\0�T��!@� �C�P.@��e����`�\0]ɰ�����L\0y�\nO����A�\0<�d~\0RuC���l\0\02\0\0\0`\0Ob���g \0���	�(\0\0\0\0\0\0�\0�\0\0@\0\0\0��\0�\0\0\0\0\0\0\0\0WRM^��ZU����O搈��\'�e�5�./�F�NY��kb��\ZIJW�f����cx\'k��c[�j$�J\n�2����?�lOt�`\0\Z\0\0R2�\0(\0 \0\n\0��R�\n (�(\0\r��з�R�i(ҧ)7�!�c-���=�K�\nz�&��\\��_�����W��zG�|M����\Z|i��ܥ%+�������xkt���{�����jZ�\\��Z����97�t�ѭ���Fio/,^\"g��=��O,8.�ڪVw���s���iż�ӏl�e��>F���o뺍����vw�S���sN2�����o���#�f��~xl�48zt��8_�,?5�61�c�K�%�<��7�jr�N2qs\\˲ݢ{M�\n5\Z]6Q_��\0��g���i7�J��Wǥ8%����d�e�BK%V���?�]\Zp�Q�i��,\Z�̘^i~���������#�C/͓�\n@)@�A`(\0P\0�\0(\0\0H\0�\0\0:�\0\0D\0�\0�0\0���w&\0\0\0�\0}w!@���\n�\n՗$�:�Q�\07�\r��\0\0}�?������\0��m�\0�`��}@�7�(\00<���{\0�\0;�\0\0\0u\0�\0\0\0\0\0\0\0\0\0\0\0\0\0`\0\0\0\0\0\0\0\0\0\0\0��\Z����Kg�G�<_�u].����+��5N�۳���N�t�ww��)y�.U�3�[��>���\n/����\\�\'�ORa�\0\0\0\0\0�\0\0\0\0\0)\n\0\0\0\0\0\0\0\0( ��ë~�����7��R�g��_��=�4�qN��C.5T!$�����;���M�_Y�f��i�V����H�sy�V��&��<���F4҄!��@�4��P@\0\0)@�\0\0\0)@�\0\0\0\0R@��\0R\0)@�\04�\n\0\0\0\0\0\0\0\0\0 \0�\0\n@\0� .�\02\0�����P��2;��~���G�.�7�{��c�g�����\0=F~#�����Ȥ��>C�{�#�`\0�y�Q\n��Q��\0��>l\n\0@\0\0\0\0�\0\n\0\0\0\0\0�\0�`\0�\0\0\0\0w�b��c�[z\Z+V*�MVk?r-������d���_����͊<��i�n�o���E��2��2g�:�����K��	�z1����u\"�b�p��4����\0ЩK���q�mB��}�Et��Y����\Z�\0:\0\0\0`\0\0H\0\0\0\0\0\0\0\0\0\0\0\0\0\00�u�W�@Y���j�9,~�:Mg���;���⮼e׮6~��ӚpK���̤��^���\0\0\0\0\0\0\0)D\0 \0\0\0\0@R\0\0\0\0\0�\n@\0\0\0�\0\r �\0\0\0\0\0\0\0\0\0�\0\0`\0 \0\0\0�\0\0~D\0\0�\n@\0�A�\n ��}��J\0A�PP����m�����\0>C#2��L����\0!��4\\?0\"�\0��� �t�������\0\0!@\"�\0��*�\0\0�\0q�\0\0@\0�\0\0��\0<���K{8V��WwJ0���BIWMtqOi��M?�����ĺ]Zѿ���\n/ooeZ/��Ƒ��y������DC��8��2�w�U���T>��ˏ�InyZ�ն�u�.5:5y�u�������.3ē�$�:��Я^ot=&��ֳ�?����k1�������H�����J1|���8g?��\0�\\���W�+�qE�y�1���\n���\nI����f�|\'�t��O�4HG�6��\0	��p�e��7���cO�C��a���Ʊ����v�늺EX~UL<P�zq��|t�Y/��o�_S$��ς�}�\Z����Q�?�q*�M�u�^��;��K��\\X���./�����������Iԣ�N.*I��2�G����Z-����������Ty�r�.w�,����5|�Y&��Y����jK�N%O�_�:�R�\0�h��������M~�����\0�n-��F�xݤ�n7\\-��1����3g���8��W�]����X6+x;��X��i��XN?�N�]�/�JM��u�~���U]����^4�~��]zt[�V��?�3��>q�+yJ�Vѯj��*N��r_��W�(I�\Z�q�s��R��OeY#U�V�SG�K\n��m�;Z3���UE�E�Ea9anw=�O	j�U�z�M�P��F�oV��9ӛ���i��_�J�~��v���_[�gR87\\đO��v�\Zv�W�?V_D}G_�k�:\ZƙV/�.��s�W�q�\nԪ�\0��~L�N�n��\0Y���/:zr��$�~���i����{sB��\ro� ���>��/�����|h��*�JP���TM5�qwK�9�ժSǱ�n&��]f�*��!�}z��>P��}v�cO��l����Y�Z�϶�>7�Y��u����F�oU���e.?��\\�t[�/ٯ�8\'���s�x�ǱK����tn)�����Y}G��+��ü=V}�=RpO�?����ZIF�¤��]f��	E2#3�A���i��k��\0�j�+��H�G��IF�qm���/�fʸe@c�^3�cï_W����M���,�t��R����Z{y��+Bt^�8��}�_t��.n乣B�����ʛ�_��>j�n�H�gVS����M�796��z�:�@�÷��7t���3�\Zt�謬7\'�l�s�6�oo�7Ҽ��ҝS�\'�y.�����Lz�=r�0\ZhT�^�gF�*A��d�f��\0v_BJ���<o��y�\0�7�7�GMļQ�p����Z��/�ƭE�\'�,�O�\"����zMz2�CKֽ�_-J�!AN+���%,|R=	q=.\'�;�M6���)r�W�:���RnX��ǩf&0��P\0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0(\0\0\0\0\0��\0(\0\0\0\0\0\0`\0\0\0\0\0\0|�\0@\0�\0\0\0�\0\0\0\0�\0w���>�>��\0� ��@\0��\"cȩ2��\'�� |\0m�=q�&�}FG�.��C��7��a�@�	�q��\0W�\"/�~#�\0��E`>�v�\0��\0\0���\0�\0:��\0\0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0v\0\0\0\0\00\0�ѵ�5)����4�\r^�����hB�qZ�:��pR��@�����ՓU�}2��7��W�ׂ�z>�����皍a/�C�=h��#�����I$�-B�Ohn�8�*:={ZW�	�\0�����	?�޳K���T�98�|�Z~�[�*K�����(Pb\n�	SY�7jq}����J&��gT���q��ji�~1���20�O	��9P��j���;�?�L��O\n8�ђ�SI��ܴ����\Z�O�r |��Z֔ћ��$�����(��Կ�G�xʍT��z�9G-MS������C\rr|�WA�z�����\Z�ռg�c\n�~�)��$��~���8{Q�%��Cc�{�ב��FX>�*�]_2�e�J:=¸��2����smS�,o�L���{��-O�6�5��S>���K�9����D%�=~2��9����\'�Rx�S�*b^��M����CQԪ��8R��ߤ�HJ�\\�*���K�u&�a|#m�m�Dd�p��6Vաu�wr�nbԕKh���7s���^�AIF1�R�b�I,$��(,�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�QHQ�\0!@\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\n@�\0\0�@`P@�{l\0\0\0�(\r�P��\r�HP\0w�7�m��\n@\0���a�r�}/}���#�/�\0d\0>#a��p\'@\n\0\0��\n�\0\0\'�\n\0\0\0\0\0\0X\0\0\0\0\0\0��\0\0\0�\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0(\0\0\0\0\0\0\0\0�\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\04�\0QHR\0)\0�\0\0\n\0\0\0@\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0��\0����X\0Rv(]H!r���\0\0����>��\0p�F�\0�{����H���\0 ��\0�p;�@؝�\0�ؠ	�r��\0:��\0\0p\0|@\0\0\0�\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0�\0�\0\0\0\0\0\0\0\0\0\0\Z\0�A\n\0P �@(\0\0�\0\0\0\0\0\0\0\0\0\0? \0\0\0\0\0 \0\0\0\0�\0+\0^�	��B\0{�R���B�nAGP�@v  ���`;n\0���~c�a��c��O���	��e���.Grw\n>l���\0\'�\n\0}\0�\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0v\0\0\0\0@�@�\0\0܀HP\0\n@;�HP\0\0\0\0\0\0\0�\0�\0\0\0\0\0\0\0\0\0\0`\0\0\0\0��\0@\0��\0�@�@.���\r����>|��!  �@��2m��I�co ��O��|����? /q�@(��g�\00L|J�.��/�@�^�\0\0\0\0\0�\0\0\0|��\0\0\0\0\0\0v\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0w\0\0\0p\0\0\0\0��\0(\0�\0\0\0\0\0`)\0\0\0�\0\0@( �\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0�\0�סH��\0\0\0}A{�2\0�rH_0����>�>�\0�2;��{�z\0��\0߸\07���+�� � ;����\0@(\0\0\0�@��> \0\0\0\0\0\0\0\0\0\00\0w\0\0\0\0\0\0\0\0\0`u\0\0�\0\0p\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�R�\0\n\0\0\0�\0\0\0\n@\0��\0�\n\0\0P\0�\0\0\0\0\0�\0\0\0y�\0\0\0\0\0\0\0\0\0\0�\0��\0�\0\nB���+\'��A@!@�*|��\0\0\0@�\0|\n_����\0>a\0\0v!X�b1�/F����\0A���;��|�PE)\0�}\0��\n�\0\0��.�N�#(\0p\"(@\0@\0�\0\0\0p\0\0\0�\0\0\0|z\0\0\0\0d\0\0\0w\0�\0\0\0�\0\0\0\0\0:�\0\0\0\0h\0\Z@\0\0 \0\0\0\0�\0\0�\0\0\0\0\0 \0\0��\0\0@R@\0\0�\0;\0\0\0\0\0\0\0\0\0`\0\0\0@\0\0\0\0\0\0�\0\0\0�\0(�\0�@\n�\0?�EC��@�\0w!XB��v �\n\0�A�\0@a�a��|\0>�7�:|�\r�\0I��@@>(�@\nO!����\0:=�$��\0��/��^���PD\'�@\0\0w)\0��\0@\0\0������ n�\0\0|� �h\n�\0;�\0\"�P \0�]\0|�}7\0\0�;��\0\0\0w�@h\0\Z@\0\0\0\0\0@\0\0\0\0\0@\0\0\0\0\0\0\0\n\0\0\0P\0�\0\0!@\0\0\0\0\0\0\0\0|\0\0\0\0\0\0\0�\0\0\0��\0�\0\0\0\0\0\0\0�F\0��\n\0�܌\0/�@\0�+�\0��\n\0\0�G@�A����(|�Q�����\0�@�H\0�C�\0����\0���\0�\0\0�����\0�]\0\0T\0-�\0��P��\nA�\0��\0B���\"\0R�!@�R0�\0\0����P!@�_�H�\0�\0B��~ \n\0\0���!�`h\0\ZD(\0@\0\0�\0(\0�p�\0\0\0\0\0\0\0\0\0\0\0\0\0(\0\0�\0\0\0�\0(\0\0\0\0\0\0\0\0\0\0\0P\0�\0�\0\0\0\0\0\0\0\0�\r�(\0\0\0 \0\0`Q\0 �\0�\0�\0P�@���\0�\0PL\0\0\0A\n@\0@\0\0�\0��\03�\0\0;�\0.�\0/p\0���\0 \0\0��\0�\0�\0\0\r���\0�\0�\0�\0\0 \0\0\0@\00\0\0\0\0���',0),
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
