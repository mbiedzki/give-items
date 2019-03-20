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
            <li><a href="${pageContext.request.contextPath}/#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="${pageContext.request.contextPath}/#about" class="btn btn--without-border">O nas</a></li>
            <li><a href="${pageContext.request.contextPath}/#fundations" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="${pageContext.request.contextPath}/#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
</header>

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


<%--<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form>
            <div class="form-group form-group--50">
                <input type="text" name="name" placeholder="Imię"/>
            </div>
            <div class="form-group form-group--50">
                <input type="text" name="surname" placeholder="Nazwisko"/>
            </div>

            <div class="form-group">
            <textarea
                    name="message"
                    placeholder="Wiadomość"
                    rows="1"
            ></textarea>
            </div>

            <button class="btn" type="submit">Wyślij</button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"
            ><img src="${pageContext.request.contextPath}/resources/images/icon-facebook.svg"
            /></a>
            <a href="#" class="btn btn--small"
            ><img src="${pageContext.request.contextPath}/resources/images/icon-instagram.svg"
            /></a>
        </div>
    </div>
</footer>--%>
</body>
</html>
