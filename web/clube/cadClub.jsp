<%@page import="banco.uefa.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <style>
         *{
            box-sizing: border-box;
            padding: 0;
            margin: 0;
                
            font-family: Arial;
            font-size: 2.2rem;
            color: white;
            }
            html, body {

                width: 100%;
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background-image: url(../Assets/cropped-UEFA-Champions-League-Stadium-Wallpaper-1.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
        }
    </style>
    
    
    <body>
        
        <%
            int idClube = (int)Math.floor(Math.random()*900);
            int liga = Integer.parseInt(request.getParameter("leagues"));
            String nomeClube, origem, fundacao;
        
            nomeClube = request.getParameter("nome_clube");
            origem = request.getParameter("origem");
            fundacao = request.getParameter("fundacao");
        

            try {
                    
                String leagues = "";
            
                if(liga == 0) {
                    leagues = "LaLiga";
                } else if (liga == 1) {
                    leagues = "Serie A";
                } else if (liga == 2) {
                    leagues = "Premier League";
                } else if (liga == 3) {
                    leagues = "Bundesliga";
                } else if (liga == 4) {
                    leagues = "Ligue 1";
                } else if (liga == 5) {
                    leagues = "Eredivisie";
                } else if (liga == 6) {
                    leagues = "Liga Portugal";
                }
            
                
                new UefaDAO().cadastrarClube(idClube, nomeClube, origem, fundacao, leagues);
                
                out.print("Clube cadastrado");
                
            
                } catch (Exception e) {
                    out.print("erro " + e.getMessage());
                }
        
        
        %>
        
        
    </body>
</html>
