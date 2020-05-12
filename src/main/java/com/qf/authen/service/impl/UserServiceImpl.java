package com.qf.authen.service.impl;

import com.qf.authen.dao.UserDao;
import com.qf.authen.entity.User;
import com.qf.authen.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource(name = "userDao")
    private UserDao userDao;
    @Override
    public int addUser(User user) {
       return userDao.addUser(user);
    }

    @Override
    public List<User> queryUserByEmail(String email) {
        return userDao.queryUserByEmail(email);
    }

    @Override
    public List<User> login(User user) {
        return userDao.login(user);
    }

    @Override
    public int updateUserById(User user) {
        return userDao.updateUserById(user);

    }

    @Override
    public User queryAll(String email) {
        return userDao.queryAll(email);
    }

    @Override
    public int updateUserByEmail(User user) {
        return userDao.updateUserByEmail(user);
    }

    @Override
    public int updateUserImg(User user) {
        return userDao.updateUserImg(user);
    }

    @Override
    public int updateUserCode(User user) {
        return userDao.updateUserCode(user);
    }

    @Override
    public List<User> queryUserCode(User user) {
        return userDao.queryUserCode(user);
    }


}
