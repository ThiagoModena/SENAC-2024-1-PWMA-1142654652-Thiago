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
        
        int idJog = Integer.parseInt(request.getParameter("id_jogador"));
            
        try {
                
            new UefaDAO().removerJogador(idJog);
            
            out.print("Jogador deletado");
        
            } catch (Exception e) {
            
                out.print("erro " + e.getMessage());
            
            }
        
        
        %>
    </body>
</html>
