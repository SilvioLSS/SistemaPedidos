<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sistema Gerenciador de Pedidos</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Sansation&family=Space+Mono&family=Tomorrow:wght@500&display=swap');

            body {
                background-color: #151515;
                color: #e0e0e0;
                font-family: 'Poppins', sans-serif;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .container {
                text-align: center;
                max-width: 600px;
            }

            h1 {
                color: #3a24d9;
                font-weight: 700;
                margin-bottom: 20px;
                font-family: "Tomorrow", sans-serif;
                font-weight: 500;
                font-style: normal;
            }

            p {
                color: #cfcfcf;
                font-size: 1.1rem;
                margin-bottom: 40px;
                font-family: "Stack Sans Headline", sans-serif;
                font-family: "Space Mono", monospace;
                font-weight: 400;
                font-style: normal;
            }

            .btn-primary-custom {
                background-color: #3a24d9;
                border: none;
                transition: 0.2s;
                font-family: "Sansation", sans-serif;
                font-weight: 400;
                font-style: normal;
            }

            .btn-primary-custom:hover {
                background-color: #4b33ff;
                transform: scale(1.10)
            }

            .btn-secondary-custom {
                background-color: #1b6a18;
                border: none;
                transition: 0.2s;
                font-family: "Sansation", sans-serif;
                font-weight: 400;
                font-style: normal;
            }

            .btn-secondary-custom:hover {
                background-color: #268a23;
                transform: scale(1.10)
            }

            footer {
                position: absolute;
                bottom: 15px;
                width: 100%;
                text-align: center;
                font-size: 0.9rem;
                color: #999;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h1>Sistema Gerenciador de Pedidos</h1>
            <p>O lugar ideal para você gerenciar os seus pedidos de forma rápida e organizada.</p>
            <div class="d-flex justify-content-center gap-3 flex-wrap">
                <a href="#" class="btn btn-primary-custom px-4 py-2 text-white fw-semibold">Login</a>
                <a href="#" class="btn btn-secondary-custom px-4 py-2 text-white fw-semibold">Cadastre-se</a>
            </div>
        </div>

        <footer>
            &copy; 2025 - Sistema Gerenciador de Pedidos. Todos os direitos reservados.
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

