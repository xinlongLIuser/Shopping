package com.qhit.product.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.qhit.product.pojo.Product;
import java.util.List;

/**
* Created by GeneratorCode on 2019/04/11
*/

@Repository  
public interface IProductDao {

    boolean insert(Product product);

    boolean  update(Product product);

    boolean  updateSelective(Product product);

    boolean delete(Product product);


    List findAll();
//    多表查询出商品列表
    List selectAll();

    List findById(Integer id);


    List<Product> search(Product product);

    List findByPname(String pname);

    List findByMarketprice(double marketprice);

    List findByShopprice(double shopprice);

    List findByImage(String image);

    List findByPdesc(String pdesc);

    List findByIshot(Integer ishot);

    List findByPdate(String pdate);

    List findByCsid(Integer csid);

    List findByMarketPrice(double marketPrice);

    List findByShopPrice(double shopPrice);

    List findByIsHot(Integer isHot);

    List<Product> findHotPorduct();
    //新商品
    List<Product> findNewPorduct();
    List<Product>  ProductListbycid(@Param("cid") Integer cid);
    List<Product>  ProductListbycsid(@Param("csid") Integer csid);

}