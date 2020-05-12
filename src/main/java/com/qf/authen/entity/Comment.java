package com.qf.authen.entity;

public class Comment {
    private Integer id;
    private String c_userid;
    private Integer c_contentid;
    private String c_otherid;
    private Integer c_state;
    private String c_content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getC_userid() {
        return c_userid;
    }

    public void setC_userid(String c_userid) {
        this.c_userid = c_userid;
    }

    public Integer getC_contentid() {
        return c_contentid;
    }

    public void setC_contentid(Integer c_contentid) {
        this.c_contentid = c_contentid;
    }

    public String getC_otherid() {
        return c_otherid;
    }

    public void setC_otherid(String c_otherid) {
        this.c_otherid = c_otherid;
    }

    public Integer getC_state() {
        return c_state;
    }

    public void setC_state(Integer c_state) {
        this.c_state = c_state;
    }

    public String getC_content() {
        return c_content;
    }

    public void setC_content(String c_content) {
        this.c_content = c_content;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", c_userid='" + c_userid + '\'' +
                ", c_contentid=" + c_contentid +
                ", c_otherid='" + c_otherid + '\'' +
                ", c_state=" + c_state +
                ", c_content='" + c_content + '\'' +
                '}';
    }
}
