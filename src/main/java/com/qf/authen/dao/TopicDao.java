package com.qf.authen.dao;

import com.qf.authen.entity.Topic;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TopicDao {
    //插入
    public void addTopic(Topic topic);
    //显示所有
    public List<Topic> findAll();
    //根据id 得到具体记录
    public Topic findTopicById(Integer id);
}
