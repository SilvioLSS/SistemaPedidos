<%@page import="java.util.ArrayList"%>
<%@page import="model.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Produtos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/menu.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/pages.css"/>
    </head>

    <body> 

        <%@ include file="/app/home/menu.jsp" %>
        <% ArrayList<Pedido> dados = new Pedido().getAllTableEntities();%>

        <div class="container mt-4">

            <div class="text-center">
                <h2 class="page-title">Pedidos</h2>

                <a href="<%= request.getContextPath()%>/app/pedidos/formPedidos.jsp" 
                   class="btn btn-secondary-custom">
                    Cadastrar Novo Pedido
                </a>

            </div>

            <table class="tabela mt-4">
                <tr>
                    <th>ID</th>
                    <th>Cliente</th>
                    <th>Produto</th>
                    <th>Quantidade</th>
                    <th>Status</th>
                    <th></th>
                    <th></th>                    
                </tr>

                <% for (Pedido p : dados) {
                    if ( usuarioLogado.equals(p.getUsuarios_nome_usuario()) ){%>
                        <tr>
                            <td><%= p.getId()%></td>
                            <td><%= p.getClientes_id() %></td>
                            <td><%= p.getProdutos_id() %></td>
                            <td><%= p.getQuantidade() %></td>
                            <td><%= p.getStatus() %></td>
                            <td>
                                <a href="<%= request.getContextPath()  %>/app/pedidos/formPedidos.jsp?action=update&id=<%= p.getId()%>">
                                    <img src="<%= request.getContextPath()%>/app/img/editar.png">
                                </a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath()%>/home?action=delete&id=<%= p.getId()%>&task=pedido" onclick="return confirm('Deseja realmente excluir o pedido <%= p.getId()%> ?')">
                                    <img src="<%= request.getContextPath()%>/app/img/apagar.png">
                                </a>
                            </td>
                        </tr>            
                    <%}
                }%>

            </table>          

        </div>

    </body>
</html>
