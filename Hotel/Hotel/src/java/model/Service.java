
package model;

public class Service {
    private int ServiceID;
    private String ServiceName;
    private int CategoryID;

    public Service(int ServiceID, String ServiceName, int CategoryID) {
        this.ServiceID = ServiceID;
        this.ServiceName = ServiceName;
        this.CategoryID = CategoryID;
    }

    public Service() {}

    public int getServiceID() {
        return ServiceID;
    }

    public void setServiceID(int ServiceID) {
        this.ServiceID = ServiceID;
    }

    public String getServiceName() {
        return ServiceName;
    }

    public void setServiceName(String ServiceName) {
        this.ServiceName = ServiceName;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    @Override
    public String toString() {
        return "Service{" + "ServiceID=" + ServiceID + ", ServiceName=" + ServiceName + ", CategoryID=" + CategoryID + '}';
    }

   
  

}

