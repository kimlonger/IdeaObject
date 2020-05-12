package com.qf.authen.entity;

public class New {
    private String new_time;
    private Integer id;
    private String new_comment_user;
    private Integer new_topic_id;
    private Integer status;

    public String getNew_time() {
        return new_time;
    }

    public void setNew_time(String new_time) {
        this.new_time = new_time;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNew_comment_user() {
        return new_comment_user;
    }

    public void setNew_comment_user(String new_comment_user) {
        this.new_comment_user = new_comment_user;
    }

    public Integer getNew_topic_id() {
        return new_topic_id;
    }

    public void setNew_topic_id(Integer new_topic_id) {
        this.new_topic_id = new_topic_id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "New{" +
                "new_time='" + new_time + '\'' +
                ", id=" + id +
                ", new_comment_user='" + new_comment_user + '\'' +
                ", new_topic_id=" + new_topic_id +
                ", status=" + status +
                '}';
    }
}
