package com.qf.authen.dao;

import com.qf.authen.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserDao {
    //注册
     int addUser(User user);
     //验证注册
     List<User> queryUserByEmail(String email);
    //登录
    List<User> login(User user);
    //更改资料  邮箱  id  不修改
    int updateUserById(User user);
    //根据邮箱查找表内所有信息放入session
    User queryAll(String email);
    //更改密码 根据邮箱
    int updateUserByEmail(User user);
    //图片上传  更改头像
    int  updateUserImg(User user);
    //根据邮箱 对验证码进行修改
    int updateUserCode(User user);
    //验证验证码是否正确
    List<User> queryUserCode (User user);

}
