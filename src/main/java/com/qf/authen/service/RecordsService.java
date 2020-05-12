package com.qf.authen.service;

import com.qf.authen.entity.Records;

import java.util.List;

public interface RecordsService {
    //表插入
    public void addRecords(Records records);
    //根据 邮箱查询记录
    List<Records> findAll(String video_user);
}
