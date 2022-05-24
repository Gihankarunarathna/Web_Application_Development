
package sales.models;

import com.google.gson.Gson;


public class Customer  implements Prototype{
    private int id;
    private String name;
    private String address;
    private String passport;
    private String email;
    private String phone;
    private String password;
    private String updatedBy;
   
    public Customer()
    {      
    }

    public Customer(int id, String name, String address, String passport, String email, String phone, String password, String updated) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.passport = passport;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.updatedBy = updated;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getJson()
    {
        Gson gson = new Gson();
        return gson.toJson(this);
        
    }

    @Override
    public Prototype getCloneObject() {
       return new Customer(id, name, address, passport, email, phone, password
       ,updatedBy);    
    }
    
}
