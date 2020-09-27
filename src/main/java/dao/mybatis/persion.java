package main.java.dao.mybatis;

public class persion {//这是一个持久化类
    private int Age;//首字母要大写？
    private String Name;
    private String Sex;

    public void setAge(int a) {
        Age = a;
    }

    public void setName(String n) {
        Name = n;
    }

    public void setSex(String s) {
        Sex = s;
    }

    public int getAge() {
        return Age;
    }

    public String getName() {
        return Name;
    }

    public String getSex() {
        return Sex;
    }
}
