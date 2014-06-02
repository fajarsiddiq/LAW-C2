<%-- 
    Document   : registerForm
    Created on : May 23, 2014, 2:28:28 AM
    Author     : RiskaFadilla
--%>

<%@page import="edu.yale.its.tp.cas.client.filter.CASFilter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <jsp:useBean id="databaseInfo" class="Controller.DatabaseInfo"></jsp:useBean>
<%
    String username = session.getAttribute(CASFilter.CAS_FILTER_USER).toString();
    //jika 
    String password = databaseInfo.getPassword(username);
    String nama = databaseInfo.getUsername(username);
    if(password.length()>0)
    {
        session.setAttribute("username", nama);
        response.sendRedirect("home.jsp");
    }
    if(request.getMethod().equalsIgnoreCase("POST"))
    {
        if(request.getParameter("submit").equalsIgnoreCase("batal"))
        {
            response.sendRedirect("home.jsp");
        }
        else
        {
         %>
         
         <jsp:useBean id="memberBean" class="Konten.MemberBean"></jsp:useBean>
         <jsp:useBean id="kontakBean" class="Konten.KontakBean"></jsp:useBean>
         <jsp:useBean id="akunBean" class="Konten.AkunBean"></jsp:useBean>
         
         <jsp:setProperty name="memberBean" property="username" value="<%=username%>"></jsp:setProperty>
         <jsp:setProperty name="kontakBean" property="nama" value="<%=username%>"></jsp:setProperty>
         
         <jsp:setProperty name="memberBean" property="nama" param="nama"></jsp:setProperty>\
         <jsp:setProperty name="memberBean" property="jenisKelamin" param="jenisKelamin"></jsp:setProperty>
         <jsp:setProperty name="memberBean" property="jurusan" param="jurusan"></jsp:setProperty>
         <jsp:setProperty name="memberBean" property="domisili" param="domisili"></jsp:setProperty>
         <jsp:setProperty name="memberBean" property="bio" param="bio"></jsp:setProperty>
         <jsp:setProperty name="akunBean" property="username" param="username"></jsp:setProperty>
         <jsp:setProperty name="akunBean" property="password" param="password"></jsp:setProperty>
        <!--         hardcode bung-->
         <jsp:setProperty name="memberBean" property="fotoProfil" value="hmm.hmm"></jsp:setProperty>
         
         <jsp:setProperty name="kontakBean" property="noHp" param="noHP"></jsp:setProperty>
         <jsp:setProperty name="kontakBean" property="emailLain" param="email"></jsp:setProperty>
         <jsp:setProperty name="kontakBean" property="akunFb" param="akunFB"></jsp:setProperty>
         <jsp:setProperty name="kontakBean" property="akunTwitter" param="akunTwitter"></jsp:setProperty>
         <jsp:setProperty name="kontakBean" property="pinBbm" param="pinBBM"></jsp:setProperty>
         
         <%
            try
            { 
               databaseInfo.saveMember(memberBean);
               databaseInfo.saveKontak(kontakBean);
               databaseInfo.savePassword(akunBean);
               out.println("nama = " + memberBean.getNama());
               session.setAttribute("username", memberBean.getNama());
               response.sendRedirect("home.jsp");
            }
            catch(Exception ex)
            {
                
            }
        }
    }
%>

<jsp:include page="header.jsp"></jsp:include>
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a href="home.jsp" class="navbar-brand">Jual Beli ala UI</a>
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
    Password
     @param noHp
     * @param akunFb
     * @param akunTwitter
     * @param pinBbm-->
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
                    <form class="form-horizontal" action="register.jsp" method="POST">
                        <fieldset>
                            <div class="bs-component">
                                <div class="form-group">
                                    <label for="inputName" class="col-lg-2 control-label">Nama</label>
                                    <div class="col-lg-10">
                                        <input name="nama" type="text" class="form-control" id="inputName" placeholder="Masukkan nama">
                                    </div>
                     
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-2 control-label">Jenis Kelamin</label>
                                    <div class="col-lg-10">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="jenisKelamin" id="optionsRadios1" value="laki-laki" checked="">
                                                Laki-laki
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="jenisKelamin" id="optionsRadios2" value="perempuan">
                                                Perempuan
                                            </label>
                                        </div>
                                    </div>
                              
                                </div>

                                <div class="form-group">
                                    <label for="inputEmail" class="col-lg-2 control-label">Email</label>
                                    <div class="col-lg-10">
                                        <input name="email" type="text" class="form-control" id="inputEmail" placeholder="Email">
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                                    <div class="col-lg-10">
                                        <input name="password" type="password" class="form-control" id="inputPassword">
                                    </div>
                                    <div class="col-lg-4"></div>
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
                                        <input type="text" name="domisili" class="form-control" id="inputDomisili" placeholder="Masukkan domisili">
                                    </div>
                                  
                                </div>

                                <div class="form-group">
                                    <label for="textArea" class="col-lg-2 control-label">Bio</label>
                                    <div class="col-lg-10">
                                        <textarea name="bio" class="form-control" rows="3" id="textArea" placeholder="Masukkan deskripsi diri Anda<"></textarea>
                                    </div>
                              
                                </div>
                                
                                <div class="form-group">
                                    <label for="inputNoHp" class="col-lg-2 control-label">No HP</label>
                                    <div class="col-lg-10">
                                        <input name="noHP" type="text" class="form-control" id="inputNoHp" placeholder="Nomor HP">
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="akunFB" class="col-lg-2 control-label">Akun Facebook</label>
                                    <div class="col-lg-10">
                                        <input name="akunFB" type="text" class="form-control" id="akunFB" placeholder="Akun Facebook">
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="akunTwitter" class="col-lg-2 control-label">Akun Twitter</label>
                                    <div class="col-lg-10">
                                        <input name="akunTwitter" type="text" class="form-control" id="akunTwitter" placeholder="Akun Twitter">
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="pinBBM" class="col-lg-2 control-label">Pin BBM</label>
                                    <div class="col-lg-10">
                                        <input name="pinBBM" type="text" class="form-control" id="pinBBM" placeholder="Pin BBM">
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>


                                <div class="form-group">
                                    <div class="col-lg-10 col-lg-offset-2">
                                        <button type="submit" name="submit" value="batal" class="btn btn-default">Batal</button>
                                        <button type="submit" name="submit" value="simpan" class="btn btn-primary">Simpan</button>
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