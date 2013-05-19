CREATE DATABASE phpmyadmin;
GRANT ALL ON phpmyadmin.* TO phpmyadmin@localhost IDENTIFIED BY 'asd123';
CREATE DATABASE proftpd;
GRANT ALL ON proftpd.* TO proftpd@localhost IDENTIFIED BY 'asd123';

USE proftpd;

CREATE TABLE IF NOT EXISTS `ftpgroup` (
  `groupname` varchar(16) NOT NULL DEFAULT '',
  `gid` smallint(6) NOT NULL DEFAULT '2001',
  `members` varchar(16) NOT NULL DEFAULT '',
  KEY `groupname` (`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ProFTP group table';

CREATE TABLE IF NOT EXISTS `ftpuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(32) NOT NULL DEFAULT '',
  `passwd` varchar(255) NOT NULL DEFAULT '',
  `uid` smallint(6) NOT NULL DEFAULT '2001',
  `gid` smallint(6) NOT NULL DEFAULT '2001',
  `homedir` varchar(255) NOT NULL DEFAULT '',
  `shell` varchar(16) NOT NULL DEFAULT '/sbin/nologin',
  `count` int(11) NOT NULL DEFAULT '0',
  `accessed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='ProFTP user table' AUTO_INCREMENT=1;

INSERT INTO `ftpuser` (`id`, `userid`, `passwd`, `uid`, `gid`, `homedir`, `shell`, `count`, `accessed`, `modified`) VALUES
(1, 'vagrant', PASSWORD('asd123'), 33, 33, '/var/www', '/sbin/nologin', 0, NOW(), NOW());