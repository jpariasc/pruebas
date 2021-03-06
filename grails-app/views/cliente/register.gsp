<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 31/10/2015
  Time: 10:57 AM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="UTF-8">
    <link rel="icon" href="http://unal.edu.co/fileadmin/templates/favicon.ico">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="estilos.css"/>
    <asset:stylesheet src="loginStyle.css"/>
    <asset:stylesheet src="fontello.css"/>
    <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
    <title>Registrate en Semáforo</title>
</head>
<body>
<header>
    <div class="container">
        <h1 class="icon-semaforo">Semáforo</h1><!-- BARRA DE MENU (CONSOLIDADA) -->
        <input type="checkbox" id="menu-bar">
        <label class="icon-menu" for="menu-bar"></label>

        <nav class="menu">
            <a href="${createLink(uri: '/')}">Inicio</a>
            <a href="${createLink(uri: '/whoWeAre')}">¿Quienes Somos?</a>
            <a href="${createLink(uri: '/equipo')}">Equipo</a>
            <g:if test="${session.cliente}" >
                <li><a href="#">${session.cliente.nombre}</a>
                    <ul>
                        <li><a href="">Mi perfil</a></li>
                        <li><a href="">Configuración</a></li>
                        <li><g:link controller="cliente" action ="logout">Salir</g:link></li>
                    </ul>
                </li>
            </g:if>

            <g:else>
                <a href="${createLink(uri: '/ingresar')}">Login</a>
            </g:else>
        </nav>

    </div>
</header>



<div id="create-cliente" class="content scaffold-create" role="main">
    <g:if test="${session.cliente}">
        <g:if test="${flash.message}">
            <div class="alert alert-danger" role="alert">
            <div class="message" role="status">${flash.message}</div>
            </div>
        </g:if>
    </g:if>
    <g:else>
        <br><br><br><br><br><br>
        <div class="container">

                <h3 class="form-4">Formulario Creación cuenta de usuario</h3>
                <g:form  url="[resource:clienteInstance, action:'registerLogin']" class="form-4">

                    <g:render template="form"/>
                    <br>
                    %{--<g:submitButton class="form-4" id="regButton" name="create"  value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
                    <g:submitButton class="form-4" id="regButton" name="create"  value="Registrarse" />
                    <a class="btn btn-default" href="${createLink(uri: '/')}">Volver</a>
                </g:form>
        </div>


    </g:else>
    <!--<g:hasErrors bean="${clienteInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${clienteInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>-->
</div>


    <br><br><br><br>
<div class="container" id="foot">
    <h6 class="copy">Semáforo &copy; 2015</h6>
    <div class="sociales">
        <a class="icon-fb" href="#"></a>
        <a class="icon-twitter" href="#"></a>
        <a class="icon-gp" href="#"></a>
    </div>
    <br><br><br>
</div>

<script>
    <g:hasErrors bean="${clienteInstance}">
    <g:eachError bean="${clienteInstance}" var="error">
    document.querySelector(".error.${error.field}").innerHTML = '<g:message error="${error}"/>';
    </g:eachError>
    </g:hasErrors>

</script>
</body>
</html>