package com.qf.authen.service;

import com.qf.authen.entity.Course;
import com.qf.authen.entity.QueryVo;
import com.qf.authen.utils.Page;

import java.util.List;

public interface CourseService {
    List<Course> courseList();

    /**
     * 分页查询
     */
    public Page<Course> queryCourseByQueryVo(QueryVo queryVo);

    //添加
    public void saveCourse(Course course);
    //根据id删除用户
    void deleteCourseById(Long id);
    //修改
    void  updateCourseById(Course course);
    //根据id查询
    Course queryCourseById(Long id);

    //Course findById(Integer id);

    Course findAllCourseVideo(Integer id);


}
