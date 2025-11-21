package model;

import framework.DataAccessObject;
import java.util.ArrayList;

public class Produto extends DataAccessObject{

    private int id;
    private String nome;
    private float preco;
    private String usuarios_nome_usuario;

    public Produto() {
        super("produtos");
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public float getPreco() {
        return preco;
    }

    public String getUsuarios_nome_usuario() {
        return usuarios_nome_usuario;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
        addChange("nome", this.nome);
    }

    public void setPreco(float preco) {
        this.preco = preco;
        addChange("preco", this.preco);
    }

    public void setUsuarios_nome_usuario(String usuarios_nome_usuario) {
        this.usuarios_nome_usuario = usuarios_nome_usuario;
        addChange("usuarios_nome_usuario", this.usuarios_nome_usuario);
    }

    @Override
    protected String getWhereClauseForOneEntity() {
        return " id = " + getId();
    }

    @Override
    protected DataAccessObject fill(ArrayList<Object> data) {
        id = (int) data.get(0);
        nome = (String) data.get(1);
        preco = (float) data.get(2);
        usuarios_nome_usuario = (String) data.get(3);
        
        return this;
    }

    @Override
    protected Produto copy() {
        Produto cp = new Produto();
        
        cp.setId(getId());
        cp.setNome(getNome());
        cp.setPreco(getPreco());
        cp.setUsuarios_nome_usuario(getUsuarios_nome_usuario());
        cp.setNovelEntity(false);
        
        
        return cp;
    }    
}
