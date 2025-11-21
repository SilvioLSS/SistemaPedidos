package model;

import framework.DataAccessObject;
import java.util.ArrayList;

public class Cliente extends DataAccessObject{

    private int id;
    private String nome;
    private String usuarios_nome_usuario;
    
    public Cliente() {
        super("clientes");
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
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
        usuarios_nome_usuario = (String) data.get(2);
        
        return this;
    }

    @Override
    protected Cliente copy() {
        Cliente cp = new Cliente();
        
        cp.setId(getId());
        cp.setNome(getNome());
        cp.setUsuarios_nome_usuario(getUsuarios_nome_usuario());
        cp.setNovelEntity(false);
        
        return cp;
    }
    
}
