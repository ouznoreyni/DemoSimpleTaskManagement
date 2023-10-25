<%--
  Created by IntelliJ IDEA.
  User: ousmanediop
  Date: 24/10/2023
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.noreyni.gestiontache.entity.Task" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = "";
    var task = (Task)request.getAttribute("task");
    if (task.getDeadline() != null) {
        formattedDate = dateFormat.format(task.getDeadline());
    }

    Map<String, String> statusClassMap = new HashMap<>();
    statusClassMap.put("À FAIRE", "badge bg-primary");
    statusClassMap.put("EN COURS", "badge bg-warning text-dark");
    statusClassMap.put("TERMINÉ", "badge bg-success");
%>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/includes/styles.jsp" />
</head>
<body>
<jsp:include page="/includes/nav.jsp"/>
<div class="container mt-5">
    <h1>Details une tache</h1>
    <div class="my-5">
        <a href="${pageContext.request.contextPath}/tasks" class="btn btn-primary">Liste des taches</a>
    </div>
    <div class="card" style="width: 18rem;">
        <div class="card-body">
            <h5 class="card-title">${task.title}</h5>
            <p class="card-text">${task.description}</p>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">Status:   <% String status = task.getStatus(); %>
                <span class="<%= statusClassMap.get(status) %>">
                            <%= task.getStatus() %>
                        </span></li>
            <li class="list-group-item">Date d'échéance: <% if (task.getDeadline() != null) { %>
                <%= dateFormat.format(task.getDeadline()) %>
                <% } else { %>
                N/A
                <% } %></li>
        </ul>
        <div class="card-body">
            <a  href="${pageContext.request.contextPath}/tasks?action=edit&id=<%=task.getId()%>" class="card-link">
                <i class="fas fa-edit"></i>

            </a>
            <a  href="${pageContext.request.contextPath}/tasks?action=delete&id=<%=task.getId()%>" class="card-link  btn-danger"><i class="far fa-trash-alt"></i>
            </a>
        </div>
    </div>
</div>
<jsp:include page="/includes/scripts.jsp" />
</body>
</html>