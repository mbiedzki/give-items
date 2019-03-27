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

<header class="header--main-page" id="start">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="${pageContext.request.contextPath}/login"
                   class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="${pageContext.request.contextPath}/register" class="btn btn--small btn--highlighted">Załóż
                konto</a></li>
        </ul>

        <ul>
            <li><a href="${pageContext.request.contextPath}/#start" class="btn btn--without-border active">Start</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/#steps" class="btn btn--without-border">O co chodzi?</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/#about" class="btn btn--without-border">O nas</a></li>
            <li><a href="${pageContext.request.contextPath}/#fundations" class="btn btn--without-border">Fundacje i
                organizacje</a></li>
            <li><a href="${pageContext.request.contextPath}/#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>




    <div class="slogan container container--90">
        <div class="slogan--item">
            <h2>
                ${donatedBags} oddanych worków,
                ${donatedInstitutions} wsparte organizacje !
            </h2>
            <h1>
                Zacznij pomagać!<br/>
                Oddaj niechciane rzeczy w zaufane ręce
            </h1>

            <ul class="slogan--buttons">
                <li><a href="${pageContext.request.contextPath}/login" class="btn btn--large">Oddaj rzeczy</a></li>
            </ul>

        </div>
    </div>
</header>



<section class="steps" id="steps">
    <h2>Wystarczą 4 proste kroki</h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3>Wybierz rzeczy</h3>
            <p>ubrania, zabawki, sprzęt i inne</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3>Spakuj je</h3>
            <p>skorzystaj z worków na śmieci</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3>Zdecyduj komu chcesz pomóc</h3>
            <p>wybierz zaufane miejsce</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3>Zamów kuriera</h3>
            <p>kurier przyjedzie w dogodnym terminie</p>
        </div>
    </div>

    <a href="${pageContext.request.contextPath}/register" class="btn btn--large">Załóż konto</a>
</section>

<section class="about-us" id="about">
    <div class="about-us--text">
        <h2>O nas</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero
            optio esse quisquam illo omnis.</p>
        <img src="${pageContext.request.contextPath}/resources/images/signature.svg" class="about-us--text-signature"
             alt="Signature"/>
    </div>
    <div class="about-us--image"><img src="${pageContext.request.contextPath}/resources//images/about-us.jpg"
                                      alt="People in circle"/></div>
</section>

<section class="help" id="fundations">
    <h2>Komu pomagamy?</h2>

    <div class="help--slides active" data-id="1">
        <p>W naszej bazie znajdziesz listę zweryfikowanych Fundacji, <br>z którymi współpracujemy.</p>

        <ul class="help--slides-items">
            <c:forEach items="${institutions}" var="institution">
                <li>
                    <div class="col">
                        <div class="title">${institution.name}</div>
                        <div class="subtitle"></div>
                    </div>
                    <div class="col">
                        <div class="text">${institution.description}</div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</section>

<footer>
    <div class="contact" id="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form method="post" class="form--contact">
            <div class="form-group form-group--50"><input type="text" name="messageFullName"
                                                          placeholder="Imię i Nazwisko"/></div>
            <div class="form-group form-group--50"><input type="email" name="messageEmail" placeholder="Adres email"/>
            </div>

            <div class="form-group"><textarea name="messageText" placeholder="Wiadomość" rows="1"></textarea></div>

            <button class="btn" type="submit">Wyślij</button>
        </form>

        <c:if test="${emptyError==true}">
            <p class="alert"> Wypełnij wszystkie pola !</p>
        </c:if>

        <c:if test="${emailSent==true}">
            <br>
            <div class="form--steps-instructions">
                <div class="form--steps-container">
                    <p class="active">
                    <h1>Twoja wiadomość została wysłana, postaramy się odpowiedzieć tak szybko jak to możliwe !</h1>
                    </p>
                </div>
            </div>
        </c:if>

    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"><img
                    src="${pageContext.request.contextPath}/resources/images/icon-facebook.svg"/></a> <a href="#"
                                                                                                         class="btn btn--small"><img
                src="${pageContext.request.contextPath}/resources/images/icon-instagram.svg"/></a>
        </div>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
</body>
</html>
