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
                <p data-step="5" class="active">Podaj adres oraz termin odbioru rzeczy.</p>
            </div>
        </div>

        <div class="form--steps-container">
            <div class="form--steps-counter">Krok <span>5</span>/5</div>

            <form method="post">
                <!-- STEP 5 -->
                <div data-step="5" class="active">
                    <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru</h4>
                            <div class="form-group form-group--inline">
                                <label> Ulica <input type="text" name="address" /> </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label> Miasto <input type="text" name="city" /> </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label>
                                    Kod pocztowy <input type="text" name="postcode" />
                                </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label>
                                    Numer telefonu <input type="phone" name="phone" />
                                </label>
                            </div>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru</h4>
                            <div class="form-group form-group--inline">
                                <label> Data <input type="date" name="data" /> </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label> Godzina <input type="time" name="time" /> </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label>
                                    Uwagi dla kuriera
                                    <textarea name="more_info" rows="5"></textarea>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/donation/add/4" class="btn">Powrót</a>
                        <button class="btn" type="submit">Dalej</button>
                    </div>
                </div>



            </form>
        </div>
    </section>

</body>
</html>