<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Início - Sistema Gerenciador de Pedidos</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Sansation&family=Space+Mono&family=Tomorrow:wght@500&display=swap');

            body {
                background-color: #151515;
                color: #e0e0e0;
                font-family: 'Poppins', sans-serif;
                min-height: 100vh;
            }

            /* NAVBAR */
            .navbar-custom {
                background-color: #1e1e1e;
                border-bottom: 1px solid #2a2a2a;
            }

            .navbar-brand {
                color: #3a24d9 !important;
                font-family: "Tomorrow", sans-serif;
                font-weight: 500;
                letter-spacing: 1px;
            }

            .nav-link {
                color: #cfcfcf !important;
                font-family: "Sansation", sans-serif;
                font-size: 1.05rem;
                transition: 0.2s;
            }

            .nav-link:hover {
                color: #4b33ff !important;
                transform: scale(1.05);
            }

            /* CONTEÚDO */
            .content {
                margin-top: 80px;
                text-align: center;
                padding: 20px;
            }

            h1 {
                color: #3a24d9;
                font-family: "Tomorrow", sans-serif;
                font-weight: 500;
            }

            p {
                font-family: "Space Mono", monospace;
                color: #cfcfcf;
            }

            /* CARDS DO MENU */
            .menu-container {
                margin-top: 40px;
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                gap: 25px;
            }

            .menu-card {
                width: 220px;
                height: 160px;
                background-color: #1e1e1e;
                border-radius: 14px;
                padding: 25px;
                text-align: center;
                transition: 0.25s;
                cursor: pointer;
                box-shadow: 0 0 10px rgba(0,0,0,0.4);
            }

            .menu-card:hover {
                transform: scale(1.06);
                background-color: #242424;
            }

            .menu-card h3 {
                font-family: "Sansation", sans-serif;
                color: #ffffff;
                margin-top: 20px;
                font-size: 1.3rem;
            }

            footer {
                text-align: center;
                color: #888;
                margin-top: 50px;
                padding: 20px;
            }
        </style>
    </head>
    <body>

        <%

            String usuarioLogado = (String) session.getAttribute("usuario");

            if (usuarioLogado == null){
                response.sendRedirect(request.getContextPath() + "/home/login.jsp");
            }

        %>

        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">Gerenciador de Pedidos</a>

                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ms-auto">

                        <li class="nav-item"><a class="nav-link" href="#">Pedidos</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Produtos</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Clientes</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Receitas</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/home?task=logout">Logout <%= usuarioLogado %></a></li>


                    </ul>
                </div>
            </div>
        </nav>

        <!-- CONTEÚDO PRINCIPAL -->
        <div class="content">
            <h1>Bem-vindo ao Sistema</h1>
            <p>Escolha uma das opções abaixo para começar.</p>

            <div class="menu-container">

                <div onclick="location.href = '#'" class="menu-card">
                    <h3>Pedidos</h3>
                </div>

                <div onclick="location.href = '#'" class="menu-card">
                    <h3>Produtos</h3>
                </div>

                <div onclick="location.href = '#'" class="menu-card">
                    <h3>Clientes</h3>
                </div>

                <div onclick="location.href = '#'" class="menu-card">
                    <h3>Receitas</h3>
                </div>

            </div>
        </div>

        <footer>
            &copy; 2025 - Sistema Gerenciador de Pedidos.
        </footer>

    </body>
</html>
