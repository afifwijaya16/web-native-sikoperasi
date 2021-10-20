<?php 
	include "../config/koneksi.php";
	include "../fungsi/fungsi.php";
?>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <link rel="shortcut icon" href="../logo_kop.gif">
    <title>Daftar Koperasi Simpan Pinjam</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">
    <link href="css/animate-custom.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="js/custom.modernizr.html" type="text/javascript"></script>
</head>

<body>
    <script type="text/javascript" src="/md5.js"></script>
    <div class="container" id="login-block">
        <div class="row">
            <div class="col-sm-12">
                <div class="login-daftar clearfix animated flipInY">
                    <div class="login-logo">
                        <a href="#"><img class="img-responsive" src="../logo_kop.gif" width="50" height="50"
                                alt="Company Logo" /></a>
                                <h5 class="title">Daftar Sebagai Anggota</h5>
                    </div>
                    <div class="login-daftar clearfix animated flipInY">
                        <div class="login-form" style="
                            background-color:white;border-radius:8px;
                            padding: 20px 0;
                            -webkit-box-shadow: 2px 2px 5px #333;
                            -moz-box-shadow: 2px 2px 5px #333;
                            box-shadow: 2px 2px 5px #333;
                            ">
                           
                            <hr>

                            <form id="form_id" name="login" action="proses_daftar.php" method="post">
                                 
                                <div class="row">
                                    <div class="col-sm-6">
                                        <input type="text" name="kode_anggota" class="input-field"
                                            value="<?php echo nomer("A","kode_anggota","t_anggota	");?>" readonly
                                            title="Kode harus diisi" />
                                        <input type="text" name="tgl_masuk" class="input-field" value="<?php echo date("Y-m-d");?>" />
                                        <!-- <input  type="text"name="simpanan_pokok" class="input-field" value="0" />
                                        <input type="text"name="u_entry" class="input-field" value="daftar" /> -->
                                        <input type="text"name="username" class="input-field" placeholder="Username"/>
                                        <input type="text"name="password" class="input-field" placeholder="Password" />
                                        
                                            
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" name="nama_anggota" class="input-field" placeholder="Nama Anggota" required />
                                        <select name="jenis_kelamin">
                                            <option>Pilih Jenis Kelamin</option>
                                            <option value="Laki-laki">Laki-laki</option>
                                            <option value="Perempuan">Perempuan</option>
                                        </select>
                                        <input type="text" name="tmp_lahir" class="input-field" placeholder="Tempat Lahir" required />
                                        <input type="date" name="tgl_lahir" class="input-field" placeholder="Tanggal Lahir" required />
                                        <input type="text" name="telp" class="input-field" placeholder="No Telepon" required />
                                        <input type="text" name="pekerjaan" class="input-field" placeholder="Pekerjaan" required />
                                    </div>
                                </div>
                                <input id="form_submit" type="submit" class="btn btn-login" value="Daftar" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="container">
        <p id="footer-text">Copyright &copy; UKK 2021 Koperasi Simpan Pinjam </p>
    </footer>
    <script>
        window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')
    </script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/placeholder-shim.min.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>