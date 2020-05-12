package com.qf.authen.service.impl;

import com.qf.authen.dao.DatatypeDao;
import com.qf.authen.entity.Datatype;
import com.qf.authen.service.DatatypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("datatypeService")
public class DatatypeServiceImpl implements DatatypeService {
    @Resource(name = "datatypeDao")
    private DatatypeDao datatypeDao;
    @Override
    public List<Datatype> findAll() {
        return datatypeDao.findAll();
    }
}
