package model;

import java.sql.Time;
import java.sql.Date;

public class ShiftSchedule {
    private int shiftID;
    private String shiftName;
    private Time startTime;
    private Time endTime;
    private Date shiftDate;
    private String employeeName; 
    private int IDAccount;
    public ShiftSchedule() {}

    public ShiftSchedule(int shiftID, String shiftName, Time startTime, Time endTime, Date shiftDate, String employeeName) {
        this.shiftID = shiftID;
        this.shiftName = shiftName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.shiftDate = shiftDate;
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

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public Date getShiftDate() {
        return shiftDate;
    }

    public void setShiftDate(Date shiftDate) {
        this.shiftDate = shiftDate;
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
        return "ShiftSchedule{" +
                "shiftID=" + shiftID +
                ", shiftName='" + shiftName + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", shiftDate=" + shiftDate +
                '}';
    }
}
