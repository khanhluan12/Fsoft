/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class User {

    private int IDAccount;
    private String FullName;
    private String Gender;
    private String City;
    private String Email;
    private String Phone;
    private String UserName;
    private String Pass;
    private int IDRole;
    private boolean isAcive;
    private boolean isBan;

    public User(int IDAccount, String FullName, String Gender, String City, String Email, String Phone, String UserName, String Pass, int IDRole) {
        this.IDAccount = IDAccount;
        this.FullName = FullName;
        this.Gender = Gender;
        this.City = City;
        this.Email = Email;
        this.Phone = Phone;
        this.UserName = UserName;
        this.Pass = Pass;
        this.IDRole = IDRole;
    }
    
    public User(int IDAccount, String FullName, String Gender, String City, String Email, String Phone, String UserName, String Pass, int IDRole, boolean isActive) {
        this.IDAccount = IDAccount;
        this.FullName = FullName;
        this.Gender = Gender;
        this.City = City;
        this.Email = Email;
        this.Phone = Phone;
        this.UserName = UserName;
        this.Pass = Pass;
        this.IDRole = IDRole;
        this.isAcive = isActive;
    }

    public User() {
    }

    public boolean isIsBan() {
        return isBan;
    }

    public void setIsBan(boolean isBan) {
        this.isBan = isBan;
    }
    

    public boolean isIsAcive() {
        return isAcive;
    }

    public void setIsAcive(boolean isAcive) {
        this.isAcive = isAcive;
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

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String Pass) {
        this.Pass = Pass;
    }

    public int getIDRole() {
        return IDRole;
    }

    public void setIDRole(int IDRole) {
        this.IDRole = IDRole;
    }

    @Override
    public String toString() {
        return "User{" + "IDAccount=" + IDAccount + ", FullName=" + FullName + ", Gender=" + Gender + ", City=" + City + ", Email=" + Email + ", Phone=" + Phone + ", UserName=" + UserName + ", Pass=" + Pass + ", IDRole=" + IDRole + '}';
    }

    
    
}
