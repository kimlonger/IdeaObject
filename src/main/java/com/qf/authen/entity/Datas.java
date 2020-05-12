package com.qf.authen.entity;

public class Datas {
    private Integer id;
    private String title;
    private String detail;
    private  Integer dlnum;
    private String author;
    private String data_url;
    private  String img_url;
    private Integer type_id;
    private String test1;
    private String test2;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getDlnum() {
        return dlnum;
    }

    public void setDlnum(Integer dlnum) {
        this.dlnum = dlnum;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getData_url() {
        return data_url;
    }

    public void setData_url(String data_url) {
        this.data_url = data_url;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public Integer getType_id() {
        return type_id;
    }

    public void setType_id(Integer type_id) {
        this.type_id = type_id;
    }

    public String getTest1() {
        return test1;
    }

    public void setTest1(String test1) {
        this.test1 = test1;
    }

    public String getTest2() {
        return test2;
    }

    public void setTest2(String test2) {
        this.test2 = test2;
    }

    @Override
    public String toString() {
        return "DatasDao{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", detail='" + detail + '\'' +
                ", dlnum=" + dlnum +
                ", author='" + author + '\'' +
                ", data_url='" + data_url + '\'' +
                ", img_url='" + img_url + '\'' +
                ", type_id=" + type_id +
                ", test1='" + test1 + '\'' +
                ", test2='" + test2 + '\'' +
                '}';
    }
}
