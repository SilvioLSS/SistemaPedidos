<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sistema Gerenciador de Pedidos</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/style.css"/>
    </head>

    <body>
        <div class="container">
            <h1>Sistema Gerenciador de Pedidos</h1>
            <p>O sistema completo para quem trabalha com encomendas: organize pedidos, produtos, clientes e acompanhe suas receitas em um único lugar.</p>
            <div class="d-flex justify-content-center gap-3 flex-wrap">
                <a href="app/home/login.jsp" class="btn btn-primary-custom px-4 py-2 text-white fw-semibold">Login</a>
                <a href="app/home/cadastro.jsp" class="btn btn-secondary-custom px-4 py-2 text-white fw-semibold">Cadastre-se</a>
            </div>
        </div>

        <footer>
            &copy; 2025 - Sistema Gerenciador de Pedidos. Todos os direitos reservados.
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

