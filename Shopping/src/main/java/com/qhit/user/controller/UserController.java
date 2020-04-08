package com.qhit.user.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qhit.baseRole.pojo.BaseRole;
import com.qhit.user.pojo.User;
import com.qhit.user.service.UserService;
import com.qhit.user.service.impl.UserServiceImpl;
import com.qhit.utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
@RequestMapping("/user")
public class UserController  {
    @Resource
    UserService userService;


    @RequestMapping("/UserList")
    public String userlist(Model model, @RequestParam(required = true, defaultValue = "1") Integer pn, User user) {
        PageHelper.startPage(pn, 10);
        List<User> list = userService.selectByList();
        PageInfo pageInfo = new PageInfo(list);
        model.addAttribute("list", list);
        model.addAttribute("page", pageInfo);
        model.addAttribute("searchObject", user);
        return "user/list";

    }
    /*
    删除
     */
    @RequestMapping("/delete")
    public void delete(@RequestParam("uid") Integer uid, HttpServletResponse response) throws Exception {
        boolean flag = userService.deleteByPrimaryKey(uid);
        response.getWriter().write(flag ? "Y" : "N");
    }

    @RequestMapping("/UserInsert")
    @ResponseBody
    public String insert(User user, HttpServletResponse response) throws Exception {
        MD5 md5 = new MD5();
        user.setPassword(md5.getMD5ofStr(user.getPassword()));
        boolean flag = userService.insert(user);
        return flag ? "Y" : "N";


    }

    @RequestMapping("/login")
    @ResponseBody
    public void login(User user, HttpServletRequest request,HttpServletResponse response) throws Exception {
        user = userService.login(user);
        String result = "";
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("SessionUser", user);
            result = "Y";
        } else {
            result = "N";
        }
   response.getWriter().write(result);
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("SessionUser");
        return "front/index";

    }

}
