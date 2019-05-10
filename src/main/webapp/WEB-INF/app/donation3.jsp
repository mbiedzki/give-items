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
            <p data-step="3" class="active">
                Możesz wybrać lokalizację w której chcesz przekazać
                dary oraz grupę docelową, którą chcesz obdarować.
                Na następnej stronie wyświetlimy listę organizacji spełniających Twoje kryteria.
                Jeżeli niczego nie zaznaczysz to wyświetlimy listę wszystkih organizacji.
            </p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>3</span>/5</div>

        <form method="post">
            <!-- STEP 3 -->
            <div data-step="3" class="active">
                <h3>Lokalizacja:</h3>
                <h1>
                    <select name="chooseLocation" style="width: 80%" size="4" required>
                        <c:forEach items="${locations}" var="location">
                            <option value="${location.id}"  <c:if test="${location.id==selectedLocationId}">
                                selected</c:if>   >${location.name}</option>
                        </c:forEach>
                    </select>
                </h1>
                <h3>Grupa docelowa:</h3>
                <h1>
                    <select name="chooseProfile" style="width: 80%" size="4" required>
                        <c:forEach items="${profiles}" var="profile">
                            <option value="${profile.id}"  <c:if test="${profile.id==selectedProfileId}">
                                selected</c:if>   >${profile.name}</option>
                        </c:forEach>
                    </select>
                </h1>
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
