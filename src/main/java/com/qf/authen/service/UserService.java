package com.qf.authen.service;

import com.qf.authen.entity.User;

import java.util.List;

public interface UserService {
    //注册
    public int addUser(User user);
    //验证邮箱
    List<User> queryUserByEmail(String email);
    //登录
    List<User> login(User user);

    //更改资料
    int updateUserById(User user);
   //根据邮箱查所有
    User queryAll(String email);
    //根据邮箱修改密码
    int updateUserByEmail(User user);
    //根据邮箱修改图片
    int  updateUserImg(User user);
    //根据邮箱操作验证码
    int updateUserCode(User user);
    //验证验证码是否正确
    List<User> queryUserCode (User user);
}
