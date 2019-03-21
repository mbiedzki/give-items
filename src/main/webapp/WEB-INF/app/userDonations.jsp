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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css"/>
</head>
<body>
<header>

</header>

<section>
    <h2>Twoje darowizny</h2><br>

</section>


<div class="w3-container">

<table class="w3-table-all w3-border">
    <thead>
    <tr class="w3-amber w3-xlarge">
        <td>Data odbioru</td>
        <td>Miasto</td>
        <td>Rodzaj rzeczy</td>
        <td>Dla kogo</td>
        <td>Instytucja</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userDonations}" var="donation">
        <tr align="left">
            <td>${donation.pickupDate}</td>
            <td>${donation.city}</td>
            <td>${donation.item.name}</td>
            <td>${donation.profile.name}</td>
            <td>
                <c:forEach items="${institutions}" var="inst">
                    <c:if test="${inst.id==donation.institution}">${inst.name}</c:if>
                </c:forEach></p>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br>

        <a href="${pageContext.request.contextPath}/donation/add/1" class="btn w3-large">Powrót</a>

</div>

</body>
</html>