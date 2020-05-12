package com.qf.authen.service.impl;

import com.qf.authen.dao.SubjectDao;
import com.qf.authen.entity.Subject;
import com.qf.authen.service.SubjectService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {
    @Resource(name = "subjectDao")
    private SubjectDao subjectDao;

    @Override
    public Subject queryAllInfo(Integer id) {
        return subjectDao.queryAllInfo(id);
    }

    @Override
    public List<Subject> findAll() {
        return subjectDao.findAll();
    }
}
