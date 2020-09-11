package main.java.main;


import main.java.dao.output;
import main.java.dao.tool;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;

public class Console {

    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("main/resources/spring.xml");
        output a = (output) context.getBean("test_out");
        a.print();
//        tool b=(tool)context.getBean("test_aspect");
//        b.p();
    }


}
