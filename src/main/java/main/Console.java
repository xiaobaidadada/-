package main.java.main;


import main.java.dao.bean.output;
import main.java.dao.mybatis.proxy;
import main.java.dao.mybatis.service;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.mybatis.spring.SqlSessionFactoryBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Console {

    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("main/resources/spring.xml");//全局的核心ioc

        output a = (output) context.getBean("test_out");
        a.print();

        service l = (service) context.getBean("sqltest");
        l.pri();

//        SqlSessionFactoryBean s=(SqlSessionFactoryBean)context.getBean("sqlsessionfactory");

//        Console sl=new Console();
//        sl.testdb();

//        proxy pro=(proxy)context.getBean("proxy");
//        try {
//           System.out.println(pro.findUserById());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

    }


    public void testdb() {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/专升本?serverTimezone=UTC&characterEncoding=utf-8", "root", "baizc192837465");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
