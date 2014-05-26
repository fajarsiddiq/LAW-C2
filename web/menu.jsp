<%-- 
    Document   : menu
    Created on : May 25, 2014, 5:54:14 PM
    Author     : Anjar_Ibnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
<%
    String aktif = request.getParameter("aktif");
    String home ="", pasangIklan="";
    if(aktif.equalsIgnoreCase("home")) home = "active";
    else if(aktif.equalsIgnoreCase("pasangIklan")) pasangIklan = "active";
%>
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
            <div class="navbar-collapse collapse" id="navbar-main">
                <ul class="nav navbar-nav">
                    <li class="<%=home%>">
                        <a href="home.jsp">Beranda</a>
                    </li>
                    <li class="<%=pasangIklan%>">
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
                        <li><a href="updateProfile.jsp">Ubah Profil</a></li>
                        <li><a href="updateAccount.jsp">Ubah Akun</a></li>
                        <li><a href="#">Lihat Favorit</a></li>
                        <li class="divider"></li>
                        <li><a href="logout.jsp">Keluar</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </div>
</div>
