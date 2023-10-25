<%--
  Created by IntelliJ IDEA.
  User: ousmanediop
  Date: 24/10/2023
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.noreyni.gestiontache.entity.Task" %>
<%
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
  String formattedDate = "";
  var task = (Task)request.getAttribute("task");
  if (task.getDeadline() != null) {
    formattedDate = dateFormat.format(task.getDeadline());
  }
%>

<html>
<head>
  <title>Title</title>
  <jsp:include page="/includes/styles.jsp" />
</head>
<body>
<jsp:include page="/includes/nav.jsp"/>
<div class="container mt-5">
  <h1>Modifier la tache: ${task.title}</h1>
  <div class="my-5">
    <a href="${pageContext.request.contextPath}/tasks" class="btn btn-primary">Liste des taches</a>
  </div>

  <form  action="${pageContext.request.contextPath}/tasks" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${task.id}">
    <div class="form-group">
      <label for="title">Titre</label> <!-- Changed to French -->
      <input type="text" class="form-control" name="title" value="${task.title}">
    </div>
    <div class="form-group">
      <label for="description">Description</label> <!-- Remains in English -->
      <input type="text" class="form-control" name="description" value="${task.description}">
    </div>
    <div class="form-group">
      <label for="status">Statut</label> <!-- Changed to French -->
      <select class="form-control" name="status">
        <option value="À FAIRE" ${task.status.equals("À FAIRE") ? "selected" : ""}>À FAIRE</option>
        <option value="EN COURS" ${task.status.equals("EN COURS") ? "selected" : ""}>EN COURS</option>
        <option value="TERMINÉ" ${task.status.equals("TERMINÉ") ? "selected" : ""}>TERMINÉ</option>
      </select>
    </div>
    <div class="form-group">
      <label for="deadline">Date limite</label> <!-- Changed to French -->
      <input type="date" class="form-control" name="deadline" value="<%= formattedDate %>">
    </div>
    <button type="submit" class="btn btn-primary">Mettre à jour</button> <!-- Changed to French -->
  </form>

</div>
<jsp:include page="/includes/scripts.jsp" />
</body>
</html>