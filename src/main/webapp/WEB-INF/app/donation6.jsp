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

            <form method="post">
                <!-- STEP 6 -->
                <div data-step="6" class="active">
                    <h3>Podsumowanie Twojej darowizny</h3>

                    <h1>
                    <form:form method="post" modelAttribute="donation">

                        Instytucja: <form:input path="institution.name"/><br>
                        Profil: <form:input path="profile.name"/>
                        <hr>
                    </h1>

                        <h3>Dane miejsca odbioru</h3>

                    <h1>
                        Liczba worków: <form:input path="numberOfBags"/><br>
                        Ulica i nr domu: <form:input path="address"/><br>
                        Kod: <form:input path="zip"/><br>
                        Miasto: <form:input path="city"/><br>
                        Telefon: <form:input path="phone"/><br>
                        Data odbioru: <form:input path="pickupDate"/><br>
                        Czas odbioru: <form:input path="pickupTime"/><br>
                        Uwagi dla kuriera: <form:input path="info"/>
                    </h1>


                    </form:form>

                    <div>
                        <a href="${pageContext.request.contextPath}/donation/add/5" class="btn">Powrót</a>
                        <button class="btn" type="submit">Dalej</button>
                    </div>
                </div>
            </form>
        </div>
    </section>

</body>
</html>
