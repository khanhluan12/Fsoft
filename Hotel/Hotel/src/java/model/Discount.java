/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Discount {
    private int IDDiscount;
    private String DiscountName;
    private double DiscountValue;
    private String StartDay;
    private String EndDay;
    private String Note;

    public Discount(int IDDiscount, String DiscountName, double DiscountValue, String StartDay, String EndDay, String Note) {
        this.IDDiscount = IDDiscount;
        this.DiscountName = DiscountName;
        this.DiscountValue = DiscountValue;
        this.StartDay = StartDay;
        this.EndDay = EndDay;
        this.Note = Note;
    }

    public int getIDDiscount() {
        return IDDiscount;
    }

    public void setIDDiscount(int IDDiscount) {
        this.IDDiscount = IDDiscount;
    }

    public String getDiscountName() {
        return DiscountName;
    }

    public void setDiscountName(String DiscountName) {
        this.DiscountName = DiscountName;
    }

    public double getDiscountValue() {
        return DiscountValue;
    }

    public void setDiscountValue(double DiscountValue) {
        this.DiscountValue = DiscountValue;
    }

    public String getStartDay() {
        return StartDay;
    }

    public void setStartDay(String StartDay) {
        this.StartDay = StartDay;
    }

    public String getEndDay() {
        return EndDay;
    }

    public void setEndDay(String EndDay) {
        this.EndDay = EndDay;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    @Override
    public String toString() {
        return "Discount{" + "IDDiscount=" + IDDiscount + ", DiscountName=" + DiscountName + ", DiscountValue=" + DiscountValue + ", StartDay=" + StartDay + ", EndDay=" + EndDay + ", Note=" + Note + '}';
    }
    
}
