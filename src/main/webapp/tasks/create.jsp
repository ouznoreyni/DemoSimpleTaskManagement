<%--
  Created by IntelliJ IDEA.
  User: ousmanediop
  Date: 24/10/2023
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/includes/styles.jsp"/>
</head>
<body>
<jsp:include page="/includes/nav.jsp"/>
<div class="container mt-5">
    <h1>Ajouer une tache</h1>
    <div class="my-5">
        <a href="${pageContext.request.contextPath}/tasks" class="btn btn-primary">Liste des taches</a>
    </div>
    <form action="${pageContext.request.contextPath}/tasks" method="post" class="form-horizontal">

        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">Title</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="title" name="title">
            </div>
        </div>

        <div class="form-group">
            <label for="description" class="col-sm-2 control-label">Description</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="description" name="description"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label for="deadline" class="col-sm-2 control-label">Deadline</label>
            <div class="col-sm-10">
                <input type="date" class="form-control" id="deadline" name="deadline">
            </div>
        </div>

        <div class="form-group">
            <label for="status" class="col-sm-2 control-label">Status</label>
            <div class="col-sm-10">
                <select class="form-control" id="status" name="status">
                    <option value="À FAIRE">À FAIRE</option>
                    <option value="EN COURS">EN COURS</option>
                    <option value="TERMINÉ">TERMINÉ</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success">Ajouter une tache</button>
            </div>
        </div>

    </form>

</div>
<jsp:include page="/includes/scripts.jsp"/>
</body>
</html>