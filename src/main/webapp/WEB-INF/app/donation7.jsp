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


            <div data-step="7">
                <h2>
                    Dziękujemy za przesłanie formularza. Na maila prześlemy wszelkie
                    informacje o odbiorze.
                </h2>
            </div>
            </div>
        </div>
    </section>

<div align="center">
<h1> <a href="${pageContext.request.contextPath}/donation/add/1" class="btn">Kolejna darowizna ?</a></h1>
</div>

</body>
</html>
