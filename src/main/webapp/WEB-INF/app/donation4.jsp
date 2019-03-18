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
                <p data-step="4" class="active">
                    Na podstawie Twoich kryteriów oraz rzeczy, które masz do oddania
                    wybraliśmy organizacje, którym możesz pomóc. Wybierz jedną, do
                    której trafi Twoja przesyłka.
                </p>
            </div>
        </div>

        <div class="form--steps-container">
            <div class="form--steps-counter">Krok <span>4</span>/5</div>

            <form method="post">
                <!-- STEP 4 -->
                <div data-step="4" class="active">
                    <h3>Wybierz organizację, której chcesz pomóc:</h3>

                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="radio" name="organization" value="old" />
                            <span class="checkbox radio"></span>
                            <span class="description">
                  <div class="title">Fundacja “Bez domu”</div>
                  <div class="subtitle">
                    Cel i misja: Pomoc dla osób nie posiadających miejsca
                    zamieszkania
                  </div>
                </span>
                        </label>
                    </div>

                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="radio" name="organization" value="old" />
                            <span class="checkbox radio"></span>
                            <span class="description">
                  <div class="title">Fundacja “Dla dzieci"</div>
                  <div class="subtitle">
                    Cel i misja: Pomoc osobom znajdującym się w trudnej sytuacji
                    życiowej.
                  </div>
                </span>
                        </label>
                    </div>

                    <div>
                        <a href="${pageContext.request.contextPath}/donation/add/3" class="btn">Powrót</a>
                        <button class="btn" type="submit">Dalej</button>
                    </div>
                </div>

            </form>
        </div>
    </section>

</body>
</html>
