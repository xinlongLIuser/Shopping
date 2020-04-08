package com.qhit.basedept.service;

import java.util.List;
import com.qhit.basedept.pojo.Basedept;

/**
* Created by GeneratorCode on 2019/04/10
*/

public interface IBaseDeptService {

    int insert(Basedept baseDept);

    int  update(Basedept baseDept);

    int  updateSelective(Basedept baseDept);

    int delete(Integer id);

    List findAll();

    Basedept findById(Integer id);

    List<Basedept> search(Basedept baseDept);

}