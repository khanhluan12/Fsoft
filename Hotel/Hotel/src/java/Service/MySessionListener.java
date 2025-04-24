/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import model.User;

/**
 *
 * @author plmin
 */
@WebListener
public class MySessionListener implements HttpSessionListener {

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        User user = (User) se.getSession().getAttribute("userA");
        if (user != null) {
            SessionManager.removeSession(user.getIDAccount());
        }
    }
}
