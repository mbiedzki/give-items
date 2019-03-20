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
            <c:if test="${noMatch==false}">
            <h3>Ważne!</h3>
            <p data-step="4" class="active">
                Na podstawie Twoich kryteriów oraz rzeczy, które masz do oddania
                wybraliśmy organizacje, którym możesz pomóc. Wybierz jedną, do
                której trafi Twoja przesyłka.
                </c:if>
                <c:if test="${noMatch==true}">
            <h3>Na podstawie Twoich kryteriów nie znaleźliźmy żadnej organizacji w naszej bazie danych.
                Podaj pozostałe dane, a my postaramy się znaleźć odpowiednią organizację - o wszystkim poinformujemy
                !</h3>
            </c:if>
            </p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>4</span>/5</div>


        <form method="post">
            <!-- STEP 4 -->
            <div data-step="4" class="active">

                <h3>Wybierz organizację, której chcesz pomóc:</h3>
                <h1>
                    <select name="chooseInstitution" size="4" required>
                        <c:if test="${noMatch==true}">
                            <option selected value="0" label="brak instytucji spełniającej kryteria"></option>
                        </c:if>

                        <c:if test="${noMatch==false}">
                            <c:forEach items="${institutions}" var="institution">
                                <option value="${institution.id}"
                                        <c:if test="${institution.id==selectedInstitutionId}">selected</c:if>
                                >${institution.name}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </h1>


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
