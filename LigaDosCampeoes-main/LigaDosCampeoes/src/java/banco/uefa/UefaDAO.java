package banco.uefa;


import javax.swing.JOptionPane;
import java.sql.*;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Raphael Cardoso
 */
public class UefaDAO {
        Connection conectar;
    
    private void conexao () throws ClassNotFoundException, SQLException {
    
        // CONECTAR AO BANCO
        Class.forName("com.mysql.cj.jdbc.Driver");
        conectar = DriverManager.getConnection("jdbc:mysql://localhost:3306/championsleague", "root", "rapha_1910");
        
    }
    
    public void cadastrarJogador(String nome, String clube, String nac, int camisa, String posicao, int id) throws SQLException, ClassNotFoundException {
    
        conexao();
        
        PreparedStatement st = conectar.prepareStatement("INSERT INTO jogador VALUES(?,?,?,?,?,?)");
            
        st.setString(1, nome);
        st.setString(2, clube);
        st.setString(3, nac);
        st.setInt(4, camisa);
        st.setString(5, posicao);
        st.setInt(6, id);
            
        st.executeUpdate();      
    
    }
    
    
    public void cadastrarClube (int id, String nome_clube, String origem, String fundacao, String liga) throws ClassNotFoundException, SQLException {
    
        conexao();
    
        PreparedStatement st = conectar.prepareStatement("INSERT INTO clube VALUES (?, ?, ?, ?, ?)");
        
        st.setInt(1, id);
        st.setString(2, nome_clube);
        st.setString(3, origem);
        st.setString(4, fundacao);
        st.setString(5, liga);
        
        st.executeUpdate();
    
    
    }
    
    public void removerJogador (int id_jogador) throws ClassNotFoundException, SQLException {
    
        conexao();
        
        PreparedStatement st = conectar.prepareStatement("DELETE FROM jogador WHERE id = ?");
        st.setInt(1, id_jogador);
            
        st.executeUpdate();
    
    }
    
    
    public void removerClube(int idClube) throws ClassNotFoundException, SQLException {
     
        conexao();
        
        PreparedStatement st = conectar.prepareStatement("DELETE FROM clube WHERE id_clube = ?");
        st.setInt(1, idClube);
            
        st.executeUpdate();
        
    }
    
    
    
    public void buscarJogador (String nomeJogador) throws ClassNotFoundException, SQLException {
    
        conexao();
        
        PreparedStatement st = conectar.prepareStatement("SELECT * FROM jogador WHERE nome_jogador = ?");
        st.setString(1, nomeJogador);
        
        ResultSet baller = st.executeQuery();
        
        
        if (baller.next()) {
            
            String nome, clube, nacionalidade, posicao;
            int camisa, id;
            
            nome = baller.getString("nome_jogador");
            clube = baller.getString("clube_jogador");
            nacionalidade = baller.getString("nacionalidade");
            camisa = baller.getInt("camisa_n");
            posicao = baller.getString("posicao");
            id = baller.getInt("id_jogador");
            
            JOptionPane.showMessageDialog(null, "nome: " + nome + "\n" + "clube: " + clube + "\n" + "nacionalidade: " + nacionalidade + "\n" + "camisa: " + camisa + "\n" + "posicao: " + posicao + "\n" + "id: " + id);
            
        } else {
            
            JOptionPane.showMessageDialog(null, "Jogador nao encontrado");
            
        }
    
    }
    
    
    public void buscarClube (String nomeClube) throws ClassNotFoundException, SQLException {
    
        conexao();
    
    
        PreparedStatement st = conectar.prepareStatement("SELECT * FROM clube WHERE nome_clube = ?");
        st.setString(1, nomeClube);
    
        ResultSet club = st.executeQuery();
        
        if(club.next()) {
        
            int idClub = club.getInt("id_clube");
            String nome = club.getString("nome_clube");
            String origem = club.getString("origem");
            String fundacao = club.getString("fundacao");
            String liga = club.getString("liga");
            
            JOptionPane.showMessageDialog(null, "Nome: " + nome + "\n" + "Origem: " + origem + "\n" + "Liga: " + liga + "\n" + "Fundação: " + fundacao + "\n" + "id: " + idClub);
        
        } else {
        
            JOptionPane.showMessageDialog(null, "Clube não encontrado");
            
        }
    
    }
}
