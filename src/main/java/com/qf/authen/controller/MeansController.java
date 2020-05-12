package com.qf.authen.controller;

import com.qf.authen.dao.DatasDao;
import com.qf.authen.entity.Datas;
import com.qf.authen.entity.Datatype;
import com.qf.authen.entity.Subject;
import com.qf.authen.service.DatasDaoService;
import com.qf.authen.service.DatatypeService;
import com.qf.authen.service.SubjectService;
import com.qf.authen.service.impl.DatasDaoServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/means")
public class MeansController {
    @Resource(name = "datasDaoService")
    private DatasDaoService datasDaoService;
    @Resource(name = "subjectService")
    private SubjectService subjectService;
    @Resource(name = "datatypeService")
    private DatatypeService datatypeService;
    //跳转资料下载
    @RequestMapping("/toMeans")

    public String toMeans(HttpSession session){
        String email = (String) session.getAttribute("userAccount");
        if(email==null){
            return "redirect:/user/index";
        }
        return "/before/means";
    }

    //course显示所有课程 根据id
    @RequestMapping("/means/{id}")
    public String means(@PathVariable(name = "id") Integer id, Model model, HttpSession session){
         String email = (String) session.getAttribute("userAccount");
         if(email==null){
            return "redirect:/user/index";
         }
         List<Subject>subjectList= subjectService.findAll();
         List<Datatype>datatypeList=datatypeService.findAll();
        //显示资料列表
         Integer type_id=id;
         List<Datas> datasList=datasDaoService.findAll(type_id);
         System.out.println(datasList.toString()+"测试资料下载显示");
         model.addAttribute("datatypeList",datatypeList);
         model.addAttribute("subjectList",subjectList);
         model.addAttribute("datasList",datasList);
        //根据id 查询得到的资料
        return "/before/means";
    }
    @RequestMapping("/aboutme")
    public String aboutMe(){
        return "/before/aboutme";
    }
}
