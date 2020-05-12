package com.qf.authen.service.impl;

import com.qf.authen.dao.CourseDao;
import com.qf.authen.entity.QueryVo;
import com.qf.authen.service.CourseService;
import com.qf.authen.entity.Course;
import com.qf.authen.utils.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
 @Resource(name = "courseDao")
    private CourseDao courseDao;
    @Override
    public List<Course> courseList() {
        return courseDao.courseList();
    }

    @Override
    public Page<Course> queryCourseByQueryVo(QueryVo queryVo) {
        // 设置查询条件,从哪一条数据开始查
        queryVo.setStart((queryVo.getPage() - 1) * queryVo.getRows());
        // 查询数据结果集
        List<Course> list=courseDao.queryCourseByQueryVo(queryVo);
        // 查询到的数据总条数
        Integer total=courseDao.queryCountByQueryVo(queryVo);
        Page<Course> videoPage=new Page<Course>();
        //查询数据
        videoPage.setRows(list);
        videoPage.setPage(queryVo.getPage());
        videoPage.setSize(queryVo.getRows());
        videoPage.setTotal(total);
        return videoPage;
    }

    @Override
    public void saveCourse(Course course) {
        courseDao.saveCourse(course);
    }

    @Override
    public void deleteCourseById(Long id) {
        courseDao.deleteCourseById(id);

    }

    @Override
    public void updateCourseById(Course course) {
        courseDao.updateCourseById(course);
    }

    @Override
    public Course queryCourseById(Long id) {
        return courseDao.queryCourseById(id);
    }

    @Override
    public Course findAllCourseVideo(Integer id) {
        return courseDao.findAllCourseVideo(id);
    }

//    @Override
//    public Course findById(Integer id) {
//        return courseDao.findById(id);
//    }


}
