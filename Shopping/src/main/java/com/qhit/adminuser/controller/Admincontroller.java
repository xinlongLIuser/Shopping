package com.qhit.adminuser.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qhit.adminuser.pojo.AdminUser;
import com.qhit.adminuser.service.AdminuserService;
import com.qhit.baseRole.pojo.BaseRole;
import com.qhit.user.service.UserService;
import com.qhit.utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebService;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")

public class Admincontroller {
    @Autowired
    AdminuserService adminuserService ;

    @RequestMapping("/login")
//    @ResponseBody
    public void login(AdminUser user, HttpServletResponse response, HttpServletRequest request) throws Exception {
        user = adminuserService.login(user);
        String result = "";

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("sessionUser", user);
            result = "Y";
        } else {
            result = "N";
        }
        response.getWriter().write(result);

//        return  "index/index";
    }

    /*
     修改密码
     */
    @RequestMapping("/oldPassword")
    public void oldPassword(AdminUser user, HttpServletResponse response) throws IOException {
        boolean flag = adminuserService.oldPassword(user);
        response.getWriter().write(flag ? "Y" : "N");
    }

    @RequestMapping("/updatePassword")
    public void updatePassword(AdminUser user, HttpServletResponse response) throws IOException {
        MD5 md5 = new MD5();
        user.setPassword(md5.getMD5ofStr(user.getPassword()));
        boolean flag = adminuserService.updateByPrimaryKey(user);
        response.getWriter().write(flag ? "Y" : "N");
    }

    /*
    删除
     */
    @RequestMapping("/delete")
    public void delete(@RequestParam("uid") Integer uid, HttpServletResponse response) throws Exception {
        boolean flag = adminuserService.deleteByPrimaryKey(uid);
        response.getWriter().write(flag ? "Y" : "N");
    }

    @RequestMapping("/Insert")
//    @ResponseBody
    public void insert(AdminUser user, HttpServletResponse response) throws Exception {
        MD5 md5 = new MD5();
        user.setPassword(md5.getMD5ofStr(user.getPassword()));
        boolean flag = adminuserService.insertSelective(user);
        response.getWriter().write(flag ? "Y" : "N");
    }

    /*
    修改后台用户信息
     */
    @RequestMapping("/load")
    public String load(HttpServletRequest request, Model model,  AdminUser baseUser) {
        baseUser = adminuserService.selectByPrimaryKey(baseUser.getUid());
        request.setAttribute("adminuser", baseUser);
//        model.addAttribute("baseUser",baseUser);
        return "admin/edit";
    }

    //
    @RequestMapping("/update")
    @ResponseBody
    public String update(AdminUser baseUser) {
        MD5 md5 = new MD5();
        baseUser.setPassword(md5.getMD5ofStr(baseUser.getPassword()));
        boolean flag = adminuserService.updateByPrimaryKeySelective(baseUser);
        return flag ? "Y" : "N";
    }


    @RequestMapping("/AdminuserList")
    public String AdminList(Model model, @RequestParam(required = true, defaultValue = "1") Integer pageNo, AdminUser user) {
        PageHelper.startPage(pageNo, 10);
        List list = adminuserService.selectByList();
        PageInfo pageInfo = new PageInfo(list);

        model.addAttribute("list", list);
        model.addAttribute("pageBean", pageInfo);
        model.addAttribute("searchObject", user);
        return "admin/list";
    }

    @RequestMapping("/distributeLoad")
    public String distributeLoad(AdminUser baseUser, Model model) {
        List<BaseRole> leftList = adminuserService.distributeLeft(baseUser);
        List<BaseRole> rightList = adminuserService.distributeRight(baseUser);
        model.addAttribute("leftList", leftList);
        model.addAttribute("rightList", rightList);
        model.addAttribute("uid", baseUser.getUid());
        return "admin/distribute";
    }

    @RequestMapping("distributeUpdate")
    public String distributeUpdate(AdminUser adminUser, HttpServletRequest request) {

        String[] rids = request.getParameterValues("rid");
        adminuserService.distributeUpdate(adminUser.getUid(), rids);
        return "forward:AdminuserList.action";

    }

    /*
    搜索框
     */
    @RequestMapping("/search")
    public String search(AdminUser adminUser, Model model) {
        List list = adminuserService.search(adminUser);
        model.addAttribute("list",list);
        model.addAttribute("searchObject",adminUser);
        return "admin/list";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        //session移除
        session.removeAttribute("sessionUser");//针对某一个session值
//        session.invalidate();//全部session值
        return "index/index";

    }


}
