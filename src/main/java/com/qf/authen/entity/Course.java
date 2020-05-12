package com.qf.authen.entity;
import java.util.List;
public class Course {
    private Integer id;
    private String course_title;
    private String  course_desc;
    private Integer subject_id;
    private Subject subject;
    private List<Speaker> speakerList;
    private List<Video> videoList;
    private  Speaker speaker;

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", course_title='" + course_title + '\'' +
                ", course_desc='" + course_desc + '\'' +
                ", subject_id=" + subject_id +
                ", subject=" + subject +
                ", speakerList=" + speakerList +
                ", videoList=" + videoList +
                ", speaker=" + speaker +
                '}';
    }

    public Speaker getSpeaker() {
        return speaker;
    }

    public void setSpeaker(Speaker speaker) {
        this.speaker = speaker;
    }

    public List<Video> getVideoList() {
        return videoList;
    }

    public void setVideoList(List<Video> videoList) {
        this.videoList = videoList;
    }

    public List<Speaker> getSpeakerList() {
        return speakerList;
    }

    public void setSpeakerList(List<Speaker> speakerList) {
        this.speakerList = speakerList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourse_title() {
        return course_title;
    }

    public void setCourse_title(String course_title) {
        this.course_title = course_title;
    }

    public String getCourse_desc() {
        return course_desc;
    }

    public void setCourse_desc(String course_desc) {
        this.course_desc = course_desc;
    }

    public Integer getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(Integer subject_id) {
        this.subject_id = subject_id;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }


}
