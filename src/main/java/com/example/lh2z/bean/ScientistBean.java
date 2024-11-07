package com.example.lh2z.bean;

import com.example.lh2z.entity.Co2Data;
import com.example.lh2z.entity.User;
import com.example.lh2z.util.JPAUtil;
import jakarta.enterprise.context.RequestScoped;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;

import java.io.Serializable;
import java.math.BigDecimal;

@Named
@ViewScoped
public class ScientistBean implements Serializable {

    private String country;
    private Integer year;
    private Double emission;

    @Inject
    private LoginBean loginBean;

    // Getter und Setter

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Double getEmission() {
        return emission;
    }

    public void setEmission(Double emission) {
        this.emission = emission;
    }

    /*
   //  * Methode zum Einreichen eines neuen CO2-Datensatzes.
   //  * @return Navigationsziel basierend auf dem Ergebnis.

    @Transactional
    public String submitData() {
        if (loginBean.isLoggedIn() && loginBean.getRole() == User.Role.scientist) {
            EntityManager em = JPAUtil.getEntityManager();
            try {
                Co2Data data = new Co2Data();
                data.setCountry(country);
                data.setYear(year);
                data.setEmission(BigDecimal.valueOf(emission));
                data.setStatus(Co2Data.Status.pending);
                data.setSubmittedBy(loginBean.getUsername());

                em.getTransaction().begin();
                em.persist(data);
                em.getTransaction().commit();

                return "scientist?faces-redirect=true&success=true";
            } catch (Exception e) {
                if (em.getTransaction().isActive()) {
                    em.getTransaction().rollback();
                }
                return "scientist?faces-redirect=true&error=true";
            } finally {
                em.close();
            }
        } else {
            return "login?faces-redirect=true";
        }
    }
    */
    //neue Dateeintragungsmethode, solang der status auf pending steht, kann der eingetragene Datensatz überschrieben werden
    @Transactional
    public String submitData() {
        if (loginBean.isLoggedIn() && loginBean.getRole() == User.Role.scientist) {
            EntityManager em = JPAUtil.getEntityManager();
            try {
                em.getTransaction().begin();

                // Überprüfen, ob ein Datensatz für das gegebene Land und Jahr existiert
                Co2Data existingData = em.createQuery(
                                "SELECT c FROM Co2Data c WHERE c.country = :country AND c.year = :year",
                                Co2Data.class)
                        .setParameter("country", country)
                        .setParameter("year", year)
                        .getResultStream()
                        .findFirst()
                        .orElse(null);

                if (existingData != null) {
                    // Existierenden Datensatz aktualisieren
                    existingData.setEmission(BigDecimal.valueOf(emission));
                    existingData.setStatus(Co2Data.Status.pending);
                    existingData.setSubmittedBy(loginBean.getUsername());
                    em.merge(existingData);
                } else {
                    // Neuen Datensatz erstellen
                    Co2Data data = new Co2Data();
                    data.setCountry(country);
                    data.setYear(year);
                    data.setEmission(BigDecimal.valueOf(emission));
                    data.setStatus(Co2Data.Status.pending);
                    data.setSubmittedBy(loginBean.getUsername());
                    em.persist(data);
                }

                em.getTransaction().commit();

                return "scientist?faces-redirect=true&success=true";
            } catch (Exception e) {
                if (em.getTransaction().isActive()) {
                    em.getTransaction().rollback();
                }
                return "scientist?faces-redirect=true&error=true";
            } finally {
                em.close();
            }
        } else {
            return "login?faces-redirect=true";
        }
    }

}