package main.java.dao.mybatis;


import org.apache.ibatis.annotations.Select;
import main.java.dao.mybatis.persion;

public interface proxy {

    @Select("SELECT * FROM user")
    public persion findUserById() throws Exception;
}
