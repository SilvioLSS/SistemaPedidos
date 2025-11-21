<%@page import="java.util.ArrayList"%>
<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Produtos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/menu.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/produtos.css"/>
    </head>

    <body> 

        <%@ include file="/app/home/menu.jsp" %>
        <% ArrayList<Produto> dados = new Produto().getAllTableEntities();%>

        <div class="container mt-4">

            <div class="text-center">
                <h2 class="page-title">Produtos</h2>

                <a href="<%= request.getContextPath()%>/app/produtos/formProduto.jsp" 
                   class="btn btn-secondary-custom">
                    Cadastrar Novo Produto
                </a>

            </div>

            <table class="tabela-produtos mt-4">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Preço</th>
                    <th></th>
                    <th></th>                    
                </tr>

                <% for (Produto p : dados) {
                    if ( usuarioLogado.equals(p.getUsuarios_nome_usuario()) ){%>
                        <tr>
                            <td><%= p.getId()%></td>
                            <td><%= p.getNome()%></td>
                            <td><%= p.getPreco()%></td>
                            <td>
                                <a href="<%= request.getContextPath()  %>/app/produtos/formProduto.jsp?action=update&id=<%= p.getId()%>">
                                    <img src="<%= request.getContextPath()%>/app/img/editar.png">
                                </a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath()%>/home?action=delete&id=<%= p.getId()%>&task=produto" onclick="return confirm('Deseja realmente excluir o produto <%= p.getId()%> (<%= p.getNome() %>) ?')">
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
