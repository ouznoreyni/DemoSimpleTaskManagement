<%--
  Created by IntelliJ IDEA.
  User: ousmanediop
  Date: 24/10/2023
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page import="com.noreyni.gestiontache.entity.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%-- Get the tasks from the request attribute --%>
<%
    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    Map<String, String> statusClassMap = new HashMap<>();
    statusClassMap.put("À FAIRE", "badge bg-primary");
    statusClassMap.put("EN COURS", "badge bg-warning text-dark");
    statusClassMap.put("TERMINÉ", "badge bg-success");

%>

<html>
<head>
    <style>
        .table-container {

        }
    </style>
    <title>Liste des Taches</title>
    <jsp:include page="/includes/styles.jsp"/>
</head>
<body>
<jsp:include page="/includes/nav.jsp"/>
<div class="container mt-5 margin_container">
    <h1>La Liste des Taches</h1>
    <div>
        <div class="col-12">
            <table class="table table-bordered text-center">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Titre</th>
                    <th scope="col">Description</th>
                    <th scope="col">Date d'échéance</th>
                    <th scope="col">Status</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <%
                    if (tasks != null && !tasks.isEmpty()) {

                %>
                <tbody>
                <% for (Task task : tasks) { %>
                <tr>
                    <th scope="row"><%= task.getId() %>
                    </th>
                    <td><%= task.getTitle() %>
                    </td>
                    <td><%= task.getDescription() %>
                    </td>
                    <td><% if (task.getDeadline() != null) { %>
                        <%= dateFormat.format(task.getDeadline()) %>
                        <% } else { %>
                        N/A
                        <% } %></td>
                    <td>
                            <% String status = task.getStatus(); %>
                        <span class="<%= statusClassMap.get(status) %>">
                            <%= task.getStatus() %>
                        </span>
                    <td>
                        <a href="${pageContext.request.contextPath}/tasks?action=details&id=<%=task.getId()%>"
                           class="btn btn-primary"><i class="far fa-eye"></i></a>
                        <a href="${pageContext.request.contextPath}/tasks?action=edit&id=<%=task.getId()%>"
                           class="btn btn-success"><i class="fas fa-edit"></i></a>
                        <a href="${pageContext.request.contextPath}/tasks?action=delete&id=<%=task.getId()%>"
                           class="btn btn-danger"><i class="far fa-trash-alt"></i></a>
                    </td>
                </tr>
                <% } %>

                </tbody>
            </table>
            <%

            } else {
            %>
            <div class="row">
                Il n'y pas de tache
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
<%--<div class="container mt-6 mb-6">
    <h1>La Liste des Taches</h1>
    <div class="my-5">
        <a href="${pageContext.request.contextPath}/tasks?action=create" class="btn btn-primary">Ajouter une tache</a>
    </div>
    <table class="table">
        <thead lass="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Titre</th>
            <th scope="col"></th>
            <th scope="col"></th>
            <th scope="col">Status</th>
            <th >action</th>
        </tr>
        </thead>
        <%
            if (tasks != null && !tasks.isEmpty()) {

        %>
        <tbody>
        <% for (Task task : tasks) { %>
        <tr>
            <td><%= task.getId() %>
            </td>
            <td><%= task.getTitle() %>
            </td>
            <td><%= task.getDescription() %>
            </td>
            <td>
                <% if (task.getDeadline() != null) { %>
                <%= dateFormat.format(task.getDeadline()) %>
                <% } else { %>
                N/A <!-- Or any other placeholder value you prefer -->
                <% } %>
            </td>
            <td><%= task.getStatus() %>
            </td>
            <td>
            <td>
                <a href="${pageContext.request.contextPath}/tasks?action=edit&id=<%=task.getId()%>"
                   class="btn btn-info">Modifier</a>
               &lt;%&ndash; <a href="${pageContext.request.contextPath}/tasks?action=details&id=<%=task.getId()%>"
                   class="btn btn-secondary">Détails</a>&ndash;%&gt;
                <a href="${pageContext.request.contextPath}/tasks?action=delete&id=<%=task.getId()%>"
                   class="btn btn-danger">supprimer</a>
            </td>
            </td>
        </tr>
        <% } %>

        </tbody>
    </table>
    <%

    } else {
    %>
    <div class="row">
        Il n'y pas de tache
    </div>
    <%
        }
    %>
</div>--%>

<jsp:include page="/includes/scripts.jsp"/>
</body>
</html>

