package com.qf.authen.service;

import com.qf.authen.entity.Topic;

import java.util.List;

public interface TopicService {
    public void addTopic(Topic topic);
    //显示所有
    public List<Topic> findAll();

    public Topic findTopicById(Integer id);
}
