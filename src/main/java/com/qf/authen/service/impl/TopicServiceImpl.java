package com.qf.authen.service.impl;

import com.qf.authen.dao.TopicDao;
import com.qf.authen.entity.Topic;
import com.qf.authen.service.TopicService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("topicService")
public class TopicServiceImpl implements TopicService {
    @Resource(name = "topicDao")
    private TopicDao topicDao;
    @Override
    public void addTopic(Topic topic) {
        topicDao.addTopic(topic);
    }

    @Override
    public List<Topic> findAll() {
        return topicDao.findAll();
    }

    @Override
    public Topic findTopicById(Integer id) {
        return topicDao.findTopicById(id);
    }
}
