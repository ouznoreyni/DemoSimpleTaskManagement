<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <jsp:include page="/includes/styles.jsp"/>
</head>
<body>
</h1>
<br/>
<div class="px-4 py-5 my-5 text-center">
    <img class="d-block mx-auto mb-4" src="https://www.groupeisi.com/wp-content/uploads/2018/11/LOGO-NEW-GROUP.jpg" alt="" width="72" height="57">
    <h1 class="display-5 fw-bold text-body-emphasis">Gestion des Taches</h1>
    <div class="col-lg-6 mx-auto">
        <p class="lead mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
            <a href="tasks" class="btn btn-primary btn-lg px-4 gap-3">Voir les Taches</a>
        </div>
    </div>
</div>
<jsp:include page="/includes/scripts.jsp" />
</body>
</html>