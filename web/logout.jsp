<%-- 
    Document   : logout
    Created on : Apr 17, 2014, 2:28:57 PM
    Author     : Anjar_Ibnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    
    <%
        Cookie[] tmp = request.getCookies();
            if (tmp != null) {
                for (Cookie cookie : tmp) {
                    if(!cookie.getName().equals("JSESSIONID")) continue;
                    cookie.setValue(null);
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
            response.sendRedirect("index.jsp");
    %>
    
    <body>
    </body>
</html>
