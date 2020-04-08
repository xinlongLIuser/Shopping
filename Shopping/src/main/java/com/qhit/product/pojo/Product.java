package com.qhit.product.pojo;


import com.qhit.categorysecond.pojo.Categorysecond;

/**
* Created by GeneratorCode on 2019/04/11
*/

public class Product {

    private Integer pid;    //主键
    private String pname;    //商品名称
    private Double marketprice;    //市场价格
    private Double shopprice;    //商品价格
    private String image;    //图片
    private String pdesc;    //商品说明
    private Integer ishot;    //是否热卖
    private String pdate;    //日期
    private Integer csid;    //二级分类名称

    private Categorysecond categorysecond;


    public Categorysecond getCategorysecond() {
        return categorysecond;
    }

    public void setCategorysecond(Categorysecond categorysecond) {
        this.categorysecond = categorysecond;
    }

    public Integer getPid() {
        return pid;
    }
 
    public void setPid(Integer pid) { 
        this.pid = pid;
    }
 
    public String getPname() { 
        return pname;
    }
 
    public void setPname(String pname) { 
        this.pname = pname;
    }
 
    public Double getMarketprice() { 
        return marketprice;
    }
 
    public void setMarketprice(Double marketprice) { 
        this.marketprice = marketprice;
    }
 
    public Double getShopprice() { 
        return shopprice;
    }
 
    public void setShopprice(Double shopprice) { 
        this.shopprice = shopprice;
    }
 
    public String getImage() { 
        return image;
    }
 
    public void setImage(String image) { 
        this.image = image;
    }
 
    public String getPdesc() { 
        return pdesc;
    }
 
    public void setPdesc(String pdesc) { 
        this.pdesc = pdesc;
    }
 
    public Integer getIshot() { 
        return ishot;
    }
 
    public void setIshot(Integer ishot) { 
        this.ishot = ishot;
    }
 
    public String getPdate() { 
        return pdate;
    }
 
    public void setPdate(String pdate) { 
        this.pdate = pdate;
    }
 
    public Integer getCsid() { 
        return csid;
    }
 
    public void setCsid(Integer csid) { 
        this.csid = csid;
    }

    public String toString() {
        return "Product [pid=" + pid + ", pname=" + pname + ", marketPrice=" + marketprice + ", shopPrice=" + shopprice
                + ", image=" + image + ", pdesc=" + pdesc + ", isHot=" + ishot + ", pdate=" + pdate
                + ", categorysecond=" + categorysecond + "]";
    }

 }