<%@page import="model.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Produtos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/menu.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/clientes.css"/>
    </head>

    <body> 

        <%@ include file="/app/home/menu.jsp" %>
        <% ArrayList<Cliente> dados = new Cliente().getAllTableEntities();%>

        <div class="container mt-4">

            <div class="text-center">
                <h2 class="page-title">Clientes</h2>

                <a href="<%= request.getContextPath()%>/app/clientes/formCliente.jsp" 
                   class="btn btn-secondary-custom">
                    Cadastrar Novo Cliente
                </a>

            </div>

            <table class="tabela-clientes mt-4">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th></th>
                    <th></th>                    
                </tr>

                <% for (Cliente c : dados) {
                    if ( usuarioLogado.equals(c.getUsuarios_nome_usuario()) ){%>
                        <tr>
                            <td><%= c.getId()%></td>
                            <td><%= c.getNome()%></td>
                            <td>
                                <a href="<%= request.getContextPath()  %>/app/clientes/formCliente.jsp?action=update&id=<%= c.getId()%>">
                                    <img src="<%= request.getContextPath()%>/app/img/editar.png">
                                </a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath()%>/home?action=delete&id=<%= c.getId()%>&task=cliente" onclick="return confirm('Deseja realmente excluir o cliente <%= c.getId()%> (<%= c.getNome() %>) ?')">
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
