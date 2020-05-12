package com.qf.authen.dao;

import com.qf.authen.entity.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class UserDaoTest {

    @Test
    public void addUser() {
        ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
        UserDao userDao=context.getBean(UserDao.class);
        String email="qq.com";

       List<User> list= userDao.queryUserByEmail(email);
       if(list.toString()!="[]"){
           System.out.println("查到了不能注册");
       }else{
           System.out.println("可以注册");
       }

    }

    @Test
    public void addUser1() {
    }

    @Test
    public void queryUserByEmail() {

    }

    @Test
    public void queryUserByEmail1() {
    }
}