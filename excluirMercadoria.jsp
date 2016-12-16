
<%-- 
    Document   : excluirMercadoria
    Created on : 15/12/2016, 13:04:33
    Author     : Gamer
--%>

<%@page import="dao.MercadoriaDAO"%>
<%@page import="classes.Mercadoria"%>
<%@page contentType="text/xml"%>


<%
    int codigo = Integer.parseInt(request.getParameter("codigo"));
    
    
    Mercadoria mercadoria = new Mercadoria();
    mercadoria.setCodigoMercadoria(codigo);
    
    String resposta = new MercadoriaDAO().deletarMercadoria(mercadoria);
    
    out.println("<resposta>");
    if(resposta.equals("OK")){
        out.println("Mercadoria deletada com sucesso");
    }else{
         out.println("Erro ao deletar Mercadoria" + resposta);
    }
    out.println("</resposta>");


%>
