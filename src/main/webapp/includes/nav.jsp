<%--
  Created by IntelliJ IDEA.
  User: ousmanediop
  Date: 24/10/2023
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<nav class="navbar bg-dark border-bottom border-bod navbar-expand">
  <div class="container-fluid">
    <h1 class="navbar-brand text-light" >Gestion des taches- ISI</h1>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="ms-auto" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="${pageContext.request.contextPath}/tasks">Liste les taches</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="${pageContext.request.contextPath}/tasks?action=create">Ajouter une tache</a>
        </li>

      </ul>
    </div>
  </div>
</nav>