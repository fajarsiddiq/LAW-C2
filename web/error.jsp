<%-- 
    Document   : wrongpassword
    Created on : May 31, 2014, 5:50:20 AM
    Author     : RiskaFadilla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

    <div id="login">

        <h2>Sign In</h2>

        <form action="" method="POST">
            <fieldset>
            <%
                int tipe = Integer.parseInt(request.getParameter("tipe"));
                if (tipe == 0) {
                    out.println("<h3>Username dan password belum diisi (: </h3>");
                } else if (tipe == 1) {
                    out.println("<h3>Username belum diisi (: </h3>");
                } else if (tipe == 2) {
                    out.println("<h3>Password belum diisi (: </h3>");
                } else if (tipe == 3) {
                    out.println("<h3>Username dan password salah (: </h3>");
                }
            %>

            <div class="form-group">
                <label class="control-label" for="inputDefault">Email</label>
                <input type="text" name="username" class="form-control" placeholder="Masukkan username"> 
            </div>
            <div class="form-group">
                <label class="control-label" for="inputDefault">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Masukkan password"> 
            </div>

            <button type="submit" name="submit" class="btn btn-primary btn-block">Sign In</button>
        </fieldset>

    </form>

</div> <!-- end login -->

<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
