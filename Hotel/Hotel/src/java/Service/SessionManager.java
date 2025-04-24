/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

/**
 *
 * @author plmin
 */
import jakarta.servlet.http.HttpSession;
import java.util.concurrent.ConcurrentHashMap;

public class SessionManager {

    private static final ConcurrentHashMap<Integer, HttpSession> sessionMap = new ConcurrentHashMap<>();

    public static void addSession(int userId, HttpSession session) {
        sessionMap.put(userId, session);
    }

    public static void removeSession(int userId) {
        sessionMap.remove(userId);
    }

    public static HttpSession getSession(int userId) {
        return sessionMap.get(userId);
    }

    public static void invalidateSession(int userId) {
        HttpSession session = sessionMap.get(userId);
        if (session != null) {
            session.invalidate();
            sessionMap.remove(userId);
        }
    }
}
