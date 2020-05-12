package com.qf.authen.dao;

import com.qf.authen.entity.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CommentDao {
    //显示所有
    List<Comment> findAll();
    //增加评论
    void addComment(Comment comment);
}
