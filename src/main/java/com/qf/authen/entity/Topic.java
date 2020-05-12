package com.qf.authen.entity;

import java.util.HashSet;
import java.util.Set;

public class Topic {
    private String title;
    private Integer id;
    private String content;
    private String topic_time;
    private Integer comment_count;
    private String topic_user;
    private Integer status;
    private  String  topic_img;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTopic_time() {
        return topic_time;
    }

    public void setTopic_time(String topic_time) {
        this.topic_time = topic_time;
    }

    public Integer getComment_count() {
        return comment_count;
    }

    public void setComment_count(Integer comment_count) {
        this.comment_count = comment_count;
    }

    public String getTopic_user() {
        return topic_user;
    }

    public void setTopic_user(String topic_user) {
        this.topic_user = topic_user;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getTopic_img() {
        return topic_img;
    }

    public void setTopic_img(String topic_img) {
        this.topic_img = topic_img;
    }

    @Override
    public String toString() {
        return "Topic{" +
                "title='" + title + '\'' +
                ", id=" + id +
                ", content='" + content + '\'' +
                ", topic_time='" + topic_time + '\'' +
                ", comment_count=" + comment_count +
                ", topic_user='" + topic_user + '\'' +
                ", status=" + status +
                ", topic_img='" + topic_img + '\'' +
                '}';
    }
}
