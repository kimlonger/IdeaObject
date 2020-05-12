package com.qf.authen.service.impl;

import com.qf.authen.dao.AdminDao;
import com.qf.authen.entity.Admin;
import com.qf.authen.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Resource(name = "adminDao")
    private AdminDao adminDao;
    @Override
    public List<Admin> login(Admin admin) {
       return adminDao.login(admin);
    }
}
