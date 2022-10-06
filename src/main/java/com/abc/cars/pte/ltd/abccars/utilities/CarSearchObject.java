package com.abc.cars.pte.ltd.abccars.utilities;

public class CarSearchObject {
    private String manufacturer;
    private String model;
    private String year;
    private String minPrice;
    private String maxPrice;

    public CarSearchObject() {}
    
    public CarSearchObject(String manufacturer, String model, String year, String minPrice,
            String maxPrice) {
        this.manufacturer = manufacturer;
        this.model = model;
        this.year = year;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
    }
    public String getManufacturer() {
        return manufacturer;
    }
    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }
    public String getModel() {
        return model;
    }
    public void setModel(String model) {
        this.model = model;
    }
    public String getYear() {
        return year;
    }
    public void setYear(String year) {
        this.year = year;
    }
   
    public String getMinPrice() {
        return minPrice;
    }
    public void setMinPrice(String minPrice) {
        this.minPrice = minPrice;
    }
    public String getMaxPrice() {
        return maxPrice;
    }
    public void setMaxPrice(String maxPrice) {
        this.maxPrice = maxPrice;
    }

    
}
