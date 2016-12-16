/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author Gamer
 */
public class Mercadoria {
    
    private int codigoMercadoria;
    private String tipoMercadoria;
    private String nomeMercadoria;
    private int quantidade;
    private double preco;
    private String tipoNegociacao;
//Construtor com parametro
    public Mercadoria(int codigoMercadoria, String tipoMercadoria, String nomeMercadoria, int quantidade, double preco, String tipoNegociacao) {
        this.codigoMercadoria = codigoMercadoria;
        this.tipoMercadoria = tipoMercadoria;
        this.nomeMercadoria = nomeMercadoria;
        this.quantidade = quantidade;
        this.preco = preco;
        this.tipoNegociacao = tipoNegociacao;
    }
//Construtor sem paramento
    public Mercadoria() {
        this(0,"","",0,0f,"");
    }
    //Metodos sets e gets
    /**
     * @return the codigoMercadoria
     */
    public int getCodigoMercadoria() {
        return codigoMercadoria;
    }

    /**
     * @param codigoMercadoria the codigoMercadoria to set
     */
    public void setCodigoMercadoria(int codigoMercadoria) {
        this.codigoMercadoria = codigoMercadoria;
    }

    /**
     * @return the tipoMercadoria
     */
    public String getTipoMercadoria() {
        return tipoMercadoria;
    }

    /**
     * @param tipoMercadoria the tipoMercadoria to set
     */
    public void setTipoMercadoria(String tipoMercadoria) {
        this.tipoMercadoria = tipoMercadoria;
    }

    /**
     * @return the nomeMercadoria
     */
    public String getNomeMercadoria() {
        return nomeMercadoria;
    }

    /**
     * @param nomeMercadoria the nomeMercadoria to set
     */
    public void setNomeMercadoria(String nomeMercadoria) {
        this.nomeMercadoria = nomeMercadoria;
    }

    /**
     * @return the quantidade
     */
    public int getQuantidade() {
        return quantidade;
    }

    /**
     * @param quantidade the quantidade to set
     */
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    /**
     * @return the preco
     */
    public double getPreco() {
        return preco;
    }

    /**
     * @param preco the preco to set
     */
    public void setPreco(double preco) {
        this.preco = preco;
    }

    /**
     * @return the tipoNegociacao
     */
    public String getTipoNegociacao() {
        return tipoNegociacao;
    }

    /**
     * @param tipoNegociacao the tipoNegociacao to set
     */
    public void setTipoNegociacao(String tipoNegociacao) {
        this.tipoNegociacao = tipoNegociacao;
    }


    
}

