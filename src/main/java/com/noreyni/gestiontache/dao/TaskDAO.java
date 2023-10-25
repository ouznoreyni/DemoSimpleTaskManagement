package com.noreyni.gestiontache.dao;

import com.noreyni.gestiontache.entity.Task;
import com.noreyni.gestiontache.util.HibernateUtil;
import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class TaskDAO {
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("TaskManagerPU");

    @PersistenceUnit(unitName="TaskManagerPU")
    EntityManager em;

    public TaskDAO() {
        em = emf.createEntityManager();
    }

    public List<Task> findAll() {
        Query query = em.createQuery("SELECT t FROM Task t");
        return query.getResultList();
    }

    public void save(Task task) {
        EntityTransaction transaction = null;
        try {
            transaction = em.getTransaction();
            transaction.begin();
            em.persist(task);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public Task findById(Long id) {
        return em.find(Task.class, id);
    }

    public void update(Task task) {
        EntityTransaction transaction = null;
        try {
            transaction = em.getTransaction();
            transaction.begin();
            em.merge(task);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void deleteById(Long id) {
        EntityTransaction transaction = null;
        try {
            transaction = em.getTransaction();
            transaction.begin();
            Task task = em.find(Task.class, id);
            if (task != null) {
                em.remove(task);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
