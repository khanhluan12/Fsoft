/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class BookingDetails {

    private int IDBooking;
    private int IDAccount;
    private int IDDiscount;

    private String FullName;
    private String Gender;
    private String Email;
    private String Phone;
private String nameRoomType;
    private int Adult;
    private int Child;
    private String CheckIn;
    private String CheckOut;
    private double TotalPrice;
    private String BookingTime;
    private String Note;
    private boolean Cancel;
    
    private boolean Over;

    public BookingDetails(int IDBooking,int IDAccount, int IDDiscount, String FullName, String Gender, String Email, String Phone, int Adult, int Child, String CheckIn, String CheckOut, double TotalPrice, String BookingTime, String Note) {
        this.IDBooking = IDBooking;
        this.IDAccount = IDAccount;
        this.IDDiscount = IDDiscount;
        this.FullName = FullName;
        this.Gender = Gender;
        this.Email = Email;
        this.Phone = Phone;
        this.Adult = Adult;
        this.Child = Child;
        this.CheckIn = CheckIn;
        this.CheckOut = CheckOut;
        this.TotalPrice = TotalPrice;
        this.BookingTime = BookingTime;
        this.Note = Note;
    }
    
    public BookingDetails(int IDDiscount,int IDAccount, String FullName, String Gender, String Email, String Phone, int Adult, int Child, String CheckIn, String CheckOut, double TotalPrice, String BookingTime, String Note) {        
        this.IDDiscount = IDDiscount;
        this.IDAccount = IDAccount;
        this.FullName = FullName;
        this.Gender = Gender;
        this.Email = Email;
        this.Phone = Phone;
        this.Adult = Adult;
        this.Child = Child;
        this.CheckIn = CheckIn;
        this.CheckOut = CheckOut;
        this.TotalPrice = TotalPrice;
        this.BookingTime = BookingTime;
        this.Note = Note;
    }
public BookingDetails(int IDBooking, int IDAccount, int IDDiscount, String FullName, String Gender, String Email, String Phone, int Adult, int Child, String CheckIn, String CheckOut, double TotalPrice, String BookingTime, String Note, boolean IsCancel, String nameRoomType) {
    this.IDBooking = IDBooking;
    this.IDAccount = IDAccount;
    this.IDDiscount = IDDiscount;
    this.FullName = FullName;
    this.Gender = Gender;
    this.Email = Email;
    this.Phone = Phone;
    this.Adult = Adult;
    this.Child = Child;
    this.CheckIn = CheckIn;
    this.CheckOut = CheckOut;
    this.TotalPrice = TotalPrice;
    this.BookingTime = BookingTime;
    this.Note = Note;
    this.nameRoomType = nameRoomType;
    this.Cancel = IsCancel; 
}

    public BookingDetails() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getIDAccount() {
        return IDAccount;
    }

    public void setIDAccount(int IDAccount) {
        this.IDAccount = IDAccount;
    }

    public boolean isOver() {
        return Over;
    }

    public void setOver(boolean Over) {
        this.Over = Over;
    }

    public boolean isCancel() {
        return Cancel;
    }

    public void setIsCancel(boolean isCancel) {
        this.Cancel = isCancel;
    }
    
    public int getIDBooking() {
        return IDBooking;
    }

    public void setIDBooking(int IDBooking) {
        this.IDBooking = IDBooking;
    }

    public int getIDDiscount() {
        return IDDiscount;
    }

    public void setIDDiscount(int IDDiscount) {
        this.IDDiscount = IDDiscount;
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

    public int getAdult() {
        return Adult;
    }

    public void setAdult(int Adult) {
        this.Adult = Adult;
    }

    public int getChild() {
        return Child;
    }

    public void setChild(int Child) {
        this.Child = Child;
    }

    public String getCheckIn() {
        return CheckIn;
    }

    public void setCheckIn(String CheckIn) {
        this.CheckIn = CheckIn;
    }

    public String getCheckOut() {
        return CheckOut;
    }

    public void setCheckOut(String CheckOut) {
        this.CheckOut = CheckOut;
    }

    public double getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(double TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public String getBookingTime() {
        return BookingTime;
    }

    public void setBookingTime(String BookingTime) {
        this.BookingTime = BookingTime;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    public String getNameRoomType() {
        return nameRoomType;
    }

    public void setNameRoomType(String nameRoomType) {
        this.nameRoomType = nameRoomType;
    }
    
}
