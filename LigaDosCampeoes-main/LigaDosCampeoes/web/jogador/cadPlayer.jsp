<%@page import="banco.uefa.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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
        
    </head>
    <body>
       
        <% 
            int posicao;
            int nCamisa;
            int id = (int)Math.floor(Math.random()*900);
            String nome, nomeClube, nacionalidade, pos;
            
            nCamisa = Integer.parseInt(request.getParameter("camisa_n"));
            
            posicao = Integer.parseInt(request.getParameter("posicao"));
            
            nome = request.getParameter("nome_jogador");
            nomeClube = request.getParameter("clube_jogador");
            nacionalidade = request.getParameter("nacionalidade");
            pos = request.getParameter("posicao").toString();
            
            
            try {
                String position = "";
                
                if(posicao == 0) {
                    position = "GOL";
                } else if (posicao == 1) {
                    position = "ZAG";
                } else if (posicao == 2) {
                    position = "LD";
                } else if (posicao == 3) {
                    position = "LE";
                }  else if (posicao == 4) {
                    position = "VOL";
                }  else if (posicao == 5) {
                    position = "MEI";
                }  else if (posicao == 6) {
                    position = "PD";
                }  else if (posicao == 7) {
                    position = "PE";
                }  else if (posicao == 8) {
                    position = "ATA";
                }
                
                new UefaDAO().cadastrarJogador(nome, nomeClube, nacionalidade, nCamisa, position, id);
                
                out.print("Jogador Cadastrado");
                
                
            }catch (Exception e) {
               out.print("erro: " + e.getMessage());
            }
                

        %> 
           
        
    </body>
</html>
