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
        <h1>Podaj swój adres email, imię i nazwisko oraz hasło</h1>
        </p>
    </div>
</div>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form method="post">
        <div class="form-group">
            <input type="email" name="email" value="${email}" placeholder="Email"/>
        </div>
        <div class="form-group">
            <input type="text" name="fullName" value="${fullName}" placeholder="Imię i nazwisko"/>
        </div>
        <div class="form-group">
            <input type="password" name="password" value="${password}" placeholder="Hasło"/>
        </div>
        <div class="form-group">
            <input type="password" name="password2" value="${password2}" placeholder="Powtórz hasło"/>
        </div>

        <c:if test="${emptyError==true}">
            <p class="alert"> Wypełnij wszystkie pola !</p>
        </c:if>

        <c:if test="${passwordError==true}">
            <p class="alert"> Podane hasła nie są takie same !</p>
        </c:if>

        <c:if test="${duplicateEmailError==true}">
            <p class="alert"> Podany email występuje już w bazie danych !</p>
        </c:if>

        <div class="form-group form-group--buttons">
            <a href="${pageContext.request.contextPath}/login" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form>
</section>

</body>
</html>
