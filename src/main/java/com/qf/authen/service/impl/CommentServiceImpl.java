package com.qf.authen.service.impl;

import com.qf.authen.dao.CommentDao;
import com.qf.authen.entity.Comment;
import com.qf.authen.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("commentService")
public class CommentServiceImpl implements CommentService {
    @Resource(name = "commentDao")
    private CommentDao commentDao;
    @Override
    public List<Comment> findAll() {
        return commentDao.findAll();
    }

    @Override
    public void addComment(Comment comment) {
        commentDao.addComment(comment);
    }
}
