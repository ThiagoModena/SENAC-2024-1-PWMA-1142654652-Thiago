<%@page import="banco.uefa.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% 
        
        int IdClube = Integer.parseInt(request.getParameter("id_clube"));
        
        try {
        
            new UefaDAO().removerClube(IdClube);
            out.print("Clube deletado");
        
            } catch (Exception e) {
            out.print("erro " + e.getMessage());
            }
        
        
        
        
        
        %> 
        
    </body>
</html>
