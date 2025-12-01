package model;

import framework.DataAccessObject;
import java.util.ArrayList;

public class Despesa extends DataAccessObject{
    private int id;
    private String nome;
    private String data_compra;
    private float valor_total;
    private String usuarios_nome_usuario;

    public Despesa() {
        super("despesas");
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getData_compra() {
        return data_compra;
    }

    public float getValor_total() {
        return valor_total;
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

    public void setData_compra(String data_compra) {
        this.data_compra = data_compra;
        addChange("data_compra", this.data_compra);
    }

    public void setValor_total(float valor_total) {
        this.valor_total = valor_total;
        addChange("valor_total", this.valor_total);
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
        data_compra = (String) data.get(2).toString();
        valor_total = (float) data.get(3);
        usuarios_nome_usuario = (String) data.get(4); 
        
        return this;
    }

    @Override
    protected Despesa copy() {
        Despesa cp = new Despesa();
        
        cp.setId(getId());
        cp.setNome(getNome());
        cp.setData_compra(getData_compra());
        cp.setValor_total(getValor_total());
        cp.setUsuarios_nome_usuario(getUsuarios_nome_usuario());
        
        return cp;
    }
}
