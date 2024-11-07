package com.example.lh2z.bean;

import com.example.lh2z.entity.Co2Data;
import com.example.lh2z.entity.User;
import com.example.lh2z.util.JPAUtil;
import jakarta.enterprise.context.RequestScoped;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

import java.io.Serializable;
import java.util.List;

@Named
@ViewScoped
public class AdminBean implements Serializable {

    @Inject
    private LoginBean loginBean;

    private List<Co2Data> pendingDataList;

    // Getter und Setter

    public List<Co2Data> getPendingDataList() {
        if (pendingDataList == null) {
            EntityManager em = JPAUtil.getEntityManager();
            try {
                TypedQuery<Co2Data> query = em.createQuery("SELECT c FROM Co2Data c WHERE c.status = 'pending'", Co2Data.class);
                pendingDataList = query.getResultList();
            } finally {
                em.close();
            }
        }
        return pendingDataList;
    }

    /**
     * Methode zum Genehmigen eines Datensatzes.
     * @param dataId ID des zu genehmigenden Datensatzes.
     * @return Reload der Admin-Seite.
     */
    @Transactional
    public String approveData(Integer dataId) {
        if (isAdmin()) {
            EntityManager em = JPAUtil.getEntityManager();
            try {
                Co2Data data = em.find(Co2Data.class, dataId);
                if (data != null) {
                    em.getTransaction().begin();
                    data.setStatus(Co2Data.Status.approved);
                    em.getTransaction().commit();
                }
                return "admin?faces-redirect=true";
            } catch (Exception e) {
                if (em.getTransaction().isActive()) {
                    em.getTransaction().rollback();
                }
                return "admin?faces-redirect=true&error=true";
            } finally {
                em.close();
            }
        } else {
            return "login?faces-redirect=true";
        }
    }

    /**
     * Methode zum Ablehnen eines Datensatzes.
     * @param dataId ID des zu ablehnenden Datensatzes.
     * @return Reload der Admin-Seite.
     */
    @Transactional
    public String rejectData(Integer dataId) {
        if (isAdmin()) {
            EntityManager em = JPAUtil.getEntityManager();
            try {
                Co2Data data = em.find(Co2Data.class, dataId);
                if (data != null) {
                    em.getTransaction().begin();
                    data.setStatus(Co2Data.Status.rejected);
                    em.getTransaction().commit();
                }
                return "admin?faces-redirect=true";
            } catch (Exception e) {
                if (em.getTransaction().isActive()) {
                    em.getTransaction().rollback();
                }
                return "admin?faces-redirect=true&error=true";
            } finally {
                em.close();
            }
        } else {
            return "login?faces-redirect=true";
        }
    }

    /**
     * Prüft, ob der aktuelle Benutzer ein Admin ist.
     * @return true, wenn Admin; sonst false.
     */
    private boolean isAdmin() {
        return loginBean.isLoggedIn() && loginBean.getRole() == User.Role.admin;
    }
}