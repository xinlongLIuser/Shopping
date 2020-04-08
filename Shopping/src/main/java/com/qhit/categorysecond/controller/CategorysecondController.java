package com.qhit.categorysecond.controller; 

import com.qhit.categorysecond.pojo.Categorysecond; 
import com.qhit.categorysecond.service.ICategorysecondService; 
import com.qhit.categorysecond.service.impl.CategorysecondServiceImpl; 
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
* Created by GeneratorCode on 2019/04/11
*/ 

@Controller 
@RequestMapping("/categorysecond") 
public class CategorysecondController { 

    @Resource 
    ICategorysecondService categorysecondService; 

    @RequestMapping("/insert") 
    public String insert(Categorysecond categorysecond) { 
        categorysecondService.insert(categorysecond); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/delete") 
    public String delete(Integer csid, HttpServletResponse response) throws IOException { 
        categorysecondService.delete(csid); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/update") 
    public String update(Categorysecond categorysecond) { 
        categorysecondService.update(categorysecond); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/updateSelective") 
    public String updateSelective(Categorysecond categorysecond) { 
        categorysecondService.updateSelective(categorysecond); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/load") 
    public String load(Integer csid, Model model) { 
        Categorysecond categorysecond = categorysecondService.findById(csid); 
        model.addAttribute("categorysecond",categorysecond); 
        return "categorysecond/edit"; 
    } 
 
    @RequestMapping("/list") 
    public String list(Model model) throws IOException { 
        List<Categorysecond> list = categorysecondService.findAll(); 
        model.addAttribute("list",list); 
        return "categorysecond/list"; 
    } 
 
    @RequestMapping("/ajaxList")

    public void ajaxList(HttpServletResponse response) throws IOException {
        List<Categorysecond> list = categorysecondService.findAll();
        String s = JSON.toJSONString(list);
       response.getWriter().write(s);
    } 
 
    @RequestMapping("/search") 
    public String search(Categorysecond categorysecond,Model model) { 
        List<Categorysecond> list = categorysecondService.search(categorysecond); 
        model.addAttribute("list",list); 
        model.addAttribute("searchObject",categorysecond); 
        return "categorysecond/list"; 
    } 
 
} 
