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

                    <div class="summary">
                        <div class="form-section">
                            <h4>Oddajesz:</h4>
                            <ul>
                                <li>
                                    <span class="icon icon-bag"></span>
                                    <span class="summary--text"
                                    >4 worki ubrań w dobrym stanie dla dzieci</span
                                    >
                                </li>

                                <li>
                                    <span class="icon icon-hand"></span>
                                    <span class="summary--text"
                                    >Dla fundacji "Mam marzenie" w Warszawie</span
                                    >
                                </li>
                            </ul>
                        </div>

                        <div class="form-section form-section--columns">
                            <div class="form-section--column">
                                <h4>Adres odbioru:</h4>
                                <ul>
                                    <li>Prosta 51</li>
                                    <li>Warszawa</li>
                                    <li>99-098</li>
                                    <li>123 456 789</li>
                                </ul>
                            </div>

                            <div class="form-section--column">
                                <h4>Termin odbioru:</h4>
                                <ul>
                                    <li>13/12/2018</li>
                                    <li>15:40</li>
                                    <li>Brak uwag</li>
                                </ul>
                            </div>
                        </div>
                    </div>

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