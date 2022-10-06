package com.abc.cars.pte.ltd.abccars.models;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "place_bid")
public class CarBid {

    @Column(name = "bidid")
    @Id
    private int bidId;

    @Column(name = "bidappointment")
    private String bidAppointment;

    @Column(name = "biddate")
    private String bidRegistDate;
    
    @Column(name = "bidprice")
    private String bidAmount;
    
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "userid")
    private User user;

    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "carid")
    private Car car;

    public CarBid(){}
    
    public CarBid(int bidId, String bidAppointment, String bidRegistDate, User user, Car car) {
        this.bidId = bidId;
        this.bidAppointment = bidAppointment;
        this.bidRegistDate = bidRegistDate;
        this.user = user;
        this.car = car;
    }

    public int getBidId() {
        return bidId;
    }

    public void setBidId(int bidId) {
        this.bidId = bidId;
    }

    public String getBidAppointment() {
        return bidAppointment;
    }

    public void setBidAppointment(String bidAppointment) {
        this.bidAppointment = bidAppointment;
    }

    public String getBidRegistDate() {
        return bidRegistDate;
    }

    public void setBidRegistDate(String bidRegistDate) {
        this.bidRegistDate = bidRegistDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public String getBidAmount() {
        return bidAmount;
    }

    public void setBidAmount(String bidAmount) {
        this.bidAmount = bidAmount;
    }

    
}
