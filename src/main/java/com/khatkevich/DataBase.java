package com.khatkevich;

import java.util.HashMap;
import java.util.Map;

public class DataBase {
    private static DataBase dataBase = null;
    private static boolean isExist = false;
    private Map<Long, People> peoples;
    private Map<String, Double> goods;

    private DataBase() {
        peoples = new HashMap<>();
        goods = new HashMap<>();
        goods.put("Book", 30.5);
        goods.put("Phone", 1350.5);
        goods.put("Laptop", 999.95);
        goods.put("PC", 3199.99);
        goods.put("HiFi", 400.00);
        isExist = true;
        dataBase = this;
    }

    public static DataBase getDatabase() {
        if(isExist) {
            return dataBase;
        } else return new DataBase();
    }

    public Map getPeoples() {
        return peoples;
    }

    public Map getGoods() {
        return goods;
    }
}
