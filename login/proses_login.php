<?php
session_start();

include "../config/koneksi.php";

// Dikirim dari form
$username=$_POST['username'];
$password=$_POST['password'];
$query=mysql_query("SELECT * FROM t_user WHERE username='$username' AND password='$password'");
$jumlah=mysql_num_rows($query);
$a=mysql_fetch_array($query);

$query_anggota=mysql_query("SELECT * FROM t_anggota WHERE username='$username' AND password='$password'");
$jumlah_anggota=mysql_num_rows($query_anggota);
$a_anggota=mysql_fetch_array($query_anggota);


if($jumlah > 0){
	if($a['level']=='admin')
	{
		$_SESSION['level']=$a['level'];
		$_SESSION['kopid']=$a['kode_user'];
		$_SESSION['kopname']=$a['nama'];
		header("location:../index.php?pilih=home");
	}
	else if($a['level']=='operator')
	{
		$_SESSION['level']=$a['level'];
		$_SESSION['kopid']=$a['kode_user'];
		$_SESSION['kopname']=$a['nama'];
		header("location:../index.php?pilih=home");
	}
	
} elseif($jumlah_anggota > 0) {
		$_SESSION['level']='user';
		$_SESSION['kopid']=$a_anggota['kode_anggota'];
		$_SESSION['kopname']=$a_anggota['nama_anggota'];
		$_SESSION['status']=$a_anggota['status'];
		header("location:../index.php?pilih=home");
} else{
?>
	<script>
		alert("Username Atau Password Salah");
		window.location="login.php";
	</script>
<?php
}
?>

