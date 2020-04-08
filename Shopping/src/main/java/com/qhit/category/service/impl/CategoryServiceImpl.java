package com.qhit.category.service.impl;

import com.qhit.category.service.ICategoryService;
import java.util.List;
import com.qhit.category.dao.ICategoryDao;
import com.qhit.category.pojo.Category;
import org.springframework.stereotype.Service;
import javax.annotation.Resource; 

/**
* Created by GeneratorCode on 2019/04/11
*/

@Service 
public class CategoryServiceImpl  implements ICategoryService {

    @Resource 
    ICategoryDao dao;

    @Override 
    public boolean insert(Category category) {
        return dao.insert(category);
    } 


    @Override 
    public boolean update(Category category) {
        return dao.update(category);
    } 


    @Override 
    public boolean updateSelective(Category category) {
        return dao.updateSelective(category);
    } 


    @Override 
    public boolean delete(Integer id) {
        Category category = findById(id); 
        return dao.delete(category); 
    } 


    @Override 
    public List findAll() { 
        return dao.findAll(); 
    } 


    @Override 
    public Category findById(Integer id) {
        List<Category> list = dao.findById(id); 
        return  list.get(0); 
    } 


    @Override 
    public List<Category> search(Category category) { 
        return dao.search(category); 
    }

    public List<Category> findAllCategory(){
        return  dao.findAllCategory();
    }


}