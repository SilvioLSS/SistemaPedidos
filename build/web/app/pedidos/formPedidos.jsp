<%@page import="model.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastrar Pedido - Sistema Gerenciador de Pedidos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/forms.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/menu.css"/>
</head>
<body>

    <%@ include file="/app/home/menu.jsp" %>
    
            <%
            Pedido p = null;

            String action = request.getParameter("action");
            if (action == null) {
                action = "create";
            } else {
                if (action.equals("update")) {

                    int id = Integer.valueOf(request.getParameter("id"));

                    p = new Pedido();
                    p.setId(id);
                    p.load();

                }
            }

        %>
    
<div class="form-container">
    <h2>Cadastrar Pedido</h2>

    <form action="<%= request.getContextPath() %>/home?action=<%= action%>&task=pedido" method="POST">
        
        <% if (p != null && p.getId() != 0) {%>
            <input type="hidden" name="id" value="<%= p.getId()%>">
        <% }%>


        <div class="mb-3">
            <label class="form-label">ID Produto</label>
            <input type="number" step="1" name="id_produto" class="form-control" placeholder="Digite o id do produto:"  value="<%= ((p != null) && (p.getProdutos_id()!= 0)) ? p.getProdutos_id(): 0%>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">ID Cliente</label>
            <input type="number" step="1" name="id_cliente" class="form-control" placeholder="Digite o id do cliente:"  value="<%= ((p != null) && (p.getClientes_id()!= 0)) ? p.getClientes_id(): 0%>" required>
        </div>
        
        <div class="mb-3">
            <label class="form-label">Status</label>
            <input type="checkbox" name="status">
        </div>
        
        <div class="mb-3">
            <label class="form-label">Quantidade</label>
            <input type="number" step="1" name="quantidade" class="form-control" placeholder="Digite a quantidade pedida"  value="<%= ((p != null) && (p.getQuantidade()!= 0)) ? p.getQuantidade(): 0%>" required>
        </div>

        <button type="submit" class="btn btn-secondary-custom w-100 mt-2">Cadastrar Pedido</button>

        <p class="mt-3 text-center">
            Voltar para <a href="<%= request.getContextPath() %>/app/pedidos/pedidos.jsp">Pedidos</a>
        </p>

    </form>
</div>

</body>
</html>
