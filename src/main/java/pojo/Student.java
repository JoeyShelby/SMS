//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package pojo;

public class Student {
    private int num;
    private String name;
    private String sex;
    private String birth;

    public Student() {
    }

    public Student(String name, String sex, String birth) {
        this.name = name;
        this.sex = sex;
        this.birth = birth;
    }

    public Student(int num, String name, String sex, String birth) {
        this.name = name;
        this.num = num;
        this.sex = sex;
        this.birth = birth;
    }

    public String toString() {
        return "Student{num=" + this.num + ", name='" + this.name + '\'' + ", sex='" + this.sex + '\'' + ", birth='" + this.birth + '\'' + '}';
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNum() {
        return this.num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getSex() {
        return this.sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirth() {
        return this.birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }
}
