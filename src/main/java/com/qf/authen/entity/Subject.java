package com.qf.authen.entity;

import java.util.List;

public class Subject {
    private Integer id;
    private String subject_name;
    private List<Course> courseList;
    private List<Video> videoList;

    @Override
    public String toString() {
        return "Subject{" +
                "id=" + id +
                ", subject_name='" + subject_name + '\'' +
                ", courseList=" + courseList +
                ", videoList=" + videoList +
                ", course=" + course +
                '}';
    }

    public List<Video> getVideoList() {
        return videoList;
    }

    public void setVideoList(List<Video> videoList) {
        this.videoList = videoList;
    }

    private Course course;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSubject_name() {
        return subject_name;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public List<Course> getCourseList() {
        return courseList;
    }

    public void setCourseList(List<Course> courseList) {
        this.courseList = courseList;
    }
}
