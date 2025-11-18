<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Sistema Gerenciador de Pedidos</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Sansation&family=Space+Mono&family=Tomorrow:wght@500&display=swap');

            body {
                background-color: #151515;
                color: #e0e0e0;
                font-family: 'Poppins', sans-serif;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .form-container {
                width: 100%;
                max-width: 400px;
                background-color: #1e1e1e;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 0 12px rgba(0,0,0,0.4);
            }

            h2 {
                color: #3a24d9;
                font-family: "Tomorrow", sans-serif;
                font-weight: 500;
                margin-bottom: 25px;
            }

            .btn-primary-custom {
                background-color: #3a24d9;
                border: none;
                transition: 0.2s;
                font-family: "Sansation", sans-serif;
            }

            .btn-primary-custom:hover {
                background-color: #4b33ff;
                transform: scale(1.10)
            }

            a {
                color: #4b33ff;
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <%
                String msg = (String) request.getAttribute("msg");
                if (msg != null) {%>
                    <script>
                        alert("<%= msg%>");
                    </script>
                 }

            HttpSession sessao = request.getSession(false);
            if ((sessao != null) && (sessao.getAttribute("usuario") != null)){
                response.sendRedirect(request.getContextPath() + "/app/home/home.jsp");
            }
        %>


        <div class="form-container">
            <h2>Login</h2>

            <form action="<%= request.getContextPath()%>/home?task=login" method="POST">
                <div class="mb-3">
                    <label class="form-label">Nome de Usuário</label>
                    <input type="text" name="usuario" class="form-control" placeholder="Digite aqui o seu nome de usuário:" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Senha</label>
                    <input type="password" name="senha" class="form-control" placeholder="Digite aqui a sua senha:" required>
                </div>

                <button type="submit" class="btn btn-primary-custom w-100 mt-2">Entrar</button>

                <p class="mt-3 text-center">
                    Não tem uma conta? <a href="cadastro.jsp">Cadastre-se</a>
                </p>
            </form>
        </div>

    </body>
</html>
