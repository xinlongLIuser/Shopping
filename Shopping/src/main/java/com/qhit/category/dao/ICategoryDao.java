package com.qhit.category.dao;

import org.springframework.stereotype.Repository;
import com.qhit.category.pojo.Category;
import java.util.List;

/**
* Created by GeneratorCode on 2019/04/11
*/

@Repository  
public interface ICategoryDao {

    boolean insert(Category category);

    boolean  update(Category category);

    boolean  updateSelective(Category category);

    boolean delete(Category category);


    List findAll();

    List findById(Integer id);


    List<Category> search(Category category);

    List findByCname(String cname);

    List<Category> findAllCategory();

}