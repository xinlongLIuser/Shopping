package com.qhit.shopcart.controller;

import com.qhit.category.pojo.Category;
import com.qhit.category.service.ICategoryService;
import com.qhit.product.pojo.Product;
import com.qhit.product.service.IProductService;
import com.qhit.shopcart.pojo.Cart;
import com.qhit.shopcart.pojo.CartItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class ShopCartcontroller {
    @Autowired
    IProductService productService;
    @Autowired
    ICategoryService categoryService;

    /**
     * 从session范围获得购物车代码。
     * @param session
     * @return
     */
    public Cart getCart(HttpSession session){
        //从session范围内获得Cart对象
        Cart cart = (Cart) session.getAttribute("cartList");
        //判断
        if(cart==null){
            //创建购物车对象
            cart=new Cart();
            //将购物车对象放入session。
            session.setAttribute("cartList", cart);
        }
        return cart;
    }
    @RequestMapping("/ShopcartAdd")
    public String ShopcartAdd(Model model, @RequestParam("pid") Integer pid, @RequestParam("count") Integer count, HttpSession session) {
        List<Category> categoryList = categoryService.findAllCategory();
        model.addAttribute("categoryList", categoryList);
        if(pid!=null&&count!=null){
//            logger.info("pid:"+pid);
//            logger.info("count:"+count);
            //根据pid查询商品信息

            Product product=productService.findById(pid);
            // 创建一个购物项对象:
            CartItem cartItem = new CartItem();
            cartItem.setCount(count);
            cartItem.setSubtotal((double)count * product.getShopprice());
            cartItem.setProduct(product);
            //获取购物车
            Cart cart=getCart(session);
            cart.addCart(cartItem);

            return "front/shopcart";
        }else{
            return "front/shopcart";
        }
    }

    @RequestMapping("/clearCart")
    public String clearCart(HttpSession session){
        //获取购物车
        Cart cart=getCart(session);
        cart.clearCart();
        return "front/shopcart";
    }
    /**
     * 移除购物车
     * @param session
     * @param pid
     * @return
     */
    @RequestMapping("/removeCart")
    public String removeCart(HttpSession session,Integer pid){
        //获取购物车
        Cart cart=getCart(session);
        if(pid!=null){
            cart.removeCart(pid);
        }
        return "front/shopcart";

    }




}
