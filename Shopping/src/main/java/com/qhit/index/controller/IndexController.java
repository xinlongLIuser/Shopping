package com.qhit.index.controller;

import com.qhit.category.pojo.Category;
import com.qhit.category.service.ICategoryService;
import com.qhit.categorysecond.pojo.Categorysecond;
import com.qhit.product.pojo.Product;
import com.qhit.product.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/index")
public class IndexController {
    @Autowired
    ICategoryService categoryService;
    @Autowired
    IProductService productService;
    @RequestMapping("/IndexAction")
    public String IndexInfo(Model model) {
        List<Category> categoryList = categoryService.findAll();
        model.addAttribute("categoryList", categoryList);
        //热卖商品
        List<Product> hotProductList = productService.findHotPorduct();
        model.addAttribute("hotProductList", hotProductList);

        //热卖商品
        List<Product> newProductList = productService.findNewPorduct();
        model.addAttribute("newProductList", newProductList);
        return "front/index";

    }
}
