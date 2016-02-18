package com.test;
 
import java.io.Serializable;
 
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
 
@ManagedBean
@ViewScoped
public class AddressBeanViewScoped implements Serializable {
 
    private static final long serialVersionUID = 1L;
     
    private Long id;
    private String name;
    private String address;
    private String city;
    private String state;
    private String zip;
 
    @PostConstruct
    void init() {
        System.out.println("Initializing Address Bean.");
    }
     
    @PreDestroy
    void destroy() {
        System.out.println("Destroying Address Bean.");
    }
 
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void handleKeyEvent() {
        address = address.toUpperCase();
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public String getZip() {
        return zip;
    }
    public void setZip(String zip) {
        this.zip = zip;
    }   
}