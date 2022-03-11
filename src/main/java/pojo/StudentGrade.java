//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package pojo;

import com.alibaba.excel.annotation.ExcelProperty;

public class StudentGrade {
    @ExcelProperty("学号")
    private int num;
    @ExcelProperty("姓名")
    private String name;
    @ExcelProperty("数学成绩")
    private double math;
    @ExcelProperty("Java成绩")
    private double java;
    @ExcelProperty("英语成绩")
    private double english;
    @ExcelProperty("体育成绩")
    private double PE;
    @ExcelProperty("总分")
    private double total;
    @ExcelProperty("平均分")
    private double average;

    public StudentGrade(int num, double math, double java, double english, double PE, double total, double average) {
        this.num = num;
        this.math = math;
        this.java = java;
        this.english = english;
        this.PE = PE;
        this.total = total;
        this.average = average;
    }

    public StudentGrade(int num, String name, double math, double java, double english, double PE, double total, double average) {
        this.num = num;
        this.name = name;
        this.math = math;
        this.java = java;
        this.english = english;
        this.PE = PE;
        this.total = total;
        this.average = average;
    }

    public StudentGrade() {
    }

    public String toString() {
        return "Grade{num=" + this.num + ", name='" + this.name + '\'' + ", math=" + this.math + ", java=" + this.java + ", english=" + this.english + ", PE=" + this.PE + ", total=" + this.total + ", average=" + this.average + '}';
    }

    public int getNum() {
        return this.num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getMath() {
        return this.math;
    }

    public void setMath(double math) {
        this.math = math;
    }

    public double getJava() {
        return this.java;
    }

    public void setJava(double java) {
        this.java = java;
    }

    public double getEnglish() {
        return this.english;
    }

    public void setEnglish(double english) {
        this.english = english;
    }

    public double getPE() {
        return this.PE;
    }

    public void setPE(double PE) {
        this.PE = PE;
    }

    public double getTotal() {
        return this.total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getAverage() {
        return this.average;
    }

    public void setAverage(double average) {
        this.average = average;
    }
}
