package com.qhit.category.service;

import java.util.List;
import com.qhit.category.pojo.Category;
/**
* Created by GeneratorCode on 2019/04/11
*/

public interface ICategoryService {

    boolean insert(Category category);

    boolean  update(Category category);

    boolean  updateSelective(Category category);

    boolean delete(Integer id);

    List findAll();

    Category findById(Integer id);

    List<Category> search(Category category);
    List<Category> findAllCategory();

}