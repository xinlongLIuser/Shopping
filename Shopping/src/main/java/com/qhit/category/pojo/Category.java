package com.qhit.category.pojo;


import com.qhit.categorysecond.pojo.Categorysecond;

import java.util.List;

/**
* Created by GeneratorCode on 2019/04/11
*/

public class Category {

    private Integer cid;    //主键
    private String cname;    //一级分类名称
    private List<Categorysecond> categorySecond;

    public List<Categorysecond> getCategorySecond() {
        return categorySecond;
    }

    public void setCategorySeconds(List<Categorysecond> categorySecond) {
        this.categorySecond = categorySecond;
    }

    public Integer getCid() {
        return cid;
    }
 
    public void setCid(Integer cid) { 
        this.cid = cid;
    }
 
    public String getCname() { 
        return cname;
    }
 
    public void setCname(String cname) { 
        this.cname = cname;
    }
 

 }