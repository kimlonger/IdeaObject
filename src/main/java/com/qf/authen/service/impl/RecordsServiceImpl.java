package com.qf.authen.service.impl;

import com.qf.authen.dao.RecordsDao;
import com.qf.authen.entity.Records;
import com.qf.authen.service.RecordsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("recordsService")
public class RecordsServiceImpl implements RecordsService {
    @Resource(name ="recordsDao" )
    private RecordsDao recordsDao;
    @Override
    public void addRecords(Records records) {
        recordsDao.addRecords(records);
    }

    @Override
    public List<Records> findAll(String video_user) {
        return recordsDao.findAll(video_user);
    }
}
