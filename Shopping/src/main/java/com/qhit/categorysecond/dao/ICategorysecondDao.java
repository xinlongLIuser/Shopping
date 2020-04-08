package com.qhit.categorysecond.dao;

import org.springframework.stereotype.Repository;
import com.qhit.categorysecond.pojo.Categorysecond;
import java.util.List;

/**
* Created by GeneratorCode on 2019/04/11
*/

@Repository  
public interface ICategorysecondDao {

    boolean insert(Categorysecond categorysecond);

    boolean  update(Categorysecond categorysecond);

    boolean  updateSelective(Categorysecond categorysecond);

    boolean delete(Categorysecond categorysecond);


    List findAll();

    List findById(Integer id);

    List<Categorysecond> search(Categorysecond categorysecond);

    List findByCsname(String csname);

    List findByCid(Integer cid);

}