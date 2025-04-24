/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author plmin
 */
public class SecurityUtils {

    public static boolean isBannedUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return false;
        }

        Object obj = session.getAttribute("userA");
        if (obj instanceof model.User user) {
            return user.isIsBan();
        }
        return false;
    }
}
