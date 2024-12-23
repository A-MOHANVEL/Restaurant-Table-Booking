package com.demo.bean;

public class Reservation {
    private String name;
    private String phone;
    private String address;
    private String date;
    private String timeFrom;
    private int guests;
    private String description;

    public Reservation(String name, String phone, String address, String date, String timeFrom, int guests, String description) {
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.date = date;
        this.timeFrom = timeFrom;
        this.guests = guests;
        this.description = description;
    }

    // Getters
    public String getName() { return name; }
    public String getPhone() { return phone; }
    public String getAddress() { return address; }
    public String getDate() { return date; }
    public String getTimeFrom() { return timeFrom; }
    public int getGuests() { return guests; }
    public String getDescription() { return description; }
}
