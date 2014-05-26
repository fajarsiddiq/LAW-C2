<%-- 
    Document   : registerForm
    Created on : May 23, 2014, 2:28:28 AM
    Author     : RiskaFadilla
--%>
<%
    try {
%>

<jsp:include page="menu.jsp">
    <jsp:param name="aktif" value="" />
</jsp:include>
<%@page import="edu.yale.its.tp.cas.client.filter.CASFilter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<script src="js/jquery.min.js"></script>

</head>
<jsp:useBean id="databaseInfo" class="Controller.DatabaseInfo"></jsp:useBean>
<jsp:useBean id="currentMember" class="Konten.MemberBean"></jsp:useBean>
<jsp:useBean id="currentKontak" class="Konten.KontakBean"></jsp:useBean>
<jsp:useBean id="currentAkun" class="Konten.AkunBean"></jsp:useBean>

<%
    String tmpUsername = session.getAttribute("username").toString();
    String username = databaseInfo.getUsernameUI(tmpUsername);

    String password = databaseInfo.getPassword(username);
    
    currentKontak = databaseInfo.getKontak(username);

    currentMember = databaseInfo.getMember(username);

    if (request.getMethod().equalsIgnoreCase("POST")) {
        if (request.getParameter("submit").equalsIgnoreCase("batal")) {
            //response.sendRedirect("home.jsp");
        } else {
%>

<jsp:useBean id="memberBean" class="Konten.MemberBean"></jsp:useBean>
<jsp:useBean id="kontakBean" class="Konten.KontakBean"></jsp:useBean>


<jsp:setProperty name="memberBean" property="username" value="<%=username%>"></jsp:setProperty>
<jsp:setProperty name="kontakBean" property="nama" value="<%=username%>"></jsp:setProperty>

<jsp:setProperty name="memberBean" property="nama" param="nama"></jsp:setProperty>\
<jsp:setProperty name="memberBean" property="jenisKelamin" param="jenisKelamin"></jsp:setProperty>
<jsp:setProperty name="memberBean" property="jurusan" param="jurusan"></jsp:setProperty>
<jsp:setProperty name="memberBean" property="domisili" param="domisili"></jsp:setProperty>
<jsp:setProperty name="memberBean" property="bio" param="bio"></jsp:setProperty>
<jsp:setProperty name="memberBean" property="password" param="password"></jsp:setProperty>
    <!--         hardcode bung-->
<jsp:setProperty name="memberBean" property="fotoProfil" value="hmm.hmm"></jsp:setProperty>

<jsp:setProperty name="kontakBean" property="noHp" param="noHP"></jsp:setProperty>
<jsp:setProperty name="kontakBean" property="emailLain" param="email"></jsp:setProperty>
<jsp:setProperty name="kontakBean" property="akunFb" param="akunFB"></jsp:setProperty>
<jsp:setProperty name="kontakBean" property="akunTwitter" param="akunTwitter"></jsp:setProperty>
<jsp:setProperty name="kontakBean" property="pinBbm" param="pinBBM"></jsp:setProperty>

<%
            try {
                databaseInfo.updateMember(memberBean);
                databaseInfo.updateKontak(kontakBean);
                session.setAttribute("username", memberBean.getNama());
                //response.sendRedirect("home.jsp");
            } catch (Exception ex) {

            }
        }
    }
%>
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
                <h1>Update Akun</h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="well bs-component">
                <form class="form-horizontal" action="updateProfile.jsp" method="POST">
                    <fieldset>
                        <div class="bs-component">
                            <div class="form-group">
                                <label for="inputName" class="col-lg-2 control-label">Nama</label>
                                <div class="col-lg-10">
                                    <input name="nama" value="<%=currentMember.getNama()%>" type="text" class="form-control" id="inputName" placeholder="Masukkan nama">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-2">
                                </div>
                                <div class="text-muted col-lg-10">
                                    <p>Untuk mengubah nama Anda, silakan isi password Anda</p>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="password" class="col-lg-2 control-label">Password</label>
                                <div class="col-lg-10">
                                    <input name="password" type="password" class="form-control" id="password" placeholder="Masukkan password">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-2">
                                </div>
                                <div class="text-muted col-lg-10">
                                    <input id="chkIsTeamLead" type="checkbox" name="gantiPassword" value="true"> Sekalian ganti password<br>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="password" class="col-lg-2 control-label">Password Baru</label>
                                <div class="col-lg-10">
                                    <input disabled id="txtNumHours" name="passwordBaru" type="password" class="form-control" placeholder="Masukkan password">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="password" class="col-lg-2 control-label">Konfirmasi Password</label>
                                <div class="col-lg-10">
                                    <input disabled id="txtNumHours2" name="konfirmasiPasswordBaru" type="password" class="form-control" placeholder="Masukkan password">
                                </div>
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
<script>
$('#chkIsTeamLead').change(function(){
    if ($('#chkIsTeamLead').is(':checked') == true){
      $('#txtNumHours').prop('disabled', false);
      $('#txtNumHours2').prop('disabled', false);
      console.log('checked');
   } else {
     $('#txtNumHours').prop('disabled', true);
     $('#txtNumHours2').prop('disabled', true);
     console.log('unchecked');
   }
});
</script>
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>

<%
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>