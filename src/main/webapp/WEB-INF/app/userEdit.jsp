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

</header>
<div class="form--steps-instructions">
    <div class="form--steps-container">
        <p data-step="1" class="active">
        <h1>Możesz zmienić email, imię i nazwisko, albo podać nowe hasło</h1>
        </p>
    </div>
</div>
<section class="login-page">
    <h2>Twój profil</h2>
    <form method="post">
        <div class="form-group">
            <input type="email" name="email" value="${email}" placeholder="Email"/>
        </div>
        <div class="form-group">
            <input type="text" name="fullName" value="${fullName}" placeholder="Imię i nazwisko"/>
        </div>
        <div class="form-group">
            <input type="password" name="password" value="${password}" placeholder="Nowe hasło"/>
        </div>
        <div class="form-group">
            <input type="password" name="password2" value="${password2}" placeholder="Powtórz nowe hasło"/>
        </div>

        <c:if test="${emptyError==true}">
            <p class="alert"> Wypełnij imię i nazwisko oraz email !</p>
        </c:if>

        <c:if test="${passwordError==true}">
            <p class="alert"> Podane hasła nie są takie same !</p>
        </c:if>

        <c:if test="${duplicateEmailError==true}">
            <p class="alert"> Podany email występuje już w bazie danych !</p>
        </c:if>

        <div class="form-group form-group--buttons">
            <a href="${pageContext.request.contextPath}/donation/add/1" class="btn btn--without-border">Powrót</a>
            <button class="btn" type="submit">Zapisz zmiany</button>
        </div>
    </form>
</section>

</body>
</html>
