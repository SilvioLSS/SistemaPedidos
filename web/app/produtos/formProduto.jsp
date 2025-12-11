<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastrar Produto - Sistema Gerenciador de Pedidos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/forms.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/menu.css"/>
</head>
<body>

    <%@ include file="/app/home/menu.jsp" %>
    
            <%
            Produto p = null;

            String action = request.getParameter("action");
            if (action == null) {
                action = "create";
            } else {
                if (action.equals("update")) {

                    int id = Integer.valueOf(request.getParameter("id"));

                    p = new Produto();
                    p.setId(id);
                    p.load();

                }
            }

        %>
    
<div class="form-container">
    <h2>Cadastrar Produto</h2>

    <form action="<%= request.getContextPath() %>/home?action=<%= action%>&task=produto" method="POST">
        
        <% if (p != null && p.getId() != 0) {%>
            <input type="hidden" name="id" value="<%= p.getId()%>">
        <% }%>


        <div class="mb-3">
            <label class="form-label">Nome do Produto</label>
            <input type="text" name="nome" class="form-control" placeholder="Digite o nome do produto:" pattern=".{2,}" 
                       title="O nome deve ter pelo menos 2 caracteres" value="<%= ((p != null) && (p.getNome() != null)) ? p.getNome() : ""%>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Preço</label>
            <input type="number" step="0.01" min="0.01" name="preco" class="form-control" placeholder="Digite o preço:" title="O preço deve ser um número positivo" value="<%= ((p != null) && (p.getPreco() != 0)) ? p.getPreco() : 0%>" required>
        </div>

        <button type="submit" class="btn btn-secondary-custom w-100 mt-2">Cadastrar Produto</button>

        <p class="mt-3 text-center">
            Voltar para <a href="<%= request.getContextPath() %>/app/produtos/produtos.jsp">Produtos</a>
        </p>

    </form>
</div>

</body>
</html>
