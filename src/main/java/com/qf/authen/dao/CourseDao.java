package com.qf.authen.dao;
import com.qf.authen.entity.QueryVo;
import com.qf.authen.entity.Course;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CourseDao {
    //显示所有
    //分页查询
    List<Course> queryCourseByQueryVo(QueryVo queryVo);
    //查询总条数
    Integer queryCountByQueryVo (QueryVo queryVo);
    //添加
    public void saveCourse(Course course);
    //根据id删除用户
    void deleteCourseById(Long id);
    //修改
    void  updateCourseById(Course course);
    //根据id查询
    Course  queryCourseById(Long id);
    //查询所有
    List<Course> courseList();
    //查询Course

    //Course findById(Integer id);


    //根据courseid  查询所有；
   Course findAllCourseVideo(Integer id);







}
