<%-- 
    Document   : alterarMercadoria
    Created on : 15/12/2016, 13:04:05
    Author     : Gamer
--%>

<%@page import="dao.MercadoriaDAO"%>
<%@page import="classes.Mercadoria"%>
<%@page contentType="text/xml"%>

<%
    int codigomercadoria = Integer.parseInt(request.getParameter("txtCodigoMercadoria"));
    String tipomercadoria = request.getParameter("txtTipoMercadoria");
    String nomemercadoria = request.getParameter("txtNomeMercadoria");
    int quantidade = Integer.parseInt(request.getParameter("txtQuantidade"));
    double preco = Double.parseDouble(request.getParameter("txtPreco"));
    String tiponegocio = request.getParameter("boxTipoNegocio");
    
    Mercadoria mercadoria = new Mercadoria();
    mercadoria.setCodigoMercadoria(codigomercadoria);
    mercadoria.setTipoMercadoria(tipomercadoria);
    mercadoria.setNomeMercadoria(nomemercadoria);
    mercadoria.setQuantidade(quantidade);
    mercadoria.setPreco(preco);
    mercadoria.setTipoNegociacao(tiponegocio);
    
    String resposta = new MercadoriaDAO().alterarMercadoria(mercadoria);
    
    out.println("<resposta>");
    if(resposta.equals("OK")){
        out.println("Mercadoria alterada com sucesso");
    }else{
         out.println("Erro ao alterar Mercadoria" + resposta);
    }
    out.println("</resposta>");
%>    

