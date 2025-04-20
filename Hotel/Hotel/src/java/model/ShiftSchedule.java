package model;

import java.sql.Timestamp;
import java.sql.Date;

public class ShiftSchedule {

    private int shiftID;
    private String shiftName;
    private Timestamp startDateTime;
    private Timestamp endDateTime;
    private String employeeName;
    private int IDAccount;

    public ShiftSchedule() {
    }

    public ShiftSchedule(int shiftID, String shiftName, Timestamp startDateTime, Timestamp endDateTime, Date shiftDate, String employeeName) {
        this.shiftID = shiftID;
        this.shiftName = shiftName;
        this.startDateTime = startDateTime;
        this.endDateTime = endDateTime;
        this.employeeName = employeeName;
    }

    public int getShiftID() {
        return shiftID;
    }

    public void setShiftID(int shiftID) {
        this.shiftID = shiftID;
    }

    public String getShiftName() {
        return shiftName;
    }

    public void setShiftName(String shiftName) {
        this.shiftName = shiftName;
    }

    public Timestamp getStartDateTime() {
        return startDateTime;
    }

    public void setStartDateTime(Timestamp startDateTime) {
        this.startDateTime = startDateTime;
    }

    public Timestamp getEndDateTime() {
        return endDateTime;
    }

    public void setEndDateTime(Timestamp endDateTime) {
        this.endDateTime = endDateTime;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public int getIDAccount() {
        return IDAccount;
    }

    public void setIDAccount(int IDAccount) {
        this.IDAccount = IDAccount;
    }

    @Override
    public String toString() {
        return "ShiftSchedule{" + "shiftID=" + shiftID + ", shiftName=" + shiftName + ", startDateTime=" + startDateTime + ", endDateTime=" + endDateTime + ", employeeName=" + employeeName + ", IDAccount=" + IDAccount + '}';
    }

}
