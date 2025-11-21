<%@page import="model.Cliente"%>
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
            Cliente c = null;

            String action = request.getParameter("action");
            if (action == null) {
                action = "create";
            } else {
                if (action.equals("update")) {

                    int id = Integer.valueOf(request.getParameter("id"));

                    c = new Cliente();
                    c.setId(id);
                    c.load();

                }
            }

        %>
    
<div class="form-container">
    <h2>Cadastrar Cliente</h2>

    <form action="<%= request.getContextPath() %>/home?action=<%= action%>&task=cliente" method="POST">
        
        <% if (c != null && c.getId() != 0) {%>
            <input type="hidden" name="id" value="<%= c.getId()%>">
        <% }%>


        <div class="mb-3">
            <label class="form-label">Nome do Cliente</label>
            <input type="text" name="nome" class="form-control" placeholder="Digite o nome do produto:" value="<%= ((c != null) && (c.getNome() != null)) ? c.getNome() : ""%>" required>
        </div>

        <button type="submit" class="btn btn-secondary-custom w-100 mt-2">Cadastrar Cliente</button>

        <p class="mt-3 text-center">
            Voltar para <a href="<%= request.getContextPath() %>/app/clientes/clientes.jsp">Clientes</a>
        </p>

    </form>
</div>

</body>
</html>
