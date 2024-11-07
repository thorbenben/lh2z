package com.example.lh2z.bean;

import com.example.lh2z.entity.Co2Data;
import com.example.lh2z.util.JPAUtil;
import jakarta.enterprise.context.RequestScoped;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;

import java.io.Serializable;
import java.util.List;

@Named
@ViewScoped
public class Co2DataBean implements Serializable {
    private String selectedCountry;
    private List<Co2Data> co2DataList;
    private List<String> countryList;

    // Getter und Setter

    public String getSelectedCountry() {
        return selectedCountry;
    }

    public void setSelectedCountry(String selectedCountry) {
        this.selectedCountry = selectedCountry;
    }

    public List<Co2Data> getCo2DataList() {
        return co2DataList;
    }

    public List<String> getCountryList() {
        if (countryList == null) {
            EntityManager em = JPAUtil.getEntityManager();
            try {
                countryList = em.createQuery("SELECT DISTINCT c.country FROM Co2Data c WHERE c.status = 'approved'", String.class)
                        .getResultList();
            } finally {
                em.close();
            }
        }
        return countryList;
    }

    /**
     * Methode zum Laden der CO2-Daten für das ausgewählte Land.
     */
    public void loadData() {
        System.out.println("country : " + selectedCountry);
        if (selectedCountry != null && !selectedCountry.isEmpty()) {
            EntityManager em = JPAUtil.getEntityManager();
            try {
                co2DataList = em.createQuery(
                                "SELECT c FROM Co2Data c WHERE c.country = :country AND c.status = 'approved' ORDER BY c.year DESC",
                                Co2Data.class)
                        .setParameter("country", selectedCountry)
                        .getResultList();
            } finally {
                em.close();
            }
        }

        for(Co2Data c : co2DataList)
            System.out.println(c.getEmission());
    }
}