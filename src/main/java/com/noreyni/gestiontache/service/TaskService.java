package com.noreyni.gestiontache.service;

import com.noreyni.gestiontache.dao.TaskDAO;
import com.noreyni.gestiontache.entity.Task;

import java.util.List;

public class TaskService {
    private TaskDAO taskDAO = new TaskDAO();

    public List<Task> findAll() {
        return taskDAO.findAll();
    }

    public void save(Task task) {
        taskDAO.save(task);
    }

    public Task findById(Long id) {
        return taskDAO.findById(id);
    }

    public void update(Task task) {
        taskDAO.update(task);
    }

    public void delete(long id) {
        taskDAO.deleteById(id);
    }

}
