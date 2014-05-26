<%-- 
    Document   : registerForm
    Created on : May 23, 2014, 2:28:28 AM
    Author     : RiskaFadilla
--%>

<%
    try
    {
%>

<jsp:include page="menu.jsp">
   <jsp:param name="aktif" value="" />
</jsp:include>

<%@page import="edu.yale.its.tp.cas.client.filter.CASFilter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="databaseInfo" class="Controller.DatabaseInfo"></jsp:useBean>
<jsp:useBean id="currentMember" class="Konten.MemberBean"></jsp:useBean>
<jsp:useBean id="currentKontak" class="Konten.KontakBean"></jsp:useBean>

<%
    String tmpUsername = session.getAttribute("username").toString();
    String username = databaseInfo.getUsernameUI(tmpUsername);
    
    //jika 
    String password = databaseInfo.getPassword(username);
    if (password.length() == 0) {
        response.sendRedirect("home.jsp");
    }
        out.println(password);
    currentKontak = databaseInfo.getKontak(username);
    out.println(currentKontak);
    currentMember = databaseInfo.getMember(username);
    out.println(currentKontak.getAkunTwitter());
    out.println(currentMember.getPassword());

    if (request.getMethod().equalsIgnoreCase("POST")) {
        if (request.getParameter("submit").equalsIgnoreCase("batal")) {
            response.sendRedirect("home.jsp");
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
                    <h1>Update Data Profil</h1>
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
                                    <label for="inputNama" class="col-lg-2 control-label">Email</label>
                                    <div class="col-lg-10">
                                        <input name="email" value="<%=currentKontak.getEmailLain()%>" type="text" class="form-control" id="inputName" placeholder="Masukkan nama">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="inputDomisili" class="col-lg-2 control-label">Domisili</label>
                                    <div class="col-lg-10">
                                        <input type="text" value="<%=currentMember.getDomisili() %>" name="domisili" class="form-control" id="inputDomisili" placeholder="Masukkan domisili">
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="textArea" class="col-lg-2 control-label">Bio</label>
                                    <div class="col-lg-10">
                                        <textarea name="bio" class="form-control" rows="3" id="textArea" placeholder="Masukkan deskripsi diri Anda<"><%=currentMember.getBio() %></textarea>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="inputNoHp" class="col-lg-2 control-label">No HP</label>
                                    <div class="col-lg-10">
                                        <input name="noHP" value="<%=currentKontak.getNoHp() %>" type="text" class="form-control" id="inputNoHp" placeholder="Nomor HP">
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>

                                <div class="form-group">
                                    <label for="akunFB" class="col-lg-2 control-label">Akun Facebook</label>
                                    <div class="col-lg-10">
                                        <input name="akunFB" value="<%=currentKontak.getAkunFb() %>" type="text" class="form-control" id="akunFB" placeholder="Akun Facebook">
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>

                                <div class="form-group">
                                    <label for="akunTwitter" class="col-lg-2 control-label">Akun Twitter</label>
                                    <div class="col-lg-10">
                                        <input name="akunTwitter" value="<%=currentKontak.getAkunTwitter() %>" type="text" class="form-control" id="akunTwitter" placeholder="Akun Twitter">
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>

                                <div class="form-group">
                                    <label for="pinBBM" class="col-lg-2 control-label">Pin BBM</label>
                                    <div class="col-lg-10">
                                        <input name="pinBBM" value="<%=currentKontak.getPinBbm() %>" type="text" class="form-control" id="pinBBM" placeholder="Pin BBM">
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
</body>

</html>

<%
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
%>