package com.example.lh2z.bean;

import com.example.lh2z.entity.User;
import com.example.lh2z.util.JPAUtil;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.transaction.Transactional;

import java.io.Serializable;

@Named
@SessionScoped
public class LoginBean implements Serializable {
    private String username;
    private String password;
    private User.Role role;
    private boolean loggedIn = false;

    // Getter und Setter

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    // Passwort wird direkt gesetzt (Klartext gemäß Anforderungen)
    public void setPassword(String password) {
        this.password = password;
    }

    public User.Role getRole() {
        return role;
    }

    public boolean isLoggedIn() {
        return loggedIn;
    }

    /**
     * Methode zur Authentifizierung des Benutzers.
     * @return Navigationsziel basierend auf Authentifizierungsergebnis.
     */
    @Transactional
    public String login() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            User user = em.createQuery("SELECT u FROM User u WHERE u.username = :username AND u.password = :password", User.class)
                    .setParameter("username", username)
                    .setParameter("password", password)
                    .getSingleResult();
            this.role = user.getRole();
            this.loggedIn = true;
            return "index?faces-redirect=true";
        } catch (NoResultException e) {
            // Authentication failed
            this.loggedIn = false;
            return "login?faces-redirect=true&error=true";
        } finally {
            em.close();
        }
    }

    /**
     * Methode zum Abmelden des Benutzers.
     * @return Navigationsziel zur Startseite.
     */
    public String logout() {
        System.out.println("I m in the logout");
        this.username = null;
        this.password = null;
        this.role = null;
        this.loggedIn = false;
        return "login?faces-redirect=true";
    }
}