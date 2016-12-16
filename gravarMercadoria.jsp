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
    
    Mercadoria mer =  new Mercadoria();
    mer.setCodigoMercadoria(codigomercadoria);

    if(new MercadoriaDAO().jaExiste(mer)){
        out.println("<resposta>");
        out.println("Mercadoria já cadastrada");
        out.println("</resposta>");
    } else {
    String resp = new MercadoriaDAO().gravarMercadoria(mercadoria);
    
    out.println("<resposta>");
    if(resp.equals("OK")){
        out.println("Cadastro de mercadoria efetuado com sucesso");
    }else {
        out.println("erro ao gravar o mercadoria " + resp);
    }
    out.println("</resposta>");
    }
%>    
