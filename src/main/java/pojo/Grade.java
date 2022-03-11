//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package pojo;

import com.alibaba.excel.annotation.ExcelProperty;

public class Grade {
    @ExcelProperty("数学总分")
    private double math_total;
    @ExcelProperty("Java总分")
    private double java_total;
    @ExcelProperty("英语总分")
    private double english_total;
    @ExcelProperty("体育总分")
    private double PE_total;
    @ExcelProperty("数学平均分")
    private double math_average;
    @ExcelProperty("Java平均分")
    private double java_average;
    @ExcelProperty("英语平均分")
    private double english_average;
    @ExcelProperty("体育平均分")
    private double PE_average;
    @ExcelProperty("总分")
    private double total;
    @ExcelProperty("平均分")
    private double total_average;

    public Grade() {
    }

    public Grade(double math_total, double java_total, double english_total, double PE_total, double math_average, double java_average, double english_average, double PE_average, double total, double total_average) {
        this.math_total = math_total;
        this.java_total = java_total;
        this.english_total = english_total;
        this.PE_total = PE_total;
        this.math_average = math_average;
        this.java_average = java_average;
        this.english_average = english_average;
        this.PE_average = PE_average;
        this.total = total;
        this.total_average = total_average;
    }

    public String toString() {
        return "Grade{math_total=" + this.math_total + ", java_total=" + this.java_total + ", english_total=" + this.english_total + ", PE_total=" + this.PE_total + ", math_average=" + this.math_average + ", java_average=" + this.java_average + ", english_average=" + this.english_average + ", PE_average=" + this.PE_average + ", total=" + this.total + ", total_average=" + this.total_average + '}';
    }

    public double getMath_total() {
        return this.math_total;
    }

    public void setMath_total(double math_total) {
        this.math_total = math_total;
    }

    public double getJava_total() {
        return this.java_total;
    }

    public void setJava_total(double java_total) {
        this.java_total = java_total;
    }

    public double getEnglish_total() {
        return this.english_total;
    }

    public void setEnglish_total(double english_total) {
        this.english_total = english_total;
    }

    public double getPE_total() {
        return this.PE_total;
    }

    public void setPE_total(double PE_total) {
        this.PE_total = PE_total;
    }

    public double getMath_average() {
        return this.math_average;
    }

    public void setMath_average(double math_average) {
        this.math_average = math_average;
    }

    public double getJava_average() {
        return this.java_average;
    }

    public void setJava_average(double java_average) {
        this.java_average = java_average;
    }

    public double getEnglish_average() {
        return this.english_average;
    }

    public void setEnglish_average(double english_average) {
        this.english_average = english_average;
    }

    public double getPE_average() {
        return this.PE_average;
    }

    public void setPE_average(double PE_average) {
        this.PE_average = PE_average;
    }

    public double getTotal() {
        return this.total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getTotal_average() {
        return this.total_average;
    }

    public void setTotal_average(double total_average) {
        this.total_average = total_average;
    }
}
