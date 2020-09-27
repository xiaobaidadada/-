package main.java.dao.mybatis;

import com.mysql.cj.Session;
import main.java.dao.mybatis.persion;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.apache.ibatis.session.SqlSession;

public class service extends SqlSessionDaoSupport {
    private SqlSessionFactoryBean As;

    public void pri() {
        SqlSession s = this.getSqlSession();//默认获取
        persion per = s.selectOne("selectuserid");


        System.out.println(per.getName());
    }


}

