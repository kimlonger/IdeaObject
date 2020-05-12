package com.qf.authen.dao;

import com.qf.authen.entity.Reply;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyDao {
    //新增
    void addReply(Reply reply);

    List<Reply> findAll();

}
