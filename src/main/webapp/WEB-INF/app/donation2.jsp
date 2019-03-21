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
<%@include file="userHeader.jsp" %>

    <section class="form--steps">
        <div class="form--steps-instructions">
            <div class="form--steps-container">
                <h3>Ważne!</h3>
                <p data-step="2" class="active">
                    Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                    wiedzieć komu najlepiej je przekazać.
                </p>
            </div>
        </div>

        <div class="form--steps-container">
            <div class="form--steps-counter">Krok <span>2</span>/5</div>

            <form method="post">
                <!-- STEP 2 -->
                <div data-step="2" class="active">
                    <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                    <div class="form-group form-group--inline">

                        <label>
                            Liczba 60l worków:
                            <c:if test="${selectedNumberOfBags==null}">
                                <input type="number" name="chooseBags" value="1" step="1" required min="1"/></c:if>
                            <c:if test="${selectedNumberOfBags!=null}">
                            <input type="number" name="chooseBags" value="${selectedNumberOfBags}" step="1" required min="1"/></c:if>
                        </label>
                    </div>

                    <div>
                        <a href="${pageContext.request.contextPath}/donation/add/1" class="btn">Powrót</a>
                        <button class="btn" type="submit">Dalej</button>
                    </div>
                </div>
            </form>
        </div>
    </section>

</body>
</html>
