package com.qf.authen.controller;
import com.qf.authen.entity.Course;
import com.qf.authen.entity.Datatype;
import com.qf.authen.entity.QueryVo;
import com.qf.authen.entity.Subject;
import com.qf.authen.service.CourseService;
import com.qf.authen.service.DatatypeService;
import com.qf.authen.service.SubjectService;
import com.qf.authen.utils.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/course")

public class CourseController {
    @Resource(name = "courseService")
    private CourseService courseService;
    @Resource(name = "subjectService")
    private SubjectService subjectService;
    @Resource(name = "datatypeService")
    private DatatypeService datatypeService;
    @RequestMapping("/showCourseList")
    public String speakerList(Model model, QueryVo queryVo) {
        Page<Course> page=courseService.queryCourseByQueryVo(queryVo);
        model.addAttribute("page",page);
        return "/behind/courseList";
    }
    //添加
    @RequestMapping("/addCourse")


    public  String saveCourse() {
        return "/behind/addCourse";
    }
    //修改
    @RequestMapping("/edit")
    public  String updateCourseById(Long id,Model model) {
        Course course=courseService.queryCourseById(id);
        model.addAttribute("course",course);
        return "/behind/addCourse";
    }
    //删除
    @RequestMapping("/courseDel")
    @ResponseBody
    public  String deleteCourseById(Long param){
        courseService.deleteCourseById(param);
        return  "success";
    }
    @RequestMapping("/saveOrUpdate")
    public void saveOrUpdate(Course course, Long id, HttpServletRequest request, HttpServletResponse response)throws IOException {
        if(id==null){
           courseService.saveCourse(course);
        }else{
           courseService.updateCourseById(course);
        }
        response.sendRedirect(request.getContextPath()+"/course/showCourseList");
    }

    //course显示所有课程 根据id
        @RequestMapping("/course/{sid}")
        public String course(@PathVariable(name = "sid") Integer id,Model model){
            List<Datatype>datatypeList=datatypeService.findAll();
            //显示资料列表
            Subject subject=subjectService.queryAllInfo(id);
            List<Subject> subjectList = subjectService.findAll();
            model.addAttribute("datatypeList",datatypeList);
            model.addAttribute("subject",subject);
            model.addAttribute("subjectList",subjectList);
            return "/before/course";
    }


}