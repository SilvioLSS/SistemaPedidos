<%@page import="model.Despesa"%>
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
            Despesa d = null;

            String action = request.getParameter("action");
            if (action == null) {
                action = "create";
            } else {
                if (action.equals("update")) {

                    int id = Integer.valueOf(request.getParameter("id"));

                    d = new Despesa();
                    d.setId(id);
                    d.load();

                }
            }

        %>
    
<div class="form-container">
    <h2>Cadastrar Despesa</h2>

    <form action="<%= request.getContextPath() %>/home?action=<%= action%>&task=despesa" method="POST">
        
        <% if (d != null && d.getId() != 0) {%>
            <input type="hidden" name="id" value="<%= d.getId()%>">
        <% }%>


        <div class="mb-3">
            <label class="form-label">Nome do produto comprado:</label>
            <input type="text" name="nome" id="nome" class="form-control" placeholder="Digite o nome do produto:"                        pattern=".{2,}" 
                       title="O nome deve ter pelo menos 2 caracteres" value="<%= ((d != null) && (d.getNome() != null)) ? d.getNome() : ""%>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Data</label>
            <input type="date" name="data_compra" id="data_compra" class="form-control"                        max="<%= java.time.LocalDate.now() %>"
                       title="Selecione uma data válida" value="<%= ((d != null) && (d.getData_compra()!= null)) ? d.getData_compra(): null%>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Preço</label>
            <input type="number" step="0.01" min="0.01" name="valor_total" id="valor_total" class="form-control" placeholder="Digite o preço:" title="O valor deve ser um número positivo value="<%= ((d != null) && (d.getValor_total()!= 0)) ? d.getValor_total(): 0%>" required>
        </div>

        <button type="submit" class="btn btn-secondary-custom w-100 mt-2">Cadastrar Produto</button>

        <p class="mt-3 text-center">
            Voltar para <a href="<%= request.getContextPath() %>/app/produtos/produtos.jsp">Produtos</a>
        </p>

    </form>
</div>

</body>
</html>
