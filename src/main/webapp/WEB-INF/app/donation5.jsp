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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/datepicker.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/timepicker.min.css"/>
</head>
<body>
<script>
    document.addEventListener("DOMContentLoaded", function(event)
    {
        timepicker.load({
            interval: 60,
            defaultHour: 9,
        });
    });
</script>
<header>
    <nav class="container container--70">
        <ul>
            <li><a href="#" class="btn btn--without-border">Witaj ${fullName}</a></li>
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
                    <h3>Podaj adres oraz termin odbioru rzeczy przez kuriera:</h3>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru</h4>
                            <div class="form-group form-group--inline">
                                <label> Ulica, numer domu i mieszkania<input type="text" name="selAddress" value="${selectedAddress}" required/> </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label> Miasto <input type="text" name="selCity" value="${selectedCity}" required/> </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label>
                                    Kod pocztowy <input type="text" name="selZip" value="${selectedZip}" required pattern="\d{2}-\d{3}" placeholder="xx-xxx"/>
                                </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label>
                                    Numer telefonu <input type="phone" name="selPhone" value="${selectedPhone}" required pattern="^\d{9}" placeholder="XXXXXXXXX"/>
                                </label>
                            </div>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru</h4>
                            <div class="form-group form-group--inline">
                                <label> Data <input type="text" required class="datepicker" value="${selectedDate}" name="selDate"/> </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label> Godzina <input type="text" required name="selTime" value="${selectedTime}" data-toggle="timepicker"/> </label>
                            </div>

                            <div class="form-group form-group--inline">
                                <label>
                                    Uwagi dla kuriera <input type="text" name="selInfo" value="${selectedInfo}" size="25">
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

<script src="${pageContext.request.contextPath}/resources/js/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/timepicker.min.js"></script>
</body>
</html>
