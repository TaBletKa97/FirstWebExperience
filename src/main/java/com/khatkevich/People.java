package com.khatkevich;

import java.util.ArrayList;

public class People {
    private static long idForAll = 0;
    private Long id;
    private String name;
    private ArrayList<String> order;
    private boolean agreement;

    public People(String name) {
        idForAll++;
        id = idForAll;
        this.name = name;
        order = new ArrayList<>();
        DataBase dataBase = DataBase.getDatabase();
        dataBase.getPeoples().put(id, this);
    }

    public String getName() {
        return name;
    }

    public Long getId() {
        return id;
    }

    public ArrayList getOrder() {
        return order;
    }

    public boolean isAgreement() {
        return agreement;
    }

    public void setAgreement(boolean agreement) {
        this.agreement = agreement;
    }

}
