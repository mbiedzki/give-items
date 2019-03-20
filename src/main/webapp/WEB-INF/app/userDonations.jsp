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

</header>

<section class="login-page">
    <h2>Twoje darowizny</h2>

</section>


<div class="form--steps-container">
<h1>
<table>
    <thead>
    <tr class="form--steps-instructions">
        <td>Data odbioru</td>
        <td>Miasto</td>
        <td>Rodzaj rzeczy</td>
        <td>Dla kogo</td>
        <td>Instytucja</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userDonations}" var="donation">
        <tr>
            <td>
                    ${donation.pickupDate}
            </td>
            <td>
                    ${donation.city}
            </td>
            <td>
                <c:forEach items="${items}" var="item">
                    <c:if test="${item.id==donation.item.id}">${item.name}</c:if>
                </c:forEach>
            </td>
            <td>
                <c:forEach items="${profiles}" var="profile">
                <c:if test="${profile.id==donation.profile.id}">${profile.name}</c:if>
                </c:forEach></p>
            </td>
            <td>
                <c:forEach items="${institutions}" var="inst">
                    <c:if test="${inst.id==donation.institution}">${inst.name}</c:if>
                </c:forEach></p>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</h1>
    <div class="form-group form-group--buttons">
        <a href="${pageContext.request.contextPath}/donation/add/1" class="btn">Powrót</a>
    </div>
</div>

</body>
</html>