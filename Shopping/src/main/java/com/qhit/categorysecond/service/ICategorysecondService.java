package com.qhit.categorysecond.service;

import java.util.List;
import com.qhit.categorysecond.pojo.Categorysecond;
/**
* Created by GeneratorCode on 2019/04/11
*/

public interface ICategorysecondService {

    boolean insert(Categorysecond categorysecond);

    boolean  update(Categorysecond categorysecond);

    boolean  updateSelective(Categorysecond categorysecond);

    boolean delete(Integer id);

    List findAll();

    Categorysecond findById(Integer id);

    List<Categorysecond> search(Categorysecond categorysecond);

}