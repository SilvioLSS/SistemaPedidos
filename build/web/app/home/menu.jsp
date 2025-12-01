        <%

            String usuarioLogado = (String) session.getAttribute("usuario");

            if (usuarioLogado == null) {
                response.sendRedirect(request.getContextPath() + "/home/login.jsp");
            }

        %>

        <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
            <div class="container">
                <a class="navbar-brand" href="<%= request.getContextPath()%>/app/home/home.jsp">Gerenciador de Pedidos</a>

                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ms-auto">

                        <li class="nav-item"><a class="nav-link" href="#">Pedidos</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath()%>/app/produtos/produtos.jsp">Produtos</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath()%>/app/clientes/clientes.jsp">Clientes</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath()%>/app/receitas/financas.jsp">Receitas</a></li>

                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/home?task=logout">
                                Logout, <%= session.getAttribute("usuario")%>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
