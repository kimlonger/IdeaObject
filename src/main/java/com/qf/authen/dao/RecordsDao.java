package com.qf.authen.dao;

import com.qf.authen.entity.Records;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecordsDao {
    //表插入
    public void addRecords(Records records);
    //根据 邮箱查询记录
    List<Records> findAll(String video_user);
}
