package com.qf.authen.controller;
import com.qf.authen.entity.*;
import com.qf.authen.service.*;
import com.qf.authen.utils.ImageCut;
import com.qf.authen.utils.MailUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "subjectService")
    private SubjectService subjectService;
    @Resource(name = "datatypeService")
    private DatatypeService datatypeService;
    @Resource(name = "topicService")
    private TopicService topicService;
    @Resource(name = "commentService")
    private CommentService commentService;
    @Resource(name = "replyService")
    private ReplyService replyService;
    //更改资料 集合
    @RequestMapping("/changeProfile")
    public String changeProfile(Model model,HttpSession session){
        String email = (String) session.getAttribute("userAccount");
        if(email==null){
            return "redirect:/user/index";
        }
        User user=userService.queryAll(email);
        user.setEmail(email);
        model.addAttribute("user",user);
        return "/before/change_profile";
    }
    //updateUser更改信息
       @RequestMapping("/updateUser")
    public String updateUser(User user,HttpSession session,Model model){
           String email = (String) session.getAttribute("userAccount");
           if(email==null){
               return "redirect:/user/index";
           }
           user.setEmail(email);
          int i=userService.updateUserById(user);
         session.setAttribute("user",user);
        //跳转当前页面
        return "redirect:/user/showMyProfile";
    }
    //头像显示界面
    @RequestMapping("/changeAvatar")
    public String avatar(Model model,HttpSession session){
        String email = (String) session.getAttribute("userAccount");
        if(email==null){
            return "redirect:/user/index";
        }
        return "/before/change_avatar";
    }
    //头像提交处
   @RequestMapping("/upLoadImage")
    public String upLoadImage(HttpSession session, User user,String x1,String x2,String y1,String y2, MultipartFile image_file)throws Exception{
       int x1Int=50;
       int x2Int=100;
       int y1Int=50;
       int y2Int=100;
        String email = (String) session.getAttribute("userAccount");
       if(email==null){
           return "redirect:/user/index";
       }
        String path = "E:\\apache-tomcat-8.5.43-file\\webapps\\uploadfile\\images";
        // 判断，该路径是否存在
        File file = new File(path);
        if(!file.exists()){
            // 创建该文件夹
            file.mkdirs();
        }
        // 说明上传文件项
        // 获取上传文件的名称
        String fileName = image_file.getOriginalFilename();
        // 把文件的名称设置唯一值，uuid
        String uuid = UUID.randomUUID().toString().replace("-", "");
       fileName = uuid+"_"+fileName;
        // 完成文件上传
        image_file.transferTo(new File(path,fileName));
        if (x1.equals("")||x2.equals("")||y1.equals("")||y2.equals("")){
            new ImageCut().cutImage(path+"/"+ fileName,x1Int,y1Int,x2Int-x1Int,y2Int-y1Int);
            user.setEmail(email);
            user.setImgUrl(fileName);
            userService.updateUserImg(user);
            return "redirect:/user/showMyProfile";
        }else {
            x1Int = (int) Double.parseDouble(x1);
            x2Int = (int) Double.parseDouble(x2);
            y1Int = (int) Double.parseDouble(y1);
            y2Int = (int) Double.parseDouble(y2);
            new ImageCut().cutImage(path+"/"+ fileName,x1Int,y1Int,x2Int-x1Int,y2Int-y1Int);
            user.setEmail(email);
            user.setImgUrl(fileName);
            userService.updateUserImg(user);
            return "redirect:/user/showMyProfile";
        }
    }

    @RequestMapping("/showMyProfile")
    public String myProfile(HttpSession session,Model model){
        String email = (String) session.getAttribute("userAccount");
        if(email==null){
            return "redirect:/user/index";
        }
        User user=userService.queryAll(email);
        user.setEmail(email);
        session.setAttribute("user",user);
        System.out.println(user.toString());
        model.addAttribute("user",user);
        return "/before/my_profile";
    }

    //登录
    @RequestMapping("/loginUser")
    @ResponseBody
    public String login(User user1, HttpSession session){
        List<User> list= userService.login(user1);
        if(list.toString()!="[]"){
            //找到可以登录
            String email=user1.getEmail();
            // 2.将用户名保存在session中
            User user=userService.queryAll(email);
            session.setAttribute("userAccount",user.getEmail());
            return "success";
        }
        return "error";
    }
    //注册
    @RequestMapping("/insertUser")
    @ResponseBody
    public  String insertUser( User user)throws IOException {
        int flag= userService.addUser(user);
       if(flag>0){
           return "success";
       }
        return  "error";
    }
    //验证邮箱查询是否被注册
    @RequestMapping("/validateEmail")
    @ResponseBody
    public String queryUserByEmail(@RequestParam("email") String email){
       List<User> list= userService.queryUserByEmail(email);
       if (list.toString()!="[]"){
           //不能注册
           return "error";
     }
           //可以注册
         return "success";
    }
    //修改密码提交处
    @RequestMapping("/updatePassword")
    public String updatePassword(HttpSession session,User user){
        String email = (String) session.getAttribute("userAccount");
        if(email==null){
            return "redirect:/user/index";
        }
        user.setEmail(email);
        userService.updateUserByEmail(user);
        //转发到 显示信息
        return "redirect:/user/showMyProfile";
    }
    //首页
    @RequestMapping("/index")
    public String index(Model model){
       List<Subject>subjectList= subjectService.findAll();
       List<Datatype>datatypeList=datatypeService.findAll();
       //显示资料列表
        model.addAttribute("datatypeList",datatypeList);
        model.addAttribute("subjectList",subjectList);
        return "/before/index";
    }

    //密码显示界面
    @RequestMapping("passwordSafe")
    public String passwordSafe(HttpSession session){
        String email = (String) session.getAttribute("userAccount");
        if(email==null){
            return "redirect:/user/index";
        }
        return "/before/password_safe";
    }
    //验证密码
    @RequestMapping("/validatePassword")
    @ResponseBody
    public String validatePassword(HttpSession session,@RequestParam ("password" )String password,User user){
        String email = (String) session.getAttribute("userAccount");
        if(email==null){
            return "redirect:/user/index";
        }
        user.setEmail(email);
        System.out.println(email);
        System.out.println(password);
        user.setPassword(password);
        List<User> list=userService.login(user);
        if(list.toString()!="[]"){
            return "success";
        }
        return  "error";
    }

    //忘记密码
    @RequestMapping("/forgetPassword")
    public String forgetPassword( ){

        return "/before/forget_password";
    }
    //发送邮件   验证邮箱
    @RequestMapping("/sendEmail")
    @ResponseBody
    public String sendEmail(@RequestParam("email") String email,User user){
        System.out.println("测试是否接收到email"+email);
        List<User> list=userService.queryUserByEmail(email);
        if(list.toString()!="[]"){
            //查询到了  可以发送验证码返回success
            String code=MailUtils.getValidateCode(6);
            MailUtils.sendMail("1550579289@qq.com","hello","验证邮箱"+code);
            System.out.println("发送成功");
            System.out.println("测试验证码"+code);
            //根据邮箱把验证码插入数据库  修改方法
            user.setEmail(email);
            user.setCode(code);
            int flag=userService.updateUserCode(user);
            System.out.println("修改验证码成功");
            //
            return "success";
        }
        //没有查询到返回hasNoUser
        //查询是否存在邮箱  存在发送验证码  不存在 返回未注册
        return "hasNoUser";
    }
    //验证验证码是否正确
    @RequestMapping("/validateEmailCode")
    public String  validateEmailCode(User user,HttpSession session){
        System.out.println(user.toString()+"测试前台user传值");
        //调用判断方法
        List<User> list=userService.queryUserCode(user);
        if(list.toString()=="[]"){
            //跳转重新登录
            System.out.println("失败");
            return "false";
    }
        session.setAttribute("email",user.getEmail());
        //成功
        //将email 放入session里
        return  "/before/reset_password";
    }
  //密码重置后的 修改
    @RequestMapping("/resetPassword")
    public String resetPassword(HttpSession session, User user){
        System.out.println("测试user是否接收到"+user.getEmail().toString());
        //根据邮箱获取密码 转发登录界面
        int flag=userService.updateUserByEmail(user);
        System.out.println("测试密码"+user.getPassword().toString());
        System.out.println("更改方法成功");
        //返回登录界面 进行登录
        return "redirect:/user/index";
    }
    //显示一封信


    //显示跳转
    @RequestMapping("/section")
    public String section(Model model){
        List<Subject>subjectList= subjectService.findAll();
        System.out.println(subjectList.toString());
        model.addAttribute("subjectList",subjectList);
        return "/before/section";
    }
    //退出功能
    @RequestMapping("/loginOut2")
    public String loginOut2(HttpServletResponse response,HttpServletRequest request)throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        session.removeAttribute("userAccount");
        return "redirect:/user/index";
    }

    //退出功能
    @RequestMapping("/loginOut")
    public String loginOut(HttpServletResponse response,HttpServletRequest request)throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        session.removeAttribute("userAccount");
        return "redirect:/user/index";
    }
    //前往发帖区
    @RequestMapping("/article")
    public String toArticle(HttpSession session){
        String email = (String) session.getAttribute("userAccount");
        session.setAttribute("userAccount",email);
        return "/before/article";
    }
    //帖子展示
    @RequestMapping("/showarticle")
    public String Article( HttpSession session,Model model){
        String email = (String) session.getAttribute("userAccount");
        session.setAttribute("userAccount",email);
        List<Topic> topicList=topicService.findAll();
        model.addAttribute("topicList",topicList);
        return "/before/showarticle";
    }
    //帖子插入
    @RequestMapping("/addTopic")
    public  String  addTopic(Topic topic,HttpSession session){
        String email = (String) session.getAttribute("userAccount");
        if(email==null){
            return "redirect:/user/index";
        }
        session.setAttribute("userAccount",email);
        String topic_img= "http://localhost:8081/uploadfile/pro/111.jpg";
        topic.setTopic_img(topic_img);
        topicService.addTopic(topic);
        return "redirect:/user/showarticle";
    }
    // 展示问题 回复界面
    @RequestMapping("/reply")
    public String reply(Integer id,Model model,HttpSession session){
        //根据id 得到具体文章
        String email = (String) session.getAttribute("userAccount");
        if(email==null){
            return "redirect:/user/index";
        }
        Topic topic=topicService.findTopicById(id);


        User user=userService.queryAll(email);
        List<Comment> commentList= commentService.findAll();
        List<Reply> replyList=replyService.findAll();
        model.addAttribute("topic",topic);
        model.addAttribute("user",user);
        model.addAttribute("replyList",replyList);
        model.addAttribute("commentList",commentList);
        return "/before/reply";
    }

    //添加留言
    @RequestMapping("/addcomment")
    public String addComment(Comment comment,HttpSession session){
        String email = (String) session.getAttribute("userAccount");
        if(email==null){
            return "redirect:/user/index";
        }
        if(comment.getC_content()!=null&& !comment.getC_content().equals("")) {
            commentService.addComment(comment);
        }
        return "redirect:/user/reply?id="+comment.getC_contentid();
    }

    @RequestMapping("/addreply")
    public String addReply(Reply reply,HttpSession session){
        String email = (String) session.getAttribute("userAccount");
        if(email==null){
            return "redirect:/user/index";
        }
        if (reply.getR_content()!=null&& !reply.getR_content().equals("")) {
           replyService.addReply(reply);
        }
        return "redirect:/user/reply?id="+reply.getR_contentid();
    }


}
