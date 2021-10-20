<?php 
	include "config/koneksi.php";
	include "fungsi/fungsi.php";

	$aksi=$_GET['aksi'];
	$kategori = ($kategori=$_POST['kategori'])?$kategori : $_GET['kategori'];
	$cari = ($cari = $_POST['input_cari'])? $cari: $_GET['input_cari'];
?>

<head>
    <script src="jquery.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#cari").keyup(function () {
                $("#fbody").find("tr").hide();
                var data = this.value.split("");
                var jo = $("#fbody").find("tr");
                $.each(data, function (i, v) {
                    jo = jo.filter("*:contains('" + v + "')");
                });
                jo.fadeIn();

            })
        });
    </script>

</head>

<?php if(empty($aksi)){ ?>

<body>
    <div class="row">
        <div class="col-lg-12">
            <div class="form-panel">
                <h4 class="mb"><span class='glyphicon glyphicon-briefcase'></span> Data Anggota
                    <?php $am=mysql_query("SELECT *from t_anggota WHERE status = 'tidak aktif'");
                    $jum=mysql_num_rows($am);
                    echo'<kbd style="background-color:#d9534f;">'.$jum.'</kbd>';?>
                    <span style="float:right;">
                        <input type="text" id="cari" style="width:230px;height:30px;font-size:15px;"
                            placeholder=" cari disini...">
                    </span></h4>
                <form class="form-inline" role="form">
                    <table class="table table-bordered table-striped table-condensed">
                        <thead>
                            <tr class="info">
                                <th><a href="#">No</a></th>
                                <th><a href="#">Kode Anggota</a></th>
                                <th><a href="#">Nama Anggota</a></th>
                                <th><a href="#">TTL</a></th>
                                <th><a href="#">Pekerjaan</a></th>
                                <th><a href="#">Tanggal Masuk</a></th>
                                <th><a href="#">Status</a></th>
                                <th><a href="#">Aksi</a></th>
                            </tr>
                        </thead>
                        <tbody id="fbody">
                            <?php $query=mysql_query("SELECT *from t_anggota WHERE status = 'tidak aktif'");
                                    $no=1;
                                    while($data=mysql_fetch_array($query)){
					        ?>
                            <tr>
                                <td><?php echo $no;?></td>
                                <td><?php echo $data['kode_anggota'];?></td>
                                <td><?php echo $data['nama_anggota'];?></td>
                                <td><?php echo $data['tempat_lahir'];?>, <?php echo $data['tgl_lahir'];?></td>
                                <td><?php echo $data['pekerjaan'];?></td>
                                <td><?php echo $data['tgl_masuk'];?></td>
                                <td><?php echo $data['status'];?></td>
                                <td>
                                    <a class="btn btn-success btn-xs"
                                        href="anggota/proses_anggota.php?pros=validasi_terima&kode_anggota=<?php echo $data['kode_anggota'];?>"><i
                                            class="glyphicon glyphicon-check"></i></a>
                                    <a class="btn btn-danger btn-xs"
                                        href="anggota/proses_anggota.php?pros=validasi_tolak&kode_anggota=<?php echo $data['kode_anggota'];?>"><i
                                            class="glyphicon glyphicon-times"></i>X</a>
                                </td>
                            </tr>
                            <?php $no++;} ?>
                        </tbody>
                    </table>
            </div>
        </div><!-- /col-lg-12 -->
    </div>

<?php } ?>