<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <nav class="container container--70">
        <ul>
            <li><a href="#" class="btn btn--without-border">Witaj ${fullName}</a></li>
            <li><a href="${pageContext.request.contextPath}/user/edit" class="btn btn--without-border">Mój profil</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/user/donations" class="btn btn--without-border">Moje
                darowizny</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/logout" class="btn btn--without-border">Wyloguj</a></li>
        </ul>
    </nav>
</header>