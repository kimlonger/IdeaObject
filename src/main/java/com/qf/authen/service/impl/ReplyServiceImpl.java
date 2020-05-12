package com.qf.authen.service.impl;

import com.qf.authen.dao.ReplyDao;
import com.qf.authen.entity.Reply;
import com.qf.authen.service.ReplyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
    @Resource(name = "replyDao")
    private ReplyDao replyDao;
    @Override
    public void addReply(Reply reply) {
        replyDao.addReply(reply);
    }

    @Override
    public List<Reply> findAll() {
        return replyDao.findAll();
    }
}
