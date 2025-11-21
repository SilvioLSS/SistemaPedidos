<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Sistema Gerenciador de Pedidos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/app/style/cadastro.css"/>
</head>
<body>
    
    <%

        String msg = (String) request.getAttribute("msg");
        if (msg != null) {%>
            <script>
                alert("<%= msg%>");
            </script>
    <%        
        }
    %>

<div class="form-container">
    <h2>Cadastro</h2>

    <form action="<%= request.getContextPath()  %>/home?task=cadastro" method="POST">
        <div class="mb-3">
            <label class="form-label">Nome de Usuário</label>
            <input type="text" name="usuario" class="form-control" placeholder="Digite aqui o seu nome de usuário:" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Senha</label>
            <input type="password" name="senha" class="form-control" placeholder="Digite aqui a sua senha:" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Confirme sua Senha</label>
            <input type="password" name="confirmarSenha" class="form-control" placeholder="Confirme aqui a sua senha:" required>
        </div>

        <button type="submit" class="btn btn-secondary-custom w-100 mt-2">Cadastrar</button>

        <p class="mt-3 text-center">
            Já possui conta? <a href="<%= request.getContextPath()%>/app/home/login.jsp">Faça login</a>
        </p>
    </form>
</div>

</body>
</html>
