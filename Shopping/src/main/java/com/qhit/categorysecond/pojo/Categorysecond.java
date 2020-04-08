package com.qhit.categorysecond.pojo;


import com.qhit.category.pojo.Category;

/**
* Created by GeneratorCode on 2019/04/11
*/

public class Categorysecond {

    private Integer csid;    //主键
    private String csname;    //二级分类名称
    private Integer cid;    //一级分类id
    private Category category;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Integer getCsid() {
        return csid;
    }
 
    public void setCsid(Integer csid) { 
        this.csid = csid;
    }
 
    public String getCsname() { 
        return csname;
    }
 
    public void setCsname(String csname) { 
        this.csname = csname;
    }
 
    public Integer getCid() { 
        return cid;
    }
 
    public void setCid(Integer cid) { 
        this.cid = cid;
    }
 

 }