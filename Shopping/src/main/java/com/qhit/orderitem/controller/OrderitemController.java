package com.qhit.orderitem.controller; 

import com.qhit.orderitem.pojo.Orderitem; 
import com.qhit.orderitem.service.IOrderitemService; 
import com.qhit.orderitem.service.impl.OrderitemServiceImpl; 
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
* Created by GeneratorCode on 2019/04/14
*/ 

@Controller 
@RequestMapping("/orderitem") 
public class OrderitemController { 

    @Resource 
    IOrderitemService orderitemService; 

    @RequestMapping("/insert") 
    public String insert(Orderitem orderitem) { 
        orderitemService.insert(orderitem); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/delete") 
    public String delete(Integer itemid, HttpServletResponse response) throws IOException { 
        orderitemService.delete(itemid); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/update") 
    public String update(Orderitem orderitem) { 
        orderitemService.update(orderitem); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/updateSelective") 
    public String updateSelective(Orderitem orderitem) { 
        orderitemService.updateSelective(orderitem); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/load") 
    public String load(Integer itemid, Model model) { 
        Orderitem orderitem = orderitemService.findById(itemid); 
        model.addAttribute("orderitem",orderitem); 
        return "orderitem/edit"; 
    } 
 
    @RequestMapping("/list") 
    public String list(Model model) throws IOException { 
        List<Orderitem> list = orderitemService.findAll(); 
        model.addAttribute("list",list); 
        return "orderitem/list"; 
    } 
 
    @RequestMapping("/ajaxList") 
    public void ajaxList(HttpServletResponse response) throws IOException { 
        List<Orderitem> list = orderitemService.findAll(); 
        String s = JSON.toJSONString(list); 
        response.getWriter().write(s); 
    } 
 
    @RequestMapping("/search") 
    public String search(Orderitem orderitem,Model model) { 
        List<Orderitem> list = orderitemService.search(orderitem); 
        model.addAttribute("list",list); 
        model.addAttribute("searchObject",orderitem); 
        return "orderitem/list"; 
    } 
 
} 
