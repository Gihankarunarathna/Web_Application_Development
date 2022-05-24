
package sales.models;

import com.google.gson.Gson;
import java.io.Serializable;

public class Vehicle implements Serializable, Prototype{
    
    private int Id;
    private String Model;
    private String Name;
    private String To;
    private int Seats;
    private String Departure;
    private String UpdatedBy;
  
    public Vehicle() {
    }

    public Vehicle(int Id, String Model, String Name, String To, int Seats, String Departure, String UpdatedBy) {
        this.Id = Id;
        this.Model = Model;
        this.Name = Name;
        this.To = To;
        this.Seats = Seats;
        this.Departure = Departure;
        this.UpdatedBy = UpdatedBy;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getModel() {
        return Model;
    }

    public void setModel(String Model) {
        this.Model = Model;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getTo() {
        return To;
    }

    public void setTo(String To) {
        this.To = To;
    }

    public int getSeats() {
        return Seats;
    }

    public void setSeats(int Seats) {
        this.Seats = Seats;
    }

    public String getDeparture() {
        return Departure;
    }

    public void setDeparture(String Departure) {
        this.Departure = Departure;
    }

    public String getUpdatedBy() {
        return UpdatedBy;
    }

    public void setUpdatedBy(String UpdatedBy) {
        this.UpdatedBy = UpdatedBy;
    }
    
    
   
    public String getJson()
    {
        Gson gson = new Gson();
        return gson.toJson(this);
        
    }

    @Override
    public Prototype getCloneObject() {
        return new Vehicle();
    }
    
}
