<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>
<header>
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="${pageContext.request.contextPath}/login">Zaloguj</a></li>
            <li class="highlighted"><a href="${pageContext.request.contextPath}/register">Załóż konto</a></li>
        </ul>

        <ul>
            <li><a href="${pageContext.request.contextPath}/#start" class="btn btn--without-border">Start</a></li>
            <li><a href="${pageContext.request.contextPath}/#steps" class="btn btn--without-border">O co chodzi?</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/#about" class="btn btn--without-border">O nas</a></li>
            <li><a href="${pageContext.request.contextPath}/#fundations" class="btn btn--without-border">Fundacje i
                organizacje</a></li>
            <li><a href="${pageContext.request.contextPath}/#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
</header>

<div class="form--steps-instructions">
    <div class="form--steps-container">
        <p data-step="1" class="active">
        <h1>Podaj swój adres email i hasło</h1>
        </p>
    </div>
</div>

<section class="login-page">
    <h2>Zaloguj się</h2>
    <form method="post">
        <div class="form-group">
            <input type="email" name="inputEmail" value="${email}" placeholder="Email"/>
        </div>
        <div class="form-group">
            <input type="password" name="inputPassword" value="${password}" placeholder="Hasło"/>
            <a href="${pageContext.request.contextPath}/remind"
               class="btn btn--small btn--without-border reset-password">Zapomniałem hasła</a>
        </div>

        <c:if test="${emptyError==true}">
            <p class="alert"> Wypełnij wszystkie pola !</p>
        </c:if>

        <c:if test="${loginError==true}">
            <p class="alert"> Niepoprawny email lub hasło !</p>
        </c:if>

        <div class="form-group form-group--buttons">
            <a href="${pageContext.request.contextPath}/register" class="btn btn--without-border">Załóż konto</a>
            <button class="btn" type="submit">Zaloguj się</button>
        </div>
    </form>
</section>
</body>
</html>
