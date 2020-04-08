package com.qhit.orders.pojo;


import com.qhit.orderitem.pojo.Orderitem;
import com.qhit.product.pojo.Product;
import com.qhit.user.pojo.User;

import java.util.Date;
import java.util.List;

/**
* Created by GeneratorCode on 2019/04/14
*/

public class Orders {

    private Integer oid;    //
    private Double total;    //
    private String ordertime;    //
    private Integer state;    //
    private String name;    //
    private String phone;    //
    private String addr;    //
    private Integer uid;    //
    private User user;
    private Product product;
    private  Orderitem orderitem;
    private List<Orderitem> orderItems;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Orderitem getOrderitem() {
        return orderitem;
    }

    public void setOrderitem(Orderitem orderitem) {
        this.orderitem = orderitem;
    }



    public List<Orderitem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<Orderitem> orderItems) {
        this.orderItems = orderItems;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getOid() {
        return oid;
    }
 
    public void setOid(Integer oid) { 
        this.oid = oid;
    }
 
    public Double getTotal() { 
        return total;
    }
 
    public void setTotal(Double total) { 
        this.total = total;
    }
 
    public String getOrdertime() { 
        return ordertime;
    }
 
    public void setOrdertime(String ordertime) { 
        this.ordertime = ordertime;
    }
 
    public Integer getState() { 
        return state;
    }
 
    public void setState(Integer state) { 
        this.state = state;
    }
 
    public String getName() { 
        return name;
    }
 
    public void setName(String name) { 
        this.name = name;
    }
 
    public String getPhone() { 
        return phone;
    }
 
    public void setPhone(String phone) { 
        this.phone = phone;
    }
 
    public String getAddr() { 
        return addr;
    }
 
    public void setAddr(String addr) { 
        this.addr = addr;
    }
 
    public Integer getUid() { 
        return uid;
    }
 
    public void setUid(Integer uid) { 
        this.uid = uid;
    }

    public String toString() {
        return "Order [oid=" + oid + ", total=" + total + ", ordertime=" + ordertime + ", state=" + state + ", addr="
                + addr + ", phone=" + phone + ", user=" + user + ", orderItems=" + orderItems + "]";
    }
}