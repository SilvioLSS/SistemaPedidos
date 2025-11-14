package model;

import framework.DataAccessObject;
import java.util.ArrayList;

public class Usuario extends DataAccessObject{
    
    private String nome_usuario;
    private String senha;

    public Usuario() {
        super("usuarios");
    }

    public String getNomeUsuario() {
        return nome_usuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nome_usuario = nome_usuario;
        addChange("nome_usuario", this.nome_usuario);
    }

    public void setSenha(String senha) {
        this.senha = senha;
        addChange("senha", this.senha);
    }
       
    @Override
    protected String getWhereClauseForOneEntity() {
        return " nome_usuario = " + getNomeUsuario();
    }

    @Override
    protected DataAccessObject fill(ArrayList<Object> data) {
        nome_usuario = (String) data.get(0);
        senha = (String) data.get(1);
        
        return this;
    }

    @Override
    protected Usuario copy() {
        Usuario cp = new Usuario();
        
        cp.setNomeUsuario(getNomeUsuario());
        cp.setSenha(getSenha());
        
        cp.setNovelEntity(false);
        
        return cp;
    }    
}
