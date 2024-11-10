package com.example.lh2z.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "co2_data")
public class Co2Data {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, length = 100)
    private String country;

    @Column(nullable = false)
    private Integer year;

    @Column(nullable = false, precision = 15, scale = 4)
    private BigDecimal emission;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private Status status;

    @Column(name = "submitted_by", nullable = false, length = 50)
    private String submittedBy;

    // Getter und Setter

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    // Weitere Getter und Setter...

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

    public BigDecimal getEmission() {
        return emission;
    }

    public void setEmission(BigDecimal emission) {
        this.emission = emission;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getSubmittedBy() {
        return submittedBy;
    }

    public void setSubmittedBy(String submittedBy) {
        this.submittedBy = submittedBy;
    }

    // Enum für Datensatzstatus
    public enum Status {
        pending,
        approved,
        rejected
    }
}