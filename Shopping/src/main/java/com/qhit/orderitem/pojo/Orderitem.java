package com.qhit.orderitem.pojo;


import com.qhit.orders.pojo.Orders;
import com.qhit.product.pojo.Product;
import org.springframework.core.annotation.Order;
import org.springframework.security.core.userdetails.User;

/**
* Created by GeneratorCode on 2019/04/14
*/

public class Orderitem {

    private Integer itemid;    //
    private Integer count;    //
    private Double subtotal;    //
    private Integer pid;    //
    private Integer oid;    //
    private Product product;
    private Orders orders;
    private User user;


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Integer getItemid() {
        return itemid;
    }
 
    public void setItemid(Integer itemid) { 
        this.itemid = itemid;
    }
 
    public Integer getCount() { 
        return count;
    }
 
    public void setCount(Integer count) { 
        this.count = count;
    }
 
    public Double getSubtotal() { 
        return subtotal;
    }
 
    public void setSubtotal(Double subtotal) { 
        this.subtotal = subtotal;
    }
 
    public Integer getPid() { 
        return pid;
    }
 
    public void setPid(Integer pid) { 
        this.pid = pid;
    }
 
    public Integer getOid() { 
        return oid;
    }
 
    public void setOid(Integer oid) { 
        this.oid = oid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String toString() {
        return "OrderItem [itemid=" + itemid + ", count=" + count + ", subtotal=" + subtotal + ", product=" + product
                + ", order=" + orders +", user=" + user + "]";
    }
 

 }