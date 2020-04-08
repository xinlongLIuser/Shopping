package com.qhit.basedept.controller;

import com.alibaba.fastjson.JSONObject;
import com.qhit.basedept.pojo.Basedept;
import com.qhit.basedept.service.IBaseDeptService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;

/**
 * Created by GeneratorCode on 2019/04/10
 */

@Controller
@RequestMapping("/baseDept")
public class BaseDeptController {

    @Resource
    IBaseDeptService baseDeptService;

    @RequestMapping("/insert")
    public String insert(Basedept baseDept) {
        baseDeptService.insert(baseDept);
        return "forward:list.action";
    }

    @RequestMapping("/delete")
    public String delete(Integer deptId, HttpServletResponse response) throws IOException {
        baseDeptService.delete(deptId);
        return "forward:list.action";
    }

    @RequestMapping("/update")
    public String update(Basedept baseDept) {
        baseDeptService.update(baseDept);
        return "forward:list.action";
    }

    @RequestMapping("/updateSelective")
    public String updateSelective(Basedept baseDept) {
        baseDeptService.updateSelective(baseDept);
        return "forward:list.action";
    }

    @RequestMapping("/load")
    public String load(Integer deptId, Model model) {
        Basedept baseDept = baseDeptService.findById(deptId);
        model.addAttribute("baseDept", baseDept);
        return "baseDept/edit";
    }

    @RequestMapping("/list")
    public String list(Model model) throws IOException {
        List<Basedept> list = baseDeptService.findAll();
        model.addAttribute("list", list);
        return "baseDept/list";
    }

    @RequestMapping("/ajaxList")
    public void ajaxList(HttpServletResponse response) throws IOException {
        List<Basedept> list = baseDeptService.findAll();
        String s = JSON.toJSONString(list);
        response.getWriter().write(s);

    }

    @RequestMapping("/search")
    public String search(Basedept baseDept, Model model) {
        List<Basedept> list = baseDeptService.search(baseDept);
        model.addAttribute("list", list);
        model.addAttribute("searchObject", baseDept);
        return "baseDept/list";
    }

} 
