<%-- 
    Document   : registerForm
    Created on : May 23, 2014, 2:28:28 AM
    Author     : RiskaFadilla
--%>
<%
    try {
%>


<%@page import="edu.yale.its.tp.cas.client.filter.CASFilter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="menu.jsp">
    <jsp:param name="aktif" value="Home" />
</jsp:include>
<head>
<script src="js/jquery.min.js"></script>

</head>
<jsp:useBean id="databaseInfo" class="Controller.DatabaseInfo"></jsp:useBean>
<jsp:useBean id="currentAkun" class="Konten.AkunBean"></jsp:useBean>
<jsp:useBean id="currentMember" class="Konten.MemberBean"></jsp:useBean>

<jsp:useBean id="newAkun" class="Konten.AkunBean"></jsp:useBean>
<jsp:useBean id="newMember" class="Konten.MemberBean"></jsp:useBean>
<jsp:setProperty name="newAkun" property="password" param="passwordBaru"></jsp:setProperty>
<jsp:setProperty name="newMember" property="nama" param="nama"></jsp:setProperty>

<%
    String tmpUsername = session.getAttribute("username").toString();
    String username = session.getAttribute("usernameUI").toString();
    currentMember = databaseInfo.getMember(username);
    currentAkun = databaseInfo.getAkunBean(username);
    out.println(currentAkun.getUsername());
    String password = databaseInfo.getPassword(username);

    if (request.getMethod().equalsIgnoreCase("POST")) {
        if (request.getParameter("submit").equalsIgnoreCase("batal")) {
            response.sendRedirect("home.jsp");
        } else {
%>
<%
            try {
                String passwordLama = request.getParameter("password");
                String gantiPassword = request.getParameter("gantiPassword");
                out.println(password + ", " + passwordLama + " , " + gantiPassword);
                if(passwordLama.equalsIgnoreCase(password))
                {
                    if(gantiPassword != null)
                    {
                        databaseInfo.updateAkun(username, newAkun, newMember);
                    }
                    else
                    {
                        databaseInfo.updateAkun(username, currentAkun, newMember);
                    }
                    session.setAttribute("username", newMember.getNama());
                }
                response.sendRedirect("home.jsp");
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
                <form class="form-horizontal" name="formGantiPassword" action="updateAccount.jsp" method="POST" onsubmit="return validateForm()">
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
                                    <input name="password" type="password" class="form-control" id="password" placeholder="Masukkan password" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-2">
                                </div>
                                <div class="text-muted col-lg-10">
                                    <input id="chkIsTeamLead" type="checkbox" name="gantiPassword"> Sekalian ganti password<br>
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

function validateForm()
{
    console.log("uhuk uhuk");
  var a=documents.forms["formGantiPassword"]["passwordBaru"].value;
  var b=documents.forms["formGantiPassword"]["konfirmasiPasswordBaru"].value;
  console.log(a + "==" + b);
  if(!(a==b))
  {
    alert("both passwords are not matching");
    return false;
  }
  return true;
}
</script>
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>

<%
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>