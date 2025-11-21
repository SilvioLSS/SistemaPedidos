package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import logtrack.ExceptionLogTrack;
import model.Cliente;
import model.Produto;
import model.Usuario;

public class FrontController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String task = request.getParameter("task");
        if (task == null) {
            task = "";
        }

        try {

            switch (task) {

                case "logout":
                    doGetLogout(request, response);
                    break;

                case "produto":
                    doGetProduto(request, response);
                    break;

                case "cliente":
                    doGetCliente(request, response);
                    break;

                default:
                    doDefault(request, response);

            }

        } catch (Exception ex) {
            ExceptionLogTrack.getInstance().addLog(ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String task = request.getParameter("task");
        if (task == null) {
            task = "";
        }

        try {

            switch (task) {

                case "login":
                    doPostLogin(request, response);
                    break;

                case "cadastro":
                    doPostCadastro(request, response);
                    break;

                case "produto":
                    doPostProduto(request, response);
                    break;
                
                case "cliente":
                    doPostCliente(request, response);
                    break;

                default:
                    doDefault(request, response);

            }

        } catch (Exception ex) {
            ExceptionLogTrack.getInstance().addLog(ex);
        }

    }

    private void doGetLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession sessao = request.getSession(false);
        if (sessao != null) {
            sessao.removeAttribute("usuario");

            sessao.invalidate();
        }

        response.sendRedirect(request.getContextPath() + "/app/home/login.jsp");

    }

    private void doGetProduto(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String action = request.getParameter("action");

        if (action != null && action.equals("delete")) {

            int id = Integer.parseInt(request.getParameter("id"));

            Produto p = new Produto();
            p.setId(id);

            p.delete();

        }

        response.sendRedirect(request.getContextPath() + "/app/produtos/produtos.jsp");

    }
    
        private void doGetCliente(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String action = request.getParameter("action");

        if (action != null && action.equals("delete")) {

            int id = Integer.parseInt(request.getParameter("id"));

            Cliente c = new Cliente();
            c.setId(id);

            c.delete();

        }

        response.sendRedirect(request.getContextPath() + "/app/clientes/clientes.jsp");

    }

    private void doPostLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String nomeUsuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");

        Usuario usuarioTry = new Usuario();
        usuarioTry.setNomeUsuario(nomeUsuario);
        usuarioTry.setSenha(senha);

        Usuario usuario = new Usuario();
        usuario.setNomeUsuario(nomeUsuario);
        boolean status = usuario.load();

        if (status == true && usuario.getSenha().equals(usuarioTry.getSenha())) {

            HttpSession sessao = request.getSession(false);
            if (sessao != null) {
                sessao.removeAttribute("usuario");
                sessao.invalidate();
            }

            sessao = request.getSession(true);

            sessao.setAttribute("usuario", usuario.getNomeUsuario());

            response.sendRedirect(request.getContextPath() + "/app/home/home.jsp");

        } else {
            request.setAttribute("msg", "Nome de usuário ou senha incorreta.");
            request.getRequestDispatcher("/app/home/login.jsp").forward(request, response);
        }

    }

    private void doPostCadastro(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");
        String confirmacaoSenha = request.getParameter("confirmarSenha");

        Usuario usuarioExistente = new Usuario();
        usuarioExistente.setNomeUsuario(usuario);
        if (usuarioExistente.load()) {
            request.setAttribute("msg", "Nome de usuário já existe!");
            request.getRequestDispatcher("/app/home/cadastro.jsp").forward(request, response);
            return;
        }

        if (!senha.equals(confirmacaoSenha)) {
            request.setAttribute("msg", "Senhas não coincidem!");
            request.getRequestDispatcher("/app/home/cadastro.jsp").forward(request, response);
            return;
        }

        Usuario novoUsuario = new Usuario();
        novoUsuario.setNomeUsuario(usuario);
        novoUsuario.setSenha(senha);
        novoUsuario.save();

        response.sendRedirect(request.getContextPath() + "/app/home/login.jsp");
    }

    private void doPostProduto(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String action = request.getParameter("action");

        String nomeProduto = request.getParameter("nome");
        Float precoProduto = Float.parseFloat(request.getParameter("preco"));

        HttpSession session = request.getSession(false);
        String usuarioLogado = (String) session.getAttribute("usuario");

        if (usuarioLogado == null) {
            response.sendRedirect(request.getContextPath() + "/app/home/login.jsp");
            return;
        }

        Produto p = new Produto();

        if (action.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            p.setId(id);
            p.load();
        }

        p.setNome(nomeProduto);
        p.setPreco(precoProduto);
        p.setUsuarios_nome_usuario(usuarioLogado);

        p.save();

        response.sendRedirect(request.getContextPath() + "/app/produtos/produtos.jsp");
    }
    
        private void doPostCliente(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String action = request.getParameter("action");

        String nomeCliente = request.getParameter("nome");

        HttpSession session = request.getSession(false);
        String usuarioLogado = (String) session.getAttribute("usuario");

        if (usuarioLogado == null) {
            response.sendRedirect(request.getContextPath() + "/app/home/login.jsp");
            return;
        }

        Cliente c = new Cliente();

        if (action.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            c.setId(id);
            c.load();
        }

        c.setNome(nomeCliente);
        c.setUsuarios_nome_usuario(usuarioLogado);

        c.save();

        response.sendRedirect(request.getContextPath() + "/app/clientes/clientes.jsp");
    }

    private void doDefault(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.sendRedirect(request.getContextPath() + "/home/login.jsp");
    }
}
