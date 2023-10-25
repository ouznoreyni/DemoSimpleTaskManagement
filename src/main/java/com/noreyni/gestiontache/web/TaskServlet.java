package com.noreyni.gestiontache.web;


import com.noreyni.gestiontache.entity.Task;
import com.noreyni.gestiontache.service.TaskService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@WebServlet(name = "tasks", value = "/tasks")
public class TaskServlet extends HttpServlet {
    private final TaskService taskService = new TaskService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "create":
                    request.getRequestDispatcher("/tasks/create.jsp").forward(request, response);
                    break;
                case "edit":
                    int taskToEditId = Integer.parseInt(request.getParameter("id"));
                    var taskToEdit = taskService.findById((long) taskToEditId);
                    request.setAttribute("task", taskToEdit);
                    request.getRequestDispatcher("/tasks/update.jsp").forward(request, response);
                    break;
                case "delete":
                    int taskIdToDelete = Integer.parseInt(request.getParameter("id"));
                    taskService.delete((long) taskIdToDelete);
                    response.sendRedirect(request.getContextPath() + "/tasks");
                    break;
                case "details":
                    int taskToRetrieveId = Integer.parseInt(request.getParameter("id"));
                    var taskRetrieved = taskService.findById((long) taskToRetrieveId);
                    request.setAttribute("task", taskRetrieved);
                    request.getRequestDispatcher("/tasks/details.jsp").forward(request, response);
                    break;

                default:
                    var tasks = taskService.findAll();
                    request.setAttribute("tasks", tasks);
                    request.getRequestDispatcher("/tasks/").forward(request, response);
            }
        } else {
            var tasks = taskService.findAll();
            request.setAttribute("tasks", tasks);
            // Forward to the task list JSP
            request.getRequestDispatcher("/tasks/").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("update")) {
            createOrUpdateTask(request, response, true);
        } else {
            createOrUpdateTask(request, response, false);
        }
    }

  //  @Override
/*    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        createOrUpdateTask(request, response, true);
    }*/

    private void createOrUpdateTask(HttpServletRequest request, HttpServletResponse response, boolean isUpdate) throws IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        Date deadline = null;
        try {
            deadline = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("deadline"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        Task task;
        if (isUpdate) {
            Long taskId = Long.parseLong(request.getParameter("id"));
            task = taskService.findById(taskId);
            if (task != null) {
                task.setTitle(title);
                task.setDescription(description);
                task.setStatus(status);
                task.setDeadline(deadline);
                taskService.update(task);
            }
        } else {
            task = new Task();
            task.setTitle(title);
            task.setDescription(description);
            task.setStatus(status);
            task.setDeadline(deadline);
            taskService.save(task);
        }
        response.sendRedirect(request.getContextPath() + "/tasks");
    }
}
