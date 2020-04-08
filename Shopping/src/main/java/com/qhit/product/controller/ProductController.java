package com.qhit.product.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qhit.category.pojo.Category;
import com.qhit.category.service.ICategoryService;
import com.qhit.categorysecond.pojo.Categorysecond;
import com.qhit.categorysecond.service.ICategorysecondService;
import com.qhit.product.pojo.Product;
import com.qhit.product.service.IProductService;
import com.qhit.product.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Created by GeneratorCode on 2019/04/11
 */

@Controller
@RequestMapping("/product")
public class ProductController {

    @Resource
    IProductService productService;
    @Autowired
    ICategoryService categoryService;
    @Autowired
    ICategorysecondService categorysecondService;
    Product product;
    @RequestMapping("/insert")
    public String insert(Product product, HttpServletResponse response) throws Exception {
        boolean flag = productService.insert(product);
       return "forward:list.action";
//        response.getWriter().write(flag == true ? "Y" : "N");
    }

    @RequestMapping("/delete")
    public String delete(Integer pid, HttpServletResponse response) throws IOException {
        productService.delete(pid);
        return "forward:list.action";
    }

    @RequestMapping("/update")
    public String update(Product product) {
        productService.update(product);
        return "forward:list.action";
    }

    @RequestMapping("/updateSelective")
    public String updateSelective(Product product) {
        productService.updateSelective(product);
        return "forward:list.action";
    }

    @RequestMapping("/load")
    public String load(Integer pid, Model model) {
        Product product = productService.findById(pid);
        model.addAttribute("product", product);
        return "product/edit";
    }

    @RequestMapping("/list")
    public String list(Model model, @RequestParam(required = true, defaultValue = "1") Integer pn) throws IOException {
        PageHelper.startPage(pn, 10);
        List<Product> list = productService.selectAll();
        model.addAttribute("list", list);
        PageInfo pageInfo = new PageInfo(list);
        model.addAttribute("list", list);
        model.addAttribute("page", pageInfo);
        return "product/list";
    }

    @RequestMapping("/ajaxList")
    public void ajaxList(HttpServletResponse response) throws IOException {
        List<Product> list = productService.findAll();
        String s = JSON.toJSONString(list);
        response.getWriter().write(s);
    }

    @RequestMapping("/search")
    public String search(Product product, Model model) {
        List<Product> list = productService.search(product);
        model.addAttribute("list", list);
        model.addAttribute("searchObject", product);
        return "product/list";
    }

    @RequestMapping("productfindByCid")
    public String ProductFrontList(Model model, @RequestParam("cid") Integer cid) {
        //查询一级分类
        List<Category> categoryList = categoryService.findAllCategory();
        model.addAttribute("categoryList", categoryList);
        //查询二级分类的商品
        List productList = productService.ProductListbycid(cid);
        model.addAttribute("productList", productList);
        model.addAttribute("csid", cid);
        return "front/productlist";
    }
    @RequestMapping("/productfindByCsid")
    public String productfindByCsid(Model model,Integer csid){
        //查询一级分类
        List<Category> categoryList = categoryService.findAllCategory();
        model.addAttribute("categoryList", categoryList);
        //查询二级分类的商品
        List productList = productService.ProductListbycsid(csid);
        model.addAttribute("productList", productList);
        model.addAttribute("csid", csid);
        return "front/productlist";
    }

    @RequestMapping("/ProductInfo")
    public  String productinfo(Model model, @RequestParam("pid") Integer pid){
        List<Category> categoryList = categoryService.findAllCategory();
        model.addAttribute("categoryList", categoryList);
        Product product=  productService.findById(pid);
        model.addAttribute("product",product);
        return "front/productinfo";
    }


} 
