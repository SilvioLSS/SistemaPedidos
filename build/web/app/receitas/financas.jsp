<%@page import="java.util.ArrayList"%>
<%@page import="model.Despesa"%>
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
        <% ArrayList<Despesa> dados = new Despesa().getAllTableEntities();%>

        <div class="container mt-4">

            <div class="text-center">
                <h2 class="page-title">Finanças</h2>

                <a href="<%= request.getContextPath()%>/app/receitas/formDespesas.jsp" 
                   class="btn btn-secondary-custom">
                    Cadastrar Nova Despesa
                </a>

            </div>

            <table class="tabela mt-4">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Data</th>
                    <th>Valor</th>
                    <th></th>
                    <th></th>                    
                </tr>

                <% for (Despesa d : dados) {
                    if ( usuarioLogado.equals(d.getUsuarios_nome_usuario()) ){%>
                        <tr>
                            <td><%= d.getId()%></td>
                            <td><%= d.getNome()%></td>
                            <td><%= d.getData_compra()%></td>
                            <td><%= d.getValor_total()%></td>
                            <td>
                                <a href="<%= request.getContextPath()  %>/app/receitas/formDespesas.jsp?action=update&id=<%= d.getId()%>">
                                    <img src="<%= request.getContextPath()%>/app/img/editar.png">
                                </a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath()%>/home?action=delete&id=<%= d.getId()%>&task=despesa" onclick="return confirm('Deseja realmente excluir a despesa <%= d.getId()%> (<%= d.getNome() %>) ?')">
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
