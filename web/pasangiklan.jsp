<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<!DOCTYPE html>

<jsp:include page="header.jsp"></jsp:include>
<% // if(request.getMethod().equalsIgnoreCase("Post"))
    {
%>
<%--
<jsp:useBean id="newIklan" class="Konten.IklanBean"></jsp:useBean>
<jsp:useBean id="databaseInfo" class="Controller.DatabaseInfo"></jsp:useBean>
<jsp:setProperty name="newIklan" property="nama" param="judul"></jsp:setProperty>
<jsp:setProperty name="newIklan" property="harga" param="harga"></jsp:setProperty>
<jsp:setProperty name="newIklan" property="baru" param="baru"></jsp:setProperty>
<jsp:setProperty name="newIklan" property="kategori" param="kategori"></jsp:setProperty>
<jsp:setProperty name="newIklan" property="jenisIklan" param="jenisIklan"></jsp:setProperty>
<jsp:setProperty name="newIklan" property="deskripsi" param="deskripsi"></jsp:setProperty>  --%>
<%
//            String username = "anjar_ibnu";
//            out.println(""+newIklan.getNama()+"','"+ username +"','"+ newIklan.getKategori()+"','"+newIklan.isBaru()+"','"+
//                newIklan.getJumlahView()+"','"+newIklan.getGambar()+"','"+newIklan.getHarga()+"','"+newIklan.getJenisIklan()+"'");
//            databaseInfo.saveIklan(newIklan, username);
    }
%>
<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a href="#linkJualBeli" class="navbar-brand">Jual Beli ala UI</a>
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
            <ul class="nav navbar-nav">
                <li>
                    <a href="home.jsp">Home</a>
                </li>
                <li  class="active">
                    <a href="pasangiklan.jsp">Pasang Iklan</a>
                </li>


                <%
                    String username = "";
                    HttpSession sesi = request.getSession();
                    if (sesi == null || sesi.getAttribute("username") == null) {
                %>
                <li>
                    <a href="register.jsp">Daftar</a>
                </li>
            </ul>

            <form action="/Jual_Beli_UI/Autentikasi" method="POST" class="navbar-form navbar-right">
                <input type="text" name="username" class="form-control" placeholder="Masukkan username">   
                <input type="password" name="password" class="form-control" placeholder="Masukkan password"> 
                <button type="submit" class="btn btn-primary">Masuk</button>
            </form>

            <%
            } else {
                username = sesi.getAttribute("username").toString();
            %>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="profile.html/#" id="profile"><%= username%><span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="themes">
                        <li><a href="detailProfil.jsp">Lihat Profil</a></li>
                        <li><a href="#">Edit Profil</a></li>
                        <li><a href="wishlist.jsp">Lihat Wishlist</a></li>
                        <li class="divider"></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
                
            %>
        </div>
    </div>
</div>

<br>
<br>
<br>

<div class="container">
    <div class="page-header" id="banner">
        <div class="row">
            <div class="col-lg-6">
                <h1>Pasang Iklan</h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8">
            <div class="well bs-component">
                <form class="form-horizontal" action="prosesIklan.jsp" method="POST" enctype="multipart/form-data">
                    <fieldset>
                        <div class="bs-component">
                            <div class="form-group">
                                <label for="inputName" class="col-lg-2 control-label">Nama</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" name="namaIklan" id="inputName" placeholder="Masukkan nama">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="select" class="col-lg-2 control-label">Kategori</label>
                                <div class="col-lg-10">
                                    <select name="kategori" class="form-control" id="select">
                                        <option value="Buku Kuliah">Buku Kuliah</option>
                                        <option value="Alat Tulis">Alat Tulis</option>
                                        <option value="Elektronik">Elektronik</option>
                                        <option value="Fashion">Fashion</option>
                                        <option value="Jasa">Jasa</option>
                                        <option value="Lainnya">Lainnya</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputHarga" class="col-lg-2 control-label">Harga</label>
                                <div class="col-lg-10">
                                    <input type="text" name="harga" class="form-control" id="inputName" placeholder="Masukkan harga">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Jenis Iklan</label>
                                <div class="col-lg-10">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="jenis" id="optionsRadios1" value="Dijual" checked="">
                                            Dijual
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="jenis" id="optionsRadios2" value="Dicari">
                                            Dicari
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Status</label>
                                <div class="col-lg-10">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="status" id="optionsRadios1" value="Baru" checked="">
                                            Baru 
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="status" id="optionsRadios2" value="Bekas">
                                            Bekas
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="textArea" class="col-lg-2 control-label">Deskripsi</label>
                                <div class="col-lg-10">
                                    <textarea class="form-control" name="deskripsi" rows="5" id="textArea" placeholder="Masukkan deskripsi iklan<"></textarea>
                                </div>

                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <label for="textArea" class="col-lg-2 control-label">Unggah Foto</label>
                                    <div class="col-md-3">
                                        
                                        <input type="file" name="foto1" size="50" />
                                        <br />
                                        
                                    </div>
                                </div>


                            </div>

                            <br>

                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-2">

                                    <button class="btn btn-default">Batal</button>
                                    <button type="submit" class="btn btn-primary">Simpan</button>

                                </div>
                            </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /.container -->

<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript">
    $(function() {
        $("#dropbox, #multiple").html5Uploader({
            name: "foo",
            postUrl: "bar.aspx"
        });
    });
</script>

</body>
</html>
