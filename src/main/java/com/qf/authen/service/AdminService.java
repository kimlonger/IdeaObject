package com.qf.authen.service;

import com.qf.authen.entity.Admin;

import java.util.List;

public interface AdminService {
    public List<Admin> login(Admin admin);
}
