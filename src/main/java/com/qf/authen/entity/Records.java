package com.qf.authen.entity;

public class Records {
    private Integer id;
    private Integer video_id;
    private String  video_title;
    private Integer video_time;
    private String video_img;
    private Integer video_num;
    private String video_user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVideo_id() {
        return video_id;
    }

    public void setVideo_id(Integer video_id) {
        this.video_id = video_id;
    }

    public String getVideo_title() {
        return video_title;
    }

    public void setVideo_title(String video_title) {
        this.video_title = video_title;
    }

    public Integer getVideo_time() {
        return video_time;
    }

    public void setVideo_time(Integer video_time) {
        this.video_time = video_time;
    }

    public String getVideo_img() {
        return video_img;
    }

    public void setVideo_img(String video_img) {
        this.video_img = video_img;
    }

    public Integer getVideo_num() {
        return video_num;
    }

    public void setVideo_num(Integer video_num) {
        this.video_num = video_num;
    }

    public String getVideo_user() {
        return video_user;
    }

    public void setVideo_user(String video_user) {
        this.video_user = video_user;
    }

    @Override
    public String toString() {
        return "Records{" +
                "id=" + id +
                ", video_id=" + video_id +
                ", video_title='" + video_title + '\'' +
                ", video_time=" + video_time +
                ", video_img='" + video_img + '\'' +
                ", video_num=" + video_num +
                ", video_user='" + video_user + '\'' +
                '}';
    }
}
