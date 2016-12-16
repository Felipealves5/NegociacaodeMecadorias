
<%-- 
    Document   : listaMercadorias
    Created on : 15/12/2016, 13:05:10
    Author     : Gamer
--%>

<%@page import="dao.MercadoriaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.Mercadoria"%>

<%
    ArrayList<Mercadoria> mercadorias = new MercadoriaDAO().listarMercadorias();
    
    out.println("<table border='1'>");
    if(mercadorias != null){
        for(Mercadoria p : mercadorias){
            out.println("<tr>");
            out.println("<td>"+ p.getCodigoMercadoria()+"</td>");
            out.println("<td>"+ p.getTipoMercadoria()+"</td>");
            out.println("<td>"+ p.getNomeMercadoria()+"</td>");
            out.println("<td>"+ p.getQuantidade()+"</td>");
            out.println("<td>"+ p.getPreco()+"</td>");
            out.println("<td>"+ p.getTipoNegociacao()+"</td>");
            out.println("</tr>");
        }
    }
    out.println("</table>");
%>    
