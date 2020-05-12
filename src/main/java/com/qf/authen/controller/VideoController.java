package com.qf.authen.controller;
import com.qf.authen.entity.*;
import com.qf.authen.service.*;

import com.qf.authen.utils.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/video")
public class VideoController {
    @Resource(name = "videoService")
    private VideoService videoService;
    @Resource(name = "courseService")
    private CourseService courseService;
    @Resource(name = "speakerService")
    private SpeakerService speakerService;
    @Resource(name = "subjectService")
    private SubjectService subjectService;
    @Resource(name = "recordsService")
    private RecordsService recordsService;
    @Resource(name = "datatypeService")
    private DatatypeService datatypeService;
    @RequestMapping("/list")
    public String videoList(Model model, QueryVo queryVo){

        Page<Video> page=videoService.queryVideoByQueryVo(queryVo);
        List<Speaker> speakerList=speakerService.speakerList();
        List<Course> courseList=courseService.courseList();
        model.addAttribute("page",page);
        model.addAttribute("speakerList",speakerList);
        model.addAttribute("courseList",courseList);
//       //数据回显
       model.addAttribute("title",queryVo.getTitle());
       model.addAttribute("speaker_id",queryVo.getSpeaker_id());
       model.addAttribute("course_id",queryVo.getCourse_id());
        //z主持人 集合
        //课程集合
        return "/behind/videoList";
    }
    @RequestMapping("/addVideo")
    public String  addVideo(Model model){
        List<Speaker> speakerList=speakerService.speakerList();
        List<Course> courseList=courseService.courseList();
        model.addAttribute("speakerList",speakerList);
        model.addAttribute("courseList",courseList);

        return "/behind/addVideo";
    }

    @RequestMapping("/edit")
    public String  queryVideoById(Long id,Model model){
        Video video=videoService.queryVideoById(id);
        model.addAttribute("video",video);
        List<Speaker> speakerList=speakerService.speakerList();
        List<Course> courseList=courseService.courseList();
        model.addAttribute("speakerList",speakerList);
        model.addAttribute("courseList",courseList);
        return "/behind/addVideo";
    }
    @RequestMapping("/saveOrUpdate")
    public void saveOrUpdate(Video video, Long id, HttpServletRequest request, HttpServletResponse response)throws IOException {
        System.out.println("测试传值"+video.toString());
        if(id==null){
           videoService.saveCount(video);
           System.out.println("添加方法测试");
       }else{
           videoService.updateVideoById(video);
           System.out.println("修改方法测试");
       }
        response.sendRedirect(request.getContextPath()+"/video/list");
    }
    @RequestMapping("/videoDel")
    @ResponseBody
    public String videoDel(Long params)
    {
        videoService.deleteVideoById(params);
        return "success";
    }
    @RequestMapping("/delBatchVideos")
    public String  delBatchVideos(Long [] ids) {
        for(int i=0;i<ids.length;i++){
            videoService.deleteVideoById(ids[i]);
        }
        return"redirect:/video/list";
    }
    //展示前台视频信息
    @RequestMapping("/showVideo")
    public String showVideo(Integer videoId, Model model, HttpSession session){
        //根据显示所有
        //根据course_id  查询得到subjectid；
        String email = (String) session.getAttribute("userAccount");
        if(email==null){
            return "redirect:/user/index";
        }
        List<Subject>subjectList= subjectService.findAll();
        List<Datatype>datatypeList=datatypeService.findAll();
        //显示资料列表
        model.addAttribute("datatypeList",datatypeList);

        Video video= videoService.findById(videoId);
        Integer video_id=video.getId();
        String  video_title=video.getTitle();
        Integer video_time=video.getTime();
        String  video_img=video.getImage_url();
        Integer video_num=video.getPlay_num();
        String  video_user=email;
        Records records=new Records();
        records.setVideo_id(video_id);
        records.setVideo_img(video_img);
        records.setVideo_title(video_title);
        records.setVideo_num(video_num);
        records.setVideo_user(video_user);
        records.setVideo_time(video_time);
        recordsService.addRecords(records);
        Course course=courseService.findAllCourseVideo(videoId);
        model.addAttribute("subjectList",subjectList);
        model.addAttribute("video",video);
        model.addAttribute("course",course);
        //此处插入记录表
        return "/before/section";
    }


    //更新次数  根据id 次数+1
    @RequestMapping("/updatePlayNum")
    public void updatePlayNum(@RequestParam("id") Integer id){
        System.out.println(id.toString());
        videoService.addVideoNum(id);
        System.out.println("更新");

        //跳转个人历史记录界面
   }
   @RequestMapping("/showHistory")
   public String showHistory(HttpSession session,Model model){
        //根据邮箱查询记录 跳转至显示界面
        String video_user = (String) session.getAttribute("userAccount");
        if(video_user==null){
           return "redirect:/user/index";
       }
        System.out.println(video_user.toString()+"测试是否得到user");
        List<Records> recordsList=recordsService.findAll(video_user);
        System.out.println(recordsList.toString()+"测试是否得到记录表");
        model.addAttribute("recordsList",recordsList);
        return "/before/history";
   }

}
