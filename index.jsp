<%-- 
    Document   : index
    Created on : 15/12/2016, 12:02:30
    Author     : Gamer
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.MercadoriaDAO"%>
<%@page import="classes.Mercadoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Negociação de mercadorias</title>
        <script type="text/javascript" src="jquery-3.1.1.min.js"></script>
        <script>
            $(document).ready(function(){
                /* EVENTOS */
                $('#btnSalvar').click(function(){
                    if(validaCampos()){
                        $.ajax({
                          url: "ajax/gravarMercadoria.jsp",
                          data: $("#form1").serialize(),
                          success: function(data) {
                          resposta = $(data).find("resposta").text();
                           alert(resposta);
                           history.forward();
                          }
                       });  
                    } 
                });
                $('#btnEditar').click(function(){
                    if(validaCampos()){
                        $.ajax({
                          url: "ajax/alterarMercadoria.jsp",
                          data: $("#form1").serialize(),
                          success: function(data) {
                          resposta = $(data).find("resposta").text();
                           alert(resposta);
                          }
                       });  
                    } 
                });
                $('#btnExcluir').click(function(){
                    var codigo = $('#txtCodigoMercadoria').val();
                    
                    if(codigo == ""){
                        alert("Por favor digite o código para excluir");
                    } else {
                         $.ajax({
                          url: "ajax/excluirMercadoria.jsp",
                          data: 'codigo=' + codigo,
                          success: function(data) {
                          resposta = $(data).find("resposta").text();
                           alert(resposta);
                          }
                       }); 
                    }
                    
                });
                    
                /*FUNÇÕES */
                function validaCampos(){
                    var resultado = true;
                    
                    var codigo = $('#txtCodigoMercadoria').val();
                    var tipomercadoria = $('#txtTipoMercadoria').val();
                    var nomemercadoria = $('#txtNomeMercadoria').val();
                    var quantidade = $('#txtQuantidade').val();
                    var preco = $('#txtPreco').val();
                    var tiponegocio = $('#boxTipoNegocio').val();
                    
                    if(codigo == ""){
                        alert("Por favor preencha o campo código");
                        return false;
                    }
                     if(tipomercadoria == ""){
                        alert("Por favor preencha o campo Tipo da Mercadoria ");
                        return false;
                    }
                    
                     if(nomemercadoria == ""){
                        alert("Por favor preencha o campo Nome da Mercadoria");
                        return false;
                    }
                    
                    if(quantidade == ""){
                        alert("Por favor preencha o campo Quantidade");
                        return false;
                    }
                    
                    if(preco == ""){
                        alert("Por favor preencha o campo Preço");
                        return true;
                    }
                    
                    if(tiponegocio == 0){
                        alert("Por favor preencha o campo Tipo do Negocio");
                        return false;
                    }
                    else{
                    return true;
                }
                }
            });
        </script>
    </head>
    <body>
        <h1>Negociação de mercadorias</h1>
        <form id="form1" action="#" method="post">
            <div id="divform">
                <table id="tudo">
                    <tr>
                        <td>Codigo da Mercadoria</td>
                        <td><input type="text" name="txtCodigoMercadoria" id="txtCodigoMercadoria"></td>
                    </tr>
                    <tr>
                        <td>Tipo da Mercadoria</td>
                        <td><input type="text" name="txtTipoMercadoria" id="txtTipoMercadoria"></td>
                    </tr>
                    <tr>
                        <td>Nome da Mercadoria</td>
                        <td><input type="text" name="txtNomeMercadoria" id="txtNomeMercadoria"></td>
                    </tr>
                    <tr>
                        <td>Quantidade</td>
                        <td><input type="text" name="txtQuantidade" id="txtQuantidade"></td>
                    </tr>
                    <tr>
                        <td>Preço</td>
                        <td><input type="text" name="txtPreco" id="txtPreco"></td>
                    </tr>
                    <tr>
                        <td>Tipo do Negocio</td>
                        <td>
                            <select name="boxTipoNegocio" id="boxTipoNegocio">
                            <option value="0">Selecione...</option>
                            <option value="Compra">Compra</option>
                            <option value="Venda">Venda</option>
                            </select>
                        </td>
                    </tr>
                </table> 
                <div id="botoes"
                    <table>
                        <tr>
                           <td><input type="button" id="btnSalvar" value="Salvar"></td>
               
                           <td><input type="button" id="btnExcluir" value="Excluir"></td>
               
                           <td><input type="button" id="btnEditar" value="Editar"></td>
                        </tr>
                    </table> 
                </div>
        </form>
        
        <div id="listagem">
            <%
                ArrayList<Mercadoria> mercadorias = new MercadoriaDAO().listarMercadorias();
                    out.println("<table border='1'>");
                    out.println("<tr>");
                    out.println("<th>Codigo</th>");
                    out.println("<th>Tipo da Mercador</th>");
                    out.println("<th>Nome da Mercadoria</th>");
                    out.println("<th>Quantidade</th>");
                    out.println("<th>Preço</th>");
                    out.println("<th>Tipo do Negocio</th>");
                    out.println("</tr>");
                if(mercadorias != null){
                      for(Mercadoria m : mercadorias){
                      out.println("<tr>");
                      out.println("<td>"+ m.getCodigoMercadoria()+"</td>");
                      out.println("<td>"+ m.getTipoMercadoria()+"</td>");
                      out.println("<td>"+ m.getNomeMercadoria()+"</td>");
                      out.println("<td>"+ m.getQuantidade()+"</td>");
                      out.println("<td>"+ m.getPreco()+"</td>");
                      out.println("<td>"+ m.getTipoNegociacao()+"</td>");
                      out.println("</tr>");
                     }
                   }
                  out.println("</table>");
            %>
            
        </div>
        
    </body>
</html>
