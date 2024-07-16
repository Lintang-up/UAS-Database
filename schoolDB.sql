-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 06, 2023 at 04:28 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schoolDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `ekstrakulikuler`
--

CREATE TABLE `ekstrakulikuler` (
  `kode_ekskul` int(11) NOT NULL,
  `nama_ekskul` varchar(20) NOT NULL,
  `deskripsi` varchar(64) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `siswa_terdaftar` int(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ekstrakulikuler`
--

INSERT INTO `ekstrakulikuler` (`kode_ekskul`, `nama_ekskul`, `deskripsi`, `hari`, `siswa_terdaftar`) VALUES
(1, 'Basket', 'Latihan di lapangan Sritex', 'Senin', 24),
(2, 'Badminton', 'Latihan di lapangan Banaran', 'Senin', 16);

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `nip` varchar(18) NOT NULL,
  `namaGuru` varchar(30) NOT NULL,
  `tanggalLahir` date NOT NULL,
  `agama` enum('Islam','Kristen','Hindu','Buddha','Katolik') NOT NULL,
  `pendidikan` varchar(20) NOT NULL,
  `bidangStudy` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`nip`, `namaGuru`, `tanggalLahir`, `agama`, `pendidikan`, `bidangStudy`, `alamat`) VALUES
('1234567890', 'John Smith', '2022-12-01', 'Islam', 'Matematika', 'Matematika', 'Jl. Raya Kebon Jeruk No. 10, Jakarta Barat'),
('2345678901', 'Michael Jackson', '2022-12-01', 'Kristen', 'Bahasa', 'Bahasa Inggris', 'Jl. Permata Hijau No. 20, Jakarta Selatan');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `idJadwal` int(11) NOT NULL,
  `kodeMapel` varchar(32) NOT NULL,
  `waktu_mulai` datetime NOT NULL,
  `waktu_selesai` datetime NOT NULL,
  `nip` varchar(18) NOT NULL,
  `kodeKelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`idJadwal`, `kodeMapel`, `waktu_mulai`, `waktu_selesai`, `nip`, `kodeKelas`) VALUES
(1, 'IPA', '2023-01-06 04:20:37', '2023-01-06 14:20:38', '1234567890', 1),
(2, 'IPA', '2023-01-06 04:21:28', '2023-01-06 04:21:28', '2345678901', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `idKehadiran` int(11) NOT NULL,
  `idSiswa` varchar(10) NOT NULL,
  `kodeKelas` int(11) NOT NULL,
  `tglKehadiran` date NOT NULL,
  `statusKehadiran` enum('Alpa','Ijin','Sakit','Masuk') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`idKehadiran`, `idSiswa`, `kodeKelas`, `tglKehadiran`, `statusKehadiran`) VALUES
(1, '18007683', 1, '2023-01-06', 'Masuk'),
(2, '18007684', 1, '2023-01-06', 'Alpa');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kodeKelas` int(11) NOT NULL,
  `nama_kelas` varchar(24) NOT NULL,
  `tingkat` int(11) NOT NULL,
  `jumlahSiswa` int(11) NOT NULL,
  `nip` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kodeKelas`, `nama_kelas`, `tingkat`, `jumlahSiswa`, `nip`) VALUES
(1, 'A', 7, 24, '1234567890'),
(2, 'B', 7, 32, '2345678901');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `kodeMapel` varchar(32) NOT NULL,
  `namaMapel` varchar(64) NOT NULL,
  `deskripsi` varchar(64) NOT NULL,
  `lamaJam` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`kodeMapel`, `namaMapel`, `deskripsi`, `lamaJam`) VALUES
('IPA', 'Ilmu Pengetahuan Alam', 'tentang IPA', '2'),
('IPS', 'Ilmu Pengetahuan Sosial', 'tentang sosial kehidupan', '2');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `kodeNilai` int(11) NOT NULL,
  `idSiswa` varchar(10) NOT NULL,
  `kodeMapel` varchar(32) NOT NULL,
  `nilaiPengetahuan` int(3) NOT NULL,
  `nilaiKompetensi` int(3) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `tahunPelajaran` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`kodeNilai`, `idSiswa`, `kodeMapel`, `nilaiPengetahuan`, `nilaiKompetensi`, `semester`, `tahunPelajaran`) VALUES
(1, '18007683', 'IPA', 90, 90, '2', 2022),
(2, '18007683', 'IPS', 80, 90, '2', 2022);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `idSiswa` varchar(10) NOT NULL,
  `namaSiswa` varchar(128) NOT NULL,
  `tglLahirSiswa` date NOT NULL,
  `jkSiswa` enum('L','P') NOT NULL,
  `alamatSiswa` varchar(128) NOT NULL,
  `noTelpSiswa` varchar(16) NOT NULL,
  `emailSiswa` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`idSiswa`, `namaSiswa`, `tglLahirSiswa`, `jkSiswa`, `alamatSiswa`, `noTelpSiswa`, `emailSiswa`) VALUES
('18007683', 'Ilham Tristadika Saputra', '2022-12-28', 'L', 'Jl RM SAID 89 B', '0812345678', 'ilhhasap@gmail.com'),
('18007684', 'Muhammad Lintang', '2022-12-28', 'L', 'Jl Kenari 76', '08182938912', 'lintang@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ekstrakulikuler`
--
ALTER TABLE `ekstrakulikuler`
  ADD PRIMARY KEY (`kode_ekskul`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`idJadwal`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`idKehadiran`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kodeKelas`),
  ADD KEY `kelas` (`nama_kelas`),
  ADD KEY `nip` (`nip`),
  ADD KEY `idSiswa` (`jumlahSiswa`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`kodeMapel`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`kodeNilai`),
  ADD KEY `idSiswa` (`idSiswa`,`kodeMapel`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`idSiswa`),
  ADD UNIQUE KEY `emailSiswa` (`emailSiswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ekstrakulikuler`
--
ALTER TABLE `ekstrakulikuler`
  MODIFY `kode_ekskul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `idJadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `idKehadiran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `kodeKelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `kodeNilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
