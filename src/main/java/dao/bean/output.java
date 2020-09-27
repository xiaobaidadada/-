package main.java.dao.bean;

public class output {
    private String s;

    public output(String S) {//构造函数
        s = S;
    }

    public void print() {
        System.out.println(s);
    }
}
