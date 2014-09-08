-- --------------------------------------------------------

--
-- Table structure for table 'user'
--

CREATE TABLE IF NOT EXISTS "user" (
  id INTEGER primary key autoincrement,
  nomor_sip varchar(50) NOT NULL,
  "password" varchar(60) NOT NULL,
  salt varchar(60) NOT NULL,
  nama varchar(50) NOT NULL,
  lokasi_penugasan varchar(50) NOT NULL,
  no_telp varchar NOT NULL,
  role char(1) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table 'penyakit'
--

CREATE TABLE IF NOT EXISTS penyakit (
  id INTEGER primary key autoincrement,
  nama varchar(50) NOT NULL,
  penyebab text NOT NULL,
  gejala text NOT NULL,
  diagnosis text NOT NULL,
  knowledge text
);

--
-- Dumping data for table 'penyakit'
--

INSERT INTO penyakit (id, nama, penyebab, gejala, diagnosis, knowledge) VALUES
(1, 'test', 'test', 'test', 'test', 'testy');


-- --------------------------------------------------------

--
-- Table structure for table 'gambar'
--

CREATE TABLE IF NOT EXISTS gambar (
  id INTEGER primary key autoincrement,
  "file" varchar(60) NOT NULL,
  deskripsi text,
  id_penyakit INTEGER NOT NULL,
  FOREIGN KEY (id_penyakit) REFERENCES penyakit(id)
);

-- --------------------------------------------------------

--
-- Table structure for table 'jejaring_sosial'
--

CREATE TABLE IF NOT EXISTS jejaring_sosial (
  id INTEGER primary key autoincrement,
  "status" text NOT NULL,
  stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  id_user INTEGER NOT NULL,
  FOREIGN KEY (id_user) REFERENCES "user"(id)
);

-- --------------------------------------------------------

--
-- Table structure for table 'langganan_jejaring_sosial'
--

CREATE TABLE IF NOT EXISTS langganan_jejaring_sosial (
  id_user_follower INTEGER NOT NULL,
  id_user_following INTEGER NOT NULL,
  FOREIGN KEY (id_user_follower) REFERENCES "user"(id),
  FOREIGN KEY (id_user_following) REFERENCES "user"(id)
);

-- --------------------------------------------------------

--
-- Table structure for table 'log_data'
--

CREATE TABLE IF NOT EXISTS log_data (
  id INTEGER primary key autoincrement,
  stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  log_act text NOT NULL,
  id_user INTEGER NOT NULL
);

--
-- Dumping data for table 'log_data'
--

INSERT INTO log_data (id, stamp, log_act, id_user) VALUES
(1, '2014-09-01 19:06:49', '{"operation":"insert","table_name":"obat","data":{"id":"1"}}', 1),
(2, '2014-09-01 19:30:38', '{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}', 1),
(3, '2014-09-01 19:30:42', '{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}', 1),
(4, '2014-09-01 19:30:43', '{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}', 1),
(5, '2014-09-01 19:49:55', '{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}', 1),
(6, '2014-09-01 19:49:57', '{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}', 1),
(7, '2014-09-01 19:50:36', '{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}', 1),
(8, '2014-09-01 19:51:52', '{"operation":"insert","table_name":"obat","data":{"id":"2"}}', 1),
(9, '2014-09-01 19:51:53', '{"operation":"insert","table_name":"obat","data":{"id":"3"}}', 1),
(10, '2014-09-01 19:52:26', '{"operation":"delete","table_name":"penyakit","data":{"knowledge":null}}', 1),
(11, '2014-09-01 19:52:30', '{"operation":"delete","table_name":"penyakit","data":{"knowledge":null}}', 1),
(12, '2014-09-01 19:52:47', '{"operation":"update","table_name":"penyakit","data":{"knowledge":null}}', 1),
(13, '2014-09-01 19:53:03', '{"operation":"delete","table_name":"obat","data":{"dosis":"Obat2"}}', 1),
(14, '2014-09-01 19:53:17', '{"operation":"insert","table_name":"obat","data":{"id":"4"}}', 1),
(15, '2014-09-01 19:53:18', '{"operation":"insert","table_name":"obat","data":{"id":"5"}}', 1),
(16, '2014-09-01 19:53:59', '{"operation":"delete","table_name":"obat","data":{"dosis":"Obat3"}}', 1),
(17, '2014-09-01 19:54:11', '{"operation":"insert","table_name":"obat","data":{"id":"6"}}', 1),
(18, '2014-09-01 19:54:13', '{"operation":"insert","table_name":"obat","data":{"id":"7"}}', 1),
(19, '2014-09-01 19:54:25', '{"operation":"delete","table_name":"obat","data":{"dosis":"Obat4"}}', 1),
(20, '2014-09-01 19:58:17', '{"operation":"insert","table_name":"obat","data":{"id":"8"}}', 1),
(21, '2014-09-01 19:58:43', '{"operation":"insert","table_name":"obat","data":{"id":"9"}}', 1),
(22, '2014-09-01 19:59:23', '{"operation":"update","table_name":"penyakit","data":{"knowledge":null}}', 1),
(23, '2014-09-01 20:13:03', '{"operation":"update","table_name":"penyakit","data":{"knowledge":"testy"}}', 1),
(24, '2014-09-01 20:17:40', '{"operation":"update","table_name":"penyakit","data":{"knowledge":"testy"}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table 'obat'
--

CREATE TABLE IF NOT EXISTS obat (
  id INTEGER primary key autoincrement,
  nama varchar(100) NOT NULL,
  keterangan text,
  dosis text NOT NULL
);

--
-- Dumping data for table 'obat'
--

INSERT INTO obat (id, nama, keterangan, dosis) VALUES
(1, 'Obat1', 'Test', 'Test'),
(2, 'Obat2', 'Obat2', 'Obat2'),
(4, 'Obat3', 'Obat3', 'Obat3'),
(6, 'Obat4', 'Obat4', 'Obat4'),
(8, 'Obat5', 'Obat5', 'Obat5'),
(9, 'Obat6', 'Obat6', 'Obat6');

-- --------------------------------------------------------

--
-- Table structure for table 'penyakit_has_obat'
--

CREATE TABLE IF NOT EXISTS penyakit_has_obat (
  id_penyakit INTEGER NOT NULL,
  id_obat INTEGER NOT NULL,
  FOREIGN KEY (id_penyakit) REFERENCES penyakit(id),
  FOREIGN KEY (id_obat) REFERENCES obat(id)
);

--
-- Dumping data for table 'penyakit_has_obat'
--

INSERT INTO penyakit_has_obat (id_penyakit, id_obat) VALUES
(6, 1),
(6, 2),
(6, 4),
(6, 6),
(6, 8),
(6, 9);