/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Gamer
 */
public class Conecta {
        public static Connection getConexao() throws Exception {

        Connection con = null;
        //Configura servidor de Banco de Dados e nome do Banco
        String serverName = "localhost";
        String mydatabase = "mercadorias";

        //Login e senha do banco
        String username = "root";
        String password = "";

        //Carregando o JDBC Driver
        String driverName = "com.mysql.jdbc.Driver";
        Class.forName(driverName);

        // Criando a conexão com o Banco de Dados
        String url = "jdbc:mysql://" + serverName + "/" + mydatabase; // a JDBC url
        con = DriverManager.getConnection(url, username, password);

        return con;
    }
}
