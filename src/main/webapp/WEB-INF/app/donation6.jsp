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
        <ul>
            <li><a href="#" class="btn btn--without-border">Witaj ${email}</a></li>
            <li><a href="${pageContext.request.contextPath}/#start" class="btn btn--without-border">Mój profil</a></li>
            <li><a href="${pageContext.request.contextPath}/#steps" class="btn btn--without-border">Moje zbiórki</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/#about" class="btn btn--without-border">Wyloguj</a></li>
        </ul>
    </nav>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="6" class="active">Sprawdź i potwierdź swoją darowiznę.</p>
        </div>
    </div>


    <div class="form--steps-container">
        <form:form method="post" modelAttribute="donation">
        <!-- STEP 6 -->
        <div data-step="6" class="active">
            <h3>Podsumowanie Twojej darowizny</h3>

            <div>
            <h1>
                <p>Instytucja: <form:input size="40" path="institution.name" readonly="true"/></p>
                <p>Profil: <form:input readonly="true" path="profile.name"/></p>
                <hr>
            </h1>
            </div>
            <h3>Dane miejsca odbioru</h3>

            <h1>
                Liczba worków: <form:input path="numberOfBags"/><br>
                Ulica i nr domu: <form:input path="address"/><br>
                Kod: <form:input path="zip"/><br>
                Miasto: <form:input path="city"/><br>
                Telefon: <form:input path="phone"/><br>
                Data odbioru: <form:input readonly="true" path="pickupDate"/><br>
                Czas odbioru: <form:input readonly="true" path="pickupTime"/><br>
                Uwagi dla kuriera: <form:input size="50" path="info"/>
            </h1>

            <div>
                <a href="${pageContext.request.contextPath}/donation/add/5" class="btn">Powrót</a>
                <button class="btn" type="submit">Potwierdzam darowiznę</button>
            </div>


        </div>
    </div>
    </form:form>
</section>

</body>
</html>
