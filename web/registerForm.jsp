<%-- 
    Document   : registerForm
    Created on : May 23, 2014, 2:28:28 AM
    Author     : RiskaFadilla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
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
        </div>
    </div>

    <!-- 
    Nama
    Username
    Email
    Jenis Kelamin
    Jurusan
    Domisili
    Bio
    Foto profil
    Password-->
    <br>
    <br>
    <br>

    <div class="container">
        <div class="page-header" id="banner">
            <div class="row">
                <div class="col-lg-6">
                    <h1>Update Data Profil</h1>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8">
                <div class="well bs-component">
                    <form name="myform" class="form-horizontal" action="home.jsp" method="POST">
                        <fieldset>
                            <div class="bs-component">
                                <div class="form-group">
                                    <label for="inputName" class="col-lg-2 control-label">Nama</label>
                                    <div class="col-lg-10">
                                        <input type="text" class="form-control" id="inputName" placeholder="Masukkan nama">
                                    </div>
                     
                                </div>

                                <div class="form-group">
                                    <label for="inputUserName" class="col-lg-2 control-label">Username</label>
                                    <div class="col-lg-10">
                                        <input type="text" class="form-control" id="inputUserName" placeholder="Masukkan username sebagai nama yang akan dikenali user lain">
                                    </div>
                                  
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-2 control-label">Jenis Kelamin</label>
                                    <div class="col-lg-10">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                                                Laki-laki
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                                Perempuan
                                            </label>
                                        </div>
                                    </div>
                              
                                </div>

                                <div class="form-group">
                                    <label for="inputEmail" class="col-lg-2 control-label">Email</label>
                                    <div class="col-lg-10">
                                        <input type="text" class="form-control" id="inputEmail" placeholder="Email">
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                                    <div class="col-lg-10">
                                        <input type="password" class="form-control" id="inputPassword" placeholder="Password">
                                    </div>
                                    
                                </div>

                                <div class="form-group">
                                    <label for="select" class="col-lg-2 control-label">Jurusan</label>
                                    <div class="col-lg-10">
                                        <select name="optone" size="1" 
                                                onchange="setOptions(document.myform.optone.options[document.myform.optone.selectedIndex].value);" class="form-control" id="select">
                                            <option value="" selected="selected"></option>
                                            <option value="1">KEDOKTERAN</option>
                                            <option value="2">KEDOKTERAN GIGI</option>
                                            <option value="3">MATEMATIKA & ILMU PENGETAHUAN ALAM</option>
                                            <option value="4">FARMASI</option>
                                            <option value="5">TEKNIK</option>
                                            <option value="6">HUKUM</option>
                                            <option value="7">EKONOMI</option>
                                            <option value="8">ILMU PENGETAHUAN BUDAYA</option>
                                            <option value="9">PSIKOLOGI</option>
                                            <option value="10">KESEHATAN MASYARAKAT</option>
                                            <option value="11">ILMU KOMPUTER</option>
                                            <option value="12">ILMU KEPERAWATAN</option>
                                        </select>
                                        <select name="opttwo" size="1" class="form-control" id="select">
                                            <option value="" selected="selected">Silakan pilih fakultas terlebih dahulu.</option>
                                        </select>
                                    </div>
                                
                                </div>

                                <div class="form-group">
                                    <label for="inputDomisili" class="col-lg-2 control-label">Domisili</label>
                                    <div class="col-lg-10">
                                        <input type="text" class="form-control" id="inputDomisili" placeholder="Masukkan domisili">
                                    </div>
                                  
                                </div>

                                <div class="form-group">
                                    <label for="textArea" class="col-lg-2 control-label">Bio</label>
                                    <div class="col-lg-10">
                                        <textarea class="form-control" rows="3" id="textArea" placeholder="Masukkan deskripsi diri Anda<"></textarea>
                                    </div>
                              
                                </div>


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
    </div> <!-- end login -->
<jsp:include page="footer.jsp"></jsp:include>
<script src="js/dropdown.js"></script>
</body>

</html>