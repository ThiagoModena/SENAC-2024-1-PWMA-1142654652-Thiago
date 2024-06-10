
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
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
        table {
            width: 75%;
            height: 70%;
            padding: 10px;
            
        }
        
        table th{
            background-color: #686D76;
            font-family: Arial;
            padding: 8px;
            border-top-left-radius: 6px;
            color: #EEEEEE;
        }
        
        table td{
            margin: 0;
            padding: 20px;
            background-color: #EEEEEE;
            color: #000033;
            font-family: Arial;
        }

        </style>
        
    </head>
    <body>
        
        <%
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conectar = DriverManager.getConnection("jdbc:mysql://localhost:3306/championsleague", "root", "rapha_1910");
        
        PreparedStatement st = conectar.prepareStatement("SELECT * FROM jogador;");
        
        ResultSet baller = st.executeQuery();
        
        %>
      
        <table>
            <tr>
                <th>Nome</th><th>Clube</th><th>nacionalidade</th><th>Camisa</th><th>Posição</th><th>ID</th>
            </tr>
            
            
            <%
            while(baller.next()) {                    
                   
            %>
            
            <tr>
                <td> <%= baller.getString("nome_jogador")%> </td>
                <td> <%= baller.getString("clube_jogador")%> </td>
                <td> <%= baller.getString("nacionalidade")%> </td>
                <td> <%= baller.getString("camisa")%> </td>
                <td> <%= baller.getString("posicao")%> </td>
                <td> <%= baller.getString("id")%> </td>
            </tr>
            
            <%
                }
            %>

        </table>
        
    </body>
</html>
