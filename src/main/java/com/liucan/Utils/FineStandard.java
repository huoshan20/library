package com.liucan.Utils;

/**
 * @author asus
 * @create 2020-02-04 18:37
 */
public class FineStandard {
    private static double strandard=0.1;
    private String name;
    private int days;
    private double money;

    public FineStandard() {
    }

    public FineStandard(String name, int days) {
        this.name = name;
        this.days = days;
    }

    public static double getStrandard() {
        return strandard;
    }

    public static void setStrandard(double strandard) {
        FineStandard.strandard = strandard;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public double getMoney() {
        return days*strandard;
    }

    public void setMoney(double money) {
        this.money = money;
    }
}
