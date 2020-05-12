package com.qf.authen.controller;
import com.qf.authen.entity.Admin;
import com.qf.authen.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource(name = "adminService")
    private AdminService adminService;
    //跳转登录
    @RequestMapping("/tologin")
    public String gotoLogin(){
        return "/behind/login";
    }

    @RequestMapping("/login")
    @ResponseBody
    public String login(Admin data, Model model, HttpSession session) {
        System.out.println("测试");
        System.out.println(data.toString());
        List<Admin> list = adminService.login(data);
        String userName=data.getUsername();
        session.setAttribute("userName",userName);
        model.addAttribute("list",list);
        if (list.toString() != "[]") {
            //查到了 可以登录
            return "success";
        }
        return "false";
    }
//退出
@RequestMapping("/exit")
public String loginOut(HttpServletResponse response, HttpServletRequest request)throws ServletException, IOException {
    HttpSession session=request.getSession(false);
    session.removeAttribute("userName");
    return "redirect:/admin/tologin";
}



}
