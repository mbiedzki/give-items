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
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/5</div>

        <form method="post">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Wybierz rodzaj rzeczy jakie chcesz oddać:<br></h3>
                <h1>
                    <select name="chooseItem" size="4" required>
                        <c:forEach items="${items}" var="item">
                        <option value="${item.id}"  <c:if test="${item.id==selectedItemId}">selected</c:if>   >${item.name}</option>
                        </c:forEach>
                    </select>
                </h1>
                <div>
                    <button class="btn" type="submit">Dalej</button>
                </div>
            </div>

        </form>
    </div>
</section>

</body>
</html>
