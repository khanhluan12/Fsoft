/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Contact {
    private int IDContact;
    private int IDAccount;
    private String FullName;
    private String Phone;
    private String Email;
    private String Message;
    private String Status;

    public Contact(int IDContact, int IDAccount, String FullName, String Phone, String Email, String Message, String Status) {
        this.IDContact = IDContact;
        this.IDAccount = IDAccount;
        this.FullName = FullName;
        this.Phone = Phone;
        this.Email = Email;
        this.Message = Message;
        this.Status = Status;
    }

    public int getIDContact() {
        return IDContact;
    }

    public void setIDContact(int IDContact) {
        this.IDContact = IDContact;
    }

    public int getIDAccount() {
        return IDAccount;
    }

    public void setIDAccount(int IDAccount) {
        this.IDAccount = IDAccount;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "Contact{" + "IDContact=" + IDContact + ", IDAccount=" + IDAccount + ", FullName=" + FullName + ", Phone=" + Phone + ", Email=" + Email + ", Message=" + Message + ", Status=" + Status + '}';
    }

    
}
