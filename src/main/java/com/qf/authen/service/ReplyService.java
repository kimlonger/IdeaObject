package com.qf.authen.service;

import com.qf.authen.entity.Reply;

import java.util.List;

public interface ReplyService {
    void addReply(Reply reply);
    List<Reply> findAll();
}
