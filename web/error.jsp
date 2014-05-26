<%-- 
    Document   : Error
    Created on : Mar 27, 2014, 2:58:29 PM
    Author     : Anjar_Ibnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int tipe = Integer.parseInt(request.getParameter("tipe"));
            if(tipe==0)
            {
                out.println("<h1>Username dan password belum diisi (: </h1>");
            }
            else if(tipe==1)
            {
                out.println("<h1>Username belum diisi (: </h1>");
            }
            else if(tipe==2)
            {
                out.println("<h1>Password belum diisi (: </h1>");
            }
            else if(tipe==3)
            {
                out.println("<h1>Username dan password salah (: </h1>");
            }
        %>
    </body>
</html>
