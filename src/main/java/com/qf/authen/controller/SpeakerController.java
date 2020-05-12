package com.qf.authen.controller;

import com.qf.authen.entity.QueryVo;
import com.qf.authen.entity.Speaker;
import com.qf.authen.service.SpeakerService;
import com.qf.authen.utils.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@Controller
@RequestMapping("/speaker")
public class SpeakerController {
    @Resource(name = "speakerService")
    private SpeakerService speakerService;
    @RequestMapping("/showSpeakerList")

    public String speakerList(Model model, QueryVo queryVo) {
        Page<Speaker> page=speakerService.querySpeakerByQueryVo(queryVo);
        model.addAttribute("page",page);
        return "/behind/speakerList";
    }
    //添加
     @RequestMapping("/addSpeaker")
     public  String saveSpeaker() {
        return "/behind/addSpeaker";
    }

    //修改
    @RequestMapping("/edit")
    public  String updateSpeakerById(Long id,Model model) {
         Speaker speaker=speakerService.querySpeakerById(id);
         model.addAttribute("speaker",speaker);
        return "/behind/addSpeaker";
    }
    //删除
    @RequestMapping("/speakerDel")
    @ResponseBody
    public  String deleteSpeakerById(Long param){
        speakerService.deleteSpeakerById(param);
        return  "success";
    }

    @RequestMapping("/saveOrUpdate")
    public void saveOrUpdate(Speaker speaker, Long id, HttpServletRequest request, HttpServletResponse response)throws IOException {
        if(id==null){
           speakerService.saveSpeaker(speaker);
            System.out.println("添加");
        }else{
           speakerService.updateSpeakerById(speaker);
            System.out.println("编辑");
        }
        response.sendRedirect(request.getContextPath()+"/speaker/showSpeakerList");
    }
}
