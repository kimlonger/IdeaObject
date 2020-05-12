package com.qf.authen.dao;
import com.qf.authen.entity.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AdminDao {
    //登录
    public List<Admin> login(Admin admin);
}
