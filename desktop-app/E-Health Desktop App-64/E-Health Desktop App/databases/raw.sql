BEGIN TRANSACTION;
CREATE TABLE "user" (
  id INTEGER primary key autoincrement,
  nomor_sip varchar(50) NOT NULL,
  "password" varchar(60) NOT NULL,
  salt varchar(60) NOT NULL,
  nama varchar(50) NOT NULL,
  lokasi_penugasan varchar(50) NOT NULL,
  no_telp varchar NOT NULL,
  role char(1) NOT NULL
);
CREATE TABLE penyakit_has_obat (
  id_penyakit INTEGER NOT NULL,
  id_obat INTEGER NOT NULL,
  FOREIGN KEY (id_penyakit) REFERENCES penyakit(id),
  FOREIGN KEY (id_obat) REFERENCES obat(id)
);
INSERT INTO `penyakit_has_obat` VALUES(6,1);
INSERT INTO `penyakit_has_obat` VALUES(6,2);
INSERT INTO `penyakit_has_obat` VALUES(6,4);
INSERT INTO `penyakit_has_obat` VALUES(6,6);
INSERT INTO `penyakit_has_obat` VALUES(6,8);
INSERT INTO `penyakit_has_obat` VALUES(6,9);
CREATE TABLE "penyakit" (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`nama`	varchar(50) NOT NULL,
	`penyebab`	text NOT NULL,
	`gejala`	text NOT NULL,
	`diagnosis`	text NOT NULL,
	`medikasi`	TEXT
);
INSERT INTO `penyakit` VALUES(1,'test','test','test','test','');
INSERT INTO `penyakit` VALUES(2,'Galau TA','Beban pikiran yang disebabkan oleh mata kuliah terakhir dalam rangkaian kuliah S1 Institut Teknologi Bandung','mual-mual saat mendengar kata "TA", keringat dingin saat berpapasan dengan dosen pembimbing,','ditemukannya kondisi psikis yang membuat perilaku penderita menjadi aneh ketika membahas segala sesuatu yang bertema skripsi','berikan segelas semangat, tiga kali sehari; berikan pil keberanian, 3 kali sehari setelah makan; berikan konsultasi setidaknya sekali seminggu');
INSERT INTO `penyakit` VALUES(3,'Bersin','Lada bubuk','Ingus keluar dengan kecepatan tinggi dari hidung','Iritasi saluran pernafasan di hidung','');
INSERT INTO `penyakit` VALUES(4,'Bersin','Lada bubuk','Ingus keluar dengan kecepatan tinggi dari hidung','Iritasi saluran pernafasan di hidung','ceburkan ke air');
INSERT INTO `penyakit` VALUES(5,'Batuk','Orang lain tidak mengerti yang mereka lakukan salah, dan kita ingin mengoreksi mereka secara diam-diam','Letupan udara dari dalam tenggorokan atau kerongkongan','Iritasi karena sikap orang lain yang tidak sesuai','');
INSERT INTO `penyakit` VALUES(6,'Batuk','Orang lain tidak mengerti yang mereka lakukan salah, dan kita ingin mengoreksi mereka secara diam-diam','Letupan udara dari dalam tenggorokan atau kerongkongan','Iritasi karena sikap orang lain yang tidak sesuai','');
INSERT INTO `penyakit` VALUES(7,'DM001','Infeksi Rongga Mulut, Sariawan','suhu badan naik, namun hanya berkisar 1-2 hari, ','ditemukannya jamur pada rongga mulut','');
INSERT INTO `penyakit` VALUES(8,'DM001','Infeksi Rongga Mulut, Sariawan','suhu badan naik, namun hanya berkisar 1-2 hari, ','ditemukannya jamur pada rongga mulut','');
CREATE TABLE obat (
  id INTEGER primary key autoincrement,
  nama varchar(100) NOT NULL,
  keterangan text,
  dosis text NOT NULL
);
INSERT INTO `obat` VALUES(1,'Obat1','Test','Test');
INSERT INTO `obat` VALUES(2,'Obat2','Obat2','Obat2');
INSERT INTO `obat` VALUES(4,'Obat3','Obat3','Obat3');
INSERT INTO `obat` VALUES(6,'Obat4','Obat4','Obat4');
INSERT INTO `obat` VALUES(8,'Obat5','Obat5','Obat5');
INSERT INTO `obat` VALUES(9,'Obat6','Obat6','Obat6');
CREATE TABLE log_data (
  id INTEGER primary key autoincrement,
  stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  log_act text NOT NULL,
  id_user INTEGER NOT NULL
);
INSERT INTO `log_data` VALUES(1,'2014-09-01 19:06:49','{"operation":"insert","table_name":"obat","data":{"id":"1"}}',1);
INSERT INTO `log_data` VALUES(2,'2014-09-01 19:30:38','{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}',1);
INSERT INTO `log_data` VALUES(3,'2014-09-01 19:30:42','{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}',1);
INSERT INTO `log_data` VALUES(4,'2014-09-01 19:30:43','{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}',1);
INSERT INTO `log_data` VALUES(5,'2014-09-01 19:49:55','{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}',1);
INSERT INTO `log_data` VALUES(6,'2014-09-01 19:49:57','{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}',1);
INSERT INTO `log_data` VALUES(7,'2014-09-01 19:50:36','{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}',1);
INSERT INTO `log_data` VALUES(8,'2014-09-01 19:51:52','{"operation":"insert","table_name":"obat","data":{"id":"2"}}',1);
INSERT INTO `log_data` VALUES(9,'2014-09-01 19:51:53','{"operation":"insert","table_name":"obat","data":{"id":"3"}}',1);
INSERT INTO `log_data` VALUES(10,'2014-09-01 19:52:26','{"operation":"delete","table_name":"penyakit","data":{"knowledge":null}}',1);
INSERT INTO `log_data` VALUES(11,'2014-09-01 19:52:30','{"operation":"delete","table_name":"penyakit","data":{"knowledge":null}}',1);
INSERT INTO `log_data` VALUES(12,'2014-09-01 19:52:47','{"operation":"update","table_name":"penyakit","data":{"knowledge":null}}',1);
INSERT INTO `log_data` VALUES(13,'2014-09-01 19:53:03','{"operation":"delete","table_name":"obat","data":{"dosis":"Obat2"}}',1);
INSERT INTO `log_data` VALUES(14,'2014-09-01 19:53:17','{"operation":"insert","table_name":"obat","data":{"id":"4"}}',1);
INSERT INTO `log_data` VALUES(15,'2014-09-01 19:53:18','{"operation":"insert","table_name":"obat","data":{"id":"5"}}',1);
INSERT INTO `log_data` VALUES(16,'2014-09-01 19:53:59','{"operation":"delete","table_name":"obat","data":{"dosis":"Obat3"}}',1);
INSERT INTO `log_data` VALUES(17,'2014-09-01 19:54:11','{"operation":"insert","table_name":"obat","data":{"id":"6"}}',1);
INSERT INTO `log_data` VALUES(18,'2014-09-01 19:54:13','{"operation":"insert","table_name":"obat","data":{"id":"7"}}',1);
INSERT INTO `log_data` VALUES(19,'2014-09-01 19:54:25','{"operation":"delete","table_name":"obat","data":{"dosis":"Obat4"}}',1);
INSERT INTO `log_data` VALUES(20,'2014-09-01 19:58:17','{"operation":"insert","table_name":"obat","data":{"id":"8"}}',1);
INSERT INTO `log_data` VALUES(21,'2014-09-01 19:58:43','{"operation":"insert","table_name":"obat","data":{"id":"9"}}',1);
INSERT INTO `log_data` VALUES(22,'2014-09-01 19:59:23','{"operation":"update","table_name":"penyakit","data":{"knowledge":null}}',1);
INSERT INTO `log_data` VALUES(23,'2014-09-01 20:13:03','{"operation":"update","table_name":"penyakit","data":{"knowledge":"testy"}}',1);
INSERT INTO `log_data` VALUES(24,'2014-09-01 20:17:40','{"operation":"update","table_name":"penyakit","data":{"knowledge":"testy"}}',1);
CREATE TABLE langganan_jejaring_sosial (
  id_user_follower INTEGER NOT NULL,
  id_user_following INTEGER NOT NULL,
  FOREIGN KEY (id_user_follower) REFERENCES "user"(id),
  FOREIGN KEY (id_user_following) REFERENCES "user"(id)
);
CREATE TABLE jejaring_sosial (
  id INTEGER primary key autoincrement,
  "status" text NOT NULL,
  stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  id_user INTEGER NOT NULL,
  FOREIGN KEY (id_user) REFERENCES "user"(id)
);
CREATE TABLE gambar (
  id INTEGER primary key autoincrement,
  "file" varchar(60) NOT NULL,
  deskripsi text,
  id_penyakit INTEGER NOT NULL,
  FOREIGN KEY (id_penyakit) REFERENCES penyakit(id)
);
COMMIT;
