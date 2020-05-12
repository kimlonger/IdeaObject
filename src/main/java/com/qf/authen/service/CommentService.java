package com.qf.authen.service;

import com.qf.authen.entity.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> findAll();
    //增加评论
    void addComment(Comment comment);
}
