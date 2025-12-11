<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Início - Sistema Gerenciador de Pedidos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/home.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/menu.css"/>
    </head>
    <body>

        <%@ include file="/app/home/menu.jsp" %>

        <!-- CONTEÚDO PRINCIPAL -->
        <div class="content">
            <h1>Bem-vindo ao Sistema</h1>
            <p>Escolha uma das opções abaixo para começar.</p>

            <div class="menu-container">

                <div onclick="location.href = '<%=request.getContextPath()%>/app/pedidos/pedidos.jsp'" class="menu-card">
                    <h3>Pedidos</h3>
                </div>

                <div onclick="location.href = '<%=request.getContextPath()%>/app/produtos/produtos.jsp'" class="menu-card">
                    <h3>Produtos</h3>
                </div>

                <div onclick="location.href = '<%=request.getContextPath()%>/app/clientes/clientes.jsp'" class="menu-card">
                    <h3>Clientes</h3>
                </div>

                <div onclick="location.href = '<%=request.getContextPath()%>/app/receitas/financas.jsp'" class="menu-card">
                    <h3>Receitas</h3>
                </div>

            </div>
        </div>

        <footer>
            &copy; 2025 - Sistema Gerenciador de Pedidos.
        </footer>

    </body>
</html>
