package com.qhit.orders.controller;

import com.alibaba.fastjson.JSONObject;
import com.qhit.orderitem.pojo.Orderitem;
import com.qhit.orderitem.service.IOrderitemService;
import com.qhit.orderitem.service.impl.OrderitemServiceImpl;
import com.qhit.orders.pojo.Orders;
import com.qhit.orders.service.IOrdersService;
import com.qhit.shopcart.pojo.Cart;
import com.qhit.shopcart.pojo.CartItem;
import com.qhit.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by GeneratorCode on 2019/04/14
 */

@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    IOrdersService ordersService;
    @Autowired
    IOrderitemService orderitemService;

    @RequestMapping("/insert")
    public String insert(Orders orders) {
        ordersService.insert(orders);
        return "forward:list.action";
    }

    @RequestMapping("/delete")
    public String delete(Integer oid, HttpServletResponse response) throws IOException {
        ordersService.delete(oid);
        return "forward:list.action";
    }

    @RequestMapping("/update")
    public String update(Orders orders) {
        ordersService.update(orders);
        return "forward:list.action";
    }

    @RequestMapping("/updateSelective")
    public String updateSelective(Orders orders) {
        ordersService.updateSelective(orders);
        return "forward:list.action";
    }

    @RequestMapping("/load")
    public String load(Integer oid, Model model) {
        Orders orders = ordersService.findById(oid);
        model.addAttribute("orders", orders);
        return "orders/edit";
    }

    @RequestMapping("/list")
    public String list(Model model) throws IOException {
        List<Orders> list = ordersService.findAll();
        for (Orders order : list) {
            List<Orderitem> orderitemslist = orderitemService.findOrderItemByOid(order.getOid());
            order.setOrderItems(orderitemslist);
        }
        model.addAttribute("list", list);
        return "orders/list";
    }

    @RequestMapping("/ajaxList")
    public void ajaxList(HttpServletResponse response) throws IOException {
        List<Orders> list = ordersService.findAll();
        String s = JSON.toJSONString(list);
        response.getWriter().write(s);
    }

    @RequestMapping("/search")
    public String search(Orders orders, Model model) {
        List<Orders> list = ordersService.search(orders);
        model.addAttribute("list", list);
        model.addAttribute("searchObject", orders);
        return "orders/list";
    }

    /**
     * 保存订单
     *
     * @param model
     * @param session
     * @return
     */

    @RequestMapping("/saveOrder")
    public String saveOrder(Model model, HttpSession session) {
        Orderitem orderItem = new Orderitem();
        Orders order = new Orders();
        /********************封装订单数据*************/
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        order.setOrdertime(simpleDateFormat.format(new Date()));
        System.out.println(simpleDateFormat.format(new Date()));
        order.setState(1);//1 未付款   2 已经付款.  3.已经发货   4 已经收货.
        // 有些数据需要从购物车中获取
        //获得购物车
        Cart cart = (Cart) session.getAttribute("cartList");
        if (cart == null) {
            model.addAttribute("message", "您还没有购物!请先去购物!");
            return "front/msg";
        }
        //订单总价
        order.setTotal(cart.getTotal());
        //订单所属用户
        User user = (User) session.getAttribute("SessionUser");
        if (user == null) {
            model.addAttribute("message", "您还没有登录!请先去登录!");
            return "front/msg";
        }
        order.setUser(user);
        // 保存订单:
        Integer oid = ordersService.insert(order);
        Integer oids = order.getOid();
        /********************封装订单项数据*************/
        for (CartItem cartItem : cart.getCartItems()) {
            orderItem.setCount(cartItem.getCount());
            orderItem.setSubtotal(cartItem.getSubtotal());
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setOrders(order);
            //保存订单条目
            Integer itemId = orderitemService.insert(orderItem);
        }
        //根据订单id查询出所有订单项
        List<Orderitem> orderItems = orderitemService.findOrderItemByOid(oids);
        order.setOrderItems(orderItems);
        System.out.println(order);
        // 清空购物车.
        cart.clearCart();
        model.addAttribute("order", order);
        return "front/order";
    }
    /**
     * 订单付款
     * @param orderId
     * @param name
     * @param orderPhone
     * @param orderAddr
     * @param model
     * @return
     */
    @RequestMapping("orderPayOrder")
    public String orderPayOrder(Integer orderId, @RequestParam("name")String name, @RequestParam("orderPhone") String orderPhone, @RequestParam("orderAddr") String orderAddr, Model model){
        //修改订单
        //根据订单id查询订单
        Orders currOrder=ordersService.findOrderByoid(orderId);
        currOrder.setAddr(orderAddr);
        currOrder.setName(name);
        currOrder.setPhone(orderPhone);
        currOrder.setState(2);
        ordersService.updateSelective(currOrder);
        // 付款:
        // 定义付款的参数:
        /**********此处不做付款功能,实际项目中可根据公司的支付技术选型接入相应支付接口即可***********/
        //付款成功后重定向到回调方法
        //假设已付款
        model.addAttribute("message", "订单付款成功!订单号:"+orderId+"支付金额:"+currOrder.getTotal());
        //返回消息页面
        return "front/msg";
    }

    /**x
     * 我的订单
     */
    @RequestMapping("/myOrder")
    public String myOrder(HttpSession session,Model model){
        User user=(User) session.getAttribute("SessionUser");
        if(user==null){
            model.addAttribute("message","您还没有登录，请先去登录");
            return "front/msg";
        }
        Integer userId=user.getUid();
        List<Orders> orderList=ordersService.findOrderByUserId(userId);
        System.out.println(orderList);
        model.addAttribute("orderList", orderList);
        return "front/orderlist";
    }


} 
