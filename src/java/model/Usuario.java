package model;

import framework.DataAccessObject;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Objects;

public class Usuario extends DataAccessObject {

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
        this.nome_usuario = nomeUsuario;
        addChange("nome_usuario", this.nome_usuario);
    }

    public void setSenha(String senha) throws Exception {
        if (senha == null) {
            if (this.senha != null) {
                this.senha = senha;
                addChange("senha", this.senha);
            }
        } else {
            if (senha.equals(this.senha) == false) {

                String senhaSal = getNomeUsuario() + senha + (getNomeUsuario().length() / 2);

                MessageDigest md = MessageDigest.getInstance("SHA-512");
                
                String hash = new BigInteger(1, md.digest(senhaSal.getBytes("UTF-8"))).toString(16);
            
                while (hash.length() < 128) {
                    hash = "0" + hash;
                }

                this.senha = hash;
                addChange("senha", this.senha);
            }
        }
    }

    @Override
    protected String getWhereClauseForOneEntity() {
        return " nome_usuario = '" + getNomeUsuario() + "'";
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
        cp.senha = getSenha();
        cp.setNovelEntity(false);

        return cp;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Usuario) {
            Usuario aux = (Usuario) obj;
            if (getNomeUsuario() == aux.getNomeUsuario()) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

}
