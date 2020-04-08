package com.qhit.category.controller; 

import com.qhit.category.pojo.Category; 
import com.qhit.category.service.ICategoryService; 
import com.qhit.category.service.impl.CategoryServiceImpl; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping; 
import javax.annotation.Resource; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import com.alibaba.fastjson.JSON; 
import java.io.IOException; 
import java.util.List; 

/** 
* Created by GeneratorCode on 2019/04/11
*/ 

@Controller 
@RequestMapping("/category") 
public class CategoryController { 

    @Resource 
    ICategoryService categoryService; 

    @RequestMapping("/insert") 
    public String insert(Category category) { 
        categoryService.insert(category); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/delete") 
    public String delete(Integer cid, HttpServletResponse response) throws IOException { 
        categoryService.delete(cid); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/update") 
    public String update(Category category) { 
        categoryService.update(category); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/updateSelective") 
    public String updateSelective(Category category) { 
        categoryService.updateSelective(category); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/load") 
    public String load(Integer cid, Model model) { 
        Category category = categoryService.findById(cid); 
        model.addAttribute("category",category); 
        return "category/edit"; 
    } 
 
    @RequestMapping("/list") 
    public String list(Model model) throws IOException { 
        List<Category> list = categoryService.findAll(); 
        model.addAttribute("list",list); 
        return "category/list"; 
    } 
 
    @RequestMapping("/ajaxList") 
    public void ajaxList(HttpServletResponse response) throws IOException { 
        List<Category> list = categoryService.findAll(); 
        String s = JSON.toJSONString(list); 
        response.getWriter().write(s); 
    } 
 
    @RequestMapping("/search") 
    public String search(Category category,Model model) { 
        List<Category> list = categoryService.search(category); 
        model.addAttribute("list",list); 
        model.addAttribute("searchObject",category); 
        return "category/list"; 
    } 
 
} 
