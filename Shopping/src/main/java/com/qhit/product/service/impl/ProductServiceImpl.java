package com.qhit.product.service.impl;

import com.qhit.product.service.IProductService;
import java.util.List;
import com.qhit.product.dao.IProductDao;
import com.qhit.product.pojo.Product;
import org.springframework.stereotype.Service;
import javax.annotation.Resource; 

/**
* Created by GeneratorCode on 2019/04/11
*/

@Service("productService")
public class ProductServiceImpl  implements IProductService {

    @Resource 
    IProductDao dao;

    @Override 
    public boolean insert(Product product) {
        return dao.insert(product);
    }


    @Override 
    public boolean update(Product product) {
        return dao.update(product);
    } 


    @Override 
    public boolean updateSelective(Product product) {
        return dao.updateSelective(product);
    } 


    @Override 
    public boolean delete(Integer id) {
        Product product = findById(id); 
        return dao.delete(product); 
    } 


    @Override 
    public List findAll() { 
        return dao.findAll(); 
    }
    //    多表查询出商品列表
   public   List selectAll(){
        return dao.selectAll();
   }


    @Override 
    public Product findById(Integer id) {
        List<Product> list = dao.findById(id); 
        return  list.get(0); 
    } 


    @Override 
    public List<Product> search(Product product) { 
        return dao.search(product); 
    }

    @Override
    public List<Product> findHotPorduct() {
        return dao.findHotPorduct();
    }

    @Override
    public List<Product> findNewPorduct() {
        return dao.findNewPorduct();
    }
    //显示一级分类商品信息
  public    List<Product>  ProductListbycid( Integer cid){

        return dao.ProductListbycid(cid);
  }


  //显示二级分类商品信息
  public   List<Product>  ProductListbycsid( Integer csid ){
        return  dao.ProductListbycsid(csid);
  }
}