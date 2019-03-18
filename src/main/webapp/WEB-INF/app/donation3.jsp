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
                <p data-step="3" class="active">
                    Możesz wybrać lokalizację w której chcesz przekazać dary oraz grupę docelową, którą chcesz obdarować.
                    Na następnej stronie wyświetlimy listę organizacji spełniających Twoje kryteria.
                    Możesz też wybrać organizację z listy poniżej.
                </p>
            </div>
        </div>

        <div class="form--steps-container">
            <div class="form--steps-counter">Krok <span>3</span>/5</div>

            <form method="post">
                <!-- STEP 3 -->
                <div data-step="3" class="active">
                    <h3>Lokalizacja:</h3>

                    <div class="form-group form-group--dropdown">
                        <select name="localization">
                            <option value="0">- wybierz -</option>
                            <option value="warsaw">Warszawa</option>
                            <option value="wroclaw">Wrocław</option>
                            <option value="poznan">Poznań</option>
                            <option value="gdansk">Gdańsk</option>
                        </select>
                    </div>

                    <div class="form-section">
                        <h4>Komu chcesz pomóc?</h4>
                        <div class="form-section--checkboxes">
                            <div class="form-group form-group--checkbox">
                                <label>
                                    <input type="checkbox" name="help[]" value="children" />
                                    <span class="checkbox">dzieciom</span>
                                </label>
                            </div>

                            <div class="form-group form-group--checkbox">
                                <label>
                                    <input type="checkbox" name="help[]" value="mothers" />
                                    <span class="checkbox">samotnym matkom</span>
                                </label>
                            </div>

                            <div class="form-group form-group--checkbox">
                                <label>
                                    <input type="checkbox" name="help[]" value="homeless" />
                                    <span class="checkbox">bezdomnym</span>
                                </label>
                            </div>

                            <div class="form-group form-group--checkbox">
                                <label>
                                    <input type="checkbox" name="help[]" value="disabled" />
                                    <span class="checkbox">niepełnosprawnym</span>
                                </label>
                            </div>

                            <div class="form-group form-group--checkbox">
                                <label>
                                    <input type="checkbox" name="help[]" value="old" />
                                    <span class="checkbox">osobom starszym</span>
                                </label>
                            </div>
                        </div>
                    </div>


                    <div>
                        <a href="${pageContext.request.contextPath}/donation/add/2" class="btn">Powrót</a>
                        <button class="btn" type="submit">Dalej</button>
                    </div>
                </div>
            </form>
        </div>
    </section>

</body>
</html>
