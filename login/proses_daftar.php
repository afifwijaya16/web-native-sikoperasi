<?php
session_start();

include "../config/koneksi.php";

// Dikirim dari form
$kode=$_GET['kode_anggota'];
$kode_anggota=$_POST['kode_anggota'];
$nama_anggota=$_POST['nama_anggota'];
$alamat_anggota=$_POST['alamat_anggota'];
$jenis_kelamin=$_POST['jenis_kelamin'];
$pekerjaan=$_POST['pekerjaan'];
$tgl_masuk=$_POST['tgl_masuk'];
$tgl_keluar=$_POST['tgl_keluar'];
$telp=$_POST['telp'];
$tempat_lahir=$_POST['tmp_lahir'];
$tgl_lahir=$_POST['tgl_lahir'];
$photo=$_POST['photo'];
$u_entry='daftar';
$tgl_entri=$_POST['tgl_entri'];
$username=$_POST['username'];
$password=$_POST['password'];

$q=mysql_fetch_array(mysql_query("SELECT besar_simpanan FROM t_jenis_simpan WHERE nama_simpanan='pokok'"));
$pokok	= $q['besar_simpanan'];
$qu=mysql_query("INSERT INTO t_tabungan VALUES('','$kode_anggota','$tgl_entri','$pokok')");
$f=mysql_query("INSERT INTO t_simpan values('','pokok','$pokok','$kode_anggota','$u_entry','$tgl_entri','$tgl_entri')");
$que=mysql_query("SELECT max(kode_tabungan) AS a FROM t_tabungan");
$dt = mysql_fetch_array($que);

mysql_query("INSERT INTO t_anggota values('$kode_anggota','$dt[a]','$nama_anggota','$alamat_anggota','$jenis_kelamin','$pekerjaan','$tgl_masuk','$telp','$tempat_lahir','$tgl_lahir','tidak aktif','$u_entry','$tgl_entri','$username','$password')");?>
<script>
    alert("Daftar sebagai anggota berhasil");
    window.location="login.php";
</script>



