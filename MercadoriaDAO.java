/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Mercadoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Gamer
 */
public class MercadoriaDAO {
    public String gravarMercadoria(Mercadoria mercadoria){
        String sql = "";
        String resposta = "";
        
        try{
            Connection conexao = Conecta.getConexao();
         
            sql = "INSERT INTO MERCADORIA(CODIGO, TIPOMERCADORIA, NOMEMERCADORIA, QUANTIDADE, PRECO, TIPONEGOCIO) VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement pStatement = conexao.prepareStatement(sql);
            pStatement.setInt(1, mercadoria.getCodigoMercadoria());
            pStatement.setString(2, mercadoria.getTipoMercadoria());
            pStatement.setString(3, mercadoria.getNomeMercadoria());
            pStatement.setInt(4, mercadoria.getQuantidade());
            pStatement.setDouble(5, mercadoria.getPreco());
            pStatement.setString(6, mercadoria.getTipoNegociacao());
            
            pStatement.execute();
            resposta = "OK";
            
            conexao.close();
            pStatement.close();
            
        }catch(Exception ex){
            resposta = "Erro ao gravar " + ex.toString();
            ex.printStackTrace();
        }
        
        return resposta;
    }
    
    public String deletarMercadoria(Mercadoria mercadoria){
        String sql = "";
        String resposta = "";
        
        try{
            Connection conexao = Conecta.getConexao();
            sql = "DELETE FROM MERCADORIA WHERE CODIGO = ?";
            PreparedStatement pStatement = conexao.prepareStatement(sql);
            pStatement.setInt(1, mercadoria.getCodigoMercadoria());
            
            int retorno = pStatement.executeUpdate();
            
           
                resposta = "OK";
            
            
            conexao.close();
            pStatement.close();
            
        }
        catch(Exception ex){
            ex.printStackTrace();
            resposta = "ERROR " + ex.toString();
        }
        
        return resposta;
    }
    
    public String alterarMercadoria(Mercadoria mercadoria){
    String sql = "";
        String resposta = "";
        
        try{
            Connection conexao = Conecta.getConexao();
            sql = "UPDATE MERCADORIA SET TIPOMERCADORIA=?, NOMEMERCADORIA=?, QUANTIDADE=?, PRECO=?, TIPONEGOCIO=? WHERE CODIGO=?";
            
           
            PreparedStatement pStatement = conexao.prepareStatement(sql);

            pStatement.setString(1, mercadoria.getTipoMercadoria());
            pStatement.setString(2, mercadoria.getNomeMercadoria());
            pStatement.setInt(3, mercadoria.getQuantidade());
            pStatement.setDouble(4, mercadoria.getPreco());
            pStatement.setString(5, mercadoria.getTipoNegociacao());
            pStatement.setInt(6, mercadoria.getCodigoMercadoria());
            
            
            pStatement.execute();
            resposta = "OK";
            
            conexao.close();
            pStatement.close();
            
        }catch(Exception ex){
            resposta = "Erro ao alterar " + ex.toString();
            ex.printStackTrace();
        }
        
        return resposta;
    } 
    
    public ArrayList<Mercadoria> listarMercadorias(){
        String sql = "";
        ArrayList<Mercadoria> lista = new ArrayList<Mercadoria>();
        
        try{
            Connection conexao = Conecta.getConexao();
            sql = "SELECT * FROM MERCADORIA";
            PreparedStatement pStatement = conexao.prepareStatement(sql);
            ResultSet resultado = pStatement.executeQuery();
            
            if(resultado.next()){
                do {
                Mercadoria mercadoria = new Mercadoria();
                 mercadoria.setCodigoMercadoria(resultado.getInt("CODIGO"));
                 mercadoria.setTipoMercadoria(resultado.getString("TIPOMERCADORIA"));
                 mercadoria.setNomeMercadoria(resultado.getString("NOMEMERCADORIA"));
                 mercadoria.setQuantidade(resultado.getInt("QUANTIDADE"));
                 mercadoria.setPreco(resultado.getDouble("PRECO"));
                 mercadoria.setTipoNegociacao(resultado.getString("TIPONEGOCIO"));
                 
                 lista.add(mercadoria);
                }while(resultado.next());
            }
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        
        return lista;
    }
    
    public boolean jaExiste(Mercadoria mer){
        String sql = "";
        boolean resposta = false;
        
        try{
            Connection conexao = Conecta.getConexao();
            Statement pStatement = conexao.createStatement();
            sql = "SELECT * FROM MERCADORIA WHERE CODIGO = '" + mer.getCodigoMercadoria();
               // pStatement.setInt(1, mer.getCodigoMercadoria());   
            ResultSet resultado = pStatement.executeQuery(sql);
            
            if(resultado.next()){
                resposta = true;
            }
            
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        
        return resposta;
    }
    
}
