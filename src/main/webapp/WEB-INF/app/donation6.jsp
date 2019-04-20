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
            <p data-step="6" class="active">Sprawdź i potwierdź swoją darowiznę.</p>
        </div>
    </div>


    <div class="form--steps-container">
        <form:form method="post" modelAttribute="donation">
        <!-- STEP 6 -->
        <div data-step="6" class="active">
            <h3>Podsumowanie Twojej darowizny</h3>

            <div>
            <h1>
                <p>Instytucja: <form:input size="3" path="institution" readonly="true"/>
                <c:forEach items="${institutions}" var="inst">
                    <c:if test="${inst.id==selectedInstitutionId}">${inst.name}</c:if>
                </c:forEach></p>
                <p>Profil: <form:input readonly="true" path="profile.name"/></p>
                <hr>
            </h1>
            </div>
            <h3>Dane dotyczące odbioru darowizny</h3>

            <h1>
                <span style='width: 25%; display: inline-block'>Liczba worków : </span><form:input cssStyle="width: 50%" path="numberOfBags"/><br>
                <span style='width: 25%; display: inline-block'>Ulica i nr domu: </span><form:input cssStyle="width: 50%" path="address"/><br>
                <span style='width: 25%; display: inline-block'>Kod : </span><form:input cssStyle="width: 50%" path="zip"/><br>
                <span style='width: 25%; display: inline-block'>Miasto: </span><form:input cssStyle="width: 50%" path="city"/><br>
                <span style='width: 25%; display: inline-block'>Telefon: </span><form:input cssStyle="width: 50%" path="phone"/><br>
                <span style='width: 25%; display: inline-block'>Data odbioru: </span><form:input readonly="true" cssStyle="width: 50%" path="pickupDate"/><br>
                <span style='width: 25%; display: inline-block'>Czas odbioru: </span><form:input readonly="true" cssStyle="width: 50%" path="pickupTime"/><br>
                <span style='width: 25%; display: inline-block'>Uwagi dla kuriera: </span><form:input size="50" cssStyle="width: 50%" path="info"/>
            </h1>

            <div>
                <a href="${pageContext.request.contextPath}/donation/add/5" class="btn">Powrót</a>
                <button class="btn" type="submit">Potwierdzam darowiznę</button>
            </div>


        </div>
    </div>
    </form:form>
</section>

</body>
</html>
