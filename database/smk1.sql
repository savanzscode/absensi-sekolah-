-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 03:50 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smk1`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(10) NOT NULL,
  `id_mapel` int(10) NOT NULL,
  `sesi` varchar(10) NOT NULL,
  `ruang` varchar(20) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `ikut` varchar(10) DEFAULT NULL,
  `susulan` varchar(10) DEFAULT NULL,
  `no_susulan` text DEFAULT NULL,
  `mulai` varchar(10) DEFAULT NULL,
  `selesai` varchar(10) DEFAULT NULL,
  `nama_proktor` varchar(50) DEFAULT NULL,
  `nip_proktor` varchar(50) DEFAULT NULL,
  `nama_pengawas` varchar(50) DEFAULT NULL,
  `nip_pengawas` varchar(50) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `tgl_ujian` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `file_pendukung`
--

CREATE TABLE `file_pendukung` (
  `id_file` int(11) NOT NULL,
  `id_mapel` int(11) DEFAULT 0,
  `nama_file` varchar(50) DEFAULT NULL,
  `status_file` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file_pendukung`
--

INSERT INTO `file_pendukung` (`id_file`, `id_mapel`, `nama_file`, `status_file`) VALUES
(1, 2, 'file1.jpg', NULL),
(2, 2, 'file2.jpg', NULL),
(3, 2, 'fileA.jpg', NULL),
(4, 2, 'fileB.jpg', NULL),
(5, 2, 'fileC.jpg', NULL),
(6, 2, 'fileD.jpg', NULL),
(7, 2, 'fileE.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jawaban`
--

CREATE TABLE `jawaban` (
  `id_jawaban` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `jawaban` char(1) DEFAULT NULL,
  `jawabx` char(1) DEFAULT NULL,
  `jenis` int(1) NOT NULL,
  `esai` text DEFAULT NULL,
  `nilai_esai` int(5) NOT NULL DEFAULT 0,
  `ragu` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_tugas`
--

CREATE TABLE `jawaban_tugas` (
  `id_jawaban` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_tugas` int(11) DEFAULT NULL,
  `jawaban` longtext DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_dikerjakan` datetime DEFAULT NULL,
  `tgl_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nilai` varchar(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama`, `status`) VALUES
('mtk01', 'matematika', 'aktif'),
('UJI-KOM', 'uji kompetensi keahlian bidang rpl', 'tidak'),
('UJI-TKJ', 'ujian tkj', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `jurusan_id` varchar(25) NOT NULL,
  `nama_jurusan_sp` varchar(100) DEFAULT NULL,
  `kurikulum` varchar(120) DEFAULT NULL,
  `jurusan_sp_id` varchar(50) DEFAULT NULL,
  `kurikulum_id` varchar(20) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` varchar(11) NOT NULL,
  `level` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `level`, `nama`, `rombongan_belajar_id`, `semester_id`) VALUES
('RPL01', 'rpl1', 'RUANG RPL 1', NULL, NULL),
('TKJ01', 'tjk1', 'ruang tkj 1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `kode_level` varchar(5) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`kode_level`, `keterangan`, `rombongan_belajar_id`) VALUES
('rpl1', 'XI', NULL),
('tjk1', 'xi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `text` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id_log`, `id_siswa`, `type`, `text`, `date`) VALUES
(1, 1, 'login', 'masuk', '2024-06-13 08:18:25'),
(2, 1, 'logout', 'keluar', '2024-06-13 08:18:38'),
(3, 1, 'login', 'masuk', '2024-06-13 08:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `kode` varchar(255) NOT NULL DEFAULT '0',
  `idpk` varchar(255) NOT NULL,
  `idguru` varchar(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jml_soal` int(5) NOT NULL,
  `jml_esai` int(5) NOT NULL DEFAULT 0,
  `tampil_pg` int(5) NOT NULL,
  `tampil_esai` int(5) NOT NULL DEFAULT 0,
  `bobot_pg` int(5) NOT NULL,
  `bobot_esai` int(5) NOT NULL DEFAULT 0,
  `level` varchar(5) NOT NULL,
  `opsi` int(1) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(2) NOT NULL,
  `kkm` int(3) DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `kode`, `idpk`, `idguru`, `nama`, `jml_soal`, `jml_esai`, `tampil_pg`, `tampil_esai`, `bobot_pg`, `bobot_esai`, `level`, `opsi`, `kelas`, `date`, `status`, `kkm`, `soal_agama`) VALUES
(1, '01', 'a:1:{i:0;s:3:\"rpl\";}', '5', 'pbtgdm', 10, 5, 3, 1, 5, 2, 'rpl1', 3, 'a:1:{i:0;s:5:\"RPL01\";}', '2024-06-13 01:23:42', '1', 75, ''),
(2, 'mtk01', 'a:1:{i:0;s:3:\"rpl\";}', '6', 'mtk1', 20, 5, 2, 3, 5, 3, 'semua', 3, 'a:1:{i:0;s:5:\"semua\";}', '2024-06-13 01:41:38', '1', 75, '');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `kode_mapel` varchar(20) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `mata_pelajaran_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`kode_mapel`, `nama_mapel`, `mata_pelajaran_id`) VALUES
('mtk1', 'matematika', NULL),
('pbtgdm', 'pak rudi', NULL),
('pw', 'pemrograman web', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id_materi` int(255) NOT NULL,
  `id_guru` int(255) NOT NULL DEFAULT 0,
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `materi` longtext DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kode_ujian` varchar(30) NOT NULL,
  `ujian_mulai` varchar(20) NOT NULL,
  `ujian_berlangsung` varchar(20) DEFAULT NULL,
  `ujian_selesai` varchar(20) DEFAULT NULL,
  `jml_benar` int(10) DEFAULT NULL,
  `jml_salah` int(10) DEFAULT NULL,
  `nilai_esai` varchar(10) DEFAULT NULL,
  `skor` varchar(10) DEFAULT NULL,
  `total` varchar(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `hasil` int(2) NOT NULL,
  `jawaban` text DEFAULT NULL,
  `jawaban_esai` longtext DEFAULT NULL,
  `nilai_esai2` text DEFAULT NULL,
  `online` int(1) NOT NULL DEFAULT 0,
  `id_soal` longtext DEFAULT NULL,
  `id_opsi` longtext DEFAULT NULL,
  `id_esai` text DEFAULT NULL,
  `blok` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengawas`
--

CREATE TABLE `pengawas` (
  `id_pengawas` int(11) NOT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `no_ktp` varchar(16) DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat_jalan` varchar(255) DEFAULT NULL,
  `rt_rw` varchar(8) DEFAULT NULL,
  `dusun` varchar(50) DEFAULT NULL,
  `kelurahan` varchar(50) DEFAULT NULL,
  `kecamatan` varchar(30) DEFAULT NULL,
  `kode_pos` int(6) DEFAULT NULL,
  `nuptk` varchar(20) DEFAULT NULL,
  `bidang_studi` varchar(50) DEFAULT NULL,
  `jenis_ptk` varchar(50) DEFAULT NULL,
  `tgs_tambahan` varchar(50) DEFAULT NULL,
  `status_pegawai` varchar(50) DEFAULT NULL,
  `status_aktif` varchar(20) DEFAULT NULL,
  `status_nikah` varchar(20) DEFAULT NULL,
  `sumber_gaji` varchar(30) DEFAULT NULL,
  `ahli_lab` varchar(10) DEFAULT NULL,
  `nama_ibu` varchar(40) DEFAULT NULL,
  `nama_suami` varchar(50) DEFAULT NULL,
  `nik_suami` varchar(20) DEFAULT NULL,
  `pekerjaan` varchar(20) DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `keahlian_isyarat` varchar(10) DEFAULT NULL,
  `kewarganegaraan` varchar(10) DEFAULT NULL,
  `npwp` varchar(16) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `ptk_id` varchar(50) DEFAULT NULL,
  `password2` text DEFAULT NULL,
  `ruang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pengawas`
--

INSERT INTO `pengawas` (`id_pengawas`, `nip`, `nama`, `jabatan`, `username`, `password`, `level`, `no_ktp`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `no_hp`, `email`, `alamat_jalan`, `rt_rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `nuptk`, `bidang_studi`, `jenis_ptk`, `tgs_tambahan`, `status_pegawai`, `status_aktif`, `status_nikah`, `sumber_gaji`, `ahli_lab`, `nama_ibu`, `nama_suami`, `nik_suami`, `pekerjaan`, `tmt`, `keahlian_isyarat`, `kewarganegaraan`, `npwp`, `foto`, `ptk_id`, `password2`, `ruang`) VALUES
(2, '-', 'maikel', NULL, 'maikel', '$2y$10$hBaQR3ZPrGY/RdcufJ2fDeaQkitRaKknxZijgeNQUCedF35L9csxC', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '111222', 'hesbi', 'RPL01', 'hesbi', '$2y$10$9Jf.yfQw654XxPneS/EnWur8s0y9nXOZMnK4aVD5cKoChQokxPeSa', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '1122444', 'deta', NULL, 'deta', '$2y$10$szuXPAV9Z7C7eE3RTax8wu61gGLp7VtIIvleCc4dw/x3j7yS1G.6O', 'pengawas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RPL01'),
(5, '55555', 'maubi', '', 'maubi', '$2y$10$S6ZTd6dxlj8oKl7OH3pc1eyOz4NkFQpsFBtZhD0wjpSl2qnm32I3G', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '8888', 'detol', 'RPL01', 'detol', '$2y$10$Mz6sJfXFbuC2TuTbNJbfuOk3tu1qMxpP1wiQty2OPkdo/lVLOOSbu', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id_pengumuman` int(5) NOT NULL,
  `type` varchar(30) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `user` int(3) NOT NULL,
  `text` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pk`
--

CREATE TABLE `pk` (
  `id_pk` varchar(10) NOT NULL,
  `program_keahlian` varchar(50) NOT NULL,
  `jurusan_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pk`
--

INSERT INTO `pk` (`id_pk`, `program_keahlian`, `jurusan_id`) VALUES
('rpl', 'rekayasa perangkat lunak', NULL),
('tjk', 'teknik komputer dan jaringan', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `referensi_jurusan`
--

CREATE TABLE `referensi_jurusan` (
  `jurusan_id` varchar(10) NOT NULL,
  `nama_jurusan` varchar(100) DEFAULT NULL,
  `untuk_sma` int(1) NOT NULL,
  `untuk_smk` int(1) NOT NULL,
  `jenjang_pendidikan_id` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `kode_ruang` varchar(10) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`kode_ruang`, `keterangan`) VALUES
('RPL01', 'Rekayasa perangkat lunak 01'),
('TKJ01', 'TEKNIK KOMPUTER DAN JARINGAN');

-- --------------------------------------------------------

--
-- Table structure for table `savsoft_options`
--

CREATE TABLE `savsoft_options` (
  `oid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `q_option` text NOT NULL,
  `q_option_match` varchar(1000) DEFAULT NULL,
  `score` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `savsoft_qbank`
--

CREATE TABLE `savsoft_qbank` (
  `qid` int(11) NOT NULL,
  `question_type` varchar(100) NOT NULL DEFAULT 'Multiple Choice Single Answer',
  `question` text NOT NULL,
  `description` text NOT NULL,
  `cid` int(11) NOT NULL,
  `lid` int(11) NOT NULL,
  `no_time_served` int(11) NOT NULL DEFAULT 0,
  `no_time_corrected` int(11) NOT NULL DEFAULT 0,
  `no_time_incorrected` int(11) NOT NULL DEFAULT 0,
  `no_time_unattempted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `semester_id` varchar(5) NOT NULL,
  `tahun_ajaran_id` varchar(4) NOT NULL,
  `nama_semester` varchar(50) NOT NULL,
  `semester` int(1) NOT NULL,
  `periode_aktif` enum('1','0') NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `kode_server` varchar(20) NOT NULL,
  `nama_server` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`kode_server`, `nama_server`, `status`) VALUES
('UJI-RPL', 'RPL01', 'aktif'),
('UJI-TKJ', 'UJIAN TKJ', 'aktif'),
('mtk01', 'matematika01', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `sesi`
--

CREATE TABLE `sesi` (
  `kode_sesi` varchar(10) NOT NULL,
  `nama_sesi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sesi`
--

INSERT INTO `sesi` (`kode_sesi`, `nama_sesi`) VALUES
('MTK-1', 'Matematika'),
('UJI-1', 'ujikom sesi 1'),
('UJI-2', 'SESI1');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `session_time` varchar(10) NOT NULL,
  `session_hash` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(11) NOT NULL,
  `aplikasi` varchar(100) DEFAULT NULL,
  `kode_sekolah` varchar(10) DEFAULT NULL,
  `sekolah` varchar(50) DEFAULT NULL,
  `jenjang` varchar(5) DEFAULT NULL,
  `kepsek` varchar(50) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kecamatan` varchar(50) DEFAULT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `header` text DEFAULT NULL,
  `header_kartu` text DEFAULT NULL,
  `nama_ujian` text DEFAULT NULL,
  `versi` varchar(10) DEFAULT NULL,
  `ip_server` varchar(100) DEFAULT NULL,
  `waktu` varchar(50) DEFAULT NULL,
  `server` varchar(50) DEFAULT NULL,
  `id_server` varchar(50) DEFAULT NULL,
  `url_host` varchar(50) DEFAULT NULL,
  `token_api` varchar(50) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL,
  `npsn` varchar(10) DEFAULT NULL,
  `db_versi` varchar(10) DEFAULT NULL,
  `bc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id_setting`, `aplikasi`, `kode_sekolah`, `sekolah`, `jenjang`, `kepsek`, `nip`, `alamat`, `kecamatan`, `kota`, `telp`, `fax`, `web`, `email`, `logo`, `header`, `header_kartu`, `nama_ujian`, `versi`, `ip_server`, `waktu`, `server`, `id_server`, `url_host`, `token_api`, `sekolah_id`, `npsn`, `db_versi`, `bc`) VALUES
(1, 'UJIAN SEKOLAH', 'K0248', 'SMKN 1 PND', 'SMK', 'rusdi harto', '-', 'jalan merdeka<br />\r\n', 'pangandaran                                       ', 'pangandaran', '021 123 123 123', '021 95878050', 'smk1pangandaran.sch.id', 'smkn1pangandaran123@gmail.com', 'dist/img/logo6.png', '', 'KARTU PESERTA CBT\naaaaaa', 'matematika', '2.9', 'http://192.168.0.200/maikellks', 'Asia/Jakarta', 'pusat', 'SR01', 'http://pts.smkhsagung.sch.id/', 'uGc4j5WKFrwFV4', '8cce47df-aae7-4274-83cb-5af3093eab56', '69787351', '2.9.2', 'dist/img/bc.png');

-- --------------------------------------------------------

--
-- Table structure for table `sinkron`
--

CREATE TABLE `sinkron` (
  `nama_data` varchar(50) NOT NULL,
  `data` varchar(50) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  `tanggal` varchar(50) DEFAULT NULL,
  `status_sinkron` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sinkron`
--

INSERT INTO `sinkron` (`nama_data`, `data`, `jumlah`, `tanggal`, `status_sinkron`) VALUES
('DATA1', 'siswa', '75619', '2020-09-13 21:23:08', 1),
('DATA2', 'bank soal', '268', '2020-09-13 21:23:08', 1),
('DATA3', 'soal', '756300', '2020-09-13 21:23:08', 1),
('DATA4', 'jadwal', '432', '2020-09-13 21:23:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `id_kelas` varchar(11) DEFAULT NULL,
  `idpk` varchar(10) DEFAULT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `no_peserta` varchar(30) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `level` varchar(5) DEFAULT NULL,
  `ruang` varchar(10) DEFAULT NULL,
  `sesi` int(2) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(30) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `kebutuhan_khusus` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `dusun` varchar(100) DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kode_pos` int(10) DEFAULT NULL,
  `jenis_tinggal` varchar(100) DEFAULT NULL,
  `alat_transportasi` varchar(100) DEFAULT NULL,
  `hp` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `skhun` int(11) DEFAULT NULL,
  `no_kps` varchar(50) DEFAULT NULL,
  `nama_ayah` varchar(150) DEFAULT NULL,
  `tahun_lahir_ayah` int(4) DEFAULT NULL,
  `pendidikan_ayah` varchar(50) DEFAULT NULL,
  `pekerjaan_ayah` varchar(100) DEFAULT NULL,
  `penghasilan_ayah` varchar(100) DEFAULT NULL,
  `nohp_ayah` varchar(15) DEFAULT NULL,
  `nama_ibu` varchar(150) DEFAULT NULL,
  `tahun_lahir_ibu` int(4) DEFAULT NULL,
  `pendidikan_ibu` varchar(50) DEFAULT NULL,
  `pekerjaan_ibu` varchar(100) DEFAULT NULL,
  `penghasilan_ibu` varchar(100) DEFAULT NULL,
  `nohp_ibu` int(15) DEFAULT NULL,
  `nama_wali` varchar(150) DEFAULT NULL,
  `tahun_lahir_wali` int(4) DEFAULT NULL,
  `pendidikan_wali` varchar(50) DEFAULT NULL,
  `pekerjaan_wali` varchar(100) DEFAULT NULL,
  `penghasilan_wali` varchar(50) DEFAULT NULL,
  `angkatan` int(5) DEFAULT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `peserta_didik_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'aktif',
  `online` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `id_kelas`, `idpk`, `nis`, `no_peserta`, `nama`, `level`, `ruang`, `sesi`, `username`, `password`, `foto`, `server`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `hp`, `email`, `skhun`, `no_kps`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nohp_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `nohp_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `nisn`, `peserta_didik_id`, `semester_id`, `rombongan_belajar_id`, `status`, `online`) VALUES
(1, 'RPL01', 'rpl', '123456', '012', 'ahmad slebew ', 'rpl1', 'RPL01', 0, 'ahmad', 'ahmad123', NULL, 'UJI-RPL', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '081234567898', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0),
(2, 'TKJ01', 'tjk', '223334', '02', 'agnia', 'tjk1', 'TKJ01', 0, 'agnia', 'smk123', NULL, 'UJI-TKJ', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '085172442919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aktif', 0);

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `nomor` int(5) DEFAULT NULL,
  `soal` longtext DEFAULT NULL,
  `jenis` int(1) DEFAULT NULL,
  `pilA` longtext DEFAULT NULL,
  `pilB` longtext DEFAULT NULL,
  `pilC` longtext DEFAULT NULL,
  `pilD` longtext DEFAULT NULL,
  `pilE` longtext DEFAULT NULL,
  `jawaban` varchar(1) DEFAULT NULL,
  `file` mediumtext DEFAULT NULL,
  `file1` mediumtext DEFAULT NULL,
  `fileA` mediumtext DEFAULT NULL,
  `fileB` mediumtext DEFAULT NULL,
  `fileC` mediumtext DEFAULT NULL,
  `fileD` mediumtext DEFAULT NULL,
  `fileE` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `id_mapel`, `nomor`, `soal`, `jenis`, `pilA`, `pilB`, `pilC`, `pilD`, `pilE`, `jawaban`, `file`, `file1`, `fileA`, `fileB`, `fileC`, `fileD`, `fileE`) VALUES
(1, 1, 1, '<p>saya sedang melakukan coding</p>', 2, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, 'Cont\'oh Soal Pg 1 ...', 1, 'jawaban A', 'jawaban B', 'jawaban C', 'jawaban D', 'jawaban E', 'A', 'file1.jpg', 'file2.jpg', 'fileA.jpg', 'fileB.jpg', 'fileC.jpg', 'fileD.jpg', 'fileE.jpg'),
(3, 2, 2, 'Contoh Soal Pg 2 ...', 1, 'jawaban A', 'jawaban B', 'jawaban C', 'jawaban D', 'jawaban E', 'A', '', '', '', '', '', '', ''),
(4, 2, 1, 'ini contoh soal essai 1 ...', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, 2, 2, 'ini contoh soal essai 2 ...', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(6, 2, 3, 'ini contoh soal essai 3 ...', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(7, 2, 4, 'ini contoh soal essai 4 ...', 2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(8, 2, 5, 'ini contoh soal essai 5 ...', 2, '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id_token` int(11) NOT NULL,
  `token` varchar(6) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `masa_berlaku` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id_token`, `token`, `time`, `masa_berlaku`) VALUES
(1, 'LKYFRP', '2024-06-13 01:19:39', '00:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` int(255) NOT NULL,
  `id_guru` int(255) NOT NULL DEFAULT 0,
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tugas` longtext NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`id_tugas`, `id_guru`, `kelas`, `mapel`, `judul`, `tugas`, `file`, `tgl_mulai`, `tgl_selesai`, `tgl`, `status`) VALUES
(1, 2, 'a:1:{i:0;s:5:\"RPL01\";}', 'matematika', 'perkalian1', '<p>hari ini matematika 5x56</p>', NULL, '2024-06-10 14:00:00', '2024-06-10 16:00:00', '2024-06-10 06:45:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(5) NOT NULL,
  `kode_nama` varchar(255) DEFAULT '0',
  `id_pk` varchar(255) NOT NULL,
  `id_guru` int(5) NOT NULL,
  `id_mapel` int(5) NOT NULL,
  `kode_ujian` varchar(30) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jml_soal` int(5) NOT NULL,
  `jml_esai` int(5) NOT NULL,
  `bobot_pg` int(5) NOT NULL,
  `opsi` int(1) NOT NULL,
  `bobot_esai` int(5) NOT NULL,
  `tampil_pg` int(5) NOT NULL,
  `tampil_esai` int(5) NOT NULL,
  `lama_ujian` int(5) NOT NULL,
  `tgl_ujian` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `waktu_ujian` time DEFAULT NULL,
  `selesai_ujian` time DEFAULT NULL,
  `level` varchar(5) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `sesi` varchar(1) DEFAULT NULL,
  `acak` int(1) NOT NULL,
  `token` int(1) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `hasil` int(1) DEFAULT NULL,
  `kkm` varchar(128) DEFAULT NULL,
  `ulang` int(2) DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL,
  `reset` int(1) DEFAULT NULL,
  `ulang_kkm` int(1) NOT NULL,
  `btn_selesai` int(11) NOT NULL,
  `pelanggaran` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `kode_nama`, `id_pk`, `id_guru`, `id_mapel`, `kode_ujian`, `nama`, `jml_soal`, `jml_esai`, `bobot_pg`, `opsi`, `bobot_esai`, `tampil_pg`, `tampil_esai`, `lama_ujian`, `tgl_ujian`, `tgl_selesai`, `waktu_ujian`, `selesai_ujian`, `level`, `kelas`, `sesi`, `acak`, `token`, `status`, `hasil`, `kkm`, `ulang`, `soal_agama`, `reset`, `ulang_kkm`, `btn_selesai`, `pelanggaran`) VALUES
(1, '01', 'a:1:{i:0;s:3:\"rpl\";}', 5, 1, 'UJI-KOM', '01', 10, 5, 5, 3, 2, 3, 1, 60, '2024-06-13 03:00:00', '2024-06-20 12:00:00', '03:00:00', NULL, 'rpl1', 'a:1:{i:0;s:5:\"RPL01\";}', 'U', 1, 1, 1, 0, '75', 0, '', 0, 0, 60, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `file_pendukung`
--
ALTER TABLE `file_pendukung`
  ADD PRIMARY KEY (`id_file`);

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id_jawaban`);

--
-- Indexes for table `jawaban_tugas`
--
ALTER TABLE `jawaban_tugas`
  ADD PRIMARY KEY (`id_jawaban`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`jurusan_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`kode_level`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`kode_mapel`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `pengawas`
--
ALTER TABLE `pengawas`
  ADD PRIMARY KEY (`id_pengawas`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id_pengumuman`);

--
-- Indexes for table `pk`
--
ALTER TABLE `pk`
  ADD PRIMARY KEY (`id_pk`);

--
-- Indexes for table `referensi_jurusan`
--
ALTER TABLE `referensi_jurusan`
  ADD PRIMARY KEY (`jurusan_id`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kode_ruang`);

--
-- Indexes for table `savsoft_options`
--
ALTER TABLE `savsoft_options`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `savsoft_qbank`
--
ALTER TABLE `savsoft_qbank`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `sesi`
--
ALTER TABLE `sesi`
  ADD PRIMARY KEY (`kode_sesi`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `sinkron`
--
ALTER TABLE `sinkron`
  ADD PRIMARY KEY (`nama_data`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id_token`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_pendukung`
--
ALTER TABLE `file_pendukung`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jawaban_tugas`
--
ALTER TABLE `jawaban_tugas`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id_materi` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengawas`
--
ALTER TABLE `pengawas`
  MODIFY `id_pengawas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id_pengumuman` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `savsoft_options`
--
ALTER TABLE `savsoft_options`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `savsoft_qbank`
--
ALTER TABLE `savsoft_qbank`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_tugas` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
