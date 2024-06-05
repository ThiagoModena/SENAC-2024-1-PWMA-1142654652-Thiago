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
/*            width: 75%;
            height: 70%;*/
            /*padding: 24px;*/
            
        }
        
        table th{
            background-color: #686D76;
            font-family: Arial;
            padding: 28px;
            border-top-left-radius: 6px;
            color: #EEEEEE;
        }
        
        table td{
            margin: 0;
            padding: 28px;
            background-color: #EEEEEE;
            color: #000033;
            font-family: Arial;
        }
        </style>
        
    </head>
    <body>
        
        <%
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conectar = DriverManager.getConnection("jdbc:mysql://localhost:3307/championsleague", "root", "p@$$w0rd");
        
        PreparedStatement st = conectar.prepareStatement("SELECT * FROM clube;");
        
        ResultSet club = st.executeQuery();
        
        %>
      
        <table>
            <tr>
                <th>ID</th><th>Nome</th><th>Origem</th><th>Fundação</th><th>Liga</th>
            </tr>
            
            
            <%
            while(club.next()) {                    
                   
            %>
            
            <tr>
                <td> <%= club.getString("id_clube")%> </td>
                <td> <%= club.getString("nome_clube")%> </td>
                <td> <%= club.getString("origem")%> </td>
                <td> <%= club.getString("fundacao")%> </td>
                <td> <%= club.getString("liga")%> </td>
            </tr>
            
            <%
                }
            %>

        
        
    </body>
</html>
