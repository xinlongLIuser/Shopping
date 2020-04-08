package com.qhit.product.service;

import java.util.List;
import com.qhit.product.pojo.Product;
import org.apache.ibatis.annotations.Param;

/**
* Created by GeneratorCode on 2019/04/11
*/

public interface IProductService {

    boolean insert(Product product);

    boolean  update(Product product);

    boolean  updateSelective(Product product);

    boolean delete(Integer id);

    List findAll();
    //    多表查询出商品列表
    List selectAll();

    Product findById(Integer id);

    List<Product> search(Product product);
//热卖商品
    List<Product> findHotPorduct();
    //新商品
    List<Product> findNewPorduct();

    List<Product>  ProductListbycid( Integer cid );

    List<Product>  ProductListbycsid( Integer csid );
}