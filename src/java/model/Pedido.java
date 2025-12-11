package model;

import framework.DataAccessObject;
import java.util.ArrayList;

public class Pedido extends DataAccessObject{

    private int id;
    private String usuarios_nome_usuario;
    private int produtos_id;
    private int clientes_id;
    private String status;
    private int quantidade;

    public int getId() {
        return id;
    }

    public String getUsuarios_nome_usuario() {
        return usuarios_nome_usuario;
    }

    public int getProdutos_id() {
        return produtos_id;
    }

    public int getClientes_id() {
        return clientes_id;
    }

    public String getStatus() {
        return status;
    }

    public int getQuantidade() {
        return quantidade;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public void setUsuarios_nome_usuario(String usuarios_nome_usuario) {
        this.usuarios_nome_usuario = usuarios_nome_usuario;
        addChange("usuarios_nome_usuario", this.usuarios_nome_usuario);
    }

    public void setProdutos_id(int produtos_id) {
        this.produtos_id = produtos_id;
        addChange("produtos_id", this.produtos_id);
    }

    public void setClientes_id(int clientes_id) {
        this.clientes_id = clientes_id;
        addChange("clientes_id", this.clientes_id);
    }

    public void setStatus(String status) {
        this.status = status;
        addChange("status", this.status);
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
        addChange("quantidade", this.quantidade);
    }
        
    public Pedido() {
        super("pedidos");
    }

    @Override
    protected String getWhereClauseForOneEntity() {
        return " id = " + getId();
    }

    @Override
    protected DataAccessObject fill(ArrayList<Object> data) {
        id = (int) data.get(0);
        usuarios_nome_usuario = (String) data.get(1);
        produtos_id = (int) data.get(2);
        clientes_id = (int) data.get(3);
        status = (String) data.get(4);
        quantidade = (int) data.get(5);
        
        return this;
    }

    @Override
    protected Pedido copy() {
        Pedido cp = new Pedido();
        
        cp.setId(getId());
        cp.setUsuarios_nome_usuario(getUsuarios_nome_usuario());
        cp.setProdutos_id(getProdutos_id());
        cp.setClientes_id(getClientes_id());
        cp.setStatus(getStatus());
        cp.setQuantidade(getQuantidade());
        
        return cp;
    }
}
