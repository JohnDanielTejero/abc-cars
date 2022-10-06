package com.abc.cars.pte.ltd.abccars.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "car")
public class Car {
    
    @Id
    @Column(name = "carid")
    private int carId;

    @Column(name = "carprice")
    private String price;

    @Column(name = "carmodel")
    private String model;

    @Column(name = "carmanufacturer")
    private String make;

    @Column(name = "cartransmission")
    private String transmission;
    
    @Column (name = "carimagepath")
    private String imagePath;

    @Column(name = "cardescription")
    private String description;

    @Column(name = "carname")
    private String carName;
    
    @Column(name = "carregistrationdate")
    private String carRegistration;

    @Column(name = "carpoststatus")
    private boolean carPostStatus;

    @Transient
    private MultipartFile image;

    @ManyToOne
    @JoinColumn(name = "userid")
    private User user;
    
    @OneToMany(targetEntity = CarBid.class, mappedBy = "car", orphanRemoval = true, fetch = FetchType.EAGER)
    private List<CarBid> bids;

    public int getCarId() {
        return carId;
    }

    public Car(int carId, String price, String model, String make, String transmission, User user) {
        this.carId = carId;
        this.price = price;
        this.model = model;
        this.make = make;
        this.transmission = transmission;
        this.user = user;
    }

    public Car (Car car){
        this.carId = car.getCarId();
        this.price = car.getPrice();
        this.model = car.getModel();
        this.make = car.getMake();
        this.transmission = car.getTransmission();
        this.user = car.getUser(); 
    }
    public Car() {}

   
    public void setCarId(int carId) {
        this.carId = carId;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public String getImagePath() {
        return imagePath;
    }


    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }


    public String getDescription() {
        return description;
    }


    public void setDescription(String description) {
        this.description = description;
    }


    public MultipartFile getImage() {
        return image;
    }


    public void setImage(MultipartFile image) {
        this.image = image;
    }


    public String getCarName() {
        return carName;
    }


    public void setCarName(String carName) {
        this.carName = carName;
    }


    public String getCarRegistration() {
        return this.carRegistration;
    }

    public void setCarRegistration(String carRegistration) {
        this.carRegistration = carRegistration;
    }

    public boolean getCarPostStatus() {
        return carPostStatus;
    }

    public void setCarPostStatus(boolean carPostStatus) {
        this.carPostStatus = carPostStatus;
    }

    public List<CarBid> getBids() {
        return bids;
    }

    public void setBids(List<CarBid> bids) {
        this.bids = bids;
    }
}
